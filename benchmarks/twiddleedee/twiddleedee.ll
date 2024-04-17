source_filename = "twiddleedee"
target triple = "x86_64-linux-gnu"
%struct.nums = type {i64, i64}
define i64 @fib1(i64 %f1) {
L0:
	%_ret_val = alloca i64
	%_P_f1 = alloca i64
	store i64 %f1, i64* %_P_f1
	%r0 = load i64, i64* %_P_f1
	%r1 = icmp slt i64 %r0, 2
	%r2 = select i1 %r1, i1 1, i1 0
	br i1 %r2, label %L1, label %L2
L1:
	%r3 = load i64, i64* %_P_f1
	store i64 %r3, i64* %_ret_val
	%r4 = load i64, i64* %_ret_val
	ret i64 %r4
L2:
	%r5 = load i64, i64* %_P_f1
	%r6 = sub i64 %r5, 1
	%r7 = call i64 @fib1(i64 %r6)
	%r8 = load i64, i64* %_P_f1
	%r9 = sub i64 %r8, 2
	%r10 = call i64 @fib1(i64 %r9)
	%r11 = add i64 %r7, %r10
	store i64 %r11, i64* %_ret_val
	%r12 = load i64, i64* %_ret_val
	ret i64 %r12
}

define i64 @fib2(i64 %f2) {
L4:
	%_ret_val = alloca i64
	%_P_f2 = alloca i64
	store i64 %f2, i64* %_P_f2
	%fir = alloca i64
	%sec = alloca i64
	%temp = alloca i64
	store i64 0, i64* %fir
	store i64 1, i64* %sec
	br label %L5
L5:
	%r13 = load i64, i64* %_P_f2
	%r14 = icmp ne i64 %r13, 0
	%r15 = select i1 %r14, i1 1, i1 0
	br i1 %r14, label %L6, label %L7
L6:
	%r16 = load i64, i64* %_P_f2
	%r17 = sub i64 %r16, 1
	store i64 %r17, i64* %_P_f2
	%r18 = load i64, i64* %fir
	%r19 = load i64, i64* %sec
	%r20 = add i64 %r18, %r19
	store i64 %r20, i64* %temp
	%r21 = load i64, i64* %sec
	store i64 %r21, i64* %fir
	%r22 = load i64, i64* %temp
	store i64 %r22, i64* %sec
	br label %L5
L7:
	%r23 = load i64, i64* %fir
	store i64 %r23, i64* %_ret_val
	%r24 = load i64, i64* %_ret_val
	ret i64 %r24
}

define i64 @main() {
L8:
	%_ret_val = alloca i64
	%x = alloca %struct.nums*
	%c = alloca i64
	%d = alloca i64
	%temp = alloca i64
	%r25 = call i8* @malloc(i32 16)
	%r26 = bitcast i8* %r25 to %struct.nums*
	store %struct.nums* %r26, %struct.nums** %x
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0),i64* %temp)
	%r27 = load i64, i64* %temp
	%r28 = load %struct.nums*, %struct.nums** %x
	%r29 = getelementptr %struct.nums, %struct.nums* %r28, i32 0, i32 0
	store i64 %r27, i64* %r29
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0),i64* %temp)
	%r30 = load i64, i64* %temp
	%r31 = load %struct.nums*, %struct.nums** %x
	%r32 = getelementptr %struct.nums, %struct.nums* %r31, i32 0, i32 1
	store i64 %r30, i64* %r32
	%r33 = load %struct.nums*, %struct.nums** %x
	%r34 = getelementptr %struct.nums, %struct.nums* %r33, i32 0, i32 0
	%r35 = load i64, i64* %r34
	%r36 = call i64 @fib1(i64 %r35)
	store i64 %r36, i64* %c
	%r37 = load %struct.nums*, %struct.nums** %x
	%r38 = getelementptr %struct.nums, %struct.nums* %r37, i32 0, i32 1
	%r39 = load i64, i64* %r38
	%r40 = call i64 @fib2(i64 %r39)
	store i64 %r40, i64* %d
	%r41 = load %struct.nums*, %struct.nums** %x
	%r42 = bitcast %struct.nums* %r41 to i8*
	call void @free(i8* %r42)
	%r43 = load i64, i64* %c
	%r44 = load i64, i64* %d
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr0, i32 0, i32 0),i64 %r43,i64 %r44)
	store i64 0, i64* %_ret_val
	%r45 = load i64, i64* %_ret_val
	ret i64 %r45
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.fstr0 = private unnamed_addr constant [12 x i8] c"c=%ld\0Ad=%ld\00", align 1