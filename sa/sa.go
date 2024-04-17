package sa

import (
	"proj-optimization-overlords/ast"
	"proj-optimization-overlords/context"
	st "proj-optimization-overlords/symboltable"
)

func Execute(program *ast.Program) *st.SymbolTables {

	// Define the compiler symbol tables
	tables := st.NewSymbolTables()

	// First Build the Symbol Table(s) for all global declarations
	errors := make([]*context.CompilerError, 0)
	errors = program.BuildSymbolTable(errors, tables)

	if !context.HasErrors(errors) {
		// Second perform type checking
		errors := make([]*context.CompilerError, 0)
		errors = program.TypeCheck(errors, nil, tables)
		// Third perform return path checking
		errors = append(errors, program.ReturnCheck()...)
		if !context.HasErrors(errors) {
			return tables
		}
	}
	return nil
}
