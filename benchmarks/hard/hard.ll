source_filename = "hard"
target triple = "x86_64-linux-gnu"
%struct.Row = type {%struct.Row*, %struct.Cell*}
%struct.ListNode = type {%struct.ListNode*, i64, i64}
%struct.Cell = type {%struct.Cell*, i64}
@matrix = common global %struct.Row** null
@maxrange = common global i64 0
define i64 @timesone(i64 %iter) {
L0:
	%_ret_val = alloca i64
	%_P_iter = alloca i64
	store i64 %iter, i64* %_P_iter
	br label %L1
L1:
	%r0 = load i64, i64* %_P_iter
	%r1 = icmp sgt i64 %r0, 0
	%r2 = select i1 %r1, i1 1, i1 0
	br i1 %r1, label %L2, label %L3
L2:
	%r3 = load i64, i64* @maxrange
	%r4 = mul i64 %r3, 1
	store i64 %r4, i64* @maxrange
	%r5 = load i64, i64* %_P_iter
	%r6 = sub i64 %r5, 1
	store i64 %r6, i64* %_P_iter
	br label %L1
L3:
	store i64 0, i64* %_ret_val
	%r7 = load i64, i64* %_ret_val
	ret i64 %r7
}

define i64 @find(i64 %num, %struct.ListNode* %list) {
L4:
	%_ret_val = alloca i64
	%_P_num = alloca i64
	store i64 %num, i64* %_P_num
	%_P_list = alloca %struct.ListNode*
	store %struct.ListNode* %list, %struct.ListNode** %_P_list
	%r8 = load %struct.ListNode*, %struct.ListNode** %_P_list
	%r9 = icmp ne %struct.ListNode* %r8, null
	%r10 = select i1 %r9, i1 1, i1 0
	br i1 %r10, label %L5, label %L6
L5:
	%r11 = load %struct.ListNode*, %struct.ListNode** %_P_list
	%r12 = getelementptr %struct.ListNode, %struct.ListNode* %r11, i32 0, i32 1
	%r13 = load i64, i64* %r12
	%r14 = load i64, i64* %_P_num
	%r15 = icmp eq i64 %r13, %r14
	%r16 = select i1 %r15, i1 1, i1 0
	br i1 %r16, label %L8, label %L9
L6:
	br label %L7
L7:
	%r27 = mul i64 -1, 1
	store i64 %r27, i64* %_ret_val
	%r28 = load i64, i64* %_ret_val
	ret i64 %r28
L8:
	%r17 = load %struct.ListNode*, %struct.ListNode** %_P_list
	%r18 = getelementptr %struct.ListNode, %struct.ListNode* %r17, i32 0, i32 2
	%r19 = load i64, i64* %r18
	store i64 %r19, i64* %_ret_val
	%r20 = load i64, i64* %_ret_val
	ret i64 %r20
L9:
	%r21 = load i64, i64* %_P_num
	%r22 = load %struct.ListNode*, %struct.ListNode** %_P_list
	%r23 = getelementptr %struct.ListNode, %struct.ListNode* %r22, i32 0, i32 0
	%r24 = load %struct.ListNode*, %struct.ListNode** %r23
	%r25 = call i64 @find(i64 %r21, %struct.ListNode* %r24)
	store i64 %r25, i64* %_ret_val
	%r26 = load i64, i64* %_ret_val
	ret i64 %r26
}

define %struct.ListNode* @add(i64 %lookup, i64 %value, %struct.ListNode* %list) {
L11:
	%_ret_val = alloca %struct.ListNode*
	%_P_lookup = alloca i64
	store i64 %lookup, i64* %_P_lookup
	%_P_value = alloca i64
	store i64 %value, i64* %_P_value
	%_P_list = alloca %struct.ListNode*
	store %struct.ListNode* %list, %struct.ListNode** %_P_list
	%r29 = load %struct.ListNode*, %struct.ListNode** %_P_list
	%r30 = icmp eq %struct.ListNode* %r29, null
	%r31 = select i1 %r30, i1 1, i1 0
	br i1 %r31, label %L12, label %L13
L12:
	%r32 = call i8* @malloc(i32 24)
	%r33 = bitcast i8* %r32 to %struct.ListNode*
	store %struct.ListNode* %r33, %struct.ListNode** %_P_list
	%r34 = load i64, i64* %_P_lookup
	%r35 = load %struct.ListNode*, %struct.ListNode** %_P_list
	%r36 = getelementptr %struct.ListNode, %struct.ListNode* %r35, i32 0, i32 1
	store i64 %r34, i64* %r36
	%r37 = load i64, i64* %_P_value
	%r38 = load %struct.ListNode*, %struct.ListNode** %_P_list
	%r39 = getelementptr %struct.ListNode, %struct.ListNode* %r38, i32 0, i32 2
	store i64 %r37, i64* %r39
	%r40 = load %struct.ListNode*, %struct.ListNode** %_P_list
	%r41 = getelementptr %struct.ListNode, %struct.ListNode* %r40, i32 0, i32 0
	store ptr null, %struct.ListNode** %r41
	br label %L14
L13:
	%r42 = load i64, i64* %_P_lookup
	%r43 = load i64, i64* %_P_value
	%r44 = load %struct.ListNode*, %struct.ListNode** %_P_list
	%r45 = getelementptr %struct.ListNode, %struct.ListNode* %r44, i32 0, i32 0
	%r46 = load %struct.ListNode*, %struct.ListNode** %r45
	%r47 = call %struct.ListNode* @add(i64 %r42, i64 %r43, %struct.ListNode* %r46)
	%r48 = load %struct.ListNode*, %struct.ListNode** %_P_list
	%r49 = getelementptr %struct.ListNode, %struct.ListNode* %r48, i32 0, i32 0
	store %struct.ListNode* %r47, %struct.ListNode** %r49
	br label %L14
L14:
	%r50 = load %struct.ListNode*, %struct.ListNode** %_P_list
	store %struct.ListNode* %r50, %struct.ListNode** %_ret_val
	%r51 = load %struct.ListNode*, %struct.ListNode** %_ret_val
	ret %struct.ListNode* %r51
}

define i64 @factorial(i64 %num, %struct.ListNode* %list) {
L15:
	%_ret_val = alloca i64
	%_P_num = alloca i64
	store i64 %num, i64* %_P_num
	%_P_list = alloca %struct.ListNode*
	store %struct.ListNode* %list, %struct.ListNode** %_P_list
	%lookup = alloca i64
	%fact = alloca i64
	call i64 @timesone(i64 100)
	%r52 = load i64, i64* %_P_num
	%r53 = icmp eq i64 %r52, 1
	%r54 = select i1 %r53, i1 1, i1 0
	br i1 %r54, label %L16, label %L17
L16:
	store i64 1, i64* %_ret_val
	%r55 = load i64, i64* %_ret_val
	ret i64 %r55
L17:
	%r56 = load i64, i64* %_P_num
	%r57 = load %struct.ListNode*, %struct.ListNode** %_P_list
	%r58 = call i64 @find(i64 %r56, %struct.ListNode* %r57)
	store i64 %r58, i64* %lookup
	%r59 = load i64, i64* %lookup
	%r60 = mul i64 -1, 1
	%r61 = icmp ne i64 %r59, %r60
	%r62 = select i1 %r61, i1 1, i1 0
	br i1 %r62, label %L19, label %L20
L19:
	%r63 = load i64, i64* %lookup
	store i64 %r63, i64* %_ret_val
	%r64 = load i64, i64* %_ret_val
	ret i64 %r64
L20:
	br label %L21
L21:
	%r65 = load i64, i64* %_P_num
	%r66 = load i64, i64* %_P_num
	%r67 = sub i64 %r66, 1
	%r68 = load %struct.ListNode*, %struct.ListNode** %_P_list
	%r69 = call i64 @factorial(i64 %r67, %struct.ListNode* %r68)
	%r70 = mul i64 %r65, %r69
	store i64 %r70, i64* %fact
	%r71 = load i64, i64* %fact
	%r72 = sdiv i64 %r71, 3
	%r73 = icmp eq i64 %r72, 0
	%r74 = select i1 %r73, i1 1, i1 0
	br i1 %r74, label %L22, label %L23
L22:
	%r75 = load i64, i64* %_P_num
	%r76 = load i64, i64* %fact
	%r77 = load %struct.ListNode*, %struct.ListNode** %_P_list
	call %struct.ListNode* @add(i64 %r75, i64 %r76, %struct.ListNode* %r77)
	br label %L24
L23:
	br label %L24
L24:
	%r78 = load i64, i64* %fact
	store i64 %r78, i64* %_ret_val
	%r79 = load i64, i64* %_ret_val
	ret i64 %r79
}

define i64 @maxfactorial(%struct.ListNode* %list, i64 %max) {
L25:
	%_ret_val = alloca i64
	%_P_list = alloca %struct.ListNode*
	store %struct.ListNode* %list, %struct.ListNode** %_P_list
	%_P_max = alloca i64
	store i64 %max, i64* %_P_max
	%row = alloca %struct.Row*
	%cell = alloca %struct.Cell*
	%fact = alloca i64
	%r80 = load %struct.ListNode*, %struct.ListNode** %_P_list
	%r81 = getelementptr %struct.ListNode, %struct.ListNode* %r80, i32 0, i32 0
	store ptr null, %struct.ListNode** %r81
	%r82 = load %struct.Row*, %struct.Row** @matrix
	store %struct.Row* %r82, %struct.Row** %row
	br label %L26
L26:
	%r83 = load %struct.Row*, %struct.Row** %row
	%r84 = icmp ne %struct.Row* %r83, null
	%r85 = select i1 %r84, i1 1, i1 0
	br i1 %r84, label %L27, label %L28
L27:
	%r86 = load %struct.Row*, %struct.Row** %row
	%r87 = getelementptr %struct.Row, %struct.Row* %r86, i32 0, i32 1
	%r88 = load %struct.Cell*, %struct.Cell** %r87
	store %struct.Cell* %r88, %struct.Cell** %cell
	%r89 = load %struct.Row*, %struct.Row** %row
	%r90 = getelementptr %struct.Row, %struct.Row* %r89, i32 0, i32 0
	%r91 = load %struct.Row*, %struct.Row** %r90
	store %struct.Row* %r91, %struct.Row** %row
	br label %L29
L28:
	%r108 = load i64, i64* %_P_max
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr0, i32 0, i32 0),i64 %r108)
	store i64 0, i64* %_ret_val
	%r109 = load i64, i64* %_ret_val
	ret i64 %r109
L29:
	%r92 = load %struct.Cell*, %struct.Cell** %cell
	%r93 = icmp ne %struct.Cell* %r92, null
	%r94 = select i1 %r93, i1 1, i1 0
	br i1 %r93, label %L30, label %L31
L30:
	%r95 = load %struct.Cell*, %struct.Cell** %cell
	%r96 = getelementptr %struct.Cell, %struct.Cell* %r95, i32 0, i32 1
	%r97 = load i64, i64* %r96
	%r98 = load %struct.ListNode*, %struct.ListNode** %_P_list
	%r99 = call i64 @factorial(i64 %r97, %struct.ListNode* %r98)
	store i64 %r99, i64* %fact
	%r100 = load %struct.Cell*, %struct.Cell** %cell
	%r101 = getelementptr %struct.Cell, %struct.Cell* %r100, i32 0, i32 0
	%r102 = load %struct.Cell*, %struct.Cell** %r101
	store %struct.Cell* %r102, %struct.Cell** %cell
	%r103 = load i64, i64* %fact
	%r104 = load i64, i64* %_P_max
	%r105 = icmp sgt i64 %r103, %r104
	%r106 = select i1 %r105, i1 1, i1 0
	br i1 %r106, label %L32, label %L33
L31:
	br label %L26
L32:
	%r107 = load i64, i64* %fact
	store i64 %r107, i64* %_P_max
	br label %L34
L33:
	br label %L34
L34:
	br label %L29
}

define i64 @newvalue(i64 %height, i64 %width) {
L35:
	%_ret_val = alloca i64
	%_P_height = alloca i64
	store i64 %height, i64* %_P_height
	%_P_width = alloca i64
	store i64 %width, i64* %_P_width
	%position = alloca i64
	call i64 @timesone(i64 0)
	%r110 = load i64, i64* %_P_height
	%r111 = load i64, i64* %_P_width
	%r112 = mul i64 %r110, %r111
	store i64 %r112, i64* %position
	%r113 = load i64, i64* @maxrange
	%r114 = load i64, i64* %position
	%r115 = sdiv i64 %r113, %r114
	%r116 = load i64, i64* %_P_height
	%r117 = add i64 %r115, %r116
	store i64 %r117, i64* %_ret_val
	%r118 = load i64, i64* %_ret_val
	ret i64 %r118
}

define %struct.Cell* @newcell(%struct.Cell* %cell, i64 %height, i64 %width) {
L36:
	%_ret_val = alloca %struct.Cell*
	%_P_cell = alloca %struct.Cell*
	store %struct.Cell* %cell, %struct.Cell** %_P_cell
	%_P_height = alloca i64
	store i64 %height, i64* %_P_height
	%_P_width = alloca i64
	store i64 %width, i64* %_P_width
	%r119 = load i64, i64* %_P_height
	%r120 = load i64, i64* %_P_width
	%r121 = call i64 @newvalue(i64 %r119, i64 %r120)
	%r122 = load %struct.Cell*, %struct.Cell** %_P_cell
	%r123 = getelementptr %struct.Cell, %struct.Cell* %r122, i32 0, i32 1
	store i64 %r121, i64* %r123
	%r124 = load i64, i64* %_P_width
	%r125 = icmp sgt i64 %r124, 1
	%r126 = select i1 %r125, i1 1, i1 0
	br i1 %r126, label %L37, label %L38
L37:
	%r127 = call i8* @malloc(i32 16)
	%r128 = bitcast i8* %r127 to %struct.Cell*
	%r129 = load i64, i64* %_P_height
	%r130 = load i64, i64* %_P_width
	%r131 = sub i64 %r130, 1
	%r132 = call %struct.Cell* @newcell(%struct.Cell* %r128, i64 %r129, i64 %r131)
	%r133 = load %struct.Cell*, %struct.Cell** %_P_cell
	%r134 = getelementptr %struct.Cell, %struct.Cell* %r133, i32 0, i32 0
	store %struct.Cell* %r132, %struct.Cell** %r134
	br label %L39
L38:
	%r135 = load %struct.Cell*, %struct.Cell** %_P_cell
	%r136 = getelementptr %struct.Cell, %struct.Cell* %r135, i32 0, i32 0
	store ptr null, %struct.Cell** %r136
	br label %L39
L39:
	%r137 = load %struct.Cell*, %struct.Cell** %_P_cell
	store %struct.Cell* %r137, %struct.Cell** %_ret_val
	%r138 = load %struct.Cell*, %struct.Cell** %_ret_val
	ret %struct.Cell* %r138
}

define %struct.Row* @newrow(%struct.Row* %row, i64 %height, i64 %width) {
L40:
	%_ret_val = alloca %struct.Row*
	%_P_row = alloca %struct.Row*
	store %struct.Row* %row, %struct.Row** %_P_row
	%_P_height = alloca i64
	store i64 %height, i64* %_P_height
	%_P_width = alloca i64
	store i64 %width, i64* %_P_width
	%r139 = call i8* @malloc(i32 16)
	%r140 = bitcast i8* %r139 to %struct.Cell*
	%r141 = load i64, i64* %_P_height
	%r142 = load i64, i64* %_P_width
	%r143 = call %struct.Cell* @newcell(%struct.Cell* %r140, i64 %r141, i64 %r142)
	%r144 = load %struct.Row*, %struct.Row** %_P_row
	%r145 = getelementptr %struct.Row, %struct.Row* %r144, i32 0, i32 1
	store %struct.Cell* %r143, %struct.Cell** %r145
	%r146 = load i64, i64* %_P_height
	%r147 = icmp sgt i64 %r146, 1
	%r148 = select i1 %r147, i1 1, i1 0
	br i1 %r148, label %L41, label %L42
L41:
	%r149 = call i8* @malloc(i32 16)
	%r150 = bitcast i8* %r149 to %struct.Row*
	%r151 = load i64, i64* %_P_height
	%r152 = sub i64 %r151, 1
	%r153 = load i64, i64* %_P_width
	%r154 = call %struct.Row* @newrow(%struct.Row* %r150, i64 %r152, i64 %r153)
	%r155 = load %struct.Row*, %struct.Row** %_P_row
	%r156 = getelementptr %struct.Row, %struct.Row* %r155, i32 0, i32 0
	store %struct.Row* %r154, %struct.Row** %r156
	br label %L43
L42:
	%r157 = load %struct.Row*, %struct.Row** %_P_row
	%r158 = getelementptr %struct.Row, %struct.Row* %r157, i32 0, i32 0
	store ptr null, %struct.Row** %r158
	br label %L43
L43:
	%r159 = load %struct.Row*, %struct.Row** %_P_row
	store %struct.Row* %r159, %struct.Row** %_ret_val
	%r160 = load %struct.Row*, %struct.Row** %_ret_val
	ret %struct.Row* %r160
}

define i64 @newmatrix(i64 %height, i64 %width) {
L44:
	%_ret_val = alloca i64
	%_P_height = alloca i64
	store i64 %height, i64* %_P_height
	%_P_width = alloca i64
	store i64 %width, i64* %_P_width
	%r161 = call i8* @malloc(i32 16)
	%r162 = bitcast i8* %r161 to %struct.Row*
	%r163 = load i64, i64* %_P_height
	%r164 = load i64, i64* %_P_width
	%r165 = call %struct.Row* @newrow(%struct.Row* %r162, i64 %r163, i64 %r164)
	store %struct.Row* %r165, %struct.Row** @matrix
	store i64 0, i64* %_ret_val
	%r166 = load i64, i64* %_ret_val
	ret i64 %r166
}

define i64 @getmatrixsize(i64 %matrixsize) {
L45:
	%_ret_val = alloca i64
	%_P_matrixsize = alloca i64
	store i64 %matrixsize, i64* %_P_matrixsize
	%r167 = load i64, i64* %_P_matrixsize
	%r168 = icmp sle i64 %r167, 0
	%r169 = select i1 %r168, i1 1, i1 0
	br i1 %r169, label %L46, label %L47
L46:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0),i64* %_P_matrixsize)
	%r170 = load i64, i64* %_P_matrixsize
	call i64 @getmatrixsize(i64 %r170)
	br label %L48
L47:
	%r171 = load i64, i64* %_P_matrixsize
	store i64 %r171, i64* %_ret_val
	%r172 = load i64, i64* %_ret_val
	ret i64 %r172
L48:
	%r173 = load i64, i64* %_P_matrixsize
	store i64 %r173, i64* %_ret_val
	%r174 = load i64, i64* %_ret_val
	ret i64 %r174
}

define i64 @getmaxrange(i64 %maxrange) {
L49:
	%_ret_val = alloca i64
	%_P_maxrange = alloca i64
	store i64 %maxrange, i64* %_P_maxrange
	%r175 = load i64, i64* %_P_maxrange
	%r176 = icmp sle i64 %r175, 1
	%r177 = select i1 %r176, i1 1, i1 0
	br i1 %r177, label %L50, label %L51
L50:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0),i64* %_P_maxrange)
	%r178 = load i64, i64* %_P_maxrange
	call i64 @getmaxrange(i64 %r178)
	br label %L52
L51:
	%r179 = load i64, i64* %_P_maxrange
	store i64 %r179, i64* %_ret_val
	%r180 = load i64, i64* %_ret_val
	ret i64 %r180
L52:
	%r181 = load i64, i64* %_P_maxrange
	store i64 %r181, i64* %_ret_val
	%r182 = load i64, i64* %_ret_val
	ret i64 %r182
}

define i64 @main() {
L53:
	%_ret_val = alloca i64
	%height = alloca i64
	%width = alloca i64
	store i64 0, i64* %height
	store i64 0, i64* %width
	store i64 0, i64* @maxrange
	%r183 = load i64, i64* %height
	%r184 = call i64 @getmatrixsize(i64 %r183)
	store i64 %r184, i64* %height
	%r185 = load i64, i64* %height
	store i64 %r185, i64* %width
	%r186 = load i64, i64* @maxrange
	%r187 = call i64 @getmaxrange(i64 %r186)
	store i64 %r187, i64* @maxrange
	%r188 = load i64, i64* %height
	%r189 = load i64, i64* %width
	call i64 @newmatrix(i64 %r188, i64 %r189)
	%r190 = call i8* @malloc(i32 24)
	%r191 = bitcast i8* %r190 to %struct.ListNode*
	call i64 @maxfactorial(%struct.ListNode* %r191, i64 0)
	store i64 0, i64* %_ret_val
	%r192 = load i64, i64* %_ret_val
	ret i64 %r192
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.fstr0 = private unnamed_addr constant [18 x i8] c"Max Factorial=%ld\00", align 1