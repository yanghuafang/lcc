; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [20 x i8] c"21.continue.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"21.continue.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @countEvenNumber(i32 %0) !dbg !4 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !9, !DIExpression(), !10)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !11, !DIExpression(), !12)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !13, !DIExpression(), !14)
  store i32 %0, ptr %n, align 4, !dbg !14
  store i32 0, ptr %count, align 4, !dbg !12
  store i32 1, ptr %i, align 4, !dbg !10
  br label %for.cond, !dbg !10

for.cond:                                         ; preds = %for.update, %entry
  %1 = load i32, ptr %i, align 4, !dbg !10
  %2 = load i32, ptr %n, align 4, !dbg !10
  %3 = icmp sle i32 %1, %2, !dbg !10
  br i1 %3, label %for.loop, label %for.end, !dbg !10

for.loop:                                         ; preds = %for.cond
  %4 = load i32, ptr %i, align 4, !dbg !15
  %5 = srem i32 %4, 2, !dbg !15
  %6 = icmp ne i32 %5, 0, !dbg !15
  br i1 %6, label %then, label %else, !dbg !15

then:                                             ; preds = %for.loop
  br label %for.update, !dbg !17

else:                                             ; preds = %for.loop
  br label %if.end, !dbg !17

if.end:                                           ; preds = %else
  %7 = load i32, ptr %count, align 4, !dbg !19
  %8 = add i32 %7, 1, !dbg !19
  store i32 %8, ptr %count, align 4, !dbg !19
  %9 = load i32, ptr %count, align 4, !dbg !19
  br label %for.update, !dbg !19

for.update:                                       ; preds = %if.end, %then
  %10 = load i32, ptr %i, align 4, !dbg !19
  %11 = add i32 %10, 1, !dbg !19
  store i32 %11, ptr %i, align 4, !dbg !19
  %12 = load i32, ptr %i, align 4, !dbg !19
  br label %for.cond, !dbg !19

for.end:                                          ; preds = %for.cond
  %13 = load i32, ptr %count, align 4, !dbg !20
  ret i32 %13, !dbg !20
}

define i32 @countEvenNumber2(i32 %0) !dbg !21 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !22, !DIExpression(), !23)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !24, !DIExpression(), !25)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !26, !DIExpression(), !27)
  store i32 %0, ptr %n, align 4, !dbg !27
  store i32 0, ptr %count, align 4, !dbg !25
  store i32 1, ptr %i, align 4, !dbg !23
  br label %while.cond, !dbg !28

while.cond:                                       ; preds = %if.end, %then, %entry
  %1 = load i32, ptr %i, align 4, !dbg !28
  %2 = load i32, ptr %n, align 4, !dbg !28
  %3 = icmp sle i32 %1, %2, !dbg !28
  br i1 %3, label %while.loop, label %while.end, !dbg !28

while.loop:                                       ; preds = %while.cond
  %4 = load i32, ptr %i, align 4, !dbg !29
  %5 = srem i32 %4, 2, !dbg !29
  %6 = icmp ne i32 %5, 0, !dbg !29
  br i1 %6, label %then, label %else, !dbg !29

then:                                             ; preds = %while.loop
  %7 = load i32, ptr %i, align 4, !dbg !31
  %8 = add i32 %7, 1, !dbg !31
  store i32 %8, ptr %i, align 4, !dbg !31
  %9 = load i32, ptr %i, align 4, !dbg !31
  br label %while.cond, !dbg !33

else:                                             ; preds = %while.loop
  br label %if.end, !dbg !33

if.end:                                           ; preds = %else
  %10 = load i32, ptr %count, align 4, !dbg !34
  %11 = add i32 %10, 1, !dbg !34
  store i32 %11, ptr %count, align 4, !dbg !34
  %12 = load i32, ptr %count, align 4, !dbg !34
  %13 = load i32, ptr %i, align 4, !dbg !35
  %14 = add i32 %13, 1, !dbg !35
  store i32 %14, ptr %i, align 4, !dbg !35
  %15 = load i32, ptr %i, align 4, !dbg !35
  br label %while.cond, !dbg !35

while.end:                                        ; preds = %while.cond
  %16 = load i32, ptr %count, align 4, !dbg !36
  ret i32 %16, !dbg !36
}

define i32 @countEvenNumber3(i32 %0) !dbg !37 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !38, !DIExpression(), !39)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !40, !DIExpression(), !41)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !42, !DIExpression(), !43)
  store i32 %0, ptr %n, align 4, !dbg !43
  store i32 0, ptr %count, align 4, !dbg !41
  store i32 1, ptr %i, align 4, !dbg !39
  br label %do.loop, !dbg !44

do.loop:                                          ; preds = %do.cond, %entry
  %1 = load i32, ptr %i, align 4, !dbg !45
  %2 = srem i32 %1, 2, !dbg !45
  %3 = icmp ne i32 %2, 0, !dbg !45
  br i1 %3, label %then, label %else, !dbg !45

then:                                             ; preds = %do.loop
  %4 = load i32, ptr %i, align 4, !dbg !47
  %5 = add i32 %4, 1, !dbg !47
  store i32 %5, ptr %i, align 4, !dbg !47
  %6 = load i32, ptr %i, align 4, !dbg !47
  br label %do.cond, !dbg !49

else:                                             ; preds = %do.loop
  br label %if.end, !dbg !49

if.end:                                           ; preds = %else
  %7 = load i32, ptr %count, align 4, !dbg !50
  %8 = add i32 %7, 1, !dbg !50
  store i32 %8, ptr %count, align 4, !dbg !50
  %9 = load i32, ptr %count, align 4, !dbg !50
  %10 = load i32, ptr %i, align 4, !dbg !51
  %11 = add i32 %10, 1, !dbg !51
  store i32 %11, ptr %i, align 4, !dbg !51
  %12 = load i32, ptr %i, align 4, !dbg !51
  br label %do.cond, !dbg !51

do.cond:                                          ; preds = %if.end, %then
  %13 = load i32, ptr %i, align 4, !dbg !51
  %14 = load i32, ptr %n, align 4, !dbg !51
  %15 = icmp sle i32 %13, %14, !dbg !51
  br i1 %15, label %do.loop, label %do.end, !dbg !51

do.end:                                           ; preds = %do.cond
  %16 = load i32, ptr %count, align 4, !dbg !52
  ret i32 %16, !dbg !52
}

define i32 @main() !dbg !53 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !56, !DIExpression(), !57)
  store i32 0, ptr %err, align 4, !dbg !57
  %0 = call i32 @countEvenNumber(i32 32), !dbg !58
  %1 = icmp ne i32 %0, 16, !dbg !58
  br i1 %1, label %then, label %else, !dbg !58

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !59
  %2 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end, !dbg !59

else:                                             ; preds = %entry
  br label %if.end, !dbg !59

if.end:                                           ; preds = %else, %then
  %3 = call i32 @countEvenNumber2(i32 32), !dbg !60
  %4 = icmp ne i32 %3, 16, !dbg !60
  br i1 %4, label %then1, label %else2, !dbg !60

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !61
  %5 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end3, !dbg !61

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !61

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @countEvenNumber3(i32 32), !dbg !62
  %7 = icmp ne i32 %6, 16, !dbg !62
  br i1 %7, label %then4, label %else5, !dbg !62

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !63
  %8 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end6, !dbg !63

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !63

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @countEvenNumber(i32 0), !dbg !64
  %10 = icmp ne i32 %9, 0, !dbg !64
  br i1 %10, label %then7, label %else8, !dbg !64

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !65
  %11 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end9, !dbg !65

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !65

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @countEvenNumber(i32 1), !dbg !66
  %13 = icmp ne i32 %12, 0, !dbg !66
  br i1 %13, label %then10, label %else11, !dbg !66

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !67
  %14 = load i32, ptr %err, align 4, !dbg !67
  br label %if.end12, !dbg !67

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !67

if.end12:                                         ; preds = %else11, %then10
  %15 = load i32, ptr %err, align 4, !dbg !68
  %16 = icmp eq i32 %15, 0, !dbg !68
  br i1 %16, label %then13, label %else14, !dbg !68

then13:                                           ; preds = %if.end12
  %17 = call i32 (ptr, ...) @printf(ptr @0), !dbg !69
  br label %if.end15, !dbg !69

else14:                                           ; preds = %if.end12
  %18 = call i32 (ptr, ...) @printf(ptr @1), !dbg !71
  br label %if.end15, !dbg !71

if.end15:                                         ; preds = %else14, %then13
  %19 = load i32, ptr %err, align 4, !dbg !73
  ret i32 %19, !dbg !73
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "21.continue.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "countEvenNumber", linkageName: "countEvenNumber", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 5, type: !7)
!10 = !DILocation(line: 5, column: 8, scope: !4)
!11 = !DILocalVariable(name: "count", scope: !4, file: !1, line: 4, type: !7)
!12 = !DILocation(line: 4, column: 3, scope: !4)
!13 = !DILocalVariable(name: "n", arg: 1, scope: !4, file: !1, line: 3, type: !7)
!14 = !DILocation(line: 3, column: 5, scope: !4)
!15 = !DILocation(line: 6, column: 5, scope: !16)
!16 = distinct !DILexicalBlock(scope: !4, file: !1, line: 5, column: 35)
!17 = !DILocation(line: 7, column: 7, scope: !18)
!18 = distinct !DILexicalBlock(scope: !16, file: !1, line: 6, column: 21)
!19 = !DILocation(line: 9, column: 5, scope: !16)
!20 = !DILocation(line: 11, column: 3, scope: !4)
!21 = distinct !DISubprogram(name: "countEvenNumber2", linkageName: "countEvenNumber2", scope: null, file: !1, line: 14, type: !5, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!22 = !DILocalVariable(name: "i", scope: !21, file: !1, line: 16, type: !7)
!23 = !DILocation(line: 16, column: 3, scope: !21)
!24 = !DILocalVariable(name: "count", scope: !21, file: !1, line: 15, type: !7)
!25 = !DILocation(line: 15, column: 3, scope: !21)
!26 = !DILocalVariable(name: "n", arg: 1, scope: !21, file: !1, line: 14, type: !7)
!27 = !DILocation(line: 14, column: 5, scope: !21)
!28 = !DILocation(line: 17, column: 3, scope: !21)
!29 = !DILocation(line: 18, column: 5, scope: !30)
!30 = distinct !DILexicalBlock(scope: !21, file: !1, line: 17, column: 18)
!31 = !DILocation(line: 19, column: 7, scope: !32)
!32 = distinct !DILexicalBlock(scope: !30, file: !1, line: 18, column: 21)
!33 = !DILocation(line: 20, column: 7, scope: !32)
!34 = !DILocation(line: 22, column: 5, scope: !30)
!35 = !DILocation(line: 23, column: 5, scope: !30)
!36 = !DILocation(line: 25, column: 3, scope: !21)
!37 = distinct !DISubprogram(name: "countEvenNumber3", linkageName: "countEvenNumber3", scope: null, file: !1, line: 28, type: !5, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!38 = !DILocalVariable(name: "i", scope: !37, file: !1, line: 30, type: !7)
!39 = !DILocation(line: 30, column: 3, scope: !37)
!40 = !DILocalVariable(name: "count", scope: !37, file: !1, line: 29, type: !7)
!41 = !DILocation(line: 29, column: 3, scope: !37)
!42 = !DILocalVariable(name: "n", arg: 1, scope: !37, file: !1, line: 28, type: !7)
!43 = !DILocation(line: 28, column: 5, scope: !37)
!44 = !DILocation(line: 31, column: 3, scope: !37)
!45 = !DILocation(line: 32, column: 5, scope: !46)
!46 = distinct !DILexicalBlock(scope: !37, file: !1, line: 31, column: 6)
!47 = !DILocation(line: 33, column: 7, scope: !48)
!48 = distinct !DILexicalBlock(scope: !46, file: !1, line: 32, column: 21)
!49 = !DILocation(line: 34, column: 7, scope: !48)
!50 = !DILocation(line: 36, column: 5, scope: !46)
!51 = !DILocation(line: 37, column: 5, scope: !46)
!52 = !DILocation(line: 39, column: 3, scope: !37)
!53 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 42, type: !54, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!54 = !DISubroutineType(types: !55)
!55 = !{!7}
!56 = !DILocalVariable(name: "err", scope: !53, file: !1, line: 43, type: !7)
!57 = !DILocation(line: 43, column: 3, scope: !53)
!58 = !DILocation(line: 45, column: 3, scope: !53)
!59 = !DILocation(line: 45, column: 34, scope: !53)
!60 = !DILocation(line: 46, column: 3, scope: !53)
!61 = !DILocation(line: 46, column: 35, scope: !53)
!62 = !DILocation(line: 47, column: 3, scope: !53)
!63 = !DILocation(line: 47, column: 35, scope: !53)
!64 = !DILocation(line: 48, column: 3, scope: !53)
!65 = !DILocation(line: 48, column: 32, scope: !53)
!66 = !DILocation(line: 49, column: 3, scope: !53)
!67 = !DILocation(line: 49, column: 32, scope: !53)
!68 = !DILocation(line: 51, column: 3, scope: !53)
!69 = !DILocation(line: 52, column: 5, scope: !70)
!70 = distinct !DILexicalBlock(scope: !53, file: !1, line: 51, column: 17)
!71 = !DILocation(line: 54, column: 5, scope: !72)
!72 = distinct !DILexicalBlock(scope: !53, file: !1, line: 53, column: 10)
!73 = !DILocation(line: 56, column: 3, scope: !53)
