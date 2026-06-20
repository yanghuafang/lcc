; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [19 x i8] c"17.if_else.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"17.if_else.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @accumulateFlags(i32 %0) !dbg !2 {
entry:
  %flags = alloca i32, align 4
    #dbg_declare(ptr %flags, !7, !DIExpression(), !8)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !9, !DIExpression(), !10)
  store i32 %0, ptr %n, align 4, !dbg !10
  store i32 0, ptr %flags, align 4, !dbg !8
  %1 = load i32, ptr %n, align 4, !dbg !11
  %2 = icmp slt i32 %1, 0, !dbg !11
  br i1 %2, label %then, label %if.end, !dbg !11

then:                                             ; preds = %entry
  %3 = load i32, ptr %flags, align 4, !dbg !12
  %4 = add i32 %3, 1, !dbg !12
  store i32 %4, ptr %flags, align 4, !dbg !12
  %5 = load i32, ptr %flags, align 4, !dbg !12
  br label %if.end, !dbg !12

if.end:                                           ; preds = %entry, %then
  %6 = load i32, ptr %n, align 4, !dbg !14
  %7 = icmp eq i32 %6, 0, !dbg !14
  %8 = load i32, ptr %flags, align 4, !dbg !15
  %. = select i1 %7, i32 2, i32 4, !dbg !15
  %9 = add i32 %8, %., !dbg !15
  store i32 %9, ptr %flags, align 4, !dbg !15
  %10 = load i32, ptr %flags, align 4, !dbg !15
  %11 = load i32, ptr %n, align 4, !dbg !16
  %12 = icmp sgt i32 %11, 10, !dbg !16
  br i1 %12, label %then4, label %if.end6, !dbg !16

then4:                                            ; preds = %if.end
  %13 = load i32, ptr %flags, align 4, !dbg !17
  %14 = add i32 %13, 8, !dbg !17
  store i32 %14, ptr %flags, align 4, !dbg !17
  %15 = load i32, ptr %flags, align 4, !dbg !17
  br label %if.end6, !dbg !17

if.end6:                                          ; preds = %if.end, %then4
  %16 = load i32, ptr %flags, align 4, !dbg !19
  ret i32 %16, !dbg !19
}

define i32 @signBucket(i32 %0) !dbg !20 {
entry:
  %bucket = alloca i32, align 4
    #dbg_declare(ptr %bucket, !21, !DIExpression(), !22)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !23, !DIExpression(), !24)
  store i32 %0, ptr %n, align 4, !dbg !24
  %1 = load i32, ptr %n, align 4, !dbg !25
  %2 = icmp slt i32 %1, 0, !dbg !25
  %3 = load i32, ptr %n, align 4, !dbg !25
  %4 = icmp eq i32 %3, 0, !dbg !25
  %. = select i1 %4, i32 2, i32 3, !dbg !25
  %.sink.sink = select i1 %2, i32 1, i32 %., !dbg !25
  store i32 %.sink.sink, ptr %bucket, align 4, !dbg !26
  %5 = load i32, ptr %bucket, align 4, !dbg !26
  %6 = load i32, ptr %bucket, align 4, !dbg !27
  ret i32 %6, !dbg !27
}

define i32 @decadeBucket(i32 %0) !dbg !28 {
entry:
  %bucket = alloca i32, align 4
    #dbg_declare(ptr %bucket, !29, !DIExpression(), !30)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !31, !DIExpression(), !32)
  store i32 %0, ptr %n, align 4, !dbg !32
  %1 = load i32, ptr %n, align 4, !dbg !33
  %2 = icmp sle i32 %1, 9, !dbg !33
  br i1 %2, label %if.end6, label %else, !dbg !33

else:                                             ; preds = %entry
  %3 = load i32, ptr %n, align 4, !dbg !34
  %4 = icmp sle i32 %3, 19, !dbg !34
  %5 = load i32, ptr %n, align 4, !dbg !34
  %6 = icmp sle i32 %5, 29, !dbg !34
  %. = select i1 %6, i32 2, i32 3, !dbg !34
  %.sink.sink = select i1 %4, i32 1, i32 %., !dbg !34
  br label %if.end6, !dbg !35

if.end6:                                          ; preds = %entry, %else
  %.sink.sink.sink = phi i32 [ %.sink.sink, %else ], [ 0, %entry ]
  store i32 %.sink.sink.sink, ptr %bucket, align 4, !dbg !37
  %7 = load i32, ptr %bucket, align 4, !dbg !37
  %8 = load i32, ptr %bucket, align 4, !dbg !38
  ret i32 %8, !dbg !38
}

define i32 @main() !dbg !39 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !42, !DIExpression(), !43)
  store i32 0, ptr %err, align 4, !dbg !43
  %0 = call i32 @accumulateFlags(i32 -5), !dbg !44
  %1 = icmp ne i32 %0, 5, !dbg !44
  br i1 %1, label %then, label %if.end, !dbg !44

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !45
  %2 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end, !dbg !45

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @accumulateFlags(i32 0), !dbg !46
  %4 = icmp ne i32 %3, 2, !dbg !46
  br i1 %4, label %then1, label %if.end3, !dbg !46

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !47
  %5 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end3, !dbg !47

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @accumulateFlags(i32 5), !dbg !48
  %7 = icmp ne i32 %6, 4, !dbg !48
  br i1 %7, label %then4, label %if.end6, !dbg !48

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !49
  %8 = load i32, ptr %err, align 4, !dbg !49
  br label %if.end6, !dbg !49

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @accumulateFlags(i32 15), !dbg !50
  %10 = icmp ne i32 %9, 12, !dbg !50
  br i1 %10, label %then7, label %if.end9, !dbg !50

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !51
  %11 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end9, !dbg !51

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @signBucket(i32 -1), !dbg !52
  %13 = icmp ne i32 %12, 1, !dbg !52
  br i1 %13, label %then10, label %if.end12, !dbg !52

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !53
  %14 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end12, !dbg !53

if.end12:                                         ; preds = %if.end9, %then10
  %15 = call i32 @signBucket(i32 0), !dbg !54
  %16 = icmp ne i32 %15, 2, !dbg !54
  br i1 %16, label %then13, label %if.end15, !dbg !54

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !55
  %17 = load i32, ptr %err, align 4, !dbg !55
  br label %if.end15, !dbg !55

if.end15:                                         ; preds = %if.end12, %then13
  %18 = call i32 @signBucket(i32 7), !dbg !56
  %19 = icmp ne i32 %18, 3, !dbg !56
  br i1 %19, label %then16, label %if.end18, !dbg !56

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !57
  %20 = load i32, ptr %err, align 4, !dbg !57
  br label %if.end18, !dbg !57

if.end18:                                         ; preds = %if.end15, %then16
  %21 = call i32 @decadeBucket(i32 5), !dbg !58
  %22 = icmp ne i32 %21, 0, !dbg !58
  br i1 %22, label %then19, label %if.end21, !dbg !58

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !59
  %23 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end21, !dbg !59

if.end21:                                         ; preds = %if.end18, %then19
  %24 = call i32 @decadeBucket(i32 15), !dbg !60
  %25 = icmp ne i32 %24, 1, !dbg !60
  br i1 %25, label %then22, label %if.end24, !dbg !60

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !61
  %26 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end24, !dbg !61

if.end24:                                         ; preds = %if.end21, %then22
  %27 = call i32 @decadeBucket(i32 25), !dbg !62
  %28 = icmp ne i32 %27, 2, !dbg !62
  br i1 %28, label %then25, label %if.end27, !dbg !62

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !63
  %29 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end27, !dbg !63

if.end27:                                         ; preds = %if.end24, %then25
  %30 = call i32 @decadeBucket(i32 35), !dbg !64
  %31 = icmp ne i32 %30, 3, !dbg !64
  br i1 %31, label %then28, label %if.end30, !dbg !64

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !65
  %32 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end30, !dbg !65

if.end30:                                         ; preds = %if.end27, %then28
  %33 = load i32, ptr %err, align 4, !dbg !66
  %34 = icmp eq i32 %33, 0, !dbg !66
  %. = select i1 %34, ptr @0, ptr @1, !dbg !67
  %35 = call i32 (ptr, ...) @printf(ptr %.), !dbg !67
  %36 = load i32, ptr %err, align 4, !dbg !68
  ret i32 %36, !dbg !68
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "17.if_else.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "accumulateFlags", linkageName: "accumulateFlags", scope: null, file: !1, line: 4, type: !3, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "flags", scope: !2, file: !1, line: 5, type: !5)
!8 = !DILocation(line: 5, column: 3, scope: !2)
!9 = !DILocalVariable(name: "n", arg: 1, scope: !2, file: !1, line: 4, type: !5)
!10 = !DILocation(line: 4, column: 5, scope: !2)
!11 = !DILocation(line: 6, column: 3, scope: !2)
!12 = !DILocation(line: 7, column: 5, scope: !13)
!13 = distinct !DILexicalBlock(scope: !2, file: !1, line: 6, column: 14)
!14 = !DILocation(line: 9, column: 3, scope: !2)
!15 = !DILocation(line: 0, scope: !2)
!16 = !DILocation(line: 14, column: 3, scope: !2)
!17 = !DILocation(line: 15, column: 5, scope: !18)
!18 = distinct !DILexicalBlock(scope: !2, file: !1, line: 14, column: 15)
!19 = !DILocation(line: 17, column: 3, scope: !2)
!20 = distinct !DISubprogram(name: "signBucket", linkageName: "signBucket", scope: null, file: !1, line: 21, type: !3, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!21 = !DILocalVariable(name: "bucket", scope: !20, file: !1, line: 22, type: !5)
!22 = !DILocation(line: 22, column: 3, scope: !20)
!23 = !DILocalVariable(name: "n", arg: 1, scope: !20, file: !1, line: 21, type: !5)
!24 = !DILocation(line: 21, column: 5, scope: !20)
!25 = !DILocation(line: 23, column: 3, scope: !20)
!26 = !DILocation(line: 0, scope: !20)
!27 = !DILocation(line: 30, column: 3, scope: !20)
!28 = distinct !DISubprogram(name: "decadeBucket", linkageName: "decadeBucket", scope: null, file: !1, line: 34, type: !3, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!29 = !DILocalVariable(name: "bucket", scope: !28, file: !1, line: 35, type: !5)
!30 = !DILocation(line: 35, column: 3, scope: !28)
!31 = !DILocalVariable(name: "n", arg: 1, scope: !28, file: !1, line: 34, type: !5)
!32 = !DILocation(line: 34, column: 5, scope: !28)
!33 = !DILocation(line: 36, column: 3, scope: !28)
!34 = !DILocation(line: 38, column: 10, scope: !28)
!35 = !DILocation(line: 43, column: 5, scope: !36)
!36 = distinct !DILexicalBlock(scope: !28, file: !1, line: 42, column: 10)
!37 = !DILocation(line: 0, scope: !28)
!38 = !DILocation(line: 45, column: 3, scope: !28)
!39 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 48, type: !40, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!40 = !DISubroutineType(types: !41)
!41 = !{!5}
!42 = !DILocalVariable(name: "err", scope: !39, file: !1, line: 49, type: !5)
!43 = !DILocation(line: 49, column: 3, scope: !39)
!44 = !DILocation(line: 51, column: 3, scope: !39)
!45 = !DILocation(line: 51, column: 33, scope: !39)
!46 = !DILocation(line: 52, column: 3, scope: !39)
!47 = !DILocation(line: 52, column: 32, scope: !39)
!48 = !DILocation(line: 53, column: 3, scope: !39)
!49 = !DILocation(line: 53, column: 32, scope: !39)
!50 = !DILocation(line: 54, column: 3, scope: !39)
!51 = !DILocation(line: 54, column: 34, scope: !39)
!52 = !DILocation(line: 56, column: 3, scope: !39)
!53 = !DILocation(line: 56, column: 28, scope: !39)
!54 = !DILocation(line: 57, column: 3, scope: !39)
!55 = !DILocation(line: 57, column: 27, scope: !39)
!56 = !DILocation(line: 58, column: 3, scope: !39)
!57 = !DILocation(line: 58, column: 27, scope: !39)
!58 = !DILocation(line: 60, column: 3, scope: !39)
!59 = !DILocation(line: 60, column: 29, scope: !39)
!60 = !DILocation(line: 61, column: 3, scope: !39)
!61 = !DILocation(line: 61, column: 30, scope: !39)
!62 = !DILocation(line: 62, column: 3, scope: !39)
!63 = !DILocation(line: 62, column: 30, scope: !39)
!64 = !DILocation(line: 63, column: 3, scope: !39)
!65 = !DILocation(line: 63, column: 30, scope: !39)
!66 = !DILocation(line: 65, column: 3, scope: !39)
!67 = !DILocation(line: 0, scope: !39)
!68 = !DILocation(line: 70, column: 3, scope: !39)
