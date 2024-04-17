# How to run the compiler on the CS Linux Servers
Step 1: Run "./build.sh" to build the golitec executable
Step 2: Run "./golitec {flags} fileToCompile"

The flags that can currently be used by the compiler is -lex to print out the lexer tokens, -ast to print out the abstract syntax tree, -llvm to produce the LLVM IR form in a .ll file from the input source file, -target=STRING to change the llvm target triple value, and -S to produce the ARM assembly code in a .s file.

To read the printing of the -ast flag, the output will be in the form of the GoLite source code that later be translated.

We have implemented dead-code elimination as an optimization, which can be utilized with the -O1 flag. An example can be seen in benchmarks/optimization/postReturn.golite, which contains code after a return statement. With the optimization, this code is removed from both LLVM and ARM.

Additionally, we have implemented an optimization which removes some useless ARM instructions, such as a mov with the same two registers or an unnecessary break. This optimization can also be utilized with the -O1 flag. Examples can be seen in many benchmarks, one of which is benchmarks/arm/extraParams2.golite, where the mov instruction between the ldrs and the adrp is removed.