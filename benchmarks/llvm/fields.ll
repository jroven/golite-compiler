source_filename = "fields"
target triple = "x86_64-linux-gnu"
%struct.Point2D = type {%struct.Point2D*, i64}
define i64 @main() {
L0:
	%_ret_val = alloca i64
	%newPt = alloca %struct.Point2D*
	%a = alloca i64
	store ptr null, %struct.Point2D** %newPt
	%r0 = call i8* @malloc(i32 16)
	%r1 = bitcast i8* %r0 to %struct.Point2D*
	store %struct.Point2D* %r1, %struct.Point2D** %newPt
	%r2 = load %struct.Point2D*, %struct.Point2D** %newPt
	%r3 = getelementptr %struct.Point2D, %struct.Point2D* %r2, i32 0, i32 0
	store ptr null, %struct.Point2D** %r3
	%r4 = call i8* @malloc(i32 16)
	%r5 = bitcast i8* %r4 to %struct.Point2D*
	%r6 = load %struct.Point2D*, %struct.Point2D** %newPt
	%r7 = getelementptr %struct.Point2D, %struct.Point2D* %r6, i32 0, i32 0
	store %struct.Point2D* %r5, %struct.Point2D** %r7
	%r8 = load %struct.Point2D*, %struct.Point2D** %newPt
	%r9 = getelementptr %struct.Point2D, %struct.Point2D* %r8, i32 0, i32 0
	%r10 = load %struct.Point2D*, %struct.Point2D** %r9
	%r11 = getelementptr %struct.Point2D, %struct.Point2D* %r10, i32 0, i32 1
	store i64 5, i64* %r11
	%r12 = load %struct.Point2D*, %struct.Point2D** %newPt
	%r13 = getelementptr %struct.Point2D, %struct.Point2D* %r12, i32 0, i32 0
	%r14 = load %struct.Point2D*, %struct.Point2D** %r13
	%r15 = getelementptr %struct.Point2D, %struct.Point2D* %r14, i32 0, i32 1
	%r16 = load i64, i64* %r15
	store i64 %r16, i64* %a
	store i64 0, i64* %_ret_val
	%r17 = load i64, i64* %_ret_val
	ret i64 %r17
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1