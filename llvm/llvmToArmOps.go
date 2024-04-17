package llvm

import (
	"proj-optimization-overlords/codegen"
	st "proj-optimization-overlords/symboltable"
	"strconv"
)

// Get ARMRegister from LLVMOperand (value)
func GetARMRegFromLLVMOp(llvmOp LLVMOperand, armFunc *codegen.ARMFunction) ([]codegen.Instruction, *codegen.ARMRegister) {
	if llvmReg := llvmOp.GetRegister(); llvmReg != nil {
		// llvmOp is a register
		if llvmReg.Entry.Scope == st.GLOBAL {
			// llvmOp is a global variable
			nextArmReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
			armFunc.NextAvailableRegister++
			adrpInstr := codegen.NewAdrp(nextArmReg, llvmReg.Entry.Name)
			addLo12Instr := codegen.NewAddLo12(nextArmReg, llvmReg.Entry.Name)
			ldrInstr := codegen.NewLdr(nextArmReg, nextArmReg)
			return []codegen.Instruction{adrpInstr, addLo12Instr, ldrInstr}, nextArmReg
		} else {
			// llvmOp is a local variable
			if armOp := armFunc.VarLocations[llvmReg.Entry]; armOp.GetRegister() != nil {
				// llvmOp is already in a register
				return nil, armOp.GetRegister()
			} else {
				// llvmOp is not in a register
				nextArmReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
				armFunc.NextAvailableRegister++
				armLoad := codegen.NewLdr(nextArmReg, armOp)
				return []codegen.Instruction{armLoad}, nextArmReg
			}
		}
	} else {
		// llvmOp is an immediate
		nextArmReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
		armFunc.NextAvailableRegister++
		armImmediate := codegen.NewARMImmediate(llvmOp.GetImmediate().value)
		armMov := codegen.NewMov(nextArmReg, armImmediate)
		return []codegen.Instruction{armMov}, nextArmReg
	}
}

// Get ARMOperand (address) from LLVMRegister
func GetARMOpFromLLVMReg(llvmReg *LLVMRegister, armFunc *codegen.ARMFunction) ([]codegen.Instruction, codegen.ARMOperand) {
	if llvmReg.Entry.Scope == st.GLOBAL {
		// llvmReg is a global variable
		nextArmReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
		adrpInstr := codegen.NewAdrp(nextArmReg, llvmReg.Entry.Name)
		addLo12Instr := codegen.NewAddLo12(nextArmReg, llvmReg.Entry.Name)
		return []codegen.Instruction{adrpInstr, addLo12Instr}, nextArmReg
	} else {
		// llvmReg is a local variable
		return []codegen.Instruction{}, armFunc.VarLocations[llvmReg.Entry]
	}
}

// Get ARMRegister from LLVMRegister
func GetARMRegFromLLVMReg(llvmReg *LLVMRegister, armFunc *codegen.ARMFunction) ([]codegen.Instruction, *codegen.ARMRegister) {
	if llvmReg.Entry.Scope == st.GLOBAL {
		// llvmReg is a global variable
		nextArmReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
		armFunc.NextAvailableRegister++
		adrpInstr := codegen.NewAdrp(nextArmReg, llvmReg.Entry.Name)
		addLo12Instr := codegen.NewAddLo12(nextArmReg, llvmReg.Entry.Name)
		return []codegen.Instruction{adrpInstr, addLo12Instr}, nextArmReg
	} else {
		// llvmReg is a local variable
		if armOp := armFunc.VarLocations[llvmReg.Entry]; armOp.GetRegister() != nil {
			// llvmReg is already in an ARM register
			return nil, armOp.GetRegister()
		} else {
			// llvmReg is not in an ARM register
			nextArmReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
			armFunc.NextAvailableRegister++
			armLoad := codegen.NewLdr(nextArmReg, armOp)
			return []codegen.Instruction{armLoad}, nextArmReg
		}
	}
}

// Get ARMRegister with value from LLVMRegister
func GetARMRegWValFromLLVMReg(llvmReg *LLVMRegister, armFunc *codegen.ARMFunction) ([]codegen.Instruction, *codegen.ARMRegister) {
	var instrs []codegen.Instruction
	if llvmReg.Entry.Scope == st.GLOBAL {
		// llvmReg is a global variable
		nextArmReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
		armFunc.NextAvailableRegister++
		adrpInstr := codegen.NewAdrp(nextArmReg, llvmReg.Entry.Name)
		addLo12Instr := codegen.NewAddLo12(nextArmReg, llvmReg.Entry.Name)
		ldrInstr := codegen.NewLdr(nextArmReg, nextArmReg)
		instrs = append(instrs, adrpInstr, addLo12Instr, ldrInstr)
		return instrs, nextArmReg
	} else {
		// llvmReg is a local variable
		if armOp := armFunc.VarLocations[llvmReg.Entry]; armOp.GetRegister() != nil {
			// llvmReg is already in an ARM register
			return nil, armOp.GetRegister()
		} else {
			// llvmReg is not in an ARM register
			nextArmReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
			armFunc.NextAvailableRegister++
			armLoad := codegen.NewLdr(nextArmReg, armOp)
			instrs = append(instrs, armLoad)
			return instrs, nextArmReg
		}
	}
}

func GetARMOpFromLLVMOp(llvmOp LLVMOperand, armFunc *codegen.ARMFunction) ([]codegen.Instruction, codegen.ARMOperand) {
	if llvmReg := llvmOp.GetRegister(); llvmReg != nil {
		// llvmOp is a register
		if llvmReg.Entry.Scope == st.GLOBAL {
			// llvmOp is a global variable
			nextArmReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
			adrpInstr := codegen.NewAdrp(nextArmReg, llvmReg.Entry.Name)
			addLo12Instr := codegen.NewAddLo12(nextArmReg, llvmReg.Entry.Name)
			return []codegen.Instruction{adrpInstr, addLo12Instr}, nextArmReg
		} else {
			// llvmOp is a local variable
			return []codegen.Instruction{}, armFunc.VarLocations[llvmReg.Entry]
		}
	} else {
		// llvmOp is an immediate
		nextArmReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
		armFunc.NextAvailableRegister++
		armImmediate := codegen.NewARMImmediate(llvmOp.GetImmediate().value)
		armMov := codegen.NewMov(nextArmReg, armImmediate)
		return []codegen.Instruction{armMov}, nextArmReg
	}
}

func SaveRegs(armFunc *codegen.ARMFunction) []codegen.Instruction {
	var instructions []codegen.Instruction
	// Save the caller registers x8-x15 to their backup addresses
	for i := 8; i <= 15; i++ {
		backupStr := codegen.NewStr(codegen.NewARMRegister("x"+strconv.Itoa(i)), armFunc.SavedAddresses[i])
		instructions = append(instructions, backupStr)
	}
	// Save the callee registers x19-x28 to their backup addresses
	for i := 19; i <= 28; i++ {
		backupStr := codegen.NewStr(codegen.NewARMRegister("x"+strconv.Itoa(i)), armFunc.SavedAddresses[i])
		instructions = append(instructions, backupStr)
	}
	return instructions
}

func RestoreRegs(armFunc *codegen.ARMFunction) []codegen.Instruction {
	var instructions []codegen.Instruction
	// Restore the caller registers x8-x15 from their backup addresses
	for i := 8; i <= 15; i++ {
		backupLdr := codegen.NewLdr(codegen.NewARMRegister("x"+strconv.Itoa(i)), armFunc.SavedAddresses[i])
		instructions = append(instructions, backupLdr)
	}
	// Restore the callee registers x19-x28 from their backup addresses
	for i := 19; i <= 28; i++ {
		backupLdr := codegen.NewLdr(codegen.NewARMRegister("x"+strconv.Itoa(i)), armFunc.SavedAddresses[i])
		instructions = append(instructions, backupLdr)
	}
	return instructions
}
