; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [24 x i8] c"1.builtin_types.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"1.builtin_types.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %bf = alloca i1, align 1
  %bt = alloca i1, align 1
  %db = alloca double, align 8
  %fl = alloca float, align 4
  %uln = alloca i64, align 8
  %uint = alloca i32, align 4
  %uch = alloca i8, align 1
  %ln = alloca i64, align 8
  %in = alloca i32, align 4
  %sh = alloca i16, align 2
  %ch = alloca i8, align 1
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  store i8 65, ptr %ch, align 1
  store i16 -1024, ptr %sh, align 2
  store i32 -12345678, ptr %in, align 4
  store i64 -1234567890, ptr %ln, align 4
  store i8 -6, ptr %uch, align 1
  store i32 180150000, ptr %uint, align 4
  store i64 9876043210, ptr %uln, align 4
  store float 0x400921FB40000000, ptr %fl, align 4
  store double 0x400921FB54442D11, ptr %db, align 8
  store i1 true, ptr %bt, align 1
  store i1 false, ptr %bf, align 1
  %0 = load i8, ptr %ch, align 1
  %1 = sext i8 %0 to i32
  %2 = icmp ne i32 %1, 65
  br i1 %2, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %3 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %4 = load i16, ptr %sh, align 2
  %5 = sext i16 %4 to i32
  %6 = icmp ne i32 %5, -1024
  br i1 %6, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %7 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %8 = load i32, ptr %in, align 4
  %9 = icmp ne i32 %8, -12345678
  br i1 %9, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %10 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %11 = load i64, ptr %ln, align 4
  %12 = icmp ne i64 %11, -1234567890
  br i1 %12, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %13 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %14 = load i8, ptr %uch, align 1
  %15 = zext i8 %14 to i32
  %16 = icmp ne i32 %15, 250
  br i1 %16, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %17 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %18 = load i32, ptr %uint, align 4
  %19 = icmp ne i32 %18, 180150000
  br i1 %19, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %20 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %21 = load i64, ptr %uln, align 4
  %22 = icmp ne i64 %21, 9876043210
  br i1 %22, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %23 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %24 = load i1, ptr %bt, align 1
  %25 = zext i1 %24 to i32
  %26 = icmp ne i32 %25, 1
  br i1 %26, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4
  %27 = load i32, ptr %err, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %28 = load i1, ptr %bf, align 1
  %29 = zext i1 %28 to i32
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %then22, label %else23

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4
  %31 = load i32, ptr %err, align 4
  br label %if.end24

else23:                                           ; preds = %if.end21
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %32 = load i32, ptr %err, align 4
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %then25, label %else26

then25:                                           ; preds = %if.end24
  %34 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end27

else26:                                           ; preds = %if.end24
  %35 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end27

if.end27:                                         ; preds = %else26, %then25
  %36 = load i32, ptr %err, align 4
  ret i32 %36
}
