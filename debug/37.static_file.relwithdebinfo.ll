; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@counter = internal global i32 0
@0 = private unnamed_addr constant [23 x i8] c"37.static_file.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [23 x i8] c"37.static_file.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define internal i32 @helper(i32 %0) !dbg !2 {
entry:
  %value = alloca i32, align 4
  store i32 %0, i32* %value, align 4
  %1 = load i32, i32* %value, align 4, !dbg !7
  %2 = load i32, i32* @counter, align 4, !dbg !7
  %3 = add i32 %1, %2, !dbg !7
  ret i32 %3, !dbg !7
}

define i32 @bump() !dbg !8 {
entry:
  %0 = load i32, i32* @counter, align 4, !dbg !11
  %1 = add i32 %0, 1, !dbg !11
  store i32 %1, i32* @counter, align 4, !dbg !11
  %2 = load i32, i32* @counter, align 4, !dbg !12
  ret i32 %2, !dbg !12
}

define i32 @bump_with_helper() !dbg !13 {
entry:
  %0 = load i32, i32* @counter, align 4, !dbg !14
  %1 = add i32 %0, 1, !dbg !14
  store i32 %1, i32* @counter, align 4, !dbg !14
  %2 = load i32, i32* @counter, align 4, !dbg !15
  %3 = call i32 @helper(i32 %2), !dbg !15
  ret i32 %3, !dbg !15
}

define i32 @main() !dbg !16 {
entry:
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !17
  %0 = call i32 @helper(i32 5), !dbg !18
  %1 = icmp ne i32 %0, 5, !dbg !18
  br i1 %1, label %then, label %if.end, !dbg !18

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !19
  %2 = load i32, i32* %err, align 4, !dbg !19
  br label %if.end, !dbg !19

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @bump(), !dbg !20
  %4 = icmp ne i32 %3, 1, !dbg !20
  br i1 %4, label %then1, label %if.end3, !dbg !20

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !21
  %5 = load i32, i32* %err, align 4, !dbg !21
  br label %if.end3, !dbg !21

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @bump(), !dbg !22
  %7 = icmp ne i32 %6, 2, !dbg !22
  br i1 %7, label %then4, label %if.end6, !dbg !22

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !23
  %8 = load i32, i32* %err, align 4, !dbg !23
  br label %if.end6, !dbg !23

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @helper(i32 3), !dbg !24
  %10 = icmp ne i32 %9, 5, !dbg !24
  br i1 %10, label %then7, label %if.end9, !dbg !24

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !25
  %11 = load i32, i32* %err, align 4, !dbg !25
  br label %if.end9, !dbg !25

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @bump_with_helper(), !dbg !26
  %13 = icmp ne i32 %12, 6, !dbg !26
  br i1 %13, label %then10, label %if.end12, !dbg !26

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !27
  %14 = load i32, i32* %err, align 4, !dbg !27
  br label %if.end12, !dbg !27

if.end12:                                         ; preds = %if.end9, %then10
  %15 = load i32, i32* %err, align 4, !dbg !28
  %16 = icmp eq i32 %15, 0, !dbg !28
  %. = select i1 %16, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @1, i32 0, i32 0), !dbg !29
  %17 = call i32 (i8*, ...) @printf(i8* %.), !dbg !29
  %18 = load i32, i32* %err, align 4, !dbg !30
  ret i32 %18, !dbg !30
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "37.static_file.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "helper", linkageName: "helper", scope: null, file: !1, line: 5, type: !3, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 6, column: 3, scope: !2)
!8 = distinct !DISubprogram(name: "bump", linkageName: "bump", scope: null, file: !1, line: 9, type: !9, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!9 = !DISubroutineType(types: !10)
!10 = !{!5}
!11 = !DILocation(line: 10, column: 3, scope: !8)
!12 = !DILocation(line: 11, column: 3, scope: !8)
!13 = distinct !DISubprogram(name: "bump_with_helper", linkageName: "bump_with_helper", scope: null, file: !1, line: 14, type: !9, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!14 = !DILocation(line: 15, column: 3, scope: !13)
!15 = !DILocation(line: 16, column: 3, scope: !13)
!16 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 19, type: !9, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!17 = !DILocation(line: 20, column: 3, scope: !16)
!18 = !DILocation(line: 22, column: 3, scope: !16)
!19 = !DILocation(line: 22, column: 23, scope: !16)
!20 = !DILocation(line: 23, column: 3, scope: !16)
!21 = !DILocation(line: 23, column: 20, scope: !16)
!22 = !DILocation(line: 24, column: 3, scope: !16)
!23 = !DILocation(line: 24, column: 20, scope: !16)
!24 = !DILocation(line: 25, column: 3, scope: !16)
!25 = !DILocation(line: 25, column: 23, scope: !16)
!26 = !DILocation(line: 26, column: 3, scope: !16)
!27 = !DILocation(line: 26, column: 32, scope: !16)
!28 = !DILocation(line: 28, column: 3, scope: !16)
!29 = !DILocation(line: 0, scope: !16)
!30 = !DILocation(line: 33, column: 3, scope: !16)
