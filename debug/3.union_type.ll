; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%union.IPv4 = type { i32 }

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %u expected %u\0A\00", align 1
@1 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@2 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@3 = private unnamed_addr constant [26 x i8] c"**** 3.union_type.c ****\0A\00", align 1
@4 = private unnamed_addr constant [16 x i8] c"ip 0x%x c 0x%x\0A\00", align 1
@5 = private unnamed_addr constant [11 x i8] c"initial ip\00", align 1
@6 = private unnamed_addr constant [17 x i8] c"initial low byte\00", align 1
@7 = private unnamed_addr constant [16 x i8] c"ip 0x%x c 0x%x\0A\00", align 1
@8 = private unnamed_addr constant [17 x i8] c"ip after c write\00", align 1
@9 = private unnamed_addr constant [14 x i8] c"c after write\00", align 1
@10 = private unnamed_addr constant [15 x i8] c"union all ones\00", align 1
@11 = private unnamed_addr constant [26 x i8] c"byte zero clears low byte\00", align 1

declare i32 @printf(i8*, ...)

define void @check_uint(i8* %0, i32 %1, i32 %2) {
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
  %const = bitcast i32 313249076 to i32
  %ipv4 = alloca %union.IPv4, align 8
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @3, i32 0, i32 0))
  %1 = bitcast %union.IPv4* %ipv4 to i32*
  store i32 %const, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = bitcast %union.IPv4* %ipv4 to i32*
  %4 = load i32, i32* %3, align 4
  %5 = bitcast %union.IPv4* %ipv4 to i8*
  %6 = load i8, i8* %5, align 1
  %7 = sext i8 %6 to i32
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @4, i32 0, i32 0), i32 %4, i32 %7)
  %9 = bitcast %union.IPv4* %ipv4 to i32*
  %10 = load i32, i32* %9, align 4
  call void @check_uint(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @5, i32 0, i32 0), i32 %10, i32 %const)
  %11 = bitcast %union.IPv4* %ipv4 to i8*
  %12 = load i8, i8* %11, align 1
  %13 = zext i8 %12 to i32
  call void @check_uint(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @6, i32 0, i32 0), i32 %13, i32 52)
  %14 = bitcast %union.IPv4* %ipv4 to i8*
  store i8 86, i8* %14, align 1
  %15 = load i8, i8* %14, align 1
  %16 = bitcast %union.IPv4* %ipv4 to i32*
  %17 = load i32, i32* %16, align 4
  %18 = bitcast %union.IPv4* %ipv4 to i8*
  %19 = load i8, i8* %18, align 1
  %20 = sext i8 %19 to i32
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @7, i32 0, i32 0), i32 %17, i32 %20)
  %22 = bitcast %union.IPv4* %ipv4 to i32*
  %23 = load i32, i32* %22, align 4
  %const_mat = add i32 %const, 34
  call void @check_uint(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @8, i32 0, i32 0), i32 %23, i32 %const_mat)
  %24 = bitcast %union.IPv4* %ipv4 to i8*
  %25 = load i8, i8* %24, align 1
  %26 = zext i8 %25 to i32
  call void @check_uint(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @9, i32 0, i32 0), i32 %26, i32 86)
  %27 = bitcast %union.IPv4* %ipv4 to i32*
  store i32 -1, i32* %27, align 4
  %28 = load i32, i32* %27, align 4
  %29 = bitcast %union.IPv4* %ipv4 to i32*
  %30 = load i32, i32* %29, align 4
  call void @check_uint(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @10, i32 0, i32 0), i32 %30, i32 -1)
  %31 = bitcast %union.IPv4* %ipv4 to i8*
  store i8 0, i8* %31, align 1
  %32 = load i8, i8* %31, align 1
  %33 = bitcast %union.IPv4* %ipv4 to i32*
  %34 = load i32, i32* %33, align 4
  call void @check_uint(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @11, i32 0, i32 0), i32 %34, i32 -256)
  call void @report_result()
  %35 = load i32, i32* @test_errors, align 4
  ret i32 %35
}
