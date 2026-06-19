; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [27 x i8] c"35.typedef_builtin.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [27 x i8] c"35.typedef_builtin.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define void @helper(i64 %0, i32 %1, i32* %2) {
entry:
  %p = alloca i32*, align 8
  %step = alloca i32, align 4
  %nbytes = alloca i64, align 8
  store i64 %0, i64* %nbytes, align 4
  store i32 %1, i32* %step, align 4
  store i32* %2, i32** %p, align 8
  %3 = load i32*, i32** %p, align 8
  %4 = load i64, i64* %nbytes, align 4
  %5 = load i32, i32* %step, align 4
  %6 = zext i32 %5 to i64
  %7 = add i64 %4, %6
  %8 = trunc i64 %7 to i32
  store i32 %8, i32* %3, align 4
  %9 = load i32, i32* %3, align 4
  ret void
}

define i32 @main() {
entry:
  %result = alloca i32, align 4
  %p = alloca i32*, align 8
  %x = alloca i32, align 4
  %c = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  store i32 7, i32* %c, align 4
  store i32 10, i32* %x, align 4
  store i32* %x, i32** %p, align 8
  %0 = load i32, i32* %c, align 4
  %1 = load i32*, i32** %p, align 8
  call void @helper(i64 42, i32 %0, i32* %1)
  %2 = load i32, i32* %c, align 4
  %3 = icmp ne i32 %2, 7
  br i1 %3, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %4 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %5 = load i32, i32* %x, align 4
  %6 = icmp ne i32 %5, 49
  br i1 %6, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %7 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %8 = load i32*, i32** %p, align 8
  %9 = load i32, i32* %8, align 4
  store i32 %9, i32* %result, align 4
  %10 = load i32, i32* %result, align 4
  %11 = icmp ne i32 %10, 49
  br i1 %11, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %12 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %13 = load i32, i32* %err, align 4
  %14 = icmp eq i32 %13, 0
  %. = select i1 %14, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0)
  %15 = call i32 (i8*, ...) @printf(i8* %.)
  %16 = load i32, i32* %err, align 4
  ret i32 %16
}
