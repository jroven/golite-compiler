source_filename = "loop"
target triple = "x86_64-linux-gnu"
define i64 @main() {
L0:
	%_ret_val = alloca i64
	%a = alloca i64
	store i64 1, i64* %a
	%r0 = load i64, i64* %a
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr0, i32 0, i32 0),i64 %r0)
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr1, i32 0, i32 0))
	br label %L1
L1:
	%r1 = load i64, i64* %a
	%r2 = icmp slt i64 %r1, 10
	%r3 = select i1 %r2, i1 1, i1 0
	br i1 %r2, label %L2, label %L3
L2:
	%r4 = load i64, i64* %a
	%r5 = add i64 %r4, 1
	store i64 %r5, i64* %a
	%r6 = load i64, i64* %a
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr2, i32 0, i32 0),i64 %r6)
	br label %L1
L3:
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr3, i32 0, i32 0))
	store i64 2, i64* %a
	%r7 = load i64, i64* %a
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr4, i32 0, i32 0),i64 %r7)
	store i64 0, i64* %_ret_val
	%r8 = load i64, i64* %_ret_val
	ret i64 %r8
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.fstr0 = private unnamed_addr constant [9 x i8] c"a = %ld\0A\00", align 1
@.fstr1 = private unnamed_addr constant [15 x i8] c"entering loop\0A\00", align 1
@.fstr2 = private unnamed_addr constant [9 x i8] c"a = %ld\0A\00", align 1
@.fstr3 = private unnamed_addr constant [13 x i8] c"exited loop\0A\00", align 1
@.fstr4 = private unnamed_addr constant [9 x i8] c"a = %ld\0A\00", align 1