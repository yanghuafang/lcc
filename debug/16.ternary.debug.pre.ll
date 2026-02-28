; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [19 x i8] c"16.ternary.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"16.ternary.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %ternarySame = alloca i32, align 4
    #dbg_declare(ptr %ternarySame, !8, !DIExpression(), !9)
  %same = alloca i32, align 4
    #dbg_declare(ptr %same, !10, !DIExpression(), !11)
  %maxNeg = alloca i32, align 4
    #dbg_declare(ptr %maxNeg, !12, !DIExpression(), !13)
  %minNeg = alloca i32, align 4
    #dbg_declare(ptr %minNeg, !14, !DIExpression(), !15)
  %e = alloca i32, align 4
    #dbg_declare(ptr %e, !16, !DIExpression(), !17)
  %d = alloca i32, align 4
    #dbg_declare(ptr %d, !18, !DIExpression(), !19)
  %maxVal = alloca i32, align 4
    #dbg_declare(ptr %maxVal, !20, !DIExpression(), !21)
  %minVal = alloca i32, align 4
    #dbg_declare(ptr %minVal, !22, !DIExpression(), !23)
  %c = alloca i32, align 4
    #dbg_declare(ptr %c, !24, !DIExpression(), !25)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !26, !DIExpression(), !27)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !28, !DIExpression(), !29)
  store i32 0, ptr %err, align 4, !dbg !29
  store i32 3, ptr %a, align 4, !dbg !27
  store i32 7, ptr %c, align 4, !dbg !25
  %0 = load i32, ptr %a, align 4, !dbg !23
  %1 = load i32, ptr %c, align 4, !dbg !23
  %2 = icmp slt i32 %0, %1, !dbg !23
  br i1 %2, label %cond.true, label %cond.false, !dbg !23

cond.true:                                        ; preds = %entry
  %3 = load i32, ptr %a, align 4, !dbg !23
  br label %cond.end, !dbg !23

cond.false:                                       ; preds = %entry
  %4 = load i32, ptr %c, align 4, !dbg !23
  br label %cond.end, !dbg !23

cond.end:                                         ; preds = %cond.false, %cond.true
  %5 = phi i32 [ %3, %cond.true ], [ %4, %cond.false ], !dbg !23
  store i32 %5, ptr %minVal, align 4, !dbg !23
  %6 = load i32, ptr %a, align 4, !dbg !21
  %7 = load i32, ptr %c, align 4, !dbg !21
  %8 = icmp slt i32 %6, %7, !dbg !21
  br i1 %8, label %cond.true1, label %cond.false2, !dbg !21

cond.true1:                                       ; preds = %cond.end
  %9 = load i32, ptr %c, align 4, !dbg !21
  br label %cond.end3, !dbg !21

cond.false2:                                      ; preds = %cond.end
  %10 = load i32, ptr %a, align 4, !dbg !21
  br label %cond.end3, !dbg !21

cond.end3:                                        ; preds = %cond.false2, %cond.true1
  %11 = phi i32 [ %9, %cond.true1 ], [ %10, %cond.false2 ], !dbg !21
  store i32 %11, ptr %maxVal, align 4, !dbg !21
  %12 = load i32, ptr %minVal, align 4, !dbg !30
  %13 = icmp ne i32 %12, 3, !dbg !30
  br i1 %13, label %then, label %else, !dbg !30

then:                                             ; preds = %cond.end3
  store i32 1, ptr %err, align 4, !dbg !31
  %14 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end, !dbg !31

else:                                             ; preds = %cond.end3
  br label %if.end, !dbg !31

if.end:                                           ; preds = %else, %then
  %15 = load i32, ptr %maxVal, align 4, !dbg !32
  %16 = icmp ne i32 %15, 7, !dbg !32
  br i1 %16, label %then4, label %else5, !dbg !32

then4:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !33
  %17 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end6, !dbg !33

else5:                                            ; preds = %if.end
  br label %if.end6, !dbg !33

if.end6:                                          ; preds = %else5, %then4
  store i32 -5, ptr %d, align 4, !dbg !19
  store i32 2, ptr %e, align 4, !dbg !17
  %18 = load i32, ptr %d, align 4, !dbg !15
  %19 = load i32, ptr %e, align 4, !dbg !15
  %20 = icmp slt i32 %18, %19, !dbg !15
  br i1 %20, label %cond.true7, label %cond.false8, !dbg !15

cond.true7:                                       ; preds = %if.end6
  %21 = load i32, ptr %d, align 4, !dbg !15
  br label %cond.end9, !dbg !15

cond.false8:                                      ; preds = %if.end6
  %22 = load i32, ptr %e, align 4, !dbg !15
  br label %cond.end9, !dbg !15

cond.end9:                                        ; preds = %cond.false8, %cond.true7
  %23 = phi i32 [ %21, %cond.true7 ], [ %22, %cond.false8 ], !dbg !15
  store i32 %23, ptr %minNeg, align 4, !dbg !15
  %24 = load i32, ptr %d, align 4, !dbg !13
  %25 = load i32, ptr %e, align 4, !dbg !13
  %26 = icmp slt i32 %24, %25, !dbg !13
  br i1 %26, label %cond.true10, label %cond.false11, !dbg !13

cond.true10:                                      ; preds = %cond.end9
  %27 = load i32, ptr %e, align 4, !dbg !13
  br label %cond.end12, !dbg !13

cond.false11:                                     ; preds = %cond.end9
  %28 = load i32, ptr %d, align 4, !dbg !13
  br label %cond.end12, !dbg !13

cond.end12:                                       ; preds = %cond.false11, %cond.true10
  %29 = phi i32 [ %27, %cond.true10 ], [ %28, %cond.false11 ], !dbg !13
  store i32 %29, ptr %maxNeg, align 4, !dbg !13
  %30 = load i32, ptr %minNeg, align 4, !dbg !34
  %31 = icmp ne i32 %30, -5, !dbg !34
  br i1 %31, label %then13, label %else14, !dbg !34

then13:                                           ; preds = %cond.end12
  store i32 1, ptr %err, align 4, !dbg !35
  %32 = load i32, ptr %err, align 4, !dbg !35
  br label %if.end15, !dbg !35

else14:                                           ; preds = %cond.end12
  br label %if.end15, !dbg !35

if.end15:                                         ; preds = %else14, %then13
  %33 = load i32, ptr %maxNeg, align 4, !dbg !36
  %34 = icmp ne i32 %33, 2, !dbg !36
  br i1 %34, label %then16, label %else17, !dbg !36

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !37
  %35 = load i32, ptr %err, align 4, !dbg !37
  br label %if.end18, !dbg !37

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !37

if.end18:                                         ; preds = %else17, %then16
  store i32 42, ptr %same, align 4, !dbg !11
  %36 = load i32, ptr %same, align 4, !dbg !9
  %37 = load i32, ptr %same, align 4, !dbg !9
  %38 = icmp slt i32 %36, %37, !dbg !9
  br i1 %38, label %cond.true19, label %cond.false20, !dbg !9

cond.true19:                                      ; preds = %if.end18
  br label %cond.end21, !dbg !9

cond.false20:                                     ; preds = %if.end18
  br label %cond.end21, !dbg !9

cond.end21:                                       ; preds = %cond.false20, %cond.true19
  %39 = phi i32 [ 0, %cond.true19 ], [ 1, %cond.false20 ], !dbg !9
  store i32 %39, ptr %ternarySame, align 4, !dbg !9
  %40 = load i32, ptr %ternarySame, align 4, !dbg !38
  %41 = icmp ne i32 %40, 1, !dbg !38
  br i1 %41, label %then22, label %else23, !dbg !38

then22:                                           ; preds = %cond.end21
  store i32 1, ptr %err, align 4, !dbg !39
  %42 = load i32, ptr %err, align 4, !dbg !39
  br label %if.end24, !dbg !39

else23:                                           ; preds = %cond.end21
  br label %if.end24, !dbg !39

if.end24:                                         ; preds = %else23, %then22
  %43 = load i32, ptr %err, align 4, !dbg !40
  %44 = icmp eq i32 %43, 0, !dbg !40
  br i1 %44, label %then25, label %else26, !dbg !40

then25:                                           ; preds = %if.end24
  %45 = call i32 (ptr, ...) @printf(ptr @0), !dbg !41
  br label %if.end27, !dbg !41

else26:                                           ; preds = %if.end24
  %46 = call i32 (ptr, ...) @printf(ptr @1), !dbg !43
  br label %if.end27, !dbg !43

if.end27:                                         ; preds = %else26, %then25
  %47 = load i32, ptr %err, align 4, !dbg !45
  ret i32 %47, !dbg !45
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "16.ternary.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "ternarySame", scope: !4, file: !3, line: 24, type: !7)
!9 = !DILocation(line: 24, column: 3, scope: !4)
!10 = !DILocalVariable(name: "same", scope: !4, file: !3, line: 23, type: !7)
!11 = !DILocation(line: 23, column: 3, scope: !4)
!12 = !DILocalVariable(name: "maxNeg", scope: !4, file: !3, line: 19, type: !7)
!13 = !DILocation(line: 19, column: 3, scope: !4)
!14 = !DILocalVariable(name: "minNeg", scope: !4, file: !3, line: 18, type: !7)
!15 = !DILocation(line: 18, column: 3, scope: !4)
!16 = !DILocalVariable(name: "e", scope: !4, file: !3, line: 17, type: !7)
!17 = !DILocation(line: 17, column: 3, scope: !4)
!18 = !DILocalVariable(name: "d", scope: !4, file: !3, line: 16, type: !7)
!19 = !DILocation(line: 16, column: 3, scope: !4)
!20 = !DILocalVariable(name: "maxVal", scope: !4, file: !3, line: 12, type: !7)
!21 = !DILocation(line: 12, column: 3, scope: !4)
!22 = !DILocalVariable(name: "minVal", scope: !4, file: !3, line: 11, type: !7)
!23 = !DILocation(line: 11, column: 3, scope: !4)
!24 = !DILocalVariable(name: "c", scope: !4, file: !3, line: 9, type: !7)
!25 = !DILocation(line: 9, column: 3, scope: !4)
!26 = !DILocalVariable(name: "a", scope: !4, file: !3, line: 8, type: !7)
!27 = !DILocation(line: 8, column: 3, scope: !4)
!28 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 7, type: !7)
!29 = !DILocation(line: 7, column: 3, scope: !4)
!30 = !DILocation(line: 13, column: 3, scope: !4)
!31 = !DILocation(line: 13, column: 20, scope: !4)
!32 = !DILocation(line: 14, column: 3, scope: !4)
!33 = !DILocation(line: 14, column: 20, scope: !4)
!34 = !DILocation(line: 20, column: 3, scope: !4)
!35 = !DILocation(line: 20, column: 21, scope: !4)
!36 = !DILocation(line: 21, column: 3, scope: !4)
!37 = !DILocation(line: 21, column: 20, scope: !4)
!38 = !DILocation(line: 25, column: 3, scope: !4)
!39 = !DILocation(line: 25, column: 25, scope: !4)
!40 = !DILocation(line: 27, column: 3, scope: !4)
!41 = !DILocation(line: 28, column: 5, scope: !42)
!42 = distinct !DILexicalBlock(scope: !4, file: !3, line: 27, column: 17)
!43 = !DILocation(line: 30, column: 5, scope: !44)
!44 = distinct !DILexicalBlock(scope: !4, file: !3, line: 29, column: 10)
!45 = !DILocation(line: 32, column: 3, scope: !4)
