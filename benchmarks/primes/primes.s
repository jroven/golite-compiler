		.arch armv8-a
		.text

.READ:
		.asciz "%ld"
		.size .READ, 4
		.type isqrt, %function
		.global isqrt
		.p2align 2

isqrt:
	//Prologue
	sub sp, sp, #240
	stp x29, x30, [sp]
	mov x29, sp
.L0:
	mov x8, x0
	mov x26, #1
	mov x9, x26
	mov x26, #3
	mov x10, x26
	b .L1
.L1:
	mov x11, x9
	mov x12, x8
	cmp x11, x12
	cset x27, le
	mov x13, x27
	cmp x13, #1
	cset x26, eq
	mov x14, x26
	b.eq .L2
	b.ne .L3
.L2:
	mov x15, x9
	mov x19, x10
	add x26, x15, x19
	mov x20, x26
	mov x9, x20
	mov x21, x10
	mov x26, #2
	add x27, x21, x26
	mov x22, x27
	mov x10, x22
	b .L1
.L3:
	mov x23, x10
	mov x26, #2
	sdiv x27, x23, x26
	mov x23, x27
	mov x26, #1
	sub x27, x23, x26
	mov x23, x27
	mov x23, x23
	mov x23, x23
	mov x0, x23
	b .isqrtExit
.isqrtExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #240
	ret
	.size isqrt,(.-isqrt)

		.type prime, %function
		.global prime
		.p2align 2

prime:
	//Prologue
	sub sp, sp, #272
	stp x29, x30, [sp]
	mov x29, sp
.L4:
	mov x8, x0
	mov x9, x8
	mov x26, #2
	cmp x9, x26
	cset x28, lt
	mov x9, x28
	cmp x9, #1
	cset x26, eq
	mov x9, x26
	b.eq .L5
	b.ne .L6
.L5:
	mov x26, #0
	str x26, [sp, #24]
	ldr x10, [sp, #24]
	mov x0, x10
	b .primeExit
	b .L7
.L6:
	mov x10, x8
	str x0, [sp, #56]
	str x1, [sp, #64]
	str x2, [sp, #72]
	str x3, [sp, #80]
	str x4, [sp, #88]
	str x5, [sp, #96]
	str x6, [sp, #104]
	str x7, [sp, #112]
	str x8, [sp, #120]
	str x9, [sp, #128]
	str x10, [sp, #136]
	str x11, [sp, #144]
	str x12, [sp, #152]
	str x13, [sp, #160]
	str x14, [sp, #168]
	str x15, [sp, #176]
	str x19, [sp, #184]
	str x20, [sp, #192]
	str x21, [sp, #200]
	str x22, [sp, #208]
	str x23, [sp, #216]
	str x24, [sp, #224]
	str x25, [sp, #232]
	str x26, [sp, #240]
	str x27, [sp, #248]
	str x28, [sp, #256]
	mov x0, x10
	sub sp, sp, #0
	bl isqrt
	add sp, sp, #0
	mov x16, x0
	ldr x0, [sp, #56]
	ldr x1, [sp, #64]
	ldr x2, [sp, #72]
	ldr x3, [sp, #80]
	ldr x4, [sp, #88]
	ldr x5, [sp, #96]
	ldr x6, [sp, #104]
	ldr x7, [sp, #112]
	ldr x8, [sp, #120]
	ldr x9, [sp, #128]
	ldr x10, [sp, #136]
	ldr x11, [sp, #144]
	ldr x12, [sp, #152]
	ldr x13, [sp, #160]
	ldr x14, [sp, #168]
	ldr x15, [sp, #176]
	ldr x19, [sp, #184]
	ldr x20, [sp, #192]
	ldr x21, [sp, #200]
	ldr x22, [sp, #208]
	ldr x23, [sp, #216]
	ldr x24, [sp, #224]
	ldr x25, [sp, #232]
	ldr x26, [sp, #240]
	ldr x27, [sp, #248]
	ldr x28, [sp, #256]
	mov x10, x16
	mov x10, x10
	mov x26, #2
	str x26, [sp, #16]
	b .L8
.L7:
	b .L7
.L8:
	ldr x12, [sp, #16]
	mov x13, x10
	cmp x12, x13
	cset x27, le
	mov x14, x27
	cmp x14, #1
	cset x26, eq
	mov x15, x26
	b.eq .L9
	b.ne .L10
.L9:
	mov x19, x8
	mov x20, x8
	ldr x21, [sp, #16]
	sdiv x26, x20, x21
	mov x22, x26
	ldr x23, [sp, #16]
	mul x26, x22, x23
	mov x24, x26
	sub x26, x19, x24
	mov x25, x26
	mov x11, x25
	ldr x26, [sp, #48]
	mov x26, x11
	ldr x26, [sp, #48]
	mov x27, #0
	cmp x26, x27
	cset x29, eq
	str x29, [sp, #32]
	ldr x26, [sp, #32]
	cmp x26, #1
	cset x27, eq
	str x27, [sp, #40]
	b.eq .L11
	b.ne .L12
.L10:
	mov x26, #1
	str x26, [sp, #24]
	ldr x9, [sp, #24]
	mov x0, x9
	b .primeExit
	b .L7
.L11:
	mov x26, #0
	str x26, [sp, #24]
	ldr x8, [sp, #24]
	mov x0, x8
	b .primeExit
	b .L13
.L12:
	b .L13
.L13:
	ldr x9, [sp, #16]
	mov x26, #1
	add x27, x9, x26
	mov x10, x27
	str x26, [sp, #16]
	b .L8
.primeExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #272
	ret
	.size prime,(.-prime)

		.type main, %function
		.global main
		.p2align 2

main:
	//Prologue
	sub sp, sp, #240
	stp x29, x30, [sp]
	mov x29, sp
.L14:
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
	ldr x8, [sp]
	add sp, sp, #16
	mov x26, #0
	mov x9, x26
	b .L15
.L15:
	mov x10, x9
	mov x11, x8
	cmp x10, x11
	cset x27, le
	mov x12, x27
	cmp x12, #1
	cset x26, eq
	mov x13, x26
	b.eq .L16
	b.ne .L17
.L16:
	mov x14, x9
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
	mov x0, x14
	sub sp, sp, #0
	bl prime
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
	mov x15, x16
	mov x19, x15
	cmp x19, #1
	cset x26, eq
	mov x20, x26
	b.eq .L18
	b.ne .L19
.L17:
	mov x26, #0
	mov x21, x26
	mov x21, x21
	mov x0, x21
	b .mainExit
.L18:
	mov x8, x9
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
	b .L20
.L19:
	b .L20
.L20:
	mov x10, x9
	mov x26, #1
	add x27, x10, x26
	mov x11, x27
	mov x9, x11
	b .L15
.mainExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #240
	ret
	.size main,(.-main)

.FMTSTR0:
		.asciz "%ld\n"
		.size .PRINT, 4
