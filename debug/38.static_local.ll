; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@counter_calls.count = internal global i32 0
@counter_with_init.count = internal global i32 10
@bump_runtime_static_decl.value = internal global i32 0
@bump_runtime_static_decl.value.inited = private global i1 false
@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@2 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@3 = private unnamed_addr constant [29 x i8] c"**** 38.static_local.c ****\0A\00", align 1
@4 = private unnamed_addr constant [16 x i8] c"counter_calls 1\00", align 1
@5 = private unnamed_addr constant [16 x i8] c"counter_calls 2\00", align 1
@6 = private unnamed_addr constant [16 x i8] c"counter_calls 3\00", align 1
@7 = private unnamed_addr constant [20 x i8] c"counter_with_init 1\00", align 1
@8 = private unnamed_addr constant [20 x i8] c"counter_with_init 2\00", align 1
@9 = private unnamed_addr constant [22 x i8] c"runtime_static_decl 1\00", align 1
@10 = private unnamed_addr constant [22 x i8] c"runtime_static_decl 2\00", align 1

declare i32 @printf(i8*, ...)

define i32 @get_seed() {
entry:
  ret i32 7
}

define i32 @counter_calls() {
entry:
  %0 = load i32, i32* @counter_calls.count, align 4
  %1 = add i32 %0, 1
  store i32 %1, i32* @counter_calls.count, align 4
  %2 = load i32, i32* @counter_calls.count, align 4
  ret i32 %2
}

define i32 @counter_with_init() {
entry:
  %0 = load i32, i32* @counter_with_init.count, align 4
  %1 = add i32 %0, 1
  store i32 %1, i32* @counter_with_init.count, align 4
  %2 = load i32, i32* @counter_with_init.count, align 4
  ret i32 %2
}

define i32 @bump_runtime_static_decl() {
entry:
  %static.inited = load i1, i1* @bump_runtime_static_decl.value.inited, align 1
  br i1 %static.inited, label %static.cont, label %static.init

static.init:                                      ; preds = %entry
  %0 = call i32 @get_seed()
  store i32 %0, i32* @bump_runtime_static_decl.value, align 4
  store i1 true, i1* @bump_runtime_static_decl.value.inited, align 1
  br label %static.cont

static.cont:                                      ; preds = %static.init, %entry
  %1 = load i32, i32* @bump_runtime_static_decl.value, align 4
  %2 = add i32 %1, 1
  store i32 %2, i32* @bump_runtime_static_decl.value, align 4
  %3 = load i32, i32* @bump_runtime_static_decl.value, align 4
  ret i32 %3
}

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
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @3, i32 0, i32 0))
  %1 = call i32 @counter_calls()
  call void @check_int(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @4, i32 0, i32 0), i32 %1, i32 1)
  %2 = call i32 @counter_calls()
  call void @check_int(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @5, i32 0, i32 0), i32 %2, i32 2)
  %3 = call i32 @counter_calls()
  call void @check_int(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @6, i32 0, i32 0), i32 %3, i32 3)
  %4 = call i32 @counter_with_init()
  call void @check_int(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @7, i32 0, i32 0), i32 %4, i32 11)
  %5 = call i32 @counter_with_init()
  call void @check_int(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @8, i32 0, i32 0), i32 %5, i32 12)
  %6 = call i32 @bump_runtime_static_decl()
  call void @check_int(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @9, i32 0, i32 0), i32 %6, i32 8)
  %7 = call i32 @bump_runtime_static_decl()
  call void @check_int(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @10, i32 0, i32 0), i32 %7, i32 9)
  call void @report_result()
  %8 = load i32, i32* @test_errors, align 4
  ret i32 %8
}
