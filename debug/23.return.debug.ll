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
    #dbg_declare(ptr %age, !9, !DIExpression(), !10)
  store i32 %0, ptr %age, align 4, !dbg !10
  %1 = load i32, ptr %age, align 4, !dbg !11
  %2 = icmp slt i32 %1, 18, !dbg !11
  br i1 %2, label %then, label %else, !dbg !11

then:                                             ; preds = %entry
  %3 = load i32, ptr %age, align 4, !dbg !12
  ret i32 %3, !dbg !12

else:                                             ; preds = %entry
  br label %if.end, !dbg !12

if.end:                                           ; preds = %else
  %4 = load i32, ptr %age, align 4, !dbg !14
  %5 = icmp eq i32 %4, 18, !dbg !14
  br i1 %5, label %then1, label %else2, !dbg !14

then1:                                            ; preds = %if.end
  %6 = load i32, ptr %age, align 4, !dbg !15
  ret i32 %6, !dbg !15

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !17

if.end3:                                          ; preds = %else2
  %7 = load i32, ptr %age, align 4, !dbg !18
  %8 = icmp sgt i32 %7, 18, !dbg !18
  br i1 %8, label %then4, label %else5, !dbg !18

then4:                                            ; preds = %if.end3
  %9 = load i32, ptr %age, align 4, !dbg !19
  ret i32 %9, !dbg !19

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !19

if.end6:                                          ; preds = %else5
  %10 = load i32, ptr %age, align 4, !dbg !21
  ret i32 %10, !dbg !21
}

define i32 @checkAge2(i32 %0) !dbg !22 {
entry:
  %age = alloca i32, align 4
    #dbg_declare(ptr %age, !23, !DIExpression(), !24)
  store i32 %0, ptr %age, align 4, !dbg !24
  %1 = load i32, ptr %age, align 4, !dbg !25
  %2 = icmp slt i32 %1, 18, !dbg !25
  br i1 %2, label %then, label %else, !dbg !25

then:                                             ; preds = %entry
  %3 = load i32, ptr %age, align 4, !dbg !26
  ret i32 %3, !dbg !26

else:                                             ; preds = %entry
  %4 = load i32, ptr %age, align 4, !dbg !28
  %5 = icmp eq i32 %4, 18, !dbg !28
  br i1 %5, label %then1, label %else2, !dbg !28

then1:                                            ; preds = %else
  %6 = load i32, ptr %age, align 4, !dbg !29
  ret i32 %6, !dbg !29

else2:                                            ; preds = %else
  %7 = load i32, ptr %age, align 4, !dbg !31
  ret i32 %7, !dbg !31
}

define i32 @checkAge3(i32 %0) !dbg !33 {
entry:
  %age = alloca i32, align 4
    #dbg_declare(ptr %age, !34, !DIExpression(), !35)
  store i32 %0, ptr %age, align 4, !dbg !35
  %1 = load i32, ptr %age, align 4, !dbg !36
  %2 = icmp sle i32 %1, 6, !dbg !36
  br i1 %2, label %then, label %else, !dbg !36

then:                                             ; preds = %entry
  %3 = load i32, ptr %age, align 4, !dbg !37
  ret i32 %3, !dbg !37

else:                                             ; preds = %entry
  %4 = load i32, ptr %age, align 4, !dbg !39
  %5 = icmp sgt i32 %4, 6, !dbg !39
  %6 = load i32, ptr %age, align 4, !dbg !39
  %7 = icmp sle i32 %6, 14, !dbg !39
  %8 = select i1 %5, i1 %7, i1 false, !dbg !39
  br i1 %8, label %then1, label %else2, !dbg !39

then1:                                            ; preds = %else
  %9 = load i32, ptr %age, align 4, !dbg !40
  ret i32 %9, !dbg !40

else2:                                            ; preds = %else
  %10 = load i32, ptr %age, align 4, !dbg !42
  %11 = icmp sgt i32 %10, 14, !dbg !42
  %12 = load i32, ptr %age, align 4, !dbg !42
  %13 = icmp sle i32 %12, 18, !dbg !42
  %14 = select i1 %11, i1 %13, i1 false, !dbg !42
  br i1 %14, label %then3, label %else4, !dbg !42

then3:                                            ; preds = %else2
  %15 = load i32, ptr %age, align 4, !dbg !43
  ret i32 %15, !dbg !43

else4:                                            ; preds = %else2
  %16 = load i32, ptr %age, align 4, !dbg !45
  %17 = icmp sgt i32 %16, 18, !dbg !45
  %18 = load i32, ptr %age, align 4, !dbg !45
  %19 = icmp sle i32 %18, 35, !dbg !45
  %20 = select i1 %17, i1 %19, i1 false, !dbg !45
  br i1 %20, label %then5, label %else6, !dbg !45

then5:                                            ; preds = %else4
  %21 = load i32, ptr %age, align 4, !dbg !46
  ret i32 %21, !dbg !46

else6:                                            ; preds = %else4
  br label %if.end, !dbg !46

if.end:                                           ; preds = %else6
  br label %if.end7, !dbg !46

if.end7:                                          ; preds = %if.end
  br label %if.end8, !dbg !46

if.end8:                                          ; preds = %if.end7
  br label %if.end9, !dbg !46

if.end9:                                          ; preds = %if.end8
  %22 = load i32, ptr %age, align 4, !dbg !48
  ret i32 %22, !dbg !48
}

define i32 @main() !dbg !49 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !52, !DIExpression(), !53)
  store i32 0, ptr %err, align 4, !dbg !53
  %0 = call i32 @checkAge1(i32 16), !dbg !54
  %1 = icmp ne i32 %0, 16, !dbg !54
  br i1 %1, label %then, label %else, !dbg !54

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !55
  %2 = load i32, ptr %err, align 4, !dbg !55
  br label %if.end, !dbg !55

else:                                             ; preds = %entry
  br label %if.end, !dbg !55

if.end:                                           ; preds = %else, %then
  %3 = call i32 @checkAge1(i32 18), !dbg !56
  %4 = icmp ne i32 %3, 18, !dbg !56
  br i1 %4, label %then1, label %else2, !dbg !56

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !57
  %5 = load i32, ptr %err, align 4, !dbg !57
  br label %if.end3, !dbg !57

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !57

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @checkAge1(i32 20), !dbg !58
  %7 = icmp ne i32 %6, 20, !dbg !58
  br i1 %7, label %then4, label %else5, !dbg !58

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !59
  %8 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end6, !dbg !59

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !59

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @checkAge2(i32 16), !dbg !60
  %10 = icmp ne i32 %9, 16, !dbg !60
  br i1 %10, label %then7, label %else8, !dbg !60

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !61
  %11 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end9, !dbg !61

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !61

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @checkAge2(i32 18), !dbg !62
  %13 = icmp ne i32 %12, 18, !dbg !62
  br i1 %13, label %then10, label %else11, !dbg !62

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !63
  %14 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end12, !dbg !63

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !63

if.end12:                                         ; preds = %else11, %then10
  %15 = call i32 @checkAge2(i32 20), !dbg !64
  %16 = icmp ne i32 %15, 20, !dbg !64
  br i1 %16, label %then13, label %else14, !dbg !64

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !65
  %17 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end15, !dbg !65

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !65

if.end15:                                         ; preds = %else14, %then13
  %18 = call i32 @checkAge3(i32 6), !dbg !66
  %19 = icmp ne i32 %18, 6, !dbg !66
  br i1 %19, label %then16, label %else17, !dbg !66

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !67
  %20 = load i32, ptr %err, align 4, !dbg !67
  br label %if.end18, !dbg !67

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !67

if.end18:                                         ; preds = %else17, %then16
  %21 = call i32 @checkAge3(i32 35), !dbg !68
  %22 = icmp ne i32 %21, 35, !dbg !68
  br i1 %22, label %then19, label %else20, !dbg !68

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !69
  %23 = load i32, ptr %err, align 4, !dbg !69
  br label %if.end21, !dbg !69

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !69

if.end21:                                         ; preds = %else20, %then19
  %24 = load i32, ptr %err, align 4, !dbg !70
  %25 = icmp eq i32 %24, 0, !dbg !70
  br i1 %25, label %then22, label %else23, !dbg !70

then22:                                           ; preds = %if.end21
  %26 = call i32 (ptr, ...) @printf(ptr @0), !dbg !71
  br label %if.end24, !dbg !71

else23:                                           ; preds = %if.end21
  %27 = call i32 (ptr, ...) @printf(ptr @1), !dbg !73
  br label %if.end24, !dbg !73

if.end24:                                         ; preds = %else23, %then22
  %28 = load i32, ptr %err, align 4, !dbg !75
  ret i32 %28, !dbg !75
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "23.return.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "checkAge1", linkageName: "checkAge1", scope: null, file: !3, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "age", arg: 1, scope: !4, file: !3, line: 6, type: !7)
!10 = !DILocation(line: 6, column: 5, scope: !4)
!11 = !DILocation(line: 7, column: 3, scope: !4)
!12 = !DILocation(line: 8, column: 5, scope: !13)
!13 = distinct !DILexicalBlock(scope: !4, file: !3, line: 7, column: 17)
!14 = !DILocation(line: 10, column: 3, scope: !4)
!15 = !DILocation(line: 11, column: 5, scope: !16)
!16 = distinct !DILexicalBlock(scope: !4, file: !3, line: 10, column: 18)
!17 = !DILocation(line: 12, column: 10, scope: !4)
!18 = !DILocation(line: 14, column: 3, scope: !4)
!19 = !DILocation(line: 15, column: 5, scope: !20)
!20 = distinct !DILexicalBlock(scope: !4, file: !3, line: 14, column: 17)
!21 = !DILocation(line: 17, column: 3, scope: !4)
!22 = distinct !DISubprogram(name: "checkAge2", linkageName: "checkAge2", scope: null, file: !3, line: 20, type: !5, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!23 = !DILocalVariable(name: "age", arg: 1, scope: !22, file: !3, line: 20, type: !7)
!24 = !DILocation(line: 20, column: 5, scope: !22)
!25 = !DILocation(line: 21, column: 3, scope: !22)
!26 = !DILocation(line: 22, column: 5, scope: !27)
!27 = distinct !DILexicalBlock(scope: !22, file: !3, line: 21, column: 17)
!28 = !DILocation(line: 23, column: 10, scope: !22)
!29 = !DILocation(line: 24, column: 5, scope: !30)
!30 = distinct !DILexicalBlock(scope: !22, file: !3, line: 23, column: 25)
!31 = !DILocation(line: 26, column: 5, scope: !32)
!32 = distinct !DILexicalBlock(scope: !22, file: !3, line: 25, column: 10)
!33 = distinct !DISubprogram(name: "checkAge3", linkageName: "checkAge3", scope: null, file: !3, line: 30, type: !5, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!34 = !DILocalVariable(name: "age", arg: 1, scope: !33, file: !3, line: 30, type: !7)
!35 = !DILocation(line: 30, column: 5, scope: !33)
!36 = !DILocation(line: 31, column: 3, scope: !33)
!37 = !DILocation(line: 32, column: 5, scope: !38)
!38 = distinct !DILexicalBlock(scope: !33, file: !3, line: 31, column: 17)
!39 = !DILocation(line: 33, column: 10, scope: !33)
!40 = !DILocation(line: 34, column: 5, scope: !41)
!41 = distinct !DILexicalBlock(scope: !33, file: !3, line: 33, column: 36)
!42 = !DILocation(line: 35, column: 10, scope: !33)
!43 = !DILocation(line: 36, column: 5, scope: !44)
!44 = distinct !DILexicalBlock(scope: !33, file: !3, line: 35, column: 37)
!45 = !DILocation(line: 37, column: 10, scope: !33)
!46 = !DILocation(line: 38, column: 5, scope: !47)
!47 = distinct !DILexicalBlock(scope: !33, file: !3, line: 37, column: 37)
!48 = !DILocation(line: 40, column: 3, scope: !33)
!49 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 43, type: !50, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!50 = !DISubroutineType(types: !51)
!51 = !{!7}
!52 = !DILocalVariable(name: "err", scope: !49, file: !3, line: 44, type: !7)
!53 = !DILocation(line: 44, column: 3, scope: !49)
!54 = !DILocation(line: 46, column: 3, scope: !49)
!55 = !DILocation(line: 46, column: 28, scope: !49)
!56 = !DILocation(line: 47, column: 3, scope: !49)
!57 = !DILocation(line: 47, column: 28, scope: !49)
!58 = !DILocation(line: 48, column: 3, scope: !49)
!59 = !DILocation(line: 48, column: 28, scope: !49)
!60 = !DILocation(line: 49, column: 3, scope: !49)
!61 = !DILocation(line: 49, column: 28, scope: !49)
!62 = !DILocation(line: 50, column: 3, scope: !49)
!63 = !DILocation(line: 50, column: 28, scope: !49)
!64 = !DILocation(line: 51, column: 3, scope: !49)
!65 = !DILocation(line: 51, column: 28, scope: !49)
!66 = !DILocation(line: 52, column: 3, scope: !49)
!67 = !DILocation(line: 52, column: 26, scope: !49)
!68 = !DILocation(line: 53, column: 3, scope: !49)
!69 = !DILocation(line: 53, column: 28, scope: !49)
!70 = !DILocation(line: 55, column: 3, scope: !49)
!71 = !DILocation(line: 56, column: 5, scope: !72)
!72 = distinct !DILexicalBlock(scope: !49, file: !3, line: 55, column: 17)
!73 = !DILocation(line: 58, column: 5, scope: !74)
!74 = distinct !DILexicalBlock(scope: !49, file: !3, line: 57, column: 10)
!75 = !DILocation(line: 60, column: 3, scope: !49)
