source_filename = "binaryExpr"
target triple = "x86_64-linux-gnu"
define i64 @main() {
L0:
	%_ret_val = alloca i64
	%a = alloca i64
	%b = alloca i64
	%c = alloca i64
	store i64 5, i64* %a
	%r0 = load i64, i64* %a
	%r1 = add i64 %r0, 7
	%r2 = mul i64 %r1, 3
	store i64 %r2, i64* %b
	%r3 = and i64 1, 1
	store i64 %r3, i64* %c
	store i64 0, i64* %_ret_val
	br label %L1
L1:
	%r4 = load i64, i64* %_ret_val
	ret i64 %r4
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1