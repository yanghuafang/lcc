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
    #dbg_declare(ptr %value, !8, !DIExpression(), !9)
  store i32 %0, ptr %value, align 4, !dbg !9
  %1 = load i32, ptr %value, align 4, !dbg !10
  %2 = load i32, ptr @counter, align 4, !dbg !10
  %3 = add i32 %1, %2, !dbg !10
  ret i32 %3, !dbg !10
}

define i32 @bump() !dbg !11 {
entry:
  %0 = load i32, ptr @counter, align 4, !dbg !14
  %1 = add i32 %0, 1, !dbg !14
  store i32 %1, ptr @counter, align 4, !dbg !14
  %2 = load i32, ptr @counter, align 4, !dbg !15
  ret i32 %2, !dbg !15
}

define i32 @bump_with_helper() !dbg !16 {
entry:
  %0 = load i32, ptr @counter, align 4, !dbg !17
  %1 = add i32 %0, 1, !dbg !17
  store i32 %1, ptr @counter, align 4, !dbg !17
  %2 = load i32, ptr @counter, align 4, !dbg !18
  %3 = call i32 @helper(i32 %2), !dbg !18
  ret i32 %3, !dbg !18
}

define i32 @main() !dbg !19 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !20, !DIExpression(), !21)
  store i32 0, ptr %err, align 4, !dbg !21
  %0 = call i32 @helper(i32 5), !dbg !22
  %1 = icmp ne i32 %0, 5, !dbg !22
  br i1 %1, label %then, label %else, !dbg !22

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !23
  %2 = load i32, ptr %err, align 4, !dbg !23
  br label %if.end, !dbg !23

else:                                             ; preds = %entry
  br label %if.end, !dbg !23

if.end:                                           ; preds = %else, %then
  %3 = call i32 @bump(), !dbg !24
  %4 = icmp ne i32 %3, 1, !dbg !24
  br i1 %4, label %then1, label %else2, !dbg !24

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !25
  %5 = load i32, ptr %err, align 4, !dbg !25
  br label %if.end3, !dbg !25

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !25

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @bump(), !dbg !26
  %7 = icmp ne i32 %6, 2, !dbg !26
  br i1 %7, label %then4, label %else5, !dbg !26

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !27
  %8 = load i32, ptr %err, align 4, !dbg !27
  br label %if.end6, !dbg !27

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !27

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @helper(i32 3), !dbg !28
  %10 = icmp ne i32 %9, 5, !dbg !28
  br i1 %10, label %then7, label %else8, !dbg !28

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !29
  %11 = load i32, ptr %err, align 4, !dbg !29
  br label %if.end9, !dbg !29

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !29

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @bump_with_helper(), !dbg !30
  %13 = icmp ne i32 %12, 6, !dbg !30
  br i1 %13, label %then10, label %else11, !dbg !30

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !31
  %14 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end12, !dbg !31

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !31

if.end12:                                         ; preds = %else11, %then10
  %15 = load i32, ptr %err, align 4, !dbg !32
  %16 = icmp eq i32 %15, 0, !dbg !32
  br i1 %16, label %then13, label %else14, !dbg !32

then13:                                           ; preds = %if.end12
  %17 = call i32 (ptr, ...) @printf(ptr @0), !dbg !33
  br label %if.end15, !dbg !33

else14:                                           ; preds = %if.end12
  %18 = call i32 (ptr, ...) @printf(ptr @1), !dbg !35
  br label %if.end15, !dbg !35

if.end15:                                         ; preds = %else14, %then13
  %19 = load i32, ptr %err, align 4, !dbg !37
  ret i32 %19, !dbg !37
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "37.static_file.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "helper", linkageName: "helper", scope: null, file: !3, line: 8, type: !5, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "value", arg: 1, scope: !4, file: !3, line: 8, type: !7)
!9 = !DILocation(line: 8, column: 12, scope: !4)
!10 = !DILocation(line: 8, column: 32, scope: !4)
!11 = distinct !DISubprogram(name: "bump", linkageName: "bump", scope: null, file: !3, line: 10, type: !12, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !2)
!12 = !DISubroutineType(types: !13)
!13 = !{!7}
!14 = !DILocation(line: 11, column: 3, scope: !11)
!15 = !DILocation(line: 12, column: 3, scope: !11)
!16 = distinct !DISubprogram(name: "bump_with_helper", linkageName: "bump_with_helper", scope: null, file: !3, line: 15, type: !12, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !2)
!17 = !DILocation(line: 16, column: 3, scope: !16)
!18 = !DILocation(line: 17, column: 3, scope: !16)
!19 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 20, type: !12, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !2)
!20 = !DILocalVariable(name: "err", scope: !19, file: !3, line: 21, type: !7)
!21 = !DILocation(line: 21, column: 3, scope: !19)
!22 = !DILocation(line: 23, column: 3, scope: !19)
!23 = !DILocation(line: 23, column: 23, scope: !19)
!24 = !DILocation(line: 24, column: 3, scope: !19)
!25 = !DILocation(line: 24, column: 20, scope: !19)
!26 = !DILocation(line: 25, column: 3, scope: !19)
!27 = !DILocation(line: 25, column: 20, scope: !19)
!28 = !DILocation(line: 26, column: 3, scope: !19)
!29 = !DILocation(line: 26, column: 23, scope: !19)
!30 = !DILocation(line: 27, column: 3, scope: !19)
!31 = !DILocation(line: 27, column: 32, scope: !19)
!32 = !DILocation(line: 29, column: 3, scope: !19)
!33 = !DILocation(line: 30, column: 5, scope: !34)
!34 = distinct !DILexicalBlock(scope: !19, file: !3, line: 29, column: 17)
!35 = !DILocation(line: 32, column: 5, scope: !36)
!36 = distinct !DILexicalBlock(scope: !19, file: !3, line: 31, column: 10)
!37 = !DILocation(line: 34, column: 3, scope: !19)
