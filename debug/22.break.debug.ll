; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [17 x i8] c"22.break.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"22.break.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @countNumber(i32 %0, i32 %1) !dbg !2 {
entry:
  %i = alloca i32, align 4
  %recordi = alloca i32, align 4
  %count = alloca i32, align 4
  %smallRange = alloca i32, align 4
  %maxRange = alloca i32, align 4
  store i32 %0, i32* %maxRange, align 4, !dbg !7
  store i32 %1, i32* %smallRange, align 4, !dbg !7
  store i32 0, i32* %count, align 4, !dbg !7
  store i32 0, i32* %recordi, align 4, !dbg !7
  store i32 1, i32* %i, align 4, !dbg !7
  br label %for.cond, !dbg !7

for.cond:                                         ; preds = %if.end, %entry
  %2 = load i32, i32* %i, align 4, !dbg !7
  %3 = load i32, i32* %maxRange, align 4, !dbg !7
  %4 = icmp sle i32 %2, %3, !dbg !7
  br i1 %4, label %for.loop, label %for.end, !dbg !7

for.loop:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !7
  %6 = load i32, i32* %smallRange, align 4, !dbg !7
  %7 = icmp sgt i32 %5, %6, !dbg !7
  br i1 %7, label %then, label %if.end, !dbg !7

then:                                             ; preds = %for.loop
  %8 = load i32, i32* %i, align 4, !dbg !7
  store i32 %8, i32* %recordi, align 4, !dbg !7
  %9 = load i32, i32* %recordi, align 4, !dbg !7
  br label %for.end, !dbg !7

if.end:                                           ; preds = %for.loop
  %10 = load i32, i32* %count, align 4, !dbg !7
  %11 = add i32 %10, 1, !dbg !7
  store i32 %11, i32* %count, align 4, !dbg !7
  %12 = load i32, i32* %count, align 4, !dbg !7
  %13 = load i32, i32* %i, align 4, !dbg !7
  %14 = add i32 %13, 1, !dbg !7
  store i32 %14, i32* %i, align 4, !dbg !7
  %15 = load i32, i32* %i, align 4, !dbg !7
  br label %for.cond, !dbg !7

for.end:                                          ; preds = %for.cond, %then
  %16 = load i32, i32* %count, align 4, !dbg !7
  ret i32 %16, !dbg !7
}

define i32 @main() !dbg !8 {
entry:
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !11
  %0 = call i32 @countNumber(i32 100, i32 37), !dbg !11
  %1 = icmp ne i32 %0, 37, !dbg !11
  br i1 %1, label %then, label %if.end, !dbg !11

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !11
  %2 = load i32, i32* %err, align 4, !dbg !11
  br label %if.end, !dbg !11

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @countNumber(i32 10, i32 10), !dbg !11
  %4 = icmp ne i32 %3, 10, !dbg !11
  br i1 %4, label %then1, label %if.end3, !dbg !11

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !11
  %5 = load i32, i32* %err, align 4, !dbg !11
  br label %if.end3, !dbg !11

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @countNumber(i32 5, i32 0), !dbg !11
  %7 = icmp ne i32 %6, 0, !dbg !11
  br i1 %7, label %then4, label %if.end6, !dbg !11

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !11
  %8 = load i32, i32* %err, align 4, !dbg !11
  br label %if.end6, !dbg !11

if.end6:                                          ; preds = %if.end3, %then4
  %9 = load i32, i32* %err, align 4, !dbg !11
  %10 = icmp eq i32 %9, 0, !dbg !11
  %. = select i1 %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @1, i32 0, i32 0), !dbg !11
  %11 = call i32 (i8*, ...) @printf(i8* %.), !dbg !11
  %12 = load i32, i32* %err, align 4, !dbg !11
  ret i32 %12, !dbg !11
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "22.break.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "countNumber", linkageName: "countNumber", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
!8 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !9, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!9 = !DISubroutineType(types: !10)
!10 = !{!5}
!11 = !DILocation(line: 1, column: 1, scope: !8)
