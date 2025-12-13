; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [22 x i8] c"0.hello_world.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"0.hello_world.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  br i1 false, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %0 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %1 = load i32, ptr %err, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %then1, label %else2

then1:                                            ; preds = %if.end
  %3 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end3

else2:                                            ; preds = %if.end
  %4 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %5 = load i32, ptr %err, align 4
  ret i32 %5
}

!llvm.module.flags = !{!0, !1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
