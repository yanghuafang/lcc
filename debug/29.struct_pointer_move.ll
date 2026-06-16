; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%struct.Data = type { i32, i32 }

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@2 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@3 = private unnamed_addr constant [36 x i8] c"**** 29.struct_pointer_move.c ****\0A\00", align 1
@4 = private unnamed_addr constant [24 x i8] c"data[0] id:%d, data:%d\0A\00", align 1
@5 = private unnamed_addr constant [11 x i8] c"data[0] id\00", align 1
@6 = private unnamed_addr constant [13 x i8] c"data[0] data\00", align 1
@7 = private unnamed_addr constant [24 x i8] c"data[1] id:%d, data:%d\0A\00", align 1
@8 = private unnamed_addr constant [11 x i8] c"data[1] id\00", align 1
@9 = private unnamed_addr constant [13 x i8] c"data[1] data\00", align 1
@10 = private unnamed_addr constant [24 x i8] c"data[2] id:%d, data:%d\0A\00", align 1
@11 = private unnamed_addr constant [11 x i8] c"data[2] id\00", align 1
@12 = private unnamed_addr constant [24 x i8] c"data[3] id:%d, data:%d\0A\00", align 1
@13 = private unnamed_addr constant [11 x i8] c"data[3] id\00", align 1
@14 = private unnamed_addr constant [13 x i8] c"data[3] data\00", align 1
@15 = private unnamed_addr constant [24 x i8] c"data[3] id:%d, data:%d\0A\00", align 1
@16 = private unnamed_addr constant [24 x i8] c"data[2] id:%d, data:%d\0A\00", align 1
@17 = private unnamed_addr constant [16 x i8] c"back data[2] id\00", align 1
@18 = private unnamed_addr constant [24 x i8] c"data[1] id:%d, data:%d\0A\00", align 1
@19 = private unnamed_addr constant [16 x i8] c"back data[1] id\00", align 1
@20 = private unnamed_addr constant [24 x i8] c"data[0] id:%d, data:%d\0A\00", align 1
@21 = private unnamed_addr constant [16 x i8] c"back data[0] id\00", align 1

declare i32 @printf(i8*, ...)

define void @check_int(i8* %0, i32 %1, i32 %2) {
entry:
  %expected = alloca i32, align 4
  %actual = alloca i32, align 4
  %name = alloca i8*, align 8
  store i8* %0, i8** %name, align 8
  store i32 %1, i32* %actual, align 4
  store i32 %2, i32* %expected, align 4
  %3 = load i32, i32* %actual, align 4
  %4 = load i32, i32* %expected, align 4
  %5 = icmp ne i32 %3, %4
  br i1 %5, label %then, label %if.end

then:                                             ; preds = %entry
  %6 = load i8*, i8** %name, align 8
  %7 = load i32, i32* %actual, align 4
  %8 = load i32, i32* %expected, align 4
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @0, i32 0, i32 0), i8* %6, i32 %7, i32 %8)
  %10 = load i32, i32* @test_errors, align 4
  %11 = add i32 %10, 1
  store i32 %11, i32* @test_errors, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  ret void
}

define void @report_result() {
entry:
  %0 = load i32, i32* @test_errors, align 4
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %then, label %else

then:                                             ; preds = %entry
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @1, i32 0, i32 0))
  br label %if.end

else:                                             ; preds = %entry
  %3 = load i32, i32* @test_errors, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @2, i32 0, i32 0), i32 %3)
  br label %if.end

if.end:                                           ; preds = %else, %then
  ret void
}

define i32 @main() {
entry:
  %p = alloca %struct.Data*, align 8
  %data = alloca [4 x %struct.Data], align 8
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @3, i32 0, i32 0))
  %1 = bitcast [4 x %struct.Data]* %data to %struct.Data*
  %2 = bitcast %struct.Data* %1 to %struct.Data*
  %3 = bitcast %struct.Data* %2 to i32*
  store i32 10, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  %5 = bitcast [4 x %struct.Data]* %data to %struct.Data*
  %6 = bitcast %struct.Data* %5 to %struct.Data*
  %7 = getelementptr %struct.Data, %struct.Data* %6, i32 0, i32 1
  store i32 12, i32* %7, align 4
  %8 = load i32, i32* %7, align 4
  %9 = bitcast [4 x %struct.Data]* %data to %struct.Data*
  %10 = getelementptr %struct.Data, %struct.Data* %9, i32 1
  %11 = bitcast %struct.Data* %10 to i32*
  store i32 20, i32* %11, align 4
  %12 = load i32, i32* %11, align 4
  %13 = bitcast [4 x %struct.Data]* %data to %struct.Data*
  %14 = getelementptr %struct.Data, %struct.Data* %13, i32 1
  %15 = getelementptr %struct.Data, %struct.Data* %14, i32 0, i32 1
  store i32 24, i32* %15, align 4
  %16 = load i32, i32* %15, align 4
  %17 = bitcast [4 x %struct.Data]* %data to %struct.Data*
  %18 = getelementptr %struct.Data, %struct.Data* %17, i32 2
  %19 = bitcast %struct.Data* %18 to i32*
  store i32 30, i32* %19, align 4
  %20 = load i32, i32* %19, align 4
  %21 = bitcast [4 x %struct.Data]* %data to %struct.Data*
  %22 = getelementptr %struct.Data, %struct.Data* %21, i32 2
  %23 = getelementptr %struct.Data, %struct.Data* %22, i32 0, i32 1
  store i32 36, i32* %23, align 4
  %24 = load i32, i32* %23, align 4
  %25 = bitcast [4 x %struct.Data]* %data to %struct.Data*
  %26 = getelementptr %struct.Data, %struct.Data* %25, i32 3
  %27 = bitcast %struct.Data* %26 to i32*
  store i32 40, i32* %27, align 4
  %28 = load i32, i32* %27, align 4
  %29 = bitcast [4 x %struct.Data]* %data to %struct.Data*
  %30 = getelementptr %struct.Data, %struct.Data* %29, i32 3
  %31 = getelementptr %struct.Data, %struct.Data* %30, i32 0, i32 1
  store i32 48, i32* %31, align 4
  %32 = load i32, i32* %31, align 4
  %33 = bitcast [4 x %struct.Data]* %data to %struct.Data*
  store %struct.Data* %33, %struct.Data** %p, align 8
  %34 = load %struct.Data*, %struct.Data** %p, align 8
  %35 = bitcast %struct.Data* %34 to i32*
  %36 = load i32, i32* %35, align 4
  %37 = load %struct.Data*, %struct.Data** %p, align 8
  %38 = getelementptr %struct.Data, %struct.Data* %37, i32 0, i32 1
  %39 = load i32, i32* %38, align 4
  %40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @4, i32 0, i32 0), i32 %36, i32 %39)
  %41 = load %struct.Data*, %struct.Data** %p, align 8
  %42 = bitcast %struct.Data* %41 to i32*
  %43 = load i32, i32* %42, align 4
  call void @check_int(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @5, i32 0, i32 0), i32 %43, i32 10)
  %44 = load %struct.Data*, %struct.Data** %p, align 8
  %45 = getelementptr %struct.Data, %struct.Data* %44, i32 0, i32 1
  %46 = load i32, i32* %45, align 4
  call void @check_int(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @6, i32 0, i32 0), i32 %46, i32 12)
  %47 = load %struct.Data*, %struct.Data** %p, align 8
  %48 = getelementptr %struct.Data, %struct.Data* %47, i32 1
  store %struct.Data* %48, %struct.Data** %p, align 8
  %49 = load %struct.Data*, %struct.Data** %p, align 8
  %50 = load %struct.Data*, %struct.Data** %p, align 8
  %51 = bitcast %struct.Data* %50 to i32*
  %52 = load i32, i32* %51, align 4
  %53 = load %struct.Data*, %struct.Data** %p, align 8
  %54 = getelementptr %struct.Data, %struct.Data* %53, i32 0, i32 1
  %55 = load i32, i32* %54, align 4
  %56 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @7, i32 0, i32 0), i32 %52, i32 %55)
  %57 = load %struct.Data*, %struct.Data** %p, align 8
  %58 = bitcast %struct.Data* %57 to i32*
  %59 = load i32, i32* %58, align 4
  call void @check_int(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @8, i32 0, i32 0), i32 %59, i32 20)
  %60 = load %struct.Data*, %struct.Data** %p, align 8
  %61 = getelementptr %struct.Data, %struct.Data* %60, i32 0, i32 1
  %62 = load i32, i32* %61, align 4
  call void @check_int(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @9, i32 0, i32 0), i32 %62, i32 24)
  %63 = load %struct.Data*, %struct.Data** %p, align 8
  %64 = getelementptr %struct.Data, %struct.Data* %63, i32 1
  store %struct.Data* %64, %struct.Data** %p, align 8
  %65 = load %struct.Data*, %struct.Data** %p, align 8
  %66 = load %struct.Data*, %struct.Data** %p, align 8
  %67 = bitcast %struct.Data* %66 to i32*
  %68 = load i32, i32* %67, align 4
  %69 = load %struct.Data*, %struct.Data** %p, align 8
  %70 = getelementptr %struct.Data, %struct.Data* %69, i32 0, i32 1
  %71 = load i32, i32* %70, align 4
  %72 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @10, i32 0, i32 0), i32 %68, i32 %71)
  %73 = load %struct.Data*, %struct.Data** %p, align 8
  %74 = bitcast %struct.Data* %73 to i32*
  %75 = load i32, i32* %74, align 4
  call void @check_int(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @11, i32 0, i32 0), i32 %75, i32 30)
  %76 = load %struct.Data*, %struct.Data** %p, align 8
  %77 = getelementptr %struct.Data, %struct.Data* %76, i32 1
  store %struct.Data* %77, %struct.Data** %p, align 8
  %78 = load %struct.Data*, %struct.Data** %p, align 8
  %79 = bitcast %struct.Data* %78 to i32*
  %80 = load i32, i32* %79, align 4
  %81 = load %struct.Data*, %struct.Data** %p, align 8
  %82 = getelementptr %struct.Data, %struct.Data* %81, i32 0, i32 1
  %83 = load i32, i32* %82, align 4
  %84 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @12, i32 0, i32 0), i32 %80, i32 %83)
  %85 = load %struct.Data*, %struct.Data** %p, align 8
  %86 = bitcast %struct.Data* %85 to i32*
  %87 = load i32, i32* %86, align 4
  call void @check_int(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @13, i32 0, i32 0), i32 %87, i32 40)
  %88 = load %struct.Data*, %struct.Data** %p, align 8
  %89 = getelementptr %struct.Data, %struct.Data* %88, i32 0, i32 1
  %90 = load i32, i32* %89, align 4
  call void @check_int(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @14, i32 0, i32 0), i32 %90, i32 48)
  %91 = bitcast [4 x %struct.Data]* %data to %struct.Data*
  %92 = getelementptr %struct.Data, %struct.Data* %91, i32 3
  store %struct.Data* %92, %struct.Data** %p, align 8
  %93 = load %struct.Data*, %struct.Data** %p, align 8
  %94 = load %struct.Data*, %struct.Data** %p, align 8
  %95 = bitcast %struct.Data* %94 to i32*
  %96 = load i32, i32* %95, align 4
  %97 = load %struct.Data*, %struct.Data** %p, align 8
  %98 = getelementptr %struct.Data, %struct.Data* %97, i32 0, i32 1
  %99 = load i32, i32* %98, align 4
  %100 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @15, i32 0, i32 0), i32 %96, i32 %99)
  %101 = load %struct.Data*, %struct.Data** %p, align 8
  %102 = getelementptr %struct.Data, %struct.Data* %101, i32 -1
  store %struct.Data* %102, %struct.Data** %p, align 8
  %103 = load %struct.Data*, %struct.Data** %p, align 8
  %104 = load %struct.Data*, %struct.Data** %p, align 8
  %105 = bitcast %struct.Data* %104 to i32*
  %106 = load i32, i32* %105, align 4
  %107 = load %struct.Data*, %struct.Data** %p, align 8
  %108 = getelementptr %struct.Data, %struct.Data* %107, i32 0, i32 1
  %109 = load i32, i32* %108, align 4
  %110 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @16, i32 0, i32 0), i32 %106, i32 %109)
  %111 = load %struct.Data*, %struct.Data** %p, align 8
  %112 = bitcast %struct.Data* %111 to i32*
  %113 = load i32, i32* %112, align 4
  call void @check_int(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @17, i32 0, i32 0), i32 %113, i32 30)
  %114 = load %struct.Data*, %struct.Data** %p, align 8
  %115 = getelementptr %struct.Data, %struct.Data* %114, i32 -1
  store %struct.Data* %115, %struct.Data** %p, align 8
  %116 = load %struct.Data*, %struct.Data** %p, align 8
  %117 = load %struct.Data*, %struct.Data** %p, align 8
  %118 = bitcast %struct.Data* %117 to i32*
  %119 = load i32, i32* %118, align 4
  %120 = load %struct.Data*, %struct.Data** %p, align 8
  %121 = getelementptr %struct.Data, %struct.Data* %120, i32 0, i32 1
  %122 = load i32, i32* %121, align 4
  %123 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @18, i32 0, i32 0), i32 %119, i32 %122)
  %124 = load %struct.Data*, %struct.Data** %p, align 8
  %125 = bitcast %struct.Data* %124 to i32*
  %126 = load i32, i32* %125, align 4
  call void @check_int(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @19, i32 0, i32 0), i32 %126, i32 20)
  %127 = load %struct.Data*, %struct.Data** %p, align 8
  %128 = getelementptr %struct.Data, %struct.Data* %127, i32 -1
  store %struct.Data* %128, %struct.Data** %p, align 8
  %129 = load %struct.Data*, %struct.Data** %p, align 8
  %130 = bitcast %struct.Data* %129 to i32*
  %131 = load i32, i32* %130, align 4
  %132 = load %struct.Data*, %struct.Data** %p, align 8
  %133 = getelementptr %struct.Data, %struct.Data* %132, i32 0, i32 1
  %134 = load i32, i32* %133, align 4
  %135 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @20, i32 0, i32 0), i32 %131, i32 %134)
  %136 = load %struct.Data*, %struct.Data** %p, align 8
  %137 = bitcast %struct.Data* %136 to i32*
  %138 = load i32, i32* %137, align 4
  call void @check_int(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @21, i32 0, i32 0), i32 %138, i32 10)
  call void @report_result()
  %139 = load i32, i32* @test_errors, align 4
  ret i32 %139
}
