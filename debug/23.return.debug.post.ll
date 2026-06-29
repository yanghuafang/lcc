; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [18 x i8] c"23.return.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [18 x i8] c"23.return.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @checkAge1(i32 %0) !dbg !2 {
entry:
  %age = alloca i32, align 4
    #dbg_declare(ptr %age, !7, !DIExpression(), !8)
  store i32 %0, ptr %age, align 4, !dbg !8
  %1 = load i32, ptr %age, align 4, !dbg !9
  %2 = icmp slt i32 %1, 18, !dbg !9
  br i1 %2, label %then, label %else, !dbg !9

then:                                             ; preds = %entry
  %3 = load i32, ptr %age, align 4, !dbg !10
  ret i32 %3, !dbg !10

else:                                             ; preds = %entry
  br label %if.end, !dbg !10

if.end:                                           ; preds = %else
  %4 = load i32, ptr %age, align 4, !dbg !12
  %5 = icmp eq i32 %4, 18, !dbg !12
  br i1 %5, label %then1, label %else2, !dbg !12

then1:                                            ; preds = %if.end
  %6 = load i32, ptr %age, align 4, !dbg !13
  ret i32 %6, !dbg !13

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !15

if.end3:                                          ; preds = %else2
  %7 = load i32, ptr %age, align 4, !dbg !16
  %8 = icmp sgt i32 %7, 18, !dbg !16
  br i1 %8, label %then4, label %else5, !dbg !16

then4:                                            ; preds = %if.end3
  %9 = load i32, ptr %age, align 4, !dbg !17
  ret i32 %9, !dbg !17

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !17

if.end6:                                          ; preds = %else5
  %10 = load i32, ptr %age, align 4, !dbg !19
  ret i32 %10, !dbg !19
}

define i32 @checkAge2(i32 %0) !dbg !20 {
entry:
  %age = alloca i32, align 4
    #dbg_declare(ptr %age, !21, !DIExpression(), !22)
  store i32 %0, ptr %age, align 4, !dbg !22
  %1 = load i32, ptr %age, align 4, !dbg !23
  %2 = icmp slt i32 %1, 18, !dbg !23
  br i1 %2, label %then, label %else, !dbg !23

then:                                             ; preds = %entry
  %3 = load i32, ptr %age, align 4, !dbg !24
  ret i32 %3, !dbg !24

else:                                             ; preds = %entry
  %4 = load i32, ptr %age, align 4, !dbg !26
  %5 = icmp eq i32 %4, 18, !dbg !26
  br i1 %5, label %then1, label %else2, !dbg !26

then1:                                            ; preds = %else
  %6 = load i32, ptr %age, align 4, !dbg !27
  ret i32 %6, !dbg !27

else2:                                            ; preds = %else
  %7 = load i32, ptr %age, align 4, !dbg !29
  ret i32 %7, !dbg !29
}

define i32 @checkAge3(i32 %0) !dbg !31 {
entry:
  %age = alloca i32, align 4
    #dbg_declare(ptr %age, !32, !DIExpression(), !33)
  store i32 %0, ptr %age, align 4, !dbg !33
  %1 = load i32, ptr %age, align 4, !dbg !34
  %2 = icmp sle i32 %1, 6, !dbg !34
  br i1 %2, label %then, label %else, !dbg !34

then:                                             ; preds = %entry
  %3 = load i32, ptr %age, align 4, !dbg !35
  ret i32 %3, !dbg !35

else:                                             ; preds = %entry
  %4 = load i32, ptr %age, align 4, !dbg !37
  %5 = icmp sgt i32 %4, 6, !dbg !37
  %6 = load i32, ptr %age, align 4, !dbg !37
  %7 = icmp sle i32 %6, 14, !dbg !37
  %8 = select i1 %5, i1 %7, i1 false, !dbg !37
  br i1 %8, label %then1, label %else2, !dbg !37

then1:                                            ; preds = %else
  %9 = load i32, ptr %age, align 4, !dbg !38
  ret i32 %9, !dbg !38

else2:                                            ; preds = %else
  %10 = load i32, ptr %age, align 4, !dbg !40
  %11 = icmp sgt i32 %10, 14, !dbg !40
  %12 = load i32, ptr %age, align 4, !dbg !40
  %13 = icmp sle i32 %12, 18, !dbg !40
  %14 = select i1 %11, i1 %13, i1 false, !dbg !40
  br i1 %14, label %then3, label %else4, !dbg !40

then3:                                            ; preds = %else2
  %15 = load i32, ptr %age, align 4, !dbg !41
  ret i32 %15, !dbg !41

else4:                                            ; preds = %else2
  %16 = load i32, ptr %age, align 4, !dbg !43
  %17 = icmp sgt i32 %16, 18, !dbg !43
  %18 = load i32, ptr %age, align 4, !dbg !43
  %19 = icmp sle i32 %18, 35, !dbg !43
  %20 = select i1 %17, i1 %19, i1 false, !dbg !43
  br i1 %20, label %then5, label %else6, !dbg !43

then5:                                            ; preds = %else4
  %21 = load i32, ptr %age, align 4, !dbg !44
  ret i32 %21, !dbg !44

else6:                                            ; preds = %else4
  br label %if.end, !dbg !44

if.end:                                           ; preds = %else6
  br label %if.end7, !dbg !44

if.end7:                                          ; preds = %if.end
  br label %if.end8, !dbg !44

if.end8:                                          ; preds = %if.end7
  br label %if.end9, !dbg !44

if.end9:                                          ; preds = %if.end8
  %22 = load i32, ptr %age, align 4, !dbg !46
  ret i32 %22, !dbg !46
}

define i32 @main() !dbg !47 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !50, !DIExpression(), !51)
  store i32 0, ptr %err, align 4, !dbg !51
  %0 = call i32 @checkAge1(i32 16), !dbg !52
  %1 = icmp ne i32 %0, 16, !dbg !52
  br i1 %1, label %then, label %else, !dbg !52

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !53
  %2 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end, !dbg !53

else:                                             ; preds = %entry
  br label %if.end, !dbg !53

if.end:                                           ; preds = %else, %then
  %3 = call i32 @checkAge1(i32 18), !dbg !54
  %4 = icmp ne i32 %3, 18, !dbg !54
  br i1 %4, label %then1, label %else2, !dbg !54

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !55
  %5 = load i32, ptr %err, align 4, !dbg !55
  br label %if.end3, !dbg !55

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !55

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @checkAge1(i32 20), !dbg !56
  %7 = icmp ne i32 %6, 20, !dbg !56
  br i1 %7, label %then4, label %else5, !dbg !56

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !57
  %8 = load i32, ptr %err, align 4, !dbg !57
  br label %if.end6, !dbg !57

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !57

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @checkAge2(i32 16), !dbg !58
  %10 = icmp ne i32 %9, 16, !dbg !58
  br i1 %10, label %then7, label %else8, !dbg !58

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !59
  %11 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end9, !dbg !59

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !59

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @checkAge2(i32 18), !dbg !60
  %13 = icmp ne i32 %12, 18, !dbg !60
  br i1 %13, label %then10, label %else11, !dbg !60

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !61
  %14 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end12, !dbg !61

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !61

if.end12:                                         ; preds = %else11, %then10
  %15 = call i32 @checkAge2(i32 20), !dbg !62
  %16 = icmp ne i32 %15, 20, !dbg !62
  br i1 %16, label %then13, label %else14, !dbg !62

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !63
  %17 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end15, !dbg !63

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !63

if.end15:                                         ; preds = %else14, %then13
  %18 = call i32 @checkAge3(i32 6), !dbg !64
  %19 = icmp ne i32 %18, 6, !dbg !64
  br i1 %19, label %then16, label %else17, !dbg !64

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !65
  %20 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end18, !dbg !65

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !65

if.end18:                                         ; preds = %else17, %then16
  %21 = call i32 @checkAge3(i32 35), !dbg !66
  %22 = icmp ne i32 %21, 35, !dbg !66
  br i1 %22, label %then19, label %else20, !dbg !66

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !67
  %23 = load i32, ptr %err, align 4, !dbg !67
  br label %if.end21, !dbg !67

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !67

if.end21:                                         ; preds = %else20, %then19
  %24 = load i32, ptr %err, align 4, !dbg !68
  %25 = icmp eq i32 %24, 0, !dbg !68
  br i1 %25, label %then22, label %else23, !dbg !68

then22:                                           ; preds = %if.end21
  %26 = call i32 (ptr, ...) @printf(ptr @0), !dbg !69
  br label %if.end24, !dbg !69

else23:                                           ; preds = %if.end21
  %27 = call i32 (ptr, ...) @printf(ptr @1), !dbg !71
  br label %if.end24, !dbg !71

if.end24:                                         ; preds = %else23, %then22
  %28 = load i32, ptr %err, align 4, !dbg !73
  ret i32 %28, !dbg !73
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "23.return.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "checkAge1", linkageName: "checkAge1", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "age", arg: 1, scope: !2, file: !1, line: 3, type: !5)
!8 = !DILocation(line: 3, column: 5, scope: !2)
!9 = !DILocation(line: 4, column: 3, scope: !2)
!10 = !DILocation(line: 5, column: 5, scope: !11)
!11 = distinct !DILexicalBlock(scope: !2, file: !1, line: 4, column: 17)
!12 = !DILocation(line: 7, column: 3, scope: !2)
!13 = !DILocation(line: 8, column: 5, scope: !14)
!14 = distinct !DILexicalBlock(scope: !2, file: !1, line: 7, column: 18)
!15 = !DILocation(line: 9, column: 10, scope: !2)
!16 = !DILocation(line: 11, column: 3, scope: !2)
!17 = !DILocation(line: 12, column: 5, scope: !18)
!18 = distinct !DILexicalBlock(scope: !2, file: !1, line: 11, column: 17)
!19 = !DILocation(line: 14, column: 3, scope: !2)
!20 = distinct !DISubprogram(name: "checkAge2", linkageName: "checkAge2", scope: null, file: !1, line: 17, type: !3, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!21 = !DILocalVariable(name: "age", arg: 1, scope: !20, file: !1, line: 17, type: !5)
!22 = !DILocation(line: 17, column: 5, scope: !20)
!23 = !DILocation(line: 18, column: 3, scope: !20)
!24 = !DILocation(line: 19, column: 5, scope: !25)
!25 = distinct !DILexicalBlock(scope: !20, file: !1, line: 18, column: 17)
!26 = !DILocation(line: 20, column: 10, scope: !20)
!27 = !DILocation(line: 21, column: 5, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !1, line: 20, column: 25)
!29 = !DILocation(line: 23, column: 5, scope: !30)
!30 = distinct !DILexicalBlock(scope: !20, file: !1, line: 22, column: 10)
!31 = distinct !DISubprogram(name: "checkAge3", linkageName: "checkAge3", scope: null, file: !1, line: 27, type: !3, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!32 = !DILocalVariable(name: "age", arg: 1, scope: !31, file: !1, line: 27, type: !5)
!33 = !DILocation(line: 27, column: 5, scope: !31)
!34 = !DILocation(line: 28, column: 3, scope: !31)
!35 = !DILocation(line: 29, column: 5, scope: !36)
!36 = distinct !DILexicalBlock(scope: !31, file: !1, line: 28, column: 17)
!37 = !DILocation(line: 30, column: 10, scope: !31)
!38 = !DILocation(line: 31, column: 5, scope: !39)
!39 = distinct !DILexicalBlock(scope: !31, file: !1, line: 30, column: 36)
!40 = !DILocation(line: 32, column: 10, scope: !31)
!41 = !DILocation(line: 33, column: 5, scope: !42)
!42 = distinct !DILexicalBlock(scope: !31, file: !1, line: 32, column: 37)
!43 = !DILocation(line: 34, column: 10, scope: !31)
!44 = !DILocation(line: 35, column: 5, scope: !45)
!45 = distinct !DILexicalBlock(scope: !31, file: !1, line: 34, column: 37)
!46 = !DILocation(line: 37, column: 3, scope: !31)
!47 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 40, type: !48, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!48 = !DISubroutineType(types: !49)
!49 = !{!5}
!50 = !DILocalVariable(name: "err", scope: !47, file: !1, line: 41, type: !5)
!51 = !DILocation(line: 41, column: 3, scope: !47)
!52 = !DILocation(line: 43, column: 3, scope: !47)
!53 = !DILocation(line: 43, column: 28, scope: !47)
!54 = !DILocation(line: 44, column: 3, scope: !47)
!55 = !DILocation(line: 44, column: 28, scope: !47)
!56 = !DILocation(line: 45, column: 3, scope: !47)
!57 = !DILocation(line: 45, column: 28, scope: !47)
!58 = !DILocation(line: 46, column: 3, scope: !47)
!59 = !DILocation(line: 46, column: 28, scope: !47)
!60 = !DILocation(line: 47, column: 3, scope: !47)
!61 = !DILocation(line: 47, column: 28, scope: !47)
!62 = !DILocation(line: 48, column: 3, scope: !47)
!63 = !DILocation(line: 48, column: 28, scope: !47)
!64 = !DILocation(line: 49, column: 3, scope: !47)
!65 = !DILocation(line: 49, column: 26, scope: !47)
!66 = !DILocation(line: 50, column: 3, scope: !47)
!67 = !DILocation(line: 50, column: 28, scope: !47)
!68 = !DILocation(line: 52, column: 3, scope: !47)
!69 = !DILocation(line: 53, column: 5, scope: !70)
!70 = distinct !DILexicalBlock(scope: !47, file: !1, line: 52, column: 17)
!71 = !DILocation(line: 55, column: 5, scope: !72)
!72 = distinct !DILexicalBlock(scope: !47, file: !1, line: 54, column: 10)
!73 = !DILocation(line: 57, column: 3, scope: !47)
