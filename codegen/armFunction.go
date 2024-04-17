package codegen

import (
	"bytes"
	"fmt"
	st "proj-optimization-overlords/symboltable"
)

type ARMFunction struct {
	Name                  string
	Params                []*st.VarEntry
	Body                  []Instruction
	StackSize             int
	VarLocations          map[*st.VarEntry]ARMOperand
	NextAvailableRegister int
	FmtStrs               []string
	FmtStrLengths         []int
	Registers             map[*st.VarEntry]int
	Locations             map[*st.VarEntry]*ARMAddress
	SavedAddresses        map[int]*ARMAddress
}

func NewARMFunction(name string, params []*st.VarEntry, body []Instruction, stackSize int, registers map[*st.VarEntry]int, locations map[*st.VarEntry]*ARMAddress) *ARMFunction {
	return &ARMFunction{name, params, body, stackSize, make(map[*st.VarEntry]ARMOperand), 26, []string{}, []int{}, registers, locations, make(map[int]*ARMAddress)}
}

func (function *ARMFunction) String() string {
	var out bytes.Buffer
	out.WriteString("\t\t.type " + function.Name + ", %function\n")
	out.WriteString("\t\t.global " + function.Name + "\n")
	out.WriteString("\t\t.p2align 2\n\n")
	out.WriteString(function.Name + ":\n")
	// Write prologue
	out.WriteString("\t//Prologue\n")
	out.WriteString("\tsub sp, sp, #" + fmt.Sprint(function.StackSize) + "\n")
	out.WriteString("\tstp x29, x30, [sp]\n")
	out.WriteString("\tmov x29, sp\n")
	for _, instruction := range function.Body {
		if instruction.GetType() != "Label" {
			out.WriteByte('\t')
		}
		out.WriteString(instruction.String() + "\n")
	}
	// Write epilogue
	out.WriteString("." + function.Name + "Exit:\n")
	out.WriteString("\t//Epilogue\n")
	out.WriteString("\tldp x29, x30, [sp]\n")
	out.WriteString("\tadd sp, sp, #" + fmt.Sprint(function.StackSize) + "\n")
	out.WriteString("\tret\n")
	out.WriteString("\t.size " + function.Name + ",(.-" + function.Name + ")\n")
	return out.String()
}

func (function *ARMFunction) GenerateVarLocations(currFunc *st.FuncEntry) {
	for i, paramEntry := range currFunc.Parameters {
		function.VarLocations[paramEntry] = NewARMRegister(NewARMRegFromInt(i).String())
	}
	// Iterate through the function's variables and assign them a location on the stack
	for varEntry, reg := range function.Registers {
		if reg != -1 {
			function.VarLocations[varEntry] = NewARMRegister(NewARMRegFromInt(reg).String())
		}
	}
	for varEntry, loc := range function.Locations {
		function.VarLocations[varEntry] = loc
	}
	for i := 0; i <= 15; i++ {
		function.SavedAddresses[i] = NewARMAddress(NewARMRegister("sp"), []*ARMImmediate{NewARMImmediate(function.StackSize)})
		function.StackSize += 8
	}
	for i := 19; i <= 28; i++ {
		function.SavedAddresses[i] = NewARMAddress(NewARMRegister("sp"), []*ARMImmediate{NewARMImmediate(function.StackSize)})
		function.StackSize += 8
	}
	for i, param := range function.Params {
		if i < 8 {
			function.VarLocations[param] = NewARMRegFromInt(i)
		} else {
			function.VarLocations[param] = NewARMAddress(NewARMRegister("sp"), []*ARMImmediate{NewARMImmediate(function.StackSize)})
			function.StackSize += 8
		}
	}

	// Make stack size a multiple of 16
	function.StackSize = function.StackSize + (16 - (function.StackSize % 16))
}

func RemoveInstr(slice []Instruction, instr Instruction) []Instruction {
	for i, s := range slice {
		if s == instr {
			return append(slice[:i], slice[i+1:]...)
		}
	}
	return slice
}
