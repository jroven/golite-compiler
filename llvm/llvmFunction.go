package llvm

import (
	"bytes"
	"proj-optimization-overlords/cfg"
	"proj-optimization-overlords/codegen"
	st "proj-optimization-overlords/symboltable"
	"proj-optimization-overlords/types"
	"sort"
)

// define <ret_ty> @FUNC_NAME( <ty1> %PARAM_NAME1,
//
//	<ty2> @PARAM_NAME2,
//	<ty2> @PARAM_NAME3,
//	... ,
//	<tyN> @PARAM_NAMEN)
//
//	{
//	       ; BASIC BLOCKS
//	}
type LLVMFuncDef struct {
	RetTy      []types.Type
	Name       string
	ParamTys   []types.Type
	ParamNames []string
	FmtStrs    map[string]string
	Blocks     map[string]*cfg.Block
	Entry      *cfg.Block
}

func (f *LLVMFuncDef) AddBlock(name string, block *cfg.Block) {
	f.Blocks[name] = block
}

func (f *LLVMFuncDef) RemoveBlock(name string) {
	b := f.Blocks[name]
	for _, pred := range b.Preds {
		for i, succ := range pred.Succs {
			if succ == b {
				pred.Succs = append(pred.Succs[:i], pred.Succs[i+1:]...)
			}
		}
	}
	for _, succ := range b.Succs {
		for i, pred := range succ.Preds {
			if pred == b {
				succ.Preds = append(succ.Preds[:i], succ.Preds[i+1:]...)
			}
		}
	}
	delete(f.Blocks, name)
}

func NewLLVMFuncDef(retTy []types.Type, name string, paramTys []types.Type,
	paramNames []string, fmtStrs, blocks map[string]*cfg.Block, entry *cfg.Block) *LLVMFuncDef {
	return &LLVMFuncDef{retTy, name, paramTys, paramNames, make(map[string]string), blocks, entry}
}

func (f *LLVMFuncDef) AddFmtStr(name, fmtStr string) {
	f.FmtStrs[name] = fmtStr
}

func (f *LLVMFuncDef) String() string {
	var out bytes.Buffer
	out.WriteString("define ")
	if len(f.RetTy) == 0 {
		out.WriteString("i64")
	} else {
		out.WriteString(types.TypeToLLVMString(f.RetTy[0]))
	}
	out.WriteString(" @")
	out.WriteString(f.Name)
	out.WriteString("(")
	for i, paramTy := range f.ParamTys {
		out.WriteString(types.TypeToLLVMString(paramTy))
		out.WriteString(" %")
		out.WriteString(f.ParamNames[i])
		if i < len(f.ParamTys)-1 {
			out.WriteString(", ")
		}
	}
	out.WriteString(") {\n")

	for _, block := range f.Entry.InOrderBlocks() {
		out.WriteString(block.String())
	}
	out.WriteString("}\n")
	return out.String()
}

func (f *LLVMFuncDef) CalculateLiveRanges(currFunc *st.FuncEntry) (map[*st.VarEntry]int, map[*st.VarEntry]int) {
	var superBlock []cfg.Instruction
	for _, block := range f.Entry.InOrderBlocks() {
		if block.ToForExit != nil {
			block.ToForExit.AllBlocksInLoop = append(block.ToForExit.AllBlocksInLoop, block)
		}
	}
	for _, block := range f.Entry.InOrderBlocks() {
		superBlock = append(superBlock, block.Instrs...)
		for _, inLoopBlock := range block.AllBlocksInLoop {
			superBlock = append(superBlock, inLoopBlock.Instrs...)
		}
	}
	startpoint := make(map[*st.VarEntry]int)
	endpoint := make(map[*st.VarEntry]int)
	for i, instr := range superBlock {
		for _, v := range instr.Vars() {
			if _, ok := startpoint[v]; !ok {
				startpoint[v] = i
				endpoint[v] = i
			} else {
				endpoint[v] = i - 1
			}
		}
	}

	return startpoint, endpoint
}

func extractMin(freeRegs map[int]bool) int {
	for i := 8; i < 29; i++ {
		if freeRegs[i] {
			freeRegs[i] = false
			return i
		}
	}
	return -1
}

func (f *LLVMFuncDef) GenerateVarLocationsLinearScan(currFunc *st.FuncEntry) (map[*st.VarEntry]int, map[*st.VarEntry]*codegen.ARMAddress, int) {
	var registers = make(map[*st.VarEntry]int)
	var locations = make(map[*st.VarEntry]*codegen.ARMAddress)
	var freeRegs = make(map[int]bool)
	startReg := 8
	endReg := 25
	R := endReg - startReg - 2
	stackSize := 16
	for i := startReg; i <= endReg; i++ {
		if i < 16 || i > 18 {
			freeRegs[i] = true
		}
	}
	startpoint, endpoint := f.CalculateLiveRanges(currFunc)

	var active []*st.VarEntry

	sortByStart := make([]*st.VarEntry, 0, len(startpoint))
	for k := range startpoint {
		sortByStart = append(sortByStart, k)
	}
	sort.SliceStable(sortByStart, func(i, j int) bool {
		return startpoint[sortByStart[i]] < startpoint[sortByStart[j]]
	})

	for _, v := range sortByStart {
		active, freeRegs = ExpireOldIntervals(v, active, startpoint, endpoint, registers, freeRegs)
		if len(active) == R {
			stackSize = SpillAtInterval(v, active, endpoint, registers, locations, stackSize)
		} else {
			registers[v] = extractMin(freeRegs)
			active = append(active, v)
		}
	}
	return registers, locations, stackSize
}

func ExpireOldIntervals(v *st.VarEntry, active []*st.VarEntry, startpoint, endpoint map[*st.VarEntry]int, registers map[*st.VarEntry]int, freeRegs map[int]bool) ([]*st.VarEntry, map[int]bool) {
	sort.SliceStable(active, func(i, j int) bool {
		return endpoint[active[i]] < endpoint[active[j]]
	})
	var expired []*st.VarEntry
	for _, w := range active {
		if endpoint[w] >= startpoint[v] {
			break
		}
		expired = append(expired, w)
		freeRegs[registers[w]] = true
	}
	for _, w := range expired {
		active = remove(active, w)
	}
	return active, freeRegs
}

func remove(slice []*st.VarEntry, v *st.VarEntry) []*st.VarEntry {
	for i, s := range slice {
		if s == v {
			return append(slice[:i], slice[i+1:]...)
		}
	}
	return slice
}

func SpillAtInterval(v *st.VarEntry, active []*st.VarEntry, endpoint map[*st.VarEntry]int, registers map[*st.VarEntry]int, locations map[*st.VarEntry]*codegen.ARMAddress, stackSize int) int {
	sort.SliceStable(active, func(i, j int) bool {
		return endpoint[active[i]] < endpoint[active[j]]
	})
	spill := active[len(active)-1]
	if endpoint[spill] > endpoint[v] {
		registers[v] = registers[spill]
		registers[spill] = -1
		locations[spill] = codegen.NewARMAddress(codegen.NewARMRegister("sp"), []*codegen.ARMImmediate{codegen.NewARMImmediate(stackSize)})
		stackSize += 8
		active = active[:len(active)-1]
		active = append(active, v)
	} else {
		locations[v] = codegen.NewARMAddress(codegen.NewARMRegister("sp"), []*codegen.ARMImmediate{codegen.NewARMImmediate(stackSize)})
		stackSize += 8
	}
	return stackSize
}
