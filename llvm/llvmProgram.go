package llvm

import (
	"bytes"
	"fmt"
	"proj-optimization-overlords/codegen"
	st "proj-optimization-overlords/symboltable"
	"proj-optimization-overlords/types"
)

type LLVMProgram struct {
	SourceName      string
	TargetTriple    string
	Tables          *st.SymbolTables
	Types           map[string]*LLVMTypeDecl
	GlobalDecls     map[string]*LLVMGlobalDecl
	FuncDefs        map[string]*LLVMFuncDef
	FuncDefList     []*LLVMFuncDef
	LabelCounter    int
	RegisterCounter int
	FmtStrCounter   int
	FmtStrs         []string
	FmtStrLengths   []int
	Optimize        bool
}

func (p *LLVMProgram) LabelGen() string {
	var out bytes.Buffer
	out.WriteString("L")
	out.WriteString(fmt.Sprint(p.LabelCounter))
	p.LabelCounter += 1
	return out.String()
}

func (p *LLVMProgram) RegisterGen() string {
	var out bytes.Buffer
	out.WriteString("r")
	out.WriteString(fmt.Sprint(p.RegisterCounter))
	p.RegisterCounter += 1
	return out.String()
}

func NewLLVMProgram(sourceName string, target string, tables *st.SymbolTables, optimize bool) *LLVMProgram {
	return &LLVMProgram{sourceName, target, tables, make(map[string]*LLVMTypeDecl),
		make(map[string]*LLVMGlobalDecl), make(map[string]*LLVMFuncDef, 0), []*LLVMFuncDef{}, 0, 0, 0, []string{}, []int{}, optimize}
}

func (program *LLVMProgram) String() string {
	var out bytes.Buffer
	out.WriteString(fmt.Sprintf("source_filename = \"%s\"", program.SourceName))
	out.WriteByte('\n')
	out.WriteString(fmt.Sprintf("target triple = \"%s\"", program.TargetTriple))
	out.WriteByte('\n')
	for _, ty := range program.Types {
		out.WriteString(ty.String())
		out.WriteByte('\n')
	}
	for _, decl := range program.GlobalDecls {
		out.WriteString(decl.String())
		out.WriteByte('\n')
	}
	for _, funcDef := range program.FuncDefList {
		out.WriteString(funcDef.String())
		out.WriteByte('\n')
	}
	out.WriteString("declare i8* @malloc(i32)")
	out.WriteByte('\n')
	out.WriteString("declare void @free(i8*)")
	out.WriteByte('\n')
	out.WriteString("declare i32 @printf(i8*, ...)")
	out.WriteByte('\n')
	out.WriteString("declare i32 @scanf(i8*, ...)")
	out.WriteByte('\n')
	out.WriteString("@.read = private unnamed_addr constant [4 x i8] c\"%ld\\00\", align 1")
	for i, fmtStr := range program.FmtStrs {
		out.WriteByte('\n')
		out.WriteString(fmt.Sprintf("@.fstr%d = private unnamed_addr constant [%d x i8] c\"%s\", align 1", i, program.FmtStrLengths[i], fmtStr))
	}
	return out.String()
}

func TypesToLLVMType(ty types.Type) string {
	if ty == types.Int1Sig {
		return "i1"
	} else if ty == types.Int8Sig {
		return "i8"
	} else if ty == types.BoolTySig || ty == types.Int64Sig {
		return "i64"
	}
	return ""
}

func (program *LLVMProgram) AddTypeDeclaration(llvmTyDecl *LLVMTypeDecl) {
	program.Types[llvmTyDecl.name] = llvmTyDecl
}

func (program *LLVMProgram) AddGlobalDecls(globalDecl []*LLVMGlobalDecl) {
	for _, decl := range globalDecl {
		program.GlobalDecls[decl.Name] = decl
	}
}

func (program *LLVMProgram) AddFuncDef(funcDef *LLVMFuncDef) {
	program.FuncDefs[funcDef.Name] = funcDef
	program.FuncDefList = append(program.FuncDefList, funcDef)
}

func (program *LLVMProgram) TranslateToARM() *codegen.ARMProgram {
	ARMProg := codegen.NewARMProgram("armv8-a")
	for _, declaration := range program.GlobalDecls {
		ARMProg.Declarations = append(ARMProg.Declarations, declaration.Name)
	}
	for _, function := range program.FuncDefList {
		registers, locations, stackSize := function.GenerateVarLocationsLinearScan(program.Tables.Funcs.Contains(function.Name))
		ARMFunction := codegen.NewARMFunction(function.Name, program.Tables.Funcs.Contains(function.Name).Parameters, make([]codegen.Instruction, 0), stackSize, registers, locations)
		funcEntry := program.Tables.Funcs.Contains(function.Name)
		ARMFunction.GenerateVarLocations(funcEntry)
		for _, block := range function.Entry.InOrderBlocks() {
			ARMFunction.Body = append(ARMFunction.Body, codegen.NewLabel("."+block.Label))
			for _, instruction := range block.Instrs {
				ARMFunction.Body = append(ARMFunction.Body, instruction.TranslateToAssembly(ARMFunction)...)
			}
		}

		if program.Optimize {
			var toRemove []codegen.Instruction
			for i, instr := range ARMFunction.Body {
				if instr.GetType() == "Mov" {
					movInstr := instr.(*codegen.Mov)
					if movInstr.Operand.String() == movInstr.Reg.String() {
						toRemove = append(toRemove, movInstr)
					}
				}
				if instr.GetType() == "B" {
					bInstr := instr.(*codegen.B)
					if i < len(ARMFunction.Body)-1 && ARMFunction.Body[i+1].GetType() == "Label" && ARMFunction.Body[i+1].(*codegen.Label).Name == bInstr.Label {
						toRemove = append(toRemove, bInstr)
					}
				}
				if instr.GetType() == "BCond" {
					blInstr := instr.(*codegen.BCond)
					if i < len(ARMFunction.Body)-1 && ARMFunction.Body[i+1].GetType() == "Label" && ARMFunction.Body[i+1].(*codegen.Label).Name == blInstr.Label {
						toRemove = append(toRemove, blInstr)
					} else if i < len(ARMFunction.Body)-2 && ARMFunction.Body[i+2].GetType() == "Label" && ARMFunction.Body[i+2].(*codegen.Label).Name == blInstr.Label {
						toRemove = append(toRemove, blInstr)
					}
				}
			}
			for _, instr := range toRemove {
				ARMFunction.Body = codegen.RemoveInstr(ARMFunction.Body, instr)
			}
		}

		ARMProg.Functions = append(ARMProg.Functions, ARMFunction)
	}
	return ARMProg
}
