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
	sub sp, sp, #864
	stp x29, x30, [sp]
	mov x29, sp
.L0:
	mov x9, x0
	mov x8, x1
	mov x10, x2
	mov x12, x3
	mov x11, x4
	mov x13, x5
	mov x14, x6
	mov x19, x7
	ldr x20, [sp, #1088]
	ldr x21, [sp, #1096]
	ldr x22, [sp, #1104]
	ldr x23, [sp, #1112]
	ldr x15, [sp, #1120]
	ldr x25, [sp, #1128]
	str x26, [sp, #16]
	str x26, [sp, #24]
	str x26, [sp, #32]
	str x26, [sp, #40]
	str x26, [sp, #48]
	str x26, [sp, #56]
	str x26, [sp, #64]
	str x26, [sp, #72]
	str x26, [sp, #80]
	str x26, [sp, #88]
	str x26, [sp, #96]
	str x26, [sp, #104]
	str x26, [sp, #112]
	str x26, [sp, #120]
	str x26, [sp, #128]
	str x26, [sp, #136]
	str x26, [sp, #144]
	str x26, [sp, #152]
	str x26, [sp, #160]
	str x26, [sp, #168]
	str x26, [sp, #176]
	str x26, [sp, #184]
	str x26, [sp, #192]
	str x26, [sp, #200]
	str x26, [sp, #208]
	str x26, [sp, #216]
	str x26, [sp, #224]
	str x26, [sp, #232]
	str x26, [sp, #240]
	str x26, [sp, #248]
	str x26, [sp, #256]
	str x26, [sp, #264]
	str x26, [sp, #272]
	str x26, [sp, #280]
	str x26, [sp, #288]
	str x26, [sp, #296]
	add x26, x9, x8
	mov x8, x26
	mov x9, x10
	add x26, x8, x9
	mov x8, x26
	mov x9, x12
	add x26, x8, x9
	mov x8, x26
	mov x9, x11
	add x26, x8, x9
	mov x8, x26
	mov x9, x13
	add x26, x8, x9
	mov x8, x26
	mov x9, x14
	add x26, x8, x9
	mov x8, x26
	mov x9, x19
	add x26, x8, x9
	mov x8, x26
	mov x9, x20
	add x26, x8, x9
	mov x8, x26
	mov x9, x21
	add x26, x8, x9
	mov x8, x26
	mov x9, x22
	add x26, x8, x9
	mov x8, x26
	mov x9, x23
	add x26, x8, x9
	mov x8, x26
	mov x9, x15
	add x26, x8, x9
	mov x8, x26
	mov x9, x25
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #16]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #24]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #32]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #40]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #48]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #56]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #64]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #72]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #80]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #88]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #96]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #104]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #112]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #120]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #128]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #136]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #144]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #152]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #160]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #168]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #176]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #184]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #192]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #200]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #208]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #216]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #224]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #232]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #240]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #248]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #256]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #264]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #272]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #280]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #288]
	add x26, x8, x9
	mov x8, x26
	ldr x9, [sp, #296]
	add x26, x8, x9
	mov x8, x26
	mov x0, x8
	b .fooExit
.fooExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #864
	ret
	.size foo,(.-foo)

		.type main, %function
		.global main
		.p2align 2

main:
	//Prologue
	sub sp, sp, #800
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
	mov x26, #19
	str x26, [sp, #40]
	mov x26, #20
	str x26, [sp, #48]
	mov x26, #21
	str x26, [sp, #56]
	mov x26, #22
	str x26, [sp, #64]
	mov x26, #23
	str x26, [sp, #72]
	mov x26, #24
	str x26, [sp, #80]
	mov x26, #25
	str x26, [sp, #88]
	mov x26, #26
	str x26, [sp, #96]
	mov x26, #27
	str x26, [sp, #104]
	mov x26, #28
	str x26, [sp, #112]
	mov x26, #29
	str x26, [sp, #120]
	mov x26, #30
	str x26, [sp, #128]
	mov x26, #31
	str x26, [sp, #136]
	mov x26, #32
	str x26, [sp, #144]
	mov x26, #33
	str x26, [sp, #152]
	mov x26, #34
	str x26, [sp, #160]
	mov x26, #35
	str x26, [sp, #168]
	mov x26, #36
	str x26, [sp, #176]
	mov x26, #37
	str x26, [sp, #184]
	mov x26, #38
	str x26, [sp, #192]
	mov x26, #39
	str x26, [sp, #200]
	mov x26, #40
	str x26, [sp, #208]
	mov x26, #41
	str x26, [sp, #216]
	mov x26, #42
	str x26, [sp, #224]
	mov x26, #43
	str x26, [sp, #232]
	mov x26, #44
	str x26, [sp, #240]
	mov x26, #45
	str x26, [sp, #248]
	mov x26, #46
	str x26, [sp, #256]
	mov x26, #47
	str x26, [sp, #264]
	mov x26, #48
	str x26, [sp, #272]
	mov x26, #49
	str x26, [sp, #280]
	mov x26, #50
	str x26, [sp, #288]
	ldr x26, [sp, #296]
	ldr x26, [sp, #16]
	ldr x26, [sp, #304]
	ldr x26, [sp, #24]
	ldr x26, [sp, #312]
	ldr x26, [sp, #32]
	ldr x26, [sp, #320]
	ldr x26, [sp, #40]
	ldr x26, [sp, #328]
	ldr x26, [sp, #48]
	ldr x26, [sp, #336]
	ldr x26, [sp, #56]
	ldr x26, [sp, #344]
	ldr x26, [sp, #64]
	ldr x26, [sp, #352]
	ldr x26, [sp, #72]
	ldr x26, [sp, #360]
	ldr x26, [sp, #80]
	ldr x26, [sp, #368]
	ldr x26, [sp, #88]
	ldr x26, [sp, #376]
	ldr x26, [sp, #96]
	ldr x26, [sp, #384]
	ldr x26, [sp, #104]
	ldr x26, [sp, #392]
	ldr x26, [sp, #112]
	ldr x26, [sp, #400]
	ldr x26, [sp, #120]
	ldr x26, [sp, #408]
	ldr x26, [sp, #128]
	ldr x26, [sp, #416]
	ldr x26, [sp, #136]
	ldr x26, [sp, #424]
	ldr x26, [sp, #144]
	ldr x26, [sp, #432]
	ldr x26, [sp, #152]
	ldr x26, [sp, #440]
	ldr x26, [sp, #160]
	ldr x26, [sp, #448]
	ldr x26, [sp, #168]
	ldr x26, [sp, #456]
	ldr x26, [sp, #176]
	ldr x26, [sp, #464]
	ldr x26, [sp, #184]
	ldr x26, [sp, #472]
	ldr x26, [sp, #192]
	ldr x26, [sp, #480]
	ldr x26, [sp, #200]
	ldr x26, [sp, #488]
	ldr x26, [sp, #208]
	ldr x26, [sp, #496]
	ldr x26, [sp, #216]
	ldr x26, [sp, #504]
	ldr x26, [sp, #224]
	ldr x26, [sp, #512]
	ldr x26, [sp, #232]
	ldr x26, [sp, #520]
	ldr x26, [sp, #240]
	ldr x26, [sp, #528]
	ldr x26, [sp, #248]
	ldr x26, [sp, #536]
	ldr x26, [sp, #256]
	ldr x26, [sp, #544]
	ldr x26, [sp, #264]
	ldr x26, [sp, #552]
	ldr x26, [sp, #272]
	ldr x26, [sp, #560]
	ldr x26, [sp, #280]
	ldr x26, [sp, #568]
	ldr x26, [sp, #288]
	str x0, [sp, #576]
	str x1, [sp, #584]
	str x2, [sp, #592]
	str x3, [sp, #600]
	str x4, [sp, #608]
	str x5, [sp, #616]
	str x6, [sp, #624]
	str x7, [sp, #632]
	str x8, [sp, #640]
	str x9, [sp, #648]
	str x10, [sp, #656]
	str x11, [sp, #664]
	str x12, [sp, #672]
	str x13, [sp, #680]
	str x14, [sp, #688]
	str x15, [sp, #696]
	str x19, [sp, #704]
	str x20, [sp, #712]
	str x21, [sp, #720]
	str x22, [sp, #728]
	str x23, [sp, #736]
	str x24, [sp, #744]
	str x25, [sp, #752]
	str x26, [sp, #760]
	str x27, [sp, #768]
	str x28, [sp, #776]
	mov x0, x8
	mov x1, x9
	mov x2, x10
	mov x3, x11
	mov x4, x12
	mov x5, x13
	mov x6, x14
	mov x7, x15
	sub sp, sp, #336
	str x19, [sp, #784]
	str x20, [sp, #792]
	str x21, [sp, #800]
	str x22, [sp, #808]
	str x23, [sp, #816]
	str x24, [sp, #824]
	str x25, [sp, #832]
	ldr x26, [sp, #296]
	str x26, [sp, #840]
	ldr x26, [sp, #304]
	str x26, [sp, #848]
	ldr x26, [sp, #312]
	str x26, [sp, #856]
	ldr x26, [sp, #320]
	str x26, [sp, #864]
	ldr x26, [sp, #328]
	str x26, [sp, #872]
	ldr x26, [sp, #336]
	str x26, [sp, #880]
	ldr x26, [sp, #344]
	str x26, [sp, #888]
	ldr x26, [sp, #352]
	str x26, [sp, #896]
	ldr x26, [sp, #360]
	str x26, [sp, #904]
	ldr x26, [sp, #368]
	str x26, [sp, #912]
	ldr x26, [sp, #376]
	str x26, [sp, #920]
	ldr x26, [sp, #384]
	str x26, [sp, #928]
	ldr x26, [sp, #392]
	str x26, [sp, #936]
	ldr x26, [sp, #400]
	str x26, [sp, #944]
	ldr x26, [sp, #408]
	str x26, [sp, #952]
	ldr x26, [sp, #416]
	str x26, [sp, #960]
	ldr x26, [sp, #424]
	str x26, [sp, #968]
	ldr x26, [sp, #432]
	str x26, [sp, #976]
	ldr x26, [sp, #440]
	str x26, [sp, #984]
	ldr x26, [sp, #448]
	str x26, [sp, #992]
	ldr x26, [sp, #456]
	str x26, [sp, #1000]
	ldr x26, [sp, #464]
	str x26, [sp, #1008]
	ldr x26, [sp, #472]
	str x26, [sp, #1016]
	ldr x26, [sp, #480]
	str x26, [sp, #1024]
	ldr x26, [sp, #488]
	str x26, [sp, #1032]
	ldr x26, [sp, #496]
	str x26, [sp, #1040]
	ldr x26, [sp, #504]
	str x26, [sp, #1048]
	ldr x26, [sp, #512]
	str x26, [sp, #1056]
	ldr x26, [sp, #520]
	str x26, [sp, #1064]
	ldr x26, [sp, #528]
	str x26, [sp, #1072]
	ldr x26, [sp, #536]
	str x26, [sp, #1080]
	ldr x26, [sp, #544]
	str x26, [sp, #1088]
	ldr x26, [sp, #552]
	str x26, [sp, #1096]
	ldr x26, [sp, #560]
	str x26, [sp, #1104]
	ldr x26, [sp, #568]
	str x26, [sp, #1112]
	bl foo
	add sp, sp, #336
	mov x16, x0
	ldr x0, [sp, #576]
	ldr x1, [sp, #584]
	ldr x2, [sp, #592]
	ldr x3, [sp, #600]
	ldr x4, [sp, #608]
	ldr x5, [sp, #616]
	ldr x6, [sp, #624]
	ldr x7, [sp, #632]
	ldr x8, [sp, #640]
	ldr x9, [sp, #648]
	ldr x10, [sp, #656]
	ldr x11, [sp, #664]
	ldr x12, [sp, #672]
	ldr x13, [sp, #680]
	ldr x14, [sp, #688]
	ldr x15, [sp, #696]
	ldr x19, [sp, #704]
	ldr x20, [sp, #712]
	ldr x21, [sp, #720]
	ldr x22, [sp, #728]
	ldr x23, [sp, #736]
	ldr x24, [sp, #744]
	ldr x25, [sp, #752]
	ldr x26, [sp, #760]
	ldr x27, [sp, #768]
	ldr x28, [sp, #776]
	mov x8, x16
	adrp x26, .FMTSTR0
	add x26, x26, :lo12:.FMTSTR0
	mov x0, x26
	mov x1, x8
	str x8, [sp, #640]
	str x9, [sp, #648]
	str x10, [sp, #656]
	str x11, [sp, #664]
	str x12, [sp, #672]
	str x13, [sp, #680]
	str x14, [sp, #688]
	str x15, [sp, #696]
	str x19, [sp, #704]
	str x20, [sp, #712]
	str x21, [sp, #720]
	str x22, [sp, #728]
	str x23, [sp, #736]
	str x24, [sp, #744]
	str x25, [sp, #752]
	str x26, [sp, #760]
	str x27, [sp, #768]
	str x28, [sp, #776]
	bl printf
	ldr x8, [sp, #640]
	ldr x9, [sp, #648]
	ldr x10, [sp, #656]
	ldr x11, [sp, #664]
	ldr x12, [sp, #672]
	ldr x13, [sp, #680]
	ldr x14, [sp, #688]
	ldr x15, [sp, #696]
	ldr x19, [sp, #704]
	ldr x20, [sp, #712]
	ldr x21, [sp, #720]
	ldr x22, [sp, #728]
	ldr x23, [sp, #736]
	ldr x24, [sp, #744]
	ldr x25, [sp, #752]
	ldr x26, [sp, #760]
	ldr x27, [sp, #768]
	ldr x28, [sp, #776]
	mov x26, #0
	mov x8, x26
	mov x0, x8
	b .mainExit
.mainExit:
	//Epilogue
	ldp x29, x30, [sp]
	add sp, sp, #800
	ret
	.size main,(.-main)

.FMTSTR0:
		.asciz "sum = %ld\n"
		.size .PRINT, 10
