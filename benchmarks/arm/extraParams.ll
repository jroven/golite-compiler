source_filename = "extraParams"
target triple = "x86_64-linux-gnu"
define i64 @foo(i64 %a, i64 %b, i64 %c, i64 %d, i64 %e, i64 %f, i64 %g, i64 %h, i64 %i, i64 %j) {
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
	%r0 = load i64, i64* %_P_a
	%r1 = load i64, i64* %_P_b
	%r2 = add i64 %r0, %r1
	%r3 = load i64, i64* %_P_c
	%r4 = add i64 %r2, %r3
	%r5 = load i64, i64* %_P_d
	%r6 = add i64 %r4, %r5
	%r7 = load i64, i64* %_P_e
	%r8 = add i64 %r6, %r7
	%r9 = load i64, i64* %_P_f
	%r10 = add i64 %r8, %r9
	%r11 = load i64, i64* %_P_g
	%r12 = add i64 %r10, %r11
	%r13 = load i64, i64* %_P_h
	%r14 = add i64 %r12, %r13
	%r15 = load i64, i64* %_P_i
	%r16 = add i64 %r14, %r15
	%r17 = load i64, i64* %_P_j
	%r18 = add i64 %r16, %r17
	store i64 %r18, i64* %_ret_val
	%r19 = load i64, i64* %_ret_val
	ret i64 %r19
}

define i64 @main() {
L1:
	%_ret_val = alloca i64
	%k = alloca i64
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
	store i64 1, i64* %k
	store i64 2, i64* %l
	store i64 3, i64* %m
	store i64 4, i64* %n
	store i64 5, i64* %o
	store i64 6, i64* %p
	store i64 7, i64* %q
	store i64 8, i64* %r
	store i64 9, i64* %s
	store i64 10, i64* %t
	%r20 = load i64, i64* %k
	%r21 = load i64, i64* %l
	%r22 = load i64, i64* %m
	%r23 = load i64, i64* %n
	%r24 = load i64, i64* %o
	%r25 = load i64, i64* %p
	%r26 = load i64, i64* %q
	%r27 = load i64, i64* %r
	%r28 = load i64, i64* %s
	%r29 = load i64, i64* %t
	%r30 = call i64 @foo(i64 %r20, i64 %r21, i64 %r22, i64 %r23, i64 %r24, i64 %r25, i64 %r26, i64 %r27, i64 %r28, i64 %r29)
	store i64 %r30, i64* %u
	%r31 = load i64, i64* %u
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr0, i32 0, i32 0),i64 %r31)
	store i64 0, i64* %_ret_val
	%r32 = load i64, i64* %_ret_val
	ret i64 %r32
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.fstr0 = private unnamed_addr constant [9 x i8] c"u = %ld\0A\00", align 1