; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [20 x i8] c"21.continue.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"21.continue.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @countEvenNumber(i32 %0) !dbg !4 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !8, !DIExpression(), !9)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !10, !DIExpression(), !11)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !12, !DIExpression(), !13)
  store i32 %0, ptr %n, align 4, !dbg !13
  store i32 0, ptr %count, align 4, !dbg !11
  store i32 1, ptr %i, align 4, !dbg !9
  br label %for.cond, !dbg !9

for.cond:                                         ; preds = %for.update, %entry
  %1 = load i32, ptr %i, align 4, !dbg !9
  %2 = load i32, ptr %n, align 4, !dbg !9
  %3 = icmp sle i32 %1, %2, !dbg !9
  br i1 %3, label %for.loop, label %for.end, !dbg !9

for.loop:                                         ; preds = %for.cond
  %4 = load i32, ptr %i, align 4, !dbg !14
  %5 = srem i32 %4, 2, !dbg !14
  %6 = icmp ne i32 %5, 0, !dbg !14
  br i1 %6, label %then, label %else, !dbg !14

then:                                             ; preds = %for.loop
  br label %for.update, !dbg !16

else:                                             ; preds = %for.loop
  br label %if.end, !dbg !16

if.end:                                           ; preds = %else
  %7 = load i32, ptr %count, align 4, !dbg !18
  %8 = add i32 %7, 1, !dbg !18
  store i32 %8, ptr %count, align 4, !dbg !18
  %9 = load i32, ptr %count, align 4, !dbg !18
  br label %for.update, !dbg !18

for.update:                                       ; preds = %if.end, %then
  %10 = load i32, ptr %i, align 4, !dbg !18
  %11 = add i32 %10, 1, !dbg !18
  store i32 %11, ptr %i, align 4, !dbg !18
  %12 = load i32, ptr %i, align 4, !dbg !18
  br label %for.cond, !dbg !18

for.end:                                          ; preds = %for.cond
  %13 = load i32, ptr %count, align 4, !dbg !19
  ret i32 %13, !dbg !19
}

define i32 @countEvenNumber2(i32 %0) !dbg !20 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !21, !DIExpression(), !22)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !23, !DIExpression(), !24)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !25, !DIExpression(), !26)
  store i32 %0, ptr %n, align 4, !dbg !26
  store i32 0, ptr %count, align 4, !dbg !24
  store i32 1, ptr %i, align 4, !dbg !22
  br label %while.cond, !dbg !27

while.cond:                                       ; preds = %if.end, %then, %entry
  %1 = load i32, ptr %i, align 4, !dbg !27
  %2 = load i32, ptr %n, align 4, !dbg !27
  %3 = icmp sle i32 %1, %2, !dbg !27
  br i1 %3, label %while.loop, label %while.end, !dbg !27

while.loop:                                       ; preds = %while.cond
  %4 = load i32, ptr %i, align 4, !dbg !28
  %5 = srem i32 %4, 2, !dbg !28
  %6 = icmp ne i32 %5, 0, !dbg !28
  br i1 %6, label %then, label %else, !dbg !28

then:                                             ; preds = %while.loop
  %7 = load i32, ptr %i, align 4, !dbg !30
  %8 = add i32 %7, 1, !dbg !30
  store i32 %8, ptr %i, align 4, !dbg !30
  %9 = load i32, ptr %i, align 4, !dbg !30
  br label %while.cond, !dbg !32

else:                                             ; preds = %while.loop
  br label %if.end, !dbg !32

if.end:                                           ; preds = %else
  %10 = load i32, ptr %count, align 4, !dbg !33
  %11 = add i32 %10, 1, !dbg !33
  store i32 %11, ptr %count, align 4, !dbg !33
  %12 = load i32, ptr %count, align 4, !dbg !33
  %13 = load i32, ptr %i, align 4, !dbg !34
  %14 = add i32 %13, 1, !dbg !34
  store i32 %14, ptr %i, align 4, !dbg !34
  %15 = load i32, ptr %i, align 4, !dbg !34
  br label %while.cond, !dbg !34

while.end:                                        ; preds = %while.cond
  %16 = load i32, ptr %count, align 4, !dbg !35
  ret i32 %16, !dbg !35
}

define i32 @countEvenNumber3(i32 %0) !dbg !36 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !37, !DIExpression(), !38)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !39, !DIExpression(), !40)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !41, !DIExpression(), !42)
  store i32 %0, ptr %n, align 4, !dbg !42
  store i32 0, ptr %count, align 4, !dbg !40
  store i32 1, ptr %i, align 4, !dbg !38
  br label %do.loop, !dbg !43

do.loop:                                          ; preds = %do.cond, %entry
  %1 = load i32, ptr %i, align 4, !dbg !44
  %2 = srem i32 %1, 2, !dbg !44
  %3 = icmp ne i32 %2, 0, !dbg !44
  br i1 %3, label %then, label %else, !dbg !44

then:                                             ; preds = %do.loop
  %4 = load i32, ptr %i, align 4, !dbg !46
  %5 = add i32 %4, 1, !dbg !46
  store i32 %5, ptr %i, align 4, !dbg !46
  %6 = load i32, ptr %i, align 4, !dbg !46
  br label %do.cond, !dbg !48

else:                                             ; preds = %do.loop
  br label %if.end, !dbg !48

if.end:                                           ; preds = %else
  %7 = load i32, ptr %count, align 4, !dbg !49
  %8 = add i32 %7, 1, !dbg !49
  store i32 %8, ptr %count, align 4, !dbg !49
  %9 = load i32, ptr %count, align 4, !dbg !49
  %10 = load i32, ptr %i, align 4, !dbg !50
  %11 = add i32 %10, 1, !dbg !50
  store i32 %11, ptr %i, align 4, !dbg !50
  %12 = load i32, ptr %i, align 4, !dbg !50
  br label %do.cond, !dbg !50

do.cond:                                          ; preds = %if.end, %then
  %13 = load i32, ptr %i, align 4, !dbg !50
  %14 = load i32, ptr %n, align 4, !dbg !50
  %15 = icmp sle i32 %13, %14, !dbg !50
  br i1 %15, label %do.loop, label %do.end, !dbg !50

do.end:                                           ; preds = %do.cond
  %16 = load i32, ptr %count, align 4, !dbg !51
  ret i32 %16, !dbg !51
}

define i32 @main() !dbg !52 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !55, !DIExpression(), !56)
  store i32 0, ptr %err, align 4, !dbg !56
  %0 = call i32 @countEvenNumber(i32 32), !dbg !57
  %1 = icmp ne i32 %0, 16, !dbg !57
  br i1 %1, label %then, label %else, !dbg !57

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !58
  %2 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end, !dbg !58

else:                                             ; preds = %entry
  br label %if.end, !dbg !58

if.end:                                           ; preds = %else, %then
  %3 = call i32 @countEvenNumber2(i32 32), !dbg !59
  %4 = icmp ne i32 %3, 16, !dbg !59
  br i1 %4, label %then1, label %else2, !dbg !59

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !60
  %5 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end3, !dbg !60

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !60

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @countEvenNumber3(i32 32), !dbg !61
  %7 = icmp ne i32 %6, 16, !dbg !61
  br i1 %7, label %then4, label %else5, !dbg !61

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !62
  %8 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end6, !dbg !62

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !62

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @countEvenNumber(i32 0), !dbg !63
  %10 = icmp ne i32 %9, 0, !dbg !63
  br i1 %10, label %then7, label %else8, !dbg !63

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !64
  %11 = load i32, ptr %err, align 4, !dbg !64
  br label %if.end9, !dbg !64

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !64

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @countEvenNumber(i32 1), !dbg !65
  %13 = icmp ne i32 %12, 0, !dbg !65
  br i1 %13, label %then10, label %else11, !dbg !65

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !66
  %14 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end12, !dbg !66

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !66

if.end12:                                         ; preds = %else11, %then10
  %15 = load i32, ptr %err, align 4, !dbg !67
  %16 = icmp eq i32 %15, 0, !dbg !67
  br i1 %16, label %then13, label %else14, !dbg !67

then13:                                           ; preds = %if.end12
  %17 = call i32 (ptr, ...) @printf(ptr @0), !dbg !68
  br label %if.end15, !dbg !68

else14:                                           ; preds = %if.end12
  %18 = call i32 (ptr, ...) @printf(ptr @1), !dbg !70
  br label %if.end15, !dbg !70

if.end15:                                         ; preds = %else14, %then13
  %19 = load i32, ptr %err, align 4, !dbg !72
  ret i32 %19, !dbg !72
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "21.continue.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "countEvenNumber", linkageName: "countEvenNumber", scope: null, file: !3, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "i", scope: !4, file: !3, line: 8, type: !7)
!9 = !DILocation(line: 8, column: 8, scope: !4)
!10 = !DILocalVariable(name: "count", scope: !4, file: !3, line: 7, type: !7)
!11 = !DILocation(line: 7, column: 3, scope: !4)
!12 = !DILocalVariable(name: "n", arg: 1, scope: !4, file: !3, line: 6, type: !7)
!13 = !DILocation(line: 6, column: 5, scope: !4)
!14 = !DILocation(line: 9, column: 5, scope: !15)
!15 = distinct !DILexicalBlock(scope: !4, file: !3, line: 8, column: 35)
!16 = !DILocation(line: 10, column: 7, scope: !17)
!17 = distinct !DILexicalBlock(scope: !15, file: !3, line: 9, column: 21)
!18 = !DILocation(line: 12, column: 5, scope: !15)
!19 = !DILocation(line: 14, column: 3, scope: !4)
!20 = distinct !DISubprogram(name: "countEvenNumber2", linkageName: "countEvenNumber2", scope: null, file: !3, line: 17, type: !5, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !2)
!21 = !DILocalVariable(name: "i", scope: !20, file: !3, line: 19, type: !7)
!22 = !DILocation(line: 19, column: 3, scope: !20)
!23 = !DILocalVariable(name: "count", scope: !20, file: !3, line: 18, type: !7)
!24 = !DILocation(line: 18, column: 3, scope: !20)
!25 = !DILocalVariable(name: "n", arg: 1, scope: !20, file: !3, line: 17, type: !7)
!26 = !DILocation(line: 17, column: 5, scope: !20)
!27 = !DILocation(line: 20, column: 3, scope: !20)
!28 = !DILocation(line: 21, column: 5, scope: !29)
!29 = distinct !DILexicalBlock(scope: !20, file: !3, line: 20, column: 18)
!30 = !DILocation(line: 22, column: 7, scope: !31)
!31 = distinct !DILexicalBlock(scope: !29, file: !3, line: 21, column: 21)
!32 = !DILocation(line: 23, column: 7, scope: !31)
!33 = !DILocation(line: 25, column: 5, scope: !29)
!34 = !DILocation(line: 26, column: 5, scope: !29)
!35 = !DILocation(line: 28, column: 3, scope: !20)
!36 = distinct !DISubprogram(name: "countEvenNumber3", linkageName: "countEvenNumber3", scope: null, file: !3, line: 31, type: !5, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2)
!37 = !DILocalVariable(name: "i", scope: !36, file: !3, line: 33, type: !7)
!38 = !DILocation(line: 33, column: 3, scope: !36)
!39 = !DILocalVariable(name: "count", scope: !36, file: !3, line: 32, type: !7)
!40 = !DILocation(line: 32, column: 3, scope: !36)
!41 = !DILocalVariable(name: "n", arg: 1, scope: !36, file: !3, line: 31, type: !7)
!42 = !DILocation(line: 31, column: 5, scope: !36)
!43 = !DILocation(line: 34, column: 3, scope: !36)
!44 = !DILocation(line: 35, column: 5, scope: !45)
!45 = distinct !DILexicalBlock(scope: !36, file: !3, line: 34, column: 6)
!46 = !DILocation(line: 36, column: 7, scope: !47)
!47 = distinct !DILexicalBlock(scope: !45, file: !3, line: 35, column: 21)
!48 = !DILocation(line: 37, column: 7, scope: !47)
!49 = !DILocation(line: 39, column: 5, scope: !45)
!50 = !DILocation(line: 40, column: 5, scope: !45)
!51 = !DILocation(line: 42, column: 3, scope: !36)
!52 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 45, type: !53, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!7}
!55 = !DILocalVariable(name: "err", scope: !52, file: !3, line: 46, type: !7)
!56 = !DILocation(line: 46, column: 3, scope: !52)
!57 = !DILocation(line: 48, column: 3, scope: !52)
!58 = !DILocation(line: 48, column: 34, scope: !52)
!59 = !DILocation(line: 49, column: 3, scope: !52)
!60 = !DILocation(line: 49, column: 35, scope: !52)
!61 = !DILocation(line: 50, column: 3, scope: !52)
!62 = !DILocation(line: 50, column: 35, scope: !52)
!63 = !DILocation(line: 51, column: 3, scope: !52)
!64 = !DILocation(line: 51, column: 32, scope: !52)
!65 = !DILocation(line: 52, column: 3, scope: !52)
!66 = !DILocation(line: 52, column: 32, scope: !52)
!67 = !DILocation(line: 54, column: 3, scope: !52)
!68 = !DILocation(line: 55, column: 5, scope: !69)
!69 = distinct !DILexicalBlock(scope: !52, file: !3, line: 54, column: 17)
!70 = !DILocation(line: 57, column: 5, scope: !71)
!71 = distinct !DILexicalBlock(scope: !52, file: !3, line: 56, column: 10)
!72 = !DILocation(line: 59, column: 3, scope: !52)
