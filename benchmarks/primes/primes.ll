source_filename = "primes"
target triple = "x86_64-linux-gnu"
define i64 @isqrt(i64 %a) {
L0:
	%_ret_val = alloca i64
	%_P_a = alloca i64
	store i64 %a, i64* %_P_a
	%square = alloca i64
	%delta = alloca i64
	store i64 1, i64* %square
	store i64 3, i64* %delta
	br label %L1
L1:
	%r0 = load i64, i64* %square
	%r1 = load i64, i64* %_P_a
	%r2 = icmp sle i64 %r0, %r1
	%r3 = select i1 %r2, i1 1, i1 0
	br i1 %r2, label %L2, label %L3
L2:
	%r4 = load i64, i64* %square
	%r5 = load i64, i64* %delta
	%r6 = add i64 %r4, %r5
	store i64 %r6, i64* %square
	%r7 = load i64, i64* %delta
	%r8 = add i64 %r7, 2
	store i64 %r8, i64* %delta
	br label %L1
L3:
	%r9 = load i64, i64* %delta
	%r10 = sdiv i64 %r9, 2
	%r11 = sub i64 %r10, 1
	store i64 %r11, i64* %_ret_val
	%r12 = load i64, i64* %_ret_val
	ret i64 %r12
}

define i64 @prime(i64 %a) {
L4:
	%_ret_val = alloca i64
	%_P_a = alloca i64
	store i64 %a, i64* %_P_a
	%max = alloca i64
	%divisor = alloca i64
	%remainder = alloca i64
	%r13 = load i64, i64* %_P_a
	%r14 = icmp slt i64 %r13, 2
	%r15 = select i1 %r14, i1 1, i1 0
	br i1 %r15, label %L5, label %L6
L5:
	store i64 0, i64* %_ret_val
	%r16 = load i64, i64* %_ret_val
	ret i64 %r16
	br label %L7
L6:
	%r17 = load i64, i64* %_P_a
	%r18 = call i64 @isqrt(i64 %r17)
	store i64 %r18, i64* %max
	store i64 2, i64* %divisor
	br label %L8
L7:
	br label %L7
L8:
	%r19 = load i64, i64* %divisor
	%r20 = load i64, i64* %max
	%r21 = icmp sle i64 %r19, %r20
	%r22 = select i1 %r21, i1 1, i1 0
	br i1 %r21, label %L9, label %L10
L9:
	%r23 = load i64, i64* %_P_a
	%r24 = load i64, i64* %_P_a
	%r25 = load i64, i64* %divisor
	%r26 = sdiv i64 %r24, %r25
	%r27 = load i64, i64* %divisor
	%r28 = mul i64 %r26, %r27
	%r29 = sub i64 %r23, %r28
	store i64 %r29, i64* %remainder
	%r30 = load i64, i64* %remainder
	%r31 = icmp eq i64 %r30, 0
	%r32 = select i1 %r31, i1 1, i1 0
	br i1 %r32, label %L11, label %L12
L10:
	store i64 1, i64* %_ret_val
	%r36 = load i64, i64* %_ret_val
	ret i64 %r36
	br label %L7
L11:
	store i64 0, i64* %_ret_val
	%r33 = load i64, i64* %_ret_val
	ret i64 %r33
	br label %L13
L12:
	br label %L13
L13:
	%r34 = load i64, i64* %divisor
	%r35 = add i64 %r34, 1
	store i64 %r35, i64* %divisor
	br label %L8
}

define i64 @main() {
L14:
	%_ret_val = alloca i64
	%limit = alloca i64
	%a = alloca i64
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0),i64* %limit)
	store i64 0, i64* %a
	br label %L15
L15:
	%r37 = load i64, i64* %a
	%r38 = load i64, i64* %limit
	%r39 = icmp sle i64 %r37, %r38
	%r40 = select i1 %r39, i1 1, i1 0
	br i1 %r39, label %L16, label %L17
L16:
	%r41 = load i64, i64* %a
	%r42 = call i64 @prime(i64 %r41)
	%r43 = trunc i64 %r42 to i1
	%r44 = select i1 %r43, i1 1, i1 0
	br i1 %r44, label %L18, label %L19
L17:
	store i64 0, i64* %_ret_val
	%r48 = load i64, i64* %_ret_val
	ret i64 %r48
L18:
	%r45 = load i64, i64* %a
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr0, i32 0, i32 0),i64 %r45)
	br label %L20
L19:
	br label %L20
L20:
	%r46 = load i64, i64* %a
	%r47 = add i64 %r46, 1
	store i64 %r47, i64* %a
	br label %L15
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.fstr0 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1