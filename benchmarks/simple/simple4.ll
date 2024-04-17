source_filename = "simple4"
target triple = "x86_64-linux-gnu"
%struct.simple = type {i64, i64}
@globalfoo = common global %struct.simple* null
define void @main() {
L0:
	%_ret_val = alloca i64
	%a = alloca i64
	store i64 5, i64* %a
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)