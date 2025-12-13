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
    #dbg_declare(ptr %i, !9, !DIExpression(), !10)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !11, !DIExpression(), !12)
  %smallRange = alloca i32, align 4
    #dbg_declare(ptr %smallRange, !13, !DIExpression(), !14)
  %maxRange = alloca i32, align 4
    #dbg_declare(ptr %maxRange, !15, !DIExpression(), !14)
  store i32 %0, ptr %maxRange, align 4, !dbg !14
  store i32 %1, ptr %smallRange, align 4, !dbg !14
  store i32 0, ptr %count, align 4, !dbg !12
  store i32 1, ptr %i, align 4, !dbg !10
  br label %for.cond, !dbg !10

for.cond:                                         ; preds = %for.update, %entry
  %2 = load i32, ptr %i, align 4, !dbg !10
  %3 = load i32, ptr %maxRange, align 4, !dbg !10
  %4 = icmp sle i32 %2, %3, !dbg !10
  br i1 %4, label %for.loop, label %for.end, !dbg !10

for.loop:                                         ; preds = %for.cond
  %5 = load i32, ptr %i, align 4, !dbg !16
  %6 = load i32, ptr %smallRange, align 4, !dbg !16
  %7 = icmp sgt i32 %5, %6, !dbg !16
  br i1 %7, label %then, label %else, !dbg !16

then:                                             ; preds = %for.loop
  br label %for.end, !dbg !18

else:                                             ; preds = %for.loop
  br label %if.end, !dbg !18

if.end:                                           ; preds = %else
  %8 = load i32, ptr %count, align 4, !dbg !20
  %9 = add i32 %8, 1, !dbg !20
  store i32 %9, ptr %count, align 4, !dbg !20
  %10 = load i32, ptr %count, align 4, !dbg !20
  br label %for.update, !dbg !20

for.update:                                       ; preds = %if.end
  %11 = load i32, ptr %i, align 4, !dbg !20
  %12 = add i32 %11, 1, !dbg !20
  store i32 %12, ptr %i, align 4, !dbg !20
  %13 = load i32, ptr %i, align 4, !dbg !20
  br label %for.cond, !dbg !20

for.end:                                          ; preds = %then, %for.cond
  %14 = load i32, ptr %count, align 4, !dbg !21
  ret i32 %14, !dbg !21
}

define i32 @countNumber2(i32 %0, i32 %1) !dbg !22 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !23, !DIExpression(), !24)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !25, !DIExpression(), !26)
  %smallRange = alloca i32, align 4
    #dbg_declare(ptr %smallRange, !27, !DIExpression(), !28)
  %maxRange = alloca i32, align 4
    #dbg_declare(ptr %maxRange, !29, !DIExpression(), !28)
  store i32 %0, ptr %maxRange, align 4, !dbg !28
  store i32 %1, ptr %smallRange, align 4, !dbg !28
  store i32 0, ptr %count, align 4, !dbg !26
  store i32 1, ptr %i, align 4, !dbg !24
  br label %while.cond, !dbg !30

while.cond:                                       ; preds = %if.end, %entry
  %2 = load i32, ptr %i, align 4, !dbg !30
  %3 = load i32, ptr %maxRange, align 4, !dbg !30
  %4 = icmp sle i32 %2, %3, !dbg !30
  br i1 %4, label %while.loop, label %while.end, !dbg !30

while.loop:                                       ; preds = %while.cond
  %5 = load i32, ptr %i, align 4, !dbg !31
  %6 = load i32, ptr %smallRange, align 4, !dbg !31
  %7 = icmp sgt i32 %5, %6, !dbg !31
  br i1 %7, label %then, label %else, !dbg !31

then:                                             ; preds = %while.loop
  br label %while.end, !dbg !33

else:                                             ; preds = %while.loop
  br label %if.end, !dbg !33

if.end:                                           ; preds = %else
  %8 = load i32, ptr %count, align 4, !dbg !35
  %9 = add i32 %8, 1, !dbg !35
  store i32 %9, ptr %count, align 4, !dbg !35
  %10 = load i32, ptr %count, align 4, !dbg !35
  %11 = load i32, ptr %i, align 4, !dbg !36
  %12 = add i32 %11, 1, !dbg !36
  store i32 %12, ptr %i, align 4, !dbg !36
  %13 = load i32, ptr %i, align 4, !dbg !36
  br label %while.cond, !dbg !36

while.end:                                        ; preds = %then, %while.cond
  %14 = load i32, ptr %count, align 4, !dbg !37
  ret i32 %14, !dbg !37
}

define i32 @countNumber3(i32 %0, i32 %1) !dbg !38 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !39, !DIExpression(), !40)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !41, !DIExpression(), !42)
  %smallRange = alloca i32, align 4
    #dbg_declare(ptr %smallRange, !43, !DIExpression(), !44)
  %maxRange = alloca i32, align 4
    #dbg_declare(ptr %maxRange, !45, !DIExpression(), !44)
  store i32 %0, ptr %maxRange, align 4, !dbg !44
  store i32 %1, ptr %smallRange, align 4, !dbg !44
  store i32 0, ptr %count, align 4, !dbg !42
  store i32 1, ptr %i, align 4, !dbg !40
  br label %do.loop, !dbg !46

do.loop:                                          ; preds = %do.cond, %entry
  %2 = load i32, ptr %i, align 4, !dbg !47
  %3 = load i32, ptr %smallRange, align 4, !dbg !47
  %4 = icmp sgt i32 %2, %3, !dbg !47
  br i1 %4, label %then, label %else, !dbg !47

then:                                             ; preds = %do.loop
  br label %do.end, !dbg !49

else:                                             ; preds = %do.loop
  br label %if.end, !dbg !49

if.end:                                           ; preds = %else
  %5 = load i32, ptr %count, align 4, !dbg !51
  %6 = add i32 %5, 1, !dbg !51
  store i32 %6, ptr %count, align 4, !dbg !51
  %7 = load i32, ptr %count, align 4, !dbg !51
  %8 = load i32, ptr %i, align 4, !dbg !52
  %9 = add i32 %8, 1, !dbg !52
  store i32 %9, ptr %i, align 4, !dbg !52
  %10 = load i32, ptr %i, align 4, !dbg !52
  br label %do.cond, !dbg !52

do.cond:                                          ; preds = %if.end
  %11 = load i32, ptr %i, align 4, !dbg !52
  %12 = load i32, ptr %maxRange, align 4, !dbg !52
  %13 = icmp sle i32 %11, %12, !dbg !52
  br i1 %13, label %do.loop, label %do.end, !dbg !52

do.end:                                           ; preds = %do.cond, %then
  %14 = load i32, ptr %count, align 4, !dbg !53
  ret i32 %14, !dbg !53
}

define i32 @main() !dbg !54 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !57, !DIExpression(), !58)
  store i32 0, ptr %err, align 4, !dbg !58
  %0 = call i32 @countNumber(i32 100, i32 37), !dbg !59
  %1 = icmp ne i32 %0, 37, !dbg !59
  br i1 %1, label %then, label %else, !dbg !59

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !60
  %2 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end, !dbg !60

else:                                             ; preds = %entry
  br label %if.end, !dbg !60

if.end:                                           ; preds = %else, %then
  %3 = call i32 @countNumber2(i32 100, i32 37), !dbg !61
  %4 = icmp ne i32 %3, 37, !dbg !61
  br i1 %4, label %then1, label %else2, !dbg !61

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !62
  %5 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end3, !dbg !62

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !62

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @countNumber3(i32 100, i32 37), !dbg !63
  %7 = icmp ne i32 %6, 37, !dbg !63
  br i1 %7, label %then4, label %else5, !dbg !63

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !64
  %8 = load i32, ptr %err, align 4, !dbg !64
  br label %if.end6, !dbg !64

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !64

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @countNumber(i32 10, i32 10), !dbg !65
  %10 = icmp ne i32 %9, 10, !dbg !65
  br i1 %10, label %then7, label %else8, !dbg !65

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !66
  %11 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end9, !dbg !66

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !66

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @countNumber2(i32 10, i32 10), !dbg !67
  %13 = icmp ne i32 %12, 10, !dbg !67
  br i1 %13, label %then10, label %else11, !dbg !67

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !68
  %14 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end12, !dbg !68

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !68

if.end12:                                         ; preds = %else11, %then10
  %15 = call i32 @countNumber3(i32 10, i32 10), !dbg !69
  %16 = icmp ne i32 %15, 10, !dbg !69
  br i1 %16, label %then13, label %else14, !dbg !69

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !70
  %17 = load i32, ptr %err, align 4, !dbg !70
  br label %if.end15, !dbg !70

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !70

if.end15:                                         ; preds = %else14, %then13
  %18 = call i32 @countNumber(i32 5, i32 0), !dbg !71
  %19 = icmp ne i32 %18, 0, !dbg !71
  br i1 %19, label %then16, label %else17, !dbg !71

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !72
  %20 = load i32, ptr %err, align 4, !dbg !72
  br label %if.end18, !dbg !72

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !72

if.end18:                                         ; preds = %else17, %then16
  %21 = call i32 @countNumber2(i32 5, i32 0), !dbg !73
  %22 = icmp ne i32 %21, 0, !dbg !73
  br i1 %22, label %then19, label %else20, !dbg !73

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !74
  %23 = load i32, ptr %err, align 4, !dbg !74
  br label %if.end21, !dbg !74

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !74

if.end21:                                         ; preds = %else20, %then19
  %24 = call i32 @countNumber3(i32 5, i32 0), !dbg !75
  %25 = icmp ne i32 %24, 0, !dbg !75
  br i1 %25, label %then22, label %else23, !dbg !75

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !76
  %26 = load i32, ptr %err, align 4, !dbg !76
  br label %if.end24, !dbg !76

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !76

if.end24:                                         ; preds = %else23, %then22
  %27 = load i32, ptr %err, align 4, !dbg !77
  %28 = icmp eq i32 %27, 0, !dbg !77
  br i1 %28, label %then25, label %else26, !dbg !77

then25:                                           ; preds = %if.end24
  %29 = call i32 (ptr, ...) @printf(ptr @0), !dbg !78
  br label %if.end27, !dbg !78

else26:                                           ; preds = %if.end24
  %30 = call i32 (ptr, ...) @printf(ptr @1), !dbg !80
  br label %if.end27, !dbg !80

if.end27:                                         ; preds = %else26, %then25
  %31 = load i32, ptr %err, align 4, !dbg !82
  ret i32 %31, !dbg !82
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "22.break.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "countNumber", linkageName: "countNumber", scope: null, file: !3, line: 5, type: !5, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "i", scope: !4, file: !3, line: 7, type: !7)
!10 = !DILocation(line: 7, column: 8, scope: !4)
!11 = !DILocalVariable(name: "count", scope: !4, file: !3, line: 6, type: !7)
!12 = !DILocation(line: 6, column: 3, scope: !4)
!13 = !DILocalVariable(name: "smallRange", arg: 2, scope: !4, file: !3, line: 5, type: !7)
!14 = !DILocation(line: 5, column: 5, scope: !4)
!15 = !DILocalVariable(name: "maxRange", arg: 1, scope: !4, file: !3, line: 5, type: !7)
!16 = !DILocation(line: 8, column: 5, scope: !17)
!17 = distinct !DILexicalBlock(scope: !4, file: !3, line: 7, column: 42)
!18 = !DILocation(line: 9, column: 7, scope: !19)
!19 = distinct !DILexicalBlock(scope: !17, file: !3, line: 8, column: 25)
!20 = !DILocation(line: 11, column: 5, scope: !17)
!21 = !DILocation(line: 13, column: 3, scope: !4)
!22 = distinct !DISubprogram(name: "countNumber2", linkageName: "countNumber2", scope: null, file: !3, line: 16, type: !5, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!23 = !DILocalVariable(name: "i", scope: !22, file: !3, line: 18, type: !7)
!24 = !DILocation(line: 18, column: 3, scope: !22)
!25 = !DILocalVariable(name: "count", scope: !22, file: !3, line: 17, type: !7)
!26 = !DILocation(line: 17, column: 3, scope: !22)
!27 = !DILocalVariable(name: "smallRange", arg: 2, scope: !22, file: !3, line: 16, type: !7)
!28 = !DILocation(line: 16, column: 5, scope: !22)
!29 = !DILocalVariable(name: "maxRange", arg: 1, scope: !22, file: !3, line: 16, type: !7)
!30 = !DILocation(line: 19, column: 3, scope: !22)
!31 = !DILocation(line: 20, column: 5, scope: !32)
!32 = distinct !DILexicalBlock(scope: !22, file: !3, line: 19, column: 25)
!33 = !DILocation(line: 21, column: 7, scope: !34)
!34 = distinct !DILexicalBlock(scope: !32, file: !3, line: 20, column: 25)
!35 = !DILocation(line: 23, column: 5, scope: !32)
!36 = !DILocation(line: 24, column: 5, scope: !32)
!37 = !DILocation(line: 26, column: 3, scope: !22)
!38 = distinct !DISubprogram(name: "countNumber3", linkageName: "countNumber3", scope: null, file: !3, line: 29, type: !5, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!39 = !DILocalVariable(name: "i", scope: !38, file: !3, line: 31, type: !7)
!40 = !DILocation(line: 31, column: 3, scope: !38)
!41 = !DILocalVariable(name: "count", scope: !38, file: !3, line: 30, type: !7)
!42 = !DILocation(line: 30, column: 3, scope: !38)
!43 = !DILocalVariable(name: "smallRange", arg: 2, scope: !38, file: !3, line: 29, type: !7)
!44 = !DILocation(line: 29, column: 5, scope: !38)
!45 = !DILocalVariable(name: "maxRange", arg: 1, scope: !38, file: !3, line: 29, type: !7)
!46 = !DILocation(line: 32, column: 3, scope: !38)
!47 = !DILocation(line: 33, column: 5, scope: !48)
!48 = distinct !DILexicalBlock(scope: !38, file: !3, line: 32, column: 6)
!49 = !DILocation(line: 34, column: 7, scope: !50)
!50 = distinct !DILexicalBlock(scope: !48, file: !3, line: 33, column: 25)
!51 = !DILocation(line: 36, column: 5, scope: !48)
!52 = !DILocation(line: 37, column: 5, scope: !48)
!53 = !DILocation(line: 39, column: 3, scope: !38)
!54 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 42, type: !55, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!55 = !DISubroutineType(types: !56)
!56 = !{!7}
!57 = !DILocalVariable(name: "err", scope: !54, file: !3, line: 43, type: !7)
!58 = !DILocation(line: 43, column: 3, scope: !54)
!59 = !DILocation(line: 45, column: 3, scope: !54)
!60 = !DILocation(line: 45, column: 35, scope: !54)
!61 = !DILocation(line: 46, column: 3, scope: !54)
!62 = !DILocation(line: 46, column: 36, scope: !54)
!63 = !DILocation(line: 47, column: 3, scope: !54)
!64 = !DILocation(line: 47, column: 36, scope: !54)
!65 = !DILocation(line: 48, column: 3, scope: !54)
!66 = !DILocation(line: 48, column: 34, scope: !54)
!67 = !DILocation(line: 49, column: 3, scope: !54)
!68 = !DILocation(line: 49, column: 35, scope: !54)
!69 = !DILocation(line: 50, column: 3, scope: !54)
!70 = !DILocation(line: 50, column: 35, scope: !54)
!71 = !DILocation(line: 51, column: 3, scope: !54)
!72 = !DILocation(line: 51, column: 31, scope: !54)
!73 = !DILocation(line: 52, column: 3, scope: !54)
!74 = !DILocation(line: 52, column: 32, scope: !54)
!75 = !DILocation(line: 53, column: 3, scope: !54)
!76 = !DILocation(line: 53, column: 32, scope: !54)
!77 = !DILocation(line: 55, column: 3, scope: !54)
!78 = !DILocation(line: 56, column: 5, scope: !79)
!79 = distinct !DILexicalBlock(scope: !54, file: !3, line: 55, column: 17)
!80 = !DILocation(line: 58, column: 5, scope: !81)
!81 = distinct !DILexicalBlock(scope: !54, file: !3, line: 57, column: 10)
!82 = !DILocation(line: 60, column: 3, scope: !54)
