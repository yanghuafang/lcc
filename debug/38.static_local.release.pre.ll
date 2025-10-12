; ModuleID = 'lcc'
source_filename = "lcc"

@counter_calls.count = internal global i32 0
@counter_with_init.count = internal global i32 10
@bump_runtime_static_decl.value = internal global i32 0
@bump_runtime_static_decl.value.inited = private global i1 false
@0 = private unnamed_addr constant [24 x i8] c"38.static_local.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"38.static_local.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @get_seed() {
entry:
  ret i32 7
}

define i32 @counter_calls() {
entry:
  %0 = load i32, ptr @counter_calls.count, align 4
  %1 = add i32 %0, 1
  store i32 %1, ptr @counter_calls.count, align 4
  %2 = load i32, ptr @counter_calls.count, align 4
  ret i32 %2
}

define i32 @counter_with_init() {
entry:
  %0 = load i32, ptr @counter_with_init.count, align 4
  %1 = add i32 %0, 1
  store i32 %1, ptr @counter_with_init.count, align 4
  %2 = load i32, ptr @counter_with_init.count, align 4
  ret i32 %2
}

define i32 @bump_runtime_static_decl() {
entry:
  %static.inited = load i1, ptr @bump_runtime_static_decl.value.inited, align 1
  br i1 %static.inited, label %static.cont, label %static.init

static.init:                                      ; preds = %entry
  %0 = call i32 @get_seed()
  store i32 %0, ptr @bump_runtime_static_decl.value, align 4
  store i1 true, ptr @bump_runtime_static_decl.value.inited, align 1
  br label %static.cont

static.cont:                                      ; preds = %static.init, %entry
  %1 = load i32, ptr @bump_runtime_static_decl.value, align 4
  %2 = add i32 %1, 1
  store i32 %2, ptr @bump_runtime_static_decl.value, align 4
  %3 = load i32, ptr @bump_runtime_static_decl.value, align 4
  ret i32 %3
}

define i32 @main() {
entry:
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  %0 = call i32 @counter_calls()
  %1 = icmp ne i32 %0, 1
  br i1 %1, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %2 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %3 = call i32 @counter_calls()
  %4 = icmp ne i32 %3, 2
  br i1 %4, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %5 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @counter_calls()
  %7 = icmp ne i32 %6, 3
  br i1 %7, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %8 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @counter_with_init()
  %10 = icmp ne i32 %9, 11
  br i1 %10, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %11 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @counter_with_init()
  %13 = icmp ne i32 %12, 12
  br i1 %13, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %14 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %15 = call i32 @bump_runtime_static_decl()
  %16 = icmp ne i32 %15, 8
  br i1 %16, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %17 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %18 = call i32 @bump_runtime_static_decl()
  %19 = icmp ne i32 %18, 9
  br i1 %19, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %20 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %21 = load i32, ptr %err, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %then19, label %else20

then19:                                           ; preds = %if.end18
  %23 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end21

else20:                                           ; preds = %if.end18
  %24 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %25 = load i32, ptr %err, align 4
  ret i32 %25
}
