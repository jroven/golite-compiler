source_filename = "spill"
target triple = "x86_64-linux-gnu"
define i64 @main() {
L0:
	%_ret_val = alloca i64
	%a = alloca i64
	%b = alloca i64
	%c = alloca i64
	%d = alloca i64
	%e = alloca i64
	%f = alloca i64
	%g = alloca i64
	%h = alloca i64
	%i = alloca i64
	%j = alloca i64
	%k = alloca i64
	%l = alloca i64
	%m = alloca i64
	%n = alloca i64
	%o = alloca i64
	%p = alloca i64
	%q = alloca i64
	%r = alloca i64
	store i64 1, i64* %a
	store i64 2, i64* %b
	store i64 3, i64* %c
	store i64 4, i64* %d
	store i64 5, i64* %e
	store i64 6, i64* %f
	store i64 7, i64* %g
	store i64 8, i64* %h
	store i64 9, i64* %i
	store i64 10, i64* %j
	store i64 11, i64* %k
	store i64 12, i64* %l
	store i64 13, i64* %m
	store i64 14, i64* %n
	store i64 15, i64* %o
	store i64 16, i64* %p
	store i64 17, i64* %q
	store i64 18, i64* %r
	%r0 = load i64, i64* %a
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr0, i32 0, i32 0),i64 %r0)
	%r1 = load i64, i64* %b
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr1, i32 0, i32 0),i64 %r1)
	%r2 = load i64, i64* %c
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr2, i32 0, i32 0),i64 %r2)
	%r3 = load i64, i64* %d
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr3, i32 0, i32 0),i64 %r3)
	%r4 = load i64, i64* %e
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr4, i32 0, i32 0),i64 %r4)
	%r5 = load i64, i64* %f
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr5, i32 0, i32 0),i64 %r5)
	%r6 = load i64, i64* %g
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr6, i32 0, i32 0),i64 %r6)
	%r7 = load i64, i64* %h
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr7, i32 0, i32 0),i64 %r7)
	%r8 = load i64, i64* %i
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr8, i32 0, i32 0),i64 %r8)
	%r9 = load i64, i64* %j
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr9, i32 0, i32 0),i64 %r9)
	%r10 = load i64, i64* %k
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr10, i32 0, i32 0),i64 %r10)
	%r11 = load i64, i64* %l
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr11, i32 0, i32 0),i64 %r11)
	%r12 = load i64, i64* %m
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr12, i32 0, i32 0),i64 %r12)
	%r13 = load i64, i64* %n
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr13, i32 0, i32 0),i64 %r13)
	%r14 = load i64, i64* %o
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr14, i32 0, i32 0),i64 %r14)
	%r15 = load i64, i64* %p
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr15, i32 0, i32 0),i64 %r15)
	%r16 = load i64, i64* %q
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr16, i32 0, i32 0),i64 %r16)
	%r17 = load i64, i64* %r
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr17, i32 0, i32 0),i64 %r17)
	store i64 0, i64* %_ret_val
	%r18 = load i64, i64* %_ret_val
	ret i64 %r18
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
@.fstr15 = private unnamed_addr constant [9 x i8] c"p = %ld\0A\00", align 1
@.fstr16 = private unnamed_addr constant [9 x i8] c"q = %ld\0A\00", align 1
@.fstr17 = private unnamed_addr constant [9 x i8] c"r = %ld\0A\00", align 1