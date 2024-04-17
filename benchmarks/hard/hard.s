		.arch armv8-a
		.comm matrix,8,8
		.comm maxrange,8,8
		.text

.READ:
		.asciz "%ld"
		.size .READ, 4
		.type timesone, %function
		.global timesone
		.p2align 2

timesone:
	//Prologue
	sub sp, sp, #240
	stp x29, x30, [sp]
	mov x29, sp
.L0:
	mov x9, x0
.L1:
	mov x8, x9
	mov x26, #0
	cmp x8, x26
	cset x28, gt
	mov x8, x28
	cmp x8, #1
	cset x26, eq
	mov x10, x26
	b.ne .L3
.L2:
	adrp x26, maxrange
	add x26, x26, :lo12:maxrange
	ldr x8, [x26]
	mov x26, #1
	mul x27, x8, x26
	mov x8, x27
	adrp x26, maxrange
	add x26, x26, :lo12:maxrange
	str x8, [x26]
	mov x8, x9
	mov x26, #1
	sub x27, x8, x26
	mov x8, x27
	mov x9, x8
	b .L1
.L3:
	mov x26, #0
	mov x8, x26
	mov x0, x8
	b .timesoneExit
.timesoneExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #240
	ret
	.size timesone,(.-timesone)

		.type find, %function
		.global find
		.p2align 2

find:
	//Prologue
	sub sp, sp, #240
	stp x29, x30, [sp]
	mov x29, sp
.L4:
	mov x9, x0
	mov x8, x1
	mov x10, x8
	mov x26, #0
	cmp x10, x26
	cset x28, ne
	mov x10, x28
	cmp x10, #1
	cset x26, eq
	mov x10, x26
	b.ne .L6
.L5:
	mov x10, x8
	add x10, x10, #8
	ldr x10, [x10]
	mov x11, x9
	cmp x10, x11
	cset x27, eq
	mov x10, x27
	cmp x10, #1
	cset x26, eq
	mov x10, x26
	b.eq .L8
	b.ne .L9
.L6:
.L7:
	mov x26, #-1
	mov x27, #1
	mul x28, x26, x27
	mov x10, x28
	mov x11, x10
	mov x0, x11
	b .findExit
.L8:
	mov x11, x8
	add x11, x11, #16
	ldr x11, [x11]
	mov x10, x11
	mov x11, x10
	mov x0, x11
	b .findExit
.L9:
	add x8, x8, #0
	ldr x8, [x8]
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
	bl find
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
	mov x10, x8
	mov x8, x10
	mov x0, x8
	b .findExit
.findExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #240
	ret
	.size find,(.-find)

		.type add, %function
		.global add
		.p2align 2

add:
	//Prologue
	sub sp, sp, #240
	stp x29, x30, [sp]
	mov x29, sp
.L11:
	mov x9, x0
	mov x10, x1
	mov x11, x2
	mov x8, x11
	mov x26, #0
	cmp x8, x26
	cset x28, eq
	mov x8, x28
	cmp x8, #1
	cset x26, eq
	mov x8, x26
	b.ne .L13
.L12:
	mov x0, #24
	bl malloc
	mov x8, x0
	mov x11, x8
	mov x8, x9
	mov x12, x11
	add x12, x12, #8
	ldr x8, [x12]
	mov x8, x10
	mov x12, x11
	add x12, x12, #16
	ldr x8, [x12]
	mov x8, x11
	add x8, x8, #0
	mov x26, #0
	str x26, [x8]
	b .L14
.L13:
	mov x8, x9
	mov x9, x10
	mov x10, x11
	add x10, x10, #0
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
	mov x0, x8
	mov x1, x9
	mov x2, x10
	sub sp, sp, #0
	bl add
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
	mov x9, x11
	add x9, x9, #0
	ldr x8, [x9]
.L14:
	mov x8, x11
	mov x0, x8
	b .addExit
.addExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #240
	ret
	.size add,(.-add)

		.type factorial, %function
		.global factorial
		.p2align 2

factorial:
	//Prologue
	sub sp, sp, #240
	stp x29, x30, [sp]
	mov x29, sp
.L15:
	mov x9, x0
	mov x8, x1
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
	mov x0, #100
	sub sp, sp, #0
	bl timesone
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
	mov x10, x9
	mov x26, #1
	cmp x10, x26
	cset x28, eq
	mov x10, x28
	cmp x10, #1
	cset x26, eq
	mov x10, x26
	b.ne .L17
.L16:
	mov x26, #1
	mov x10, x26
	mov x11, x10
	mov x0, x11
	b .factorialExit
.L17:
	mov x11, x9
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
	bl find
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
	mov x12, x11
	mov x26, #-1
	mov x27, #1
	mul x28, x26, x27
	mov x13, x28
	cmp x12, x13
	cset x27, ne
	mov x12, x27
	cmp x12, #1
	cset x26, eq
	mov x12, x26
	b.ne .L20
.L19:
	mov x10, x11
	mov x11, x10
	mov x0, x11
	b .factorialExit
.L20:
.L21:
	mov x11, x9
	mov x12, x9
	mov x26, #1
	sub x27, x12, x26
	mov x12, x27
	mov x13, x8
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
	bl factorial
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
	mov x12, x11
	mov x26, #3
	sdiv x27, x12, x26
	mov x12, x27
	mov x26, #0
	cmp x12, x26
	cset x28, eq
	mov x12, x28
	cmp x12, #1
	cset x26, eq
	mov x12, x26
	b.ne .L23
.L22:
	mov x12, x11
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
	mov x1, x12
	mov x2, x8
	sub sp, sp, #0
	bl add
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
	b .L24
.L23:
.L24:
	mov x8, x11
	mov x10, x8
	mov x8, x10
	mov x0, x8
	b .factorialExit
.factorialExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #240
	ret
	.size factorial,(.-factorial)

		.type maxfactorial, %function
		.global maxfactorial
		.p2align 2

maxfactorial:
	//Prologue
	sub sp, sp, #240
	stp x29, x30, [sp]
	mov x29, sp
.L25:
	mov x9, x0
	mov x10, x1
	mov x8, x9
	add x8, x8, #0
	mov x26, #0
	str x26, [x8]
	adrp x26, matrix
	add x26, x26, :lo12:matrix
	ldr x8, [x26]
.L26:
	mov x11, x8
	mov x26, #0
	cmp x11, x26
	cset x28, ne
	mov x12, x28
	cmp x12, #1
	cset x26, eq
	mov x13, x26
	b.ne .L28
.L27:
	mov x14, x8
	add x14, x14, #8
	ldr x14, [x14]
	mov x15, x8
	add x15, x15, #0
	ldr x15, [x15]
	mov x8, x15
	b .L29
.L28:
	mov x15, x10
	adrp x26, .FMTSTR0
	add x26, x26, :lo12:.FMTSTR0
	mov x0, x26
	mov x1, x15
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
	mov x15, x26
	mov x0, x15
	b .maxfactorialExit
.L29:
	mov x15, x14
	mov x26, #0
	cmp x15, x26
	cset x28, ne
	mov x15, x28
	cmp x15, #1
	cset x26, eq
	mov x19, x26
	b.ne .L31
.L30:
	mov x15, x14
	add x15, x15, #8
	ldr x15, [x15]
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
	mov x0, x15
	mov x1, x9
	sub sp, sp, #0
	bl factorial
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
	mov x15, x14
	add x15, x15, #0
	ldr x15, [x15]
	mov x14, x15
	mov x14, x9
	mov x15, x10
	cmp x14, x15
	cset x27, gt
	mov x14, x27
	cmp x14, #1
	cset x26, eq
	mov x14, x26
	b.eq .L32
	b.ne .L33
.L31:
	b .L26
.L32:
	mov x8, x9
	mov x10, x8
	b .L34
.L33:
.L34:
	b .L29
.maxfactorialExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #240
	ret
	.size maxfactorial,(.-maxfactorial)

		.type newvalue, %function
		.global newvalue
		.p2align 2

newvalue:
	//Prologue
	sub sp, sp, #240
	stp x29, x30, [sp]
	mov x29, sp
.L35:
	mov x9, x0
	mov x10, x1
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
	mov x0, #0
	sub sp, sp, #0
	bl timesone
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
	mov x8, x9
	mul x26, x8, x10
	mov x8, x26
	adrp x26, maxrange
	add x26, x26, :lo12:maxrange
	ldr x10, [x26]
	sdiv x26, x10, x8
	mov x8, x26
	add x26, x8, x9
	mov x8, x26
	mov x0, x8
	b .newvalueExit
.newvalueExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #240
	ret
	.size newvalue,(.-newvalue)

		.type newcell, %function
		.global newcell
		.p2align 2

newcell:
	//Prologue
	sub sp, sp, #240
	stp x29, x30, [sp]
	mov x29, sp
.L36:
	mov x8, x0
	mov x10, x1
	mov x11, x2
	mov x9, x10
	mov x12, x11
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
	mov x1, x12
	sub sp, sp, #0
	bl newvalue
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
	mov x12, x8
	add x12, x12, #8
	ldr x9, [x12]
	mov x9, x11
	mov x26, #1
	cmp x9, x26
	cset x28, gt
	mov x9, x28
	cmp x9, #1
	cset x26, eq
	mov x9, x26
	b.ne .L38
.L37:
	mov x0, #16
	bl malloc
	mov x9, x0
	mov x26, #1
	sub x27, x11, x26
	mov x11, x27
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
	mov x1, x10
	mov x2, x11
	sub sp, sp, #0
	bl newcell
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
	add x10, x10, #0
	ldr x9, [x10]
	b .L39
.L38:
	mov x9, x8
	add x9, x9, #0
	mov x26, #0
	str x26, [x9]
.L39:
	mov x0, x8
	b .newcellExit
.newcellExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #240
	ret
	.size newcell,(.-newcell)

		.type newrow, %function
		.global newrow
		.p2align 2

newrow:
	//Prologue
	sub sp, sp, #240
	stp x29, x30, [sp]
	mov x29, sp
.L40:
	mov x8, x0
	mov x10, x1
	mov x9, x2
	mov x0, #16
	bl malloc
	mov x11, x0
	mov x12, x10
	mov x13, x9
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
	mov x2, x13
	sub sp, sp, #0
	bl newcell
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
	add x12, x12, #8
	ldr x11, [x12]
	mov x11, x10
	mov x26, #1
	cmp x11, x26
	cset x28, gt
	mov x11, x28
	cmp x11, #1
	cset x26, eq
	mov x11, x26
	b.ne .L42
.L41:
	mov x0, #16
	bl malloc
	mov x11, x0
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
	mov x0, x11
	mov x1, x10
	mov x2, x9
	sub sp, sp, #0
	bl newrow
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
	add x10, x10, #0
	ldr x9, [x10]
	b .L43
.L42:
	mov x9, x8
	add x9, x9, #0
	mov x26, #0
	str x26, [x9]
.L43:
	mov x0, x8
	b .newrowExit
.newrowExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #240
	ret
	.size newrow,(.-newrow)

		.type newmatrix, %function
		.global newmatrix
		.p2align 2

newmatrix:
	//Prologue
	sub sp, sp, #240
	stp x29, x30, [sp]
	mov x29, sp
.L44:
	mov x8, x0
	mov x10, x1
	mov x0, #16
	bl malloc
	mov x9, x0
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
	mov x2, x10
	sub sp, sp, #0
	bl newrow
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
	adrp x26, matrix
	add x26, x26, :lo12:matrix
	str x8, [x26]
	mov x26, #0
	mov x8, x26
	mov x0, x8
	b .newmatrixExit
.newmatrixExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #240
	ret
	.size newmatrix,(.-newmatrix)

		.type getmatrixsize, %function
		.global getmatrixsize
		.p2align 2

getmatrixsize:
	//Prologue
	sub sp, sp, #240
	stp x29, x30, [sp]
	mov x29, sp
.L45:
	mov x9, x0
	mov x8, x9
	mov x26, #0
	cmp x8, x26
	cset x28, le
	mov x8, x28
	cmp x8, #1
	cset x26, eq
	mov x8, x26
	b.ne .L47
.L46:
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
	mov x8, x9
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
	bl getmatrixsize
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
	b .L48
.L47:
	mov x8, x9
	mov x10, x8
	mov x0, x10
	b .getmatrixsizeExit
.L48:
	mov x8, x9
	mov x0, x8
	b .getmatrixsizeExit
.getmatrixsizeExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #240
	ret
	.size getmatrixsize,(.-getmatrixsize)

		.type getmaxrange, %function
		.global getmaxrange
		.p2align 2

getmaxrange:
	//Prologue
	sub sp, sp, #240
	stp x29, x30, [sp]
	mov x29, sp
.L49:
	mov x9, x0
	mov x8, x9
	mov x26, #1
	cmp x8, x26
	cset x28, le
	mov x8, x28
	cmp x8, #1
	cset x26, eq
	mov x8, x26
	b.ne .L51
.L50:
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
	mov x8, x9
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
	bl getmaxrange
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
	b .L52
.L51:
	mov x8, x9
	mov x10, x8
	mov x0, x10
	b .getmaxrangeExit
.L52:
	mov x8, x9
	mov x0, x8
	b .getmaxrangeExit
.getmaxrangeExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #240
	ret
	.size getmaxrange,(.-getmaxrange)

		.type main, %function
		.global main
		.p2align 2

main:
	//Prologue
	sub sp, sp, #240
	stp x29, x30, [sp]
	mov x29, sp
.L53:
	mov x26, #0
	mov x8, x26
	mov x26, #0
	mov x9, x26
	adrp x26, maxrange
	add x26, x26, :lo12:maxrange
	mov x27, #0
	str x27, [x26]
	mov x10, x8
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
	bl getmatrixsize
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
	mov x8, x10
	mov x10, x8
	mov x9, x10
	adrp x26, maxrange
	add x26, x26, :lo12:maxrange
	ldr x10, [x26]
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
	bl getmaxrange
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
	adrp x26, maxrange
	add x26, x26, :lo12:maxrange
	str x10, [x26]
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
	sub sp, sp, #0
	bl newmatrix
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
	mov x0, #24
	bl malloc
	mov x8, x0
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
	mov x1, #0
	sub sp, sp, #0
	bl maxfactorial
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
		.asciz "Max Factorial=%ld"
		.size .PRINT, 16
