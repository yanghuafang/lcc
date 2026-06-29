; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [20 x i8] c"21.continue.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"21.continue.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @countEvenNumber(i32 %0) !dbg !2 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !6, !DIExpression(), !7)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !8, !DIExpression(), !9)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !10, !DIExpression(), !11)
  store i32 %0, ptr %n, align 4, !dbg !11
  store i32 0, ptr %count, align 4, !dbg !9
  store i32 1, ptr %i, align 4, !dbg !7
  br label %for.cond, !dbg !7

for.cond:                                         ; preds = %for.update, %entry
  %1 = load i32, ptr %i, align 4, !dbg !7
  %2 = load i32, ptr %n, align 4, !dbg !7
  %3 = icmp sle i32 %1, %2, !dbg !7
  br i1 %3, label %for.loop, label %for.end, !dbg !7

for.loop:                                         ; preds = %for.cond
  %4 = load i32, ptr %i, align 4, !dbg !12
  %5 = srem i32 %4, 2, !dbg !12
  %6 = icmp ne i32 %5, 0, !dbg !12
  br i1 %6, label %then, label %else, !dbg !12

then:                                             ; preds = %for.loop
  br label %for.update, !dbg !14

else:                                             ; preds = %for.loop
  br label %if.end, !dbg !14

if.end:                                           ; preds = %else
  %7 = load i32, ptr %count, align 4, !dbg !16
  %8 = add i32 %7, 1, !dbg !16
  store i32 %8, ptr %count, align 4, !dbg !16
  %9 = load i32, ptr %count, align 4, !dbg !16
  br label %for.update, !dbg !16

for.update:                                       ; preds = %if.end, %then
  %10 = load i32, ptr %i, align 4, !dbg !16
  %11 = add i32 %10, 1, !dbg !16
  store i32 %11, ptr %i, align 4, !dbg !16
  %12 = load i32, ptr %i, align 4, !dbg !16
  br label %for.cond, !dbg !16

for.end:                                          ; preds = %for.cond
  %13 = load i32, ptr %count, align 4, !dbg !17
  ret i32 %13, !dbg !17
}

define i32 @countEvenNumber2(i32 %0) !dbg !18 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !19, !DIExpression(), !20)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !21, !DIExpression(), !22)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !23, !DIExpression(), !24)
  store i32 %0, ptr %n, align 4, !dbg !24
  store i32 0, ptr %count, align 4, !dbg !22
  store i32 1, ptr %i, align 4, !dbg !20
  br label %while.cond, !dbg !25

while.cond:                                       ; preds = %if.end, %then, %entry
  %1 = load i32, ptr %i, align 4, !dbg !25
  %2 = load i32, ptr %n, align 4, !dbg !25
  %3 = icmp sle i32 %1, %2, !dbg !25
  br i1 %3, label %while.loop, label %while.end, !dbg !25

while.loop:                                       ; preds = %while.cond
  %4 = load i32, ptr %i, align 4, !dbg !26
  %5 = srem i32 %4, 2, !dbg !26
  %6 = icmp ne i32 %5, 0, !dbg !26
  br i1 %6, label %then, label %else, !dbg !26

then:                                             ; preds = %while.loop
  %7 = load i32, ptr %i, align 4, !dbg !28
  %8 = add i32 %7, 1, !dbg !28
  store i32 %8, ptr %i, align 4, !dbg !28
  %9 = load i32, ptr %i, align 4, !dbg !28
  br label %while.cond, !dbg !30

else:                                             ; preds = %while.loop
  br label %if.end, !dbg !30

if.end:                                           ; preds = %else
  %10 = load i32, ptr %count, align 4, !dbg !31
  %11 = add i32 %10, 1, !dbg !31
  store i32 %11, ptr %count, align 4, !dbg !31
  %12 = load i32, ptr %count, align 4, !dbg !31
  %13 = load i32, ptr %i, align 4, !dbg !32
  %14 = add i32 %13, 1, !dbg !32
  store i32 %14, ptr %i, align 4, !dbg !32
  %15 = load i32, ptr %i, align 4, !dbg !32
  br label %while.cond, !dbg !32

while.end:                                        ; preds = %while.cond
  %16 = load i32, ptr %count, align 4, !dbg !33
  ret i32 %16, !dbg !33
}

define i32 @countEvenNumber3(i32 %0) !dbg !34 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !35, !DIExpression(), !36)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !37, !DIExpression(), !38)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !39, !DIExpression(), !40)
  store i32 %0, ptr %n, align 4, !dbg !40
  store i32 0, ptr %count, align 4, !dbg !38
  store i32 1, ptr %i, align 4, !dbg !36
  br label %do.loop, !dbg !41

do.loop:                                          ; preds = %do.cond, %entry
  %1 = load i32, ptr %i, align 4, !dbg !42
  %2 = srem i32 %1, 2, !dbg !42
  %3 = icmp ne i32 %2, 0, !dbg !42
  br i1 %3, label %then, label %else, !dbg !42

then:                                             ; preds = %do.loop
  %4 = load i32, ptr %i, align 4, !dbg !44
  %5 = add i32 %4, 1, !dbg !44
  store i32 %5, ptr %i, align 4, !dbg !44
  %6 = load i32, ptr %i, align 4, !dbg !44
  br label %do.cond, !dbg !46

else:                                             ; preds = %do.loop
  br label %if.end, !dbg !46

if.end:                                           ; preds = %else
  %7 = load i32, ptr %count, align 4, !dbg !47
  %8 = add i32 %7, 1, !dbg !47
  store i32 %8, ptr %count, align 4, !dbg !47
  %9 = load i32, ptr %count, align 4, !dbg !47
  %10 = load i32, ptr %i, align 4, !dbg !48
  %11 = add i32 %10, 1, !dbg !48
  store i32 %11, ptr %i, align 4, !dbg !48
  %12 = load i32, ptr %i, align 4, !dbg !48
  br label %do.cond, !dbg !48

do.cond:                                          ; preds = %if.end, %then
  %13 = load i32, ptr %i, align 4, !dbg !48
  %14 = load i32, ptr %n, align 4, !dbg !48
  %15 = icmp sle i32 %13, %14, !dbg !48
  br i1 %15, label %do.loop, label %do.end, !dbg !48

do.end:                                           ; preds = %do.cond
  %16 = load i32, ptr %count, align 4, !dbg !49
  ret i32 %16, !dbg !49
}

define i32 @main() !dbg !50 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !53, !DIExpression(), !54)
  store i32 0, ptr %err, align 4, !dbg !54
  %0 = call i32 @countEvenNumber(i32 32), !dbg !55
  %1 = icmp ne i32 %0, 16, !dbg !55
  br i1 %1, label %then, label %else, !dbg !55

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !56
  %2 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end, !dbg !56

else:                                             ; preds = %entry
  br label %if.end, !dbg !56

if.end:                                           ; preds = %else, %then
  %3 = call i32 @countEvenNumber2(i32 32), !dbg !57
  %4 = icmp ne i32 %3, 16, !dbg !57
  br i1 %4, label %then1, label %else2, !dbg !57

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !58
  %5 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end3, !dbg !58

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !58

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @countEvenNumber3(i32 32), !dbg !59
  %7 = icmp ne i32 %6, 16, !dbg !59
  br i1 %7, label %then4, label %else5, !dbg !59

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !60
  %8 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end6, !dbg !60

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !60

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @countEvenNumber(i32 0), !dbg !61
  %10 = icmp ne i32 %9, 0, !dbg !61
  br i1 %10, label %then7, label %else8, !dbg !61

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !62
  %11 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end9, !dbg !62

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !62

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @countEvenNumber(i32 1), !dbg !63
  %13 = icmp ne i32 %12, 0, !dbg !63
  br i1 %13, label %then10, label %else11, !dbg !63

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !64
  %14 = load i32, ptr %err, align 4, !dbg !64
  br label %if.end12, !dbg !64

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !64

if.end12:                                         ; preds = %else11, %then10
  %15 = load i32, ptr %err, align 4, !dbg !65
  %16 = icmp eq i32 %15, 0, !dbg !65
  br i1 %16, label %then13, label %else14, !dbg !65

then13:                                           ; preds = %if.end12
  %17 = call i32 (ptr, ...) @printf(ptr @0), !dbg !66
  br label %if.end15, !dbg !66

else14:                                           ; preds = %if.end12
  %18 = call i32 (ptr, ...) @printf(ptr @1), !dbg !68
  br label %if.end15, !dbg !68

if.end15:                                         ; preds = %else14, %then13
  %19 = load i32, ptr %err, align 4, !dbg !70
  ret i32 %19, !dbg !70
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "21.continue.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "countEvenNumber", linkageName: "countEvenNumber", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "i", scope: !2, file: !1, line: 5, type: !5)
!7 = !DILocation(line: 5, column: 8, scope: !2)
!8 = !DILocalVariable(name: "count", scope: !2, file: !1, line: 4, type: !5)
!9 = !DILocation(line: 4, column: 3, scope: !2)
!10 = !DILocalVariable(name: "n", arg: 1, scope: !2, file: !1, line: 3, type: !5)
!11 = !DILocation(line: 3, column: 5, scope: !2)
!12 = !DILocation(line: 6, column: 5, scope: !13)
!13 = distinct !DILexicalBlock(scope: !2, file: !1, line: 5, column: 35)
!14 = !DILocation(line: 7, column: 7, scope: !15)
!15 = distinct !DILexicalBlock(scope: !13, file: !1, line: 6, column: 21)
!16 = !DILocation(line: 9, column: 5, scope: !13)
!17 = !DILocation(line: 11, column: 3, scope: !2)
!18 = distinct !DISubprogram(name: "countEvenNumber2", linkageName: "countEvenNumber2", scope: null, file: !1, line: 14, type: !3, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0)
!19 = !DILocalVariable(name: "i", scope: !18, file: !1, line: 16, type: !5)
!20 = !DILocation(line: 16, column: 3, scope: !18)
!21 = !DILocalVariable(name: "count", scope: !18, file: !1, line: 15, type: !5)
!22 = !DILocation(line: 15, column: 3, scope: !18)
!23 = !DILocalVariable(name: "n", arg: 1, scope: !18, file: !1, line: 14, type: !5)
!24 = !DILocation(line: 14, column: 5, scope: !18)
!25 = !DILocation(line: 17, column: 3, scope: !18)
!26 = !DILocation(line: 18, column: 5, scope: !27)
!27 = distinct !DILexicalBlock(scope: !18, file: !1, line: 17, column: 18)
!28 = !DILocation(line: 19, column: 7, scope: !29)
!29 = distinct !DILexicalBlock(scope: !27, file: !1, line: 18, column: 21)
!30 = !DILocation(line: 20, column: 7, scope: !29)
!31 = !DILocation(line: 22, column: 5, scope: !27)
!32 = !DILocation(line: 23, column: 5, scope: !27)
!33 = !DILocation(line: 25, column: 3, scope: !18)
!34 = distinct !DISubprogram(name: "countEvenNumber3", linkageName: "countEvenNumber3", scope: null, file: !1, line: 28, type: !3, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0)
!35 = !DILocalVariable(name: "i", scope: !34, file: !1, line: 30, type: !5)
!36 = !DILocation(line: 30, column: 3, scope: !34)
!37 = !DILocalVariable(name: "count", scope: !34, file: !1, line: 29, type: !5)
!38 = !DILocation(line: 29, column: 3, scope: !34)
!39 = !DILocalVariable(name: "n", arg: 1, scope: !34, file: !1, line: 28, type: !5)
!40 = !DILocation(line: 28, column: 5, scope: !34)
!41 = !DILocation(line: 31, column: 3, scope: !34)
!42 = !DILocation(line: 32, column: 5, scope: !43)
!43 = distinct !DILexicalBlock(scope: !34, file: !1, line: 31, column: 6)
!44 = !DILocation(line: 33, column: 7, scope: !45)
!45 = distinct !DILexicalBlock(scope: !43, file: !1, line: 32, column: 21)
!46 = !DILocation(line: 34, column: 7, scope: !45)
!47 = !DILocation(line: 36, column: 5, scope: !43)
!48 = !DILocation(line: 37, column: 5, scope: !43)
!49 = !DILocation(line: 39, column: 3, scope: !34)
!50 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 42, type: !51, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0)
!51 = !DISubroutineType(types: !52)
!52 = !{!5}
!53 = !DILocalVariable(name: "err", scope: !50, file: !1, line: 43, type: !5)
!54 = !DILocation(line: 43, column: 3, scope: !50)
!55 = !DILocation(line: 45, column: 3, scope: !50)
!56 = !DILocation(line: 45, column: 34, scope: !50)
!57 = !DILocation(line: 46, column: 3, scope: !50)
!58 = !DILocation(line: 46, column: 35, scope: !50)
!59 = !DILocation(line: 47, column: 3, scope: !50)
!60 = !DILocation(line: 47, column: 35, scope: !50)
!61 = !DILocation(line: 48, column: 3, scope: !50)
!62 = !DILocation(line: 48, column: 32, scope: !50)
!63 = !DILocation(line: 49, column: 3, scope: !50)
!64 = !DILocation(line: 49, column: 32, scope: !50)
!65 = !DILocation(line: 51, column: 3, scope: !50)
!66 = !DILocation(line: 52, column: 5, scope: !67)
!67 = distinct !DILexicalBlock(scope: !50, file: !1, line: 51, column: 17)
!68 = !DILocation(line: 54, column: 5, scope: !69)
!69 = distinct !DILexicalBlock(scope: !50, file: !1, line: 53, column: 10)
!70 = !DILocation(line: 56, column: 3, scope: !50)
