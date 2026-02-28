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
    #dbg_declare(ptr %ternarySame, !9, !DIExpression(), !10)
  %same = alloca i32, align 4
    #dbg_declare(ptr %same, !11, !DIExpression(), !12)
  %maxNeg = alloca i32, align 4
    #dbg_declare(ptr %maxNeg, !13, !DIExpression(), !14)
  %minNeg = alloca i32, align 4
    #dbg_declare(ptr %minNeg, !15, !DIExpression(), !16)
  %e = alloca i32, align 4
    #dbg_declare(ptr %e, !17, !DIExpression(), !18)
  %d = alloca i32, align 4
    #dbg_declare(ptr %d, !19, !DIExpression(), !20)
  %maxVal = alloca i32, align 4
    #dbg_declare(ptr %maxVal, !21, !DIExpression(), !22)
  %minVal = alloca i32, align 4
    #dbg_declare(ptr %minVal, !23, !DIExpression(), !24)
  %c = alloca i32, align 4
    #dbg_declare(ptr %c, !25, !DIExpression(), !26)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !27, !DIExpression(), !28)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !29, !DIExpression(), !30)
  store i32 0, ptr %err, align 4, !dbg !30
  store i32 3, ptr %a, align 4, !dbg !28
  store i32 7, ptr %c, align 4, !dbg !26
  %0 = load i32, ptr %a, align 4, !dbg !24
  %1 = load i32, ptr %c, align 4, !dbg !24
  %2 = icmp slt i32 %0, %1, !dbg !24
  br i1 %2, label %cond.true, label %cond.false, !dbg !24

cond.true:                                        ; preds = %entry
  %3 = load i32, ptr %a, align 4, !dbg !24
  br label %cond.end, !dbg !24

cond.false:                                       ; preds = %entry
  %4 = load i32, ptr %c, align 4, !dbg !24
  br label %cond.end, !dbg !24

cond.end:                                         ; preds = %cond.false, %cond.true
  %5 = phi i32 [ %3, %cond.true ], [ %4, %cond.false ], !dbg !24
  store i32 %5, ptr %minVal, align 4, !dbg !24
  %6 = load i32, ptr %a, align 4, !dbg !22
  %7 = load i32, ptr %c, align 4, !dbg !22
  %8 = icmp slt i32 %6, %7, !dbg !22
  br i1 %8, label %cond.true1, label %cond.false2, !dbg !22

cond.true1:                                       ; preds = %cond.end
  %9 = load i32, ptr %c, align 4, !dbg !22
  br label %cond.end3, !dbg !22

cond.false2:                                      ; preds = %cond.end
  %10 = load i32, ptr %a, align 4, !dbg !22
  br label %cond.end3, !dbg !22

cond.end3:                                        ; preds = %cond.false2, %cond.true1
  %11 = phi i32 [ %9, %cond.true1 ], [ %10, %cond.false2 ], !dbg !22
  store i32 %11, ptr %maxVal, align 4, !dbg !22
  %12 = load i32, ptr %minVal, align 4, !dbg !31
  %13 = icmp ne i32 %12, 3, !dbg !31
  br i1 %13, label %then, label %else, !dbg !31

then:                                             ; preds = %cond.end3
  store i32 1, ptr %err, align 4, !dbg !32
  %14 = load i32, ptr %err, align 4, !dbg !32
  br label %if.end, !dbg !32

else:                                             ; preds = %cond.end3
  br label %if.end, !dbg !32

if.end:                                           ; preds = %else, %then
  %15 = load i32, ptr %maxVal, align 4, !dbg !33
  %16 = icmp ne i32 %15, 7, !dbg !33
  br i1 %16, label %then4, label %else5, !dbg !33

then4:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !34
  %17 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end6, !dbg !34

else5:                                            ; preds = %if.end
  br label %if.end6, !dbg !34

if.end6:                                          ; preds = %else5, %then4
  store i32 -5, ptr %d, align 4, !dbg !20
  store i32 2, ptr %e, align 4, !dbg !18
  %18 = load i32, ptr %d, align 4, !dbg !16
  %19 = load i32, ptr %e, align 4, !dbg !16
  %20 = icmp slt i32 %18, %19, !dbg !16
  br i1 %20, label %cond.true7, label %cond.false8, !dbg !16

cond.true7:                                       ; preds = %if.end6
  %21 = load i32, ptr %d, align 4, !dbg !16
  br label %cond.end9, !dbg !16

cond.false8:                                      ; preds = %if.end6
  %22 = load i32, ptr %e, align 4, !dbg !16
  br label %cond.end9, !dbg !16

cond.end9:                                        ; preds = %cond.false8, %cond.true7
  %23 = phi i32 [ %21, %cond.true7 ], [ %22, %cond.false8 ], !dbg !16
  store i32 %23, ptr %minNeg, align 4, !dbg !16
  %24 = load i32, ptr %d, align 4, !dbg !14
  %25 = load i32, ptr %e, align 4, !dbg !14
  %26 = icmp slt i32 %24, %25, !dbg !14
  br i1 %26, label %cond.true10, label %cond.false11, !dbg !14

cond.true10:                                      ; preds = %cond.end9
  %27 = load i32, ptr %e, align 4, !dbg !14
  br label %cond.end12, !dbg !14

cond.false11:                                     ; preds = %cond.end9
  %28 = load i32, ptr %d, align 4, !dbg !14
  br label %cond.end12, !dbg !14

cond.end12:                                       ; preds = %cond.false11, %cond.true10
  %29 = phi i32 [ %27, %cond.true10 ], [ %28, %cond.false11 ], !dbg !14
  store i32 %29, ptr %maxNeg, align 4, !dbg !14
  %30 = load i32, ptr %minNeg, align 4, !dbg !35
  %31 = icmp ne i32 %30, -5, !dbg !35
  br i1 %31, label %then13, label %else14, !dbg !35

then13:                                           ; preds = %cond.end12
  store i32 1, ptr %err, align 4, !dbg !36
  %32 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end15, !dbg !36

else14:                                           ; preds = %cond.end12
  br label %if.end15, !dbg !36

if.end15:                                         ; preds = %else14, %then13
  %33 = load i32, ptr %maxNeg, align 4, !dbg !37
  %34 = icmp ne i32 %33, 2, !dbg !37
  br i1 %34, label %then16, label %else17, !dbg !37

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !38
  %35 = load i32, ptr %err, align 4, !dbg !38
  br label %if.end18, !dbg !38

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !38

if.end18:                                         ; preds = %else17, %then16
  store i32 42, ptr %same, align 4, !dbg !12
  %36 = load i32, ptr %same, align 4, !dbg !10
  %37 = load i32, ptr %same, align 4, !dbg !10
  %38 = icmp slt i32 %36, %37, !dbg !10
  br i1 %38, label %cond.true19, label %cond.false20, !dbg !10

cond.true19:                                      ; preds = %if.end18
  br label %cond.end21, !dbg !10

cond.false20:                                     ; preds = %if.end18
  br label %cond.end21, !dbg !10

cond.end21:                                       ; preds = %cond.false20, %cond.true19
  %39 = phi i32 [ 0, %cond.true19 ], [ 1, %cond.false20 ], !dbg !10
  store i32 %39, ptr %ternarySame, align 4, !dbg !10
  %40 = load i32, ptr %ternarySame, align 4, !dbg !39
  %41 = icmp ne i32 %40, 1, !dbg !39
  br i1 %41, label %then22, label %else23, !dbg !39

then22:                                           ; preds = %cond.end21
  store i32 1, ptr %err, align 4, !dbg !40
  %42 = load i32, ptr %err, align 4, !dbg !40
  br label %if.end24, !dbg !40

else23:                                           ; preds = %cond.end21
  br label %if.end24, !dbg !40

if.end24:                                         ; preds = %else23, %then22
  %43 = load i32, ptr %err, align 4, !dbg !41
  %44 = icmp eq i32 %43, 0, !dbg !41
  br i1 %44, label %then25, label %else26, !dbg !41

then25:                                           ; preds = %if.end24
  %45 = call i32 (ptr, ...) @printf(ptr @0), !dbg !42
  br label %if.end27, !dbg !42

else26:                                           ; preds = %if.end24
  %46 = call i32 (ptr, ...) @printf(ptr @1), !dbg !44
  br label %if.end27, !dbg !44

if.end27:                                         ; preds = %else26, %then25
  %47 = load i32, ptr %err, align 4, !dbg !46
  ret i32 %47, !dbg !46
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "16.ternary.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "ternarySame", scope: !4, file: !3, line: 24, type: !7)
!10 = !DILocation(line: 24, column: 3, scope: !4)
!11 = !DILocalVariable(name: "same", scope: !4, file: !3, line: 23, type: !7)
!12 = !DILocation(line: 23, column: 3, scope: !4)
!13 = !DILocalVariable(name: "maxNeg", scope: !4, file: !3, line: 19, type: !7)
!14 = !DILocation(line: 19, column: 3, scope: !4)
!15 = !DILocalVariable(name: "minNeg", scope: !4, file: !3, line: 18, type: !7)
!16 = !DILocation(line: 18, column: 3, scope: !4)
!17 = !DILocalVariable(name: "e", scope: !4, file: !3, line: 17, type: !7)
!18 = !DILocation(line: 17, column: 3, scope: !4)
!19 = !DILocalVariable(name: "d", scope: !4, file: !3, line: 16, type: !7)
!20 = !DILocation(line: 16, column: 3, scope: !4)
!21 = !DILocalVariable(name: "maxVal", scope: !4, file: !3, line: 12, type: !7)
!22 = !DILocation(line: 12, column: 3, scope: !4)
!23 = !DILocalVariable(name: "minVal", scope: !4, file: !3, line: 11, type: !7)
!24 = !DILocation(line: 11, column: 3, scope: !4)
!25 = !DILocalVariable(name: "c", scope: !4, file: !3, line: 9, type: !7)
!26 = !DILocation(line: 9, column: 3, scope: !4)
!27 = !DILocalVariable(name: "a", scope: !4, file: !3, line: 8, type: !7)
!28 = !DILocation(line: 8, column: 3, scope: !4)
!29 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 7, type: !7)
!30 = !DILocation(line: 7, column: 3, scope: !4)
!31 = !DILocation(line: 13, column: 3, scope: !4)
!32 = !DILocation(line: 13, column: 20, scope: !4)
!33 = !DILocation(line: 14, column: 3, scope: !4)
!34 = !DILocation(line: 14, column: 20, scope: !4)
!35 = !DILocation(line: 20, column: 3, scope: !4)
!36 = !DILocation(line: 20, column: 21, scope: !4)
!37 = !DILocation(line: 21, column: 3, scope: !4)
!38 = !DILocation(line: 21, column: 20, scope: !4)
!39 = !DILocation(line: 25, column: 3, scope: !4)
!40 = !DILocation(line: 25, column: 25, scope: !4)
!41 = !DILocation(line: 27, column: 3, scope: !4)
!42 = !DILocation(line: 28, column: 5, scope: !43)
!43 = distinct !DILexicalBlock(scope: !4, file: !3, line: 27, column: 17)
!44 = !DILocation(line: 30, column: 5, scope: !45)
!45 = distinct !DILexicalBlock(scope: !4, file: !3, line: 29, column: 10)
!46 = !DILocation(line: 32, column: 3, scope: !4)
