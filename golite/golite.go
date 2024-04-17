package main

import (
	"fmt"
	"os"
	"proj-optimization-overlords/lexer"
	"proj-optimization-overlords/parser"
	"proj-optimization-overlords/sa"
	"slices"
	"strings"
)

func main() {
	lexer := lexer.NewLexer(os.Args[len(os.Args)-1])
	// check for -lex command line argument to print out each token on a separate line
	if slices.Contains(os.Args, "-lex") {
		tokenStream := lexer.GetTokenStream()
		tokenStream.Fill()
		for _, token := range tokenStream.GetAllTokens() {
			fmt.Println(token.GetTokenType(), "(", token.GetText(), ",", token.GetLine(), ")")
		}
	}

	opFlag := false
	if slices.Contains(os.Args, "-O1") {
		opFlag = true
	}

	parser := parser.NewParser(lexer)
	ast := parser.Parse()
	ast.Optimize = opFlag
	if slices.Contains(os.Args, "-ast") {
		fmt.Println(ast)
	}

	tables := sa.Execute(ast)
	if tables != nil {
		llvm_target_triple := "x86_64-linux-gnu"
		for _, arg := range os.Args {
			// Check if -target=STRING is in the command line arguments
			if strings.Split(arg, "=")[0] == "-target" {
				llvm_target_triple = strings.Split(arg, "=")[1]
			}
		}
		file_name := strings.Split(os.Args[len(os.Args)-1], ".golite")[0]
		source_filename := strings.Split(file_name, "/")[len(strings.Split(file_name, "/"))-1]
		llvmProgram := ast.TranslateToLLVMStack(source_filename, llvm_target_triple, tables)
		llvmProgram.Optimize = opFlag
		if slices.Contains(os.Args, "-llvm") {
			// Create llvm IR with filename the same as the original with .ll extension
			llvm_file, err := os.Create(file_name + ".ll")
			if err != nil {
				fmt.Println("Error creating llvm file:", err)
				return
			}
			defer llvm_file.Close()
			llvm_file.WriteString(llvmProgram.String())
		}
		if slices.Contains(os.Args, "-S") {
			ARMProgram := llvmProgram.TranslateToARM()
			arm_file, err := os.Create(file_name + ".s")
			if err != nil {
				fmt.Println("Error creating ARM file:", err)
				return
			}
			defer arm_file.Close()
			arm_file.WriteString(ARMProgram.String())
		}
	} else {
		fmt.Println("Semantic errors found. No LLVM output.")
	}
}
