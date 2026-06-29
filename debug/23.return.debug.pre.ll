; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [18 x i8] c"23.return.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [18 x i8] c"23.return.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @checkAge1(i32 %0) !dbg !2 {
entry:
  %age = alloca i32, align 4
    #dbg_declare(ptr %age, !6, !DIExpression(), !7)
  store i32 %0, ptr %age, align 4, !dbg !7
  %1 = load i32, ptr %age, align 4, !dbg !8
  %2 = icmp slt i32 %1, 18, !dbg !8
  br i1 %2, label %then, label %else, !dbg !8

then:                                             ; preds = %entry
  %3 = load i32, ptr %age, align 4, !dbg !9
  ret i32 %3, !dbg !9

else:                                             ; preds = %entry
  br label %if.end, !dbg !9

if.end:                                           ; preds = %else
  %4 = load i32, ptr %age, align 4, !dbg !11
  %5 = icmp eq i32 %4, 18, !dbg !11
  br i1 %5, label %then1, label %else2, !dbg !11

then1:                                            ; preds = %if.end
  %6 = load i32, ptr %age, align 4, !dbg !12
  ret i32 %6, !dbg !12

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !14

if.end3:                                          ; preds = %else2
  %7 = load i32, ptr %age, align 4, !dbg !15
  %8 = icmp sgt i32 %7, 18, !dbg !15
  br i1 %8, label %then4, label %else5, !dbg !15

then4:                                            ; preds = %if.end3
  %9 = load i32, ptr %age, align 4, !dbg !16
  ret i32 %9, !dbg !16

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !16

if.end6:                                          ; preds = %else5
  %10 = load i32, ptr %age, align 4, !dbg !18
  ret i32 %10, !dbg !18
}

define i32 @checkAge2(i32 %0) !dbg !19 {
entry:
  %age = alloca i32, align 4
    #dbg_declare(ptr %age, !20, !DIExpression(), !21)
  store i32 %0, ptr %age, align 4, !dbg !21
  %1 = load i32, ptr %age, align 4, !dbg !22
  %2 = icmp slt i32 %1, 18, !dbg !22
  br i1 %2, label %then, label %else, !dbg !22

then:                                             ; preds = %entry
  %3 = load i32, ptr %age, align 4, !dbg !23
  ret i32 %3, !dbg !23

else:                                             ; preds = %entry
  %4 = load i32, ptr %age, align 4, !dbg !25
  %5 = icmp eq i32 %4, 18, !dbg !25
  br i1 %5, label %then1, label %else2, !dbg !25

then1:                                            ; preds = %else
  %6 = load i32, ptr %age, align 4, !dbg !26
  ret i32 %6, !dbg !26

else2:                                            ; preds = %else
  %7 = load i32, ptr %age, align 4, !dbg !28
  ret i32 %7, !dbg !28
}

define i32 @checkAge3(i32 %0) !dbg !30 {
entry:
  %age = alloca i32, align 4
    #dbg_declare(ptr %age, !31, !DIExpression(), !32)
  store i32 %0, ptr %age, align 4, !dbg !32
  %1 = load i32, ptr %age, align 4, !dbg !33
  %2 = icmp sle i32 %1, 6, !dbg !33
  br i1 %2, label %then, label %else, !dbg !33

then:                                             ; preds = %entry
  %3 = load i32, ptr %age, align 4, !dbg !34
  ret i32 %3, !dbg !34

else:                                             ; preds = %entry
  %4 = load i32, ptr %age, align 4, !dbg !36
  %5 = icmp sgt i32 %4, 6, !dbg !36
  %6 = load i32, ptr %age, align 4, !dbg !36
  %7 = icmp sle i32 %6, 14, !dbg !36
  %8 = select i1 %5, i1 %7, i1 false, !dbg !36
  br i1 %8, label %then1, label %else2, !dbg !36

then1:                                            ; preds = %else
  %9 = load i32, ptr %age, align 4, !dbg !37
  ret i32 %9, !dbg !37

else2:                                            ; preds = %else
  %10 = load i32, ptr %age, align 4, !dbg !39
  %11 = icmp sgt i32 %10, 14, !dbg !39
  %12 = load i32, ptr %age, align 4, !dbg !39
  %13 = icmp sle i32 %12, 18, !dbg !39
  %14 = select i1 %11, i1 %13, i1 false, !dbg !39
  br i1 %14, label %then3, label %else4, !dbg !39

then3:                                            ; preds = %else2
  %15 = load i32, ptr %age, align 4, !dbg !40
  ret i32 %15, !dbg !40

else4:                                            ; preds = %else2
  %16 = load i32, ptr %age, align 4, !dbg !42
  %17 = icmp sgt i32 %16, 18, !dbg !42
  %18 = load i32, ptr %age, align 4, !dbg !42
  %19 = icmp sle i32 %18, 35, !dbg !42
  %20 = select i1 %17, i1 %19, i1 false, !dbg !42
  br i1 %20, label %then5, label %else6, !dbg !42

then5:                                            ; preds = %else4
  %21 = load i32, ptr %age, align 4, !dbg !43
  ret i32 %21, !dbg !43

else6:                                            ; preds = %else4
  br label %if.end, !dbg !43

if.end:                                           ; preds = %else6
  br label %if.end7, !dbg !43

if.end7:                                          ; preds = %if.end
  br label %if.end8, !dbg !43

if.end8:                                          ; preds = %if.end7
  br label %if.end9, !dbg !43

if.end9:                                          ; preds = %if.end8
  %22 = load i32, ptr %age, align 4, !dbg !45
  ret i32 %22, !dbg !45
}

define i32 @main() !dbg !46 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !49, !DIExpression(), !50)
  store i32 0, ptr %err, align 4, !dbg !50
  %0 = call i32 @checkAge1(i32 16), !dbg !51
  %1 = icmp ne i32 %0, 16, !dbg !51
  br i1 %1, label %then, label %else, !dbg !51

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !52
  %2 = load i32, ptr %err, align 4, !dbg !52
  br label %if.end, !dbg !52

else:                                             ; preds = %entry
  br label %if.end, !dbg !52

if.end:                                           ; preds = %else, %then
  %3 = call i32 @checkAge1(i32 18), !dbg !53
  %4 = icmp ne i32 %3, 18, !dbg !53
  br i1 %4, label %then1, label %else2, !dbg !53

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !54
  %5 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end3, !dbg !54

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !54

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @checkAge1(i32 20), !dbg !55
  %7 = icmp ne i32 %6, 20, !dbg !55
  br i1 %7, label %then4, label %else5, !dbg !55

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !56
  %8 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end6, !dbg !56

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !56

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @checkAge2(i32 16), !dbg !57
  %10 = icmp ne i32 %9, 16, !dbg !57
  br i1 %10, label %then7, label %else8, !dbg !57

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !58
  %11 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end9, !dbg !58

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !58

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @checkAge2(i32 18), !dbg !59
  %13 = icmp ne i32 %12, 18, !dbg !59
  br i1 %13, label %then10, label %else11, !dbg !59

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !60
  %14 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end12, !dbg !60

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !60

if.end12:                                         ; preds = %else11, %then10
  %15 = call i32 @checkAge2(i32 20), !dbg !61
  %16 = icmp ne i32 %15, 20, !dbg !61
  br i1 %16, label %then13, label %else14, !dbg !61

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !62
  %17 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end15, !dbg !62

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !62

if.end15:                                         ; preds = %else14, %then13
  %18 = call i32 @checkAge3(i32 6), !dbg !63
  %19 = icmp ne i32 %18, 6, !dbg !63
  br i1 %19, label %then16, label %else17, !dbg !63

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !64
  %20 = load i32, ptr %err, align 4, !dbg !64
  br label %if.end18, !dbg !64

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !64

if.end18:                                         ; preds = %else17, %then16
  %21 = call i32 @checkAge3(i32 35), !dbg !65
  %22 = icmp ne i32 %21, 35, !dbg !65
  br i1 %22, label %then19, label %else20, !dbg !65

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !66
  %23 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end21, !dbg !66

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !66

if.end21:                                         ; preds = %else20, %then19
  %24 = load i32, ptr %err, align 4, !dbg !67
  %25 = icmp eq i32 %24, 0, !dbg !67
  br i1 %25, label %then22, label %else23, !dbg !67

then22:                                           ; preds = %if.end21
  %26 = call i32 (ptr, ...) @printf(ptr @0), !dbg !68
  br label %if.end24, !dbg !68

else23:                                           ; preds = %if.end21
  %27 = call i32 (ptr, ...) @printf(ptr @1), !dbg !70
  br label %if.end24, !dbg !70

if.end24:                                         ; preds = %else23, %then22
  %28 = load i32, ptr %err, align 4, !dbg !72
  ret i32 %28, !dbg !72
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "23.return.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "checkAge1", linkageName: "checkAge1", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "age", arg: 1, scope: !2, file: !1, line: 3, type: !5)
!7 = !DILocation(line: 3, column: 5, scope: !2)
!8 = !DILocation(line: 4, column: 3, scope: !2)
!9 = !DILocation(line: 5, column: 5, scope: !10)
!10 = distinct !DILexicalBlock(scope: !2, file: !1, line: 4, column: 17)
!11 = !DILocation(line: 7, column: 3, scope: !2)
!12 = !DILocation(line: 8, column: 5, scope: !13)
!13 = distinct !DILexicalBlock(scope: !2, file: !1, line: 7, column: 18)
!14 = !DILocation(line: 9, column: 10, scope: !2)
!15 = !DILocation(line: 11, column: 3, scope: !2)
!16 = !DILocation(line: 12, column: 5, scope: !17)
!17 = distinct !DILexicalBlock(scope: !2, file: !1, line: 11, column: 17)
!18 = !DILocation(line: 14, column: 3, scope: !2)
!19 = distinct !DISubprogram(name: "checkAge2", linkageName: "checkAge2", scope: null, file: !1, line: 17, type: !3, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0)
!20 = !DILocalVariable(name: "age", arg: 1, scope: !19, file: !1, line: 17, type: !5)
!21 = !DILocation(line: 17, column: 5, scope: !19)
!22 = !DILocation(line: 18, column: 3, scope: !19)
!23 = !DILocation(line: 19, column: 5, scope: !24)
!24 = distinct !DILexicalBlock(scope: !19, file: !1, line: 18, column: 17)
!25 = !DILocation(line: 20, column: 10, scope: !19)
!26 = !DILocation(line: 21, column: 5, scope: !27)
!27 = distinct !DILexicalBlock(scope: !19, file: !1, line: 20, column: 25)
!28 = !DILocation(line: 23, column: 5, scope: !29)
!29 = distinct !DILexicalBlock(scope: !19, file: !1, line: 22, column: 10)
!30 = distinct !DISubprogram(name: "checkAge3", linkageName: "checkAge3", scope: null, file: !1, line: 27, type: !3, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0)
!31 = !DILocalVariable(name: "age", arg: 1, scope: !30, file: !1, line: 27, type: !5)
!32 = !DILocation(line: 27, column: 5, scope: !30)
!33 = !DILocation(line: 28, column: 3, scope: !30)
!34 = !DILocation(line: 29, column: 5, scope: !35)
!35 = distinct !DILexicalBlock(scope: !30, file: !1, line: 28, column: 17)
!36 = !DILocation(line: 30, column: 10, scope: !30)
!37 = !DILocation(line: 31, column: 5, scope: !38)
!38 = distinct !DILexicalBlock(scope: !30, file: !1, line: 30, column: 36)
!39 = !DILocation(line: 32, column: 10, scope: !30)
!40 = !DILocation(line: 33, column: 5, scope: !41)
!41 = distinct !DILexicalBlock(scope: !30, file: !1, line: 32, column: 37)
!42 = !DILocation(line: 34, column: 10, scope: !30)
!43 = !DILocation(line: 35, column: 5, scope: !44)
!44 = distinct !DILexicalBlock(scope: !30, file: !1, line: 34, column: 37)
!45 = !DILocation(line: 37, column: 3, scope: !30)
!46 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 40, type: !47, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0)
!47 = !DISubroutineType(types: !48)
!48 = !{!5}
!49 = !DILocalVariable(name: "err", scope: !46, file: !1, line: 41, type: !5)
!50 = !DILocation(line: 41, column: 3, scope: !46)
!51 = !DILocation(line: 43, column: 3, scope: !46)
!52 = !DILocation(line: 43, column: 28, scope: !46)
!53 = !DILocation(line: 44, column: 3, scope: !46)
!54 = !DILocation(line: 44, column: 28, scope: !46)
!55 = !DILocation(line: 45, column: 3, scope: !46)
!56 = !DILocation(line: 45, column: 28, scope: !46)
!57 = !DILocation(line: 46, column: 3, scope: !46)
!58 = !DILocation(line: 46, column: 28, scope: !46)
!59 = !DILocation(line: 47, column: 3, scope: !46)
!60 = !DILocation(line: 47, column: 28, scope: !46)
!61 = !DILocation(line: 48, column: 3, scope: !46)
!62 = !DILocation(line: 48, column: 28, scope: !46)
!63 = !DILocation(line: 49, column: 3, scope: !46)
!64 = !DILocation(line: 49, column: 26, scope: !46)
!65 = !DILocation(line: 50, column: 3, scope: !46)
!66 = !DILocation(line: 50, column: 28, scope: !46)
!67 = !DILocation(line: 52, column: 3, scope: !46)
!68 = !DILocation(line: 53, column: 5, scope: !69)
!69 = distinct !DILexicalBlock(scope: !46, file: !1, line: 52, column: 17)
!70 = !DILocation(line: 55, column: 5, scope: !71)
!71 = distinct !DILexicalBlock(scope: !46, file: !1, line: 54, column: 10)
!72 = !DILocation(line: 57, column: 3, scope: !46)
