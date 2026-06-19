; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [36 x i8] c"39.break_continue_hierarchy.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [36 x i8] c"39.break_continue_hierarchy.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @for_break_continue() {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  store i32 0, i32* %sum, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, i32* %i, align 4
  %1 = icmp slt i32 %0, 10
  br i1 %1, label %for.loop, label %for.end

for.loop:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %3 = icmp eq i32 %2, 3
  br i1 %3, label %for.update, label %if.end

if.end:                                           ; preds = %for.loop
  %4 = load i32, i32* %i, align 4
  %5 = icmp eq i32 %4, 7
  br i1 %5, label %for.end, label %if.end3

if.end3:                                          ; preds = %if.end
  %6 = load i32, i32* %sum, align 4
  %7 = load i32, i32* %i, align 4
  %8 = add i32 %6, %7
  store i32 %8, i32* %sum, align 4
  %9 = load i32, i32* %sum, align 4
  br label %for.update

for.update:                                       ; preds = %for.loop, %if.end3
  %10 = load i32, i32* %i, align 4
  %11 = add i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.end, %for.cond
  %12 = load i32, i32* %sum, align 4
  ret i32 %12
}

define i32 @switch_break_fallthrough() {
entry:
  %r = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 1, i32* %x, align 4
  store i32 0, i32* %r, align 4
  %0 = load i32, i32* %x, align 4
  switch i32 %0, label %case.2 [
    i32 1, label %case.0
    i32 2, label %case.1
  ]

case.0:                                           ; preds = %entry
  %1 = load i32, i32* %r, align 4
  %2 = add i32 %1, 1
  store i32 %2, i32* %r, align 4
  %3 = load i32, i32* %r, align 4
  br label %case.1

case.1:                                           ; preds = %entry, %case.0
  %4 = load i32, i32* %r, align 4
  %5 = add i32 %4, 10
  store i32 %5, i32* %r, align 4
  %6 = load i32, i32* %r, align 4
  br label %switch.end

case.2:                                           ; preds = %entry
  store i32 99, i32* %r, align 4
  %7 = load i32, i32* %r, align 4
  br label %switch.end

switch.end:                                       ; preds = %case.2, %case.1
  %8 = load i32, i32* %r, align 4
  ret i32 %8
}

define i32 @switch_break_only() {
entry:
  %r = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 2, i32* %x, align 4
  store i32 0, i32* %r, align 4
  %0 = load i32, i32* %x, align 4
  switch i32 %0, label %case.2 [
    i32 1, label %case.0
    i32 2, label %case.1
  ]

case.0:                                           ; preds = %entry
  store i32 10, i32* %r, align 4
  %1 = load i32, i32* %r, align 4
  br label %switch.end

case.1:                                           ; preds = %entry
  store i32 20, i32* %r, align 4
  %2 = load i32, i32* %r, align 4
  br label %switch.end

case.2:                                           ; preds = %entry
  store i32 99, i32* %r, align 4
  %3 = load i32, i32* %r, align 4
  br label %switch.end

switch.end:                                       ; preds = %case.2, %case.1, %case.0
  %4 = load i32, i32* %r, align 4
  ret i32 %4
}

define i32 @for_switch_break_continue() {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  store i32 0, i32* %sum, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, i32* %i, align 4
  %1 = icmp slt i32 %0, 6
  br i1 %1, label %for.loop, label %for.end

for.loop:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  switch i32 %2, label %case.3 [
    i32 1, label %for.update
    i32 3, label %for.update
    i32 5, label %case.2
  ]

case.2:                                           ; preds = %for.loop
  %3 = load i32, i32* %sum, align 4
  %4 = add i32 %3, 100
  store i32 %4, i32* %sum, align 4
  %5 = load i32, i32* %sum, align 4
  br label %for.update

case.3:                                           ; preds = %for.loop
  %6 = load i32, i32* %sum, align 4
  %7 = load i32, i32* %i, align 4
  %8 = add i32 %6, %7
  store i32 %8, i32* %sum, align 4
  %9 = load i32, i32* %sum, align 4
  br label %for.update

for.update:                                       ; preds = %case.2, %case.3, %for.loop, %for.loop
  %10 = load i32, i32* %i, align 4
  %11 = add i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %12 = load i32, i32* %sum, align 4
  ret i32 %12
}

define i32 @switch_for_break_continue() {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %x = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 0, i32* %r, align 4
  store i32 1, i32* %x, align 4
  %0 = load i32, i32* %x, align 4
  %1 = icmp eq i32 %0, 1
  br i1 %1, label %case.0, label %case.1

case.0:                                           ; preds = %entry
  store i32 0, i32* %sum, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.update, %case.0
  %2 = load i32, i32* %i, align 4
  %3 = icmp slt i32 %2, 5
  br i1 %3, label %for.loop, label %for.end

for.loop:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4
  %5 = icmp eq i32 %4, 2
  br i1 %5, label %for.update, label %if.end

if.end:                                           ; preds = %for.loop
  %6 = load i32, i32* %i, align 4
  %7 = icmp eq i32 %6, 4
  br i1 %7, label %for.end, label %if.end3

if.end3:                                          ; preds = %if.end
  %8 = load i32, i32* %sum, align 4
  %9 = load i32, i32* %i, align 4
  %10 = add i32 %8, %9
  store i32 %10, i32* %sum, align 4
  %11 = load i32, i32* %sum, align 4
  br label %for.update

for.update:                                       ; preds = %for.loop, %if.end3
  %12 = load i32, i32* %i, align 4
  %13 = add i32 %12, 1
  store i32 %13, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.end, %for.cond
  %14 = load i32, i32* %sum, align 4
  store i32 %14, i32* %r, align 4
  %15 = load i32, i32* %r, align 4
  br label %switch.end

case.1:                                           ; preds = %entry
  store i32 -1, i32* %r, align 4
  %16 = load i32, i32* %r, align 4
  br label %switch.end

switch.end:                                       ; preds = %case.1, %for.end
  %17 = load i32, i32* %r, align 4
  ret i32 %17
}

define i32 @main() {
entry:
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  %0 = call i32 @for_break_continue()
  %1 = icmp ne i32 %0, 18
  br i1 %1, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %2 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @switch_break_fallthrough()
  %4 = icmp ne i32 %3, 11
  br i1 %4, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %5 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @switch_break_only()
  %7 = icmp ne i32 %6, 20
  br i1 %7, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %8 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @for_switch_break_continue()
  %10 = icmp ne i32 %9, 106
  br i1 %10, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %11 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @switch_for_break_continue()
  %13 = icmp ne i32 %12, 4
  br i1 %13, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %14 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %15 = load i32, i32* %err, align 4
  %16 = icmp eq i32 %15, 0
  %. = select i1 %16, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @1, i32 0, i32 0)
  %17 = call i32 (i8*, ...) @printf(i8* %.)
  %18 = load i32, i32* %err, align 4
  ret i32 %18
}
