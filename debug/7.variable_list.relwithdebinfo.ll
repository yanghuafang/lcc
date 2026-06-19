; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [24 x i8] c"7.variable_list.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"7.variable_list.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %h = alloca i32, align 4
  %g = alloca i32, align 4
  %f = alloca i32, align 4
  %e = alloca i32, align 4
  %d = alloca i32, align 4
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  store i32 1, i32* %b, align 4, !dbg !7
  store i32 2, i32* %c, align 4, !dbg !7
  store i32 3, i32* %d, align 4, !dbg !7
  store i32 0, i32* %a, align 4, !dbg !7
  %0 = load i32, i32* %a, align 4, !dbg !7
  store i32 4, i32* %e, align 4, !dbg !7
  %1 = load i32, i32* %e, align 4, !dbg !7
  store i32 5, i32* %f, align 4, !dbg !7
  %2 = load i32, i32* %f, align 4, !dbg !7
  store i32 6, i32* %g, align 4, !dbg !7
  %3 = load i32, i32* %g, align 4, !dbg !7
  store i32 7, i32* %h, align 4, !dbg !7
  %4 = load i32, i32* %h, align 4, !dbg !7
  %5 = load i32, i32* %a, align 4, !dbg !7
  %6 = icmp ne i32 %5, 0, !dbg !7
  br i1 %6, label %then, label %if.end, !dbg !7

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !7
  %7 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end, !dbg !7

if.end:                                           ; preds = %entry, %then
  %8 = load i32, i32* %b, align 4, !dbg !7
  %9 = icmp ne i32 %8, 1, !dbg !7
  br i1 %9, label %then1, label %if.end3, !dbg !7

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !7
  %10 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end3, !dbg !7

if.end3:                                          ; preds = %if.end, %then1
  %11 = load i32, i32* %c, align 4, !dbg !7
  %12 = icmp ne i32 %11, 2, !dbg !7
  br i1 %12, label %then4, label %if.end6, !dbg !7

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !7
  %13 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end6, !dbg !7

if.end6:                                          ; preds = %if.end3, %then4
  %14 = load i32, i32* %d, align 4, !dbg !7
  %15 = icmp ne i32 %14, 3, !dbg !7
  br i1 %15, label %then7, label %if.end9, !dbg !7

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !7
  %16 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end9, !dbg !7

if.end9:                                          ; preds = %if.end6, %then7
  %17 = load i32, i32* %e, align 4, !dbg !7
  %18 = icmp ne i32 %17, 4, !dbg !7
  br i1 %18, label %then10, label %if.end12, !dbg !7

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !7
  %19 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end12, !dbg !7

if.end12:                                         ; preds = %if.end9, %then10
  %20 = load i32, i32* %f, align 4, !dbg !7
  %21 = icmp ne i32 %20, 5, !dbg !7
  br i1 %21, label %then13, label %if.end15, !dbg !7

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !7
  %22 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end15, !dbg !7

if.end15:                                         ; preds = %if.end12, %then13
  %23 = load i32, i32* %g, align 4, !dbg !7
  %24 = icmp ne i32 %23, 6, !dbg !7
  br i1 %24, label %then16, label %if.end18, !dbg !7

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !7
  %25 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end18, !dbg !7

if.end18:                                         ; preds = %if.end15, %then16
  %26 = load i32, i32* %h, align 4, !dbg !7
  %27 = icmp ne i32 %26, 7, !dbg !7
  br i1 %27, label %then19, label %if.end21, !dbg !7

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !7
  %28 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end21, !dbg !7

if.end21:                                         ; preds = %if.end18, %then19
  %29 = load i32, i32* %err, align 4, !dbg !7
  %30 = icmp eq i32 %29, 0, !dbg !7
  %. = select i1 %30, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0), !dbg !7
  %31 = call i32 (i8*, ...) @printf(i8* %.), !dbg !7
  %32 = load i32, i32* %err, align 4, !dbg !7
  ret i32 %32, !dbg !7
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "7.variable_list.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
