; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@counter = internal global i32 0
@0 = private unnamed_addr constant [23 x i8] c"37.static_file.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [23 x i8] c"37.static_file.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define internal i32 @helper(i32 %0) !dbg !4 {
entry:
  %value = alloca i32, align 4
    #dbg_declare(ptr %value, !9, !DIExpression(), !10)
  store i32 %0, ptr %value, align 4, !dbg !10
  %1 = load i32, ptr %value, align 4, !dbg !11
  %2 = load i32, ptr @counter, align 4, !dbg !11
  %3 = add i32 %1, %2, !dbg !11
  ret i32 %3, !dbg !11
}

define i32 @bump() !dbg !12 {
entry:
  %0 = load i32, ptr @counter, align 4, !dbg !15
  %1 = add i32 %0, 1, !dbg !15
  store i32 %1, ptr @counter, align 4, !dbg !15
  %2 = load i32, ptr @counter, align 4, !dbg !16
  ret i32 %2, !dbg !16
}

define i32 @bump_with_helper() !dbg !17 {
entry:
  %0 = load i32, ptr @counter, align 4, !dbg !18
  %1 = add i32 %0, 1, !dbg !18
  store i32 %1, ptr @counter, align 4, !dbg !18
  %2 = load i32, ptr @counter, align 4, !dbg !19
  %3 = call i32 @helper(i32 %2), !dbg !19
  ret i32 %3, !dbg !19
}

define i32 @main() !dbg !20 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !21, !DIExpression(), !22)
  store i32 0, ptr %err, align 4, !dbg !22
  %0 = call i32 @helper(i32 5), !dbg !23
  %1 = icmp ne i32 %0, 5, !dbg !23
  br i1 %1, label %then, label %else, !dbg !23

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !24
  %2 = load i32, ptr %err, align 4, !dbg !24
  br label %if.end, !dbg !24

else:                                             ; preds = %entry
  br label %if.end, !dbg !24

if.end:                                           ; preds = %else, %then
  %3 = call i32 @bump(), !dbg !25
  %4 = icmp ne i32 %3, 1, !dbg !25
  br i1 %4, label %then1, label %else2, !dbg !25

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !26
  %5 = load i32, ptr %err, align 4, !dbg !26
  br label %if.end3, !dbg !26

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !26

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @bump(), !dbg !27
  %7 = icmp ne i32 %6, 2, !dbg !27
  br i1 %7, label %then4, label %else5, !dbg !27

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !28
  %8 = load i32, ptr %err, align 4, !dbg !28
  br label %if.end6, !dbg !28

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !28

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @helper(i32 3), !dbg !29
  %10 = icmp ne i32 %9, 5, !dbg !29
  br i1 %10, label %then7, label %else8, !dbg !29

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !30
  %11 = load i32, ptr %err, align 4, !dbg !30
  br label %if.end9, !dbg !30

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !30

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @bump_with_helper(), !dbg !31
  %13 = icmp ne i32 %12, 6, !dbg !31
  br i1 %13, label %then10, label %else11, !dbg !31

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !32
  %14 = load i32, ptr %err, align 4, !dbg !32
  br label %if.end12, !dbg !32

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !32

if.end12:                                         ; preds = %else11, %then10
  %15 = load i32, ptr %err, align 4, !dbg !33
  %16 = icmp eq i32 %15, 0, !dbg !33
  br i1 %16, label %then13, label %else14, !dbg !33

then13:                                           ; preds = %if.end12
  %17 = call i32 (ptr, ...) @printf(ptr @0), !dbg !34
  br label %if.end15, !dbg !34

else14:                                           ; preds = %if.end12
  %18 = call i32 (ptr, ...) @printf(ptr @1), !dbg !36
  br label %if.end15, !dbg !36

if.end15:                                         ; preds = %else14, %then13
  %19 = load i32, ptr %err, align 4, !dbg !38
  ret i32 %19, !dbg !38
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "37.static_file.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "helper", linkageName: "helper", scope: null, file: !3, line: 8, type: !5, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "value", arg: 1, scope: !4, file: !3, line: 8, type: !7)
!10 = !DILocation(line: 8, column: 12, scope: !4)
!11 = !DILocation(line: 8, column: 32, scope: !4)
!12 = distinct !DISubprogram(name: "bump", linkageName: "bump", scope: null, file: !3, line: 10, type: !13, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !2)
!13 = !DISubroutineType(types: !14)
!14 = !{!7}
!15 = !DILocation(line: 11, column: 3, scope: !12)
!16 = !DILocation(line: 12, column: 3, scope: !12)
!17 = distinct !DISubprogram(name: "bump_with_helper", linkageName: "bump_with_helper", scope: null, file: !3, line: 15, type: !13, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !2)
!18 = !DILocation(line: 16, column: 3, scope: !17)
!19 = !DILocation(line: 17, column: 3, scope: !17)
!20 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 20, type: !13, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!21 = !DILocalVariable(name: "err", scope: !20, file: !3, line: 21, type: !7)
!22 = !DILocation(line: 21, column: 3, scope: !20)
!23 = !DILocation(line: 23, column: 3, scope: !20)
!24 = !DILocation(line: 23, column: 23, scope: !20)
!25 = !DILocation(line: 24, column: 3, scope: !20)
!26 = !DILocation(line: 24, column: 20, scope: !20)
!27 = !DILocation(line: 25, column: 3, scope: !20)
!28 = !DILocation(line: 25, column: 20, scope: !20)
!29 = !DILocation(line: 26, column: 3, scope: !20)
!30 = !DILocation(line: 26, column: 23, scope: !20)
!31 = !DILocation(line: 27, column: 3, scope: !20)
!32 = !DILocation(line: 27, column: 32, scope: !20)
!33 = !DILocation(line: 29, column: 3, scope: !20)
!34 = !DILocation(line: 30, column: 5, scope: !35)
!35 = distinct !DILexicalBlock(scope: !20, file: !3, line: 29, column: 17)
!36 = !DILocation(line: 32, column: 5, scope: !37)
!37 = distinct !DILexicalBlock(scope: !20, file: !3, line: 31, column: 10)
!38 = !DILocation(line: 34, column: 3, scope: !20)
