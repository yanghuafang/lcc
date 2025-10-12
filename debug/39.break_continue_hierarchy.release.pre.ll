; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [36 x i8] c"39.break_continue_hierarchy.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [36 x i8] c"39.break_continue_hierarchy.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @for_break_continue() {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  store i32 0, ptr %sum, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, ptr %i, align 4
  %1 = icmp slt i32 %0, 10
  br i1 %1, label %for.loop, label %for.end

for.loop:                                         ; preds = %for.cond
  %2 = load i32, ptr %i, align 4
  %3 = icmp eq i32 %2, 3
  br i1 %3, label %then, label %else

then:                                             ; preds = %for.loop
  br label %for.update

else:                                             ; preds = %for.loop
  br label %if.end

if.end:                                           ; preds = %else
  %4 = load i32, ptr %i, align 4
  %5 = icmp eq i32 %4, 7
  br i1 %5, label %then1, label %else2

then1:                                            ; preds = %if.end
  br label %for.end

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2
  %6 = load i32, ptr %sum, align 4
  %7 = load i32, ptr %i, align 4
  %8 = add i32 %6, %7
  store i32 %8, ptr %sum, align 4
  %9 = load i32, ptr %sum, align 4
  br label %for.update

for.update:                                       ; preds = %if.end3, %then
  %10 = load i32, ptr %i, align 4
  %11 = add i32 %10, 1
  store i32 %11, ptr %i, align 4
  br label %for.cond

for.end:                                          ; preds = %then1, %for.cond
  %12 = load i32, ptr %sum, align 4
  ret i32 %12
}

define i32 @switch_break_fallthrough() {
entry:
  %r = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 1, ptr %x, align 4
  store i32 0, ptr %r, align 4
  %0 = load i32, ptr %x, align 4
  %1 = icmp eq i32 %0, 1
  br i1 %1, label %case.0, label %switch.compare.0

switch.compare.0:                                 ; preds = %entry
  %2 = icmp eq i32 %0, 2
  br i1 %2, label %case.1, label %switch.compare.1

switch.compare.1:                                 ; preds = %switch.compare.0
  br label %case.2

case.0:                                           ; preds = %entry
  %3 = load i32, ptr %r, align 4
  %4 = add i32 %3, 1
  store i32 %4, ptr %r, align 4
  %5 = load i32, ptr %r, align 4
  br label %case.1

case.1:                                           ; preds = %case.0, %switch.compare.0
  %6 = load i32, ptr %r, align 4
  %7 = add i32 %6, 10
  store i32 %7, ptr %r, align 4
  %8 = load i32, ptr %r, align 4
  br label %switch.end

case.2:                                           ; preds = %switch.compare.1
  store i32 99, ptr %r, align 4
  %9 = load i32, ptr %r, align 4
  br label %switch.end

switch.end:                                       ; preds = %case.2, %case.1
  %10 = load i32, ptr %r, align 4
  ret i32 %10
}

define i32 @switch_break_only() {
entry:
  %r = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 2, ptr %x, align 4
  store i32 0, ptr %r, align 4
  %0 = load i32, ptr %x, align 4
  %1 = icmp eq i32 %0, 1
  br i1 %1, label %case.0, label %switch.compare.0

switch.compare.0:                                 ; preds = %entry
  %2 = icmp eq i32 %0, 2
  br i1 %2, label %case.1, label %switch.compare.1

switch.compare.1:                                 ; preds = %switch.compare.0
  br label %case.2

case.0:                                           ; preds = %entry
  store i32 10, ptr %r, align 4
  %3 = load i32, ptr %r, align 4
  br label %switch.end

case.1:                                           ; preds = %switch.compare.0
  store i32 20, ptr %r, align 4
  %4 = load i32, ptr %r, align 4
  br label %switch.end

case.2:                                           ; preds = %switch.compare.1
  store i32 99, ptr %r, align 4
  %5 = load i32, ptr %r, align 4
  br label %switch.end

switch.end:                                       ; preds = %case.2, %case.1, %case.0
  %6 = load i32, ptr %r, align 4
  ret i32 %6
}

define i32 @for_switch_break_continue() {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  store i32 0, ptr %sum, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, ptr %i, align 4
  %1 = icmp slt i32 %0, 6
  br i1 %1, label %for.loop, label %for.end

for.loop:                                         ; preds = %for.cond
  %2 = load i32, ptr %i, align 4
  %3 = icmp eq i32 %2, 1
  br i1 %3, label %case.0, label %switch.compare.0

switch.compare.0:                                 ; preds = %for.loop
  %4 = icmp eq i32 %2, 3
  br i1 %4, label %case.1, label %switch.compare.1

switch.compare.1:                                 ; preds = %switch.compare.0
  %5 = icmp eq i32 %2, 5
  br i1 %5, label %case.2, label %switch.compare.2

switch.compare.2:                                 ; preds = %switch.compare.1
  br label %case.3

case.0:                                           ; preds = %for.loop
  br label %for.update

case.1:                                           ; preds = %switch.compare.0
  br label %switch.end

case.2:                                           ; preds = %switch.compare.1
  %6 = load i32, ptr %sum, align 4
  %7 = add i32 %6, 100
  store i32 %7, ptr %sum, align 4
  %8 = load i32, ptr %sum, align 4
  br label %switch.end

case.3:                                           ; preds = %switch.compare.2
  %9 = load i32, ptr %sum, align 4
  %10 = load i32, ptr %i, align 4
  %11 = add i32 %9, %10
  store i32 %11, ptr %sum, align 4
  %12 = load i32, ptr %sum, align 4
  br label %switch.end

switch.end:                                       ; preds = %case.3, %case.2, %case.1
  br label %for.update

for.update:                                       ; preds = %switch.end, %case.0
  %13 = load i32, ptr %i, align 4
  %14 = add i32 %13, 1
  store i32 %14, ptr %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %15 = load i32, ptr %sum, align 4
  ret i32 %15
}

define i32 @switch_for_break_continue() {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %x = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 0, ptr %r, align 4
  store i32 1, ptr %x, align 4
  %0 = load i32, ptr %x, align 4
  %1 = icmp eq i32 %0, 1
  br i1 %1, label %case.0, label %switch.compare.0

switch.compare.0:                                 ; preds = %entry
  br label %case.1

case.0:                                           ; preds = %entry
  store i32 0, ptr %sum, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.update, %case.0
  %2 = load i32, ptr %i, align 4
  %3 = icmp slt i32 %2, 5
  br i1 %3, label %for.loop, label %for.end

for.loop:                                         ; preds = %for.cond
  %4 = load i32, ptr %i, align 4
  %5 = icmp eq i32 %4, 2
  br i1 %5, label %then, label %else

then:                                             ; preds = %for.loop
  br label %for.update

else:                                             ; preds = %for.loop
  br label %if.end

if.end:                                           ; preds = %else
  %6 = load i32, ptr %i, align 4
  %7 = icmp eq i32 %6, 4
  br i1 %7, label %then1, label %else2

then1:                                            ; preds = %if.end
  br label %for.end

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2
  %8 = load i32, ptr %sum, align 4
  %9 = load i32, ptr %i, align 4
  %10 = add i32 %8, %9
  store i32 %10, ptr %sum, align 4
  %11 = load i32, ptr %sum, align 4
  br label %for.update

for.update:                                       ; preds = %if.end3, %then
  %12 = load i32, ptr %i, align 4
  %13 = add i32 %12, 1
  store i32 %13, ptr %i, align 4
  br label %for.cond

for.end:                                          ; preds = %then1, %for.cond
  %14 = load i32, ptr %sum, align 4
  store i32 %14, ptr %r, align 4
  %15 = load i32, ptr %r, align 4
  br label %switch.end

case.1:                                           ; preds = %switch.compare.0
  store i32 -1, ptr %r, align 4
  %16 = load i32, ptr %r, align 4
  br label %switch.end

switch.end:                                       ; preds = %case.1, %for.end
  %17 = load i32, ptr %r, align 4
  ret i32 %17
}

define i32 @main() {
entry:
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  %0 = call i32 @for_break_continue()
  %1 = icmp ne i32 %0, 18
  br i1 %1, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %2 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %3 = call i32 @switch_break_fallthrough()
  %4 = icmp ne i32 %3, 11
  br i1 %4, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %5 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @switch_break_only()
  %7 = icmp ne i32 %6, 20
  br i1 %7, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %8 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @for_switch_break_continue()
  %10 = icmp ne i32 %9, 106
  br i1 %10, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %11 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @switch_for_break_continue()
  %13 = icmp ne i32 %12, 4
  br i1 %13, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %14 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %15 = load i32, ptr %err, align 4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %then13, label %else14

then13:                                           ; preds = %if.end12
  %17 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end15

else14:                                           ; preds = %if.end12
  %18 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %19 = load i32, ptr %err, align 4
  ret i32 %19
}
