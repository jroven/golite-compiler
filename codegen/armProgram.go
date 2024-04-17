package codegen

import (
	"bytes"
	"fmt"
)

type ARMProgram struct {
	Architecture string
	Declarations []string
	Functions    []*ARMFunction
}

func NewARMProgram(architecture string) *ARMProgram {
	return &ARMProgram{architecture, []string{}, []*ARMFunction{}}
}

func (program *ARMProgram) String() string {
	var out bytes.Buffer
	out.WriteString("\t\t.arch " + program.Architecture)
	out.WriteByte('\n')
	for _, decl := range program.Declarations {
		out.WriteString("\t\t.comm " + decl + ",8,8")
		out.WriteByte('\n')
	}
	out.WriteString("\t\t.text\n\n")
	out.WriteString(".READ:\n\t\t.asciz \"%ld\"\n\t\t.size .READ, 4\n")

	for _, function := range program.Functions {
		out.WriteString(function.String())
		out.WriteString("\n")
	}
	i := 0
	for _, function := range program.Functions {
		j := 0
		for _, fmtStr := range function.FmtStrs {
			out.WriteString(".FMTSTR" + fmt.Sprint(i) + ":\n")
			out.WriteString("\t\t.asciz \"" + fmtStr + "\"\n")
			out.WriteString("\t\t.size .PRINT, " + fmt.Sprint(function.FmtStrLengths[j]))
			out.WriteByte('\n')
			i++
			j++
		}
	}
	return out.String()
}
