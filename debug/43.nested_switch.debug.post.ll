; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [25 x i8] c"43.nested_switch.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [25 x i8] c"43.nested_switch.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @nested(i32 %0, i32 %1) !dbg !4 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !9, !DIExpression(), !10)
  %inner = alloca i32, align 4
    #dbg_declare(ptr %inner, !11, !DIExpression(), !12)
  %outer = alloca i32, align 4
    #dbg_declare(ptr %outer, !13, !DIExpression(), !12)
  store i32 %0, ptr %outer, align 4, !dbg !12
  store i32 %1, ptr %inner, align 4, !dbg !12
  store i32 0, ptr %r, align 4, !dbg !10
  %2 = load i32, ptr %outer, align 4, !dbg !14
  %3 = icmp eq i32 %2, 1, !dbg !14
  br i1 %3, label %case.0, label %switch.compare.0, !dbg !14

switch.compare.0:                                 ; preds = %entry
  %4 = icmp eq i32 %2, 2, !dbg !14
  br i1 %4, label %case.13, label %case.24, !dbg !14

case.0:                                           ; preds = %entry
  %5 = load i32, ptr %inner, align 4, !dbg !15
  %6 = icmp eq i32 %5, 1, !dbg !15
  br i1 %6, label %case.02, label %switch.compare.01, !dbg !15

switch.compare.01:                                ; preds = %case.0
  %7 = icmp eq i32 %5, 2, !dbg !15
  br i1 %7, label %case.1, label %case.2, !dbg !15

case.02:                                          ; preds = %case.0
  %8 = load i32, ptr %r, align 4, !dbg !16
  %9 = add i32 %8, 1, !dbg !16
  store i32 %9, ptr %r, align 4, !dbg !16
  %10 = load i32, ptr %r, align 4, !dbg !16
  br label %switch.end, !dbg !17

case.1:                                           ; preds = %switch.compare.01
  %11 = load i32, ptr %r, align 4, !dbg !18
  %12 = add i32 %11, 2, !dbg !18
  store i32 %12, ptr %r, align 4, !dbg !18
  %13 = load i32, ptr %r, align 4, !dbg !18
  br label %switch.end, !dbg !19

case.2:                                           ; preds = %switch.compare.01
  %14 = load i32, ptr %r, align 4, !dbg !20
  %15 = add i32 %14, 4, !dbg !20
  store i32 %15, ptr %r, align 4, !dbg !20
  %16 = load i32, ptr %r, align 4, !dbg !20
  br label %switch.end, !dbg !21

switch.end:                                       ; preds = %case.2, %case.1, %case.02
  %17 = load i32, ptr %r, align 4, !dbg !22
  %18 = add i32 %17, 10, !dbg !22
  store i32 %18, ptr %r, align 4, !dbg !22
  %19 = load i32, ptr %r, align 4, !dbg !22
  br label %case.13, !dbg !22

case.13:                                          ; preds = %switch.end, %switch.compare.0
  %20 = load i32, ptr %r, align 4, !dbg !23
  %21 = add i32 %20, 100, !dbg !23
  store i32 %21, ptr %r, align 4, !dbg !23
  %22 = load i32, ptr %r, align 4, !dbg !23
  br label %switch.end5, !dbg !24

case.24:                                          ; preds = %switch.compare.0
  %23 = load i32, ptr %r, align 4, !dbg !25
  %24 = add i32 %23, 1000, !dbg !25
  store i32 %24, ptr %r, align 4, !dbg !25
  %25 = load i32, ptr %r, align 4, !dbg !25
  br label %switch.end5, !dbg !26

switch.end5:                                      ; preds = %case.24, %case.13
  %26 = load i32, ptr %r, align 4, !dbg !27
  ret i32 %26, !dbg !27
}

define i32 @threeDeep(i32 %0) !dbg !28 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !31, !DIExpression(), !32)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !33, !DIExpression(), !34)
  store i32 %0, ptr %x, align 4, !dbg !34
  store i32 0, ptr %r, align 4, !dbg !32
  %1 = load i32, ptr %x, align 4, !dbg !35
  %2 = icmp eq i32 %1, 1, !dbg !35
  br i1 %2, label %case.0, label %case.14, !dbg !35

case.0:                                           ; preds = %entry
  %3 = load i32, ptr %x, align 4, !dbg !36
  %4 = icmp eq i32 %3, 1, !dbg !36
  br i1 %4, label %case.01, label %switch.compare.0, !dbg !36

switch.compare.0:                                 ; preds = %case.0
  %5 = icmp eq i32 %3, 2, !dbg !36
  br i1 %5, label %case.1, label %switch.end3, !dbg !36

case.01:                                          ; preds = %case.0
  %6 = load i32, ptr %x, align 4, !dbg !37
  %7 = icmp eq i32 %6, 1, !dbg !37
  br i1 %7, label %case.02, label %switch.end, !dbg !37

case.02:                                          ; preds = %case.01
  %8 = load i32, ptr %r, align 4, !dbg !38
  %9 = add i32 %8, 1, !dbg !38
  store i32 %9, ptr %r, align 4, !dbg !38
  %10 = load i32, ptr %r, align 4, !dbg !38
  br label %switch.end, !dbg !39

switch.end:                                       ; preds = %case.02, %case.01
  %11 = load i32, ptr %r, align 4, !dbg !40
  %12 = add i32 %11, 2, !dbg !40
  store i32 %12, ptr %r, align 4, !dbg !40
  %13 = load i32, ptr %r, align 4, !dbg !40
  br label %case.1, !dbg !40

case.1:                                           ; preds = %switch.end, %switch.compare.0
  %14 = load i32, ptr %r, align 4, !dbg !41
  %15 = add i32 %14, 4, !dbg !41
  store i32 %15, ptr %r, align 4, !dbg !41
  %16 = load i32, ptr %r, align 4, !dbg !41
  br label %switch.end3, !dbg !42

switch.end3:                                      ; preds = %case.1, %switch.compare.0
  %17 = load i32, ptr %r, align 4, !dbg !43
  %18 = add i32 %17, 8, !dbg !43
  store i32 %18, ptr %r, align 4, !dbg !43
  %19 = load i32, ptr %r, align 4, !dbg !43
  br label %switch.end5, !dbg !44

case.14:                                          ; preds = %entry
  %20 = load i32, ptr %r, align 4, !dbg !45
  %21 = add i32 %20, 16, !dbg !45
  store i32 %21, ptr %r, align 4, !dbg !45
  %22 = load i32, ptr %r, align 4, !dbg !45
  br label %switch.end5, !dbg !46

switch.end5:                                      ; preds = %case.14, %switch.end3
  %23 = load i32, ptr %r, align 4, !dbg !47
  ret i32 %23, !dbg !47
}

define i32 @loopWithNestedSwitch() !dbg !48 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !51, !DIExpression(), !52)
  %total = alloca i32, align 4
    #dbg_declare(ptr %total, !53, !DIExpression(), !54)
  store i32 0, ptr %total, align 4, !dbg !54
  store i32 0, ptr %i, align 4, !dbg !52
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, ptr %i, align 4, !dbg !52
  %1 = icmp slt i32 %0, 5, !dbg !52
  br i1 %1, label %for.loop, label %for.end, !dbg !52

for.loop:                                         ; preds = %for.cond
  %2 = load i32, ptr %i, align 4, !dbg !55
  %3 = icmp eq i32 %2, 0, !dbg !55
  br i1 %3, label %case.0, label %switch.compare.0, !dbg !55

switch.compare.0:                                 ; preds = %for.loop
  %4 = icmp eq i32 %2, 3, !dbg !55
  br i1 %4, label %case.1, label %case.2, !dbg !55

case.0:                                           ; preds = %for.loop
  %5 = load i32, ptr %i, align 4, !dbg !57
  %6 = icmp eq i32 %5, 0, !dbg !57
  br i1 %6, label %case.01, label %switch.end, !dbg !57

case.01:                                          ; preds = %case.0
  br label %switch.end, !dbg !58

switch.end:                                       ; preds = %case.01, %case.0
  %7 = load i32, ptr %total, align 4, !dbg !59
  %8 = add i32 %7, 1, !dbg !59
  store i32 %8, ptr %total, align 4, !dbg !59
  %9 = load i32, ptr %total, align 4, !dbg !59
  br label %switch.end2, !dbg !60

case.1:                                           ; preds = %switch.compare.0
  br label %for.update, !dbg !61

case.2:                                           ; preds = %switch.compare.0
  %10 = load i32, ptr %total, align 4, !dbg !62
  %11 = add i32 %10, 10, !dbg !62
  store i32 %11, ptr %total, align 4, !dbg !62
  %12 = load i32, ptr %total, align 4, !dbg !62
  br label %switch.end2, !dbg !63

switch.end2:                                      ; preds = %case.2, %switch.end
  %13 = load i32, ptr %total, align 4, !dbg !64
  %14 = add i32 %13, 100, !dbg !64
  store i32 %14, ptr %total, align 4, !dbg !64
  %15 = load i32, ptr %total, align 4, !dbg !64
  br label %for.update, !dbg !64

for.update:                                       ; preds = %switch.end2, %case.1
  %16 = load i32, ptr %i, align 4, !dbg !64
  %17 = add i32 %16, 1, !dbg !64
  store i32 %17, ptr %i, align 4, !dbg !64
  br label %for.cond, !dbg !64

for.end:                                          ; preds = %for.cond
  %18 = load i32, ptr %total, align 4, !dbg !65
  ret i32 %18, !dbg !65
}

define i32 @main() !dbg !66 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !67, !DIExpression(), !68)
  store i32 0, ptr %err, align 4, !dbg !68
  %0 = call i32 @nested(i32 1, i32 1), !dbg !69
  %1 = icmp ne i32 %0, 111, !dbg !69
  br i1 %1, label %then, label %else, !dbg !69

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !70
  %2 = load i32, ptr %err, align 4, !dbg !70
  br label %if.end, !dbg !70

else:                                             ; preds = %entry
  br label %if.end, !dbg !70

if.end:                                           ; preds = %else, %then
  %3 = call i32 @nested(i32 1, i32 2), !dbg !71
  %4 = icmp ne i32 %3, 112, !dbg !71
  br i1 %4, label %then1, label %else2, !dbg !71

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !72
  %5 = load i32, ptr %err, align 4, !dbg !72
  br label %if.end3, !dbg !72

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !72

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @nested(i32 1, i32 5), !dbg !73
  %7 = icmp ne i32 %6, 114, !dbg !73
  br i1 %7, label %then4, label %else5, !dbg !73

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !74
  %8 = load i32, ptr %err, align 4, !dbg !74
  br label %if.end6, !dbg !74

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !74

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @nested(i32 2, i32 1), !dbg !75
  %10 = icmp ne i32 %9, 100, !dbg !75
  br i1 %10, label %then7, label %else8, !dbg !75

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !76
  %11 = load i32, ptr %err, align 4, !dbg !76
  br label %if.end9, !dbg !76

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !76

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @nested(i32 3, i32 1), !dbg !77
  %13 = icmp ne i32 %12, 1000, !dbg !77
  br i1 %13, label %then10, label %else11, !dbg !77

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !78
  %14 = load i32, ptr %err, align 4, !dbg !78
  br label %if.end12, !dbg !78

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !78

if.end12:                                         ; preds = %else11, %then10
  %15 = call i32 @threeDeep(i32 1), !dbg !79
  %16 = icmp ne i32 %15, 15, !dbg !79
  br i1 %16, label %then13, label %else14, !dbg !79

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !80
  %17 = load i32, ptr %err, align 4, !dbg !80
  br label %if.end15, !dbg !80

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !80

if.end15:                                         ; preds = %else14, %then13
  %18 = call i32 @threeDeep(i32 9), !dbg !81
  %19 = icmp ne i32 %18, 16, !dbg !81
  br i1 %19, label %then16, label %else17, !dbg !81

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !82
  %20 = load i32, ptr %err, align 4, !dbg !82
  br label %if.end18, !dbg !82

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !82

if.end18:                                         ; preds = %else17, %then16
  %21 = call i32 @loopWithNestedSwitch(), !dbg !83
  %22 = icmp ne i32 %21, 431, !dbg !83
  br i1 %22, label %then19, label %else20, !dbg !83

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !84
  %23 = load i32, ptr %err, align 4, !dbg !84
  br label %if.end21, !dbg !84

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !84

if.end21:                                         ; preds = %else20, %then19
  %24 = load i32, ptr %err, align 4, !dbg !85
  %25 = icmp eq i32 %24, 0, !dbg !85
  br i1 %25, label %then22, label %else23, !dbg !85

then22:                                           ; preds = %if.end21
  %26 = call i32 (ptr, ...) @printf(ptr @0), !dbg !86
  br label %if.end24, !dbg !86

else23:                                           ; preds = %if.end21
  %27 = call i32 (ptr, ...) @printf(ptr @1), !dbg !88
  br label %if.end24, !dbg !88

if.end24:                                         ; preds = %else23, %then22
  %28 = load i32, ptr %err, align 4, !dbg !90
  ret i32 %28, !dbg !90
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "43.nested_switch.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "nested", linkageName: "nested", scope: null, file: !3, line: 12, type: !5, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "r", scope: !4, file: !3, line: 13, type: !7)
!10 = !DILocation(line: 13, column: 3, scope: !4)
!11 = !DILocalVariable(name: "inner", arg: 2, scope: !4, file: !3, line: 12, type: !7)
!12 = !DILocation(line: 12, column: 5, scope: !4)
!13 = !DILocalVariable(name: "outer", arg: 1, scope: !4, file: !3, line: 12, type: !7)
!14 = !DILocation(line: 14, column: 3, scope: !4)
!15 = !DILocation(line: 16, column: 7, scope: !4)
!16 = !DILocation(line: 18, column: 11, scope: !4)
!17 = !DILocation(line: 19, column: 11, scope: !4)
!18 = !DILocation(line: 21, column: 11, scope: !4)
!19 = !DILocation(line: 22, column: 11, scope: !4)
!20 = !DILocation(line: 24, column: 11, scope: !4)
!21 = !DILocation(line: 25, column: 11, scope: !4)
!22 = !DILocation(line: 27, column: 7, scope: !4)
!23 = !DILocation(line: 30, column: 7, scope: !4)
!24 = !DILocation(line: 31, column: 7, scope: !4)
!25 = !DILocation(line: 33, column: 7, scope: !4)
!26 = !DILocation(line: 34, column: 7, scope: !4)
!27 = !DILocation(line: 36, column: 3, scope: !4)
!28 = distinct !DISubprogram(name: "threeDeep", linkageName: "threeDeep", scope: null, file: !3, line: 40, type: !29, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!29 = !DISubroutineType(types: !30)
!30 = !{!7, !7}
!31 = !DILocalVariable(name: "r", scope: !28, file: !3, line: 41, type: !7)
!32 = !DILocation(line: 41, column: 3, scope: !28)
!33 = !DILocalVariable(name: "x", arg: 1, scope: !28, file: !3, line: 40, type: !7)
!34 = !DILocation(line: 40, column: 5, scope: !28)
!35 = !DILocation(line: 42, column: 3, scope: !28)
!36 = !DILocation(line: 44, column: 7, scope: !28)
!37 = !DILocation(line: 46, column: 11, scope: !28)
!38 = !DILocation(line: 48, column: 15, scope: !28)
!39 = !DILocation(line: 49, column: 15, scope: !28)
!40 = !DILocation(line: 51, column: 11, scope: !28)
!41 = !DILocation(line: 54, column: 11, scope: !28)
!42 = !DILocation(line: 55, column: 11, scope: !28)
!43 = !DILocation(line: 57, column: 7, scope: !28)
!44 = !DILocation(line: 58, column: 7, scope: !28)
!45 = !DILocation(line: 60, column: 7, scope: !28)
!46 = !DILocation(line: 61, column: 7, scope: !28)
!47 = !DILocation(line: 63, column: 3, scope: !28)
!48 = distinct !DISubprogram(name: "loopWithNestedSwitch", linkageName: "loopWithNestedSwitch", scope: null, file: !3, line: 68, type: !49, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!49 = !DISubroutineType(types: !50)
!50 = !{!7}
!51 = !DILocalVariable(name: "i", scope: !48, file: !3, line: 70, type: !7)
!52 = !DILocation(line: 70, column: 8, scope: !48)
!53 = !DILocalVariable(name: "total", scope: !48, file: !3, line: 69, type: !7)
!54 = !DILocation(line: 69, column: 3, scope: !48)
!55 = !DILocation(line: 71, column: 5, scope: !56)
!56 = distinct !DILexicalBlock(scope: !48, file: !3, line: 70, column: 31)
!57 = !DILocation(line: 73, column: 9, scope: !56)
!58 = !DILocation(line: 75, column: 13, scope: !56)
!59 = !DILocation(line: 77, column: 9, scope: !56)
!60 = !DILocation(line: 78, column: 9, scope: !56)
!61 = !DILocation(line: 80, column: 9, scope: !56)
!62 = !DILocation(line: 82, column: 9, scope: !56)
!63 = !DILocation(line: 83, column: 9, scope: !56)
!64 = !DILocation(line: 85, column: 5, scope: !56)
!65 = !DILocation(line: 87, column: 3, scope: !48)
!66 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 90, type: !49, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!67 = !DILocalVariable(name: "err", scope: !66, file: !3, line: 91, type: !7)
!68 = !DILocation(line: 91, column: 3, scope: !66)
!69 = !DILocation(line: 93, column: 3, scope: !66)
!70 = !DILocation(line: 93, column: 28, scope: !66)
!71 = !DILocation(line: 94, column: 3, scope: !66)
!72 = !DILocation(line: 94, column: 28, scope: !66)
!73 = !DILocation(line: 95, column: 3, scope: !66)
!74 = !DILocation(line: 95, column: 28, scope: !66)
!75 = !DILocation(line: 96, column: 3, scope: !66)
!76 = !DILocation(line: 96, column: 28, scope: !66)
!77 = !DILocation(line: 97, column: 3, scope: !66)
!78 = !DILocation(line: 97, column: 29, scope: !66)
!79 = !DILocation(line: 99, column: 3, scope: !66)
!80 = !DILocation(line: 99, column: 27, scope: !66)
!81 = !DILocation(line: 100, column: 3, scope: !66)
!82 = !DILocation(line: 100, column: 27, scope: !66)
!83 = !DILocation(line: 102, column: 3, scope: !66)
!84 = !DILocation(line: 102, column: 38, scope: !66)
!85 = !DILocation(line: 104, column: 3, scope: !66)
!86 = !DILocation(line: 105, column: 5, scope: !87)
!87 = distinct !DILexicalBlock(scope: !66, file: !3, line: 104, column: 17)
!88 = !DILocation(line: 107, column: 5, scope: !89)
!89 = distinct !DILexicalBlock(scope: !66, file: !3, line: 106, column: 10)
!90 = !DILocation(line: 109, column: 3, scope: !66)
