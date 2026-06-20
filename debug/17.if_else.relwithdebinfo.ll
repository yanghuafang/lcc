; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [19 x i8] c"17.if_else.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"17.if_else.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @accumulateFlags(i32 %0) !dbg !2 {
entry:
  %flags = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %flags, metadata !7, metadata !DIExpression()), !dbg !8
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !9, metadata !DIExpression()), !dbg !10
  store i32 %0, i32* %n, align 4, !dbg !10
  store i32 0, i32* %flags, align 4, !dbg !8
  %1 = load i32, i32* %n, align 4, !dbg !11
  %2 = icmp slt i32 %1, 0, !dbg !11
  br i1 %2, label %then, label %if.end, !dbg !11

then:                                             ; preds = %entry
  %3 = load i32, i32* %flags, align 4, !dbg !12
  %4 = add i32 %3, 1, !dbg !12
  store i32 %4, i32* %flags, align 4, !dbg !12
  %5 = load i32, i32* %flags, align 4, !dbg !12
  br label %if.end, !dbg !12

if.end:                                           ; preds = %entry, %then
  %6 = load i32, i32* %n, align 4, !dbg !14
  %7 = icmp eq i32 %6, 0, !dbg !14
  %8 = load i32, i32* %flags, align 4, !dbg !15
  br i1 %7, label %then1, label %else2, !dbg !14

then1:                                            ; preds = %if.end
  %9 = add i32 %8, 2, !dbg !16
  store i32 %9, i32* %flags, align 4, !dbg !16
  %10 = load i32, i32* %flags, align 4, !dbg !16
  br label %if.end3, !dbg !16

else2:                                            ; preds = %if.end
  %11 = add i32 %8, 4, !dbg !18
  store i32 %11, i32* %flags, align 4, !dbg !18
  %12 = load i32, i32* %flags, align 4, !dbg !18
  br label %if.end3, !dbg !18

if.end3:                                          ; preds = %else2, %then1
  %13 = load i32, i32* %n, align 4, !dbg !20
  %14 = icmp sgt i32 %13, 10, !dbg !20
  br i1 %14, label %then4, label %if.end6, !dbg !20

then4:                                            ; preds = %if.end3
  %15 = load i32, i32* %flags, align 4, !dbg !21
  %16 = add i32 %15, 8, !dbg !21
  store i32 %16, i32* %flags, align 4, !dbg !21
  %17 = load i32, i32* %flags, align 4, !dbg !21
  br label %if.end6, !dbg !21

if.end6:                                          ; preds = %if.end3, %then4
  %18 = load i32, i32* %flags, align 4, !dbg !23
  ret i32 %18, !dbg !23
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @signBucket(i32 %0) !dbg !24 {
entry:
  %bucket = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %bucket, metadata !25, metadata !DIExpression()), !dbg !26
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !27, metadata !DIExpression()), !dbg !28
  store i32 %0, i32* %n, align 4, !dbg !28
  %1 = load i32, i32* %n, align 4, !dbg !29
  %2 = icmp slt i32 %1, 0, !dbg !29
  br i1 %2, label %then, label %else, !dbg !29

then:                                             ; preds = %entry
  store i32 1, i32* %bucket, align 4, !dbg !30
  %3 = load i32, i32* %bucket, align 4, !dbg !30
  br label %if.end3, !dbg !30

else:                                             ; preds = %entry
  %4 = load i32, i32* %n, align 4, !dbg !32
  %5 = icmp eq i32 %4, 0, !dbg !32
  br i1 %5, label %then1, label %else2, !dbg !32

then1:                                            ; preds = %else
  store i32 2, i32* %bucket, align 4, !dbg !33
  %6 = load i32, i32* %bucket, align 4, !dbg !33
  br label %if.end3, !dbg !33

else2:                                            ; preds = %else
  store i32 3, i32* %bucket, align 4, !dbg !35
  %7 = load i32, i32* %bucket, align 4, !dbg !35
  br label %if.end3, !dbg !35

if.end3:                                          ; preds = %then1, %else2, %then
  %8 = load i32, i32* %bucket, align 4, !dbg !37
  ret i32 %8, !dbg !37
}

define i32 @decadeBucket(i32 %0) !dbg !38 {
entry:
  %bucket = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %bucket, metadata !39, metadata !DIExpression()), !dbg !40
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !41, metadata !DIExpression()), !dbg !42
  store i32 %0, i32* %n, align 4, !dbg !42
  %1 = load i32, i32* %n, align 4, !dbg !43
  %2 = icmp sle i32 %1, 9, !dbg !43
  br i1 %2, label %then, label %else, !dbg !43

then:                                             ; preds = %entry
  store i32 0, i32* %bucket, align 4, !dbg !44
  %3 = load i32, i32* %bucket, align 4, !dbg !44
  br label %if.end6, !dbg !44

else:                                             ; preds = %entry
  %4 = load i32, i32* %n, align 4, !dbg !46
  %5 = icmp sle i32 %4, 19, !dbg !46
  br i1 %5, label %then1, label %else2, !dbg !46

then1:                                            ; preds = %else
  store i32 1, i32* %bucket, align 4, !dbg !47
  %6 = load i32, i32* %bucket, align 4, !dbg !47
  br label %if.end6, !dbg !47

else2:                                            ; preds = %else
  %7 = load i32, i32* %n, align 4, !dbg !49
  %8 = icmp sle i32 %7, 29, !dbg !49
  br i1 %8, label %then3, label %else4, !dbg !49

then3:                                            ; preds = %else2
  store i32 2, i32* %bucket, align 4, !dbg !50
  %9 = load i32, i32* %bucket, align 4, !dbg !50
  br label %if.end6, !dbg !50

else4:                                            ; preds = %else2
  store i32 3, i32* %bucket, align 4, !dbg !52
  %10 = load i32, i32* %bucket, align 4, !dbg !52
  br label %if.end6, !dbg !52

if.end6:                                          ; preds = %then1, %else4, %then3, %then
  %11 = load i32, i32* %bucket, align 4, !dbg !54
  ret i32 %11, !dbg !54
}

define i32 @main() !dbg !55 {
entry:
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !58, metadata !DIExpression()), !dbg !59
  store i32 0, i32* %err, align 4, !dbg !59
  %0 = call i32 @accumulateFlags(i32 -5), !dbg !60
  %1 = icmp ne i32 %0, 5, !dbg !60
  br i1 %1, label %then, label %if.end, !dbg !60

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !61
  %2 = load i32, i32* %err, align 4, !dbg !61
  br label %if.end, !dbg !61

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @accumulateFlags(i32 0), !dbg !62
  %4 = icmp ne i32 %3, 2, !dbg !62
  br i1 %4, label %then1, label %if.end3, !dbg !62

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !63
  %5 = load i32, i32* %err, align 4, !dbg !63
  br label %if.end3, !dbg !63

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @accumulateFlags(i32 5), !dbg !64
  %7 = icmp ne i32 %6, 4, !dbg !64
  br i1 %7, label %then4, label %if.end6, !dbg !64

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !65
  %8 = load i32, i32* %err, align 4, !dbg !65
  br label %if.end6, !dbg !65

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @accumulateFlags(i32 15), !dbg !66
  %10 = icmp ne i32 %9, 12, !dbg !66
  br i1 %10, label %then7, label %if.end9, !dbg !66

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !67
  %11 = load i32, i32* %err, align 4, !dbg !67
  br label %if.end9, !dbg !67

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @signBucket(i32 -1), !dbg !68
  %13 = icmp ne i32 %12, 1, !dbg !68
  br i1 %13, label %then10, label %if.end12, !dbg !68

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !69
  %14 = load i32, i32* %err, align 4, !dbg !69
  br label %if.end12, !dbg !69

if.end12:                                         ; preds = %if.end9, %then10
  %15 = call i32 @signBucket(i32 0), !dbg !70
  %16 = icmp ne i32 %15, 2, !dbg !70
  br i1 %16, label %then13, label %if.end15, !dbg !70

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !71
  %17 = load i32, i32* %err, align 4, !dbg !71
  br label %if.end15, !dbg !71

if.end15:                                         ; preds = %if.end12, %then13
  %18 = call i32 @signBucket(i32 7), !dbg !72
  %19 = icmp ne i32 %18, 3, !dbg !72
  br i1 %19, label %then16, label %if.end18, !dbg !72

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !73
  %20 = load i32, i32* %err, align 4, !dbg !73
  br label %if.end18, !dbg !73

if.end18:                                         ; preds = %if.end15, %then16
  %21 = call i32 @decadeBucket(i32 5), !dbg !74
  %22 = icmp ne i32 %21, 0, !dbg !74
  br i1 %22, label %then19, label %if.end21, !dbg !74

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !75
  %23 = load i32, i32* %err, align 4, !dbg !75
  br label %if.end21, !dbg !75

if.end21:                                         ; preds = %if.end18, %then19
  %24 = call i32 @decadeBucket(i32 15), !dbg !76
  %25 = icmp ne i32 %24, 1, !dbg !76
  br i1 %25, label %then22, label %if.end24, !dbg !76

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !77
  %26 = load i32, i32* %err, align 4, !dbg !77
  br label %if.end24, !dbg !77

if.end24:                                         ; preds = %if.end21, %then22
  %27 = call i32 @decadeBucket(i32 25), !dbg !78
  %28 = icmp ne i32 %27, 2, !dbg !78
  br i1 %28, label %then25, label %if.end27, !dbg !78

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !79
  %29 = load i32, i32* %err, align 4, !dbg !79
  br label %if.end27, !dbg !79

if.end27:                                         ; preds = %if.end24, %then25
  %30 = call i32 @decadeBucket(i32 35), !dbg !80
  %31 = icmp ne i32 %30, 3, !dbg !80
  br i1 %31, label %then28, label %if.end30, !dbg !80

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !81
  %32 = load i32, i32* %err, align 4, !dbg !81
  br label %if.end30, !dbg !81

if.end30:                                         ; preds = %if.end27, %then28
  %33 = load i32, i32* %err, align 4, !dbg !82
  %34 = icmp eq i32 %33, 0, !dbg !82
  %. = select i1 %34, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @1, i32 0, i32 0), !dbg !83
  %35 = call i32 (i8*, ...) @printf(i8* %.), !dbg !83
  %36 = load i32, i32* %err, align 4, !dbg !84
  ret i32 %36, !dbg !84
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

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
!16 = !DILocation(line: 10, column: 5, scope: !17)
!17 = distinct !DILexicalBlock(scope: !2, file: !1, line: 9, column: 15)
!18 = !DILocation(line: 12, column: 5, scope: !19)
!19 = distinct !DILexicalBlock(scope: !2, file: !1, line: 11, column: 10)
!20 = !DILocation(line: 14, column: 3, scope: !2)
!21 = !DILocation(line: 15, column: 5, scope: !22)
!22 = distinct !DILexicalBlock(scope: !2, file: !1, line: 14, column: 15)
!23 = !DILocation(line: 17, column: 3, scope: !2)
!24 = distinct !DISubprogram(name: "signBucket", linkageName: "signBucket", scope: null, file: !1, line: 21, type: !3, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!25 = !DILocalVariable(name: "bucket", scope: !24, file: !1, line: 22, type: !5)
!26 = !DILocation(line: 22, column: 3, scope: !24)
!27 = !DILocalVariable(name: "n", arg: 1, scope: !24, file: !1, line: 21, type: !5)
!28 = !DILocation(line: 21, column: 5, scope: !24)
!29 = !DILocation(line: 23, column: 3, scope: !24)
!30 = !DILocation(line: 24, column: 5, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !1, line: 23, column: 14)
!32 = !DILocation(line: 25, column: 10, scope: !24)
!33 = !DILocation(line: 26, column: 5, scope: !34)
!34 = distinct !DILexicalBlock(scope: !24, file: !1, line: 25, column: 22)
!35 = !DILocation(line: 28, column: 5, scope: !36)
!36 = distinct !DILexicalBlock(scope: !24, file: !1, line: 27, column: 10)
!37 = !DILocation(line: 30, column: 3, scope: !24)
!38 = distinct !DISubprogram(name: "decadeBucket", linkageName: "decadeBucket", scope: null, file: !1, line: 34, type: !3, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!39 = !DILocalVariable(name: "bucket", scope: !38, file: !1, line: 35, type: !5)
!40 = !DILocation(line: 35, column: 3, scope: !38)
!41 = !DILocalVariable(name: "n", arg: 1, scope: !38, file: !1, line: 34, type: !5)
!42 = !DILocation(line: 34, column: 5, scope: !38)
!43 = !DILocation(line: 36, column: 3, scope: !38)
!44 = !DILocation(line: 37, column: 5, scope: !45)
!45 = distinct !DILexicalBlock(scope: !38, file: !1, line: 36, column: 15)
!46 = !DILocation(line: 38, column: 10, scope: !38)
!47 = !DILocation(line: 39, column: 5, scope: !48)
!48 = distinct !DILexicalBlock(scope: !38, file: !1, line: 38, column: 23)
!49 = !DILocation(line: 40, column: 10, scope: !38)
!50 = !DILocation(line: 41, column: 5, scope: !51)
!51 = distinct !DILexicalBlock(scope: !38, file: !1, line: 40, column: 23)
!52 = !DILocation(line: 43, column: 5, scope: !53)
!53 = distinct !DILexicalBlock(scope: !38, file: !1, line: 42, column: 10)
!54 = !DILocation(line: 45, column: 3, scope: !38)
!55 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 48, type: !56, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!56 = !DISubroutineType(types: !57)
!57 = !{!5}
!58 = !DILocalVariable(name: "err", scope: !55, file: !1, line: 49, type: !5)
!59 = !DILocation(line: 49, column: 3, scope: !55)
!60 = !DILocation(line: 51, column: 3, scope: !55)
!61 = !DILocation(line: 51, column: 33, scope: !55)
!62 = !DILocation(line: 52, column: 3, scope: !55)
!63 = !DILocation(line: 52, column: 32, scope: !55)
!64 = !DILocation(line: 53, column: 3, scope: !55)
!65 = !DILocation(line: 53, column: 32, scope: !55)
!66 = !DILocation(line: 54, column: 3, scope: !55)
!67 = !DILocation(line: 54, column: 34, scope: !55)
!68 = !DILocation(line: 56, column: 3, scope: !55)
!69 = !DILocation(line: 56, column: 28, scope: !55)
!70 = !DILocation(line: 57, column: 3, scope: !55)
!71 = !DILocation(line: 57, column: 27, scope: !55)
!72 = !DILocation(line: 58, column: 3, scope: !55)
!73 = !DILocation(line: 58, column: 27, scope: !55)
!74 = !DILocation(line: 60, column: 3, scope: !55)
!75 = !DILocation(line: 60, column: 29, scope: !55)
!76 = !DILocation(line: 61, column: 3, scope: !55)
!77 = !DILocation(line: 61, column: 30, scope: !55)
!78 = !DILocation(line: 62, column: 3, scope: !55)
!79 = !DILocation(line: 62, column: 30, scope: !55)
!80 = !DILocation(line: 63, column: 3, scope: !55)
!81 = !DILocation(line: 63, column: 30, scope: !55)
!82 = !DILocation(line: 65, column: 3, scope: !55)
!83 = !DILocation(line: 0, scope: !55)
!84 = !DILocation(line: 70, column: 3, scope: !55)
