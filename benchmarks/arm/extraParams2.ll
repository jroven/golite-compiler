source_filename = "extraParams2"
target triple = "x86_64-linux-gnu"
define i64 @foo(i64 %a, i64 %b, i64 %c, i64 %d, i64 %e, i64 %f, i64 %g, i64 %h, i64 %i, i64 %j, i64 %k) {
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
	store i64 0, i64* %_ret_val
	%r11 = load i64, i64* %_ret_val
	ret i64 %r11
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
	%r12 = load i64, i64* %l
	%r13 = load i64, i64* %m
	%r14 = load i64, i64* %n
	%r15 = load i64, i64* %o
	%r16 = load i64, i64* %p
	%r17 = load i64, i64* %q
	%r18 = load i64, i64* %r
	%r19 = load i64, i64* %s
	%r20 = load i64, i64* %t
	%r21 = load i64, i64* %u
	%r22 = load i64, i64* %v
	call i64 @foo(i64 %r12, i64 %r13, i64 %r14, i64 %r15, i64 %r16, i64 %r17, i64 %r18, i64 %r19, i64 %r20, i64 %r21, i64 %r22)
	store i64 0, i64* %_ret_val
	%r23 = load i64, i64* %_ret_val
	ret i64 %r23
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