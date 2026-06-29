; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [19 x i8] c"16.ternary.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"16.ternary.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %ternarySame = alloca i32, align 4
    #dbg_declare(ptr %ternarySame, !7, !DIExpression(), !8)
  %same = alloca i32, align 4
    #dbg_declare(ptr %same, !9, !DIExpression(), !10)
  %maxNeg = alloca i32, align 4
    #dbg_declare(ptr %maxNeg, !11, !DIExpression(), !12)
  %minNeg = alloca i32, align 4
    #dbg_declare(ptr %minNeg, !13, !DIExpression(), !14)
  %e = alloca i32, align 4
    #dbg_declare(ptr %e, !15, !DIExpression(), !16)
  %d = alloca i32, align 4
    #dbg_declare(ptr %d, !17, !DIExpression(), !18)
  %maxVal = alloca i32, align 4
    #dbg_declare(ptr %maxVal, !19, !DIExpression(), !20)
  %minVal = alloca i32, align 4
    #dbg_declare(ptr %minVal, !21, !DIExpression(), !22)
  %c = alloca i32, align 4
    #dbg_declare(ptr %c, !23, !DIExpression(), !24)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !25, !DIExpression(), !26)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !27, !DIExpression(), !28)
  store i32 0, ptr %err, align 4, !dbg !28
  store i32 3, ptr %a, align 4, !dbg !26
  store i32 7, ptr %c, align 4, !dbg !24
  %0 = load i32, ptr %a, align 4, !dbg !22
  %1 = load i32, ptr %c, align 4, !dbg !22
  %2 = icmp slt i32 %0, %1, !dbg !22
  %3 = load i32, ptr %a, align 4, !dbg !22
  %4 = load i32, ptr %c, align 4, !dbg !22
  %5 = select i1 %2, i32 %3, i32 %4, !dbg !22
  store i32 %5, ptr %minVal, align 4, !dbg !22
  %6 = load i32, ptr %a, align 4, !dbg !20
  %7 = load i32, ptr %c, align 4, !dbg !20
  %8 = icmp slt i32 %6, %7, !dbg !20
  %9 = load i32, ptr %c, align 4, !dbg !20
  %10 = load i32, ptr %a, align 4, !dbg !20
  %11 = select i1 %8, i32 %9, i32 %10, !dbg !20
  store i32 %11, ptr %maxVal, align 4, !dbg !20
  %12 = load i32, ptr %minVal, align 4, !dbg !29
  %13 = icmp ne i32 %12, 3, !dbg !29
  br i1 %13, label %then, label %else, !dbg !29

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !30
  %14 = load i32, ptr %err, align 4, !dbg !30
  br label %if.end, !dbg !30

else:                                             ; preds = %entry
  br label %if.end, !dbg !30

if.end:                                           ; preds = %else, %then
  %15 = load i32, ptr %maxVal, align 4, !dbg !31
  %16 = icmp ne i32 %15, 7, !dbg !31
  br i1 %16, label %then1, label %else2, !dbg !31

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !32
  %17 = load i32, ptr %err, align 4, !dbg !32
  br label %if.end3, !dbg !32

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !32

if.end3:                                          ; preds = %else2, %then1
  store i32 -5, ptr %d, align 4, !dbg !18
  store i32 2, ptr %e, align 4, !dbg !16
  %18 = load i32, ptr %d, align 4, !dbg !14
  %19 = load i32, ptr %e, align 4, !dbg !14
  %20 = icmp slt i32 %18, %19, !dbg !14
  %21 = load i32, ptr %d, align 4, !dbg !14
  %22 = load i32, ptr %e, align 4, !dbg !14
  %23 = select i1 %20, i32 %21, i32 %22, !dbg !14
  store i32 %23, ptr %minNeg, align 4, !dbg !14
  %24 = load i32, ptr %d, align 4, !dbg !12
  %25 = load i32, ptr %e, align 4, !dbg !12
  %26 = icmp slt i32 %24, %25, !dbg !12
  %27 = load i32, ptr %e, align 4, !dbg !12
  %28 = load i32, ptr %d, align 4, !dbg !12
  %29 = select i1 %26, i32 %27, i32 %28, !dbg !12
  store i32 %29, ptr %maxNeg, align 4, !dbg !12
  %30 = load i32, ptr %minNeg, align 4, !dbg !33
  %31 = icmp ne i32 %30, -5, !dbg !33
  br i1 %31, label %then4, label %else5, !dbg !33

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !34
  %32 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end6, !dbg !34

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !34

if.end6:                                          ; preds = %else5, %then4
  %33 = load i32, ptr %maxNeg, align 4, !dbg !35
  %34 = icmp ne i32 %33, 2, !dbg !35
  br i1 %34, label %then7, label %else8, !dbg !35

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !36
  %35 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end9, !dbg !36

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !36

if.end9:                                          ; preds = %else8, %then7
  store i32 42, ptr %same, align 4, !dbg !10
  %36 = load i32, ptr %same, align 4, !dbg !8
  %37 = load i32, ptr %same, align 4, !dbg !8
  %38 = icmp slt i32 %36, %37, !dbg !8
  %39 = select i1 %38, i32 0, i32 1, !dbg !8
  store i32 %39, ptr %ternarySame, align 4, !dbg !8
  %40 = load i32, ptr %ternarySame, align 4, !dbg !37
  %41 = icmp ne i32 %40, 1, !dbg !37
  br i1 %41, label %then10, label %else11, !dbg !37

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !38
  %42 = load i32, ptr %err, align 4, !dbg !38
  br label %if.end12, !dbg !38

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !38

if.end12:                                         ; preds = %else11, %then10
  %43 = load i32, ptr %err, align 4, !dbg !39
  %44 = icmp eq i32 %43, 0, !dbg !39
  br i1 %44, label %then13, label %else14, !dbg !39

then13:                                           ; preds = %if.end12
  %45 = call i32 (ptr, ...) @printf(ptr @0), !dbg !40
  br label %if.end15, !dbg !40

else14:                                           ; preds = %if.end12
  %46 = call i32 (ptr, ...) @printf(ptr @1), !dbg !42
  br label %if.end15, !dbg !42

if.end15:                                         ; preds = %else14, %then13
  %47 = load i32, ptr %err, align 4, !dbg !44
  ret i32 %47, !dbg !44
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "16.ternary.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "ternarySame", scope: !2, file: !1, line: 21, type: !5)
!8 = !DILocation(line: 21, column: 3, scope: !2)
!9 = !DILocalVariable(name: "same", scope: !2, file: !1, line: 20, type: !5)
!10 = !DILocation(line: 20, column: 3, scope: !2)
!11 = !DILocalVariable(name: "maxNeg", scope: !2, file: !1, line: 16, type: !5)
!12 = !DILocation(line: 16, column: 3, scope: !2)
!13 = !DILocalVariable(name: "minNeg", scope: !2, file: !1, line: 15, type: !5)
!14 = !DILocation(line: 15, column: 3, scope: !2)
!15 = !DILocalVariable(name: "e", scope: !2, file: !1, line: 14, type: !5)
!16 = !DILocation(line: 14, column: 3, scope: !2)
!17 = !DILocalVariable(name: "d", scope: !2, file: !1, line: 13, type: !5)
!18 = !DILocation(line: 13, column: 3, scope: !2)
!19 = !DILocalVariable(name: "maxVal", scope: !2, file: !1, line: 9, type: !5)
!20 = !DILocation(line: 9, column: 3, scope: !2)
!21 = !DILocalVariable(name: "minVal", scope: !2, file: !1, line: 8, type: !5)
!22 = !DILocation(line: 8, column: 3, scope: !2)
!23 = !DILocalVariable(name: "c", scope: !2, file: !1, line: 6, type: !5)
!24 = !DILocation(line: 6, column: 3, scope: !2)
!25 = !DILocalVariable(name: "a", scope: !2, file: !1, line: 5, type: !5)
!26 = !DILocation(line: 5, column: 3, scope: !2)
!27 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 4, type: !5)
!28 = !DILocation(line: 4, column: 3, scope: !2)
!29 = !DILocation(line: 10, column: 3, scope: !2)
!30 = !DILocation(line: 10, column: 20, scope: !2)
!31 = !DILocation(line: 11, column: 3, scope: !2)
!32 = !DILocation(line: 11, column: 20, scope: !2)
!33 = !DILocation(line: 17, column: 3, scope: !2)
!34 = !DILocation(line: 17, column: 21, scope: !2)
!35 = !DILocation(line: 18, column: 3, scope: !2)
!36 = !DILocation(line: 18, column: 20, scope: !2)
!37 = !DILocation(line: 22, column: 3, scope: !2)
!38 = !DILocation(line: 22, column: 25, scope: !2)
!39 = !DILocation(line: 24, column: 3, scope: !2)
!40 = !DILocation(line: 25, column: 5, scope: !41)
!41 = distinct !DILexicalBlock(scope: !2, file: !1, line: 24, column: 17)
!42 = !DILocation(line: 27, column: 5, scope: !43)
!43 = distinct !DILexicalBlock(scope: !2, file: !1, line: 26, column: 10)
!44 = !DILocation(line: 29, column: 3, scope: !2)
