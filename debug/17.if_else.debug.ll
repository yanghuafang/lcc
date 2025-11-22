; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

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
  br i1 %2, label %then, label %else, !dbg !13

then:                                             ; preds = %entry
  %3 = load i32, ptr %flags, align 4, !dbg !14
  %4 = add i32 %3, 1, !dbg !14
  store i32 %4, ptr %flags, align 4, !dbg !14
  %5 = load i32, ptr %flags, align 4, !dbg !14
  br label %if.end, !dbg !14

else:                                             ; preds = %entry
  br label %if.end, !dbg !14

if.end:                                           ; preds = %else, %then
  %6 = load i32, ptr %n, align 4, !dbg !16
  %7 = icmp eq i32 %6, 0, !dbg !16
  br i1 %7, label %then1, label %else2, !dbg !16

then1:                                            ; preds = %if.end
  %8 = load i32, ptr %flags, align 4, !dbg !17
  %9 = add i32 %8, 2, !dbg !17
  store i32 %9, ptr %flags, align 4, !dbg !17
  %10 = load i32, ptr %flags, align 4, !dbg !17
  br label %if.end3, !dbg !17

else2:                                            ; preds = %if.end
  %11 = load i32, ptr %flags, align 4, !dbg !19
  %12 = add i32 %11, 4, !dbg !19
  store i32 %12, ptr %flags, align 4, !dbg !19
  %13 = load i32, ptr %flags, align 4, !dbg !19
  br label %if.end3, !dbg !19

if.end3:                                          ; preds = %else2, %then1
  %14 = load i32, ptr %n, align 4, !dbg !21
  %15 = icmp sgt i32 %14, 10, !dbg !21
  br i1 %15, label %then4, label %else5, !dbg !21

then4:                                            ; preds = %if.end3
  %16 = load i32, ptr %flags, align 4, !dbg !22
  %17 = add i32 %16, 8, !dbg !22
  store i32 %17, ptr %flags, align 4, !dbg !22
  %18 = load i32, ptr %flags, align 4, !dbg !22
  br label %if.end6, !dbg !22

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !22

if.end6:                                          ; preds = %else5, %then4
  %19 = load i32, ptr %flags, align 4, !dbg !24
  ret i32 %19, !dbg !24
}

define i32 @signBucket(i32 %0) !dbg !25 {
entry:
  %bucket = alloca i32, align 4
    #dbg_declare(ptr %bucket, !26, !DIExpression(), !27)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !28, !DIExpression(), !29)
  store i32 %0, ptr %n, align 4, !dbg !29
  %1 = load i32, ptr %n, align 4, !dbg !30
  %2 = icmp slt i32 %1, 0, !dbg !30
  br i1 %2, label %then, label %else, !dbg !30

then:                                             ; preds = %entry
  store i32 1, ptr %bucket, align 4, !dbg !31
  %3 = load i32, ptr %bucket, align 4, !dbg !31
  br label %if.end3, !dbg !31

else:                                             ; preds = %entry
  %4 = load i32, ptr %n, align 4, !dbg !33
  %5 = icmp eq i32 %4, 0, !dbg !33
  br i1 %5, label %then1, label %else2, !dbg !33

then1:                                            ; preds = %else
  store i32 2, ptr %bucket, align 4, !dbg !34
  %6 = load i32, ptr %bucket, align 4, !dbg !34
  br label %if.end, !dbg !34

else2:                                            ; preds = %else
  store i32 3, ptr %bucket, align 4, !dbg !36
  %7 = load i32, ptr %bucket, align 4, !dbg !36
  br label %if.end, !dbg !36

if.end:                                           ; preds = %else2, %then1
  br label %if.end3, !dbg !36

if.end3:                                          ; preds = %if.end, %then
  %8 = load i32, ptr %bucket, align 4, !dbg !38
  ret i32 %8, !dbg !38
}

define i32 @decadeBucket(i32 %0) !dbg !39 {
entry:
  %bucket = alloca i32, align 4
    #dbg_declare(ptr %bucket, !40, !DIExpression(), !41)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !42, !DIExpression(), !43)
  store i32 %0, ptr %n, align 4, !dbg !43
  %1 = load i32, ptr %n, align 4, !dbg !44
  %2 = icmp sle i32 %1, 9, !dbg !44
  br i1 %2, label %then, label %else, !dbg !44

then:                                             ; preds = %entry
  store i32 0, ptr %bucket, align 4, !dbg !45
  %3 = load i32, ptr %bucket, align 4, !dbg !45
  br label %if.end6, !dbg !45

else:                                             ; preds = %entry
  %4 = load i32, ptr %n, align 4, !dbg !47
  %5 = icmp sle i32 %4, 19, !dbg !47
  br i1 %5, label %then1, label %else2, !dbg !47

then1:                                            ; preds = %else
  store i32 1, ptr %bucket, align 4, !dbg !48
  %6 = load i32, ptr %bucket, align 4, !dbg !48
  br label %if.end5, !dbg !48

else2:                                            ; preds = %else
  %7 = load i32, ptr %n, align 4, !dbg !50
  %8 = icmp sle i32 %7, 29, !dbg !50
  br i1 %8, label %then3, label %else4, !dbg !50

then3:                                            ; preds = %else2
  store i32 2, ptr %bucket, align 4, !dbg !51
  %9 = load i32, ptr %bucket, align 4, !dbg !51
  br label %if.end, !dbg !51

else4:                                            ; preds = %else2
  store i32 3, ptr %bucket, align 4, !dbg !53
  %10 = load i32, ptr %bucket, align 4, !dbg !53
  br label %if.end, !dbg !53

if.end:                                           ; preds = %else4, %then3
  br label %if.end5, !dbg !53

if.end5:                                          ; preds = %if.end, %then1
  br label %if.end6, !dbg !53

if.end6:                                          ; preds = %if.end5, %then
  %11 = load i32, ptr %bucket, align 4, !dbg !55
  ret i32 %11, !dbg !55
}

define i32 @main() !dbg !56 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !59, !DIExpression(), !60)
  store i32 0, ptr %err, align 4, !dbg !60
  %0 = call i32 @accumulateFlags(i32 -5), !dbg !61
  %1 = icmp ne i32 %0, 5, !dbg !61
  br i1 %1, label %then, label %else, !dbg !61

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !62
  %2 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end, !dbg !62

else:                                             ; preds = %entry
  br label %if.end, !dbg !62

if.end:                                           ; preds = %else, %then
  %3 = call i32 @accumulateFlags(i32 0), !dbg !63
  %4 = icmp ne i32 %3, 2, !dbg !63
  br i1 %4, label %then1, label %else2, !dbg !63

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !64
  %5 = load i32, ptr %err, align 4, !dbg !64
  br label %if.end3, !dbg !64

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !64

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @accumulateFlags(i32 5), !dbg !65
  %7 = icmp ne i32 %6, 4, !dbg !65
  br i1 %7, label %then4, label %else5, !dbg !65

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !66
  %8 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end6, !dbg !66

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !66

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @accumulateFlags(i32 15), !dbg !67
  %10 = icmp ne i32 %9, 12, !dbg !67
  br i1 %10, label %then7, label %else8, !dbg !67

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !68
  %11 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end9, !dbg !68

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !68

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @signBucket(i32 -1), !dbg !69
  %13 = icmp ne i32 %12, 1, !dbg !69
  br i1 %13, label %then10, label %else11, !dbg !69

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !70
  %14 = load i32, ptr %err, align 4, !dbg !70
  br label %if.end12, !dbg !70

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !70

if.end12:                                         ; preds = %else11, %then10
  %15 = call i32 @signBucket(i32 0), !dbg !71
  %16 = icmp ne i32 %15, 2, !dbg !71
  br i1 %16, label %then13, label %else14, !dbg !71

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !72
  %17 = load i32, ptr %err, align 4, !dbg !72
  br label %if.end15, !dbg !72

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !72

if.end15:                                         ; preds = %else14, %then13
  %18 = call i32 @signBucket(i32 7), !dbg !73
  %19 = icmp ne i32 %18, 3, !dbg !73
  br i1 %19, label %then16, label %else17, !dbg !73

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !74
  %20 = load i32, ptr %err, align 4, !dbg !74
  br label %if.end18, !dbg !74

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !74

if.end18:                                         ; preds = %else17, %then16
  %21 = call i32 @decadeBucket(i32 5), !dbg !75
  %22 = icmp ne i32 %21, 0, !dbg !75
  br i1 %22, label %then19, label %else20, !dbg !75

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !76
  %23 = load i32, ptr %err, align 4, !dbg !76
  br label %if.end21, !dbg !76

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !76

if.end21:                                         ; preds = %else20, %then19
  %24 = call i32 @decadeBucket(i32 15), !dbg !77
  %25 = icmp ne i32 %24, 1, !dbg !77
  br i1 %25, label %then22, label %else23, !dbg !77

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !78
  %26 = load i32, ptr %err, align 4, !dbg !78
  br label %if.end24, !dbg !78

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !78

if.end24:                                         ; preds = %else23, %then22
  %27 = call i32 @decadeBucket(i32 25), !dbg !79
  %28 = icmp ne i32 %27, 2, !dbg !79
  br i1 %28, label %then25, label %else26, !dbg !79

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !80
  %29 = load i32, ptr %err, align 4, !dbg !80
  br label %if.end27, !dbg !80

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !80

if.end27:                                         ; preds = %else26, %then25
  %30 = call i32 @decadeBucket(i32 35), !dbg !81
  %31 = icmp ne i32 %30, 3, !dbg !81
  br i1 %31, label %then28, label %else29, !dbg !81

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !82
  %32 = load i32, ptr %err, align 4, !dbg !82
  br label %if.end30, !dbg !82

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !82

if.end30:                                         ; preds = %else29, %then28
  %33 = load i32, ptr %err, align 4, !dbg !83
  %34 = icmp eq i32 %33, 0, !dbg !83
  br i1 %34, label %then31, label %else32, !dbg !83

then31:                                           ; preds = %if.end30
  %35 = call i32 (ptr, ...) @printf(ptr @0), !dbg !84
  br label %if.end33, !dbg !84

else32:                                           ; preds = %if.end30
  %36 = call i32 (ptr, ...) @printf(ptr @1), !dbg !86
  br label %if.end33, !dbg !86

if.end33:                                         ; preds = %else32, %then31
  %37 = load i32, ptr %err, align 4, !dbg !88
  ret i32 %37, !dbg !88
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "17.if_else.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "accumulateFlags", linkageName: "accumulateFlags", scope: null, file: !1, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "flags", scope: !4, file: !1, line: 7, type: !7)
!10 = !DILocation(line: 7, column: 3, scope: !4)
!11 = !DILocalVariable(name: "n", arg: 1, scope: !4, file: !1, line: 6, type: !7)
!12 = !DILocation(line: 6, column: 5, scope: !4)
!13 = !DILocation(line: 8, column: 3, scope: !4)
!14 = !DILocation(line: 9, column: 5, scope: !15)
!15 = distinct !DILexicalBlock(scope: !4, file: !1, line: 8, column: 14)
!16 = !DILocation(line: 11, column: 3, scope: !4)
!17 = !DILocation(line: 12, column: 5, scope: !18)
!18 = distinct !DILexicalBlock(scope: !4, file: !1, line: 11, column: 15)
!19 = !DILocation(line: 14, column: 5, scope: !20)
!20 = distinct !DILexicalBlock(scope: !4, file: !1, line: 13, column: 10)
!21 = !DILocation(line: 16, column: 3, scope: !4)
!22 = !DILocation(line: 17, column: 5, scope: !23)
!23 = distinct !DILexicalBlock(scope: !4, file: !1, line: 16, column: 15)
!24 = !DILocation(line: 19, column: 3, scope: !4)
!25 = distinct !DISubprogram(name: "signBucket", linkageName: "signBucket", scope: null, file: !1, line: 23, type: !5, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!26 = !DILocalVariable(name: "bucket", scope: !25, file: !1, line: 24, type: !7)
!27 = !DILocation(line: 24, column: 3, scope: !25)
!28 = !DILocalVariable(name: "n", arg: 1, scope: !25, file: !1, line: 23, type: !7)
!29 = !DILocation(line: 23, column: 5, scope: !25)
!30 = !DILocation(line: 25, column: 3, scope: !25)
!31 = !DILocation(line: 26, column: 5, scope: !32)
!32 = distinct !DILexicalBlock(scope: !25, file: !1, line: 25, column: 14)
!33 = !DILocation(line: 27, column: 10, scope: !25)
!34 = !DILocation(line: 28, column: 5, scope: !35)
!35 = distinct !DILexicalBlock(scope: !25, file: !1, line: 27, column: 22)
!36 = !DILocation(line: 30, column: 5, scope: !37)
!37 = distinct !DILexicalBlock(scope: !25, file: !1, line: 29, column: 10)
!38 = !DILocation(line: 32, column: 3, scope: !25)
!39 = distinct !DISubprogram(name: "decadeBucket", linkageName: "decadeBucket", scope: null, file: !1, line: 36, type: !5, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!40 = !DILocalVariable(name: "bucket", scope: !39, file: !1, line: 37, type: !7)
!41 = !DILocation(line: 37, column: 3, scope: !39)
!42 = !DILocalVariable(name: "n", arg: 1, scope: !39, file: !1, line: 36, type: !7)
!43 = !DILocation(line: 36, column: 5, scope: !39)
!44 = !DILocation(line: 38, column: 3, scope: !39)
!45 = !DILocation(line: 39, column: 5, scope: !46)
!46 = distinct !DILexicalBlock(scope: !39, file: !1, line: 38, column: 15)
!47 = !DILocation(line: 40, column: 10, scope: !39)
!48 = !DILocation(line: 41, column: 5, scope: !49)
!49 = distinct !DILexicalBlock(scope: !39, file: !1, line: 40, column: 23)
!50 = !DILocation(line: 42, column: 10, scope: !39)
!51 = !DILocation(line: 43, column: 5, scope: !52)
!52 = distinct !DILexicalBlock(scope: !39, file: !1, line: 42, column: 23)
!53 = !DILocation(line: 45, column: 5, scope: !54)
!54 = distinct !DILexicalBlock(scope: !39, file: !1, line: 44, column: 10)
!55 = !DILocation(line: 47, column: 3, scope: !39)
!56 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 50, type: !57, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!57 = !DISubroutineType(types: !58)
!58 = !{!7}
!59 = !DILocalVariable(name: "err", scope: !56, file: !1, line: 51, type: !7)
!60 = !DILocation(line: 51, column: 3, scope: !56)
!61 = !DILocation(line: 53, column: 3, scope: !56)
!62 = !DILocation(line: 53, column: 33, scope: !56)
!63 = !DILocation(line: 54, column: 3, scope: !56)
!64 = !DILocation(line: 54, column: 32, scope: !56)
!65 = !DILocation(line: 55, column: 3, scope: !56)
!66 = !DILocation(line: 55, column: 32, scope: !56)
!67 = !DILocation(line: 56, column: 3, scope: !56)
!68 = !DILocation(line: 56, column: 34, scope: !56)
!69 = !DILocation(line: 58, column: 3, scope: !56)
!70 = !DILocation(line: 58, column: 28, scope: !56)
!71 = !DILocation(line: 59, column: 3, scope: !56)
!72 = !DILocation(line: 59, column: 27, scope: !56)
!73 = !DILocation(line: 60, column: 3, scope: !56)
!74 = !DILocation(line: 60, column: 27, scope: !56)
!75 = !DILocation(line: 62, column: 3, scope: !56)
!76 = !DILocation(line: 62, column: 29, scope: !56)
!77 = !DILocation(line: 63, column: 3, scope: !56)
!78 = !DILocation(line: 63, column: 30, scope: !56)
!79 = !DILocation(line: 64, column: 3, scope: !56)
!80 = !DILocation(line: 64, column: 30, scope: !56)
!81 = !DILocation(line: 65, column: 3, scope: !56)
!82 = !DILocation(line: 65, column: 30, scope: !56)
!83 = !DILocation(line: 67, column: 3, scope: !56)
!84 = !DILocation(line: 68, column: 5, scope: !85)
!85 = distinct !DILexicalBlock(scope: !56, file: !1, line: 67, column: 17)
!86 = !DILocation(line: 70, column: 5, scope: !87)
!87 = distinct !DILexicalBlock(scope: !56, file: !1, line: 69, column: 10)
!88 = !DILocation(line: 72, column: 3, scope: !56)
