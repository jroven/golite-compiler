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
	mov x26, #10
	mov x8, x26
	mov x9, x8
	adrp x26, .FMTSTR0
	add x26, x26, :lo12:.FMTSTR0
	mov x0, x26
	mov x1, x9
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
	b .L1
.L1:
	mov x9, x8
	mov x26, #0
	cmp x9, x26
	cset x28, gt
	mov x10, x28
	cmp x10, #1
	cset x26, eq
	mov x11, x26
	b.eq .L2
	b.ne .L3
.L2:
	mov x12, x8
	mov x26, #1
	sub x27, x12, x26
	mov x13, x27
	mov x8, x13
	mov x14, x8
	mov x26, #7
	cmp x14, x26
	cset x28, eq
	mov x15, x28
	cmp x15, #1
	cset x26, eq
	mov x19, x26
	b.eq .L4
	b.ne .L5
.L3:
	mov x20, x8
	adrp x26, .FMTSTR3
	add x26, x26, :lo12:.FMTSTR3
	mov x0, x26
	mov x1, x20
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
	mov x20, x26
	mov x20, x20
	mov x0, x20
	b .mainExit
.L4:
	mov x9, x8
	adrp x26, .FMTSTR1
	add x26, x26, :lo12:.FMTSTR1
	mov x0, x26
	mov x1, x9
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
	mov x10, x26
	b .L7
.L5:
	b .L6
.L6:
	b .L1
.L7:
	mov x8, x10
	mov x26, #3
	cmp x8, x26
	cset x28, lt
	mov x9, x28
	cmp x9, #1
	cset x26, eq
	mov x11, x26
	b.eq .L8
	b.ne .L9
.L8:
	adrp x26, .FMTSTR2
	add x26, x26, :lo12:.FMTSTR2
	mov x0, x26
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
	mov x12, x10
	mov x26, #1
	add x27, x12, x26
	mov x13, x27
	mov x10, x13
	b .L7
.L9:
	b .L6
.mainExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #240
	ret
	.size main,(.-main)

.FMTSTR0:
		.asciz "About to enter first for loop, a = %ld\n"
		.size .PRINT, 39
.FMTSTR1:
		.asciz "Outside for loop, a = %ld\n"
		.size .PRINT, 26
.FMTSTR2:
		.asciz "Inside for loop, a = %ld\n"
		.size .PRINT, 25
.FMTSTR3:
		.asciz "Nested for loop!\n"
		.size .PRINT, 17
