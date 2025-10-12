; ModuleID = 'lcc'
source_filename = "lcc"

@counter = internal global i32 0
@0 = private unnamed_addr constant [23 x i8] c"37.static_file.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [23 x i8] c"37.static_file.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define internal i32 @helper(i32 %0) {
entry:
  %value = alloca i32, align 4
  store i32 %0, ptr %value, align 4
  %1 = load i32, ptr %value, align 4
  %2 = load i32, ptr @counter, align 4
  %3 = add i32 %1, %2
  ret i32 %3
}

define i32 @bump() {
entry:
  %0 = load i32, ptr @counter, align 4
  %1 = add i32 %0, 1
  store i32 %1, ptr @counter, align 4
  %2 = load i32, ptr @counter, align 4
  ret i32 %2
}

define i32 @bump_with_helper() {
entry:
  %0 = load i32, ptr @counter, align 4
  %1 = add i32 %0, 1
  store i32 %1, ptr @counter, align 4
  %2 = load i32, ptr @counter, align 4
  %3 = call i32 @helper(i32 %2)
  ret i32 %3
}

define i32 @main() {
entry:
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  %0 = call i32 @helper(i32 5)
  %1 = icmp ne i32 %0, 5
  br i1 %1, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %2 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %3 = call i32 @bump()
  %4 = icmp ne i32 %3, 1
  br i1 %4, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %5 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @bump()
  %7 = icmp ne i32 %6, 2
  br i1 %7, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %8 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @helper(i32 3)
  %10 = icmp ne i32 %9, 5
  br i1 %10, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %11 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @bump_with_helper()
  %13 = icmp ne i32 %12, 6
  br i1 %13, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %14 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %15 = load i32, ptr %err, align 4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %then13, label %else14

then13:                                           ; preds = %if.end12
  %17 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end15

else14:                                           ; preds = %if.end12
  %18 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %19 = load i32, ptr %err, align 4
  ret i32 %19
}
