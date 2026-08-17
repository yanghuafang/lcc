; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [17 x i8] c"22.break.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"22.break.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @countNumber(i32 %0, i32 %1) !dbg !4 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !8, !DIExpression(), !9)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !10, !DIExpression(), !11)
  %smallRange = alloca i32, align 4
    #dbg_declare(ptr %smallRange, !12, !DIExpression(), !13)
  %maxRange = alloca i32, align 4
    #dbg_declare(ptr %maxRange, !14, !DIExpression(), !13)
  store i32 %0, ptr %maxRange, align 4, !dbg !13
  store i32 %1, ptr %smallRange, align 4, !dbg !13
  store i32 0, ptr %count, align 4, !dbg !11
  store i32 1, ptr %i, align 4, !dbg !9
  br label %for.cond, !dbg !9

for.cond:                                         ; preds = %for.update, %entry
  %2 = load i32, ptr %i, align 4, !dbg !9
  %3 = load i32, ptr %maxRange, align 4, !dbg !9
  %4 = icmp sle i32 %2, %3, !dbg !9
  br i1 %4, label %for.loop, label %for.end, !dbg !9

for.loop:                                         ; preds = %for.cond
  %5 = load i32, ptr %i, align 4, !dbg !15
  %6 = load i32, ptr %smallRange, align 4, !dbg !15
  %7 = icmp sgt i32 %5, %6, !dbg !15
  br i1 %7, label %then, label %else, !dbg !15

then:                                             ; preds = %for.loop
  br label %for.end, !dbg !17

else:                                             ; preds = %for.loop
  br label %if.end, !dbg !17

if.end:                                           ; preds = %else
  %8 = load i32, ptr %count, align 4, !dbg !19
  %9 = add i32 %8, 1, !dbg !19
  store i32 %9, ptr %count, align 4, !dbg !19
  %10 = load i32, ptr %count, align 4, !dbg !19
  br label %for.update, !dbg !19

for.update:                                       ; preds = %if.end
  %11 = load i32, ptr %i, align 4, !dbg !19
  %12 = add i32 %11, 1, !dbg !19
  store i32 %12, ptr %i, align 4, !dbg !19
  %13 = load i32, ptr %i, align 4, !dbg !19
  br label %for.cond, !dbg !19

for.end:                                          ; preds = %then, %for.cond
  %14 = load i32, ptr %count, align 4, !dbg !20
  ret i32 %14, !dbg !20
}

define i32 @countNumber2(i32 %0, i32 %1) !dbg !21 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !22, !DIExpression(), !23)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !24, !DIExpression(), !25)
  %smallRange = alloca i32, align 4
    #dbg_declare(ptr %smallRange, !26, !DIExpression(), !27)
  %maxRange = alloca i32, align 4
    #dbg_declare(ptr %maxRange, !28, !DIExpression(), !27)
  store i32 %0, ptr %maxRange, align 4, !dbg !27
  store i32 %1, ptr %smallRange, align 4, !dbg !27
  store i32 0, ptr %count, align 4, !dbg !25
  store i32 1, ptr %i, align 4, !dbg !23
  br label %while.cond, !dbg !29

while.cond:                                       ; preds = %if.end, %entry
  %2 = load i32, ptr %i, align 4, !dbg !29
  %3 = load i32, ptr %maxRange, align 4, !dbg !29
  %4 = icmp sle i32 %2, %3, !dbg !29
  br i1 %4, label %while.loop, label %while.end, !dbg !29

while.loop:                                       ; preds = %while.cond
  %5 = load i32, ptr %i, align 4, !dbg !30
  %6 = load i32, ptr %smallRange, align 4, !dbg !30
  %7 = icmp sgt i32 %5, %6, !dbg !30
  br i1 %7, label %then, label %else, !dbg !30

then:                                             ; preds = %while.loop
  br label %while.end, !dbg !32

else:                                             ; preds = %while.loop
  br label %if.end, !dbg !32

if.end:                                           ; preds = %else
  %8 = load i32, ptr %count, align 4, !dbg !34
  %9 = add i32 %8, 1, !dbg !34
  store i32 %9, ptr %count, align 4, !dbg !34
  %10 = load i32, ptr %count, align 4, !dbg !34
  %11 = load i32, ptr %i, align 4, !dbg !35
  %12 = add i32 %11, 1, !dbg !35
  store i32 %12, ptr %i, align 4, !dbg !35
  %13 = load i32, ptr %i, align 4, !dbg !35
  br label %while.cond, !dbg !35

while.end:                                        ; preds = %then, %while.cond
  %14 = load i32, ptr %count, align 4, !dbg !36
  ret i32 %14, !dbg !36
}

define i32 @countNumber3(i32 %0, i32 %1) !dbg !37 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !38, !DIExpression(), !39)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !40, !DIExpression(), !41)
  %smallRange = alloca i32, align 4
    #dbg_declare(ptr %smallRange, !42, !DIExpression(), !43)
  %maxRange = alloca i32, align 4
    #dbg_declare(ptr %maxRange, !44, !DIExpression(), !43)
  store i32 %0, ptr %maxRange, align 4, !dbg !43
  store i32 %1, ptr %smallRange, align 4, !dbg !43
  store i32 0, ptr %count, align 4, !dbg !41
  store i32 1, ptr %i, align 4, !dbg !39
  br label %do.loop, !dbg !45

do.loop:                                          ; preds = %do.cond, %entry
  %2 = load i32, ptr %i, align 4, !dbg !46
  %3 = load i32, ptr %smallRange, align 4, !dbg !46
  %4 = icmp sgt i32 %2, %3, !dbg !46
  br i1 %4, label %then, label %else, !dbg !46

then:                                             ; preds = %do.loop
  br label %do.end, !dbg !48

else:                                             ; preds = %do.loop
  br label %if.end, !dbg !48

if.end:                                           ; preds = %else
  %5 = load i32, ptr %count, align 4, !dbg !50
  %6 = add i32 %5, 1, !dbg !50
  store i32 %6, ptr %count, align 4, !dbg !50
  %7 = load i32, ptr %count, align 4, !dbg !50
  %8 = load i32, ptr %i, align 4, !dbg !51
  %9 = add i32 %8, 1, !dbg !51
  store i32 %9, ptr %i, align 4, !dbg !51
  %10 = load i32, ptr %i, align 4, !dbg !51
  br label %do.cond, !dbg !51

do.cond:                                          ; preds = %if.end
  %11 = load i32, ptr %i, align 4, !dbg !51
  %12 = load i32, ptr %maxRange, align 4, !dbg !51
  %13 = icmp sle i32 %11, %12, !dbg !51
  br i1 %13, label %do.loop, label %do.end, !dbg !51

do.end:                                           ; preds = %do.cond, %then
  %14 = load i32, ptr %count, align 4, !dbg !52
  ret i32 %14, !dbg !52
}

define i32 @main() !dbg !53 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !56, !DIExpression(), !57)
  store i32 0, ptr %err, align 4, !dbg !57
  %0 = call i32 @countNumber(i32 100, i32 37), !dbg !58
  %1 = icmp ne i32 %0, 37, !dbg !58
  br i1 %1, label %then, label %else, !dbg !58

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !59
  %2 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end, !dbg !59

else:                                             ; preds = %entry
  br label %if.end, !dbg !59

if.end:                                           ; preds = %else, %then
  %3 = call i32 @countNumber2(i32 100, i32 37), !dbg !60
  %4 = icmp ne i32 %3, 37, !dbg !60
  br i1 %4, label %then1, label %else2, !dbg !60

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !61
  %5 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end3, !dbg !61

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !61

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @countNumber3(i32 100, i32 37), !dbg !62
  %7 = icmp ne i32 %6, 37, !dbg !62
  br i1 %7, label %then4, label %else5, !dbg !62

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !63
  %8 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end6, !dbg !63

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !63

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @countNumber(i32 10, i32 10), !dbg !64
  %10 = icmp ne i32 %9, 10, !dbg !64
  br i1 %10, label %then7, label %else8, !dbg !64

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !65
  %11 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end9, !dbg !65

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !65

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @countNumber2(i32 10, i32 10), !dbg !66
  %13 = icmp ne i32 %12, 10, !dbg !66
  br i1 %13, label %then10, label %else11, !dbg !66

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !67
  %14 = load i32, ptr %err, align 4, !dbg !67
  br label %if.end12, !dbg !67

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !67

if.end12:                                         ; preds = %else11, %then10
  %15 = call i32 @countNumber3(i32 10, i32 10), !dbg !68
  %16 = icmp ne i32 %15, 10, !dbg !68
  br i1 %16, label %then13, label %else14, !dbg !68

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !69
  %17 = load i32, ptr %err, align 4, !dbg !69
  br label %if.end15, !dbg !69

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !69

if.end15:                                         ; preds = %else14, %then13
  %18 = call i32 @countNumber(i32 5, i32 0), !dbg !70
  %19 = icmp ne i32 %18, 0, !dbg !70
  br i1 %19, label %then16, label %else17, !dbg !70

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !71
  %20 = load i32, ptr %err, align 4, !dbg !71
  br label %if.end18, !dbg !71

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !71

if.end18:                                         ; preds = %else17, %then16
  %21 = call i32 @countNumber2(i32 5, i32 0), !dbg !72
  %22 = icmp ne i32 %21, 0, !dbg !72
  br i1 %22, label %then19, label %else20, !dbg !72

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !73
  %23 = load i32, ptr %err, align 4, !dbg !73
  br label %if.end21, !dbg !73

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !73

if.end21:                                         ; preds = %else20, %then19
  %24 = call i32 @countNumber3(i32 5, i32 0), !dbg !74
  %25 = icmp ne i32 %24, 0, !dbg !74
  br i1 %25, label %then22, label %else23, !dbg !74

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !75
  %26 = load i32, ptr %err, align 4, !dbg !75
  br label %if.end24, !dbg !75

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !75

if.end24:                                         ; preds = %else23, %then22
  %27 = load i32, ptr %err, align 4, !dbg !76
  %28 = icmp eq i32 %27, 0, !dbg !76
  br i1 %28, label %then25, label %else26, !dbg !76

then25:                                           ; preds = %if.end24
  %29 = call i32 (ptr, ...) @printf(ptr @0), !dbg !77
  br label %if.end27, !dbg !77

else26:                                           ; preds = %if.end24
  %30 = call i32 (ptr, ...) @printf(ptr @1), !dbg !79
  br label %if.end27, !dbg !79

if.end27:                                         ; preds = %else26, %then25
  %31 = load i32, ptr %err, align 4, !dbg !81
  ret i32 %31, !dbg !81
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "22.break.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "countNumber", linkageName: "countNumber", scope: null, file: !3, line: 5, type: !5, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "i", scope: !4, file: !3, line: 7, type: !7)
!9 = !DILocation(line: 7, column: 8, scope: !4)
!10 = !DILocalVariable(name: "count", scope: !4, file: !3, line: 6, type: !7)
!11 = !DILocation(line: 6, column: 3, scope: !4)
!12 = !DILocalVariable(name: "smallRange", arg: 2, scope: !4, file: !3, line: 5, type: !7)
!13 = !DILocation(line: 5, column: 5, scope: !4)
!14 = !DILocalVariable(name: "maxRange", arg: 1, scope: !4, file: !3, line: 5, type: !7)
!15 = !DILocation(line: 8, column: 5, scope: !16)
!16 = distinct !DILexicalBlock(scope: !4, file: !3, line: 7, column: 42)
!17 = !DILocation(line: 9, column: 7, scope: !18)
!18 = distinct !DILexicalBlock(scope: !16, file: !3, line: 8, column: 25)
!19 = !DILocation(line: 11, column: 5, scope: !16)
!20 = !DILocation(line: 13, column: 3, scope: !4)
!21 = distinct !DISubprogram(name: "countNumber2", linkageName: "countNumber2", scope: null, file: !3, line: 16, type: !5, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !2)
!22 = !DILocalVariable(name: "i", scope: !21, file: !3, line: 18, type: !7)
!23 = !DILocation(line: 18, column: 3, scope: !21)
!24 = !DILocalVariable(name: "count", scope: !21, file: !3, line: 17, type: !7)
!25 = !DILocation(line: 17, column: 3, scope: !21)
!26 = !DILocalVariable(name: "smallRange", arg: 2, scope: !21, file: !3, line: 16, type: !7)
!27 = !DILocation(line: 16, column: 5, scope: !21)
!28 = !DILocalVariable(name: "maxRange", arg: 1, scope: !21, file: !3, line: 16, type: !7)
!29 = !DILocation(line: 19, column: 3, scope: !21)
!30 = !DILocation(line: 20, column: 5, scope: !31)
!31 = distinct !DILexicalBlock(scope: !21, file: !3, line: 19, column: 25)
!32 = !DILocation(line: 21, column: 7, scope: !33)
!33 = distinct !DILexicalBlock(scope: !31, file: !3, line: 20, column: 25)
!34 = !DILocation(line: 23, column: 5, scope: !31)
!35 = !DILocation(line: 24, column: 5, scope: !31)
!36 = !DILocation(line: 26, column: 3, scope: !21)
!37 = distinct !DISubprogram(name: "countNumber3", linkageName: "countNumber3", scope: null, file: !3, line: 29, type: !5, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2)
!38 = !DILocalVariable(name: "i", scope: !37, file: !3, line: 31, type: !7)
!39 = !DILocation(line: 31, column: 3, scope: !37)
!40 = !DILocalVariable(name: "count", scope: !37, file: !3, line: 30, type: !7)
!41 = !DILocation(line: 30, column: 3, scope: !37)
!42 = !DILocalVariable(name: "smallRange", arg: 2, scope: !37, file: !3, line: 29, type: !7)
!43 = !DILocation(line: 29, column: 5, scope: !37)
!44 = !DILocalVariable(name: "maxRange", arg: 1, scope: !37, file: !3, line: 29, type: !7)
!45 = !DILocation(line: 32, column: 3, scope: !37)
!46 = !DILocation(line: 33, column: 5, scope: !47)
!47 = distinct !DILexicalBlock(scope: !37, file: !3, line: 32, column: 6)
!48 = !DILocation(line: 34, column: 7, scope: !49)
!49 = distinct !DILexicalBlock(scope: !47, file: !3, line: 33, column: 25)
!50 = !DILocation(line: 36, column: 5, scope: !47)
!51 = !DILocation(line: 37, column: 5, scope: !47)
!52 = !DILocation(line: 39, column: 3, scope: !37)
!53 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 42, type: !54, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!7}
!56 = !DILocalVariable(name: "err", scope: !53, file: !3, line: 43, type: !7)
!57 = !DILocation(line: 43, column: 3, scope: !53)
!58 = !DILocation(line: 45, column: 3, scope: !53)
!59 = !DILocation(line: 45, column: 35, scope: !53)
!60 = !DILocation(line: 46, column: 3, scope: !53)
!61 = !DILocation(line: 46, column: 36, scope: !53)
!62 = !DILocation(line: 47, column: 3, scope: !53)
!63 = !DILocation(line: 47, column: 36, scope: !53)
!64 = !DILocation(line: 48, column: 3, scope: !53)
!65 = !DILocation(line: 48, column: 34, scope: !53)
!66 = !DILocation(line: 49, column: 3, scope: !53)
!67 = !DILocation(line: 49, column: 35, scope: !53)
!68 = !DILocation(line: 50, column: 3, scope: !53)
!69 = !DILocation(line: 50, column: 35, scope: !53)
!70 = !DILocation(line: 51, column: 3, scope: !53)
!71 = !DILocation(line: 51, column: 31, scope: !53)
!72 = !DILocation(line: 52, column: 3, scope: !53)
!73 = !DILocation(line: 52, column: 32, scope: !53)
!74 = !DILocation(line: 53, column: 3, scope: !53)
!75 = !DILocation(line: 53, column: 32, scope: !53)
!76 = !DILocation(line: 55, column: 3, scope: !53)
!77 = !DILocation(line: 56, column: 5, scope: !78)
!78 = distinct !DILexicalBlock(scope: !53, file: !3, line: 55, column: 17)
!79 = !DILocation(line: 58, column: 5, scope: !80)
!80 = distinct !DILexicalBlock(scope: !53, file: !3, line: 57, column: 10)
!81 = !DILocation(line: 60, column: 3, scope: !53)
