source_filename = "nestedFields"
target triple = "x86_64-linux-gnu"
%struct.foo = type {i64, i64, %struct.simple*}
%struct.simple = type {i64}
define i64 @add(i64 %x, i64 %y) {
L0:
	%_ret_val = alloca i64
	%_P_x = alloca i64
	store i64 %x, i64* %_P_x
	%_P_y = alloca i64
	store i64 %y, i64* %_P_y
	%r0 = load i64, i64* %_P_x
	%r1 = load i64, i64* %_P_y
	%r2 = add i64 %r0, %r1
	store i64 %r2, i64* %_ret_val
	%r3 = load i64, i64* %_ret_val
	ret i64 %r3
}

define i64 @domath(i64 %num) {
L1:
	%_ret_val = alloca i64
	%_P_num = alloca i64
	store i64 %num, i64* %_P_num
	%math1 = alloca %struct.foo*
	%math2 = alloca %struct.foo*
	%tmp = alloca i64
	%r4 = call i8* @malloc(i32 24)
	%r5 = bitcast i8* %r4 to %struct.foo*
	store %struct.foo* %r5, %struct.foo** %math1
	%r6 = call i8* @malloc(i32 8)
	%r7 = bitcast i8* %r6 to %struct.simple*
	%r8 = load %struct.foo*, %struct.foo** %math1
	%r9 = getelementptr %struct.foo, %struct.foo* %r8, i32 0, i32 2
	store %struct.simple* %r7, %struct.simple** %r9
	%r10 = call i8* @malloc(i32 24)
	%r11 = bitcast i8* %r10 to %struct.foo*
	store %struct.foo* %r11, %struct.foo** %math2
	%r12 = call i8* @malloc(i32 8)
	%r13 = bitcast i8* %r12 to %struct.simple*
	%r14 = load %struct.foo*, %struct.foo** %math2
	%r15 = getelementptr %struct.foo, %struct.foo* %r14, i32 0, i32 2
	store %struct.simple* %r13, %struct.simple** %r15
	%r16 = load i64, i64* %_P_num
	%r17 = load %struct.foo*, %struct.foo** %math1
	%r18 = getelementptr %struct.foo, %struct.foo* %r17, i32 0, i32 0
	store i64 %r16, i64* %r18
	%r19 = load %struct.foo*, %struct.foo** %math2
	%r20 = getelementptr %struct.foo, %struct.foo* %r19, i32 0, i32 0
	store i64 3, i64* %r20
	%r21 = load %struct.foo*, %struct.foo** %math1
	%r22 = getelementptr %struct.foo, %struct.foo* %r21, i32 0, i32 0
	%r23 = load i64, i64* %r22
	%r24 = load %struct.foo*, %struct.foo** %math1
	%r25 = getelementptr %struct.foo, %struct.foo* %r24, i32 0, i32 2
	%r26 = load %struct.simple*, %struct.simple** %r25
	%r27 = getelementptr %struct.simple, %struct.simple* %r26, i32 0, i32 0
	store i64 %r23, i64* %r27
	%r28 = load %struct.foo*, %struct.foo** %math2
	%r29 = getelementptr %struct.foo, %struct.foo* %r28, i32 0, i32 0
	%r30 = load i64, i64* %r29
	%r31 = load %struct.foo*, %struct.foo** %math2
	%r32 = getelementptr %struct.foo, %struct.foo* %r31, i32 0, i32 2
	%r33 = load %struct.simple*, %struct.simple** %r32
	%r34 = getelementptr %struct.simple, %struct.simple* %r33, i32 0, i32 0
	store i64 %r30, i64* %r34
	br label %L2
L2:
	%r35 = load i64, i64* %_P_num
	%r36 = icmp sgt i64 %r35, 0
	%r37 = select i1 %r36, i1 1, i1 0
	br i1 %r36, label %L3, label %L4
L3:
	%r38 = load %struct.foo*, %struct.foo** %math1
	%r39 = getelementptr %struct.foo, %struct.foo* %r38, i32 0, i32 0
	%r40 = load i64, i64* %r39
	%r41 = load %struct.foo*, %struct.foo** %math2
	%r42 = getelementptr %struct.foo, %struct.foo* %r41, i32 0, i32 0
	%r43 = load i64, i64* %r42
	%r44 = mul i64 %r40, %r43
	store i64 %r44, i64* %tmp
	%r45 = load i64, i64* %tmp
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr0, i32 0, i32 0),i64 %r45)
	%r46 = load i64, i64* %tmp
	%r47 = load %struct.foo*, %struct.foo** %math1
	%r48 = getelementptr %struct.foo, %struct.foo* %r47, i32 0, i32 2
	%r49 = load %struct.simple*, %struct.simple** %r48
	%r50 = getelementptr %struct.simple, %struct.simple* %r49, i32 0, i32 0
	%r51 = load i64, i64* %r50
	%r52 = mul i64 %r46, %r51
	%r53 = load %struct.foo*, %struct.foo** %math2
	%r54 = getelementptr %struct.foo, %struct.foo* %r53, i32 0, i32 0
	%r55 = load i64, i64* %r54
	%r56 = sdiv i64 %r52, %r55
	store i64 %r56, i64* %tmp
	%r57 = load i64, i64* %tmp
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr1, i32 0, i32 0),i64 %r57)
	%r58 = load %struct.foo*, %struct.foo** %math2
	%r59 = getelementptr %struct.foo, %struct.foo* %r58, i32 0, i32 2
	%r60 = load %struct.simple*, %struct.simple** %r59
	%r61 = getelementptr %struct.simple, %struct.simple* %r60, i32 0, i32 0
	%r62 = load i64, i64* %r61
	%r63 = load %struct.foo*, %struct.foo** %math1
	%r64 = getelementptr %struct.foo, %struct.foo* %r63, i32 0, i32 0
	%r65 = load i64, i64* %r64
	%r66 = call i64 @add(i64 %r62, i64 %r65)
	store i64 %r66, i64* %tmp
	%r67 = load i64, i64* %tmp
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr2, i32 0, i32 0),i64 %r67)
	%r68 = load %struct.foo*, %struct.foo** %math2
	%r69 = getelementptr %struct.foo, %struct.foo* %r68, i32 0, i32 0
	%r70 = load i64, i64* %r69
	%r71 = load %struct.foo*, %struct.foo** %math1
	%r72 = getelementptr %struct.foo, %struct.foo* %r71, i32 0, i32 0
	%r73 = load i64, i64* %r72
	%r74 = sub i64 %r70, %r73
	store i64 %r74, i64* %tmp
	%r75 = load i64, i64* %tmp
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr3, i32 0, i32 0),i64 %r75)
	%r76 = load i64, i64* %_P_num
	%r77 = sub i64 %r76, 1
	store i64 %r77, i64* %_P_num
	br label %L2
L4:
	%r78 = load %struct.foo*, %struct.foo** %math1
	%r79 = bitcast %struct.foo* %r78 to i8*
	call void @free(i8* %r79)
	%r80 = load %struct.foo*, %struct.foo** %math2
	%r81 = bitcast %struct.foo* %r80 to i8*
	call void @free(i8* %r81)
	store i64 0, i64* %_ret_val
	%r82 = load i64, i64* %_ret_val
	ret i64 %r82
}

define i64 @main() {
L5:
	%_ret_val = alloca i64
	call i64 @domath(i64 2)
	store i64 0, i64* %_ret_val
	%r83 = load i64, i64* %_ret_val
	ret i64 %r83
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.fstr0 = private unnamed_addr constant [10 x i8] c"tmp: %ld\0A\00", align 1
@.fstr1 = private unnamed_addr constant [10 x i8] c"tmp: %ld\0A\00", align 1
@.fstr2 = private unnamed_addr constant [10 x i8] c"tmp: %ld\0A\00", align 1
@.fstr3 = private unnamed_addr constant [10 x i8] c"tmp: %ld\0A\00", align 1