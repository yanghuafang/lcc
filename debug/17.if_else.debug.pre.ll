; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [19 x i8] c"17.if_else.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"17.if_else.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @accumulateFlags(i32 %0) !dbg !2 {
entry:
  %flags = alloca i32, align 4
    #dbg_declare(ptr %flags, !6, !DIExpression(), !7)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !8, !DIExpression(), !9)
  store i32 %0, ptr %n, align 4, !dbg !9
  store i32 0, ptr %flags, align 4, !dbg !7
  %1 = load i32, ptr %n, align 4, !dbg !10
  %2 = icmp slt i32 %1, 0, !dbg !10
  br i1 %2, label %then, label %else, !dbg !10

then:                                             ; preds = %entry
  %3 = load i32, ptr %flags, align 4, !dbg !11
  %4 = add i32 %3, 1, !dbg !11
  store i32 %4, ptr %flags, align 4, !dbg !11
  %5 = load i32, ptr %flags, align 4, !dbg !11
  br label %if.end, !dbg !11

else:                                             ; preds = %entry
  br label %if.end, !dbg !11

if.end:                                           ; preds = %else, %then
  %6 = load i32, ptr %n, align 4, !dbg !13
  %7 = icmp eq i32 %6, 0, !dbg !13
  br i1 %7, label %then1, label %else2, !dbg !13

then1:                                            ; preds = %if.end
  %8 = load i32, ptr %flags, align 4, !dbg !14
  %9 = add i32 %8, 2, !dbg !14
  store i32 %9, ptr %flags, align 4, !dbg !14
  %10 = load i32, ptr %flags, align 4, !dbg !14
  br label %if.end3, !dbg !14

else2:                                            ; preds = %if.end
  %11 = load i32, ptr %flags, align 4, !dbg !16
  %12 = add i32 %11, 4, !dbg !16
  store i32 %12, ptr %flags, align 4, !dbg !16
  %13 = load i32, ptr %flags, align 4, !dbg !16
  br label %if.end3, !dbg !16

if.end3:                                          ; preds = %else2, %then1
  %14 = load i32, ptr %n, align 4, !dbg !18
  %15 = icmp sgt i32 %14, 10, !dbg !18
  br i1 %15, label %then4, label %else5, !dbg !18

then4:                                            ; preds = %if.end3
  %16 = load i32, ptr %flags, align 4, !dbg !19
  %17 = add i32 %16, 8, !dbg !19
  store i32 %17, ptr %flags, align 4, !dbg !19
  %18 = load i32, ptr %flags, align 4, !dbg !19
  br label %if.end6, !dbg !19

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !19

if.end6:                                          ; preds = %else5, %then4
  %19 = load i32, ptr %flags, align 4, !dbg !21
  ret i32 %19, !dbg !21
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
  br i1 %2, label %then, label %else, !dbg !27

then:                                             ; preds = %entry
  store i32 1, ptr %bucket, align 4, !dbg !28
  %3 = load i32, ptr %bucket, align 4, !dbg !28
  br label %if.end3, !dbg !28

else:                                             ; preds = %entry
  %4 = load i32, ptr %n, align 4, !dbg !30
  %5 = icmp eq i32 %4, 0, !dbg !30
  br i1 %5, label %then1, label %else2, !dbg !30

then1:                                            ; preds = %else
  store i32 2, ptr %bucket, align 4, !dbg !31
  %6 = load i32, ptr %bucket, align 4, !dbg !31
  br label %if.end, !dbg !31

else2:                                            ; preds = %else
  store i32 3, ptr %bucket, align 4, !dbg !33
  %7 = load i32, ptr %bucket, align 4, !dbg !33
  br label %if.end, !dbg !33

if.end:                                           ; preds = %else2, %then1
  br label %if.end3, !dbg !33

if.end3:                                          ; preds = %if.end, %then
  %8 = load i32, ptr %bucket, align 4, !dbg !35
  ret i32 %8, !dbg !35
}

define i32 @decadeBucket(i32 %0) !dbg !36 {
entry:
  %bucket = alloca i32, align 4
    #dbg_declare(ptr %bucket, !37, !DIExpression(), !38)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !39, !DIExpression(), !40)
  store i32 %0, ptr %n, align 4, !dbg !40
  %1 = load i32, ptr %n, align 4, !dbg !41
  %2 = icmp sle i32 %1, 9, !dbg !41
  br i1 %2, label %then, label %else, !dbg !41

then:                                             ; preds = %entry
  store i32 0, ptr %bucket, align 4, !dbg !42
  %3 = load i32, ptr %bucket, align 4, !dbg !42
  br label %if.end6, !dbg !42

else:                                             ; preds = %entry
  %4 = load i32, ptr %n, align 4, !dbg !44
  %5 = icmp sle i32 %4, 19, !dbg !44
  br i1 %5, label %then1, label %else2, !dbg !44

then1:                                            ; preds = %else
  store i32 1, ptr %bucket, align 4, !dbg !45
  %6 = load i32, ptr %bucket, align 4, !dbg !45
  br label %if.end5, !dbg !45

else2:                                            ; preds = %else
  %7 = load i32, ptr %n, align 4, !dbg !47
  %8 = icmp sle i32 %7, 29, !dbg !47
  br i1 %8, label %then3, label %else4, !dbg !47

then3:                                            ; preds = %else2
  store i32 2, ptr %bucket, align 4, !dbg !48
  %9 = load i32, ptr %bucket, align 4, !dbg !48
  br label %if.end, !dbg !48

else4:                                            ; preds = %else2
  store i32 3, ptr %bucket, align 4, !dbg !50
  %10 = load i32, ptr %bucket, align 4, !dbg !50
  br label %if.end, !dbg !50

if.end:                                           ; preds = %else4, %then3
  br label %if.end5, !dbg !50

if.end5:                                          ; preds = %if.end, %then1
  br label %if.end6, !dbg !50

if.end6:                                          ; preds = %if.end5, %then
  %11 = load i32, ptr %bucket, align 4, !dbg !52
  ret i32 %11, !dbg !52
}

define i32 @main() !dbg !53 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !56, !DIExpression(), !57)
  store i32 0, ptr %err, align 4, !dbg !57
  %0 = call i32 @accumulateFlags(i32 -5), !dbg !58
  %1 = icmp ne i32 %0, 5, !dbg !58
  br i1 %1, label %then, label %else, !dbg !58

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !59
  %2 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end, !dbg !59

else:                                             ; preds = %entry
  br label %if.end, !dbg !59

if.end:                                           ; preds = %else, %then
  %3 = call i32 @accumulateFlags(i32 0), !dbg !60
  %4 = icmp ne i32 %3, 2, !dbg !60
  br i1 %4, label %then1, label %else2, !dbg !60

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !61
  %5 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end3, !dbg !61

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !61

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @accumulateFlags(i32 5), !dbg !62
  %7 = icmp ne i32 %6, 4, !dbg !62
  br i1 %7, label %then4, label %else5, !dbg !62

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !63
  %8 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end6, !dbg !63

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !63

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @accumulateFlags(i32 15), !dbg !64
  %10 = icmp ne i32 %9, 12, !dbg !64
  br i1 %10, label %then7, label %else8, !dbg !64

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !65
  %11 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end9, !dbg !65

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !65

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @signBucket(i32 -1), !dbg !66
  %13 = icmp ne i32 %12, 1, !dbg !66
  br i1 %13, label %then10, label %else11, !dbg !66

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !67
  %14 = load i32, ptr %err, align 4, !dbg !67
  br label %if.end12, !dbg !67

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !67

if.end12:                                         ; preds = %else11, %then10
  %15 = call i32 @signBucket(i32 0), !dbg !68
  %16 = icmp ne i32 %15, 2, !dbg !68
  br i1 %16, label %then13, label %else14, !dbg !68

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !69
  %17 = load i32, ptr %err, align 4, !dbg !69
  br label %if.end15, !dbg !69

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !69

if.end15:                                         ; preds = %else14, %then13
  %18 = call i32 @signBucket(i32 7), !dbg !70
  %19 = icmp ne i32 %18, 3, !dbg !70
  br i1 %19, label %then16, label %else17, !dbg !70

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !71
  %20 = load i32, ptr %err, align 4, !dbg !71
  br label %if.end18, !dbg !71

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !71

if.end18:                                         ; preds = %else17, %then16
  %21 = call i32 @decadeBucket(i32 5), !dbg !72
  %22 = icmp ne i32 %21, 0, !dbg !72
  br i1 %22, label %then19, label %else20, !dbg !72

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !73
  %23 = load i32, ptr %err, align 4, !dbg !73
  br label %if.end21, !dbg !73

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !73

if.end21:                                         ; preds = %else20, %then19
  %24 = call i32 @decadeBucket(i32 15), !dbg !74
  %25 = icmp ne i32 %24, 1, !dbg !74
  br i1 %25, label %then22, label %else23, !dbg !74

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !75
  %26 = load i32, ptr %err, align 4, !dbg !75
  br label %if.end24, !dbg !75

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !75

if.end24:                                         ; preds = %else23, %then22
  %27 = call i32 @decadeBucket(i32 25), !dbg !76
  %28 = icmp ne i32 %27, 2, !dbg !76
  br i1 %28, label %then25, label %else26, !dbg !76

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !77
  %29 = load i32, ptr %err, align 4, !dbg !77
  br label %if.end27, !dbg !77

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !77

if.end27:                                         ; preds = %else26, %then25
  %30 = call i32 @decadeBucket(i32 35), !dbg !78
  %31 = icmp ne i32 %30, 3, !dbg !78
  br i1 %31, label %then28, label %else29, !dbg !78

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !79
  %32 = load i32, ptr %err, align 4, !dbg !79
  br label %if.end30, !dbg !79

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !79

if.end30:                                         ; preds = %else29, %then28
  %33 = load i32, ptr %err, align 4, !dbg !80
  %34 = icmp eq i32 %33, 0, !dbg !80
  br i1 %34, label %then31, label %else32, !dbg !80

then31:                                           ; preds = %if.end30
  %35 = call i32 (ptr, ...) @printf(ptr @0), !dbg !81
  br label %if.end33, !dbg !81

else32:                                           ; preds = %if.end30
  %36 = call i32 (ptr, ...) @printf(ptr @1), !dbg !83
  br label %if.end33, !dbg !83

if.end33:                                         ; preds = %else32, %then31
  %37 = load i32, ptr %err, align 4, !dbg !85
  ret i32 %37, !dbg !85
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "17.if_else.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "accumulateFlags", linkageName: "accumulateFlags", scope: null, file: !1, line: 4, type: !3, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "flags", scope: !2, file: !1, line: 5, type: !5)
!7 = !DILocation(line: 5, column: 3, scope: !2)
!8 = !DILocalVariable(name: "n", arg: 1, scope: !2, file: !1, line: 4, type: !5)
!9 = !DILocation(line: 4, column: 5, scope: !2)
!10 = !DILocation(line: 6, column: 3, scope: !2)
!11 = !DILocation(line: 7, column: 5, scope: !12)
!12 = distinct !DILexicalBlock(scope: !2, file: !1, line: 6, column: 14)
!13 = !DILocation(line: 9, column: 3, scope: !2)
!14 = !DILocation(line: 10, column: 5, scope: !15)
!15 = distinct !DILexicalBlock(scope: !2, file: !1, line: 9, column: 15)
!16 = !DILocation(line: 12, column: 5, scope: !17)
!17 = distinct !DILexicalBlock(scope: !2, file: !1, line: 11, column: 10)
!18 = !DILocation(line: 14, column: 3, scope: !2)
!19 = !DILocation(line: 15, column: 5, scope: !20)
!20 = distinct !DILexicalBlock(scope: !2, file: !1, line: 14, column: 15)
!21 = !DILocation(line: 17, column: 3, scope: !2)
!22 = distinct !DISubprogram(name: "signBucket", linkageName: "signBucket", scope: null, file: !1, line: 21, type: !3, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !0)
!23 = !DILocalVariable(name: "bucket", scope: !22, file: !1, line: 22, type: !5)
!24 = !DILocation(line: 22, column: 3, scope: !22)
!25 = !DILocalVariable(name: "n", arg: 1, scope: !22, file: !1, line: 21, type: !5)
!26 = !DILocation(line: 21, column: 5, scope: !22)
!27 = !DILocation(line: 23, column: 3, scope: !22)
!28 = !DILocation(line: 24, column: 5, scope: !29)
!29 = distinct !DILexicalBlock(scope: !22, file: !1, line: 23, column: 14)
!30 = !DILocation(line: 25, column: 10, scope: !22)
!31 = !DILocation(line: 26, column: 5, scope: !32)
!32 = distinct !DILexicalBlock(scope: !22, file: !1, line: 25, column: 22)
!33 = !DILocation(line: 28, column: 5, scope: !34)
!34 = distinct !DILexicalBlock(scope: !22, file: !1, line: 27, column: 10)
!35 = !DILocation(line: 30, column: 3, scope: !22)
!36 = distinct !DISubprogram(name: "decadeBucket", linkageName: "decadeBucket", scope: null, file: !1, line: 34, type: !3, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0)
!37 = !DILocalVariable(name: "bucket", scope: !36, file: !1, line: 35, type: !5)
!38 = !DILocation(line: 35, column: 3, scope: !36)
!39 = !DILocalVariable(name: "n", arg: 1, scope: !36, file: !1, line: 34, type: !5)
!40 = !DILocation(line: 34, column: 5, scope: !36)
!41 = !DILocation(line: 36, column: 3, scope: !36)
!42 = !DILocation(line: 37, column: 5, scope: !43)
!43 = distinct !DILexicalBlock(scope: !36, file: !1, line: 36, column: 15)
!44 = !DILocation(line: 38, column: 10, scope: !36)
!45 = !DILocation(line: 39, column: 5, scope: !46)
!46 = distinct !DILexicalBlock(scope: !36, file: !1, line: 38, column: 23)
!47 = !DILocation(line: 40, column: 10, scope: !36)
!48 = !DILocation(line: 41, column: 5, scope: !49)
!49 = distinct !DILexicalBlock(scope: !36, file: !1, line: 40, column: 23)
!50 = !DILocation(line: 43, column: 5, scope: !51)
!51 = distinct !DILexicalBlock(scope: !36, file: !1, line: 42, column: 10)
!52 = !DILocation(line: 45, column: 3, scope: !36)
!53 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 48, type: !54, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !0)
!54 = !DISubroutineType(types: !55)
!55 = !{!5}
!56 = !DILocalVariable(name: "err", scope: !53, file: !1, line: 49, type: !5)
!57 = !DILocation(line: 49, column: 3, scope: !53)
!58 = !DILocation(line: 51, column: 3, scope: !53)
!59 = !DILocation(line: 51, column: 33, scope: !53)
!60 = !DILocation(line: 52, column: 3, scope: !53)
!61 = !DILocation(line: 52, column: 32, scope: !53)
!62 = !DILocation(line: 53, column: 3, scope: !53)
!63 = !DILocation(line: 53, column: 32, scope: !53)
!64 = !DILocation(line: 54, column: 3, scope: !53)
!65 = !DILocation(line: 54, column: 34, scope: !53)
!66 = !DILocation(line: 56, column: 3, scope: !53)
!67 = !DILocation(line: 56, column: 28, scope: !53)
!68 = !DILocation(line: 57, column: 3, scope: !53)
!69 = !DILocation(line: 57, column: 27, scope: !53)
!70 = !DILocation(line: 58, column: 3, scope: !53)
!71 = !DILocation(line: 58, column: 27, scope: !53)
!72 = !DILocation(line: 60, column: 3, scope: !53)
!73 = !DILocation(line: 60, column: 29, scope: !53)
!74 = !DILocation(line: 61, column: 3, scope: !53)
!75 = !DILocation(line: 61, column: 30, scope: !53)
!76 = !DILocation(line: 62, column: 3, scope: !53)
!77 = !DILocation(line: 62, column: 30, scope: !53)
!78 = !DILocation(line: 63, column: 3, scope: !53)
!79 = !DILocation(line: 63, column: 30, scope: !53)
!80 = !DILocation(line: 65, column: 3, scope: !53)
!81 = !DILocation(line: 66, column: 5, scope: !82)
!82 = distinct !DILexicalBlock(scope: !53, file: !1, line: 65, column: 17)
!83 = !DILocation(line: 68, column: 5, scope: !84)
!84 = distinct !DILexicalBlock(scope: !53, file: !1, line: 67, column: 10)
!85 = !DILocation(line: 70, column: 3, scope: !53)
