; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [18 x i8] c"23.return.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [18 x i8] c"23.return.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @checkAge1(i32 %0) {
entry:
  %age = alloca i32, align 4
  store i32 %0, ptr %age, align 4
  %1 = load i32, ptr %age, align 4
  %2 = icmp slt i32 %1, 18
  br i1 %2, label %then, label %else

then:                                             ; preds = %entry
  %3 = load i32, ptr %age, align 4
  ret i32 %3

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else
  %4 = load i32, ptr %age, align 4
  %5 = icmp eq i32 %4, 18
  br i1 %5, label %then1, label %else2

then1:                                            ; preds = %if.end
  %6 = load i32, ptr %age, align 4
  ret i32 %6

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2
  %7 = load i32, ptr %age, align 4
  %8 = icmp sgt i32 %7, 18
  br i1 %8, label %then4, label %else5

then4:                                            ; preds = %if.end3
  %9 = load i32, ptr %age, align 4
  ret i32 %9

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5
  %10 = load i32, ptr %age, align 4
  ret i32 %10
}

define i32 @checkAge2(i32 %0) {
entry:
  %age = alloca i32, align 4
  store i32 %0, ptr %age, align 4
  %1 = load i32, ptr %age, align 4
  %2 = icmp slt i32 %1, 18
  br i1 %2, label %then, label %else

then:                                             ; preds = %entry
  %3 = load i32, ptr %age, align 4
  ret i32 %3

else:                                             ; preds = %entry
  %4 = load i32, ptr %age, align 4
  %5 = icmp eq i32 %4, 18
  br i1 %5, label %then1, label %else2

then1:                                            ; preds = %else
  %6 = load i32, ptr %age, align 4
  ret i32 %6

else2:                                            ; preds = %else
  %7 = load i32, ptr %age, align 4
  ret i32 %7
}

define i32 @checkAge3(i32 %0) {
entry:
  %age = alloca i32, align 4
  store i32 %0, ptr %age, align 4
  %1 = load i32, ptr %age, align 4
  %2 = icmp sle i32 %1, 6
  br i1 %2, label %then, label %else

then:                                             ; preds = %entry
  %3 = load i32, ptr %age, align 4
  ret i32 %3

else:                                             ; preds = %entry
  %4 = load i32, ptr %age, align 4
  %5 = icmp sgt i32 %4, 6
  %6 = load i32, ptr %age, align 4
  %7 = icmp sle i32 %6, 14
  %8 = select i1 %5, i1 %7, i1 false
  br i1 %8, label %then1, label %else2

then1:                                            ; preds = %else
  %9 = load i32, ptr %age, align 4
  ret i32 %9

else2:                                            ; preds = %else
  %10 = load i32, ptr %age, align 4
  %11 = icmp sgt i32 %10, 14
  %12 = load i32, ptr %age, align 4
  %13 = icmp sle i32 %12, 18
  %14 = select i1 %11, i1 %13, i1 false
  br i1 %14, label %then3, label %else4

then3:                                            ; preds = %else2
  %15 = load i32, ptr %age, align 4
  ret i32 %15

else4:                                            ; preds = %else2
  %16 = load i32, ptr %age, align 4
  %17 = icmp sgt i32 %16, 18
  %18 = load i32, ptr %age, align 4
  %19 = icmp sle i32 %18, 35
  %20 = select i1 %17, i1 %19, i1 false
  br i1 %20, label %then5, label %else6

then5:                                            ; preds = %else4
  %21 = load i32, ptr %age, align 4
  ret i32 %21

else6:                                            ; preds = %else4
  br label %if.end

if.end:                                           ; preds = %else6
  br label %if.end7

if.end7:                                          ; preds = %if.end
  br label %if.end8

if.end8:                                          ; preds = %if.end7
  br label %if.end9

if.end9:                                          ; preds = %if.end8
  %22 = load i32, ptr %age, align 4
  ret i32 %22
}

define i32 @main() {
entry:
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  %0 = call i32 @checkAge1(i32 16)
  %1 = icmp ne i32 %0, 16
  br i1 %1, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %2 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %3 = call i32 @checkAge1(i32 18)
  %4 = icmp ne i32 %3, 18
  br i1 %4, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %5 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @checkAge1(i32 20)
  %7 = icmp ne i32 %6, 20
  br i1 %7, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %8 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @checkAge2(i32 16)
  %10 = icmp ne i32 %9, 16
  br i1 %10, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %11 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @checkAge2(i32 18)
  %13 = icmp ne i32 %12, 18
  br i1 %13, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %14 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %15 = call i32 @checkAge2(i32 20)
  %16 = icmp ne i32 %15, 20
  br i1 %16, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %17 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %18 = call i32 @checkAge3(i32 6)
  %19 = icmp ne i32 %18, 6
  br i1 %19, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %20 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %21 = call i32 @checkAge3(i32 35)
  %22 = icmp ne i32 %21, 35
  br i1 %22, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4
  %23 = load i32, ptr %err, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %24 = load i32, ptr %err, align 4
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %then22, label %else23

then22:                                           ; preds = %if.end21
  %26 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end24

else23:                                           ; preds = %if.end21
  %27 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %28 = load i32, ptr %err, align 4
  ret i32 %28
}
