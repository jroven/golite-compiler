source_filename = "nestedCFG"
target triple = "x86_64-linux-gnu"
define i64 @main() {
L0:
	%_ret_val = alloca i64
	%a = alloca i64
	%b = alloca i64
	store i64 10, i64* %a
	%r0 = load i64, i64* %a
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr0, i32 0, i32 0),i64 %r0)
	br label %L1
L1:
	%r1 = load i64, i64* %a
	%r2 = icmp sgt i64 %r1, 0
	%r3 = select i1 %r2, i1 1, i1 0
	br i1 %r2, label %L2, label %L3
L2:
	%r4 = load i64, i64* %a
	%r5 = sub i64 %r4, 1
	store i64 %r5, i64* %a
	%r6 = load i64, i64* %a
	%r7 = icmp eq i64 %r6, 7
	%r8 = select i1 %r7, i1 1, i1 0
	br i1 %r8, label %L4, label %L5
L3:
	%r15 = load i64, i64* %a
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr3, i32 0, i32 0),i64 %r15)
	store i64 0, i64* %_ret_val
	%r16 = load i64, i64* %_ret_val
	ret i64 %r16
L4:
	%r9 = load i64, i64* %a
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr1, i32 0, i32 0),i64 %r9)
	store i64 0, i64* %b
	br label %L7
L5:
	br label %L6
L6:
	br label %L1
L7:
	%r10 = load i64, i64* %b
	%r11 = icmp slt i64 %r10, 3
	%r12 = select i1 %r11, i1 1, i1 0
	br i1 %r11, label %L8, label %L9
L8:
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr2, i32 0, i32 0))
	%r13 = load i64, i64* %b
	%r14 = add i64 %r13, 1
	store i64 %r14, i64* %b
	br label %L7
L9:
	br label %L6
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.fstr0 = private unnamed_addr constant [40 x i8] c"About to enter first for loop, a = %ld\0A\00", align 1
@.fstr1 = private unnamed_addr constant [26 x i8] c"Inside for loop, a = %ld\0A\00", align 1
@.fstr2 = private unnamed_addr constant [18 x i8] c"Nested for loop!\0A\00", align 1
@.fstr3 = private unnamed_addr constant [27 x i8] c"Outside for loop, a = %ld\0A\00", align 1