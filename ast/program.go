package ast

import (
	"bytes"
	ct "proj-optimization-overlords/context"
	"proj-optimization-overlords/llvm"
	st "proj-optimization-overlords/symboltable"
	"proj-optimization-overlords/token"
)

type Program struct {
	*token.Token
	types        []*TypeDeclaration
	declarations []*Declaration
	funcs        []*Function
	Optimize     bool
}

func NewProgram(types []*TypeDeclaration, declarations []*Declaration, funcs []*Function,
	token *token.Token) *Program {
	return &Program{token, types, declarations, funcs, false}
}

func (p *Program) String() string {
	var out bytes.Buffer

	for _, typedeclaration := range p.types {
		out.WriteString(typedeclaration.String()) // type declarations
		out.WriteString("\n")
	}
	for _, declaration := range p.declarations {
		out.WriteString(declaration.String()) // declarations
		out.WriteString("\n")
	}
	for _, function := range p.funcs {
		out.WriteString(function.String()) // functions
		out.WriteString("\n")
	}

	out.WriteString("eof") // EOF

	return out.String()
}

func (p *Program) BuildSymbolTable(errors []*ct.CompilerError, tables *st.SymbolTables) []*ct.CompilerError {
	for _, typedeclaration := range p.types {
		errors = typedeclaration.BuildSymbolTable(errors, tables)
	}
	for _, declaration := range p.declarations {
		errors = declaration.BuildSymbolTable(errors, tables.Globals)
	}
	for _, function := range p.funcs {
		errors = function.BuildSymbolTable(errors, tables)
	}
	return errors
}

func (p *Program) TypeCheck(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	// Check if there is a main function
	if main := tables.Funcs.Contains("main"); main == nil {
		errors = append(errors, ct.NewCompilerError(p.Token, "No required function named \"main\" defined.", ct.SEMANTIC))
	} else if len(main.Parameters) != 0 {
		errors = append(errors, ct.NewCompilerError(p.Token, "No required function named \"main\" must not take in any arguments.", ct.SEMANTIC))
	} else if main.RetTy != nil {
		errors = append(errors, ct.NewCompilerError(p.Token, "No required function named \"main\" must not return a type.", ct.SEMANTIC))
	}
	for _, typedeclaration := range p.types {
		errors = typedeclaration.TypeCheck(errors, function, tables)
	}
	for _, declaration := range p.declarations {
		errors = declaration.TypeCheck(errors, function, tables)
	}
	for _, f := range p.funcs {
		errors = f.TypeCheck(errors, function, tables)
	}
	return errors
}

func (p *Program) ReturnCheck() []*ct.CompilerError {
	var errors = []*ct.CompilerError{}
	for _, f := range p.funcs {
		if err := f.ReturnCheck(); err != nil {
			errors = append(errors, err)
		}
	}
	return errors
}

func (p *Program) MemoryCheck() []*ct.CompilerError {
	return nil
}

func (p *Program) TranslateToLLVMStack(filename string, target string, tables *st.SymbolTables) *llvm.LLVMProgram {
	// implementation
	llvmProgram := llvm.NewLLVMProgram(filename, target, tables, p.Optimize)
	for _, typedeclaration := range p.types {
		llvmProgram.AddTypeDeclaration(typedeclaration.TranslateToLLVMStack(target, tables))
	}
	for _, declaration := range p.declarations {
		llvmProgram.AddGlobalDecls(declaration.GlobalTranslateToLLVMStack(target, tables))
	}
	for _, f := range p.funcs {
		f.TranslateToLLVMStack(target, tables, llvmProgram)
	}
	return llvmProgram
}
