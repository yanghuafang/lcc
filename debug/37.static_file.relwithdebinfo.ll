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
  store i32 %0, i32* %value, align 4, !dbg !7
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
  %2 = load i32, i32* @counter, align 4, !dbg !11
  ret i32 %2, !dbg !11
}

define i32 @bump_with_helper() !dbg !12 {
entry:
  %0 = load i32, i32* @counter, align 4, !dbg !13
  %1 = add i32 %0, 1, !dbg !13
  store i32 %1, i32* @counter, align 4, !dbg !13
  %2 = load i32, i32* @counter, align 4, !dbg !13
  %3 = call i32 @helper(i32 %2), !dbg !13
  ret i32 %3, !dbg !13
}

define i32 @main() !dbg !14 {
entry:
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !15
  %0 = call i32 @helper(i32 5), !dbg !15
  %1 = icmp ne i32 %0, 5, !dbg !15
  br i1 %1, label %then, label %if.end, !dbg !15

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !15
  %2 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end, !dbg !15

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @bump(), !dbg !15
  %4 = icmp ne i32 %3, 1, !dbg !15
  br i1 %4, label %then1, label %if.end3, !dbg !15

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !15
  %5 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end3, !dbg !15

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @bump(), !dbg !15
  %7 = icmp ne i32 %6, 2, !dbg !15
  br i1 %7, label %then4, label %if.end6, !dbg !15

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !15
  %8 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end6, !dbg !15

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @helper(i32 3), !dbg !15
  %10 = icmp ne i32 %9, 5, !dbg !15
  br i1 %10, label %then7, label %if.end9, !dbg !15

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !15
  %11 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end9, !dbg !15

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @bump_with_helper(), !dbg !15
  %13 = icmp ne i32 %12, 6, !dbg !15
  br i1 %13, label %then10, label %if.end12, !dbg !15

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !15
  %14 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end12, !dbg !15

if.end12:                                         ; preds = %if.end9, %then10
  %15 = load i32, i32* %err, align 4, !dbg !15
  %16 = icmp eq i32 %15, 0, !dbg !15
  %. = select i1 %16, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @1, i32 0, i32 0), !dbg !15
  %17 = call i32 (i8*, ...) @printf(i8* %.), !dbg !15
  %18 = load i32, i32* %err, align 4, !dbg !15
  ret i32 %18, !dbg !15
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "37.static_file.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "helper", linkageName: "helper", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
!8 = distinct !DISubprogram(name: "bump", linkageName: "bump", scope: null, file: !1, line: 1, type: !9, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!9 = !DISubroutineType(types: !10)
!10 = !{!5}
!11 = !DILocation(line: 1, column: 1, scope: !8)
!12 = distinct !DISubprogram(name: "bump_with_helper", linkageName: "bump_with_helper", scope: null, file: !1, line: 1, type: !9, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!13 = !DILocation(line: 1, column: 1, scope: !12)
!14 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !9, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!15 = !DILocation(line: 1, column: 1, scope: !14)
