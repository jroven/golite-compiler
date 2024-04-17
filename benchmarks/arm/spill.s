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
	sub sp, sp, #256
	stp x29, x30, [sp]
	mov x29, sp
.L0:
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
	mov x26, #11
	mov x21, x26
	mov x26, #12
	mov x22, x26
	mov x26, #13
	mov x23, x26
	mov x26, #14
	mov x24, x26
	mov x26, #15
	mov x25, x26
	mov x26, #16
	str x26, [sp, #16]
	mov x26, #17
	str x26, [sp, #24]
	mov x26, #18
	str x26, [sp, #32]
	adrp x26, .FMTSTR0
	add x26, x26, :lo12:.FMTSTR0
	mov x0, x26
	mov x1, x8
	str x8, [sp, #104]
	str x9, [sp, #112]
	str x10, [sp, #120]
	str x11, [sp, #128]
	str x12, [sp, #136]
	str x13, [sp, #144]
	str x14, [sp, #152]
	str x15, [sp, #160]
	str x19, [sp, #168]
	str x20, [sp, #176]
	str x21, [sp, #184]
	str x22, [sp, #192]
	str x23, [sp, #200]
	str x24, [sp, #208]
	str x25, [sp, #216]
	str x26, [sp, #224]
	str x27, [sp, #232]
	str x28, [sp, #240]
	bl printf
	ldr x8, [sp, #104]
	ldr x9, [sp, #112]
	ldr x10, [sp, #120]
	ldr x11, [sp, #128]
	ldr x12, [sp, #136]
	ldr x13, [sp, #144]
	ldr x14, [sp, #152]
	ldr x15, [sp, #160]
	ldr x19, [sp, #168]
	ldr x20, [sp, #176]
	ldr x21, [sp, #184]
	ldr x22, [sp, #192]
	ldr x23, [sp, #200]
	ldr x24, [sp, #208]
	ldr x25, [sp, #216]
	ldr x26, [sp, #224]
	ldr x27, [sp, #232]
	ldr x28, [sp, #240]
	mov x8, x9
	adrp x26, .FMTSTR1
	add x26, x26, :lo12:.FMTSTR1
	mov x0, x26
	mov x1, x8
	str x8, [sp, #104]
	str x9, [sp, #112]
	str x10, [sp, #120]
	str x11, [sp, #128]
	str x12, [sp, #136]
	str x13, [sp, #144]
	str x14, [sp, #152]
	str x15, [sp, #160]
	str x19, [sp, #168]
	str x20, [sp, #176]
	str x21, [sp, #184]
	str x22, [sp, #192]
	str x23, [sp, #200]
	str x24, [sp, #208]
	str x25, [sp, #216]
	str x26, [sp, #224]
	str x27, [sp, #232]
	str x28, [sp, #240]
	bl printf
	ldr x8, [sp, #104]
	ldr x9, [sp, #112]
	ldr x10, [sp, #120]
	ldr x11, [sp, #128]
	ldr x12, [sp, #136]
	ldr x13, [sp, #144]
	ldr x14, [sp, #152]
	ldr x15, [sp, #160]
	ldr x19, [sp, #168]
	ldr x20, [sp, #176]
	ldr x21, [sp, #184]
	ldr x22, [sp, #192]
	ldr x23, [sp, #200]
	ldr x24, [sp, #208]
	ldr x25, [sp, #216]
	ldr x26, [sp, #224]
	ldr x27, [sp, #232]
	ldr x28, [sp, #240]
	mov x8, x10
	adrp x26, .FMTSTR2
	add x26, x26, :lo12:.FMTSTR2
	mov x0, x26
	mov x1, x8
	str x8, [sp, #104]
	str x9, [sp, #112]
	str x10, [sp, #120]
	str x11, [sp, #128]
	str x12, [sp, #136]
	str x13, [sp, #144]
	str x14, [sp, #152]
	str x15, [sp, #160]
	str x19, [sp, #168]
	str x20, [sp, #176]
	str x21, [sp, #184]
	str x22, [sp, #192]
	str x23, [sp, #200]
	str x24, [sp, #208]
	str x25, [sp, #216]
	str x26, [sp, #224]
	str x27, [sp, #232]
	str x28, [sp, #240]
	bl printf
	ldr x8, [sp, #104]
	ldr x9, [sp, #112]
	ldr x10, [sp, #120]
	ldr x11, [sp, #128]
	ldr x12, [sp, #136]
	ldr x13, [sp, #144]
	ldr x14, [sp, #152]
	ldr x15, [sp, #160]
	ldr x19, [sp, #168]
	ldr x20, [sp, #176]
	ldr x21, [sp, #184]
	ldr x22, [sp, #192]
	ldr x23, [sp, #200]
	ldr x24, [sp, #208]
	ldr x25, [sp, #216]
	ldr x26, [sp, #224]
	ldr x27, [sp, #232]
	ldr x28, [sp, #240]
	mov x8, x11
	adrp x26, .FMTSTR3
	add x26, x26, :lo12:.FMTSTR3
	mov x0, x26
	mov x1, x8
	str x8, [sp, #104]
	str x9, [sp, #112]
	str x10, [sp, #120]
	str x11, [sp, #128]
	str x12, [sp, #136]
	str x13, [sp, #144]
	str x14, [sp, #152]
	str x15, [sp, #160]
	str x19, [sp, #168]
	str x20, [sp, #176]
	str x21, [sp, #184]
	str x22, [sp, #192]
	str x23, [sp, #200]
	str x24, [sp, #208]
	str x25, [sp, #216]
	str x26, [sp, #224]
	str x27, [sp, #232]
	str x28, [sp, #240]
	bl printf
	ldr x8, [sp, #104]
	ldr x9, [sp, #112]
	ldr x10, [sp, #120]
	ldr x11, [sp, #128]
	ldr x12, [sp, #136]
	ldr x13, [sp, #144]
	ldr x14, [sp, #152]
	ldr x15, [sp, #160]
	ldr x19, [sp, #168]
	ldr x20, [sp, #176]
	ldr x21, [sp, #184]
	ldr x22, [sp, #192]
	ldr x23, [sp, #200]
	ldr x24, [sp, #208]
	ldr x25, [sp, #216]
	ldr x26, [sp, #224]
	ldr x27, [sp, #232]
	ldr x28, [sp, #240]
	mov x8, x12
	adrp x26, .FMTSTR4
	add x26, x26, :lo12:.FMTSTR4
	mov x0, x26
	mov x1, x8
	str x8, [sp, #104]
	str x9, [sp, #112]
	str x10, [sp, #120]
	str x11, [sp, #128]
	str x12, [sp, #136]
	str x13, [sp, #144]
	str x14, [sp, #152]
	str x15, [sp, #160]
	str x19, [sp, #168]
	str x20, [sp, #176]
	str x21, [sp, #184]
	str x22, [sp, #192]
	str x23, [sp, #200]
	str x24, [sp, #208]
	str x25, [sp, #216]
	str x26, [sp, #224]
	str x27, [sp, #232]
	str x28, [sp, #240]
	bl printf
	ldr x8, [sp, #104]
	ldr x9, [sp, #112]
	ldr x10, [sp, #120]
	ldr x11, [sp, #128]
	ldr x12, [sp, #136]
	ldr x13, [sp, #144]
	ldr x14, [sp, #152]
	ldr x15, [sp, #160]
	ldr x19, [sp, #168]
	ldr x20, [sp, #176]
	ldr x21, [sp, #184]
	ldr x22, [sp, #192]
	ldr x23, [sp, #200]
	ldr x24, [sp, #208]
	ldr x25, [sp, #216]
	ldr x26, [sp, #224]
	ldr x27, [sp, #232]
	ldr x28, [sp, #240]
	mov x8, x13
	adrp x26, .FMTSTR5
	add x26, x26, :lo12:.FMTSTR5
	mov x0, x26
	mov x1, x8
	str x8, [sp, #104]
	str x9, [sp, #112]
	str x10, [sp, #120]
	str x11, [sp, #128]
	str x12, [sp, #136]
	str x13, [sp, #144]
	str x14, [sp, #152]
	str x15, [sp, #160]
	str x19, [sp, #168]
	str x20, [sp, #176]
	str x21, [sp, #184]
	str x22, [sp, #192]
	str x23, [sp, #200]
	str x24, [sp, #208]
	str x25, [sp, #216]
	str x26, [sp, #224]
	str x27, [sp, #232]
	str x28, [sp, #240]
	bl printf
	ldr x8, [sp, #104]
	ldr x9, [sp, #112]
	ldr x10, [sp, #120]
	ldr x11, [sp, #128]
	ldr x12, [sp, #136]
	ldr x13, [sp, #144]
	ldr x14, [sp, #152]
	ldr x15, [sp, #160]
	ldr x19, [sp, #168]
	ldr x20, [sp, #176]
	ldr x21, [sp, #184]
	ldr x22, [sp, #192]
	ldr x23, [sp, #200]
	ldr x24, [sp, #208]
	ldr x25, [sp, #216]
	ldr x26, [sp, #224]
	ldr x27, [sp, #232]
	ldr x28, [sp, #240]
	mov x8, x14
	adrp x26, .FMTSTR6
	add x26, x26, :lo12:.FMTSTR6
	mov x0, x26
	mov x1, x8
	str x8, [sp, #104]
	str x9, [sp, #112]
	str x10, [sp, #120]
	str x11, [sp, #128]
	str x12, [sp, #136]
	str x13, [sp, #144]
	str x14, [sp, #152]
	str x15, [sp, #160]
	str x19, [sp, #168]
	str x20, [sp, #176]
	str x21, [sp, #184]
	str x22, [sp, #192]
	str x23, [sp, #200]
	str x24, [sp, #208]
	str x25, [sp, #216]
	str x26, [sp, #224]
	str x27, [sp, #232]
	str x28, [sp, #240]
	bl printf
	ldr x8, [sp, #104]
	ldr x9, [sp, #112]
	ldr x10, [sp, #120]
	ldr x11, [sp, #128]
	ldr x12, [sp, #136]
	ldr x13, [sp, #144]
	ldr x14, [sp, #152]
	ldr x15, [sp, #160]
	ldr x19, [sp, #168]
	ldr x20, [sp, #176]
	ldr x21, [sp, #184]
	ldr x22, [sp, #192]
	ldr x23, [sp, #200]
	ldr x24, [sp, #208]
	ldr x25, [sp, #216]
	ldr x26, [sp, #224]
	ldr x27, [sp, #232]
	ldr x28, [sp, #240]
	mov x8, x15
	adrp x26, .FMTSTR7
	add x26, x26, :lo12:.FMTSTR7
	mov x0, x26
	mov x1, x8
	str x8, [sp, #104]
	str x9, [sp, #112]
	str x10, [sp, #120]
	str x11, [sp, #128]
	str x12, [sp, #136]
	str x13, [sp, #144]
	str x14, [sp, #152]
	str x15, [sp, #160]
	str x19, [sp, #168]
	str x20, [sp, #176]
	str x21, [sp, #184]
	str x22, [sp, #192]
	str x23, [sp, #200]
	str x24, [sp, #208]
	str x25, [sp, #216]
	str x26, [sp, #224]
	str x27, [sp, #232]
	str x28, [sp, #240]
	bl printf
	ldr x8, [sp, #104]
	ldr x9, [sp, #112]
	ldr x10, [sp, #120]
	ldr x11, [sp, #128]
	ldr x12, [sp, #136]
	ldr x13, [sp, #144]
	ldr x14, [sp, #152]
	ldr x15, [sp, #160]
	ldr x19, [sp, #168]
	ldr x20, [sp, #176]
	ldr x21, [sp, #184]
	ldr x22, [sp, #192]
	ldr x23, [sp, #200]
	ldr x24, [sp, #208]
	ldr x25, [sp, #216]
	ldr x26, [sp, #224]
	ldr x27, [sp, #232]
	ldr x28, [sp, #240]
	mov x8, x19
	adrp x26, .FMTSTR8
	add x26, x26, :lo12:.FMTSTR8
	mov x0, x26
	mov x1, x8
	str x8, [sp, #104]
	str x9, [sp, #112]
	str x10, [sp, #120]
	str x11, [sp, #128]
	str x12, [sp, #136]
	str x13, [sp, #144]
	str x14, [sp, #152]
	str x15, [sp, #160]
	str x19, [sp, #168]
	str x20, [sp, #176]
	str x21, [sp, #184]
	str x22, [sp, #192]
	str x23, [sp, #200]
	str x24, [sp, #208]
	str x25, [sp, #216]
	str x26, [sp, #224]
	str x27, [sp, #232]
	str x28, [sp, #240]
	bl printf
	ldr x8, [sp, #104]
	ldr x9, [sp, #112]
	ldr x10, [sp, #120]
	ldr x11, [sp, #128]
	ldr x12, [sp, #136]
	ldr x13, [sp, #144]
	ldr x14, [sp, #152]
	ldr x15, [sp, #160]
	ldr x19, [sp, #168]
	ldr x20, [sp, #176]
	ldr x21, [sp, #184]
	ldr x22, [sp, #192]
	ldr x23, [sp, #200]
	ldr x24, [sp, #208]
	ldr x25, [sp, #216]
	ldr x26, [sp, #224]
	ldr x27, [sp, #232]
	ldr x28, [sp, #240]
	mov x8, x20
	adrp x26, .FMTSTR9
	add x26, x26, :lo12:.FMTSTR9
	mov x0, x26
	mov x1, x8
	str x8, [sp, #104]
	str x9, [sp, #112]
	str x10, [sp, #120]
	str x11, [sp, #128]
	str x12, [sp, #136]
	str x13, [sp, #144]
	str x14, [sp, #152]
	str x15, [sp, #160]
	str x19, [sp, #168]
	str x20, [sp, #176]
	str x21, [sp, #184]
	str x22, [sp, #192]
	str x23, [sp, #200]
	str x24, [sp, #208]
	str x25, [sp, #216]
	str x26, [sp, #224]
	str x27, [sp, #232]
	str x28, [sp, #240]
	bl printf
	ldr x8, [sp, #104]
	ldr x9, [sp, #112]
	ldr x10, [sp, #120]
	ldr x11, [sp, #128]
	ldr x12, [sp, #136]
	ldr x13, [sp, #144]
	ldr x14, [sp, #152]
	ldr x15, [sp, #160]
	ldr x19, [sp, #168]
	ldr x20, [sp, #176]
	ldr x21, [sp, #184]
	ldr x22, [sp, #192]
	ldr x23, [sp, #200]
	ldr x24, [sp, #208]
	ldr x25, [sp, #216]
	ldr x26, [sp, #224]
	ldr x27, [sp, #232]
	ldr x28, [sp, #240]
	mov x8, x21
	adrp x26, .FMTSTR10
	add x26, x26, :lo12:.FMTSTR10
	mov x0, x26
	mov x1, x8
	str x8, [sp, #104]
	str x9, [sp, #112]
	str x10, [sp, #120]
	str x11, [sp, #128]
	str x12, [sp, #136]
	str x13, [sp, #144]
	str x14, [sp, #152]
	str x15, [sp, #160]
	str x19, [sp, #168]
	str x20, [sp, #176]
	str x21, [sp, #184]
	str x22, [sp, #192]
	str x23, [sp, #200]
	str x24, [sp, #208]
	str x25, [sp, #216]
	str x26, [sp, #224]
	str x27, [sp, #232]
	str x28, [sp, #240]
	bl printf
	ldr x8, [sp, #104]
	ldr x9, [sp, #112]
	ldr x10, [sp, #120]
	ldr x11, [sp, #128]
	ldr x12, [sp, #136]
	ldr x13, [sp, #144]
	ldr x14, [sp, #152]
	ldr x15, [sp, #160]
	ldr x19, [sp, #168]
	ldr x20, [sp, #176]
	ldr x21, [sp, #184]
	ldr x22, [sp, #192]
	ldr x23, [sp, #200]
	ldr x24, [sp, #208]
	ldr x25, [sp, #216]
	ldr x26, [sp, #224]
	ldr x27, [sp, #232]
	ldr x28, [sp, #240]
	mov x8, x22
	adrp x26, .FMTSTR11
	add x26, x26, :lo12:.FMTSTR11
	mov x0, x26
	mov x1, x8
	str x8, [sp, #104]
	str x9, [sp, #112]
	str x10, [sp, #120]
	str x11, [sp, #128]
	str x12, [sp, #136]
	str x13, [sp, #144]
	str x14, [sp, #152]
	str x15, [sp, #160]
	str x19, [sp, #168]
	str x20, [sp, #176]
	str x21, [sp, #184]
	str x22, [sp, #192]
	str x23, [sp, #200]
	str x24, [sp, #208]
	str x25, [sp, #216]
	str x26, [sp, #224]
	str x27, [sp, #232]
	str x28, [sp, #240]
	bl printf
	ldr x8, [sp, #104]
	ldr x9, [sp, #112]
	ldr x10, [sp, #120]
	ldr x11, [sp, #128]
	ldr x12, [sp, #136]
	ldr x13, [sp, #144]
	ldr x14, [sp, #152]
	ldr x15, [sp, #160]
	ldr x19, [sp, #168]
	ldr x20, [sp, #176]
	ldr x21, [sp, #184]
	ldr x22, [sp, #192]
	ldr x23, [sp, #200]
	ldr x24, [sp, #208]
	ldr x25, [sp, #216]
	ldr x26, [sp, #224]
	ldr x27, [sp, #232]
	ldr x28, [sp, #240]
	mov x8, x23
	adrp x26, .FMTSTR12
	add x26, x26, :lo12:.FMTSTR12
	mov x0, x26
	mov x1, x8
	str x8, [sp, #104]
	str x9, [sp, #112]
	str x10, [sp, #120]
	str x11, [sp, #128]
	str x12, [sp, #136]
	str x13, [sp, #144]
	str x14, [sp, #152]
	str x15, [sp, #160]
	str x19, [sp, #168]
	str x20, [sp, #176]
	str x21, [sp, #184]
	str x22, [sp, #192]
	str x23, [sp, #200]
	str x24, [sp, #208]
	str x25, [sp, #216]
	str x26, [sp, #224]
	str x27, [sp, #232]
	str x28, [sp, #240]
	bl printf
	ldr x8, [sp, #104]
	ldr x9, [sp, #112]
	ldr x10, [sp, #120]
	ldr x11, [sp, #128]
	ldr x12, [sp, #136]
	ldr x13, [sp, #144]
	ldr x14, [sp, #152]
	ldr x15, [sp, #160]
	ldr x19, [sp, #168]
	ldr x20, [sp, #176]
	ldr x21, [sp, #184]
	ldr x22, [sp, #192]
	ldr x23, [sp, #200]
	ldr x24, [sp, #208]
	ldr x25, [sp, #216]
	ldr x26, [sp, #224]
	ldr x27, [sp, #232]
	ldr x28, [sp, #240]
	mov x8, x24
	adrp x26, .FMTSTR13
	add x26, x26, :lo12:.FMTSTR13
	mov x0, x26
	mov x1, x8
	str x8, [sp, #104]
	str x9, [sp, #112]
	str x10, [sp, #120]
	str x11, [sp, #128]
	str x12, [sp, #136]
	str x13, [sp, #144]
	str x14, [sp, #152]
	str x15, [sp, #160]
	str x19, [sp, #168]
	str x20, [sp, #176]
	str x21, [sp, #184]
	str x22, [sp, #192]
	str x23, [sp, #200]
	str x24, [sp, #208]
	str x25, [sp, #216]
	str x26, [sp, #224]
	str x27, [sp, #232]
	str x28, [sp, #240]
	bl printf
	ldr x8, [sp, #104]
	ldr x9, [sp, #112]
	ldr x10, [sp, #120]
	ldr x11, [sp, #128]
	ldr x12, [sp, #136]
	ldr x13, [sp, #144]
	ldr x14, [sp, #152]
	ldr x15, [sp, #160]
	ldr x19, [sp, #168]
	ldr x20, [sp, #176]
	ldr x21, [sp, #184]
	ldr x22, [sp, #192]
	ldr x23, [sp, #200]
	ldr x24, [sp, #208]
	ldr x25, [sp, #216]
	ldr x26, [sp, #224]
	ldr x27, [sp, #232]
	ldr x28, [sp, #240]
	mov x8, x25
	adrp x26, .FMTSTR14
	add x26, x26, :lo12:.FMTSTR14
	mov x0, x26
	mov x1, x8
	str x8, [sp, #104]
	str x9, [sp, #112]
	str x10, [sp, #120]
	str x11, [sp, #128]
	str x12, [sp, #136]
	str x13, [sp, #144]
	str x14, [sp, #152]
	str x15, [sp, #160]
	str x19, [sp, #168]
	str x20, [sp, #176]
	str x21, [sp, #184]
	str x22, [sp, #192]
	str x23, [sp, #200]
	str x24, [sp, #208]
	str x25, [sp, #216]
	str x26, [sp, #224]
	str x27, [sp, #232]
	str x28, [sp, #240]
	bl printf
	ldr x8, [sp, #104]
	ldr x9, [sp, #112]
	ldr x10, [sp, #120]
	ldr x11, [sp, #128]
	ldr x12, [sp, #136]
	ldr x13, [sp, #144]
	ldr x14, [sp, #152]
	ldr x15, [sp, #160]
	ldr x19, [sp, #168]
	ldr x20, [sp, #176]
	ldr x21, [sp, #184]
	ldr x22, [sp, #192]
	ldr x23, [sp, #200]
	ldr x24, [sp, #208]
	ldr x25, [sp, #216]
	ldr x26, [sp, #224]
	ldr x27, [sp, #232]
	ldr x28, [sp, #240]
	ldr x8, [sp, #16]
	adrp x26, .FMTSTR15
	add x26, x26, :lo12:.FMTSTR15
	mov x0, x26
	mov x1, x8
	str x8, [sp, #104]
	str x9, [sp, #112]
	str x10, [sp, #120]
	str x11, [sp, #128]
	str x12, [sp, #136]
	str x13, [sp, #144]
	str x14, [sp, #152]
	str x15, [sp, #160]
	str x19, [sp, #168]
	str x20, [sp, #176]
	str x21, [sp, #184]
	str x22, [sp, #192]
	str x23, [sp, #200]
	str x24, [sp, #208]
	str x25, [sp, #216]
	str x26, [sp, #224]
	str x27, [sp, #232]
	str x28, [sp, #240]
	bl printf
	ldr x8, [sp, #104]
	ldr x9, [sp, #112]
	ldr x10, [sp, #120]
	ldr x11, [sp, #128]
	ldr x12, [sp, #136]
	ldr x13, [sp, #144]
	ldr x14, [sp, #152]
	ldr x15, [sp, #160]
	ldr x19, [sp, #168]
	ldr x20, [sp, #176]
	ldr x21, [sp, #184]
	ldr x22, [sp, #192]
	ldr x23, [sp, #200]
	ldr x24, [sp, #208]
	ldr x25, [sp, #216]
	ldr x26, [sp, #224]
	ldr x27, [sp, #232]
	ldr x28, [sp, #240]
	ldr x8, [sp, #24]
	adrp x26, .FMTSTR16
	add x26, x26, :lo12:.FMTSTR16
	mov x0, x26
	mov x1, x8
	str x8, [sp, #104]
	str x9, [sp, #112]
	str x10, [sp, #120]
	str x11, [sp, #128]
	str x12, [sp, #136]
	str x13, [sp, #144]
	str x14, [sp, #152]
	str x15, [sp, #160]
	str x19, [sp, #168]
	str x20, [sp, #176]
	str x21, [sp, #184]
	str x22, [sp, #192]
	str x23, [sp, #200]
	str x24, [sp, #208]
	str x25, [sp, #216]
	str x26, [sp, #224]
	str x27, [sp, #232]
	str x28, [sp, #240]
	bl printf
	ldr x8, [sp, #104]
	ldr x9, [sp, #112]
	ldr x10, [sp, #120]
	ldr x11, [sp, #128]
	ldr x12, [sp, #136]
	ldr x13, [sp, #144]
	ldr x14, [sp, #152]
	ldr x15, [sp, #160]
	ldr x19, [sp, #168]
	ldr x20, [sp, #176]
	ldr x21, [sp, #184]
	ldr x22, [sp, #192]
	ldr x23, [sp, #200]
	ldr x24, [sp, #208]
	ldr x25, [sp, #216]
	ldr x26, [sp, #224]
	ldr x27, [sp, #232]
	ldr x28, [sp, #240]
	ldr x8, [sp, #32]
	adrp x26, .FMTSTR17
	add x26, x26, :lo12:.FMTSTR17
	mov x0, x26
	mov x1, x8
	str x8, [sp, #104]
	str x9, [sp, #112]
	str x10, [sp, #120]
	str x11, [sp, #128]
	str x12, [sp, #136]
	str x13, [sp, #144]
	str x14, [sp, #152]
	str x15, [sp, #160]
	str x19, [sp, #168]
	str x20, [sp, #176]
	str x21, [sp, #184]
	str x22, [sp, #192]
	str x23, [sp, #200]
	str x24, [sp, #208]
	str x25, [sp, #216]
	str x26, [sp, #224]
	str x27, [sp, #232]
	str x28, [sp, #240]
	bl printf
	ldr x8, [sp, #104]
	ldr x9, [sp, #112]
	ldr x10, [sp, #120]
	ldr x11, [sp, #128]
	ldr x12, [sp, #136]
	ldr x13, [sp, #144]
	ldr x14, [sp, #152]
	ldr x15, [sp, #160]
	ldr x19, [sp, #168]
	ldr x20, [sp, #176]
	ldr x21, [sp, #184]
	ldr x22, [sp, #192]
	ldr x23, [sp, #200]
	ldr x24, [sp, #208]
	ldr x25, [sp, #216]
	ldr x26, [sp, #224]
	ldr x27, [sp, #232]
	ldr x28, [sp, #240]
	mov x26, #0
	mov x8, x26
	mov x0, x8
	b .mainExit
.mainExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #256
	ret
	.size main,(.-main)

.FMTSTR0:
		.asciz "a = %ld\n"
		.size .PRINT, 8
.FMTSTR1:
		.asciz "b = %ld\n"
		.size .PRINT, 8
.FMTSTR2:
		.asciz "c = %ld\n"
		.size .PRINT, 8
.FMTSTR3:
		.asciz "d = %ld\n"
		.size .PRINT, 8
.FMTSTR4:
		.asciz "e = %ld\n"
		.size .PRINT, 8
.FMTSTR5:
		.asciz "f = %ld\n"
		.size .PRINT, 8
.FMTSTR6:
		.asciz "g = %ld\n"
		.size .PRINT, 8
.FMTSTR7:
		.asciz "h = %ld\n"
		.size .PRINT, 8
.FMTSTR8:
		.asciz "i = %ld\n"
		.size .PRINT, 8
.FMTSTR9:
		.asciz "j = %ld\n"
		.size .PRINT, 8
.FMTSTR10:
		.asciz "k = %ld\n"
		.size .PRINT, 8
.FMTSTR11:
		.asciz "l = %ld\n"
		.size .PRINT, 8
.FMTSTR12:
		.asciz "m = %ld\n"
		.size .PRINT, 8
.FMTSTR13:
		.asciz "n = %ld\n"
		.size .PRINT, 8
.FMTSTR14:
		.asciz "o = %ld\n"
		.size .PRINT, 8
.FMTSTR15:
		.asciz "p = %ld\n"
		.size .PRINT, 8
.FMTSTR16:
		.asciz "q = %ld\n"
		.size .PRINT, 8
.FMTSTR17:
		.asciz "r = %ld\n"
		.size .PRINT, 8
