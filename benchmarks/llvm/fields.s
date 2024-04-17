		.arch armv8-a
		.text

.READ:
		.asciz "%ld"
		.size .READ, 4
		.type main, %function
		.global main
		.p2align 2

main:
	//Prologue
	sub sp, sp, #240
	stp x29, x30, [sp]
	mov x29, sp
.L0:
	mov x26, #0
	mov x8, x26
	mov x0, #16
	bl malloc
	mov x9, x0
	mov x8, x9
	mov x9, x8
	add x9, x9, #0
	mov x26, #0
	str x26, [x9]
	mov x0, #16
	bl malloc
	mov x9, x0
	mov x10, x8
	add x10, x10, #0
	ldr x9, [x10]
	mov x9, x8
	add x9, x9, #0
	ldr x9, [x9]
	add x9, x9, #8
	mov x26, #5
	str x26, [x9]
	add x8, x8, #0
	ldr x8, [x8]
	add x8, x8, #8
	ldr x8, [x8]
	mov x26, #0
	mov x8, x26
	mov x0, x8
	b .mainExit
.mainExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #240
	ret
	.size main,(.-main)

