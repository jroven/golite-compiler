source_filename = "basicfield"
target triple = "x86_64-linux-gnu"
%struct.Point = type {i64, i64}
define i64 @main() {
L0:
	%_ret_val = alloca i64
	%x = alloca i64
	%p = alloca %struct.Point*
	%r0 = call i8* @malloc(i32 16)
	%r1 = bitcast i8* %r0 to %struct.Point*
	store %struct.Point* %r1, %struct.Point** %p
	%r2 = load %struct.Point*, %struct.Point** %p
	%r3 = getelementptr %struct.Point, %struct.Point* %r2, i32 0, i32 0
	store i64 5, i64* %r3
	%r4 = load %struct.Point*, %struct.Point** %p
	%r5 = getelementptr %struct.Point, %struct.Point* %r4, i32 0, i32 0
	%r6 = load i64, i64* %r5
	store i64 %r6, i64* %x
	%r7 = load i64, i64* %x
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr0, i32 0, i32 0),i64 %r7)
	store i64 0, i64* %_ret_val
	%r8 = load i64, i64* %_ret_val
	ret i64 %r8
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.fstr0 = private unnamed_addr constant [11 x i8] c"p.x = %ld\0A\00", align 1