source_filename = "extraParams4"
target triple = "x86_64-linux-gnu"
define i64 @foo(i64 %a, i64 %b, i64 %c, i64 %d, i64 %e, i64 %f, i64 %g, i64 %h, i64 %i, i64 %j, i64 %k, i64 %l, i64 %m, i64 %n, i64 %o) {
L0:
	%_ret_val = alloca i64
	%_P_a = alloca i64
	store i64 %a, i64* %_P_a
	%_P_b = alloca i64
	store i64 %b, i64* %_P_b
	%_P_c = alloca i64
	store i64 %c, i64* %_P_c
	%_P_d = alloca i64
	store i64 %d, i64* %_P_d
	%_P_e = alloca i64
	store i64 %e, i64* %_P_e
	%_P_f = alloca i64
	store i64 %f, i64* %_P_f
	%_P_g = alloca i64
	store i64 %g, i64* %_P_g
	%_P_h = alloca i64
	store i64 %h, i64* %_P_h
	%_P_i = alloca i64
	store i64 %i, i64* %_P_i
	%_P_j = alloca i64
	store i64 %j, i64* %_P_j
	%_P_k = alloca i64
	store i64 %k, i64* %_P_k
	%_P_l = alloca i64
	store i64 %l, i64* %_P_l
	%_P_m = alloca i64
	store i64 %m, i64* %_P_m
	%_P_n = alloca i64
	store i64 %n, i64* %_P_n
	%_P_o = alloca i64
	store i64 %o, i64* %_P_o
	%r0 = load i64, i64* %_P_a
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr0, i32 0, i32 0),i64 %r0)
	%r1 = load i64, i64* %_P_b
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr1, i32 0, i32 0),i64 %r1)
	%r2 = load i64, i64* %_P_c
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr2, i32 0, i32 0),i64 %r2)
	%r3 = load i64, i64* %_P_d
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr3, i32 0, i32 0),i64 %r3)
	%r4 = load i64, i64* %_P_e
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr4, i32 0, i32 0),i64 %r4)
	%r5 = load i64, i64* %_P_f
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr5, i32 0, i32 0),i64 %r5)
	%r6 = load i64, i64* %_P_g
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr6, i32 0, i32 0),i64 %r6)
	%r7 = load i64, i64* %_P_h
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr7, i32 0, i32 0),i64 %r7)
	%r8 = load i64, i64* %_P_i
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr8, i32 0, i32 0),i64 %r8)
	%r9 = load i64, i64* %_P_j
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr9, i32 0, i32 0),i64 %r9)
	%r10 = load i64, i64* %_P_k
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr10, i32 0, i32 0),i64 %r10)
	%r11 = load i64, i64* %_P_l
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr11, i32 0, i32 0),i64 %r11)
	%r12 = load i64, i64* %_P_m
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr12, i32 0, i32 0),i64 %r12)
	%r13 = load i64, i64* %_P_n
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr13, i32 0, i32 0),i64 %r13)
	%r14 = load i64, i64* %_P_o
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr14, i32 0, i32 0),i64 %r14)
	store i64 0, i64* %_ret_val
	%r15 = load i64, i64* %_ret_val
	ret i64 %r15
}

define i64 @main() {
L1:
	%_ret_val = alloca i64
	%l = alloca i64
	%m = alloca i64
	%n = alloca i64
	%o = alloca i64
	%p = alloca i64
	%q = alloca i64
	%r = alloca i64
	%s = alloca i64
	%t = alloca i64
	%u = alloca i64
	%v = alloca i64
	%w = alloca i64
	%x = alloca i64
	%y = alloca i64
	%z = alloca i64
	store i64 1, i64* %l
	store i64 2, i64* %m
	store i64 3, i64* %n
	store i64 4, i64* %o
	store i64 5, i64* %p
	store i64 6, i64* %q
	store i64 7, i64* %r
	store i64 8, i64* %s
	store i64 9, i64* %t
	store i64 10, i64* %u
	store i64 11, i64* %v
	store i64 12, i64* %w
	store i64 13, i64* %x
	store i64 14, i64* %y
	store i64 15, i64* %z
	%r16 = load i64, i64* %l
	%r17 = load i64, i64* %m
	%r18 = load i64, i64* %n
	%r19 = load i64, i64* %o
	%r20 = load i64, i64* %p
	%r21 = load i64, i64* %q
	%r22 = load i64, i64* %r
	%r23 = load i64, i64* %s
	%r24 = load i64, i64* %t
	%r25 = load i64, i64* %u
	%r26 = load i64, i64* %v
	%r27 = load i64, i64* %w
	%r28 = load i64, i64* %x
	%r29 = load i64, i64* %y
	%r30 = load i64, i64* %z
	call i64 @foo(i64 %r16, i64 %r17, i64 %r18, i64 %r19, i64 %r20, i64 %r21, i64 %r22, i64 %r23, i64 %r24, i64 %r25, i64 %r26, i64 %r27, i64 %r28, i64 %r29, i64 %r30)
	store i64 0, i64* %_ret_val
	%r31 = load i64, i64* %_ret_val
	ret i64 %r31
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.fstr0 = private unnamed_addr constant [9 x i8] c"a = %ld\0A\00", align 1
@.fstr1 = private unnamed_addr constant [9 x i8] c"b = %ld\0A\00", align 1
@.fstr2 = private unnamed_addr constant [9 x i8] c"c = %ld\0A\00", align 1
@.fstr3 = private unnamed_addr constant [9 x i8] c"d = %ld\0A\00", align 1
@.fstr4 = private unnamed_addr constant [9 x i8] c"e = %ld\0A\00", align 1
@.fstr5 = private unnamed_addr constant [9 x i8] c"f = %ld\0A\00", align 1
@.fstr6 = private unnamed_addr constant [9 x i8] c"g = %ld\0A\00", align 1
@.fstr7 = private unnamed_addr constant [9 x i8] c"h = %ld\0A\00", align 1
@.fstr8 = private unnamed_addr constant [9 x i8] c"i = %ld\0A\00", align 1
@.fstr9 = private unnamed_addr constant [9 x i8] c"j = %ld\0A\00", align 1
@.fstr10 = private unnamed_addr constant [9 x i8] c"k = %ld\0A\00", align 1
@.fstr11 = private unnamed_addr constant [9 x i8] c"l = %ld\0A\00", align 1
@.fstr12 = private unnamed_addr constant [9 x i8] c"m = %ld\0A\00", align 1
@.fstr13 = private unnamed_addr constant [9 x i8] c"n = %ld\0A\00", align 1
@.fstr14 = private unnamed_addr constant [9 x i8] c"o = %ld\0A\00", align 1