; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [27 x i8] c"35.typedef_builtin.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [27 x i8] c"35.typedef_builtin.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define void @helper(i64 %0, i32 %1, ptr %2) {
entry:
  %p = alloca ptr, align 8
  %step = alloca i32, align 4
  %nbytes = alloca i64, align 8
  store i64 %0, ptr %nbytes, align 4
  store i32 %1, ptr %step, align 4
  store ptr %2, ptr %p, align 8
  %3 = load ptr, ptr %p, align 8
  %4 = load i64, ptr %nbytes, align 4
  %5 = load i32, ptr %step, align 4
  %6 = zext i32 %5 to i64
  %7 = add i64 %4, %6
  %8 = trunc i64 %7 to i32
  store i32 %8, ptr %3, align 4
  %9 = load i32, ptr %3, align 4
  ret void
}

define i32 @main() {
entry:
  %result = alloca i32, align 4
  %p = alloca ptr, align 8
  %x = alloca i32, align 4
  %c = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  store i32 7, ptr %c, align 4
  store i32 10, ptr %x, align 4
  store ptr %x, ptr %p, align 8
  %0 = load i32, ptr %c, align 4
  %1 = load ptr, ptr %p, align 8
  call void @helper(i64 42, i32 %0, ptr %1)
  %2 = load i32, ptr %c, align 4
  %3 = icmp ne i32 %2, 7
  br i1 %3, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %4 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %5 = load i32, ptr %x, align 4
  %6 = icmp ne i32 %5, 49
  br i1 %6, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %7 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %8 = load ptr, ptr %p, align 8
  %9 = load i32, ptr %8, align 4
  store i32 %9, ptr %result, align 4
  %10 = load i32, ptr %result, align 4
  %11 = icmp ne i32 %10, 49
  br i1 %11, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %12 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %13 = load i32, ptr %err, align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %then7, label %else8

then7:                                            ; preds = %if.end6
  %15 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end9

else8:                                            ; preds = %if.end6
  %16 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %17 = load i32, ptr %err, align 4
  ret i32 %17
}
