; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [20 x i8] c"21.continue.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"21.continue.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @countEvenNumber(i32 %0) !dbg !2 {
entry:
  %i = alloca i32, align 4
  %count = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, i32* %n, align 4, !dbg !7
  store i32 0, i32* %count, align 4, !dbg !7
  store i32 1, i32* %i, align 4, !dbg !7
  br label %for.cond, !dbg !7

for.cond:                                         ; preds = %for.update, %entry
  %1 = load i32, i32* %i, align 4, !dbg !7
  %2 = load i32, i32* %n, align 4, !dbg !7
  %3 = icmp sle i32 %1, %2, !dbg !7
  br i1 %3, label %for.loop, label %for.end, !dbg !7

for.loop:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !7
  %5 = srem i32 %4, 2, !dbg !7
  %6 = icmp ne i32 %5, 0, !dbg !7
  br i1 %6, label %for.update, label %if.end, !dbg !7

if.end:                                           ; preds = %for.loop
  %7 = load i32, i32* %count, align 4, !dbg !7
  %8 = add i32 %7, 1, !dbg !7
  store i32 %8, i32* %count, align 4, !dbg !7
  %9 = load i32, i32* %count, align 4, !dbg !7
  br label %for.update, !dbg !7

for.update:                                       ; preds = %for.loop, %if.end
  %10 = load i32, i32* %i, align 4, !dbg !7
  %11 = add i32 %10, 1, !dbg !7
  store i32 %11, i32* %i, align 4, !dbg !7
  %12 = load i32, i32* %i, align 4, !dbg !7
  br label %for.cond, !dbg !7

for.end:                                          ; preds = %for.cond
  %13 = load i32, i32* %count, align 4, !dbg !7
  ret i32 %13, !dbg !7
}

define i32 @countEvenNumber2(i32 %0) !dbg !8 {
entry:
  %i = alloca i32, align 4
  %count = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, i32* %n, align 4, !dbg !9
  store i32 0, i32* %count, align 4, !dbg !9
  store i32 1, i32* %i, align 4, !dbg !9
  br label %while.cond, !dbg !9

while.cond:                                       ; preds = %if.end, %then, %entry
  %1 = load i32, i32* %i, align 4, !dbg !9
  %2 = load i32, i32* %n, align 4, !dbg !9
  %3 = icmp sle i32 %1, %2, !dbg !9
  br i1 %3, label %while.loop, label %while.end, !dbg !9

while.loop:                                       ; preds = %while.cond
  %4 = load i32, i32* %i, align 4, !dbg !9
  %5 = srem i32 %4, 2, !dbg !9
  %6 = icmp ne i32 %5, 0, !dbg !9
  br i1 %6, label %then, label %if.end, !dbg !9

then:                                             ; preds = %while.loop
  %7 = load i32, i32* %i, align 4, !dbg !9
  %8 = add i32 %7, 1, !dbg !9
  store i32 %8, i32* %i, align 4, !dbg !9
  %9 = load i32, i32* %i, align 4, !dbg !9
  br label %while.cond, !dbg !9

if.end:                                           ; preds = %while.loop
  %10 = load i32, i32* %count, align 4, !dbg !9
  %11 = add i32 %10, 1, !dbg !9
  store i32 %11, i32* %count, align 4, !dbg !9
  %12 = load i32, i32* %count, align 4, !dbg !9
  %13 = load i32, i32* %i, align 4, !dbg !9
  %14 = add i32 %13, 1, !dbg !9
  store i32 %14, i32* %i, align 4, !dbg !9
  %15 = load i32, i32* %i, align 4, !dbg !9
  br label %while.cond, !dbg !9

while.end:                                        ; preds = %while.cond
  %16 = load i32, i32* %count, align 4, !dbg !9
  ret i32 %16, !dbg !9
}

define i32 @countEvenNumber3(i32 %0) !dbg !10 {
entry:
  %i = alloca i32, align 4
  %count = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, i32* %n, align 4, !dbg !11
  store i32 0, i32* %count, align 4, !dbg !11
  store i32 1, i32* %i, align 4, !dbg !11
  br label %do.loop, !dbg !11

do.loop:                                          ; preds = %do.cond, %entry
  %1 = load i32, i32* %i, align 4, !dbg !11
  %2 = srem i32 %1, 2, !dbg !11
  %3 = icmp ne i32 %2, 0, !dbg !11
  br i1 %3, label %then, label %if.end, !dbg !11

then:                                             ; preds = %do.loop
  %4 = load i32, i32* %i, align 4, !dbg !11
  %5 = add i32 %4, 1, !dbg !11
  store i32 %5, i32* %i, align 4, !dbg !11
  %6 = load i32, i32* %i, align 4, !dbg !11
  br label %do.cond, !dbg !11

if.end:                                           ; preds = %do.loop
  %7 = load i32, i32* %count, align 4, !dbg !11
  %8 = add i32 %7, 1, !dbg !11
  store i32 %8, i32* %count, align 4, !dbg !11
  %9 = load i32, i32* %count, align 4, !dbg !11
  %10 = load i32, i32* %i, align 4, !dbg !11
  %11 = add i32 %10, 1, !dbg !11
  store i32 %11, i32* %i, align 4, !dbg !11
  %12 = load i32, i32* %i, align 4, !dbg !11
  br label %do.cond, !dbg !11

do.cond:                                          ; preds = %if.end, %then
  %13 = load i32, i32* %i, align 4, !dbg !11
  %14 = load i32, i32* %n, align 4, !dbg !11
  %15 = icmp sle i32 %13, %14, !dbg !11
  br i1 %15, label %do.loop, label %do.end, !dbg !11

do.end:                                           ; preds = %do.cond
  %16 = load i32, i32* %count, align 4, !dbg !11
  ret i32 %16, !dbg !11
}

define i32 @main() !dbg !12 {
entry:
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !15
  %0 = call i32 @countEvenNumber(i32 32), !dbg !15
  %1 = icmp ne i32 %0, 16, !dbg !15
  br i1 %1, label %then, label %if.end, !dbg !15

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !15
  %2 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end, !dbg !15

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @countEvenNumber2(i32 32), !dbg !15
  %4 = icmp ne i32 %3, 16, !dbg !15
  br i1 %4, label %then1, label %if.end3, !dbg !15

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !15
  %5 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end3, !dbg !15

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @countEvenNumber3(i32 32), !dbg !15
  %7 = icmp ne i32 %6, 16, !dbg !15
  br i1 %7, label %then4, label %if.end6, !dbg !15

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !15
  %8 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end6, !dbg !15

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @countEvenNumber(i32 0), !dbg !15
  %10 = icmp ne i32 %9, 0, !dbg !15
  br i1 %10, label %then7, label %if.end9, !dbg !15

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !15
  %11 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end9, !dbg !15

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @countEvenNumber(i32 1), !dbg !15
  %13 = icmp ne i32 %12, 0, !dbg !15
  br i1 %13, label %then10, label %if.end12, !dbg !15

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !15
  %14 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end12, !dbg !15

if.end12:                                         ; preds = %if.end9, %then10
  %15 = load i32, i32* %err, align 4, !dbg !15
  %16 = icmp eq i32 %15, 0, !dbg !15
  %. = select i1 %16, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @1, i32 0, i32 0), !dbg !15
  %17 = call i32 (i8*, ...) @printf(i8* %.), !dbg !15
  %18 = load i32, i32* %err, align 4, !dbg !15
  ret i32 %18, !dbg !15
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "21.continue.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "countEvenNumber", linkageName: "countEvenNumber", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
!8 = distinct !DISubprogram(name: "countEvenNumber2", linkageName: "countEvenNumber2", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!9 = !DILocation(line: 1, column: 1, scope: !8)
!10 = distinct !DISubprogram(name: "countEvenNumber3", linkageName: "countEvenNumber3", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!11 = !DILocation(line: 1, column: 1, scope: !10)
!12 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !13, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!13 = !DISubroutineType(types: !14)
!14 = !{!5}
!15 = !DILocation(line: 1, column: 1, scope: !12)
