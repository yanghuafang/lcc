; ModuleID = 'lcc'
source_filename = "lcc"

%struct.Data = type { i32, i32 }

@0 = private unnamed_addr constant [31 x i8] c"29.struct_pointer_move.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"29.struct_pointer_move.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %p = alloca ptr, align 8
  %val = alloca i32, align 4
  %id = alloca i32, align 4
  %data = alloca [4 x %struct.Data], align 8
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  %0 = getelementptr %struct.Data, ptr %data, i32 0
  %1 = getelementptr %struct.Data, ptr %0, i32 0, i32 0
  store i32 10, ptr %1, align 4
  %2 = load i32, ptr %1, align 4
  %3 = getelementptr %struct.Data, ptr %data, i32 0
  %4 = getelementptr %struct.Data, ptr %3, i32 0, i32 1
  store i32 12, ptr %4, align 4
  %5 = load i32, ptr %4, align 4
  %6 = getelementptr %struct.Data, ptr %data, i32 1
  %7 = getelementptr %struct.Data, ptr %6, i32 0, i32 0
  store i32 20, ptr %7, align 4
  %8 = load i32, ptr %7, align 4
  %9 = getelementptr %struct.Data, ptr %data, i32 1
  %10 = getelementptr %struct.Data, ptr %9, i32 0, i32 1
  store i32 24, ptr %10, align 4
  %11 = load i32, ptr %10, align 4
  %12 = getelementptr %struct.Data, ptr %data, i32 2
  %13 = getelementptr %struct.Data, ptr %12, i32 0, i32 0
  store i32 30, ptr %13, align 4
  %14 = load i32, ptr %13, align 4
  %15 = getelementptr %struct.Data, ptr %data, i32 2
  %16 = getelementptr %struct.Data, ptr %15, i32 0, i32 1
  store i32 36, ptr %16, align 4
  %17 = load i32, ptr %16, align 4
  %18 = getelementptr %struct.Data, ptr %data, i32 3
  %19 = getelementptr %struct.Data, ptr %18, i32 0, i32 0
  store i32 40, ptr %19, align 4
  %20 = load i32, ptr %19, align 4
  %21 = getelementptr %struct.Data, ptr %data, i32 3
  %22 = getelementptr %struct.Data, ptr %21, i32 0, i32 1
  store i32 48, ptr %22, align 4
  %23 = load i32, ptr %22, align 4
  store ptr %data, ptr %p, align 8
  %24 = load ptr, ptr %p, align 8
  %25 = getelementptr %struct.Data, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %25, align 4
  store i32 %26, ptr %id, align 4
  %27 = load i32, ptr %id, align 4
  %28 = load ptr, ptr %p, align 8
  %29 = getelementptr %struct.Data, ptr %28, i32 0, i32 1
  %30 = load i32, ptr %29, align 4
  store i32 %30, ptr %val, align 4
  %31 = load i32, ptr %val, align 4
  %32 = load i32, ptr %id, align 4
  %33 = icmp ne i32 %32, 10
  br i1 %33, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %34 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %35 = load i32, ptr %val, align 4
  %36 = icmp ne i32 %35, 12
  br i1 %36, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %37 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %38 = load ptr, ptr %p, align 8
  %39 = getelementptr %struct.Data, ptr %38, i32 1
  store ptr %39, ptr %p, align 8
  %40 = load ptr, ptr %p, align 8
  %41 = load ptr, ptr %p, align 8
  %42 = getelementptr %struct.Data, ptr %41, i32 0, i32 0
  %43 = load i32, ptr %42, align 4
  store i32 %43, ptr %id, align 4
  %44 = load i32, ptr %id, align 4
  %45 = load ptr, ptr %p, align 8
  %46 = getelementptr %struct.Data, ptr %45, i32 0, i32 1
  %47 = load i32, ptr %46, align 4
  store i32 %47, ptr %val, align 4
  %48 = load i32, ptr %val, align 4
  %49 = load i32, ptr %id, align 4
  %50 = icmp ne i32 %49, 20
  br i1 %50, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %51 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %52 = load i32, ptr %val, align 4
  %53 = icmp ne i32 %52, 24
  br i1 %53, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %54 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %55 = load ptr, ptr %p, align 8
  %56 = getelementptr %struct.Data, ptr %55, i64 1
  store ptr %56, ptr %p, align 8
  %57 = load ptr, ptr %p, align 8
  %58 = load ptr, ptr %p, align 8
  %59 = getelementptr %struct.Data, ptr %58, i32 0, i32 0
  %60 = load i32, ptr %59, align 4
  store i32 %60, ptr %id, align 4
  %61 = load i32, ptr %id, align 4
  %62 = load i32, ptr %id, align 4
  %63 = icmp ne i32 %62, 30
  br i1 %63, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %64 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %65 = load ptr, ptr %p, align 8
  %66 = getelementptr %struct.Data, ptr %65, i64 1
  store ptr %66, ptr %p, align 8
  %67 = load ptr, ptr %p, align 8
  %68 = getelementptr %struct.Data, ptr %67, i32 0, i32 0
  %69 = load i32, ptr %68, align 4
  store i32 %69, ptr %id, align 4
  %70 = load i32, ptr %id, align 4
  %71 = load ptr, ptr %p, align 8
  %72 = getelementptr %struct.Data, ptr %71, i32 0, i32 1
  %73 = load i32, ptr %72, align 4
  store i32 %73, ptr %val, align 4
  %74 = load i32, ptr %val, align 4
  %75 = load i32, ptr %id, align 4
  %76 = icmp ne i32 %75, 40
  br i1 %76, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %77 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %78 = load i32, ptr %val, align 4
  %79 = icmp ne i32 %78, 48
  br i1 %79, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %80 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %81 = getelementptr %struct.Data, ptr %data, i32 3
  store ptr %81, ptr %p, align 8
  %82 = load ptr, ptr %p, align 8
  %83 = load ptr, ptr %p, align 8
  %84 = getelementptr %struct.Data, ptr %83, i32 -1
  store ptr %84, ptr %p, align 8
  %85 = load ptr, ptr %p, align 8
  %86 = load ptr, ptr %p, align 8
  %87 = getelementptr %struct.Data, ptr %86, i32 0, i32 0
  %88 = load i32, ptr %87, align 4
  store i32 %88, ptr %id, align 4
  %89 = load i32, ptr %id, align 4
  %90 = load i32, ptr %id, align 4
  %91 = icmp ne i32 %90, 30
  br i1 %91, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4
  %92 = load i32, ptr %err, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %93 = load ptr, ptr %p, align 8
  %94 = getelementptr %struct.Data, ptr %93, i64 -1
  store ptr %94, ptr %p, align 8
  %95 = load ptr, ptr %p, align 8
  %96 = load ptr, ptr %p, align 8
  %97 = getelementptr %struct.Data, ptr %96, i32 0, i32 0
  %98 = load i32, ptr %97, align 4
  store i32 %98, ptr %id, align 4
  %99 = load i32, ptr %id, align 4
  %100 = load i32, ptr %id, align 4
  %101 = icmp ne i32 %100, 20
  br i1 %101, label %then22, label %else23

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4
  %102 = load i32, ptr %err, align 4
  br label %if.end24

else23:                                           ; preds = %if.end21
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %103 = load ptr, ptr %p, align 8
  %104 = getelementptr %struct.Data, ptr %103, i64 -1
  store ptr %104, ptr %p, align 8
  %105 = load ptr, ptr %p, align 8
  %106 = getelementptr %struct.Data, ptr %105, i32 0, i32 0
  %107 = load i32, ptr %106, align 4
  store i32 %107, ptr %id, align 4
  %108 = load i32, ptr %id, align 4
  %109 = load i32, ptr %id, align 4
  %110 = icmp ne i32 %109, 10
  br i1 %110, label %then25, label %else26

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4
  %111 = load i32, ptr %err, align 4
  br label %if.end27

else26:                                           ; preds = %if.end24
  br label %if.end27

if.end27:                                         ; preds = %else26, %then25
  %112 = load i32, ptr %err, align 4
  %113 = icmp eq i32 %112, 0
  br i1 %113, label %then28, label %else29

then28:                                           ; preds = %if.end27
  %114 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end30

else29:                                           ; preds = %if.end27
  %115 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end30

if.end30:                                         ; preds = %else29, %then28
  %116 = load i32, ptr %err, align 4
  ret i32 %116
}
