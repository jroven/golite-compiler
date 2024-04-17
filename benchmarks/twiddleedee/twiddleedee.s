		.arch armv8-a
		.text

.READ:
		.asciz "%ld"
		.size .READ, 4
		.type fib1, %function
		.global fib1
		.p2align 2

fib1:
	//Prologue
	sub sp, sp, #240
	stp x29, x30, [sp]
	mov x29, sp
.L0:
	mov x8, x0
	mov x9, x8
	mov x26, #2
	cmp x9, x26
	cset x28, lt
	mov x9, x28
	cmp x9, #1
	cset x26, eq
	mov x9, x26
	b.ne .L2
.L1:
	mov x9, x8
	mov x10, x9
	mov x0, x10
	b .fib1Exit
.L2:
	mov x10, x8
	mov x26, #1
	sub x27, x10, x26
	mov x10, x27
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
	mov x0, x10
	sub sp, sp, #0
	bl fib1
	add sp, sp, #0
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
	mov x10, x16
	mov x26, #2
	sub x27, x8, x26
	mov x8, x27
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
	sub sp, sp, #0
	bl fib1
	add sp, sp, #0
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
	add x26, x10, x8
	mov x8, x26
	mov x9, x8
	mov x8, x9
	mov x0, x8
	b .fib1Exit
.fib1Exit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #240
	ret
	.size fib1,(.-fib1)

		.type fib2, %function
		.global fib2
		.p2align 2

fib2:
	//Prologue
	sub sp, sp, #240
	stp x29, x30, [sp]
	mov x29, sp
.L4:
	mov x8, x0
	mov x26, #0
	mov x9, x26
	mov x26, #1
	mov x10, x26
.L5:
	mov x11, x8
	mov x26, #0
	cmp x11, x26
	cset x28, ne
	mov x12, x28
	cmp x12, #1
	cset x26, eq
	mov x13, x26
	b.ne .L7
.L6:
	mov x14, x8
	mov x26, #1
	sub x27, x14, x26
	mov x15, x27
	mov x8, x15
	mov x19, x9
	mov x20, x10
	add x26, x19, x20
	mov x21, x26
	mov x22, x21
	mov x23, x10
	mov x9, x23
	mov x24, x22
	mov x10, x24
	b .L5
.L7:
	mov x25, x9
	mov x0, x25
	b .fib2Exit
.fib2Exit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #240
	ret
	.size fib2,(.-fib2)

		.type main, %function
		.global main
		.p2align 2

main:
	//Prologue
	sub sp, sp, #240
	stp x29, x30, [sp]
	mov x29, sp
.L8:
	mov x0, #16
	bl malloc
	mov x8, x0
	adrp x26, .READ
	add x26, x26, :lo12:.READ
	mov x0, x26
	sub sp, sp, #16
	mov x1, sp
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
	bl scanf
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
	ldr x9, [sp]
	add sp, sp, #16
	mov x10, x9
	mov x11, x8
	add x11, x11, #0
	str x10, [x11]
	adrp x26, .READ
	add x26, x26, :lo12:.READ
	mov x0, x26
	sub sp, sp, #16
	mov x1, sp
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
	bl scanf
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
	ldr x9, [sp]
	add sp, sp, #16
	mov x10, x8
	add x10, x10, #8
	str x9, [x10]
	mov x9, x8
	add x9, x9, #0
	ldr x9, [x9]
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
	mov x0, x9
	sub sp, sp, #0
	bl fib1
	add sp, sp, #0
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
	mov x9, x16
	mov x10, x8
	add x10, x10, #8
	ldr x10, [x10]
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
	mov x0, x10
	sub sp, sp, #0
	bl fib2
	add sp, sp, #0
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
	mov x10, x16
	mov x0, x8
	bl free
	mov x8, x9
	mov x9, x10
	adrp x26, .FMTSTR0
	add x26, x26, :lo12:.FMTSTR0
	mov x0, x26
	mov x1, x8
	mov x2, x9
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
		.asciz "c=%ld\nd=%ld"
		.size .PRINT, 11
