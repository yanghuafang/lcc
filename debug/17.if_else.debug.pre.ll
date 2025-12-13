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
    #dbg_declare(ptr %flags, !8, !DIExpression(), !9)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !10, !DIExpression(), !11)
  store i32 %0, ptr %n, align 4, !dbg !11
  store i32 0, ptr %flags, align 4, !dbg !9
  %1 = load i32, ptr %n, align 4, !dbg !12
  %2 = icmp slt i32 %1, 0, !dbg !12
  br i1 %2, label %then, label %else, !dbg !12

then:                                             ; preds = %entry
  %3 = load i32, ptr %flags, align 4, !dbg !13
  %4 = add i32 %3, 1, !dbg !13
  store i32 %4, ptr %flags, align 4, !dbg !13
  %5 = load i32, ptr %flags, align 4, !dbg !13
  br label %if.end, !dbg !13

else:                                             ; preds = %entry
  br label %if.end, !dbg !13

if.end:                                           ; preds = %else, %then
  %6 = load i32, ptr %n, align 4, !dbg !15
  %7 = icmp eq i32 %6, 0, !dbg !15
  br i1 %7, label %then1, label %else2, !dbg !15

then1:                                            ; preds = %if.end
  %8 = load i32, ptr %flags, align 4, !dbg !16
  %9 = add i32 %8, 2, !dbg !16
  store i32 %9, ptr %flags, align 4, !dbg !16
  %10 = load i32, ptr %flags, align 4, !dbg !16
  br label %if.end3, !dbg !16

else2:                                            ; preds = %if.end
  %11 = load i32, ptr %flags, align 4, !dbg !18
  %12 = add i32 %11, 4, !dbg !18
  store i32 %12, ptr %flags, align 4, !dbg !18
  %13 = load i32, ptr %flags, align 4, !dbg !18
  br label %if.end3, !dbg !18

if.end3:                                          ; preds = %else2, %then1
  %14 = load i32, ptr %n, align 4, !dbg !20
  %15 = icmp sgt i32 %14, 10, !dbg !20
  br i1 %15, label %then4, label %else5, !dbg !20

then4:                                            ; preds = %if.end3
  %16 = load i32, ptr %flags, align 4, !dbg !21
  %17 = add i32 %16, 8, !dbg !21
  store i32 %17, ptr %flags, align 4, !dbg !21
  %18 = load i32, ptr %flags, align 4, !dbg !21
  br label %if.end6, !dbg !21

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !21

if.end6:                                          ; preds = %else5, %then4
  %19 = load i32, ptr %flags, align 4, !dbg !23
  ret i32 %19, !dbg !23
}

define i32 @signBucket(i32 %0) !dbg !24 {
entry:
  %bucket = alloca i32, align 4
    #dbg_declare(ptr %bucket, !25, !DIExpression(), !26)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !27, !DIExpression(), !28)
  store i32 %0, ptr %n, align 4, !dbg !28
  %1 = load i32, ptr %n, align 4, !dbg !29
  %2 = icmp slt i32 %1, 0, !dbg !29
  br i1 %2, label %then, label %else, !dbg !29

then:                                             ; preds = %entry
  store i32 1, ptr %bucket, align 4, !dbg !30
  %3 = load i32, ptr %bucket, align 4, !dbg !30
  br label %if.end3, !dbg !30

else:                                             ; preds = %entry
  %4 = load i32, ptr %n, align 4, !dbg !32
  %5 = icmp eq i32 %4, 0, !dbg !32
  br i1 %5, label %then1, label %else2, !dbg !32

then1:                                            ; preds = %else
  store i32 2, ptr %bucket, align 4, !dbg !33
  %6 = load i32, ptr %bucket, align 4, !dbg !33
  br label %if.end, !dbg !33

else2:                                            ; preds = %else
  store i32 3, ptr %bucket, align 4, !dbg !35
  %7 = load i32, ptr %bucket, align 4, !dbg !35
  br label %if.end, !dbg !35

if.end:                                           ; preds = %else2, %then1
  br label %if.end3, !dbg !35

if.end3:                                          ; preds = %if.end, %then
  %8 = load i32, ptr %bucket, align 4, !dbg !37
  ret i32 %8, !dbg !37
}

define i32 @decadeBucket(i32 %0) !dbg !38 {
entry:
  %bucket = alloca i32, align 4
    #dbg_declare(ptr %bucket, !39, !DIExpression(), !40)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !41, !DIExpression(), !42)
  store i32 %0, ptr %n, align 4, !dbg !42
  %1 = load i32, ptr %n, align 4, !dbg !43
  %2 = icmp sle i32 %1, 9, !dbg !43
  br i1 %2, label %then, label %else, !dbg !43

then:                                             ; preds = %entry
  store i32 0, ptr %bucket, align 4, !dbg !44
  %3 = load i32, ptr %bucket, align 4, !dbg !44
  br label %if.end6, !dbg !44

else:                                             ; preds = %entry
  %4 = load i32, ptr %n, align 4, !dbg !46
  %5 = icmp sle i32 %4, 19, !dbg !46
  br i1 %5, label %then1, label %else2, !dbg !46

then1:                                            ; preds = %else
  store i32 1, ptr %bucket, align 4, !dbg !47
  %6 = load i32, ptr %bucket, align 4, !dbg !47
  br label %if.end5, !dbg !47

else2:                                            ; preds = %else
  %7 = load i32, ptr %n, align 4, !dbg !49
  %8 = icmp sle i32 %7, 29, !dbg !49
  br i1 %8, label %then3, label %else4, !dbg !49

then3:                                            ; preds = %else2
  store i32 2, ptr %bucket, align 4, !dbg !50
  %9 = load i32, ptr %bucket, align 4, !dbg !50
  br label %if.end, !dbg !50

else4:                                            ; preds = %else2
  store i32 3, ptr %bucket, align 4, !dbg !52
  %10 = load i32, ptr %bucket, align 4, !dbg !52
  br label %if.end, !dbg !52

if.end:                                           ; preds = %else4, %then3
  br label %if.end5, !dbg !52

if.end5:                                          ; preds = %if.end, %then1
  br label %if.end6, !dbg !52

if.end6:                                          ; preds = %if.end5, %then
  %11 = load i32, ptr %bucket, align 4, !dbg !54
  ret i32 %11, !dbg !54
}

define i32 @main() !dbg !55 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !58, !DIExpression(), !59)
  store i32 0, ptr %err, align 4, !dbg !59
  %0 = call i32 @accumulateFlags(i32 -5), !dbg !60
  %1 = icmp ne i32 %0, 5, !dbg !60
  br i1 %1, label %then, label %else, !dbg !60

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !61
  %2 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end, !dbg !61

else:                                             ; preds = %entry
  br label %if.end, !dbg !61

if.end:                                           ; preds = %else, %then
  %3 = call i32 @accumulateFlags(i32 0), !dbg !62
  %4 = icmp ne i32 %3, 2, !dbg !62
  br i1 %4, label %then1, label %else2, !dbg !62

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !63
  %5 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end3, !dbg !63

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !63

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @accumulateFlags(i32 5), !dbg !64
  %7 = icmp ne i32 %6, 4, !dbg !64
  br i1 %7, label %then4, label %else5, !dbg !64

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !65
  %8 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end6, !dbg !65

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !65

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @accumulateFlags(i32 15), !dbg !66
  %10 = icmp ne i32 %9, 12, !dbg !66
  br i1 %10, label %then7, label %else8, !dbg !66

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !67
  %11 = load i32, ptr %err, align 4, !dbg !67
  br label %if.end9, !dbg !67

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !67

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @signBucket(i32 -1), !dbg !68
  %13 = icmp ne i32 %12, 1, !dbg !68
  br i1 %13, label %then10, label %else11, !dbg !68

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !69
  %14 = load i32, ptr %err, align 4, !dbg !69
  br label %if.end12, !dbg !69

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !69

if.end12:                                         ; preds = %else11, %then10
  %15 = call i32 @signBucket(i32 0), !dbg !70
  %16 = icmp ne i32 %15, 2, !dbg !70
  br i1 %16, label %then13, label %else14, !dbg !70

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !71
  %17 = load i32, ptr %err, align 4, !dbg !71
  br label %if.end15, !dbg !71

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !71

if.end15:                                         ; preds = %else14, %then13
  %18 = call i32 @signBucket(i32 7), !dbg !72
  %19 = icmp ne i32 %18, 3, !dbg !72
  br i1 %19, label %then16, label %else17, !dbg !72

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !73
  %20 = load i32, ptr %err, align 4, !dbg !73
  br label %if.end18, !dbg !73

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !73

if.end18:                                         ; preds = %else17, %then16
  %21 = call i32 @decadeBucket(i32 5), !dbg !74
  %22 = icmp ne i32 %21, 0, !dbg !74
  br i1 %22, label %then19, label %else20, !dbg !74

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !75
  %23 = load i32, ptr %err, align 4, !dbg !75
  br label %if.end21, !dbg !75

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !75

if.end21:                                         ; preds = %else20, %then19
  %24 = call i32 @decadeBucket(i32 15), !dbg !76
  %25 = icmp ne i32 %24, 1, !dbg !76
  br i1 %25, label %then22, label %else23, !dbg !76

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !77
  %26 = load i32, ptr %err, align 4, !dbg !77
  br label %if.end24, !dbg !77

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !77

if.end24:                                         ; preds = %else23, %then22
  %27 = call i32 @decadeBucket(i32 25), !dbg !78
  %28 = icmp ne i32 %27, 2, !dbg !78
  br i1 %28, label %then25, label %else26, !dbg !78

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !79
  %29 = load i32, ptr %err, align 4, !dbg !79
  br label %if.end27, !dbg !79

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !79

if.end27:                                         ; preds = %else26, %then25
  %30 = call i32 @decadeBucket(i32 35), !dbg !80
  %31 = icmp ne i32 %30, 3, !dbg !80
  br i1 %31, label %then28, label %else29, !dbg !80

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !81
  %32 = load i32, ptr %err, align 4, !dbg !81
  br label %if.end30, !dbg !81

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !81

if.end30:                                         ; preds = %else29, %then28
  %33 = load i32, ptr %err, align 4, !dbg !82
  %34 = icmp eq i32 %33, 0, !dbg !82
  br i1 %34, label %then31, label %else32, !dbg !82

then31:                                           ; preds = %if.end30
  %35 = call i32 (ptr, ...) @printf(ptr @0), !dbg !83
  br label %if.end33, !dbg !83

else32:                                           ; preds = %if.end30
  %36 = call i32 (ptr, ...) @printf(ptr @1), !dbg !85
  br label %if.end33, !dbg !85

if.end33:                                         ; preds = %else32, %then31
  %37 = load i32, ptr %err, align 4, !dbg !87
  ret i32 %37, !dbg !87
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "17.if_else.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "accumulateFlags", linkageName: "accumulateFlags", scope: null, file: !3, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "flags", scope: !4, file: !3, line: 7, type: !7)
!9 = !DILocation(line: 7, column: 3, scope: !4)
!10 = !DILocalVariable(name: "n", arg: 1, scope: !4, file: !3, line: 6, type: !7)
!11 = !DILocation(line: 6, column: 5, scope: !4)
!12 = !DILocation(line: 8, column: 3, scope: !4)
!13 = !DILocation(line: 9, column: 5, scope: !14)
!14 = distinct !DILexicalBlock(scope: !4, file: !3, line: 8, column: 14)
!15 = !DILocation(line: 11, column: 3, scope: !4)
!16 = !DILocation(line: 12, column: 5, scope: !17)
!17 = distinct !DILexicalBlock(scope: !4, file: !3, line: 11, column: 15)
!18 = !DILocation(line: 14, column: 5, scope: !19)
!19 = distinct !DILexicalBlock(scope: !4, file: !3, line: 13, column: 10)
!20 = !DILocation(line: 16, column: 3, scope: !4)
!21 = !DILocation(line: 17, column: 5, scope: !22)
!22 = distinct !DILexicalBlock(scope: !4, file: !3, line: 16, column: 15)
!23 = !DILocation(line: 19, column: 3, scope: !4)
!24 = distinct !DISubprogram(name: "signBucket", linkageName: "signBucket", scope: null, file: !3, line: 23, type: !5, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !2)
!25 = !DILocalVariable(name: "bucket", scope: !24, file: !3, line: 24, type: !7)
!26 = !DILocation(line: 24, column: 3, scope: !24)
!27 = !DILocalVariable(name: "n", arg: 1, scope: !24, file: !3, line: 23, type: !7)
!28 = !DILocation(line: 23, column: 5, scope: !24)
!29 = !DILocation(line: 25, column: 3, scope: !24)
!30 = !DILocation(line: 26, column: 5, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !3, line: 25, column: 14)
!32 = !DILocation(line: 27, column: 10, scope: !24)
!33 = !DILocation(line: 28, column: 5, scope: !34)
!34 = distinct !DILexicalBlock(scope: !24, file: !3, line: 27, column: 22)
!35 = !DILocation(line: 30, column: 5, scope: !36)
!36 = distinct !DILexicalBlock(scope: !24, file: !3, line: 29, column: 10)
!37 = !DILocation(line: 32, column: 3, scope: !24)
!38 = distinct !DISubprogram(name: "decadeBucket", linkageName: "decadeBucket", scope: null, file: !3, line: 36, type: !5, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2)
!39 = !DILocalVariable(name: "bucket", scope: !38, file: !3, line: 37, type: !7)
!40 = !DILocation(line: 37, column: 3, scope: !38)
!41 = !DILocalVariable(name: "n", arg: 1, scope: !38, file: !3, line: 36, type: !7)
!42 = !DILocation(line: 36, column: 5, scope: !38)
!43 = !DILocation(line: 38, column: 3, scope: !38)
!44 = !DILocation(line: 39, column: 5, scope: !45)
!45 = distinct !DILexicalBlock(scope: !38, file: !3, line: 38, column: 15)
!46 = !DILocation(line: 40, column: 10, scope: !38)
!47 = !DILocation(line: 41, column: 5, scope: !48)
!48 = distinct !DILexicalBlock(scope: !38, file: !3, line: 40, column: 23)
!49 = !DILocation(line: 42, column: 10, scope: !38)
!50 = !DILocation(line: 43, column: 5, scope: !51)
!51 = distinct !DILexicalBlock(scope: !38, file: !3, line: 42, column: 23)
!52 = !DILocation(line: 45, column: 5, scope: !53)
!53 = distinct !DILexicalBlock(scope: !38, file: !3, line: 44, column: 10)
!54 = !DILocation(line: 47, column: 3, scope: !38)
!55 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 50, type: !56, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!7}
!58 = !DILocalVariable(name: "err", scope: !55, file: !3, line: 51, type: !7)
!59 = !DILocation(line: 51, column: 3, scope: !55)
!60 = !DILocation(line: 53, column: 3, scope: !55)
!61 = !DILocation(line: 53, column: 33, scope: !55)
!62 = !DILocation(line: 54, column: 3, scope: !55)
!63 = !DILocation(line: 54, column: 32, scope: !55)
!64 = !DILocation(line: 55, column: 3, scope: !55)
!65 = !DILocation(line: 55, column: 32, scope: !55)
!66 = !DILocation(line: 56, column: 3, scope: !55)
!67 = !DILocation(line: 56, column: 34, scope: !55)
!68 = !DILocation(line: 58, column: 3, scope: !55)
!69 = !DILocation(line: 58, column: 28, scope: !55)
!70 = !DILocation(line: 59, column: 3, scope: !55)
!71 = !DILocation(line: 59, column: 27, scope: !55)
!72 = !DILocation(line: 60, column: 3, scope: !55)
!73 = !DILocation(line: 60, column: 27, scope: !55)
!74 = !DILocation(line: 62, column: 3, scope: !55)
!75 = !DILocation(line: 62, column: 29, scope: !55)
!76 = !DILocation(line: 63, column: 3, scope: !55)
!77 = !DILocation(line: 63, column: 30, scope: !55)
!78 = !DILocation(line: 64, column: 3, scope: !55)
!79 = !DILocation(line: 64, column: 30, scope: !55)
!80 = !DILocation(line: 65, column: 3, scope: !55)
!81 = !DILocation(line: 65, column: 30, scope: !55)
!82 = !DILocation(line: 67, column: 3, scope: !55)
!83 = !DILocation(line: 68, column: 5, scope: !84)
!84 = distinct !DILexicalBlock(scope: !55, file: !3, line: 67, column: 17)
!85 = !DILocation(line: 70, column: 5, scope: !86)
!86 = distinct !DILexicalBlock(scope: !55, file: !3, line: 69, column: 10)
!87 = !DILocation(line: 72, column: 3, scope: !55)
