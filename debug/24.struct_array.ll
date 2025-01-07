; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

%struct.Data = type { i32, i32 }

@0 = private unnamed_addr constant [27 x i8] c"da[1].id:%d da[1].data:%d\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %da = alloca [2 x %struct.Data], align 8
  %0 = bitcast [2 x %struct.Data]* %da to %struct.Data*
  %1 = getelementptr %struct.Data, %struct.Data* %0, i32 1
  %2 = bitcast %struct.Data* %1 to i32*
  store i32 10, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = bitcast [2 x %struct.Data]* %da to %struct.Data*
  %5 = getelementptr %struct.Data, %struct.Data* %4, i32 1
  %6 = getelementptr %struct.Data, %struct.Data* %5, i32 0, i32 1
  store i32 80, i32* %6, align 4
  %7 = load i32, i32* %6, align 4
  %8 = bitcast [2 x %struct.Data]* %da to %struct.Data*
  %9 = getelementptr %struct.Data, %struct.Data* %8, i32 1
  %10 = bitcast %struct.Data* %9 to i32*
  %11 = load i32, i32* %10, align 4
  %12 = bitcast [2 x %struct.Data]* %da to %struct.Data*
  %13 = getelementptr %struct.Data, %struct.Data* %12, i32 1
  %14 = getelementptr %struct.Data, %struct.Data* %13, i32 0, i32 1
  %15 = load i32, i32* %14, align 4
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @0, i32 0, i32 0), i32 %11, i32 %15)
  ret i32 0
}
