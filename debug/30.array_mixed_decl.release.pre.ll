; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [28 x i8] c"30.array_mixed_decl.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [28 x i8] c"30.array_mixed_decl.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %b = alloca i32, align 4
  %a = alloca [4 x i32], align 4
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  %0 = getelementptr i32, ptr %a, i32 0
  store i32 10, ptr %0, align 4
  %1 = load i32, ptr %0, align 4
  %2 = getelementptr i32, ptr %a, i32 1
  store i32 20, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  store i32 30, ptr %b, align 4
  %4 = load i32, ptr %b, align 4
  %5 = getelementptr i32, ptr %a, i32 0
  %6 = load i32, ptr %5, align 4
  %7 = icmp ne i32 %6, 10
  br i1 %7, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %8 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %9 = getelementptr i32, ptr %a, i32 1
  %10 = load i32, ptr %9, align 4
  %11 = icmp ne i32 %10, 20
  br i1 %11, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %12 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %13 = load i32, ptr %b, align 4
  %14 = icmp ne i32 %13, 30
  br i1 %14, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %15 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %16 = load i32, ptr %err, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %then7, label %else8

then7:                                            ; preds = %if.end6
  %18 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end9

else8:                                            ; preds = %if.end6
  %19 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %20 = load i32, ptr %err, align 4
  ret i32 %20
}
