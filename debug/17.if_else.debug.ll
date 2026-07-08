; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [19 x i8] c"17.if_else.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"17.if_else.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @accumulateFlags(i32 %0) !dbg !4 {
entry:
  %flags = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %flags, metadata !9, metadata !DIExpression()), !dbg !10
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 %0, i32* %n, align 4, !dbg !12
  store i32 0, i32* %flags, align 4, !dbg !10
  %1 = load i32, i32* %n, align 4, !dbg !13
  %2 = icmp slt i32 %1, 0, !dbg !13
  br i1 %2, label %then, label %if.end, !dbg !13

then:                                             ; preds = %entry
  %3 = load i32, i32* %flags, align 4, !dbg !14
  %4 = add i32 %3, 1, !dbg !14
  store i32 %4, i32* %flags, align 4, !dbg !14
  %5 = load i32, i32* %flags, align 4, !dbg !14
  br label %if.end, !dbg !14

if.end:                                           ; preds = %entry, %then
  %6 = load i32, i32* %n, align 4, !dbg !16
  %7 = icmp eq i32 %6, 0, !dbg !16
  %8 = load i32, i32* %flags, align 4, !dbg !17
  br i1 %7, label %then1, label %else2, !dbg !16

then1:                                            ; preds = %if.end
  %9 = add i32 %8, 2, !dbg !18
  store i32 %9, i32* %flags, align 4, !dbg !18
  %10 = load i32, i32* %flags, align 4, !dbg !18
  br label %if.end3, !dbg !18

else2:                                            ; preds = %if.end
  %11 = add i32 %8, 4, !dbg !20
  store i32 %11, i32* %flags, align 4, !dbg !20
  %12 = load i32, i32* %flags, align 4, !dbg !20
  br label %if.end3, !dbg !20

if.end3:                                          ; preds = %else2, %then1
  %13 = load i32, i32* %n, align 4, !dbg !22
  %14 = icmp sgt i32 %13, 10, !dbg !22
  br i1 %14, label %then4, label %if.end6, !dbg !22

then4:                                            ; preds = %if.end3
  %15 = load i32, i32* %flags, align 4, !dbg !23
  %16 = add i32 %15, 8, !dbg !23
  store i32 %16, i32* %flags, align 4, !dbg !23
  %17 = load i32, i32* %flags, align 4, !dbg !23
  br label %if.end6, !dbg !23

if.end6:                                          ; preds = %if.end3, %then4
  %18 = load i32, i32* %flags, align 4, !dbg !25
  ret i32 %18, !dbg !25
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @signBucket(i32 %0) !dbg !26 {
entry:
  %bucket = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %bucket, metadata !27, metadata !DIExpression()), !dbg !28
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !29, metadata !DIExpression()), !dbg !30
  store i32 %0, i32* %n, align 4, !dbg !30
  %1 = load i32, i32* %n, align 4, !dbg !31
  %2 = icmp slt i32 %1, 0, !dbg !31
  br i1 %2, label %then, label %else, !dbg !31

then:                                             ; preds = %entry
  store i32 1, i32* %bucket, align 4, !dbg !32
  %3 = load i32, i32* %bucket, align 4, !dbg !32
  br label %if.end3, !dbg !32

else:                                             ; preds = %entry
  %4 = load i32, i32* %n, align 4, !dbg !34
  %5 = icmp eq i32 %4, 0, !dbg !34
  br i1 %5, label %then1, label %else2, !dbg !34

then1:                                            ; preds = %else
  store i32 2, i32* %bucket, align 4, !dbg !35
  %6 = load i32, i32* %bucket, align 4, !dbg !35
  br label %if.end3, !dbg !35

else2:                                            ; preds = %else
  store i32 3, i32* %bucket, align 4, !dbg !37
  %7 = load i32, i32* %bucket, align 4, !dbg !37
  br label %if.end3, !dbg !37

if.end3:                                          ; preds = %then1, %else2, %then
  %8 = load i32, i32* %bucket, align 4, !dbg !39
  ret i32 %8, !dbg !39
}

define i32 @decadeBucket(i32 %0) !dbg !40 {
entry:
  %bucket = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %bucket, metadata !41, metadata !DIExpression()), !dbg !42
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !43, metadata !DIExpression()), !dbg !44
  store i32 %0, i32* %n, align 4, !dbg !44
  %1 = load i32, i32* %n, align 4, !dbg !45
  %2 = icmp sle i32 %1, 9, !dbg !45
  br i1 %2, label %then, label %else, !dbg !45

then:                                             ; preds = %entry
  store i32 0, i32* %bucket, align 4, !dbg !46
  %3 = load i32, i32* %bucket, align 4, !dbg !46
  br label %if.end6, !dbg !46

else:                                             ; preds = %entry
  %4 = load i32, i32* %n, align 4, !dbg !48
  %5 = icmp sle i32 %4, 19, !dbg !48
  br i1 %5, label %then1, label %else2, !dbg !48

then1:                                            ; preds = %else
  store i32 1, i32* %bucket, align 4, !dbg !49
  %6 = load i32, i32* %bucket, align 4, !dbg !49
  br label %if.end6, !dbg !49

else2:                                            ; preds = %else
  %7 = load i32, i32* %n, align 4, !dbg !51
  %8 = icmp sle i32 %7, 29, !dbg !51
  br i1 %8, label %then3, label %else4, !dbg !51

then3:                                            ; preds = %else2
  store i32 2, i32* %bucket, align 4, !dbg !52
  %9 = load i32, i32* %bucket, align 4, !dbg !52
  br label %if.end6, !dbg !52

else4:                                            ; preds = %else2
  store i32 3, i32* %bucket, align 4, !dbg !54
  %10 = load i32, i32* %bucket, align 4, !dbg !54
  br label %if.end6, !dbg !54

if.end6:                                          ; preds = %then1, %else4, %then3, %then
  %11 = load i32, i32* %bucket, align 4, !dbg !56
  ret i32 %11, !dbg !56
}

define i32 @main() !dbg !57 {
entry:
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !60, metadata !DIExpression()), !dbg !61
  store i32 0, i32* %err, align 4, !dbg !61
  %0 = call i32 @accumulateFlags(i32 -5), !dbg !62
  %1 = icmp ne i32 %0, 5, !dbg !62
  br i1 %1, label %then, label %if.end, !dbg !62

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !63
  %2 = load i32, i32* %err, align 4, !dbg !63
  br label %if.end, !dbg !63

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @accumulateFlags(i32 0), !dbg !64
  %4 = icmp ne i32 %3, 2, !dbg !64
  br i1 %4, label %then1, label %if.end3, !dbg !64

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !65
  %5 = load i32, i32* %err, align 4, !dbg !65
  br label %if.end3, !dbg !65

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @accumulateFlags(i32 5), !dbg !66
  %7 = icmp ne i32 %6, 4, !dbg !66
  br i1 %7, label %then4, label %if.end6, !dbg !66

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !67
  %8 = load i32, i32* %err, align 4, !dbg !67
  br label %if.end6, !dbg !67

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @accumulateFlags(i32 15), !dbg !68
  %10 = icmp ne i32 %9, 12, !dbg !68
  br i1 %10, label %then7, label %if.end9, !dbg !68

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !69
  %11 = load i32, i32* %err, align 4, !dbg !69
  br label %if.end9, !dbg !69

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @signBucket(i32 -1), !dbg !70
  %13 = icmp ne i32 %12, 1, !dbg !70
  br i1 %13, label %then10, label %if.end12, !dbg !70

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !71
  %14 = load i32, i32* %err, align 4, !dbg !71
  br label %if.end12, !dbg !71

if.end12:                                         ; preds = %if.end9, %then10
  %15 = call i32 @signBucket(i32 0), !dbg !72
  %16 = icmp ne i32 %15, 2, !dbg !72
  br i1 %16, label %then13, label %if.end15, !dbg !72

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !73
  %17 = load i32, i32* %err, align 4, !dbg !73
  br label %if.end15, !dbg !73

if.end15:                                         ; preds = %if.end12, %then13
  %18 = call i32 @signBucket(i32 7), !dbg !74
  %19 = icmp ne i32 %18, 3, !dbg !74
  br i1 %19, label %then16, label %if.end18, !dbg !74

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !75
  %20 = load i32, i32* %err, align 4, !dbg !75
  br label %if.end18, !dbg !75

if.end18:                                         ; preds = %if.end15, %then16
  %21 = call i32 @decadeBucket(i32 5), !dbg !76
  %22 = icmp ne i32 %21, 0, !dbg !76
  br i1 %22, label %then19, label %if.end21, !dbg !76

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !77
  %23 = load i32, i32* %err, align 4, !dbg !77
  br label %if.end21, !dbg !77

if.end21:                                         ; preds = %if.end18, %then19
  %24 = call i32 @decadeBucket(i32 15), !dbg !78
  %25 = icmp ne i32 %24, 1, !dbg !78
  br i1 %25, label %then22, label %if.end24, !dbg !78

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !79
  %26 = load i32, i32* %err, align 4, !dbg !79
  br label %if.end24, !dbg !79

if.end24:                                         ; preds = %if.end21, %then22
  %27 = call i32 @decadeBucket(i32 25), !dbg !80
  %28 = icmp ne i32 %27, 2, !dbg !80
  br i1 %28, label %then25, label %if.end27, !dbg !80

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !81
  %29 = load i32, i32* %err, align 4, !dbg !81
  br label %if.end27, !dbg !81

if.end27:                                         ; preds = %if.end24, %then25
  %30 = call i32 @decadeBucket(i32 35), !dbg !82
  %31 = icmp ne i32 %30, 3, !dbg !82
  br i1 %31, label %then28, label %if.end30, !dbg !82

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !83
  %32 = load i32, i32* %err, align 4, !dbg !83
  br label %if.end30, !dbg !83

if.end30:                                         ; preds = %if.end27, %then28
  %33 = load i32, i32* %err, align 4, !dbg !84
  %34 = icmp eq i32 %33, 0, !dbg !84
  %. = select i1 %34, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @1, i32 0, i32 0), !dbg !85
  %35 = call i32 (i8*, ...) @printf(i8* %.), !dbg !85
  %36 = load i32, i32* %err, align 4, !dbg !86
  ret i32 %36, !dbg !86
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "17.if_else.c", directory: "../tests")
!2 = !{i32 7, !"PIC Level", i32 2}
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
!18 = !DILocation(line: 10, column: 5, scope: !19)
!19 = distinct !DILexicalBlock(scope: !4, file: !1, line: 9, column: 15)
!20 = !DILocation(line: 12, column: 5, scope: !21)
!21 = distinct !DILexicalBlock(scope: !4, file: !1, line: 11, column: 10)
!22 = !DILocation(line: 14, column: 3, scope: !4)
!23 = !DILocation(line: 15, column: 5, scope: !24)
!24 = distinct !DILexicalBlock(scope: !4, file: !1, line: 14, column: 15)
!25 = !DILocation(line: 17, column: 3, scope: !4)
!26 = distinct !DISubprogram(name: "signBucket", linkageName: "signBucket", scope: null, file: !1, line: 21, type: !5, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!27 = !DILocalVariable(name: "bucket", scope: !26, file: !1, line: 22, type: !7)
!28 = !DILocation(line: 22, column: 3, scope: !26)
!29 = !DILocalVariable(name: "n", arg: 1, scope: !26, file: !1, line: 21, type: !7)
!30 = !DILocation(line: 21, column: 5, scope: !26)
!31 = !DILocation(line: 23, column: 3, scope: !26)
!32 = !DILocation(line: 24, column: 5, scope: !33)
!33 = distinct !DILexicalBlock(scope: !26, file: !1, line: 23, column: 14)
!34 = !DILocation(line: 25, column: 10, scope: !26)
!35 = !DILocation(line: 26, column: 5, scope: !36)
!36 = distinct !DILexicalBlock(scope: !26, file: !1, line: 25, column: 22)
!37 = !DILocation(line: 28, column: 5, scope: !38)
!38 = distinct !DILexicalBlock(scope: !26, file: !1, line: 27, column: 10)
!39 = !DILocation(line: 30, column: 3, scope: !26)
!40 = distinct !DISubprogram(name: "decadeBucket", linkageName: "decadeBucket", scope: null, file: !1, line: 34, type: !5, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!41 = !DILocalVariable(name: "bucket", scope: !40, file: !1, line: 35, type: !7)
!42 = !DILocation(line: 35, column: 3, scope: !40)
!43 = !DILocalVariable(name: "n", arg: 1, scope: !40, file: !1, line: 34, type: !7)
!44 = !DILocation(line: 34, column: 5, scope: !40)
!45 = !DILocation(line: 36, column: 3, scope: !40)
!46 = !DILocation(line: 37, column: 5, scope: !47)
!47 = distinct !DILexicalBlock(scope: !40, file: !1, line: 36, column: 15)
!48 = !DILocation(line: 38, column: 10, scope: !40)
!49 = !DILocation(line: 39, column: 5, scope: !50)
!50 = distinct !DILexicalBlock(scope: !40, file: !1, line: 38, column: 23)
!51 = !DILocation(line: 40, column: 10, scope: !40)
!52 = !DILocation(line: 41, column: 5, scope: !53)
!53 = distinct !DILexicalBlock(scope: !40, file: !1, line: 40, column: 23)
!54 = !DILocation(line: 43, column: 5, scope: !55)
!55 = distinct !DILexicalBlock(scope: !40, file: !1, line: 42, column: 10)
!56 = !DILocation(line: 45, column: 3, scope: !40)
!57 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 48, type: !58, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!58 = !DISubroutineType(types: !59)
!59 = !{!7}
!60 = !DILocalVariable(name: "err", scope: !57, file: !1, line: 49, type: !7)
!61 = !DILocation(line: 49, column: 3, scope: !57)
!62 = !DILocation(line: 51, column: 3, scope: !57)
!63 = !DILocation(line: 51, column: 33, scope: !57)
!64 = !DILocation(line: 52, column: 3, scope: !57)
!65 = !DILocation(line: 52, column: 32, scope: !57)
!66 = !DILocation(line: 53, column: 3, scope: !57)
!67 = !DILocation(line: 53, column: 32, scope: !57)
!68 = !DILocation(line: 54, column: 3, scope: !57)
!69 = !DILocation(line: 54, column: 34, scope: !57)
!70 = !DILocation(line: 56, column: 3, scope: !57)
!71 = !DILocation(line: 56, column: 28, scope: !57)
!72 = !DILocation(line: 57, column: 3, scope: !57)
!73 = !DILocation(line: 57, column: 27, scope: !57)
!74 = !DILocation(line: 58, column: 3, scope: !57)
!75 = !DILocation(line: 58, column: 27, scope: !57)
!76 = !DILocation(line: 60, column: 3, scope: !57)
!77 = !DILocation(line: 60, column: 29, scope: !57)
!78 = !DILocation(line: 61, column: 3, scope: !57)
!79 = !DILocation(line: 61, column: 30, scope: !57)
!80 = !DILocation(line: 62, column: 3, scope: !57)
!81 = !DILocation(line: 62, column: 30, scope: !57)
!82 = !DILocation(line: 63, column: 3, scope: !57)
!83 = !DILocation(line: 63, column: 30, scope: !57)
!84 = !DILocation(line: 65, column: 3, scope: !57)
!85 = !DILocation(line: 0, scope: !57)
!86 = !DILocation(line: 70, column: 3, scope: !57)
