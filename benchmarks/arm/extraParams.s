		.arch armv8-a
		.text

.READ:
		.asciz "%ld"
		.size .READ, 4
		.type foo, %function
		.global foo
		.p2align 2

foo:
	//Prologue
	sub sp, sp, #256
	stp x29, x30, [sp]
	mov x29, sp
.L0:
	mov x9, x0
	mov x10, x1
	mov x11, x2
	mov x8, x3
	mov x12, x4
	mov x14, x5
	mov x15, x6
	mov x19, x7
	ldr x20, [sp, #480]
	ldr x13, [sp, #488]
	add x26, x9, x10
	mov x9, x26
	mov x10, x11
	add x26, x9, x10
	mov x9, x26
	add x26, x9, x8
	mov x8, x26
	mov x9, x12
	add x26, x8, x9
	mov x8, x26
	mov x9, x14
	add x26, x8, x9
	mov x8, x26
	mov x9, x15
	add x26, x8, x9
	mov x8, x26
	mov x9, x19
	add x26, x8, x9
	mov x8, x26
	mov x9, x20
	add x26, x8, x9
	mov x8, x26
	mov x9, x13
	add x26, x8, x9
	mov x8, x26
	mov x0, x8
	b .fooExit
.fooExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #256
	ret
	.size foo,(.-foo)

		.type main, %function
		.global main
		.p2align 2

main:
	//Prologue
	sub sp, sp, #240
	stp x29, x30, [sp]
	mov x29, sp
.L1:
	mov x26, #1
	mov x8, x26
	mov x26, #2
	mov x9, x26
	mov x26, #3
	mov x10, x26
	mov x26, #4
	mov x11, x26
	mov x26, #5
	mov x12, x26
	mov x26, #6
	mov x13, x26
	mov x26, #7
	mov x14, x26
	mov x26, #8
	mov x15, x26
	mov x26, #9
	mov x19, x26
	mov x26, #10
	mov x20, x26
	str x0, [sp, #16]
	str x1, [sp, #24]
	str x2, [sp, #32]
	str x3, [sp, #40]
	str x4, [sp, #48]
	str x5, [sp, #56]
	str x6, [sp, #64]
	str x7, [sp, #72]
	str x8, [sp, #80]
	str x9, [sp, #88]
	str x10, [sp, #96]
	str x11, [sp, #104]
	str x12, [sp, #112]
	str x13, [sp, #120]
	str x14, [sp, #128]
	str x15, [sp, #136]
	str x19, [sp, #144]
	str x20, [sp, #152]
	str x21, [sp, #160]
	str x22, [sp, #168]
	str x23, [sp, #176]
	str x24, [sp, #184]
	str x25, [sp, #192]
	str x26, [sp, #200]
	str x27, [sp, #208]
	str x28, [sp, #216]
	mov x0, x8
	mov x1, x9
	mov x2, x10
	mov x3, x11
	mov x4, x12
	mov x5, x13
	mov x6, x14
	mov x7, x15
	sub sp, sp, #16
	str x19, [sp, #224]
	str x20, [sp, #232]
	bl foo
	add sp, sp, #16
	mov x16, x0
	ldr x0, [sp, #16]
	ldr x1, [sp, #24]
	ldr x2, [sp, #32]
	ldr x3, [sp, #40]
	ldr x4, [sp, #48]
	ldr x5, [sp, #56]
	ldr x6, [sp, #64]
	ldr x7, [sp, #72]
	ldr x8, [sp, #80]
	ldr x9, [sp, #88]
	ldr x10, [sp, #96]
	ldr x11, [sp, #104]
	ldr x12, [sp, #112]
	ldr x13, [sp, #120]
	ldr x14, [sp, #128]
	ldr x15, [sp, #136]
	ldr x19, [sp, #144]
	ldr x20, [sp, #152]
	ldr x21, [sp, #160]
	ldr x22, [sp, #168]
	ldr x23, [sp, #176]
	ldr x24, [sp, #184]
	ldr x25, [sp, #192]
	ldr x26, [sp, #200]
	ldr x27, [sp, #208]
	ldr x28, [sp, #216]
	mov x8, x16
	adrp x26, .FMTSTR0
	add x26, x26, :lo12:.FMTSTR0
	mov x0, x26
	mov x1, x8
	str x8, [sp, #80]
	str x9, [sp, #88]
	str x10, [sp, #96]
	str x11, [sp, #104]
	str x12, [sp, #112]
	str x13, [sp, #120]
	str x14, [sp, #128]
	str x15, [sp, #136]
	str x19, [sp, #144]
	str x20, [sp, #152]
	str x21, [sp, #160]
	str x22, [sp, #168]
	str x23, [sp, #176]
	str x24, [sp, #184]
	str x25, [sp, #192]
	str x26, [sp, #200]
	str x27, [sp, #208]
	str x28, [sp, #216]
	bl printf
	ldr x8, [sp, #80]
	ldr x9, [sp, #88]
	ldr x10, [sp, #96]
	ldr x11, [sp, #104]
	ldr x12, [sp, #112]
	ldr x13, [sp, #120]
	ldr x14, [sp, #128]
	ldr x15, [sp, #136]
	ldr x19, [sp, #144]
	ldr x20, [sp, #152]
	ldr x21, [sp, #160]
	ldr x22, [sp, #168]
	ldr x23, [sp, #176]
	ldr x24, [sp, #184]
	ldr x25, [sp, #192]
	ldr x26, [sp, #200]
	ldr x27, [sp, #208]
	ldr x28, [sp, #216]
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

.FMTSTR0:
		.asciz "u = %ld\n"
		.size .PRINT, 8
