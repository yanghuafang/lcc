; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

%union.IPv4 = type { i32 }

@0 = private unnamed_addr constant [16 x i8] c"ip 0x%x c 0x%x\0A\00", align 1
@1 = private unnamed_addr constant [16 x i8] c"ip 0x%x c 0x%x\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %ipv4 = alloca %union.IPv4, align 8
  %0 = bitcast %union.IPv4* %ipv4 to i32*
  store i32 313249076, i32* %0, align 4
  %1 = load i32, i32* %0, align 4
  %2 = bitcast %union.IPv4* %ipv4 to i32*
  %3 = load i32, i32* %2, align 4
  %4 = bitcast %union.IPv4* %ipv4 to i8*
  %5 = load i8, i8* %4, align 1
  %6 = sext i8 %5 to i32
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @0, i32 0, i32 0), i32 %3, i32 %6)
  %8 = bitcast %union.IPv4* %ipv4 to i8*
  store i8 86, i8* %8, align 1
  %9 = load i8, i8* %8, align 1
  %10 = bitcast %union.IPv4* %ipv4 to i32*
  %11 = load i32, i32* %10, align 4
  %12 = bitcast %union.IPv4* %ipv4 to i8*
  %13 = load i8, i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @1, i32 0, i32 0), i32 %11, i32 %14)
  ret i32 0
}
