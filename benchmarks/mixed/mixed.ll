source_filename = "mixed"
target triple = "x86_64-linux-gnu"
%struct.foo = type {i64, i64, %struct.simple*}
%struct.simple = type {i64}
@globalfoo = common global %struct.foo** null
@unusedGlobal = common global %struct.foo** null
define i64 @tailrecursive(i64 %num) {
L0:
	%_ret_val = alloca i64
	%_P_num = alloca i64
	store i64 %num, i64* %_P_num
	%unused = alloca %struct.foo*
	%r0 = load i64, i64* %_P_num
	%r1 = icmp sle i64 %r0, 0
	%r2 = select i1 %r1, i1 1, i1 0
	br i1 %r2, label %L1, label %L2
L1:
	store i64 0, i64* %_ret_val
	%r3 = load i64, i64* %_ret_val
	ret i64 %r3
L2:
	br label %L3
L3:
	%r4 = call i8* @malloc(i32 24)
	%r5 = bitcast i8* %r4 to %struct.foo*
	store %struct.foo* %r5, %struct.foo** %unused
	%r6 = load %struct.foo*, %struct.foo** %unused
	store %struct.foo* %r6, %struct.foo** @unusedGlobal
	%r7 = load i64, i64* %_P_num
	%r8 = sub i64 %r7, 1
	call i64 @tailrecursive(i64 %r8)
	store i64 0, i64* %_ret_val
	%r9 = load i64, i64* %_ret_val
	ret i64 %r9
}

define i64 @add(i64 %x, i64 %y) {
L4:
	%_ret_val = alloca i64
	%_P_x = alloca i64
	store i64 %x, i64* %_P_x
	%_P_y = alloca i64
	store i64 %y, i64* %_P_y
	%r10 = load i64, i64* %_P_x
	%r11 = load i64, i64* %_P_y
	%r12 = add i64 %r10, %r11
	store i64 %r12, i64* %_ret_val
	%r13 = load i64, i64* %_ret_val
	ret i64 %r13
}

define i64 @domath(i64 %num) {
L5:
	%_ret_val = alloca i64
	%_P_num = alloca i64
	store i64 %num, i64* %_P_num
	%math1 = alloca %struct.foo*
	%math2 = alloca %struct.foo*
	%tmp = alloca i64
	%r14 = call i8* @malloc(i32 24)
	%r15 = bitcast i8* %r14 to %struct.foo*
	store %struct.foo* %r15, %struct.foo** %math1
	%r16 = call i8* @malloc(i32 8)
	%r17 = bitcast i8* %r16 to %struct.simple*
	%r18 = load %struct.foo*, %struct.foo** %math1
	%r19 = getelementptr %struct.foo, %struct.foo* %r18, i32 0, i32 2
	store %struct.simple* %r17, %struct.simple** %r19
	%r20 = call i8* @malloc(i32 24)
	%r21 = bitcast i8* %r20 to %struct.foo*
	store %struct.foo* %r21, %struct.foo** %math2
	%r22 = call i8* @malloc(i32 8)
	%r23 = bitcast i8* %r22 to %struct.simple*
	%r24 = load %struct.foo*, %struct.foo** %math2
	%r25 = getelementptr %struct.foo, %struct.foo* %r24, i32 0, i32 2
	store %struct.simple* %r23, %struct.simple** %r25
	%r26 = load i64, i64* %_P_num
	%r27 = load %struct.foo*, %struct.foo** %math1
	%r28 = getelementptr %struct.foo, %struct.foo* %r27, i32 0, i32 0
	store i64 %r26, i64* %r28
	%r29 = load %struct.foo*, %struct.foo** %math2
	%r30 = getelementptr %struct.foo, %struct.foo* %r29, i32 0, i32 0
	store i64 3, i64* %r30
	%r31 = load %struct.foo*, %struct.foo** %math1
	%r32 = getelementptr %struct.foo, %struct.foo* %r31, i32 0, i32 0
	%r33 = load i64, i64* %r32
	%r34 = load %struct.foo*, %struct.foo** %math1
	%r35 = getelementptr %struct.foo, %struct.foo* %r34, i32 0, i32 2
	%r36 = load %struct.simple*, %struct.simple** %r35
	%r37 = getelementptr %struct.simple, %struct.simple* %r36, i32 0, i32 0
	store i64 %r33, i64* %r37
	%r38 = load %struct.foo*, %struct.foo** %math2
	%r39 = getelementptr %struct.foo, %struct.foo* %r38, i32 0, i32 0
	%r40 = load i64, i64* %r39
	%r41 = load %struct.foo*, %struct.foo** %math2
	%r42 = getelementptr %struct.foo, %struct.foo* %r41, i32 0, i32 2
	%r43 = load %struct.simple*, %struct.simple** %r42
	%r44 = getelementptr %struct.simple, %struct.simple* %r43, i32 0, i32 0
	store i64 %r40, i64* %r44
	br label %L6
L6:
	%r45 = load i64, i64* %_P_num
	%r46 = icmp sgt i64 %r45, 0
	%r47 = select i1 %r46, i1 1, i1 0
	br i1 %r46, label %L7, label %L8
L7:
	%r48 = load %struct.foo*, %struct.foo** %math1
	%r49 = getelementptr %struct.foo, %struct.foo* %r48, i32 0, i32 0
	%r50 = load i64, i64* %r49
	%r51 = load %struct.foo*, %struct.foo** %math2
	%r52 = getelementptr %struct.foo, %struct.foo* %r51, i32 0, i32 0
	%r53 = load i64, i64* %r52
	%r54 = mul i64 %r50, %r53
	store i64 %r54, i64* %tmp
	%r55 = load i64, i64* %tmp
	%r56 = load %struct.foo*, %struct.foo** %math1
	%r57 = getelementptr %struct.foo, %struct.foo* %r56, i32 0, i32 2
	%r58 = load %struct.simple*, %struct.simple** %r57
	%r59 = getelementptr %struct.simple, %struct.simple* %r58, i32 0, i32 0
	%r60 = load i64, i64* %r59
	%r61 = mul i64 %r55, %r60
	%r62 = load %struct.foo*, %struct.foo** %math2
	%r63 = getelementptr %struct.foo, %struct.foo* %r62, i32 0, i32 0
	%r64 = load i64, i64* %r63
	%r65 = sdiv i64 %r61, %r64
	store i64 %r65, i64* %tmp
	%r66 = load %struct.foo*, %struct.foo** %math2
	%r67 = getelementptr %struct.foo, %struct.foo* %r66, i32 0, i32 2
	%r68 = load %struct.simple*, %struct.simple** %r67
	%r69 = getelementptr %struct.simple, %struct.simple* %r68, i32 0, i32 0
	%r70 = load i64, i64* %r69
	%r71 = load %struct.foo*, %struct.foo** %math1
	%r72 = getelementptr %struct.foo, %struct.foo* %r71, i32 0, i32 0
	%r73 = load i64, i64* %r72
	%r74 = call i64 @add(i64 %r70, i64 %r73)
	store i64 %r74, i64* %tmp
	%r75 = load %struct.foo*, %struct.foo** %math2
	%r76 = getelementptr %struct.foo, %struct.foo* %r75, i32 0, i32 0
	%r77 = load i64, i64* %r76
	%r78 = load %struct.foo*, %struct.foo** %math1
	%r79 = getelementptr %struct.foo, %struct.foo* %r78, i32 0, i32 0
	%r80 = load i64, i64* %r79
	%r81 = sub i64 %r77, %r80
	store i64 %r81, i64* %tmp
	%r82 = load i64, i64* %_P_num
	%r83 = sub i64 %r82, 1
	store i64 %r83, i64* %_P_num
	br label %L6
L8:
	%r84 = load %struct.foo*, %struct.foo** %math1
	%r85 = bitcast %struct.foo* %r84 to i8*
	call void @free(i8* %r85)
	%r86 = load %struct.foo*, %struct.foo** %math2
	%r87 = bitcast %struct.foo* %r86 to i8*
	call void @free(i8* %r87)
	store i64 0, i64* %_ret_val
	%r88 = load i64, i64* %_ret_val
	ret i64 %r88
}

define i64 @objinstantiation(i64 %num) {
L9:
	%_ret_val = alloca i64
	%_P_num = alloca i64
	store i64 %num, i64* %_P_num
	%tmp = alloca %struct.foo*
	br label %L10
L10:
	%r89 = load i64, i64* %_P_num
	%r90 = icmp sgt i64 %r89, 0
	%r91 = select i1 %r90, i1 1, i1 0
	br i1 %r90, label %L11, label %L12
L11:
	%r92 = call i8* @malloc(i32 24)
	%r93 = bitcast i8* %r92 to %struct.foo*
	store %struct.foo* %r93, %struct.foo** %tmp
	%r94 = load %struct.foo*, %struct.foo** %tmp
	%r95 = bitcast %struct.foo* %r94 to i8*
	call void @free(i8* %r95)
	%r96 = load i64, i64* %_P_num
	%r97 = sub i64 %r96, 1
	store i64 %r97, i64* %_P_num
	br label %L10
L12:
	store i64 0, i64* %_ret_val
	%r98 = load i64, i64* %_ret_val
	ret i64 %r98
}

define i64 @ackermann(i64 %m, i64 %n) {
L13:
	%_ret_val = alloca i64
	%_P_m = alloca i64
	store i64 %m, i64* %_P_m
	%_P_n = alloca i64
	store i64 %n, i64* %_P_n
	%r99 = load i64, i64* %_P_m
	%r100 = icmp eq i64 %r99, 0
	%r101 = select i1 %r100, i1 1, i1 0
	br i1 %r101, label %L14, label %L15
L14:
	%r102 = load i64, i64* %_P_n
	%r103 = add i64 %r102, 1
	store i64 %r103, i64* %_ret_val
	%r104 = load i64, i64* %_ret_val
	ret i64 %r104
L15:
	br label %L16
L16:
	%r105 = load i64, i64* %_P_n
	%r106 = icmp eq i64 %r105, 0
	%r107 = select i1 %r106, i1 1, i1 0
	br i1 %r107, label %L17, label %L18
L17:
	%r108 = load i64, i64* %_P_m
	%r109 = sub i64 %r108, 1
	%r110 = call i64 @ackermann(i64 %r109, i64 1)
	store i64 %r110, i64* %_ret_val
	%r111 = load i64, i64* %_ret_val
	ret i64 %r111
L18:
	%r112 = load i64, i64* %_P_m
	%r113 = sub i64 %r112, 1
	%r114 = load i64, i64* %_P_m
	%r115 = load i64, i64* %_P_n
	%r116 = sub i64 %r115, 1
	%r117 = call i64 @ackermann(i64 %r114, i64 %r116)
	%r118 = call i64 @ackermann(i64 %r113, i64 %r117)
	store i64 %r118, i64* %_ret_val
	%r119 = load i64, i64* %_ret_val
	ret i64 %r119
}

define i64 @main() {
L20:
	%_ret_val = alloca i64
	%a = alloca i64
	%b = alloca i64
	%c = alloca i64
	%d = alloca i64
	%e = alloca i64
	%temp = alloca i64
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0),i64* %a)
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0),i64* %b)
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0),i64* %c)
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0),i64* %d)
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0),i64* %e)
	%r120 = load i64, i64* %a
	call i64 @tailrecursive(i64 %r120)
	%r121 = load i64, i64* %b
	call i64 @domath(i64 %r121)
	%r122 = load i64, i64* %c
	call i64 @objinstantiation(i64 %r122)
	%r123 = load i64, i64* %d
	%r124 = load i64, i64* %e
	%r125 = call i64 @ackermann(i64 %r123, i64 %r124)
	store i64 %r125, i64* %temp
	%r126 = load i64, i64* %a
	%r127 = load i64, i64* %b
	%r128 = load i64, i64* %c
	%r129 = load i64, i64* %temp
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr0, i32 0, i32 0),i64 %r126,i64 %r127,i64 %r128,i64 %r129)
	store i64 0, i64* %_ret_val
	%r130 = load i64, i64* %_ret_val
	ret i64 %r130
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.fstr0 = private unnamed_addr constant [28 x i8] c"a=%ld\0Ab=%ld\0A%c=%ld,temp=%ld\00", align 1