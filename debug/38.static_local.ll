; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@counter_calls.count = internal global i32 0
@counter_with_init.count = internal global i32 10
@bump_runtime_static_decl.value = internal global i32 0
@bump_runtime_static_decl.value.inited = private global i1 false
@0 = private unnamed_addr constant [24 x i8] c"38.static_local.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"38.static_local.c FAIL\0A\00", align 1

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

define i32 @main() {
entry:
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  %0 = call i32 @counter_calls()
  %1 = icmp ne i32 %0, 1
  br i1 %1, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %2 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @counter_calls()
  %4 = icmp ne i32 %3, 2
  br i1 %4, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %5 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @counter_calls()
  %7 = icmp ne i32 %6, 3
  br i1 %7, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %8 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @counter_with_init()
  %10 = icmp ne i32 %9, 11
  br i1 %10, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %11 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @counter_with_init()
  %13 = icmp ne i32 %12, 12
  br i1 %13, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %14 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %15 = call i32 @bump_runtime_static_decl()
  %16 = icmp ne i32 %15, 8
  br i1 %16, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %17 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %18 = call i32 @bump_runtime_static_decl()
  %19 = icmp ne i32 %18, 9
  br i1 %19, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %20 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  %21 = load i32, i32* %err, align 4
  %22 = icmp eq i32 %21, 0
  %. = select i1 %22, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0)
  %23 = call i32 (i8*, ...) @printf(i8* %.)
  %24 = load i32, i32* %err, align 4
  ret i32 %24
}
