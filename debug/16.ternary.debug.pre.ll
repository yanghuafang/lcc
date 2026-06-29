; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [19 x i8] c"16.ternary.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"16.ternary.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %ternarySame = alloca i32, align 4
    #dbg_declare(ptr %ternarySame, !6, !DIExpression(), !7)
  %same = alloca i32, align 4
    #dbg_declare(ptr %same, !8, !DIExpression(), !9)
  %maxNeg = alloca i32, align 4
    #dbg_declare(ptr %maxNeg, !10, !DIExpression(), !11)
  %minNeg = alloca i32, align 4
    #dbg_declare(ptr %minNeg, !12, !DIExpression(), !13)
  %e = alloca i32, align 4
    #dbg_declare(ptr %e, !14, !DIExpression(), !15)
  %d = alloca i32, align 4
    #dbg_declare(ptr %d, !16, !DIExpression(), !17)
  %maxVal = alloca i32, align 4
    #dbg_declare(ptr %maxVal, !18, !DIExpression(), !19)
  %minVal = alloca i32, align 4
    #dbg_declare(ptr %minVal, !20, !DIExpression(), !21)
  %c = alloca i32, align 4
    #dbg_declare(ptr %c, !22, !DIExpression(), !23)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !24, !DIExpression(), !25)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !26, !DIExpression(), !27)
  store i32 0, ptr %err, align 4, !dbg !27
  store i32 3, ptr %a, align 4, !dbg !25
  store i32 7, ptr %c, align 4, !dbg !23
  %0 = load i32, ptr %a, align 4, !dbg !21
  %1 = load i32, ptr %c, align 4, !dbg !21
  %2 = icmp slt i32 %0, %1, !dbg !21
  %3 = load i32, ptr %a, align 4, !dbg !21
  %4 = load i32, ptr %c, align 4, !dbg !21
  %5 = select i1 %2, i32 %3, i32 %4, !dbg !21
  store i32 %5, ptr %minVal, align 4, !dbg !21
  %6 = load i32, ptr %a, align 4, !dbg !19
  %7 = load i32, ptr %c, align 4, !dbg !19
  %8 = icmp slt i32 %6, %7, !dbg !19
  %9 = load i32, ptr %c, align 4, !dbg !19
  %10 = load i32, ptr %a, align 4, !dbg !19
  %11 = select i1 %8, i32 %9, i32 %10, !dbg !19
  store i32 %11, ptr %maxVal, align 4, !dbg !19
  %12 = load i32, ptr %minVal, align 4, !dbg !28
  %13 = icmp ne i32 %12, 3, !dbg !28
  br i1 %13, label %then, label %else, !dbg !28

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !29
  %14 = load i32, ptr %err, align 4, !dbg !29
  br label %if.end, !dbg !29

else:                                             ; preds = %entry
  br label %if.end, !dbg !29

if.end:                                           ; preds = %else, %then
  %15 = load i32, ptr %maxVal, align 4, !dbg !30
  %16 = icmp ne i32 %15, 7, !dbg !30
  br i1 %16, label %then1, label %else2, !dbg !30

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !31
  %17 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end3, !dbg !31

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !31

if.end3:                                          ; preds = %else2, %then1
  store i32 -5, ptr %d, align 4, !dbg !17
  store i32 2, ptr %e, align 4, !dbg !15
  %18 = load i32, ptr %d, align 4, !dbg !13
  %19 = load i32, ptr %e, align 4, !dbg !13
  %20 = icmp slt i32 %18, %19, !dbg !13
  %21 = load i32, ptr %d, align 4, !dbg !13
  %22 = load i32, ptr %e, align 4, !dbg !13
  %23 = select i1 %20, i32 %21, i32 %22, !dbg !13
  store i32 %23, ptr %minNeg, align 4, !dbg !13
  %24 = load i32, ptr %d, align 4, !dbg !11
  %25 = load i32, ptr %e, align 4, !dbg !11
  %26 = icmp slt i32 %24, %25, !dbg !11
  %27 = load i32, ptr %e, align 4, !dbg !11
  %28 = load i32, ptr %d, align 4, !dbg !11
  %29 = select i1 %26, i32 %27, i32 %28, !dbg !11
  store i32 %29, ptr %maxNeg, align 4, !dbg !11
  %30 = load i32, ptr %minNeg, align 4, !dbg !32
  %31 = icmp ne i32 %30, -5, !dbg !32
  br i1 %31, label %then4, label %else5, !dbg !32

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !33
  %32 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end6, !dbg !33

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !33

if.end6:                                          ; preds = %else5, %then4
  %33 = load i32, ptr %maxNeg, align 4, !dbg !34
  %34 = icmp ne i32 %33, 2, !dbg !34
  br i1 %34, label %then7, label %else8, !dbg !34

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !35
  %35 = load i32, ptr %err, align 4, !dbg !35
  br label %if.end9, !dbg !35

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !35

if.end9:                                          ; preds = %else8, %then7
  store i32 42, ptr %same, align 4, !dbg !9
  %36 = load i32, ptr %same, align 4, !dbg !7
  %37 = load i32, ptr %same, align 4, !dbg !7
  %38 = icmp slt i32 %36, %37, !dbg !7
  %39 = select i1 %38, i32 0, i32 1, !dbg !7
  store i32 %39, ptr %ternarySame, align 4, !dbg !7
  %40 = load i32, ptr %ternarySame, align 4, !dbg !36
  %41 = icmp ne i32 %40, 1, !dbg !36
  br i1 %41, label %then10, label %else11, !dbg !36

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !37
  %42 = load i32, ptr %err, align 4, !dbg !37
  br label %if.end12, !dbg !37

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !37

if.end12:                                         ; preds = %else11, %then10
  %43 = load i32, ptr %err, align 4, !dbg !38
  %44 = icmp eq i32 %43, 0, !dbg !38
  br i1 %44, label %then13, label %else14, !dbg !38

then13:                                           ; preds = %if.end12
  %45 = call i32 (ptr, ...) @printf(ptr @0), !dbg !39
  br label %if.end15, !dbg !39

else14:                                           ; preds = %if.end12
  %46 = call i32 (ptr, ...) @printf(ptr @1), !dbg !41
  br label %if.end15, !dbg !41

if.end15:                                         ; preds = %else14, %then13
  %47 = load i32, ptr %err, align 4, !dbg !43
  ret i32 %47, !dbg !43
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "16.ternary.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "ternarySame", scope: !2, file: !1, line: 21, type: !5)
!7 = !DILocation(line: 21, column: 3, scope: !2)
!8 = !DILocalVariable(name: "same", scope: !2, file: !1, line: 20, type: !5)
!9 = !DILocation(line: 20, column: 3, scope: !2)
!10 = !DILocalVariable(name: "maxNeg", scope: !2, file: !1, line: 16, type: !5)
!11 = !DILocation(line: 16, column: 3, scope: !2)
!12 = !DILocalVariable(name: "minNeg", scope: !2, file: !1, line: 15, type: !5)
!13 = !DILocation(line: 15, column: 3, scope: !2)
!14 = !DILocalVariable(name: "e", scope: !2, file: !1, line: 14, type: !5)
!15 = !DILocation(line: 14, column: 3, scope: !2)
!16 = !DILocalVariable(name: "d", scope: !2, file: !1, line: 13, type: !5)
!17 = !DILocation(line: 13, column: 3, scope: !2)
!18 = !DILocalVariable(name: "maxVal", scope: !2, file: !1, line: 9, type: !5)
!19 = !DILocation(line: 9, column: 3, scope: !2)
!20 = !DILocalVariable(name: "minVal", scope: !2, file: !1, line: 8, type: !5)
!21 = !DILocation(line: 8, column: 3, scope: !2)
!22 = !DILocalVariable(name: "c", scope: !2, file: !1, line: 6, type: !5)
!23 = !DILocation(line: 6, column: 3, scope: !2)
!24 = !DILocalVariable(name: "a", scope: !2, file: !1, line: 5, type: !5)
!25 = !DILocation(line: 5, column: 3, scope: !2)
!26 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 4, type: !5)
!27 = !DILocation(line: 4, column: 3, scope: !2)
!28 = !DILocation(line: 10, column: 3, scope: !2)
!29 = !DILocation(line: 10, column: 20, scope: !2)
!30 = !DILocation(line: 11, column: 3, scope: !2)
!31 = !DILocation(line: 11, column: 20, scope: !2)
!32 = !DILocation(line: 17, column: 3, scope: !2)
!33 = !DILocation(line: 17, column: 21, scope: !2)
!34 = !DILocation(line: 18, column: 3, scope: !2)
!35 = !DILocation(line: 18, column: 20, scope: !2)
!36 = !DILocation(line: 22, column: 3, scope: !2)
!37 = !DILocation(line: 22, column: 25, scope: !2)
!38 = !DILocation(line: 24, column: 3, scope: !2)
!39 = !DILocation(line: 25, column: 5, scope: !40)
!40 = distinct !DILexicalBlock(scope: !2, file: !1, line: 24, column: 17)
!41 = !DILocation(line: 27, column: 5, scope: !42)
!42 = distinct !DILexicalBlock(scope: !2, file: !1, line: 26, column: 10)
!43 = !DILocation(line: 29, column: 3, scope: !2)
