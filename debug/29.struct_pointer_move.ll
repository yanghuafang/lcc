; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

%struct.Data = type { i32, i32 }

@0 = private unnamed_addr constant [24 x i8] c"data[0] id:%d, data:%d\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"data[1] id:%d, data:%d\0A\00", align 1
@2 = private unnamed_addr constant [24 x i8] c"data[2] id:%d, data:%d\0A\00", align 1
@3 = private unnamed_addr constant [24 x i8] c"data[3] id:%d, data:%d\0A\00", align 1
@4 = private unnamed_addr constant [24 x i8] c"data[3] id:%d, data:%d\0A\00", align 1
@5 = private unnamed_addr constant [24 x i8] c"data[2] id:%d, data:%d\0A\00", align 1
@6 = private unnamed_addr constant [24 x i8] c"data[1] id:%d, data:%d\0A\00", align 1
@7 = private unnamed_addr constant [24 x i8] c"data[0] id:%d, data:%d\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %p = alloca %struct.Data*, align 8
  %data = alloca [4 x %struct.Data], align 8
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
  %36 = load %struct.Data*, %struct.Data** %p, align 8
  %37 = getelementptr %struct.Data, %struct.Data* %36, i32 0, i32 1
  %38 = load i32, i32* %37, align 4
  %39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i32 0, i32 0), i32 %35, i32 %38)
  %40 = load %struct.Data*, %struct.Data** %p, align 8
  %41 = getelementptr %struct.Data, %struct.Data* %40, i32 1
  store %struct.Data* %41, %struct.Data** %p, align 8
  %42 = load %struct.Data*, %struct.Data** %p, align 8
  %43 = load %struct.Data*, %struct.Data** %p, align 8
  %44 = bitcast %struct.Data* %43 to i32*
  %45 = load i32, i32* %44, align 4
  %46 = load %struct.Data*, %struct.Data** %p, align 8
  %47 = getelementptr %struct.Data, %struct.Data* %46, i32 0, i32 1
  %48 = load i32, i32* %47, align 4
  %49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0), i32 %45, i32 %48)
  %50 = load %struct.Data*, %struct.Data** %p, align 8
  %51 = getelementptr %struct.Data, %struct.Data* %50, i32 1
  store %struct.Data* %51, %struct.Data** %p, align 8
  %52 = load %struct.Data*, %struct.Data** %p, align 8
  %53 = load %struct.Data*, %struct.Data** %p, align 8
  %54 = bitcast %struct.Data* %53 to i32*
  %55 = load i32, i32* %54, align 4
  %56 = load %struct.Data*, %struct.Data** %p, align 8
  %57 = getelementptr %struct.Data, %struct.Data* %56, i32 0, i32 1
  %58 = load i32, i32* %57, align 4
  %59 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @2, i32 0, i32 0), i32 %55, i32 %58)
  %60 = load %struct.Data*, %struct.Data** %p, align 8
  %61 = getelementptr %struct.Data, %struct.Data* %60, i32 1
  store %struct.Data* %61, %struct.Data** %p, align 8
  %62 = load %struct.Data*, %struct.Data** %p, align 8
  %63 = bitcast %struct.Data* %62 to i32*
  %64 = load i32, i32* %63, align 4
  %65 = load %struct.Data*, %struct.Data** %p, align 8
  %66 = getelementptr %struct.Data, %struct.Data* %65, i32 0, i32 1
  %67 = load i32, i32* %66, align 4
  %68 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @3, i32 0, i32 0), i32 %64, i32 %67)
  %69 = bitcast [4 x %struct.Data]* %data to %struct.Data*
  %70 = getelementptr %struct.Data, %struct.Data* %69, i32 3
  store %struct.Data* %70, %struct.Data** %p, align 8
  %71 = load %struct.Data*, %struct.Data** %p, align 8
  %72 = load %struct.Data*, %struct.Data** %p, align 8
  %73 = bitcast %struct.Data* %72 to i32*
  %74 = load i32, i32* %73, align 4
  %75 = load %struct.Data*, %struct.Data** %p, align 8
  %76 = getelementptr %struct.Data, %struct.Data* %75, i32 0, i32 1
  %77 = load i32, i32* %76, align 4
  %78 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @4, i32 0, i32 0), i32 %74, i32 %77)
  %79 = load %struct.Data*, %struct.Data** %p, align 8
  %80 = getelementptr %struct.Data, %struct.Data* %79, i32 -1
  store %struct.Data* %80, %struct.Data** %p, align 8
  %81 = load %struct.Data*, %struct.Data** %p, align 8
  %82 = load %struct.Data*, %struct.Data** %p, align 8
  %83 = bitcast %struct.Data* %82 to i32*
  %84 = load i32, i32* %83, align 4
  %85 = load %struct.Data*, %struct.Data** %p, align 8
  %86 = getelementptr %struct.Data, %struct.Data* %85, i32 0, i32 1
  %87 = load i32, i32* %86, align 4
  %88 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @5, i32 0, i32 0), i32 %84, i32 %87)
  %89 = load %struct.Data*, %struct.Data** %p, align 8
  %90 = getelementptr %struct.Data, %struct.Data* %89, i32 -1
  store %struct.Data* %90, %struct.Data** %p, align 8
  %91 = load %struct.Data*, %struct.Data** %p, align 8
  %92 = load %struct.Data*, %struct.Data** %p, align 8
  %93 = bitcast %struct.Data* %92 to i32*
  %94 = load i32, i32* %93, align 4
  %95 = load %struct.Data*, %struct.Data** %p, align 8
  %96 = getelementptr %struct.Data, %struct.Data* %95, i32 0, i32 1
  %97 = load i32, i32* %96, align 4
  %98 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @6, i32 0, i32 0), i32 %94, i32 %97)
  %99 = load %struct.Data*, %struct.Data** %p, align 8
  %100 = getelementptr %struct.Data, %struct.Data* %99, i32 -1
  store %struct.Data* %100, %struct.Data** %p, align 8
  %101 = load %struct.Data*, %struct.Data** %p, align 8
  %102 = bitcast %struct.Data* %101 to i32*
  %103 = load i32, i32* %102, align 4
  %104 = load %struct.Data*, %struct.Data** %p, align 8
  %105 = getelementptr %struct.Data, %struct.Data* %104, i32 0, i32 1
  %106 = load i32, i32* %105, align 4
  %107 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @7, i32 0, i32 0), i32 %103, i32 %106)
  ret i32 0
}
