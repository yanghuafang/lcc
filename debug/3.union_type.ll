; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%union.IPv4 = type { i32 }

@0 = private unnamed_addr constant [21 x i8] c"3.union_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [21 x i8] c"3.union_type.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %const = bitcast i32 313249076 to i32
  %byte = alloca i8, align 1
  %ip = alloca i32, align 4
  %ipv4 = alloca %union.IPv4, align 8
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  %0 = bitcast %union.IPv4* %ipv4 to i32*
  store i32 %const, i32* %0, align 4
  %1 = load i32, i32* %0, align 4
  %2 = bitcast %union.IPv4* %ipv4 to i32*
  %3 = load i32, i32* %2, align 4
  store i32 %3, i32* %ip, align 4
  %4 = load i32, i32* %ip, align 4
  %5 = bitcast %union.IPv4* %ipv4 to i8*
  %6 = load i8, i8* %5, align 1
  store i8 %6, i8* %byte, align 1
  %7 = load i8, i8* %byte, align 1
  %8 = load i32, i32* %ip, align 4
  %9 = icmp ne i32 %8, %const
  br i1 %9, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %10 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %11 = load i8, i8* %byte, align 1
  %12 = zext i8 %11 to i32
  %13 = icmp ne i32 %12, 52
  br i1 %13, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %14 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %15 = bitcast %union.IPv4* %ipv4 to i8*
  store i8 86, i8* %15, align 1
  %16 = load i8, i8* %15, align 1
  %17 = bitcast %union.IPv4* %ipv4 to i32*
  %18 = load i32, i32* %17, align 4
  store i32 %18, i32* %ip, align 4
  %19 = load i32, i32* %ip, align 4
  %20 = bitcast %union.IPv4* %ipv4 to i8*
  %21 = load i8, i8* %20, align 1
  store i8 %21, i8* %byte, align 1
  %22 = load i8, i8* %byte, align 1
  %23 = load i32, i32* %ip, align 4
  %const_mat = add i32 %const, 34
  %24 = icmp ne i32 %23, %const_mat
  br i1 %24, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %25 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %26 = load i8, i8* %byte, align 1
  %27 = zext i8 %26 to i32
  %28 = icmp ne i32 %27, 86
  br i1 %28, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %29 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %30 = bitcast %union.IPv4* %ipv4 to i32*
  store i32 -1, i32* %30, align 4
  %31 = load i32, i32* %30, align 4
  %32 = bitcast %union.IPv4* %ipv4 to i32*
  %33 = load i32, i32* %32, align 4
  store i32 %33, i32* %ip, align 4
  %34 = load i32, i32* %ip, align 4
  %35 = load i32, i32* %ip, align 4
  %36 = icmp ne i32 %35, -1
  br i1 %36, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %37 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %38 = bitcast %union.IPv4* %ipv4 to i8*
  store i8 0, i8* %38, align 1
  %39 = load i8, i8* %38, align 1
  %40 = bitcast %union.IPv4* %ipv4 to i32*
  %41 = load i32, i32* %40, align 4
  store i32 %41, i32* %ip, align 4
  %42 = load i32, i32* %ip, align 4
  %43 = load i32, i32* %ip, align 4
  %44 = icmp ne i32 %43, -256
  br i1 %44, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %45 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %46 = load i32, i32* %err, align 4
  %47 = icmp eq i32 %46, 0
  %. = select i1 %47, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @1, i32 0, i32 0)
  %48 = call i32 (i8*, ...) @printf(i8* %.)
  %49 = load i32, i32* %err, align 4
  ret i32 %49
}
