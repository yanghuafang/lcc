; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [17 x i8] c"22.break.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"22.break.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @countNumber(i32 %0, i32 %1) !dbg !2 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !6, !DIExpression(), !7)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !8, !DIExpression(), !9)
  %smallRange = alloca i32, align 4
    #dbg_declare(ptr %smallRange, !10, !DIExpression(), !11)
  %maxRange = alloca i32, align 4
    #dbg_declare(ptr %maxRange, !12, !DIExpression(), !11)
  store i32 %0, ptr %maxRange, align 4, !dbg !11
  store i32 %1, ptr %smallRange, align 4, !dbg !11
  store i32 0, ptr %count, align 4, !dbg !9
  store i32 1, ptr %i, align 4, !dbg !7
  br label %for.cond, !dbg !7

for.cond:                                         ; preds = %for.update, %entry
  %2 = load i32, ptr %i, align 4, !dbg !7
  %3 = load i32, ptr %maxRange, align 4, !dbg !7
  %4 = icmp sle i32 %2, %3, !dbg !7
  br i1 %4, label %for.loop, label %for.end, !dbg !7

for.loop:                                         ; preds = %for.cond
  %5 = load i32, ptr %i, align 4, !dbg !13
  %6 = load i32, ptr %smallRange, align 4, !dbg !13
  %7 = icmp sgt i32 %5, %6, !dbg !13
  br i1 %7, label %then, label %else, !dbg !13

then:                                             ; preds = %for.loop
  br label %for.end, !dbg !15

else:                                             ; preds = %for.loop
  br label %if.end, !dbg !15

if.end:                                           ; preds = %else
  %8 = load i32, ptr %count, align 4, !dbg !17
  %9 = add i32 %8, 1, !dbg !17
  store i32 %9, ptr %count, align 4, !dbg !17
  %10 = load i32, ptr %count, align 4, !dbg !17
  br label %for.update, !dbg !17

for.update:                                       ; preds = %if.end
  %11 = load i32, ptr %i, align 4, !dbg !17
  %12 = add i32 %11, 1, !dbg !17
  store i32 %12, ptr %i, align 4, !dbg !17
  %13 = load i32, ptr %i, align 4, !dbg !17
  br label %for.cond, !dbg !17

for.end:                                          ; preds = %then, %for.cond
  %14 = load i32, ptr %count, align 4, !dbg !18
  ret i32 %14, !dbg !18
}

define i32 @countNumber2(i32 %0, i32 %1) !dbg !19 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !20, !DIExpression(), !21)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !22, !DIExpression(), !23)
  %smallRange = alloca i32, align 4
    #dbg_declare(ptr %smallRange, !24, !DIExpression(), !25)
  %maxRange = alloca i32, align 4
    #dbg_declare(ptr %maxRange, !26, !DIExpression(), !25)
  store i32 %0, ptr %maxRange, align 4, !dbg !25
  store i32 %1, ptr %smallRange, align 4, !dbg !25
  store i32 0, ptr %count, align 4, !dbg !23
  store i32 1, ptr %i, align 4, !dbg !21
  br label %while.cond, !dbg !27

while.cond:                                       ; preds = %if.end, %entry
  %2 = load i32, ptr %i, align 4, !dbg !27
  %3 = load i32, ptr %maxRange, align 4, !dbg !27
  %4 = icmp sle i32 %2, %3, !dbg !27
  br i1 %4, label %while.loop, label %while.end, !dbg !27

while.loop:                                       ; preds = %while.cond
  %5 = load i32, ptr %i, align 4, !dbg !28
  %6 = load i32, ptr %smallRange, align 4, !dbg !28
  %7 = icmp sgt i32 %5, %6, !dbg !28
  br i1 %7, label %then, label %else, !dbg !28

then:                                             ; preds = %while.loop
  br label %while.end, !dbg !30

else:                                             ; preds = %while.loop
  br label %if.end, !dbg !30

if.end:                                           ; preds = %else
  %8 = load i32, ptr %count, align 4, !dbg !32
  %9 = add i32 %8, 1, !dbg !32
  store i32 %9, ptr %count, align 4, !dbg !32
  %10 = load i32, ptr %count, align 4, !dbg !32
  %11 = load i32, ptr %i, align 4, !dbg !33
  %12 = add i32 %11, 1, !dbg !33
  store i32 %12, ptr %i, align 4, !dbg !33
  %13 = load i32, ptr %i, align 4, !dbg !33
  br label %while.cond, !dbg !33

while.end:                                        ; preds = %then, %while.cond
  %14 = load i32, ptr %count, align 4, !dbg !34
  ret i32 %14, !dbg !34
}

define i32 @countNumber3(i32 %0, i32 %1) !dbg !35 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !36, !DIExpression(), !37)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !38, !DIExpression(), !39)
  %smallRange = alloca i32, align 4
    #dbg_declare(ptr %smallRange, !40, !DIExpression(), !41)
  %maxRange = alloca i32, align 4
    #dbg_declare(ptr %maxRange, !42, !DIExpression(), !41)
  store i32 %0, ptr %maxRange, align 4, !dbg !41
  store i32 %1, ptr %smallRange, align 4, !dbg !41
  store i32 0, ptr %count, align 4, !dbg !39
  store i32 1, ptr %i, align 4, !dbg !37
  br label %do.loop, !dbg !43

do.loop:                                          ; preds = %do.cond, %entry
  %2 = load i32, ptr %i, align 4, !dbg !44
  %3 = load i32, ptr %smallRange, align 4, !dbg !44
  %4 = icmp sgt i32 %2, %3, !dbg !44
  br i1 %4, label %then, label %else, !dbg !44

then:                                             ; preds = %do.loop
  br label %do.end, !dbg !46

else:                                             ; preds = %do.loop
  br label %if.end, !dbg !46

if.end:                                           ; preds = %else
  %5 = load i32, ptr %count, align 4, !dbg !48
  %6 = add i32 %5, 1, !dbg !48
  store i32 %6, ptr %count, align 4, !dbg !48
  %7 = load i32, ptr %count, align 4, !dbg !48
  %8 = load i32, ptr %i, align 4, !dbg !49
  %9 = add i32 %8, 1, !dbg !49
  store i32 %9, ptr %i, align 4, !dbg !49
  %10 = load i32, ptr %i, align 4, !dbg !49
  br label %do.cond, !dbg !49

do.cond:                                          ; preds = %if.end
  %11 = load i32, ptr %i, align 4, !dbg !49
  %12 = load i32, ptr %maxRange, align 4, !dbg !49
  %13 = icmp sle i32 %11, %12, !dbg !49
  br i1 %13, label %do.loop, label %do.end, !dbg !49

do.end:                                           ; preds = %do.cond, %then
  %14 = load i32, ptr %count, align 4, !dbg !50
  ret i32 %14, !dbg !50
}

define i32 @main() !dbg !51 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !54, !DIExpression(), !55)
  store i32 0, ptr %err, align 4, !dbg !55
  %0 = call i32 @countNumber(i32 100, i32 37), !dbg !56
  %1 = icmp ne i32 %0, 37, !dbg !56
  br i1 %1, label %then, label %else, !dbg !56

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !57
  %2 = load i32, ptr %err, align 4, !dbg !57
  br label %if.end, !dbg !57

else:                                             ; preds = %entry
  br label %if.end, !dbg !57

if.end:                                           ; preds = %else, %then
  %3 = call i32 @countNumber2(i32 100, i32 37), !dbg !58
  %4 = icmp ne i32 %3, 37, !dbg !58
  br i1 %4, label %then1, label %else2, !dbg !58

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !59
  %5 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end3, !dbg !59

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !59

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @countNumber3(i32 100, i32 37), !dbg !60
  %7 = icmp ne i32 %6, 37, !dbg !60
  br i1 %7, label %then4, label %else5, !dbg !60

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !61
  %8 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end6, !dbg !61

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !61

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @countNumber(i32 10, i32 10), !dbg !62
  %10 = icmp ne i32 %9, 10, !dbg !62
  br i1 %10, label %then7, label %else8, !dbg !62

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !63
  %11 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end9, !dbg !63

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !63

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @countNumber2(i32 10, i32 10), !dbg !64
  %13 = icmp ne i32 %12, 10, !dbg !64
  br i1 %13, label %then10, label %else11, !dbg !64

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !65
  %14 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end12, !dbg !65

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !65

if.end12:                                         ; preds = %else11, %then10
  %15 = call i32 @countNumber3(i32 10, i32 10), !dbg !66
  %16 = icmp ne i32 %15, 10, !dbg !66
  br i1 %16, label %then13, label %else14, !dbg !66

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !67
  %17 = load i32, ptr %err, align 4, !dbg !67
  br label %if.end15, !dbg !67

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !67

if.end15:                                         ; preds = %else14, %then13
  %18 = call i32 @countNumber(i32 5, i32 0), !dbg !68
  %19 = icmp ne i32 %18, 0, !dbg !68
  br i1 %19, label %then16, label %else17, !dbg !68

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !69
  %20 = load i32, ptr %err, align 4, !dbg !69
  br label %if.end18, !dbg !69

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !69

if.end18:                                         ; preds = %else17, %then16
  %21 = call i32 @countNumber2(i32 5, i32 0), !dbg !70
  %22 = icmp ne i32 %21, 0, !dbg !70
  br i1 %22, label %then19, label %else20, !dbg !70

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !71
  %23 = load i32, ptr %err, align 4, !dbg !71
  br label %if.end21, !dbg !71

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !71

if.end21:                                         ; preds = %else20, %then19
  %24 = call i32 @countNumber3(i32 5, i32 0), !dbg !72
  %25 = icmp ne i32 %24, 0, !dbg !72
  br i1 %25, label %then22, label %else23, !dbg !72

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !73
  %26 = load i32, ptr %err, align 4, !dbg !73
  br label %if.end24, !dbg !73

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !73

if.end24:                                         ; preds = %else23, %then22
  %27 = load i32, ptr %err, align 4, !dbg !74
  %28 = icmp eq i32 %27, 0, !dbg !74
  br i1 %28, label %then25, label %else26, !dbg !74

then25:                                           ; preds = %if.end24
  %29 = call i32 (ptr, ...) @printf(ptr @0), !dbg !75
  br label %if.end27, !dbg !75

else26:                                           ; preds = %if.end24
  %30 = call i32 (ptr, ...) @printf(ptr @1), !dbg !77
  br label %if.end27, !dbg !77

if.end27:                                         ; preds = %else26, %then25
  %31 = load i32, ptr %err, align 4, !dbg !79
  ret i32 %31, !dbg !79
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "22.break.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "countNumber", linkageName: "countNumber", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "i", scope: !2, file: !1, line: 5, type: !5)
!7 = !DILocation(line: 5, column: 8, scope: !2)
!8 = !DILocalVariable(name: "count", scope: !2, file: !1, line: 4, type: !5)
!9 = !DILocation(line: 4, column: 3, scope: !2)
!10 = !DILocalVariable(name: "smallRange", arg: 2, scope: !2, file: !1, line: 3, type: !5)
!11 = !DILocation(line: 3, column: 5, scope: !2)
!12 = !DILocalVariable(name: "maxRange", arg: 1, scope: !2, file: !1, line: 3, type: !5)
!13 = !DILocation(line: 6, column: 5, scope: !14)
!14 = distinct !DILexicalBlock(scope: !2, file: !1, line: 5, column: 42)
!15 = !DILocation(line: 7, column: 7, scope: !16)
!16 = distinct !DILexicalBlock(scope: !14, file: !1, line: 6, column: 25)
!17 = !DILocation(line: 9, column: 5, scope: !14)
!18 = !DILocation(line: 11, column: 3, scope: !2)
!19 = distinct !DISubprogram(name: "countNumber2", linkageName: "countNumber2", scope: null, file: !1, line: 14, type: !3, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0)
!20 = !DILocalVariable(name: "i", scope: !19, file: !1, line: 16, type: !5)
!21 = !DILocation(line: 16, column: 3, scope: !19)
!22 = !DILocalVariable(name: "count", scope: !19, file: !1, line: 15, type: !5)
!23 = !DILocation(line: 15, column: 3, scope: !19)
!24 = !DILocalVariable(name: "smallRange", arg: 2, scope: !19, file: !1, line: 14, type: !5)
!25 = !DILocation(line: 14, column: 5, scope: !19)
!26 = !DILocalVariable(name: "maxRange", arg: 1, scope: !19, file: !1, line: 14, type: !5)
!27 = !DILocation(line: 17, column: 3, scope: !19)
!28 = !DILocation(line: 18, column: 5, scope: !29)
!29 = distinct !DILexicalBlock(scope: !19, file: !1, line: 17, column: 25)
!30 = !DILocation(line: 19, column: 7, scope: !31)
!31 = distinct !DILexicalBlock(scope: !29, file: !1, line: 18, column: 25)
!32 = !DILocation(line: 21, column: 5, scope: !29)
!33 = !DILocation(line: 22, column: 5, scope: !29)
!34 = !DILocation(line: 24, column: 3, scope: !19)
!35 = distinct !DISubprogram(name: "countNumber3", linkageName: "countNumber3", scope: null, file: !1, line: 27, type: !3, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0)
!36 = !DILocalVariable(name: "i", scope: !35, file: !1, line: 29, type: !5)
!37 = !DILocation(line: 29, column: 3, scope: !35)
!38 = !DILocalVariable(name: "count", scope: !35, file: !1, line: 28, type: !5)
!39 = !DILocation(line: 28, column: 3, scope: !35)
!40 = !DILocalVariable(name: "smallRange", arg: 2, scope: !35, file: !1, line: 27, type: !5)
!41 = !DILocation(line: 27, column: 5, scope: !35)
!42 = !DILocalVariable(name: "maxRange", arg: 1, scope: !35, file: !1, line: 27, type: !5)
!43 = !DILocation(line: 30, column: 3, scope: !35)
!44 = !DILocation(line: 31, column: 5, scope: !45)
!45 = distinct !DILexicalBlock(scope: !35, file: !1, line: 30, column: 6)
!46 = !DILocation(line: 32, column: 7, scope: !47)
!47 = distinct !DILexicalBlock(scope: !45, file: !1, line: 31, column: 25)
!48 = !DILocation(line: 34, column: 5, scope: !45)
!49 = !DILocation(line: 35, column: 5, scope: !45)
!50 = !DILocation(line: 37, column: 3, scope: !35)
!51 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 40, type: !52, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0)
!52 = !DISubroutineType(types: !53)
!53 = !{!5}
!54 = !DILocalVariable(name: "err", scope: !51, file: !1, line: 41, type: !5)
!55 = !DILocation(line: 41, column: 3, scope: !51)
!56 = !DILocation(line: 43, column: 3, scope: !51)
!57 = !DILocation(line: 43, column: 35, scope: !51)
!58 = !DILocation(line: 44, column: 3, scope: !51)
!59 = !DILocation(line: 44, column: 36, scope: !51)
!60 = !DILocation(line: 45, column: 3, scope: !51)
!61 = !DILocation(line: 45, column: 36, scope: !51)
!62 = !DILocation(line: 46, column: 3, scope: !51)
!63 = !DILocation(line: 46, column: 34, scope: !51)
!64 = !DILocation(line: 47, column: 3, scope: !51)
!65 = !DILocation(line: 47, column: 35, scope: !51)
!66 = !DILocation(line: 48, column: 3, scope: !51)
!67 = !DILocation(line: 48, column: 35, scope: !51)
!68 = !DILocation(line: 49, column: 3, scope: !51)
!69 = !DILocation(line: 49, column: 31, scope: !51)
!70 = !DILocation(line: 50, column: 3, scope: !51)
!71 = !DILocation(line: 50, column: 32, scope: !51)
!72 = !DILocation(line: 51, column: 3, scope: !51)
!73 = !DILocation(line: 51, column: 32, scope: !51)
!74 = !DILocation(line: 53, column: 3, scope: !51)
!75 = !DILocation(line: 54, column: 5, scope: !76)
!76 = distinct !DILexicalBlock(scope: !51, file: !1, line: 53, column: 17)
!77 = !DILocation(line: 56, column: 5, scope: !78)
!78 = distinct !DILexicalBlock(scope: !51, file: !1, line: 55, column: 10)
!79 = !DILocation(line: 58, column: 3, scope: !51)
