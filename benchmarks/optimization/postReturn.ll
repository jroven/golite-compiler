source_filename = "postReturn"
target triple = "x86_64-linux-gnu"
define i64 @main() {
L0:
	%_ret_val = alloca i64
	%a = alloca i64
	%b = alloca i64
	%c = alloca i64
	store i64 0, i64* %_ret_val
	%r0 = load i64, i64* %_ret_val
	ret i64 %r0
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.fstr0 = private unnamed_addr constant [27 x i8] c"a = %ld, b = %ld, c = %ld\0A\00", align 1