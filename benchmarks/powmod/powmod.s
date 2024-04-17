		.arch armv8-a
		.text

.READ:
		.asciz "%ld"
		.size .READ, 4
		.type mod, %function
		.global mod
		.p2align 2

mod:
	//Prologue
	sub sp, sp, #240
	stp x29, x30, [sp]
	mov x29, sp
.L0:
	mov x9, x0
	mov x8, x1
	mov x10, x9
	mov x11, x8
	sdiv x26, x10, x11
	mov x10, x26
	mul x26, x10, x8
	mov x8, x26
	sub x26, x9, x8
	mov x8, x26
	mov x0, x8
	b .modExit
.modExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #240
	ret
	.size mod,(.-mod)

		.type power, %function
		.global power
		.p2align 2

power:
	//Prologue
	sub sp, sp, #240
	stp x29, x30, [sp]
	mov x29, sp
.L1:
	mov x9, x0
	mov x8, x1
	mov x10, x8
	mov x26, #0
	cmp x10, x26
	cset x28, eq
	mov x10, x28
	cmp x10, #1
	cset x26, eq
	mov x10, x26
	b.ne .L3
.L2:
	mov x26, #1
	mov x10, x26
	mov x11, x10
	mov x0, x11
	b .powerExit
.L3:
	mov x11, x8
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
	mov x0, x11
	mov x1, #2
	sub sp, sp, #0
	bl mod
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
	mov x11, x16
	mov x26, #1
	cmp x11, x26
	cset x28, eq
	mov x11, x28
	cmp x11, #1
	cset x26, eq
	mov x11, x26
	b.ne .L6
.L5:
	mov x11, x9
	mov x12, x9
	mov x13, x8
	mov x26, #1
	sub x27, x13, x26
	mov x13, x27
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
	mov x0, x12
	mov x1, x13
	sub sp, sp, #0
	bl power
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
	mov x12, x16
	mul x26, x11, x12
	mov x11, x26
	mov x10, x11
	mov x11, x10
	mov x0, x11
	b .powerExit
.L6:
	mov x26, #2
	sdiv x27, x8, x26
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
	mov x0, x9
	mov x1, x8
	sub sp, sp, #0
	bl power
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
	mov x9, x8
	mul x26, x9, x8
	mov x8, x26
	mov x10, x8
	mov x8, x10
	mov x0, x8
	b .powerExit
.powerExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #240
	ret
	.size power,(.-power)

		.type crypt, %function
		.global crypt
		.p2align 2

crypt:
	//Prologue
	sub sp, sp, #240
	stp x29, x30, [sp]
	mov x29, sp
.L8:
	mov x8, x0
	mov x10, x1
	mov x9, x2
	mov x11, x9
	add x11, x11, #0
	ldr x11, [x11]
	mov x12, x10
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
	mov x0, x11
	mov x1, x12
	sub sp, sp, #0
	bl power
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
	mov x11, x16
	mov x12, x8
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
	mov x0, x11
	mov x1, x12
	sub sp, sp, #0
	bl mod
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
	mov x11, x16
	mov x12, x9
	add x12, x12, #0
	ldr x11, [x12]
	mov x11, x9
	add x11, x11, #8
	ldr x11, [x11]
	mov x26, #0
	cmp x11, x26
	cset x28, ne
	mov x11, x28
	cmp x11, #1
	cset x26, eq
	mov x11, x26
	b.ne .L10
.L9:
	add x9, x9, #8
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
	mov x0, x8
	mov x1, x10
	mov x2, x9
	sub sp, sp, #0
	bl crypt
	add sp, sp, #0
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
	b .L11
.L10:
.L11:
	mov x26, #0
	mov x8, x26
	mov x0, x8
	b .cryptExit
.cryptExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #240
	ret
	.size crypt,(.-crypt)

		.type main, %function
		.global main
		.p2align 2

main:
	//Prologue
	sub sp, sp, #304
	stp x29, x30, [sp]
	mov x29, sp
.L12:
	mov x0, #16
	bl malloc
	mov x8, x0
	mov x9, x8
	str x26, [sp, #16]
	adrp x26, .READ
	add x26, x26, :lo12:.READ
	mov x0, x26
	sub sp, sp, #16
	mov x1, sp
	str x8, [sp, #144]
	str x9, [sp, #152]
	str x10, [sp, #160]
	str x11, [sp, #168]
	str x12, [sp, #176]
	str x13, [sp, #184]
	str x14, [sp, #192]
	str x15, [sp, #200]
	str x19, [sp, #208]
	str x20, [sp, #216]
	str x21, [sp, #224]
	str x22, [sp, #232]
	str x23, [sp, #240]
	str x24, [sp, #248]
	str x25, [sp, #256]
	str x26, [sp, #264]
	str x27, [sp, #272]
	str x28, [sp, #280]
	bl scanf
	ldr x8, [sp, #144]
	ldr x9, [sp, #152]
	ldr x10, [sp, #160]
	ldr x11, [sp, #168]
	ldr x12, [sp, #176]
	ldr x13, [sp, #184]
	ldr x14, [sp, #192]
	ldr x15, [sp, #200]
	ldr x19, [sp, #208]
	ldr x20, [sp, #216]
	ldr x21, [sp, #224]
	ldr x22, [sp, #232]
	ldr x23, [sp, #240]
	ldr x24, [sp, #248]
	ldr x25, [sp, #256]
	ldr x26, [sp, #264]
	ldr x27, [sp, #272]
	ldr x28, [sp, #280]
	ldr x10, [sp]
	add sp, sp, #16
	adrp x26, .READ
	add x26, x26, :lo12:.READ
	mov x0, x26
	sub sp, sp, #16
	mov x1, sp
	str x8, [sp, #144]
	str x9, [sp, #152]
	str x10, [sp, #160]
	str x11, [sp, #168]
	str x12, [sp, #176]
	str x13, [sp, #184]
	str x14, [sp, #192]
	str x15, [sp, #200]
	str x19, [sp, #208]
	str x20, [sp, #216]
	str x21, [sp, #224]
	str x22, [sp, #232]
	str x23, [sp, #240]
	str x24, [sp, #248]
	str x25, [sp, #256]
	str x26, [sp, #264]
	str x27, [sp, #272]
	str x28, [sp, #280]
	bl scanf
	ldr x8, [sp, #144]
	ldr x9, [sp, #152]
	ldr x10, [sp, #160]
	ldr x11, [sp, #168]
	ldr x12, [sp, #176]
	ldr x13, [sp, #184]
	ldr x14, [sp, #192]
	ldr x15, [sp, #200]
	ldr x19, [sp, #208]
	ldr x20, [sp, #216]
	ldr x21, [sp, #224]
	ldr x22, [sp, #232]
	ldr x23, [sp, #240]
	ldr x24, [sp, #248]
	ldr x25, [sp, #256]
	ldr x26, [sp, #264]
	ldr x27, [sp, #272]
	ldr x28, [sp, #280]
	ldr x11, [sp]
	add sp, sp, #16
	adrp x26, .READ
	add x26, x26, :lo12:.READ
	mov x0, x26
	add x1, sp, #24
	str x8, [sp, #144]
	str x9, [sp, #152]
	str x10, [sp, #160]
	str x11, [sp, #168]
	str x12, [sp, #176]
	str x13, [sp, #184]
	str x14, [sp, #192]
	str x15, [sp, #200]
	str x19, [sp, #208]
	str x20, [sp, #216]
	str x21, [sp, #224]
	str x22, [sp, #232]
	str x23, [sp, #240]
	str x24, [sp, #248]
	str x25, [sp, #256]
	str x26, [sp, #264]
	str x27, [sp, #272]
	str x28, [sp, #280]
	bl scanf
	ldr x8, [sp, #144]
	ldr x9, [sp, #152]
	ldr x10, [sp, #160]
	ldr x11, [sp, #168]
	ldr x12, [sp, #176]
	ldr x13, [sp, #184]
	ldr x14, [sp, #192]
	ldr x15, [sp, #200]
	ldr x19, [sp, #208]
	ldr x20, [sp, #216]
	ldr x21, [sp, #224]
	ldr x22, [sp, #232]
	ldr x23, [sp, #240]
	ldr x24, [sp, #248]
	ldr x25, [sp, #256]
	ldr x26, [sp, #264]
	ldr x27, [sp, #272]
	ldr x28, [sp, #280]
	ldr x13, [sp, #24]
	mov x26, #1
	sub x27, x13, x26
	mov x13, x27
	str x26, [sp, #24]
	adrp x26, .READ
	add x26, x26, :lo12:.READ
	mov x0, x26
	sub sp, sp, #16
	mov x1, sp
	str x8, [sp, #144]
	str x9, [sp, #152]
	str x10, [sp, #160]
	str x11, [sp, #168]
	str x12, [sp, #176]
	str x13, [sp, #184]
	str x14, [sp, #192]
	str x15, [sp, #200]
	str x19, [sp, #208]
	str x20, [sp, #216]
	str x21, [sp, #224]
	str x22, [sp, #232]
	str x23, [sp, #240]
	str x24, [sp, #248]
	str x25, [sp, #256]
	str x26, [sp, #264]
	str x27, [sp, #272]
	str x28, [sp, #280]
	bl scanf
	ldr x8, [sp, #144]
	ldr x9, [sp, #152]
	ldr x10, [sp, #160]
	ldr x11, [sp, #168]
	ldr x12, [sp, #176]
	ldr x13, [sp, #184]
	ldr x14, [sp, #192]
	ldr x15, [sp, #200]
	ldr x19, [sp, #208]
	ldr x20, [sp, #216]
	ldr x21, [sp, #224]
	ldr x22, [sp, #232]
	ldr x23, [sp, #240]
	ldr x24, [sp, #248]
	ldr x25, [sp, #256]
	ldr x26, [sp, #264]
	ldr x27, [sp, #272]
	ldr x28, [sp, #280]
	ldr x13, [sp]
	add sp, sp, #16
	mov x14, x13
	ldr x15, [sp, #16]
	add x15, x15, #0
	ldr x14, [x15]
.L13:
	ldr x14, [sp, #24]
	mov x26, #0
	cmp x14, x26
	cset x28, gt
	mov x15, x28
	cmp x15, #1
	cset x26, eq
	mov x19, x26
	b.ne .L15
.L14:
	mov x0, #16
	bl malloc
	mov x20, x0
	mov x21, x20
	ldr x22, [sp, #16]
	add x23, x22, #8
	ldr x21, [x23]
	ldr x24, [sp, #16]
	add x25, x24, #8
	ldr x9, [x25]
	mov x9, x25
	str x26, [sp, #16]
	adrp x26, .READ
	add x26, x26, :lo12:.READ
	mov x0, x26
	sub sp, sp, #16
	mov x1, sp
	str x8, [sp, #144]
	str x9, [sp, #152]
	str x10, [sp, #160]
	str x11, [sp, #168]
	str x12, [sp, #176]
	str x13, [sp, #184]
	str x14, [sp, #192]
	str x15, [sp, #200]
	str x19, [sp, #208]
	str x20, [sp, #216]
	str x21, [sp, #224]
	str x22, [sp, #232]
	str x23, [sp, #240]
	str x24, [sp, #248]
	str x25, [sp, #256]
	str x26, [sp, #264]
	str x27, [sp, #272]
	str x28, [sp, #280]
	bl scanf
	ldr x8, [sp, #144]
	ldr x9, [sp, #152]
	ldr x10, [sp, #160]
	ldr x11, [sp, #168]
	ldr x12, [sp, #176]
	ldr x13, [sp, #184]
	ldr x14, [sp, #192]
	ldr x15, [sp, #200]
	ldr x19, [sp, #208]
	ldr x20, [sp, #216]
	ldr x21, [sp, #224]
	ldr x22, [sp, #232]
	ldr x23, [sp, #240]
	ldr x24, [sp, #248]
	ldr x25, [sp, #256]
	ldr x26, [sp, #264]
	ldr x27, [sp, #272]
	ldr x28, [sp, #280]
	ldr x13, [sp]
	add sp, sp, #16
	ldr x26, [sp, #32]
	mov x26, x13
	ldr x26, [sp, #64]
	ldr x26, [sp, #16]
	ldr x26, [sp, #40]
	ldr x27, [sp, #64]
	add x26, x27, #0
	str x26, [sp, #40]
	ldr x26, [sp, #48]
	ldr x26, [sp, #24]
	ldr x26, [sp, #48]
	mov x27, #1
	sub x28, x26, x27
	str x28, [sp, #56]
	str x26, [sp, #24]
	b .L13
.L15:
	ldr x12, [sp, #16]
	add x12, x12, #8
	mov x26, #0
	str x26, [x12]
	mov x12, x8
	str x0, [sp, #80]
	str x1, [sp, #88]
	str x2, [sp, #96]
	str x3, [sp, #104]
	str x4, [sp, #112]
	str x5, [sp, #120]
	str x6, [sp, #128]
	str x7, [sp, #136]
	str x8, [sp, #144]
	str x9, [sp, #152]
	str x10, [sp, #160]
	str x11, [sp, #168]
	str x12, [sp, #176]
	str x13, [sp, #184]
	str x14, [sp, #192]
	str x15, [sp, #200]
	str x19, [sp, #208]
	str x20, [sp, #216]
	str x21, [sp, #224]
	str x22, [sp, #232]
	str x23, [sp, #240]
	str x24, [sp, #248]
	str x25, [sp, #256]
	str x26, [sp, #264]
	str x27, [sp, #272]
	str x28, [sp, #280]
	mov x0, x11
	mov x1, x10
	mov x2, x12
	sub sp, sp, #0
	bl crypt
	add sp, sp, #0
	ldr x0, [sp, #80]
	ldr x1, [sp, #88]
	ldr x2, [sp, #96]
	ldr x3, [sp, #104]
	ldr x4, [sp, #112]
	ldr x5, [sp, #120]
	ldr x6, [sp, #128]
	ldr x7, [sp, #136]
	ldr x8, [sp, #144]
	ldr x9, [sp, #152]
	ldr x10, [sp, #160]
	ldr x11, [sp, #168]
	ldr x12, [sp, #176]
	ldr x13, [sp, #184]
	ldr x14, [sp, #192]
	ldr x15, [sp, #200]
	ldr x19, [sp, #208]
	ldr x20, [sp, #216]
	ldr x21, [sp, #224]
	ldr x22, [sp, #232]
	ldr x23, [sp, #240]
	ldr x24, [sp, #248]
	ldr x25, [sp, #256]
	ldr x26, [sp, #264]
	ldr x27, [sp, #272]
	ldr x28, [sp, #280]
	str x26, [sp, #16]
.L16:
	ldr x8, [sp, #16]
	mov x26, #0
	cmp x8, x26
	cset x28, ne
	mov x9, x28
	cmp x9, #1
	cset x26, eq
	mov x10, x26
	b.ne .L18
.L17:
	ldr x11, [sp, #16]
	mov x12, x11
	ldr x13, [sp, #16]
	add x14, x13, #0
	ldr x15, [x14]
	mov x15, x14
	mov x19, x15
	mov x20, x19
	adrp x26, .FMTSTR0
	add x26, x26, :lo12:.FMTSTR0
	mov x0, x26
	mov x1, x20
	str x8, [sp, #144]
	str x9, [sp, #152]
	str x10, [sp, #160]
	str x11, [sp, #168]
	str x12, [sp, #176]
	str x13, [sp, #184]
	str x14, [sp, #192]
	str x15, [sp, #200]
	str x19, [sp, #208]
	str x20, [sp, #216]
	str x21, [sp, #224]
	str x22, [sp, #232]
	str x23, [sp, #240]
	str x24, [sp, #248]
	str x25, [sp, #256]
	str x26, [sp, #264]
	str x27, [sp, #272]
	str x28, [sp, #280]
	bl printf
	ldr x8, [sp, #144]
	ldr x9, [sp, #152]
	ldr x10, [sp, #160]
	ldr x11, [sp, #168]
	ldr x12, [sp, #176]
	ldr x13, [sp, #184]
	ldr x14, [sp, #192]
	ldr x15, [sp, #200]
	ldr x19, [sp, #208]
	ldr x20, [sp, #216]
	ldr x21, [sp, #224]
	ldr x22, [sp, #232]
	ldr x23, [sp, #240]
	ldr x24, [sp, #248]
	ldr x25, [sp, #256]
	ldr x26, [sp, #264]
	ldr x27, [sp, #272]
	ldr x28, [sp, #280]
	ldr x21, [sp, #16]
	add x22, x21, #8
	ldr x23, [x22]
	mov x23, x22
	str x26, [sp, #16]
	mov x24, x12
	str x24, [sp, #72]
	ldr x26, [sp, #72]
	mov x0, x26
	bl free
	b .L16
.L18:
	mov x26, #0
	mov x25, x26
	mov x0, x25
	b .mainExit
.mainExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #304
	ret
	.size main,(.-main)

.FMTSTR0:
		.asciz "%ld\n"
		.size .PRINT, 4
