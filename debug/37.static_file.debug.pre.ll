; ModuleID = 'lcc'
source_filename = "lcc"

@counter = internal global i32 0
@0 = private unnamed_addr constant [23 x i8] c"37.static_file.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [23 x i8] c"37.static_file.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define internal i32 @helper(i32 %0) !dbg !2 {
entry:
  %value = alloca i32, align 4
    #dbg_declare(ptr %value, !6, !DIExpression(), !7)
  store i32 %0, ptr %value, align 4, !dbg !7
  %1 = load i32, ptr %value, align 4, !dbg !8
  %2 = load i32, ptr @counter, align 4, !dbg !8
  %3 = add i32 %1, %2, !dbg !8
  ret i32 %3, !dbg !8
}

define i32 @bump() !dbg !9 {
entry:
  %0 = load i32, ptr @counter, align 4, !dbg !12
  %1 = add i32 %0, 1, !dbg !12
  store i32 %1, ptr @counter, align 4, !dbg !12
  %2 = load i32, ptr @counter, align 4, !dbg !13
  ret i32 %2, !dbg !13
}

define i32 @bump_with_helper() !dbg !14 {
entry:
  %0 = load i32, ptr @counter, align 4, !dbg !15
  %1 = add i32 %0, 1, !dbg !15
  store i32 %1, ptr @counter, align 4, !dbg !15
  %2 = load i32, ptr @counter, align 4, !dbg !16
  %3 = call i32 @helper(i32 %2), !dbg !16
  ret i32 %3, !dbg !16
}

define i32 @main() !dbg !17 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !18, !DIExpression(), !19)
  store i32 0, ptr %err, align 4, !dbg !19
  %0 = call i32 @helper(i32 5), !dbg !20
  %1 = icmp ne i32 %0, 5, !dbg !20
  br i1 %1, label %then, label %else, !dbg !20

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !21
  %2 = load i32, ptr %err, align 4, !dbg !21
  br label %if.end, !dbg !21

else:                                             ; preds = %entry
  br label %if.end, !dbg !21

if.end:                                           ; preds = %else, %then
  %3 = call i32 @bump(), !dbg !22
  %4 = icmp ne i32 %3, 1, !dbg !22
  br i1 %4, label %then1, label %else2, !dbg !22

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !23
  %5 = load i32, ptr %err, align 4, !dbg !23
  br label %if.end3, !dbg !23

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !23

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @bump(), !dbg !24
  %7 = icmp ne i32 %6, 2, !dbg !24
  br i1 %7, label %then4, label %else5, !dbg !24

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !25
  %8 = load i32, ptr %err, align 4, !dbg !25
  br label %if.end6, !dbg !25

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !25

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @helper(i32 3), !dbg !26
  %10 = icmp ne i32 %9, 5, !dbg !26
  br i1 %10, label %then7, label %else8, !dbg !26

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !27
  %11 = load i32, ptr %err, align 4, !dbg !27
  br label %if.end9, !dbg !27

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !27

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @bump_with_helper(), !dbg !28
  %13 = icmp ne i32 %12, 6, !dbg !28
  br i1 %13, label %then10, label %else11, !dbg !28

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !29
  %14 = load i32, ptr %err, align 4, !dbg !29
  br label %if.end12, !dbg !29

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !29

if.end12:                                         ; preds = %else11, %then10
  %15 = load i32, ptr %err, align 4, !dbg !30
  %16 = icmp eq i32 %15, 0, !dbg !30
  br i1 %16, label %then13, label %else14, !dbg !30

then13:                                           ; preds = %if.end12
  %17 = call i32 (ptr, ...) @printf(ptr @0), !dbg !31
  br label %if.end15, !dbg !31

else14:                                           ; preds = %if.end12
  %18 = call i32 (ptr, ...) @printf(ptr @1), !dbg !33
  br label %if.end15, !dbg !33

if.end15:                                         ; preds = %else14, %then13
  %19 = load i32, ptr %err, align 4, !dbg !35
  ret i32 %19, !dbg !35
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "37.static_file.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "helper", linkageName: "helper", scope: null, file: !1, line: 5, type: !3, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "value", arg: 1, scope: !2, file: !1, line: 5, type: !5)
!7 = !DILocation(line: 5, column: 12, scope: !2)
!8 = !DILocation(line: 6, column: 3, scope: !2)
!9 = distinct !DISubprogram(name: "bump", linkageName: "bump", scope: null, file: !1, line: 9, type: !10, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DISubroutineType(types: !11)
!11 = !{!5}
!12 = !DILocation(line: 10, column: 3, scope: !9)
!13 = !DILocation(line: 11, column: 3, scope: !9)
!14 = distinct !DISubprogram(name: "bump_with_helper", linkageName: "bump_with_helper", scope: null, file: !1, line: 14, type: !10, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0)
!15 = !DILocation(line: 15, column: 3, scope: !14)
!16 = !DILocation(line: 16, column: 3, scope: !14)
!17 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 19, type: !10, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !0)
!18 = !DILocalVariable(name: "err", scope: !17, file: !1, line: 20, type: !5)
!19 = !DILocation(line: 20, column: 3, scope: !17)
!20 = !DILocation(line: 22, column: 3, scope: !17)
!21 = !DILocation(line: 22, column: 23, scope: !17)
!22 = !DILocation(line: 23, column: 3, scope: !17)
!23 = !DILocation(line: 23, column: 20, scope: !17)
!24 = !DILocation(line: 24, column: 3, scope: !17)
!25 = !DILocation(line: 24, column: 20, scope: !17)
!26 = !DILocation(line: 25, column: 3, scope: !17)
!27 = !DILocation(line: 25, column: 23, scope: !17)
!28 = !DILocation(line: 26, column: 3, scope: !17)
!29 = !DILocation(line: 26, column: 32, scope: !17)
!30 = !DILocation(line: 28, column: 3, scope: !17)
!31 = !DILocation(line: 29, column: 5, scope: !32)
!32 = distinct !DILexicalBlock(scope: !17, file: !1, line: 28, column: 17)
!33 = !DILocation(line: 31, column: 5, scope: !34)
!34 = distinct !DILexicalBlock(scope: !17, file: !1, line: 30, column: 10)
!35 = !DILocation(line: 33, column: 3, scope: !17)
