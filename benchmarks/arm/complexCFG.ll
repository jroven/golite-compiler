source_filename = "complexCFG"
target triple = "x86_64-linux-gnu"
define i64 @foo(i64 %a) {
L0:
	%_ret_val = alloca i64
	%_P_a = alloca i64
	store i64 %a, i64* %_P_a
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr0, i32 0, i32 0))
	%r0 = load i64, i64* %_P_a
	%r1 = icmp sgt i64 %r0, 10
	%r2 = select i1 %r1, i1 1, i1 0
	br i1 %r2, label %L1, label %L2
L1:
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr1, i32 0, i32 0))
	store i64 4, i64* %_ret_val
	%r3 = load i64, i64* %_ret_val
	ret i64 %r3
L2:
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr2, i32 0, i32 0))
	br label %L3
L3:
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr3, i32 0, i32 0))
	store i64 8, i64* %_ret_val
	%r4 = load i64, i64* %_ret_val
	ret i64 %r4
}

define i64 @bar(i64 %b) {
L4:
	%_ret_val = alloca i64
	%_P_b = alloca i64
	store i64 %b, i64* %_P_b
	%r5 = load i64, i64* %_P_b
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr4, i32 0, i32 0),i64 %r5)
	br label %L5
L5:
	%r6 = load i64, i64* %_P_b
	%r7 = icmp sgt i64 %r6, 10
	%r8 = select i1 %r7, i1 1, i1 0
	br i1 %r7, label %L6, label %L7
L6:
	%r9 = load i64, i64* %_P_b
	%r10 = sub i64 %r9, 1
	store i64 %r10, i64* %_P_b
	%r11 = load i64, i64* %_P_b
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr5, i32 0, i32 0),i64 %r11)
	br label %L5
L7:
	%r12 = load i64, i64* %_P_b
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr6, i32 0, i32 0),i64 %r12)
	store i64 2, i64* %_ret_val
	%r13 = load i64, i64* %_ret_val
	ret i64 %r13
}

define i64 @main() {
L8:
	%_ret_val = alloca i64
	%a = alloca i64
	%b = alloca i64
	%c = alloca i64
	%d = alloca i64
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr7, i32 0, i32 0))
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0),i64* %a)
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr8, i32 0, i32 0))
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0),i64* %b)
	%r14 = load i64, i64* %a
	%r15 = call i64 @foo(i64 %r14)
	store i64 %r15, i64* %c
	%r16 = load i64, i64* %c
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr9, i32 0, i32 0),i64 %r16)
	%r17 = load i64, i64* %b
	%r18 = call i64 @bar(i64 %r17)
	store i64 %r18, i64* %d
	%r19 = load i64, i64* %d
	call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr10, i32 0, i32 0),i64 %r19)
	store i64 0, i64* %_ret_val
	%r20 = load i64, i64* %_ret_val
	ret i64 %r20
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.fstr0 = private unnamed_addr constant [26 x i8] c"In foo, comparing a > 10\0A\00", align 1
@.fstr1 = private unnamed_addr constant [28 x i8] c"In true block, returning 4\0A\00", align 1
@.fstr2 = private unnamed_addr constant [35 x i8] c"In false block, not returning yet\0A\00", align 1
@.fstr3 = private unnamed_addr constant [33 x i8] c"Exited conditional, returning 8\0A\00", align 1
@.fstr4 = private unnamed_addr constant [61 x i8] c"In bar, about to begin for loop (b > 10). Currently b = %ld\0A\00", align 1
@.fstr5 = private unnamed_addr constant [28 x i8] c"Decremented b, now b = %ld\0A\00", align 1
@.fstr6 = private unnamed_addr constant [39 x i8] c"Exited for loop, b = %ld. Returning 2\0A\00", align 1
@.fstr7 = private unnamed_addr constant [25 x i8] c"Type in a value for a:\t\00", align 1
@.fstr8 = private unnamed_addr constant [25 x i8] c"Type in a value for b:\t\00", align 1
@.fstr9 = private unnamed_addr constant [14 x i8] c"foo(a) = %ld\0A\00", align 1
@.fstr10 = private unnamed_addr constant [14 x i8] c"bar(b) = %ld\0A\00", align 1