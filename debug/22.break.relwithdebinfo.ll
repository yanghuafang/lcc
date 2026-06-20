; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

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

for.cond:                                         ; preds = %if.end, %entry
  %2 = load i32, ptr %i, align 4, !dbg !8
  %3 = load i32, ptr %maxRange, align 4, !dbg !8
  %4 = icmp sle i32 %2, %3, !dbg !8
  br i1 %4, label %for.loop, label %for.end, !dbg !8

for.loop:                                         ; preds = %for.cond
  %5 = load i32, ptr %i, align 4, !dbg !14
  %6 = load i32, ptr %smallRange, align 4, !dbg !14
  %7 = icmp sgt i32 %5, %6, !dbg !14
  br i1 %7, label %for.end, label %if.end, !dbg !14

if.end:                                           ; preds = %for.loop
  %8 = load i32, ptr %count, align 4, !dbg !16
  %9 = add i32 %8, 1, !dbg !16
  store i32 %9, ptr %count, align 4, !dbg !16
  %10 = load i32, ptr %count, align 4, !dbg !16
  %11 = load i32, ptr %i, align 4, !dbg !16
  %12 = add i32 %11, 1, !dbg !16
  store i32 %12, ptr %i, align 4, !dbg !16
  %13 = load i32, ptr %i, align 4, !dbg !16
  br label %for.cond, !dbg !16

for.end:                                          ; preds = %for.loop, %for.cond
  %14 = load i32, ptr %count, align 4, !dbg !17
  ret i32 %14, !dbg !17
}

define i32 @countNumber2(i32 %0, i32 %1) !dbg !18 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !19, !DIExpression(), !20)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !21, !DIExpression(), !22)
  %smallRange = alloca i32, align 4
    #dbg_declare(ptr %smallRange, !23, !DIExpression(), !24)
  %maxRange = alloca i32, align 4
    #dbg_declare(ptr %maxRange, !25, !DIExpression(), !24)
  store i32 %0, ptr %maxRange, align 4, !dbg !24
  store i32 %1, ptr %smallRange, align 4, !dbg !24
  store i32 0, ptr %count, align 4, !dbg !22
  store i32 1, ptr %i, align 4, !dbg !20
  br label %while.cond, !dbg !26

while.cond:                                       ; preds = %if.end, %entry
  %2 = load i32, ptr %i, align 4, !dbg !26
  %3 = load i32, ptr %maxRange, align 4, !dbg !26
  %4 = icmp sle i32 %2, %3, !dbg !26
  br i1 %4, label %while.loop, label %while.end, !dbg !26

while.loop:                                       ; preds = %while.cond
  %5 = load i32, ptr %i, align 4, !dbg !27
  %6 = load i32, ptr %smallRange, align 4, !dbg !27
  %7 = icmp sgt i32 %5, %6, !dbg !27
  br i1 %7, label %while.end, label %if.end, !dbg !27

if.end:                                           ; preds = %while.loop
  %8 = load i32, ptr %count, align 4, !dbg !29
  %9 = add i32 %8, 1, !dbg !29
  store i32 %9, ptr %count, align 4, !dbg !29
  %10 = load i32, ptr %count, align 4, !dbg !29
  %11 = load i32, ptr %i, align 4, !dbg !30
  %12 = add i32 %11, 1, !dbg !30
  store i32 %12, ptr %i, align 4, !dbg !30
  %13 = load i32, ptr %i, align 4, !dbg !30
  br label %while.cond, !dbg !30

while.end:                                        ; preds = %while.loop, %while.cond
  %14 = load i32, ptr %count, align 4, !dbg !31
  ret i32 %14, !dbg !31
}

define i32 @countNumber3(i32 %0, i32 %1) !dbg !32 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !33, !DIExpression(), !34)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !35, !DIExpression(), !36)
  %smallRange = alloca i32, align 4
    #dbg_declare(ptr %smallRange, !37, !DIExpression(), !38)
  %maxRange = alloca i32, align 4
    #dbg_declare(ptr %maxRange, !39, !DIExpression(), !38)
  store i32 %0, ptr %maxRange, align 4, !dbg !38
  store i32 %1, ptr %smallRange, align 4, !dbg !38
  store i32 0, ptr %count, align 4, !dbg !36
  store i32 1, ptr %i, align 4, !dbg !34
  br label %do.loop, !dbg !40

do.loop:                                          ; preds = %if.end, %entry
  %2 = load i32, ptr %i, align 4, !dbg !41
  %3 = load i32, ptr %smallRange, align 4, !dbg !41
  %4 = icmp sgt i32 %2, %3, !dbg !41
  br i1 %4, label %do.end, label %if.end, !dbg !41

if.end:                                           ; preds = %do.loop
  %5 = load i32, ptr %count, align 4, !dbg !43
  %6 = add i32 %5, 1, !dbg !43
  store i32 %6, ptr %count, align 4, !dbg !43
  %7 = load i32, ptr %count, align 4, !dbg !43
  %8 = load i32, ptr %i, align 4, !dbg !44
  %9 = add i32 %8, 1, !dbg !44
  store i32 %9, ptr %i, align 4, !dbg !44
  %10 = load i32, ptr %i, align 4, !dbg !44
  %11 = load i32, ptr %i, align 4, !dbg !44
  %12 = load i32, ptr %maxRange, align 4, !dbg !44
  %13 = icmp sle i32 %11, %12, !dbg !44
  br i1 %13, label %do.loop, label %do.end, !dbg !44

do.end:                                           ; preds = %do.loop, %if.end
  %14 = load i32, ptr %count, align 4, !dbg !45
  ret i32 %14, !dbg !45
}

define i32 @main() !dbg !46 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !49, !DIExpression(), !50)
  store i32 0, ptr %err, align 4, !dbg !50
  %0 = call i32 @countNumber(i32 100, i32 37), !dbg !51
  %1 = icmp ne i32 %0, 37, !dbg !51
  br i1 %1, label %then, label %if.end, !dbg !51

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !52
  %2 = load i32, ptr %err, align 4, !dbg !52
  br label %if.end, !dbg !52

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @countNumber2(i32 100, i32 37), !dbg !53
  %4 = icmp ne i32 %3, 37, !dbg !53
  br i1 %4, label %then1, label %if.end3, !dbg !53

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !54
  %5 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end3, !dbg !54

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @countNumber3(i32 100, i32 37), !dbg !55
  %7 = icmp ne i32 %6, 37, !dbg !55
  br i1 %7, label %then4, label %if.end6, !dbg !55

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !56
  %8 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end6, !dbg !56

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @countNumber(i32 10, i32 10), !dbg !57
  %10 = icmp ne i32 %9, 10, !dbg !57
  br i1 %10, label %then7, label %if.end9, !dbg !57

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !58
  %11 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end9, !dbg !58

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @countNumber2(i32 10, i32 10), !dbg !59
  %13 = icmp ne i32 %12, 10, !dbg !59
  br i1 %13, label %then10, label %if.end12, !dbg !59

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !60
  %14 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end12, !dbg !60

if.end12:                                         ; preds = %if.end9, %then10
  %15 = call i32 @countNumber3(i32 10, i32 10), !dbg !61
  %16 = icmp ne i32 %15, 10, !dbg !61
  br i1 %16, label %then13, label %if.end15, !dbg !61

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !62
  %17 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end15, !dbg !62

if.end15:                                         ; preds = %if.end12, %then13
  %18 = call i32 @countNumber(i32 5, i32 0), !dbg !63
  %19 = icmp ne i32 %18, 0, !dbg !63
  br i1 %19, label %then16, label %if.end18, !dbg !63

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !64
  %20 = load i32, ptr %err, align 4, !dbg !64
  br label %if.end18, !dbg !64

if.end18:                                         ; preds = %if.end15, %then16
  %21 = call i32 @countNumber2(i32 5, i32 0), !dbg !65
  %22 = icmp ne i32 %21, 0, !dbg !65
  br i1 %22, label %then19, label %if.end21, !dbg !65

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !66
  %23 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end21, !dbg !66

if.end21:                                         ; preds = %if.end18, %then19
  %24 = call i32 @countNumber3(i32 5, i32 0), !dbg !67
  %25 = icmp ne i32 %24, 0, !dbg !67
  br i1 %25, label %then22, label %if.end24, !dbg !67

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !68
  %26 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end24, !dbg !68

if.end24:                                         ; preds = %if.end21, %then22
  %27 = load i32, ptr %err, align 4, !dbg !69
  %28 = icmp eq i32 %27, 0, !dbg !69
  %. = select i1 %28, ptr @0, ptr @1, !dbg !70
  %29 = call i32 (ptr, ...) @printf(ptr %.), !dbg !70
  %30 = load i32, ptr %err, align 4, !dbg !71
  ret i32 %30, !dbg !71
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
!16 = !DILocation(line: 9, column: 5, scope: !15)
!17 = !DILocation(line: 11, column: 3, scope: !2)
!18 = distinct !DISubprogram(name: "countNumber2", linkageName: "countNumber2", scope: null, file: !1, line: 14, type: !3, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!19 = !DILocalVariable(name: "i", scope: !18, file: !1, line: 16, type: !5)
!20 = !DILocation(line: 16, column: 3, scope: !18)
!21 = !DILocalVariable(name: "count", scope: !18, file: !1, line: 15, type: !5)
!22 = !DILocation(line: 15, column: 3, scope: !18)
!23 = !DILocalVariable(name: "smallRange", arg: 2, scope: !18, file: !1, line: 14, type: !5)
!24 = !DILocation(line: 14, column: 5, scope: !18)
!25 = !DILocalVariable(name: "maxRange", arg: 1, scope: !18, file: !1, line: 14, type: !5)
!26 = !DILocation(line: 17, column: 3, scope: !18)
!27 = !DILocation(line: 18, column: 5, scope: !28)
!28 = distinct !DILexicalBlock(scope: !18, file: !1, line: 17, column: 25)
!29 = !DILocation(line: 21, column: 5, scope: !28)
!30 = !DILocation(line: 22, column: 5, scope: !28)
!31 = !DILocation(line: 24, column: 3, scope: !18)
!32 = distinct !DISubprogram(name: "countNumber3", linkageName: "countNumber3", scope: null, file: !1, line: 27, type: !3, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!33 = !DILocalVariable(name: "i", scope: !32, file: !1, line: 29, type: !5)
!34 = !DILocation(line: 29, column: 3, scope: !32)
!35 = !DILocalVariable(name: "count", scope: !32, file: !1, line: 28, type: !5)
!36 = !DILocation(line: 28, column: 3, scope: !32)
!37 = !DILocalVariable(name: "smallRange", arg: 2, scope: !32, file: !1, line: 27, type: !5)
!38 = !DILocation(line: 27, column: 5, scope: !32)
!39 = !DILocalVariable(name: "maxRange", arg: 1, scope: !32, file: !1, line: 27, type: !5)
!40 = !DILocation(line: 30, column: 3, scope: !32)
!41 = !DILocation(line: 31, column: 5, scope: !42)
!42 = distinct !DILexicalBlock(scope: !32, file: !1, line: 30, column: 6)
!43 = !DILocation(line: 34, column: 5, scope: !42)
!44 = !DILocation(line: 35, column: 5, scope: !42)
!45 = !DILocation(line: 37, column: 3, scope: !32)
!46 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 40, type: !47, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!47 = !DISubroutineType(types: !48)
!48 = !{!5}
!49 = !DILocalVariable(name: "err", scope: !46, file: !1, line: 41, type: !5)
!50 = !DILocation(line: 41, column: 3, scope: !46)
!51 = !DILocation(line: 43, column: 3, scope: !46)
!52 = !DILocation(line: 43, column: 35, scope: !46)
!53 = !DILocation(line: 44, column: 3, scope: !46)
!54 = !DILocation(line: 44, column: 36, scope: !46)
!55 = !DILocation(line: 45, column: 3, scope: !46)
!56 = !DILocation(line: 45, column: 36, scope: !46)
!57 = !DILocation(line: 46, column: 3, scope: !46)
!58 = !DILocation(line: 46, column: 34, scope: !46)
!59 = !DILocation(line: 47, column: 3, scope: !46)
!60 = !DILocation(line: 47, column: 35, scope: !46)
!61 = !DILocation(line: 48, column: 3, scope: !46)
!62 = !DILocation(line: 48, column: 35, scope: !46)
!63 = !DILocation(line: 49, column: 3, scope: !46)
!64 = !DILocation(line: 49, column: 31, scope: !46)
!65 = !DILocation(line: 50, column: 3, scope: !46)
!66 = !DILocation(line: 50, column: 32, scope: !46)
!67 = !DILocation(line: 51, column: 3, scope: !46)
!68 = !DILocation(line: 51, column: 32, scope: !46)
!69 = !DILocation(line: 53, column: 3, scope: !46)
!70 = !DILocation(line: 0, scope: !46)
!71 = !DILocation(line: 58, column: 3, scope: !46)
