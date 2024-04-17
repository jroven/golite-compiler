source_filename = "milestonebenchmark"
target triple = "x86_64-linux-gnu"
@a = common global i64 0
define i64 @add(i64 %a, i64 %b) {
L0:
	%_ret_val = alloca i64
	%_P_a = alloca i64
	store i64 %a, i64* %_P_a
	%_P_b = alloca i64
	store i64 %b, i64* %_P_b
	%r0 = load i64, i64* %_P_a
	%r1 = load i64, i64* %_P_b
	%r2 = add i64 %r0, %r1
	store i64 %r2, i64* %_ret_val
	%r3 = load i64, i64* %_ret_val
	ret i64 %r3
}

define i64 @main() {
L1:
	%_ret_val = alloca i64
	%b = alloca i64
	store i64 5, i64* @a
	store i64 2, i64* %b
	%r4 = load i64, i64* @a
	%r5 = load i64, i64* %b
	%r6 = call i64 @add(i64 %r4, i64 %r5)
	%r7 = mul i64 %r6, 2
	%r8 = sub i64 %r7, 3
	store i64 %r8, i64* %b
	%r9 = load i64, i64* %b
	%r10 = load i64, i64* @a
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr0, i32 0, i32 0),i64 %r9,i64 %r10)
	store i64 0, i64* %_ret_val
	%r11 = load i64, i64* %_ret_val
	ret i64 %r11
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.fstr0 = private unnamed_addr constant [9 x i8] c"%ld\0A%ld\0A\00", align 1