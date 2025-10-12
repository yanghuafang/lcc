; ModuleID = 'lcc'
source_filename = "lcc"

%struct.Student = type { i32, ptr, i8, float }
%struct.Padded = type { i8, i64 }
%union.ID = type { ptr }

@0 = private unnamed_addr constant [17 x i8] c"9.sizeof.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"9.sizeof.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %longs = alloca [4 x i64], align 8
  %students = alloca [3 x %struct.Student], align 8
  %padded = alloca %struct.Padded, align 8
  %sex = alloca i32, align 4
  %id = alloca %union.ID, align 8
  %student = alloca %struct.Student, align 8
  %pc = alloca ptr, align 8
  %d = alloca double, align 8
  %f = alloca float, align 4
  %l = alloca i64, align 8
  %i = alloca i32, align 4
  %c = alloca i8, align 1
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  br i1 false, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %0 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  br i1 false, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %1 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  br i1 false, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %2 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  br i1 false, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %3 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  br i1 false, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %4 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  br i1 false, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %5 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  br i1 false, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %6 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  br i1 false, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4
  %7 = load i32, ptr %err, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  br i1 false, label %then22, label %else23

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4
  %8 = load i32, ptr %err, align 4
  br label %if.end24

else23:                                           ; preds = %if.end21
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  br i1 false, label %then25, label %else26

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4
  %9 = load i32, ptr %err, align 4
  br label %if.end27

else26:                                           ; preds = %if.end24
  br label %if.end27

if.end27:                                         ; preds = %else26, %then25
  br i1 false, label %then28, label %else29

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4
  %10 = load i32, ptr %err, align 4
  br label %if.end30

else29:                                           ; preds = %if.end27
  br label %if.end30

if.end30:                                         ; preds = %else29, %then28
  br i1 false, label %then31, label %else32

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4
  %11 = load i32, ptr %err, align 4
  br label %if.end33

else32:                                           ; preds = %if.end30
  br label %if.end33

if.end33:                                         ; preds = %else32, %then31
  br i1 false, label %then34, label %else35

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4
  %12 = load i32, ptr %err, align 4
  br label %if.end36

else35:                                           ; preds = %if.end33
  br label %if.end36

if.end36:                                         ; preds = %else35, %then34
  br i1 false, label %then37, label %else38

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4
  %13 = load i32, ptr %err, align 4
  br label %if.end39

else38:                                           ; preds = %if.end36
  br label %if.end39

if.end39:                                         ; preds = %else38, %then37
  br i1 false, label %then40, label %else41

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4
  %14 = load i32, ptr %err, align 4
  br label %if.end42

else41:                                           ; preds = %if.end39
  br label %if.end42

if.end42:                                         ; preds = %else41, %then40
  br i1 false, label %then43, label %else44

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4
  %15 = load i32, ptr %err, align 4
  br label %if.end45

else44:                                           ; preds = %if.end42
  br label %if.end45

if.end45:                                         ; preds = %else44, %then43
  br i1 false, label %then46, label %else47

then46:                                           ; preds = %if.end45
  store i32 1, ptr %err, align 4
  %16 = load i32, ptr %err, align 4
  br label %if.end48

else47:                                           ; preds = %if.end45
  br label %if.end48

if.end48:                                         ; preds = %else47, %then46
  br i1 false, label %then49, label %else50

then49:                                           ; preds = %if.end48
  store i32 1, ptr %err, align 4
  %17 = load i32, ptr %err, align 4
  br label %if.end51

else50:                                           ; preds = %if.end48
  br label %if.end51

if.end51:                                         ; preds = %else50, %then49
  %18 = load i32, ptr %err, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %then52, label %else53

then52:                                           ; preds = %if.end51
  %20 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end54

else53:                                           ; preds = %if.end51
  %21 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end54

if.end54:                                         ; preds = %else53, %then52
  %22 = load i32, ptr %err, align 4
  ret i32 %22
}
