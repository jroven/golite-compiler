source_filename = "complex"
target triple = "x86_64-linux-gnu"
define i64 @foo(i64 %a) {
L0:
	%_ret_val = alloca i64
	%_P_a = alloca i64
	store i64 %a, i64* %_P_a
	%b = alloca i64
	store i64 3, i64* %b
	%r0 = load i64, i64* %_P_a
	%r1 = icmp sgt i64 %r0, 5
	%r2 = select i1 %r1, i64 1, i64 0
	%r3 = or i64 %r2, 1
	%r4 = trunc i64 %r3 to i1
	br i1 %r4, label %L2, label %L3
L2:
	store i64 4, i64* %b
	br label %L4
L3:
	br label %L4
L4:
	store i64 0, i64* %_ret_val
	br label %L1
L1:
	%r5 = load i64, i64* %_ret_val
	ret i64 %r5
}

define i64 @main() {
L5:
	%_ret_val = alloca i64
	%c = alloca i64
	%d = alloca i64
	%e = alloca i64
	store i64 1, i64* %c
	store i64 2, i64* %d
	%r6 = load i64, i64* %c
	%r7 = call i64 @foo(i64 %r6)
	store i64 %r7, i64* %e
	%r8 = load i64, i64* %e
	%r9 = call i64 @foo(i64 %r8)
	store i64 %r9, i64* %d
	store i64 0, i64* %_ret_val
	br label %L6
L6:
	%r10 = load i64, i64* %_ret_val
	ret i64 %r10
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1