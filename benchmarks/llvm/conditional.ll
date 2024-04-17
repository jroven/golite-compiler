source_filename = "conditional"
target triple = "x86_64-linux-gnu"
define i64 @main() {
L0:
	%_ret_val = alloca i64
	%a = alloca i64
	%r0 = icmp eq i64 1, 1
	br i1 %r0, label %L2, label %L3
L2:
	store i64 5, i64* %a
	br label %L4
L3:
	store i64 4, i64* %a
	br label %L4
L4:
	store i64 0, i64* %_ret_val
	br label %L1
L1:
	%r1 = load i64, i64* %_ret_val
	ret i64 %r1
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1