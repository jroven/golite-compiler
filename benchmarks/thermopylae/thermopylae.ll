source_filename = "thermopylae"
target triple = "x86_64-linux-gnu"
define i64 @fact(i64 %x) {
L0:
	%_ret_val = alloca i64
	%_P_x = alloca i64
	store i64 %x, i64* %_P_x
	%r0 = load i64, i64* %_P_x
	%r1 = icmp sle i64 %r0, 1
	%r2 = select i1 %r1, i1 1, i1 0
	br i1 %r2, label %L1, label %L2
L1:
	store i64 1, i64* %_ret_val
	%r3 = load i64, i64* %_ret_val
	ret i64 %r3
L2:
	%r4 = load i64, i64* %_P_x
	%r5 = load i64, i64* %_P_x
	%r6 = sub i64 %r5, 1
	%r7 = call i64 @fact(i64 %r6)
	%r8 = mul i64 %r4, %r7
	store i64 %r8, i64* %_ret_val
	%r9 = load i64, i64* %_ret_val
	ret i64 %r9
}

define i64 @main() {
L4:
	%_ret_val = alloca i64
	%stop = alloca i64
	%factor = alloca i64
	%toStop = alloca i64
	%temp = alloca i64
	store i64 0, i64* %stop
	store i64 0, i64* %factor
	br label %L5
L5:
	%r10 = load i64, i64* %stop
	%r11 = icmp eq i64 %r10, 0
	%r12 = select i1 %r11, i1 1, i1 0
	br i1 %r11, label %L6, label %L7
L6:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0),i64* %factor)
	%r13 = load i64, i64* %factor
	%r14 = call i64 @fact(i64 %r13)
	store i64 %r14, i64* %temp
	%r15 = load i64, i64* %temp
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr0, i32 0, i32 0),i64 %r15)
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0),i64* %toStop)
	%r16 = load i64, i64* %toStop
	%r17 = icmp eq i64 %r16, 0
	%r18 = select i1 %r17, i1 1, i1 0
	br i1 %r18, label %L8, label %L9
L7:
	store i64 0, i64* %_ret_val
	%r19 = load i64, i64* %_ret_val
	ret i64 %r19
L8:
	store i64 1, i64* %stop
	br label %L10
L9:
	br label %L10
L10:
	br label %L5
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.fstr0 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1