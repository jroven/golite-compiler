source_filename = "malloc"
target triple = "x86_64-linux-gnu"
%struct.Point2D = type {i64, i64}
define i64 @main() {
L0:
	%_ret_val = alloca i64
	%a = alloca %struct.Point2D*
	%r0 = call i8* @malloc(i32 16)
	%r1 = bitcast i8* %r0 to %struct.Point2D*
	store %struct.Point2D* %r1, %struct.Point2D** %a
	%r2 = load %struct.Point2D*, %struct.Point2D** %a
	%r3 = bitcast %struct.Point2D* %r2 to i8*
	call void @free(i8* %r3)
	store i64 0, i64* %_ret_val
	%r4 = load i64, i64* %_ret_val
	ret i64 %r4
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1