; ModuleID = 'lcc'
source_filename = "lcc"

@counter = internal global i32 0
@0 = private unnamed_addr constant [23 x i8] c"37.static_file.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [23 x i8] c"37.static_file.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define internal i32 @helper(i32 %0) !dbg !2 {
entry:
  %value = alloca i32, align 4
    #dbg_declare(ptr %value, !7, !DIExpression(), !8)
  store i32 %0, ptr %value, align 4, !dbg !8
  %1 = load i32, ptr %value, align 4, !dbg !9
  %2 = load i32, ptr @counter, align 4, !dbg !9
  %3 = add i32 %1, %2, !dbg !9
  ret i32 %3, !dbg !9
}

define i32 @bump() !dbg !10 {
entry:
  %0 = load i32, ptr @counter, align 4, !dbg !13
  %1 = add i32 %0, 1, !dbg !13
  store i32 %1, ptr @counter, align 4, !dbg !13
  %2 = load i32, ptr @counter, align 4, !dbg !14
  ret i32 %2, !dbg !14
}

define i32 @bump_with_helper() !dbg !15 {
entry:
  %0 = load i32, ptr @counter, align 4, !dbg !16
  %1 = add i32 %0, 1, !dbg !16
  store i32 %1, ptr @counter, align 4, !dbg !16
  %2 = load i32, ptr @counter, align 4, !dbg !17
  %3 = call i32 @helper(i32 %2), !dbg !17
  ret i32 %3, !dbg !17
}

define i32 @main() !dbg !18 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !19, !DIExpression(), !20)
  store i32 0, ptr %err, align 4, !dbg !20
  %0 = call i32 @helper(i32 5), !dbg !21
  %1 = icmp ne i32 %0, 5, !dbg !21
  br i1 %1, label %then, label %else, !dbg !21

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !22
  %2 = load i32, ptr %err, align 4, !dbg !22
  br label %if.end, !dbg !22

else:                                             ; preds = %entry
  br label %if.end, !dbg !22

if.end:                                           ; preds = %else, %then
  %3 = call i32 @bump(), !dbg !23
  %4 = icmp ne i32 %3, 1, !dbg !23
  br i1 %4, label %then1, label %else2, !dbg !23

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !24
  %5 = load i32, ptr %err, align 4, !dbg !24
  br label %if.end3, !dbg !24

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !24

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @bump(), !dbg !25
  %7 = icmp ne i32 %6, 2, !dbg !25
  br i1 %7, label %then4, label %else5, !dbg !25

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !26
  %8 = load i32, ptr %err, align 4, !dbg !26
  br label %if.end6, !dbg !26

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !26

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @helper(i32 3), !dbg !27
  %10 = icmp ne i32 %9, 5, !dbg !27
  br i1 %10, label %then7, label %else8, !dbg !27

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !28
  %11 = load i32, ptr %err, align 4, !dbg !28
  br label %if.end9, !dbg !28

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !28

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @bump_with_helper(), !dbg !29
  %13 = icmp ne i32 %12, 6, !dbg !29
  br i1 %13, label %then10, label %else11, !dbg !29

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !30
  %14 = load i32, ptr %err, align 4, !dbg !30
  br label %if.end12, !dbg !30

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !30

if.end12:                                         ; preds = %else11, %then10
  %15 = load i32, ptr %err, align 4, !dbg !31
  %16 = icmp eq i32 %15, 0, !dbg !31
  br i1 %16, label %then13, label %else14, !dbg !31

then13:                                           ; preds = %if.end12
  %17 = call i32 (ptr, ...) @printf(ptr @0), !dbg !32
  br label %if.end15, !dbg !32

else14:                                           ; preds = %if.end12
  %18 = call i32 (ptr, ...) @printf(ptr @1), !dbg !34
  br label %if.end15, !dbg !34

if.end15:                                         ; preds = %else14, %then13
  %19 = load i32, ptr %err, align 4, !dbg !36
  ret i32 %19, !dbg !36
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "37.static_file.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "helper", linkageName: "helper", scope: null, file: !1, line: 5, type: !3, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "value", arg: 1, scope: !2, file: !1, line: 5, type: !5)
!8 = !DILocation(line: 5, column: 12, scope: !2)
!9 = !DILocation(line: 6, column: 3, scope: !2)
!10 = distinct !DISubprogram(name: "bump", linkageName: "bump", scope: null, file: !1, line: 9, type: !11, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0)
!11 = !DISubroutineType(types: !12)
!12 = !{!5}
!13 = !DILocation(line: 10, column: 3, scope: !10)
!14 = !DILocation(line: 11, column: 3, scope: !10)
!15 = distinct !DISubprogram(name: "bump_with_helper", linkageName: "bump_with_helper", scope: null, file: !1, line: 14, type: !11, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0)
!16 = !DILocation(line: 15, column: 3, scope: !15)
!17 = !DILocation(line: 16, column: 3, scope: !15)
!18 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 19, type: !11, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!19 = !DILocalVariable(name: "err", scope: !18, file: !1, line: 20, type: !5)
!20 = !DILocation(line: 20, column: 3, scope: !18)
!21 = !DILocation(line: 22, column: 3, scope: !18)
!22 = !DILocation(line: 22, column: 23, scope: !18)
!23 = !DILocation(line: 23, column: 3, scope: !18)
!24 = !DILocation(line: 23, column: 20, scope: !18)
!25 = !DILocation(line: 24, column: 3, scope: !18)
!26 = !DILocation(line: 24, column: 20, scope: !18)
!27 = !DILocation(line: 25, column: 3, scope: !18)
!28 = !DILocation(line: 25, column: 23, scope: !18)
!29 = !DILocation(line: 26, column: 3, scope: !18)
!30 = !DILocation(line: 26, column: 32, scope: !18)
!31 = !DILocation(line: 28, column: 3, scope: !18)
!32 = !DILocation(line: 29, column: 5, scope: !33)
!33 = distinct !DILexicalBlock(scope: !18, file: !1, line: 28, column: 17)
!34 = !DILocation(line: 31, column: 5, scope: !35)
!35 = distinct !DILexicalBlock(scope: !18, file: !1, line: 30, column: 10)
!36 = !DILocation(line: 33, column: 3, scope: !18)
