source_filename = "powmod"
target triple = "x86_64-linux-gnu"
%struct.MESSAGE = type {i64, %struct.MESSAGE*}
define i64 @mod(i64 %val, i64 %t) {
L0:
	%_ret_val = alloca i64
	%_P_val = alloca i64
	store i64 %val, i64* %_P_val
	%_P_t = alloca i64
	store i64 %t, i64* %_P_t
	%temp = alloca i64
	%r0 = load i64, i64* %_P_val
	%r1 = load i64, i64* %_P_t
	%r2 = sdiv i64 %r0, %r1
	store i64 %r2, i64* %temp
	%r3 = load i64, i64* %_P_val
	%r4 = load i64, i64* %temp
	%r5 = load i64, i64* %_P_t
	%r6 = mul i64 %r4, %r5
	%r7 = sub i64 %r3, %r6
	store i64 %r7, i64* %_ret_val
	%r8 = load i64, i64* %_ret_val
	ret i64 %r8
}

define i64 @power(i64 %x, i64 %n) {
L1:
	%_ret_val = alloca i64
	%_P_x = alloca i64
	store i64 %x, i64* %_P_x
	%_P_n = alloca i64
	store i64 %n, i64* %_P_n
	%temp = alloca i64
	%r9 = load i64, i64* %_P_n
	%r10 = icmp eq i64 %r9, 0
	%r11 = select i1 %r10, i1 1, i1 0
	br i1 %r11, label %L2, label %L3
L2:
	store i64 1, i64* %_ret_val
	%r12 = load i64, i64* %_ret_val
	ret i64 %r12
L3:
	%r13 = load i64, i64* %_P_n
	%r14 = call i64 @mod(i64 %r13, i64 2)
	%r15 = icmp eq i64 %r14, 1
	%r16 = select i1 %r15, i1 1, i1 0
	br i1 %r16, label %L5, label %L6
L5:
	%r17 = load i64, i64* %_P_x
	%r18 = load i64, i64* %_P_x
	%r19 = load i64, i64* %_P_n
	%r20 = sub i64 %r19, 1
	%r21 = call i64 @power(i64 %r18, i64 %r20)
	%r22 = mul i64 %r17, %r21
	store i64 %r22, i64* %_ret_val
	%r23 = load i64, i64* %_ret_val
	ret i64 %r23
L6:
	%r24 = load i64, i64* %_P_x
	%r25 = load i64, i64* %_P_n
	%r26 = sdiv i64 %r25, 2
	%r27 = call i64 @power(i64 %r24, i64 %r26)
	store i64 %r27, i64* %temp
	%r28 = load i64, i64* %temp
	%r29 = load i64, i64* %temp
	%r30 = mul i64 %r28, %r29
	store i64 %r30, i64* %_ret_val
	%r31 = load i64, i64* %_ret_val
	ret i64 %r31
}

define i64 @crypt(i64 %m, i64 %key, %struct.MESSAGE* %msg) {
L8:
	%_ret_val = alloca i64
	%_P_m = alloca i64
	store i64 %m, i64* %_P_m
	%_P_key = alloca i64
	store i64 %key, i64* %_P_key
	%_P_msg = alloca %struct.MESSAGE*
	store %struct.MESSAGE* %msg, %struct.MESSAGE** %_P_msg
	%r32 = load %struct.MESSAGE*, %struct.MESSAGE** %_P_msg
	%r33 = getelementptr %struct.MESSAGE, %struct.MESSAGE* %r32, i32 0, i32 0
	%r34 = load i64, i64* %r33
	%r35 = load i64, i64* %_P_key
	%r36 = call i64 @power(i64 %r34, i64 %r35)
	%r37 = load i64, i64* %_P_m
	%r38 = call i64 @mod(i64 %r36, i64 %r37)
	%r39 = load %struct.MESSAGE*, %struct.MESSAGE** %_P_msg
	%r40 = getelementptr %struct.MESSAGE, %struct.MESSAGE* %r39, i32 0, i32 0
	store i64 %r38, i64* %r40
	%r41 = load %struct.MESSAGE*, %struct.MESSAGE** %_P_msg
	%r42 = getelementptr %struct.MESSAGE, %struct.MESSAGE* %r41, i32 0, i32 1
	%r43 = load %struct.MESSAGE*, %struct.MESSAGE** %r42
	%r44 = icmp ne %struct.MESSAGE* %r43, null
	%r45 = select i1 %r44, i1 1, i1 0
	br i1 %r45, label %L9, label %L10
L9:
	%r46 = load i64, i64* %_P_m
	%r47 = load i64, i64* %_P_key
	%r48 = load %struct.MESSAGE*, %struct.MESSAGE** %_P_msg
	%r49 = getelementptr %struct.MESSAGE, %struct.MESSAGE* %r48, i32 0, i32 1
	%r50 = load %struct.MESSAGE*, %struct.MESSAGE** %r49
	call i64 @crypt(i64 %r46, i64 %r47, %struct.MESSAGE* %r50)
	br label %L11
L10:
	br label %L11
L11:
	store i64 0, i64* %_ret_val
	%r51 = load i64, i64* %_ret_val
	ret i64 %r51
}

define i64 @main() {
L12:
	%_ret_val = alloca i64
	%key = alloca i64
	%mod = alloca i64
	%length = alloca i64
	%readTemp = alloca i64
	%printTemp = alloca i64
	%start = alloca %struct.MESSAGE*
	%current = alloca %struct.MESSAGE*
	%temp = alloca %struct.MESSAGE*
	%r52 = call i8* @malloc(i32 16)
	%r53 = bitcast i8* %r52 to %struct.MESSAGE*
	store %struct.MESSAGE* %r53, %struct.MESSAGE** %start
	%r54 = load %struct.MESSAGE*, %struct.MESSAGE** %start
	store %struct.MESSAGE* %r54, %struct.MESSAGE** %current
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0),i64* %key)
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0),i64* %mod)
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0),i64* %length)
	%r55 = load i64, i64* %length
	%r56 = sub i64 %r55, 1
	store i64 %r56, i64* %length
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0),i64* %readTemp)
	%r57 = load i64, i64* %readTemp
	%r58 = load %struct.MESSAGE*, %struct.MESSAGE** %current
	%r59 = getelementptr %struct.MESSAGE, %struct.MESSAGE* %r58, i32 0, i32 0
	store i64 %r57, i64* %r59
	br label %L13
L13:
	%r60 = load i64, i64* %length
	%r61 = icmp sgt i64 %r60, 0
	%r62 = select i1 %r61, i1 1, i1 0
	br i1 %r61, label %L14, label %L15
L14:
	%r63 = call i8* @malloc(i32 16)
	%r64 = bitcast i8* %r63 to %struct.MESSAGE*
	%r65 = load %struct.MESSAGE*, %struct.MESSAGE** %current
	%r66 = getelementptr %struct.MESSAGE, %struct.MESSAGE* %r65, i32 0, i32 1
	store %struct.MESSAGE* %r64, %struct.MESSAGE** %r66
	%r67 = load %struct.MESSAGE*, %struct.MESSAGE** %current
	%r68 = getelementptr %struct.MESSAGE, %struct.MESSAGE* %r67, i32 0, i32 1
	%r69 = load %struct.MESSAGE*, %struct.MESSAGE** %r68
	store %struct.MESSAGE* %r69, %struct.MESSAGE** %current
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0),i64* %readTemp)
	%r70 = load i64, i64* %readTemp
	%r71 = load %struct.MESSAGE*, %struct.MESSAGE** %current
	%r72 = getelementptr %struct.MESSAGE, %struct.MESSAGE* %r71, i32 0, i32 0
	store i64 %r70, i64* %r72
	%r73 = load i64, i64* %length
	%r74 = sub i64 %r73, 1
	store i64 %r74, i64* %length
	br label %L13
L15:
	%r75 = load %struct.MESSAGE*, %struct.MESSAGE** %current
	%r76 = getelementptr %struct.MESSAGE, %struct.MESSAGE* %r75, i32 0, i32 1
	store ptr null, %struct.MESSAGE** %r76
	%r77 = load i64, i64* %mod
	%r78 = load i64, i64* %key
	%r79 = load %struct.MESSAGE*, %struct.MESSAGE** %start
	call i64 @crypt(i64 %r77, i64 %r78, %struct.MESSAGE* %r79)
	%r80 = load %struct.MESSAGE*, %struct.MESSAGE** %start
	store %struct.MESSAGE* %r80, %struct.MESSAGE** %current
	br label %L16
L16:
	%r81 = load %struct.MESSAGE*, %struct.MESSAGE** %current
	%r82 = icmp ne %struct.MESSAGE* %r81, null
	%r83 = select i1 %r82, i1 1, i1 0
	br i1 %r82, label %L17, label %L18
L17:
	%r84 = load %struct.MESSAGE*, %struct.MESSAGE** %current
	store %struct.MESSAGE* %r84, %struct.MESSAGE** %temp
	%r85 = load %struct.MESSAGE*, %struct.MESSAGE** %current
	%r86 = getelementptr %struct.MESSAGE, %struct.MESSAGE* %r85, i32 0, i32 0
	%r87 = load i64, i64* %r86
	store i64 %r87, i64* %printTemp
	%r88 = load i64, i64* %printTemp
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr0, i32 0, i32 0),i64 %r88)
	%r89 = load %struct.MESSAGE*, %struct.MESSAGE** %current
	%r90 = getelementptr %struct.MESSAGE, %struct.MESSAGE* %r89, i32 0, i32 1
	%r91 = load %struct.MESSAGE*, %struct.MESSAGE** %r90
	store %struct.MESSAGE* %r91, %struct.MESSAGE** %current
	%r92 = load %struct.MESSAGE*, %struct.MESSAGE** %temp
	%r93 = bitcast %struct.MESSAGE* %r92 to i8*
	call void @free(i8* %r93)
	br label %L16
L18:
	store i64 0, i64* %_ret_val
	%r94 = load i64, i64* %_ret_val
	ret i64 %r94
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.fstr0 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1