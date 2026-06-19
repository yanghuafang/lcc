; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%struct.Data = type { i32, i32 }

@0 = private unnamed_addr constant [31 x i8] c"29.struct_pointer_move.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"29.struct_pointer_move.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %p = alloca %struct.Data*, align 8
  %val = alloca i32, align 4
  %id = alloca i32, align 4
  %data = alloca [4 x %struct.Data], align 8
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  %0 = bitcast [4 x %struct.Data]* %data to %struct.Data*
  %1 = bitcast %struct.Data* %0 to %struct.Data*
  %2 = bitcast %struct.Data* %1 to i32*
  store i32 10, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = bitcast [4 x %struct.Data]* %data to %struct.Data*
  %5 = bitcast %struct.Data* %4 to %struct.Data*
  %6 = getelementptr %struct.Data, %struct.Data* %5, i32 0, i32 1
  store i32 12, i32* %6, align 4
  %7 = load i32, i32* %6, align 4
  %8 = bitcast [4 x %struct.Data]* %data to %struct.Data*
  %9 = getelementptr %struct.Data, %struct.Data* %8, i32 1
  %10 = bitcast %struct.Data* %9 to i32*
  store i32 20, i32* %10, align 4
  %11 = load i32, i32* %10, align 4
  %12 = bitcast [4 x %struct.Data]* %data to %struct.Data*
  %13 = getelementptr %struct.Data, %struct.Data* %12, i32 1
  %14 = getelementptr %struct.Data, %struct.Data* %13, i32 0, i32 1
  store i32 24, i32* %14, align 4
  %15 = load i32, i32* %14, align 4
  %16 = bitcast [4 x %struct.Data]* %data to %struct.Data*
  %17 = getelementptr %struct.Data, %struct.Data* %16, i32 2
  %18 = bitcast %struct.Data* %17 to i32*
  store i32 30, i32* %18, align 4
  %19 = load i32, i32* %18, align 4
  %20 = bitcast [4 x %struct.Data]* %data to %struct.Data*
  %21 = getelementptr %struct.Data, %struct.Data* %20, i32 2
  %22 = getelementptr %struct.Data, %struct.Data* %21, i32 0, i32 1
  store i32 36, i32* %22, align 4
  %23 = load i32, i32* %22, align 4
  %24 = bitcast [4 x %struct.Data]* %data to %struct.Data*
  %25 = getelementptr %struct.Data, %struct.Data* %24, i32 3
  %26 = bitcast %struct.Data* %25 to i32*
  store i32 40, i32* %26, align 4
  %27 = load i32, i32* %26, align 4
  %28 = bitcast [4 x %struct.Data]* %data to %struct.Data*
  %29 = getelementptr %struct.Data, %struct.Data* %28, i32 3
  %30 = getelementptr %struct.Data, %struct.Data* %29, i32 0, i32 1
  store i32 48, i32* %30, align 4
  %31 = load i32, i32* %30, align 4
  %32 = bitcast [4 x %struct.Data]* %data to %struct.Data*
  store %struct.Data* %32, %struct.Data** %p, align 8
  %33 = load %struct.Data*, %struct.Data** %p, align 8
  %34 = bitcast %struct.Data* %33 to i32*
  %35 = load i32, i32* %34, align 4
  store i32 %35, i32* %id, align 4
  %36 = load i32, i32* %id, align 4
  %37 = load %struct.Data*, %struct.Data** %p, align 8
  %38 = getelementptr %struct.Data, %struct.Data* %37, i32 0, i32 1
  %39 = load i32, i32* %38, align 4
  store i32 %39, i32* %val, align 4
  %40 = load i32, i32* %val, align 4
  %41 = load i32, i32* %id, align 4
  %42 = icmp ne i32 %41, 10
  br i1 %42, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %43 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %44 = load i32, i32* %val, align 4
  %45 = icmp ne i32 %44, 12
  br i1 %45, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %46 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %47 = load %struct.Data*, %struct.Data** %p, align 8
  %48 = getelementptr %struct.Data, %struct.Data* %47, i32 1
  store %struct.Data* %48, %struct.Data** %p, align 8
  %49 = load %struct.Data*, %struct.Data** %p, align 8
  %50 = load %struct.Data*, %struct.Data** %p, align 8
  %51 = bitcast %struct.Data* %50 to i32*
  %52 = load i32, i32* %51, align 4
  store i32 %52, i32* %id, align 4
  %53 = load i32, i32* %id, align 4
  %54 = load %struct.Data*, %struct.Data** %p, align 8
  %55 = getelementptr %struct.Data, %struct.Data* %54, i32 0, i32 1
  %56 = load i32, i32* %55, align 4
  store i32 %56, i32* %val, align 4
  %57 = load i32, i32* %val, align 4
  %58 = load i32, i32* %id, align 4
  %59 = icmp ne i32 %58, 20
  br i1 %59, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %60 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %61 = load i32, i32* %val, align 4
  %62 = icmp ne i32 %61, 24
  br i1 %62, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %63 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %64 = load %struct.Data*, %struct.Data** %p, align 8
  %65 = getelementptr %struct.Data, %struct.Data* %64, i32 1
  store %struct.Data* %65, %struct.Data** %p, align 8
  %66 = load %struct.Data*, %struct.Data** %p, align 8
  %67 = load %struct.Data*, %struct.Data** %p, align 8
  %68 = bitcast %struct.Data* %67 to i32*
  %69 = load i32, i32* %68, align 4
  store i32 %69, i32* %id, align 4
  %70 = load i32, i32* %id, align 4
  %71 = load i32, i32* %id, align 4
  %72 = icmp ne i32 %71, 30
  br i1 %72, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %73 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %74 = load %struct.Data*, %struct.Data** %p, align 8
  %75 = getelementptr %struct.Data, %struct.Data* %74, i32 1
  store %struct.Data* %75, %struct.Data** %p, align 8
  %76 = load %struct.Data*, %struct.Data** %p, align 8
  %77 = bitcast %struct.Data* %76 to i32*
  %78 = load i32, i32* %77, align 4
  store i32 %78, i32* %id, align 4
  %79 = load i32, i32* %id, align 4
  %80 = load %struct.Data*, %struct.Data** %p, align 8
  %81 = getelementptr %struct.Data, %struct.Data* %80, i32 0, i32 1
  %82 = load i32, i32* %81, align 4
  store i32 %82, i32* %val, align 4
  %83 = load i32, i32* %val, align 4
  %84 = load i32, i32* %id, align 4
  %85 = icmp ne i32 %84, 40
  br i1 %85, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %86 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %87 = load i32, i32* %val, align 4
  %88 = icmp ne i32 %87, 48
  br i1 %88, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %89 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  %90 = bitcast [4 x %struct.Data]* %data to %struct.Data*
  %91 = getelementptr %struct.Data, %struct.Data* %90, i32 3
  store %struct.Data* %91, %struct.Data** %p, align 8
  %92 = load %struct.Data*, %struct.Data** %p, align 8
  %93 = load %struct.Data*, %struct.Data** %p, align 8
  %94 = getelementptr %struct.Data, %struct.Data* %93, i32 -1
  store %struct.Data* %94, %struct.Data** %p, align 8
  %95 = load %struct.Data*, %struct.Data** %p, align 8
  %96 = load %struct.Data*, %struct.Data** %p, align 8
  %97 = bitcast %struct.Data* %96 to i32*
  %98 = load i32, i32* %97, align 4
  store i32 %98, i32* %id, align 4
  %99 = load i32, i32* %id, align 4
  %100 = load i32, i32* %id, align 4
  %101 = icmp ne i32 %100, 30
  br i1 %101, label %then19, label %if.end21

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4
  %102 = load i32, i32* %err, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.end18, %then19
  %103 = load %struct.Data*, %struct.Data** %p, align 8
  %104 = getelementptr %struct.Data, %struct.Data* %103, i32 -1
  store %struct.Data* %104, %struct.Data** %p, align 8
  %105 = load %struct.Data*, %struct.Data** %p, align 8
  %106 = load %struct.Data*, %struct.Data** %p, align 8
  %107 = bitcast %struct.Data* %106 to i32*
  %108 = load i32, i32* %107, align 4
  store i32 %108, i32* %id, align 4
  %109 = load i32, i32* %id, align 4
  %110 = load i32, i32* %id, align 4
  %111 = icmp ne i32 %110, 20
  br i1 %111, label %then22, label %if.end24

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4
  %112 = load i32, i32* %err, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.end21, %then22
  %113 = load %struct.Data*, %struct.Data** %p, align 8
  %114 = getelementptr %struct.Data, %struct.Data* %113, i32 -1
  store %struct.Data* %114, %struct.Data** %p, align 8
  %115 = load %struct.Data*, %struct.Data** %p, align 8
  %116 = bitcast %struct.Data* %115 to i32*
  %117 = load i32, i32* %116, align 4
  store i32 %117, i32* %id, align 4
  %118 = load i32, i32* %id, align 4
  %119 = load i32, i32* %id, align 4
  %120 = icmp ne i32 %119, 10
  br i1 %120, label %then25, label %if.end27

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4
  %121 = load i32, i32* %err, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.end24, %then25
  %122 = load i32, i32* %err, align 4
  %123 = icmp eq i32 %122, 0
  %. = select i1 %123, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @1, i32 0, i32 0)
  %124 = call i32 (i8*, ...) @printf(i8* %.)
  %125 = load i32, i32* %err, align 4
  ret i32 %125
}
