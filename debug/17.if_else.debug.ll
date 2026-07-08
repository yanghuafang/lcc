; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [19 x i8] c"17.if_else.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"17.if_else.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @accumulateFlags(i32 %0) !dbg !4 {
entry:
  %flags = alloca i32, align 4
    #dbg_declare(ptr %flags, !9, !DIExpression(), !10)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !11, !DIExpression(), !12)
  store i32 %0, ptr %n, align 4, !dbg !12
  store i32 0, ptr %flags, align 4, !dbg !10
  %1 = load i32, ptr %n, align 4, !dbg !13
  %2 = icmp slt i32 %1, 0, !dbg !13
  br i1 %2, label %then, label %if.end, !dbg !13

then:                                             ; preds = %entry
  %3 = load i32, ptr %flags, align 4, !dbg !14
  %4 = add i32 %3, 1, !dbg !14
  store i32 %4, ptr %flags, align 4, !dbg !14
  %5 = load i32, ptr %flags, align 4, !dbg !14
  br label %if.end, !dbg !14

if.end:                                           ; preds = %entry, %then
  %6 = load i32, ptr %n, align 4, !dbg !16
  %7 = icmp eq i32 %6, 0, !dbg !16
  %8 = load i32, ptr %flags, align 4, !dbg !17
  %. = select i1 %7, i32 2, i32 4, !dbg !17
  %9 = add i32 %8, %., !dbg !17
  store i32 %9, ptr %flags, align 4, !dbg !17
  %10 = load i32, ptr %flags, align 4, !dbg !17
  %11 = load i32, ptr %n, align 4, !dbg !18
  %12 = icmp sgt i32 %11, 10, !dbg !18
  br i1 %12, label %then4, label %if.end6, !dbg !18

then4:                                            ; preds = %if.end
  %13 = load i32, ptr %flags, align 4, !dbg !19
  %14 = add i32 %13, 8, !dbg !19
  store i32 %14, ptr %flags, align 4, !dbg !19
  %15 = load i32, ptr %flags, align 4, !dbg !19
  br label %if.end6, !dbg !19

if.end6:                                          ; preds = %if.end, %then4
  %16 = load i32, ptr %flags, align 4, !dbg !21
  ret i32 %16, !dbg !21
}

define i32 @signBucket(i32 %0) !dbg !22 {
entry:
  %bucket = alloca i32, align 4
    #dbg_declare(ptr %bucket, !23, !DIExpression(), !24)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !25, !DIExpression(), !26)
  store i32 %0, ptr %n, align 4, !dbg !26
  %1 = load i32, ptr %n, align 4, !dbg !27
  %2 = icmp slt i32 %1, 0, !dbg !27
  %3 = load i32, ptr %n, align 4, !dbg !27
  %4 = icmp eq i32 %3, 0, !dbg !27
  %. = select i1 %4, i32 2, i32 3, !dbg !27
  %.sink.sink = select i1 %2, i32 1, i32 %., !dbg !27
  store i32 %.sink.sink, ptr %bucket, align 4, !dbg !28
  %5 = load i32, ptr %bucket, align 4, !dbg !28
  %6 = load i32, ptr %bucket, align 4, !dbg !29
  ret i32 %6, !dbg !29
}

define i32 @decadeBucket(i32 %0) !dbg !30 {
entry:
  %bucket = alloca i32, align 4
    #dbg_declare(ptr %bucket, !31, !DIExpression(), !32)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !33, !DIExpression(), !34)
  store i32 %0, ptr %n, align 4, !dbg !34
  %1 = load i32, ptr %n, align 4, !dbg !35
  %2 = icmp sle i32 %1, 9, !dbg !35
  br i1 %2, label %if.end6, label %else, !dbg !35

else:                                             ; preds = %entry
  %3 = load i32, ptr %n, align 4, !dbg !36
  %4 = icmp sle i32 %3, 19, !dbg !36
  %5 = load i32, ptr %n, align 4, !dbg !36
  %6 = icmp sle i32 %5, 29, !dbg !36
  %. = select i1 %6, i32 2, i32 3, !dbg !36
  %.sink.sink = select i1 %4, i32 1, i32 %., !dbg !36
  br label %if.end6, !dbg !37

if.end6:                                          ; preds = %entry, %else
  %.sink.sink.sink = phi i32 [ %.sink.sink, %else ], [ 0, %entry ]
  store i32 %.sink.sink.sink, ptr %bucket, align 4, !dbg !39
  %7 = load i32, ptr %bucket, align 4, !dbg !39
  %8 = load i32, ptr %bucket, align 4, !dbg !40
  ret i32 %8, !dbg !40
}

define i32 @main() !dbg !41 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !44, !DIExpression(), !45)
  store i32 0, ptr %err, align 4, !dbg !45
  %0 = call i32 @accumulateFlags(i32 -5), !dbg !46
  %1 = icmp ne i32 %0, 5, !dbg !46
  br i1 %1, label %then, label %if.end, !dbg !46

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !47
  %2 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end, !dbg !47

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @accumulateFlags(i32 0), !dbg !48
  %4 = icmp ne i32 %3, 2, !dbg !48
  br i1 %4, label %then1, label %if.end3, !dbg !48

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !49
  %5 = load i32, ptr %err, align 4, !dbg !49
  br label %if.end3, !dbg !49

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @accumulateFlags(i32 5), !dbg !50
  %7 = icmp ne i32 %6, 4, !dbg !50
  br i1 %7, label %then4, label %if.end6, !dbg !50

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !51
  %8 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end6, !dbg !51

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @accumulateFlags(i32 15), !dbg !52
  %10 = icmp ne i32 %9, 12, !dbg !52
  br i1 %10, label %then7, label %if.end9, !dbg !52

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !53
  %11 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end9, !dbg !53

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @signBucket(i32 -1), !dbg !54
  %13 = icmp ne i32 %12, 1, !dbg !54
  br i1 %13, label %then10, label %if.end12, !dbg !54

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !55
  %14 = load i32, ptr %err, align 4, !dbg !55
  br label %if.end12, !dbg !55

if.end12:                                         ; preds = %if.end9, %then10
  %15 = call i32 @signBucket(i32 0), !dbg !56
  %16 = icmp ne i32 %15, 2, !dbg !56
  br i1 %16, label %then13, label %if.end15, !dbg !56

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !57
  %17 = load i32, ptr %err, align 4, !dbg !57
  br label %if.end15, !dbg !57

if.end15:                                         ; preds = %if.end12, %then13
  %18 = call i32 @signBucket(i32 7), !dbg !58
  %19 = icmp ne i32 %18, 3, !dbg !58
  br i1 %19, label %then16, label %if.end18, !dbg !58

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !59
  %20 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end18, !dbg !59

if.end18:                                         ; preds = %if.end15, %then16
  %21 = call i32 @decadeBucket(i32 5), !dbg !60
  %22 = icmp ne i32 %21, 0, !dbg !60
  br i1 %22, label %then19, label %if.end21, !dbg !60

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !61
  %23 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end21, !dbg !61

if.end21:                                         ; preds = %if.end18, %then19
  %24 = call i32 @decadeBucket(i32 15), !dbg !62
  %25 = icmp ne i32 %24, 1, !dbg !62
  br i1 %25, label %then22, label %if.end24, !dbg !62

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !63
  %26 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end24, !dbg !63

if.end24:                                         ; preds = %if.end21, %then22
  %27 = call i32 @decadeBucket(i32 25), !dbg !64
  %28 = icmp ne i32 %27, 2, !dbg !64
  br i1 %28, label %then25, label %if.end27, !dbg !64

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !65
  %29 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end27, !dbg !65

if.end27:                                         ; preds = %if.end24, %then25
  %30 = call i32 @decadeBucket(i32 35), !dbg !66
  %31 = icmp ne i32 %30, 3, !dbg !66
  br i1 %31, label %then28, label %if.end30, !dbg !66

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !67
  %32 = load i32, ptr %err, align 4, !dbg !67
  br label %if.end30, !dbg !67

if.end30:                                         ; preds = %if.end27, %then28
  %33 = load i32, ptr %err, align 4, !dbg !68
  %34 = icmp eq i32 %33, 0, !dbg !68
  %. = select i1 %34, ptr @0, ptr @1, !dbg !69
  %35 = call i32 (ptr, ...) @printf(ptr %.), !dbg !69
  %36 = load i32, ptr %err, align 4, !dbg !70
  ret i32 %36, !dbg !70
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "17.if_else.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "accumulateFlags", linkageName: "accumulateFlags", scope: null, file: !1, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "flags", scope: !4, file: !1, line: 5, type: !7)
!10 = !DILocation(line: 5, column: 3, scope: !4)
!11 = !DILocalVariable(name: "n", arg: 1, scope: !4, file: !1, line: 4, type: !7)
!12 = !DILocation(line: 4, column: 5, scope: !4)
!13 = !DILocation(line: 6, column: 3, scope: !4)
!14 = !DILocation(line: 7, column: 5, scope: !15)
!15 = distinct !DILexicalBlock(scope: !4, file: !1, line: 6, column: 14)
!16 = !DILocation(line: 9, column: 3, scope: !4)
!17 = !DILocation(line: 0, scope: !4)
!18 = !DILocation(line: 14, column: 3, scope: !4)
!19 = !DILocation(line: 15, column: 5, scope: !20)
!20 = distinct !DILexicalBlock(scope: !4, file: !1, line: 14, column: 15)
!21 = !DILocation(line: 17, column: 3, scope: !4)
!22 = distinct !DISubprogram(name: "signBucket", linkageName: "signBucket", scope: null, file: !1, line: 21, type: !5, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!23 = !DILocalVariable(name: "bucket", scope: !22, file: !1, line: 22, type: !7)
!24 = !DILocation(line: 22, column: 3, scope: !22)
!25 = !DILocalVariable(name: "n", arg: 1, scope: !22, file: !1, line: 21, type: !7)
!26 = !DILocation(line: 21, column: 5, scope: !22)
!27 = !DILocation(line: 23, column: 3, scope: !22)
!28 = !DILocation(line: 0, scope: !22)
!29 = !DILocation(line: 30, column: 3, scope: !22)
!30 = distinct !DISubprogram(name: "decadeBucket", linkageName: "decadeBucket", scope: null, file: !1, line: 34, type: !5, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!31 = !DILocalVariable(name: "bucket", scope: !30, file: !1, line: 35, type: !7)
!32 = !DILocation(line: 35, column: 3, scope: !30)
!33 = !DILocalVariable(name: "n", arg: 1, scope: !30, file: !1, line: 34, type: !7)
!34 = !DILocation(line: 34, column: 5, scope: !30)
!35 = !DILocation(line: 36, column: 3, scope: !30)
!36 = !DILocation(line: 38, column: 10, scope: !30)
!37 = !DILocation(line: 43, column: 5, scope: !38)
!38 = distinct !DILexicalBlock(scope: !30, file: !1, line: 42, column: 10)
!39 = !DILocation(line: 0, scope: !30)
!40 = !DILocation(line: 45, column: 3, scope: !30)
!41 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 48, type: !42, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!42 = !DISubroutineType(types: !43)
!43 = !{!7}
!44 = !DILocalVariable(name: "err", scope: !41, file: !1, line: 49, type: !7)
!45 = !DILocation(line: 49, column: 3, scope: !41)
!46 = !DILocation(line: 51, column: 3, scope: !41)
!47 = !DILocation(line: 51, column: 33, scope: !41)
!48 = !DILocation(line: 52, column: 3, scope: !41)
!49 = !DILocation(line: 52, column: 32, scope: !41)
!50 = !DILocation(line: 53, column: 3, scope: !41)
!51 = !DILocation(line: 53, column: 32, scope: !41)
!52 = !DILocation(line: 54, column: 3, scope: !41)
!53 = !DILocation(line: 54, column: 34, scope: !41)
!54 = !DILocation(line: 56, column: 3, scope: !41)
!55 = !DILocation(line: 56, column: 28, scope: !41)
!56 = !DILocation(line: 57, column: 3, scope: !41)
!57 = !DILocation(line: 57, column: 27, scope: !41)
!58 = !DILocation(line: 58, column: 3, scope: !41)
!59 = !DILocation(line: 58, column: 27, scope: !41)
!60 = !DILocation(line: 60, column: 3, scope: !41)
!61 = !DILocation(line: 60, column: 29, scope: !41)
!62 = !DILocation(line: 61, column: 3, scope: !41)
!63 = !DILocation(line: 61, column: 30, scope: !41)
!64 = !DILocation(line: 62, column: 3, scope: !41)
!65 = !DILocation(line: 62, column: 30, scope: !41)
!66 = !DILocation(line: 63, column: 3, scope: !41)
!67 = !DILocation(line: 63, column: 30, scope: !41)
!68 = !DILocation(line: 65, column: 3, scope: !41)
!69 = !DILocation(line: 0, scope: !41)
!70 = !DILocation(line: 70, column: 3, scope: !41)
