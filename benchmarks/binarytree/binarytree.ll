source_filename = "binarytree"
target triple = "x86_64-linux-gnu"
%struct.Node = type {i64, %struct.Node*, %struct.Node*}
@root = common global %struct.Node** null
define i64 @compare(i64 %cur, i64 %neuw) {
L0:
	%_ret_val = alloca i64
	%_P_cur = alloca i64
	store i64 %cur, i64* %_P_cur
	%_P_neuw = alloca i64
	store i64 %neuw, i64* %_P_neuw
	%r0 = load i64, i64* %_P_cur
	%r1 = load i64, i64* %_P_neuw
	%r2 = icmp slt i64 %r0, %r1
	%r3 = select i1 %r2, i1 1, i1 0
	br i1 %r2, label %L1, label %L2
L1:
	store i64 1, i64* %_ret_val
	%r4 = load i64, i64* %_ret_val
	ret i64 %r4
L2:
	%r5 = load i64, i64* %_P_cur
	%r6 = load i64, i64* %_P_neuw
	%r7 = icmp sgt i64 %r5, %r6
	%r8 = select i1 %r7, i1 1, i1 0
	br i1 %r7, label %L4, label %L5
L3:
	br label %L3
L4:
	%r9 = mul i64 -1, 1
	store i64 %r9, i64* %_ret_val
	%r10 = load i64, i64* %_ret_val
	ret i64 %r10
L5:
	store i64 0, i64* %_ret_val
	%r11 = load i64, i64* %_ret_val
	ret i64 %r11
L6:
	br label %L3
}

define i64 @addNode(i64 %numAdd, %struct.Node* %curr) {
L7:
	%_ret_val = alloca i64
	%_P_numAdd = alloca i64
	store i64 %numAdd, i64* %_P_numAdd
	%_P_curr = alloca %struct.Node*
	store %struct.Node* %curr, %struct.Node** %_P_curr
	%compVal = alloca i64
	%newNode = alloca %struct.Node*
	%r12 = load %struct.Node*, %struct.Node** %_P_curr
	%r13 = icmp eq %struct.Node* %r12, null
	%r14 = select i1 %r13, i1 1, i1 0
	br i1 %r13, label %L8, label %L9
L8:
	%r15 = call i8* @malloc(i32 24)
	%r16 = bitcast i8* %r15 to %struct.Node*
	store %struct.Node* %r16, %struct.Node** %newNode
	%r17 = load i64, i64* %_P_numAdd
	%r18 = load %struct.Node*, %struct.Node** %newNode
	%r19 = getelementptr %struct.Node, %struct.Node* %r18, i32 0, i32 0
	store i64 %r17, i64* %r19
	%r20 = load %struct.Node*, %struct.Node** %newNode
	%r21 = getelementptr %struct.Node, %struct.Node* %r20, i32 0, i32 1
	%r22 = load %struct.Node*, %struct.Node** %r21
	store ptr null, %struct.Node** %r21
	%r23 = load %struct.Node*, %struct.Node** %newNode
	%r24 = getelementptr %struct.Node, %struct.Node* %r23, i32 0, i32 2
	%r25 = load %struct.Node*, %struct.Node** %r24
	store ptr null, %struct.Node** %r24
	%r26 = load %struct.Node*, %struct.Node** %newNode
	store %struct.Node* %r26, %struct.Node** @root
	br label %L10
L9:
	%r27 = load %struct.Node*, %struct.Node** %_P_curr
	%r28 = getelementptr %struct.Node, %struct.Node* %r27, i32 0, i32 0
	%r29 = load i64, i64* %r28
	%r30 = load i64, i64* %_P_numAdd
	%r31 = call i64 @compare(i64 %r29, i64 %r30)
	store i64 %r31, i64* %compVal
	%r32 = load i64, i64* %compVal
	%r33 = mul i64 -1, 1
	%r34 = icmp eq i64 %r32, %r33
	%r35 = select i1 %r34, i1 1, i1 0
	br i1 %r34, label %L11, label %L12
L10:
	store i64 0, i64* %_ret_val
	%r91 = load i64, i64* %_ret_val
	ret i64 %r91
L11:
	%r36 = load %struct.Node*, %struct.Node** %_P_curr
	%r37 = getelementptr %struct.Node, %struct.Node* %r36, i32 0, i32 1
	%r38 = load %struct.Node*, %struct.Node** %r37
	%r39 = load %struct.Node*, %struct.Node** %r37
	%r40 = icmp eq %struct.Node* %r39, null
	%r41 = select i1 %r40, i1 1, i1 0
	br i1 %r40, label %L14, label %L15
L12:
	%r62 = load i64, i64* %compVal
	%r63 = icmp eq i64 %r62, 1
	%r64 = select i1 %r63, i1 1, i1 0
	br i1 %r63, label %L17, label %L18
L13:
	br label %L10
L14:
	%r42 = call i8* @malloc(i32 24)
	%r43 = bitcast i8* %r42 to %struct.Node*
	store %struct.Node* %r43, %struct.Node** %newNode
	%r44 = load i64, i64* %_P_numAdd
	%r45 = load %struct.Node*, %struct.Node** %newNode
	%r46 = getelementptr %struct.Node, %struct.Node* %r45, i32 0, i32 0
	store i64 %r44, i64* %r46
	%r47 = load %struct.Node*, %struct.Node** %newNode
	%r48 = getelementptr %struct.Node, %struct.Node* %r47, i32 0, i32 1
	%r49 = load %struct.Node*, %struct.Node** %r48
	store ptr null, %struct.Node** %r48
	%r50 = load %struct.Node*, %struct.Node** %newNode
	%r51 = getelementptr %struct.Node, %struct.Node* %r50, i32 0, i32 2
	%r52 = load %struct.Node*, %struct.Node** %r51
	store ptr null, %struct.Node** %r51
	%r53 = load %struct.Node*, %struct.Node** %newNode
	%r54 = load %struct.Node*, %struct.Node** %_P_curr
	%r55 = getelementptr %struct.Node, %struct.Node* %r54, i32 0, i32 1
	%r56 = load %struct.Node*, %struct.Node** %r55
	store %struct.Node* %r53, %struct.Node** %r55
	br label %L16
L15:
	%r57 = load i64, i64* %_P_numAdd
	%r58 = load %struct.Node*, %struct.Node** %_P_curr
	%r59 = getelementptr %struct.Node, %struct.Node* %r58, i32 0, i32 1
	%r60 = load %struct.Node*, %struct.Node** %r59
	%r61 = load %struct.Node*, %struct.Node** %r59
	call i64 @addNode(i64 %r57, %struct.Node* %r61)
	br label %L16
L17:
	%r65 = load %struct.Node*, %struct.Node** %_P_curr
	%r66 = getelementptr %struct.Node, %struct.Node* %r65, i32 0, i32 2
	%r67 = load %struct.Node*, %struct.Node** %r66
	%r68 = load %struct.Node*, %struct.Node** %r66
	%r69 = icmp eq %struct.Node* %r68, null
	%r70 = select i1 %r69, i1 1, i1 0
	br i1 %r69, label %L20, label %L21
L18:
	br label %L19
L16:
	br label %L13
L19:
	br label %L13
L20:
	%r71 = call i8* @malloc(i32 24)
	%r72 = bitcast i8* %r71 to %struct.Node*
	store %struct.Node* %r72, %struct.Node** %newNode
	%r73 = load i64, i64* %_P_numAdd
	%r74 = load %struct.Node*, %struct.Node** %newNode
	%r75 = getelementptr %struct.Node, %struct.Node* %r74, i32 0, i32 0
	store i64 %r73, i64* %r75
	%r76 = load %struct.Node*, %struct.Node** %newNode
	%r77 = getelementptr %struct.Node, %struct.Node* %r76, i32 0, i32 1
	%r78 = load %struct.Node*, %struct.Node** %r77
	store ptr null, %struct.Node** %r77
	%r79 = load %struct.Node*, %struct.Node** %newNode
	%r80 = getelementptr %struct.Node, %struct.Node* %r79, i32 0, i32 2
	%r81 = load %struct.Node*, %struct.Node** %r80
	store ptr null, %struct.Node** %r80
	%r82 = load %struct.Node*, %struct.Node** %newNode
	%r83 = load %struct.Node*, %struct.Node** %_P_curr
	%r84 = getelementptr %struct.Node, %struct.Node* %r83, i32 0, i32 2
	%r85 = load %struct.Node*, %struct.Node** %r84
	store %struct.Node* %r82, %struct.Node** %r84
	br label %L22
L21:
	%r86 = load i64, i64* %_P_numAdd
	%r87 = load %struct.Node*, %struct.Node** %_P_curr
	%r88 = getelementptr %struct.Node, %struct.Node* %r87, i32 0, i32 2
	%r89 = load %struct.Node*, %struct.Node** %r88
	%r90 = load %struct.Node*, %struct.Node** %r88
	call i64 @addNode(i64 %r86, %struct.Node* %r90)
	br label %L22
L22:
	br label %L19
}

define i64 @printDepthTree(%struct.Node* %curr) {
L23:
	%_ret_val = alloca i64
	%_P_curr = alloca %struct.Node*
	store %struct.Node* %curr, %struct.Node** %_P_curr
	%temp = alloca i64
	%r92 = load %struct.Node*, %struct.Node** %_P_curr
	%r93 = icmp ne %struct.Node* %r92, null
	%r94 = select i1 %r93, i1 1, i1 0
	br i1 %r93, label %L24, label %L25
L24:
	%r95 = load %struct.Node*, %struct.Node** %_P_curr
	%r96 = getelementptr %struct.Node, %struct.Node* %r95, i32 0, i32 1
	%r97 = load %struct.Node*, %struct.Node** %r96
	%r98 = load %struct.Node*, %struct.Node** %r96
	%r99 = icmp ne %struct.Node* %r98, null
	%r100 = select i1 %r99, i1 1, i1 0
	br i1 %r99, label %L27, label %L28
L25:
	br label %L26
L26:
	store i64 0, i64* %_ret_val
	%r119 = load i64, i64* %_ret_val
	ret i64 %r119
L27:
	%r101 = load %struct.Node*, %struct.Node** %_P_curr
	%r102 = getelementptr %struct.Node, %struct.Node* %r101, i32 0, i32 1
	%r103 = load %struct.Node*, %struct.Node** %r102
	%r104 = load %struct.Node*, %struct.Node** %r102
	call i64 @printDepthTree(%struct.Node* %r104)
	br label %L29
L28:
	br label %L29
L29:
	%r105 = load %struct.Node*, %struct.Node** %_P_curr
	%r106 = getelementptr %struct.Node, %struct.Node* %r105, i32 0, i32 0
	%r107 = load i64, i64* %r106
	store i64 %r107, i64* %temp
	%r108 = load i64, i64* %temp
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr0, i32 0, i32 0),i64 %r108)
	%r109 = load %struct.Node*, %struct.Node** %_P_curr
	%r110 = getelementptr %struct.Node, %struct.Node* %r109, i32 0, i32 2
	%r111 = load %struct.Node*, %struct.Node** %r110
	%r112 = load %struct.Node*, %struct.Node** %r110
	%r113 = icmp ne %struct.Node* %r112, null
	%r114 = select i1 %r113, i1 1, i1 0
	br i1 %r113, label %L30, label %L31
L30:
	%r115 = load %struct.Node*, %struct.Node** %_P_curr
	%r116 = getelementptr %struct.Node, %struct.Node* %r115, i32 0, i32 2
	%r117 = load %struct.Node*, %struct.Node** %r116
	%r118 = load %struct.Node*, %struct.Node** %r116
	call i64 @printDepthTree(%struct.Node* %r118)
	br label %L32
L31:
	br label %L32
L32:
	br label %L26
}

define i64 @deleteLeavesTree(%struct.Node* %curr) {
L33:
	%_ret_val = alloca i64
	%_P_curr = alloca %struct.Node*
	store %struct.Node* %curr, %struct.Node** %_P_curr
	%r120 = load %struct.Node*, %struct.Node** %_P_curr
	%r121 = icmp ne %struct.Node* %r120, null
	%r122 = select i1 %r121, i1 1, i1 0
	br i1 %r121, label %L34, label %L35
L34:
	%r123 = load %struct.Node*, %struct.Node** %_P_curr
	%r124 = getelementptr %struct.Node, %struct.Node* %r123, i32 0, i32 1
	%r125 = load %struct.Node*, %struct.Node** %r124
	%r126 = load %struct.Node*, %struct.Node** %r124
	%r127 = icmp ne %struct.Node* %r126, null
	%r128 = select i1 %r127, i1 1, i1 0
	br i1 %r127, label %L37, label %L38
L35:
	br label %L36
L36:
	store i64 0, i64* %_ret_val
	%r145 = load i64, i64* %_ret_val
	ret i64 %r145
L37:
	%r129 = load %struct.Node*, %struct.Node** %_P_curr
	%r130 = getelementptr %struct.Node, %struct.Node* %r129, i32 0, i32 1
	%r131 = load %struct.Node*, %struct.Node** %r130
	%r132 = load %struct.Node*, %struct.Node** %r130
	call i64 @deleteLeavesTree(%struct.Node* %r132)
	br label %L39
L38:
	br label %L39
L39:
	%r133 = load %struct.Node*, %struct.Node** %_P_curr
	%r134 = getelementptr %struct.Node, %struct.Node* %r133, i32 0, i32 2
	%r135 = load %struct.Node*, %struct.Node** %r134
	%r136 = load %struct.Node*, %struct.Node** %r134
	%r137 = icmp ne %struct.Node* %r136, null
	%r138 = select i1 %r137, i1 1, i1 0
	br i1 %r137, label %L40, label %L41
L40:
	%r139 = load %struct.Node*, %struct.Node** %_P_curr
	%r140 = getelementptr %struct.Node, %struct.Node* %r139, i32 0, i32 2
	%r141 = load %struct.Node*, %struct.Node** %r140
	%r142 = load %struct.Node*, %struct.Node** %r140
	call i64 @deleteLeavesTree(%struct.Node* %r142)
	br label %L42
L41:
	br label %L42
L42:
	%r143 = load %struct.Node*, %struct.Node** %_P_curr
	%r144 = bitcast %struct.Node* %r143 to i8*
	call void @free(i8* %r144)
	br label %L36
}

define i64 @main() {
L43:
	%_ret_val = alloca i64
	%input = alloca i64
	%temp = alloca i64
	store ptr null, %struct.Node** @root
	store i64 0, i64* %input
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0),i64* %input)
	br label %L44
L44:
	%r146 = load i64, i64* %input
	%r147 = icmp ne i64 %r146, 0
	br i1 %r147, label %L45, label %L46
L45:
	%r148 = load i64, i64* %input
	%r149 = load %struct.Node*, %struct.Node** @root
	call i64 @addNode(i64 %r148, %struct.Node* %r149)
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0),i64* %input)
	br label %L44
L46:
	%r150 = load %struct.Node*, %struct.Node** @root
	call i64 @printDepthTree(%struct.Node* %r150)
	%r151 = load %struct.Node*, %struct.Node** @root
	call i64 @deleteLeavesTree(%struct.Node* %r151)
	store i64 0, i64* %_ret_val
	%r152 = load i64, i64* %_ret_val
	ret i64 %r152
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.fstr0 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1