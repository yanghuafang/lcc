; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

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

for.cond:                                         ; preds = %if.end, %entry
  %2 = load i32, ptr %i, align 4, !dbg !10
  %3 = load i32, ptr %maxRange, align 4, !dbg !10
  %4 = icmp sle i32 %2, %3, !dbg !10
  br i1 %4, label %for.loop, label %for.end, !dbg !10

for.loop:                                         ; preds = %for.cond
  %5 = load i32, ptr %i, align 4, !dbg !16
  %6 = load i32, ptr %smallRange, align 4, !dbg !16
  %7 = icmp sgt i32 %5, %6, !dbg !16
  br i1 %7, label %for.end, label %if.end, !dbg !16

if.end:                                           ; preds = %for.loop
  %8 = load i32, ptr %count, align 4, !dbg !18
  %9 = add i32 %8, 1, !dbg !18
  store i32 %9, ptr %count, align 4, !dbg !18
  %10 = load i32, ptr %count, align 4, !dbg !18
  %11 = load i32, ptr %i, align 4, !dbg !18
  %12 = add i32 %11, 1, !dbg !18
  store i32 %12, ptr %i, align 4, !dbg !18
  %13 = load i32, ptr %i, align 4, !dbg !18
  br label %for.cond, !dbg !18

for.end:                                          ; preds = %for.loop, %for.cond
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
  br i1 %7, label %while.end, label %if.end, !dbg !29

if.end:                                           ; preds = %while.loop
  %8 = load i32, ptr %count, align 4, !dbg !31
  %9 = add i32 %8, 1, !dbg !31
  store i32 %9, ptr %count, align 4, !dbg !31
  %10 = load i32, ptr %count, align 4, !dbg !31
  %11 = load i32, ptr %i, align 4, !dbg !32
  %12 = add i32 %11, 1, !dbg !32
  store i32 %12, ptr %i, align 4, !dbg !32
  %13 = load i32, ptr %i, align 4, !dbg !32
  br label %while.cond, !dbg !32

while.end:                                        ; preds = %while.loop, %while.cond
  %14 = load i32, ptr %count, align 4, !dbg !33
  ret i32 %14, !dbg !33
}

define i32 @countNumber3(i32 %0, i32 %1) !dbg !34 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !35, !DIExpression(), !36)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !37, !DIExpression(), !38)
  %smallRange = alloca i32, align 4
    #dbg_declare(ptr %smallRange, !39, !DIExpression(), !40)
  %maxRange = alloca i32, align 4
    #dbg_declare(ptr %maxRange, !41, !DIExpression(), !40)
  store i32 %0, ptr %maxRange, align 4, !dbg !40
  store i32 %1, ptr %smallRange, align 4, !dbg !40
  store i32 0, ptr %count, align 4, !dbg !38
  store i32 1, ptr %i, align 4, !dbg !36
  br label %do.loop, !dbg !42

do.loop:                                          ; preds = %if.end, %entry
  %2 = load i32, ptr %i, align 4, !dbg !43
  %3 = load i32, ptr %smallRange, align 4, !dbg !43
  %4 = icmp sgt i32 %2, %3, !dbg !43
  br i1 %4, label %do.end, label %if.end, !dbg !43

if.end:                                           ; preds = %do.loop
  %5 = load i32, ptr %count, align 4, !dbg !45
  %6 = add i32 %5, 1, !dbg !45
  store i32 %6, ptr %count, align 4, !dbg !45
  %7 = load i32, ptr %count, align 4, !dbg !45
  %8 = load i32, ptr %i, align 4, !dbg !46
  %9 = add i32 %8, 1, !dbg !46
  store i32 %9, ptr %i, align 4, !dbg !46
  %10 = load i32, ptr %i, align 4, !dbg !46
  %11 = load i32, ptr %i, align 4, !dbg !46
  %12 = load i32, ptr %maxRange, align 4, !dbg !46
  %13 = icmp sle i32 %11, %12, !dbg !46
  br i1 %13, label %do.loop, label %do.end, !dbg !46

do.end:                                           ; preds = %do.loop, %if.end
  %14 = load i32, ptr %count, align 4, !dbg !47
  ret i32 %14, !dbg !47
}

define i32 @main() !dbg !48 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !51, !DIExpression(), !52)
  store i32 0, ptr %err, align 4, !dbg !52
  %0 = call i32 @countNumber(i32 100, i32 37), !dbg !53
  %1 = icmp ne i32 %0, 37, !dbg !53
  br i1 %1, label %then, label %if.end, !dbg !53

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !54
  %2 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end, !dbg !54

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @countNumber2(i32 100, i32 37), !dbg !55
  %4 = icmp ne i32 %3, 37, !dbg !55
  br i1 %4, label %then1, label %if.end3, !dbg !55

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !56
  %5 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end3, !dbg !56

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @countNumber3(i32 100, i32 37), !dbg !57
  %7 = icmp ne i32 %6, 37, !dbg !57
  br i1 %7, label %then4, label %if.end6, !dbg !57

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !58
  %8 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end6, !dbg !58

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @countNumber(i32 10, i32 10), !dbg !59
  %10 = icmp ne i32 %9, 10, !dbg !59
  br i1 %10, label %then7, label %if.end9, !dbg !59

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !60
  %11 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end9, !dbg !60

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @countNumber2(i32 10, i32 10), !dbg !61
  %13 = icmp ne i32 %12, 10, !dbg !61
  br i1 %13, label %then10, label %if.end12, !dbg !61

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !62
  %14 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end12, !dbg !62

if.end12:                                         ; preds = %if.end9, %then10
  %15 = call i32 @countNumber3(i32 10, i32 10), !dbg !63
  %16 = icmp ne i32 %15, 10, !dbg !63
  br i1 %16, label %then13, label %if.end15, !dbg !63

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !64
  %17 = load i32, ptr %err, align 4, !dbg !64
  br label %if.end15, !dbg !64

if.end15:                                         ; preds = %if.end12, %then13
  %18 = call i32 @countNumber(i32 5, i32 0), !dbg !65
  %19 = icmp ne i32 %18, 0, !dbg !65
  br i1 %19, label %then16, label %if.end18, !dbg !65

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !66
  %20 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end18, !dbg !66

if.end18:                                         ; preds = %if.end15, %then16
  %21 = call i32 @countNumber2(i32 5, i32 0), !dbg !67
  %22 = icmp ne i32 %21, 0, !dbg !67
  br i1 %22, label %then19, label %if.end21, !dbg !67

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !68
  %23 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end21, !dbg !68

if.end21:                                         ; preds = %if.end18, %then19
  %24 = call i32 @countNumber3(i32 5, i32 0), !dbg !69
  %25 = icmp ne i32 %24, 0, !dbg !69
  br i1 %25, label %then22, label %if.end24, !dbg !69

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !70
  %26 = load i32, ptr %err, align 4, !dbg !70
  br label %if.end24, !dbg !70

if.end24:                                         ; preds = %if.end21, %then22
  %27 = load i32, ptr %err, align 4, !dbg !71
  %28 = icmp eq i32 %27, 0, !dbg !71
  %. = select i1 %28, ptr @0, ptr @1, !dbg !72
  %29 = call i32 (ptr, ...) @printf(ptr %.), !dbg !72
  %30 = load i32, ptr %err, align 4, !dbg !73
  ret i32 %30, !dbg !73
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "22.break.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "countNumber", linkageName: "countNumber", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 5, type: !7)
!10 = !DILocation(line: 5, column: 8, scope: !4)
!11 = !DILocalVariable(name: "count", scope: !4, file: !1, line: 4, type: !7)
!12 = !DILocation(line: 4, column: 3, scope: !4)
!13 = !DILocalVariable(name: "smallRange", arg: 2, scope: !4, file: !1, line: 3, type: !7)
!14 = !DILocation(line: 3, column: 5, scope: !4)
!15 = !DILocalVariable(name: "maxRange", arg: 1, scope: !4, file: !1, line: 3, type: !7)
!16 = !DILocation(line: 6, column: 5, scope: !17)
!17 = distinct !DILexicalBlock(scope: !4, file: !1, line: 5, column: 42)
!18 = !DILocation(line: 9, column: 5, scope: !17)
!19 = !DILocation(line: 11, column: 3, scope: !4)
!20 = distinct !DISubprogram(name: "countNumber2", linkageName: "countNumber2", scope: null, file: !1, line: 14, type: !5, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!21 = !DILocalVariable(name: "i", scope: !20, file: !1, line: 16, type: !7)
!22 = !DILocation(line: 16, column: 3, scope: !20)
!23 = !DILocalVariable(name: "count", scope: !20, file: !1, line: 15, type: !7)
!24 = !DILocation(line: 15, column: 3, scope: !20)
!25 = !DILocalVariable(name: "smallRange", arg: 2, scope: !20, file: !1, line: 14, type: !7)
!26 = !DILocation(line: 14, column: 5, scope: !20)
!27 = !DILocalVariable(name: "maxRange", arg: 1, scope: !20, file: !1, line: 14, type: !7)
!28 = !DILocation(line: 17, column: 3, scope: !20)
!29 = !DILocation(line: 18, column: 5, scope: !30)
!30 = distinct !DILexicalBlock(scope: !20, file: !1, line: 17, column: 25)
!31 = !DILocation(line: 21, column: 5, scope: !30)
!32 = !DILocation(line: 22, column: 5, scope: !30)
!33 = !DILocation(line: 24, column: 3, scope: !20)
!34 = distinct !DISubprogram(name: "countNumber3", linkageName: "countNumber3", scope: null, file: !1, line: 27, type: !5, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!35 = !DILocalVariable(name: "i", scope: !34, file: !1, line: 29, type: !7)
!36 = !DILocation(line: 29, column: 3, scope: !34)
!37 = !DILocalVariable(name: "count", scope: !34, file: !1, line: 28, type: !7)
!38 = !DILocation(line: 28, column: 3, scope: !34)
!39 = !DILocalVariable(name: "smallRange", arg: 2, scope: !34, file: !1, line: 27, type: !7)
!40 = !DILocation(line: 27, column: 5, scope: !34)
!41 = !DILocalVariable(name: "maxRange", arg: 1, scope: !34, file: !1, line: 27, type: !7)
!42 = !DILocation(line: 30, column: 3, scope: !34)
!43 = !DILocation(line: 31, column: 5, scope: !44)
!44 = distinct !DILexicalBlock(scope: !34, file: !1, line: 30, column: 6)
!45 = !DILocation(line: 34, column: 5, scope: !44)
!46 = !DILocation(line: 35, column: 5, scope: !44)
!47 = !DILocation(line: 37, column: 3, scope: !34)
!48 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 40, type: !49, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!49 = !DISubroutineType(types: !50)
!50 = !{!7}
!51 = !DILocalVariable(name: "err", scope: !48, file: !1, line: 41, type: !7)
!52 = !DILocation(line: 41, column: 3, scope: !48)
!53 = !DILocation(line: 43, column: 3, scope: !48)
!54 = !DILocation(line: 43, column: 35, scope: !48)
!55 = !DILocation(line: 44, column: 3, scope: !48)
!56 = !DILocation(line: 44, column: 36, scope: !48)
!57 = !DILocation(line: 45, column: 3, scope: !48)
!58 = !DILocation(line: 45, column: 36, scope: !48)
!59 = !DILocation(line: 46, column: 3, scope: !48)
!60 = !DILocation(line: 46, column: 34, scope: !48)
!61 = !DILocation(line: 47, column: 3, scope: !48)
!62 = !DILocation(line: 47, column: 35, scope: !48)
!63 = !DILocation(line: 48, column: 3, scope: !48)
!64 = !DILocation(line: 48, column: 35, scope: !48)
!65 = !DILocation(line: 49, column: 3, scope: !48)
!66 = !DILocation(line: 49, column: 31, scope: !48)
!67 = !DILocation(line: 50, column: 3, scope: !48)
!68 = !DILocation(line: 50, column: 32, scope: !48)
!69 = !DILocation(line: 51, column: 3, scope: !48)
!70 = !DILocation(line: 51, column: 32, scope: !48)
!71 = !DILocation(line: 53, column: 3, scope: !48)
!72 = !DILocation(line: 0, scope: !48)
!73 = !DILocation(line: 58, column: 3, scope: !48)
