; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [18 x i8] c"23.return.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [18 x i8] c"23.return.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @checkAge1(i32 %0) !dbg !4 {
entry:
  %age = alloca i32, align 4
    #dbg_declare(ptr %age, !8, !DIExpression(), !9)
  store i32 %0, ptr %age, align 4, !dbg !9
  %1 = load i32, ptr %age, align 4, !dbg !10
  %2 = icmp slt i32 %1, 18, !dbg !10
  br i1 %2, label %then, label %else, !dbg !10

then:                                             ; preds = %entry
  %3 = load i32, ptr %age, align 4, !dbg !11
  ret i32 %3, !dbg !11

else:                                             ; preds = %entry
  br label %if.end, !dbg !11

if.end:                                           ; preds = %else
  %4 = load i32, ptr %age, align 4, !dbg !13
  %5 = icmp eq i32 %4, 18, !dbg !13
  br i1 %5, label %then1, label %else2, !dbg !13

then1:                                            ; preds = %if.end
  %6 = load i32, ptr %age, align 4, !dbg !14
  ret i32 %6, !dbg !14

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !16

if.end3:                                          ; preds = %else2
  %7 = load i32, ptr %age, align 4, !dbg !17
  %8 = icmp sgt i32 %7, 18, !dbg !17
  br i1 %8, label %then4, label %else5, !dbg !17

then4:                                            ; preds = %if.end3
  %9 = load i32, ptr %age, align 4, !dbg !18
  ret i32 %9, !dbg !18

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !18

if.end6:                                          ; preds = %else5
  %10 = load i32, ptr %age, align 4, !dbg !20
  ret i32 %10, !dbg !20
}

define i32 @checkAge2(i32 %0) !dbg !21 {
entry:
  %age = alloca i32, align 4
    #dbg_declare(ptr %age, !22, !DIExpression(), !23)
  store i32 %0, ptr %age, align 4, !dbg !23
  %1 = load i32, ptr %age, align 4, !dbg !24
  %2 = icmp slt i32 %1, 18, !dbg !24
  br i1 %2, label %then, label %else, !dbg !24

then:                                             ; preds = %entry
  %3 = load i32, ptr %age, align 4, !dbg !25
  ret i32 %3, !dbg !25

else:                                             ; preds = %entry
  %4 = load i32, ptr %age, align 4, !dbg !27
  %5 = icmp eq i32 %4, 18, !dbg !27
  br i1 %5, label %then1, label %else2, !dbg !27

then1:                                            ; preds = %else
  %6 = load i32, ptr %age, align 4, !dbg !28
  ret i32 %6, !dbg !28

else2:                                            ; preds = %else
  %7 = load i32, ptr %age, align 4, !dbg !30
  ret i32 %7, !dbg !30
}

define i32 @checkAge3(i32 %0) !dbg !32 {
entry:
  %age = alloca i32, align 4
    #dbg_declare(ptr %age, !33, !DIExpression(), !34)
  store i32 %0, ptr %age, align 4, !dbg !34
  %1 = load i32, ptr %age, align 4, !dbg !35
  %2 = icmp sle i32 %1, 6, !dbg !35
  br i1 %2, label %then, label %else, !dbg !35

then:                                             ; preds = %entry
  %3 = load i32, ptr %age, align 4, !dbg !36
  ret i32 %3, !dbg !36

else:                                             ; preds = %entry
  %4 = load i32, ptr %age, align 4, !dbg !38
  %5 = icmp sgt i32 %4, 6, !dbg !38
  br i1 %5, label %land.rhs, label %land.end, !dbg !38

land.rhs:                                         ; preds = %else
  %6 = load i32, ptr %age, align 4, !dbg !38
  %7 = icmp sle i32 %6, 14, !dbg !38
  br label %land.end, !dbg !38

land.end:                                         ; preds = %land.rhs, %else
  %8 = phi i1 [ false, %else ], [ %7, %land.rhs ], !dbg !38
  br i1 %8, label %then1, label %else2, !dbg !38

then1:                                            ; preds = %land.end
  %9 = load i32, ptr %age, align 4, !dbg !39
  ret i32 %9, !dbg !39

else2:                                            ; preds = %land.end
  %10 = load i32, ptr %age, align 4, !dbg !41
  %11 = icmp sgt i32 %10, 14, !dbg !41
  br i1 %11, label %land.rhs3, label %land.end4, !dbg !41

land.rhs3:                                        ; preds = %else2
  %12 = load i32, ptr %age, align 4, !dbg !41
  %13 = icmp sle i32 %12, 18, !dbg !41
  br label %land.end4, !dbg !41

land.end4:                                        ; preds = %land.rhs3, %else2
  %14 = phi i1 [ false, %else2 ], [ %13, %land.rhs3 ], !dbg !41
  br i1 %14, label %then5, label %else6, !dbg !41

then5:                                            ; preds = %land.end4
  %15 = load i32, ptr %age, align 4, !dbg !42
  ret i32 %15, !dbg !42

else6:                                            ; preds = %land.end4
  %16 = load i32, ptr %age, align 4, !dbg !44
  %17 = icmp sgt i32 %16, 18, !dbg !44
  br i1 %17, label %land.rhs7, label %land.end8, !dbg !44

land.rhs7:                                        ; preds = %else6
  %18 = load i32, ptr %age, align 4, !dbg !44
  %19 = icmp sle i32 %18, 35, !dbg !44
  br label %land.end8, !dbg !44

land.end8:                                        ; preds = %land.rhs7, %else6
  %20 = phi i1 [ false, %else6 ], [ %19, %land.rhs7 ], !dbg !44
  br i1 %20, label %then9, label %else10, !dbg !44

then9:                                            ; preds = %land.end8
  %21 = load i32, ptr %age, align 4, !dbg !45
  ret i32 %21, !dbg !45

else10:                                           ; preds = %land.end8
  br label %if.end, !dbg !45

if.end:                                           ; preds = %else10
  br label %if.end11, !dbg !45

if.end11:                                         ; preds = %if.end
  br label %if.end12, !dbg !45

if.end12:                                         ; preds = %if.end11
  br label %if.end13, !dbg !45

if.end13:                                         ; preds = %if.end12
  %22 = load i32, ptr %age, align 4, !dbg !47
  ret i32 %22, !dbg !47
}

define i32 @main() !dbg !48 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !51, !DIExpression(), !52)
  store i32 0, ptr %err, align 4, !dbg !52
  %0 = call i32 @checkAge1(i32 16), !dbg !53
  %1 = icmp ne i32 %0, 16, !dbg !53
  br i1 %1, label %then, label %else, !dbg !53

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !54
  %2 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end, !dbg !54

else:                                             ; preds = %entry
  br label %if.end, !dbg !54

if.end:                                           ; preds = %else, %then
  %3 = call i32 @checkAge1(i32 18), !dbg !55
  %4 = icmp ne i32 %3, 18, !dbg !55
  br i1 %4, label %then1, label %else2, !dbg !55

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !56
  %5 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end3, !dbg !56

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !56

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @checkAge1(i32 20), !dbg !57
  %7 = icmp ne i32 %6, 20, !dbg !57
  br i1 %7, label %then4, label %else5, !dbg !57

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !58
  %8 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end6, !dbg !58

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !58

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @checkAge2(i32 16), !dbg !59
  %10 = icmp ne i32 %9, 16, !dbg !59
  br i1 %10, label %then7, label %else8, !dbg !59

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !60
  %11 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end9, !dbg !60

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !60

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @checkAge2(i32 18), !dbg !61
  %13 = icmp ne i32 %12, 18, !dbg !61
  br i1 %13, label %then10, label %else11, !dbg !61

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !62
  %14 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end12, !dbg !62

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !62

if.end12:                                         ; preds = %else11, %then10
  %15 = call i32 @checkAge2(i32 20), !dbg !63
  %16 = icmp ne i32 %15, 20, !dbg !63
  br i1 %16, label %then13, label %else14, !dbg !63

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !64
  %17 = load i32, ptr %err, align 4, !dbg !64
  br label %if.end15, !dbg !64

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !64

if.end15:                                         ; preds = %else14, %then13
  %18 = call i32 @checkAge3(i32 6), !dbg !65
  %19 = icmp ne i32 %18, 6, !dbg !65
  br i1 %19, label %then16, label %else17, !dbg !65

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !66
  %20 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end18, !dbg !66

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !66

if.end18:                                         ; preds = %else17, %then16
  %21 = call i32 @checkAge3(i32 35), !dbg !67
  %22 = icmp ne i32 %21, 35, !dbg !67
  br i1 %22, label %then19, label %else20, !dbg !67

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !68
  %23 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end21, !dbg !68

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !68

if.end21:                                         ; preds = %else20, %then19
  %24 = load i32, ptr %err, align 4, !dbg !69
  %25 = icmp eq i32 %24, 0, !dbg !69
  br i1 %25, label %then22, label %else23, !dbg !69

then22:                                           ; preds = %if.end21
  %26 = call i32 (ptr, ...) @printf(ptr @0), !dbg !70
  br label %if.end24, !dbg !70

else23:                                           ; preds = %if.end21
  %27 = call i32 (ptr, ...) @printf(ptr @1), !dbg !72
  br label %if.end24, !dbg !72

if.end24:                                         ; preds = %else23, %then22
  %28 = load i32, ptr %err, align 4, !dbg !74
  ret i32 %28, !dbg !74
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "23.return.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "checkAge1", linkageName: "checkAge1", scope: null, file: !3, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "age", arg: 1, scope: !4, file: !3, line: 6, type: !7)
!9 = !DILocation(line: 6, column: 5, scope: !4)
!10 = !DILocation(line: 7, column: 3, scope: !4)
!11 = !DILocation(line: 8, column: 5, scope: !12)
!12 = distinct !DILexicalBlock(scope: !4, file: !3, line: 7, column: 17)
!13 = !DILocation(line: 10, column: 3, scope: !4)
!14 = !DILocation(line: 11, column: 5, scope: !15)
!15 = distinct !DILexicalBlock(scope: !4, file: !3, line: 10, column: 18)
!16 = !DILocation(line: 12, column: 10, scope: !4)
!17 = !DILocation(line: 14, column: 3, scope: !4)
!18 = !DILocation(line: 15, column: 5, scope: !19)
!19 = distinct !DILexicalBlock(scope: !4, file: !3, line: 14, column: 17)
!20 = !DILocation(line: 17, column: 3, scope: !4)
!21 = distinct !DISubprogram(name: "checkAge2", linkageName: "checkAge2", scope: null, file: !3, line: 20, type: !5, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !2)
!22 = !DILocalVariable(name: "age", arg: 1, scope: !21, file: !3, line: 20, type: !7)
!23 = !DILocation(line: 20, column: 5, scope: !21)
!24 = !DILocation(line: 21, column: 3, scope: !21)
!25 = !DILocation(line: 22, column: 5, scope: !26)
!26 = distinct !DILexicalBlock(scope: !21, file: !3, line: 21, column: 17)
!27 = !DILocation(line: 23, column: 10, scope: !21)
!28 = !DILocation(line: 24, column: 5, scope: !29)
!29 = distinct !DILexicalBlock(scope: !21, file: !3, line: 23, column: 25)
!30 = !DILocation(line: 26, column: 5, scope: !31)
!31 = distinct !DILexicalBlock(scope: !21, file: !3, line: 25, column: 10)
!32 = distinct !DISubprogram(name: "checkAge3", linkageName: "checkAge3", scope: null, file: !3, line: 30, type: !5, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2)
!33 = !DILocalVariable(name: "age", arg: 1, scope: !32, file: !3, line: 30, type: !7)
!34 = !DILocation(line: 30, column: 5, scope: !32)
!35 = !DILocation(line: 31, column: 3, scope: !32)
!36 = !DILocation(line: 32, column: 5, scope: !37)
!37 = distinct !DILexicalBlock(scope: !32, file: !3, line: 31, column: 17)
!38 = !DILocation(line: 33, column: 10, scope: !32)
!39 = !DILocation(line: 34, column: 5, scope: !40)
!40 = distinct !DILexicalBlock(scope: !32, file: !3, line: 33, column: 36)
!41 = !DILocation(line: 35, column: 10, scope: !32)
!42 = !DILocation(line: 36, column: 5, scope: !43)
!43 = distinct !DILexicalBlock(scope: !32, file: !3, line: 35, column: 37)
!44 = !DILocation(line: 37, column: 10, scope: !32)
!45 = !DILocation(line: 38, column: 5, scope: !46)
!46 = distinct !DILexicalBlock(scope: !32, file: !3, line: 37, column: 37)
!47 = !DILocation(line: 40, column: 3, scope: !32)
!48 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 43, type: !49, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!7}
!51 = !DILocalVariable(name: "err", scope: !48, file: !3, line: 44, type: !7)
!52 = !DILocation(line: 44, column: 3, scope: !48)
!53 = !DILocation(line: 46, column: 3, scope: !48)
!54 = !DILocation(line: 46, column: 28, scope: !48)
!55 = !DILocation(line: 47, column: 3, scope: !48)
!56 = !DILocation(line: 47, column: 28, scope: !48)
!57 = !DILocation(line: 48, column: 3, scope: !48)
!58 = !DILocation(line: 48, column: 28, scope: !48)
!59 = !DILocation(line: 49, column: 3, scope: !48)
!60 = !DILocation(line: 49, column: 28, scope: !48)
!61 = !DILocation(line: 50, column: 3, scope: !48)
!62 = !DILocation(line: 50, column: 28, scope: !48)
!63 = !DILocation(line: 51, column: 3, scope: !48)
!64 = !DILocation(line: 51, column: 28, scope: !48)
!65 = !DILocation(line: 52, column: 3, scope: !48)
!66 = !DILocation(line: 52, column: 26, scope: !48)
!67 = !DILocation(line: 53, column: 3, scope: !48)
!68 = !DILocation(line: 53, column: 28, scope: !48)
!69 = !DILocation(line: 55, column: 3, scope: !48)
!70 = !DILocation(line: 56, column: 5, scope: !71)
!71 = distinct !DILexicalBlock(scope: !48, file: !3, line: 55, column: 17)
!72 = !DILocation(line: 58, column: 5, scope: !73)
!73 = distinct !DILexicalBlock(scope: !48, file: !3, line: 57, column: 10)
!74 = !DILocation(line: 60, column: 3, scope: !48)
