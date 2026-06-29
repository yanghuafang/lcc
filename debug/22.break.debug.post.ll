; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [17 x i8] c"22.break.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"22.break.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @countNumber(i32 %0, i32 %1) !dbg !2 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !7, !DIExpression(), !8)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !9, !DIExpression(), !10)
  %smallRange = alloca i32, align 4
    #dbg_declare(ptr %smallRange, !11, !DIExpression(), !12)
  %maxRange = alloca i32, align 4
    #dbg_declare(ptr %maxRange, !13, !DIExpression(), !12)
  store i32 %0, ptr %maxRange, align 4, !dbg !12
  store i32 %1, ptr %smallRange, align 4, !dbg !12
  store i32 0, ptr %count, align 4, !dbg !10
  store i32 1, ptr %i, align 4, !dbg !8
  br label %for.cond, !dbg !8

for.cond:                                         ; preds = %for.update, %entry
  %2 = load i32, ptr %i, align 4, !dbg !8
  %3 = load i32, ptr %maxRange, align 4, !dbg !8
  %4 = icmp sle i32 %2, %3, !dbg !8
  br i1 %4, label %for.loop, label %for.end, !dbg !8

for.loop:                                         ; preds = %for.cond
  %5 = load i32, ptr %i, align 4, !dbg !14
  %6 = load i32, ptr %smallRange, align 4, !dbg !14
  %7 = icmp sgt i32 %5, %6, !dbg !14
  br i1 %7, label %then, label %else, !dbg !14

then:                                             ; preds = %for.loop
  br label %for.end, !dbg !16

else:                                             ; preds = %for.loop
  br label %if.end, !dbg !16

if.end:                                           ; preds = %else
  %8 = load i32, ptr %count, align 4, !dbg !18
  %9 = add i32 %8, 1, !dbg !18
  store i32 %9, ptr %count, align 4, !dbg !18
  %10 = load i32, ptr %count, align 4, !dbg !18
  br label %for.update, !dbg !18

for.update:                                       ; preds = %if.end
  %11 = load i32, ptr %i, align 4, !dbg !18
  %12 = add i32 %11, 1, !dbg !18
  store i32 %12, ptr %i, align 4, !dbg !18
  %13 = load i32, ptr %i, align 4, !dbg !18
  br label %for.cond, !dbg !18

for.end:                                          ; preds = %then, %for.cond
  %14 = load i32, ptr %count, align 4, !dbg !19
  ret i32 %14, !dbg !19
}

define i32 @countNumber2(i32 %0, i32 %1) !dbg !20 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !21, !DIExpression(), !22)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !23, !DIExpression(), !24)
  %smallRange = alloca i32, align 4
    #dbg_declare(ptr %smallRange, !25, !DIExpression(), !26)
  %maxRange = alloca i32, align 4
    #dbg_declare(ptr %maxRange, !27, !DIExpression(), !26)
  store i32 %0, ptr %maxRange, align 4, !dbg !26
  store i32 %1, ptr %smallRange, align 4, !dbg !26
  store i32 0, ptr %count, align 4, !dbg !24
  store i32 1, ptr %i, align 4, !dbg !22
  br label %while.cond, !dbg !28

while.cond:                                       ; preds = %if.end, %entry
  %2 = load i32, ptr %i, align 4, !dbg !28
  %3 = load i32, ptr %maxRange, align 4, !dbg !28
  %4 = icmp sle i32 %2, %3, !dbg !28
  br i1 %4, label %while.loop, label %while.end, !dbg !28

while.loop:                                       ; preds = %while.cond
  %5 = load i32, ptr %i, align 4, !dbg !29
  %6 = load i32, ptr %smallRange, align 4, !dbg !29
  %7 = icmp sgt i32 %5, %6, !dbg !29
  br i1 %7, label %then, label %else, !dbg !29

then:                                             ; preds = %while.loop
  br label %while.end, !dbg !31

else:                                             ; preds = %while.loop
  br label %if.end, !dbg !31

if.end:                                           ; preds = %else
  %8 = load i32, ptr %count, align 4, !dbg !33
  %9 = add i32 %8, 1, !dbg !33
  store i32 %9, ptr %count, align 4, !dbg !33
  %10 = load i32, ptr %count, align 4, !dbg !33
  %11 = load i32, ptr %i, align 4, !dbg !34
  %12 = add i32 %11, 1, !dbg !34
  store i32 %12, ptr %i, align 4, !dbg !34
  %13 = load i32, ptr %i, align 4, !dbg !34
  br label %while.cond, !dbg !34

while.end:                                        ; preds = %then, %while.cond
  %14 = load i32, ptr %count, align 4, !dbg !35
  ret i32 %14, !dbg !35
}

define i32 @countNumber3(i32 %0, i32 %1) !dbg !36 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !37, !DIExpression(), !38)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !39, !DIExpression(), !40)
  %smallRange = alloca i32, align 4
    #dbg_declare(ptr %smallRange, !41, !DIExpression(), !42)
  %maxRange = alloca i32, align 4
    #dbg_declare(ptr %maxRange, !43, !DIExpression(), !42)
  store i32 %0, ptr %maxRange, align 4, !dbg !42
  store i32 %1, ptr %smallRange, align 4, !dbg !42
  store i32 0, ptr %count, align 4, !dbg !40
  store i32 1, ptr %i, align 4, !dbg !38
  br label %do.loop, !dbg !44

do.loop:                                          ; preds = %do.cond, %entry
  %2 = load i32, ptr %i, align 4, !dbg !45
  %3 = load i32, ptr %smallRange, align 4, !dbg !45
  %4 = icmp sgt i32 %2, %3, !dbg !45
  br i1 %4, label %then, label %else, !dbg !45

then:                                             ; preds = %do.loop
  br label %do.end, !dbg !47

else:                                             ; preds = %do.loop
  br label %if.end, !dbg !47

if.end:                                           ; preds = %else
  %5 = load i32, ptr %count, align 4, !dbg !49
  %6 = add i32 %5, 1, !dbg !49
  store i32 %6, ptr %count, align 4, !dbg !49
  %7 = load i32, ptr %count, align 4, !dbg !49
  %8 = load i32, ptr %i, align 4, !dbg !50
  %9 = add i32 %8, 1, !dbg !50
  store i32 %9, ptr %i, align 4, !dbg !50
  %10 = load i32, ptr %i, align 4, !dbg !50
  br label %do.cond, !dbg !50

do.cond:                                          ; preds = %if.end
  %11 = load i32, ptr %i, align 4, !dbg !50
  %12 = load i32, ptr %maxRange, align 4, !dbg !50
  %13 = icmp sle i32 %11, %12, !dbg !50
  br i1 %13, label %do.loop, label %do.end, !dbg !50

do.end:                                           ; preds = %do.cond, %then
  %14 = load i32, ptr %count, align 4, !dbg !51
  ret i32 %14, !dbg !51
}

define i32 @main() !dbg !52 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !55, !DIExpression(), !56)
  store i32 0, ptr %err, align 4, !dbg !56
  %0 = call i32 @countNumber(i32 100, i32 37), !dbg !57
  %1 = icmp ne i32 %0, 37, !dbg !57
  br i1 %1, label %then, label %else, !dbg !57

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !58
  %2 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end, !dbg !58

else:                                             ; preds = %entry
  br label %if.end, !dbg !58

if.end:                                           ; preds = %else, %then
  %3 = call i32 @countNumber2(i32 100, i32 37), !dbg !59
  %4 = icmp ne i32 %3, 37, !dbg !59
  br i1 %4, label %then1, label %else2, !dbg !59

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !60
  %5 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end3, !dbg !60

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !60

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @countNumber3(i32 100, i32 37), !dbg !61
  %7 = icmp ne i32 %6, 37, !dbg !61
  br i1 %7, label %then4, label %else5, !dbg !61

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !62
  %8 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end6, !dbg !62

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !62

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @countNumber(i32 10, i32 10), !dbg !63
  %10 = icmp ne i32 %9, 10, !dbg !63
  br i1 %10, label %then7, label %else8, !dbg !63

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !64
  %11 = load i32, ptr %err, align 4, !dbg !64
  br label %if.end9, !dbg !64

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !64

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @countNumber2(i32 10, i32 10), !dbg !65
  %13 = icmp ne i32 %12, 10, !dbg !65
  br i1 %13, label %then10, label %else11, !dbg !65

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !66
  %14 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end12, !dbg !66

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !66

if.end12:                                         ; preds = %else11, %then10
  %15 = call i32 @countNumber3(i32 10, i32 10), !dbg !67
  %16 = icmp ne i32 %15, 10, !dbg !67
  br i1 %16, label %then13, label %else14, !dbg !67

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !68
  %17 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end15, !dbg !68

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !68

if.end15:                                         ; preds = %else14, %then13
  %18 = call i32 @countNumber(i32 5, i32 0), !dbg !69
  %19 = icmp ne i32 %18, 0, !dbg !69
  br i1 %19, label %then16, label %else17, !dbg !69

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !70
  %20 = load i32, ptr %err, align 4, !dbg !70
  br label %if.end18, !dbg !70

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !70

if.end18:                                         ; preds = %else17, %then16
  %21 = call i32 @countNumber2(i32 5, i32 0), !dbg !71
  %22 = icmp ne i32 %21, 0, !dbg !71
  br i1 %22, label %then19, label %else20, !dbg !71

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !72
  %23 = load i32, ptr %err, align 4, !dbg !72
  br label %if.end21, !dbg !72

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !72

if.end21:                                         ; preds = %else20, %then19
  %24 = call i32 @countNumber3(i32 5, i32 0), !dbg !73
  %25 = icmp ne i32 %24, 0, !dbg !73
  br i1 %25, label %then22, label %else23, !dbg !73

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !74
  %26 = load i32, ptr %err, align 4, !dbg !74
  br label %if.end24, !dbg !74

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !74

if.end24:                                         ; preds = %else23, %then22
  %27 = load i32, ptr %err, align 4, !dbg !75
  %28 = icmp eq i32 %27, 0, !dbg !75
  br i1 %28, label %then25, label %else26, !dbg !75

then25:                                           ; preds = %if.end24
  %29 = call i32 (ptr, ...) @printf(ptr @0), !dbg !76
  br label %if.end27, !dbg !76

else26:                                           ; preds = %if.end24
  %30 = call i32 (ptr, ...) @printf(ptr @1), !dbg !78
  br label %if.end27, !dbg !78

if.end27:                                         ; preds = %else26, %then25
  %31 = load i32, ptr %err, align 4, !dbg !80
  ret i32 %31, !dbg !80
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "22.break.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "countNumber", linkageName: "countNumber", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "i", scope: !2, file: !1, line: 5, type: !5)
!8 = !DILocation(line: 5, column: 8, scope: !2)
!9 = !DILocalVariable(name: "count", scope: !2, file: !1, line: 4, type: !5)
!10 = !DILocation(line: 4, column: 3, scope: !2)
!11 = !DILocalVariable(name: "smallRange", arg: 2, scope: !2, file: !1, line: 3, type: !5)
!12 = !DILocation(line: 3, column: 5, scope: !2)
!13 = !DILocalVariable(name: "maxRange", arg: 1, scope: !2, file: !1, line: 3, type: !5)
!14 = !DILocation(line: 6, column: 5, scope: !15)
!15 = distinct !DILexicalBlock(scope: !2, file: !1, line: 5, column: 42)
!16 = !DILocation(line: 7, column: 7, scope: !17)
!17 = distinct !DILexicalBlock(scope: !15, file: !1, line: 6, column: 25)
!18 = !DILocation(line: 9, column: 5, scope: !15)
!19 = !DILocation(line: 11, column: 3, scope: !2)
!20 = distinct !DISubprogram(name: "countNumber2", linkageName: "countNumber2", scope: null, file: !1, line: 14, type: !3, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!21 = !DILocalVariable(name: "i", scope: !20, file: !1, line: 16, type: !5)
!22 = !DILocation(line: 16, column: 3, scope: !20)
!23 = !DILocalVariable(name: "count", scope: !20, file: !1, line: 15, type: !5)
!24 = !DILocation(line: 15, column: 3, scope: !20)
!25 = !DILocalVariable(name: "smallRange", arg: 2, scope: !20, file: !1, line: 14, type: !5)
!26 = !DILocation(line: 14, column: 5, scope: !20)
!27 = !DILocalVariable(name: "maxRange", arg: 1, scope: !20, file: !1, line: 14, type: !5)
!28 = !DILocation(line: 17, column: 3, scope: !20)
!29 = !DILocation(line: 18, column: 5, scope: !30)
!30 = distinct !DILexicalBlock(scope: !20, file: !1, line: 17, column: 25)
!31 = !DILocation(line: 19, column: 7, scope: !32)
!32 = distinct !DILexicalBlock(scope: !30, file: !1, line: 18, column: 25)
!33 = !DILocation(line: 21, column: 5, scope: !30)
!34 = !DILocation(line: 22, column: 5, scope: !30)
!35 = !DILocation(line: 24, column: 3, scope: !20)
!36 = distinct !DISubprogram(name: "countNumber3", linkageName: "countNumber3", scope: null, file: !1, line: 27, type: !3, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!37 = !DILocalVariable(name: "i", scope: !36, file: !1, line: 29, type: !5)
!38 = !DILocation(line: 29, column: 3, scope: !36)
!39 = !DILocalVariable(name: "count", scope: !36, file: !1, line: 28, type: !5)
!40 = !DILocation(line: 28, column: 3, scope: !36)
!41 = !DILocalVariable(name: "smallRange", arg: 2, scope: !36, file: !1, line: 27, type: !5)
!42 = !DILocation(line: 27, column: 5, scope: !36)
!43 = !DILocalVariable(name: "maxRange", arg: 1, scope: !36, file: !1, line: 27, type: !5)
!44 = !DILocation(line: 30, column: 3, scope: !36)
!45 = !DILocation(line: 31, column: 5, scope: !46)
!46 = distinct !DILexicalBlock(scope: !36, file: !1, line: 30, column: 6)
!47 = !DILocation(line: 32, column: 7, scope: !48)
!48 = distinct !DILexicalBlock(scope: !46, file: !1, line: 31, column: 25)
!49 = !DILocation(line: 34, column: 5, scope: !46)
!50 = !DILocation(line: 35, column: 5, scope: !46)
!51 = !DILocation(line: 37, column: 3, scope: !36)
!52 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 40, type: !53, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!53 = !DISubroutineType(types: !54)
!54 = !{!5}
!55 = !DILocalVariable(name: "err", scope: !52, file: !1, line: 41, type: !5)
!56 = !DILocation(line: 41, column: 3, scope: !52)
!57 = !DILocation(line: 43, column: 3, scope: !52)
!58 = !DILocation(line: 43, column: 35, scope: !52)
!59 = !DILocation(line: 44, column: 3, scope: !52)
!60 = !DILocation(line: 44, column: 36, scope: !52)
!61 = !DILocation(line: 45, column: 3, scope: !52)
!62 = !DILocation(line: 45, column: 36, scope: !52)
!63 = !DILocation(line: 46, column: 3, scope: !52)
!64 = !DILocation(line: 46, column: 34, scope: !52)
!65 = !DILocation(line: 47, column: 3, scope: !52)
!66 = !DILocation(line: 47, column: 35, scope: !52)
!67 = !DILocation(line: 48, column: 3, scope: !52)
!68 = !DILocation(line: 48, column: 35, scope: !52)
!69 = !DILocation(line: 49, column: 3, scope: !52)
!70 = !DILocation(line: 49, column: 31, scope: !52)
!71 = !DILocation(line: 50, column: 3, scope: !52)
!72 = !DILocation(line: 50, column: 32, scope: !52)
!73 = !DILocation(line: 51, column: 3, scope: !52)
!74 = !DILocation(line: 51, column: 32, scope: !52)
!75 = !DILocation(line: 53, column: 3, scope: !52)
!76 = !DILocation(line: 54, column: 5, scope: !77)
!77 = distinct !DILexicalBlock(scope: !52, file: !1, line: 53, column: 17)
!78 = !DILocation(line: 56, column: 5, scope: !79)
!79 = distinct !DILexicalBlock(scope: !52, file: !1, line: 55, column: 10)
!80 = !DILocation(line: 58, column: 3, scope: !52)
