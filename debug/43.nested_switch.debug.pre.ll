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
    #dbg_declare(ptr %r, !8, !DIExpression(), !9)
  %inner = alloca i32, align 4
    #dbg_declare(ptr %inner, !10, !DIExpression(), !11)
  %outer = alloca i32, align 4
    #dbg_declare(ptr %outer, !12, !DIExpression(), !11)
  store i32 %0, ptr %outer, align 4, !dbg !11
  store i32 %1, ptr %inner, align 4, !dbg !11
  store i32 0, ptr %r, align 4, !dbg !9
  %2 = load i32, ptr %outer, align 4, !dbg !13
  %3 = icmp eq i32 %2, 1, !dbg !13
  br i1 %3, label %case.0, label %switch.compare.0, !dbg !13

switch.compare.0:                                 ; preds = %entry
  %4 = icmp eq i32 %2, 2, !dbg !13
  br i1 %4, label %case.14, label %switch.compare.1, !dbg !13

switch.compare.1:                                 ; preds = %switch.compare.0
  br label %case.25, !dbg !13

case.0:                                           ; preds = %entry
  %5 = load i32, ptr %inner, align 4, !dbg !14
  %6 = icmp eq i32 %5, 1, !dbg !14
  br i1 %6, label %case.03, label %switch.compare.01, !dbg !14

switch.compare.01:                                ; preds = %case.0
  %7 = icmp eq i32 %5, 2, !dbg !14
  br i1 %7, label %case.1, label %switch.compare.12, !dbg !14

switch.compare.12:                                ; preds = %switch.compare.01
  br label %case.2, !dbg !14

case.03:                                          ; preds = %case.0
  %8 = load i32, ptr %r, align 4, !dbg !15
  %9 = add i32 %8, 1, !dbg !15
  store i32 %9, ptr %r, align 4, !dbg !15
  %10 = load i32, ptr %r, align 4, !dbg !15
  br label %switch.end, !dbg !16

case.1:                                           ; preds = %switch.compare.01
  %11 = load i32, ptr %r, align 4, !dbg !17
  %12 = add i32 %11, 2, !dbg !17
  store i32 %12, ptr %r, align 4, !dbg !17
  %13 = load i32, ptr %r, align 4, !dbg !17
  br label %switch.end, !dbg !18

case.2:                                           ; preds = %switch.compare.12
  %14 = load i32, ptr %r, align 4, !dbg !19
  %15 = add i32 %14, 4, !dbg !19
  store i32 %15, ptr %r, align 4, !dbg !19
  %16 = load i32, ptr %r, align 4, !dbg !19
  br label %switch.end, !dbg !20

switch.end:                                       ; preds = %case.2, %case.1, %case.03
  %17 = load i32, ptr %r, align 4, !dbg !21
  %18 = add i32 %17, 10, !dbg !21
  store i32 %18, ptr %r, align 4, !dbg !21
  %19 = load i32, ptr %r, align 4, !dbg !21
  br label %case.14, !dbg !21

case.14:                                          ; preds = %switch.end, %switch.compare.0
  %20 = load i32, ptr %r, align 4, !dbg !22
  %21 = add i32 %20, 100, !dbg !22
  store i32 %21, ptr %r, align 4, !dbg !22
  %22 = load i32, ptr %r, align 4, !dbg !22
  br label %switch.end6, !dbg !23

case.25:                                          ; preds = %switch.compare.1
  %23 = load i32, ptr %r, align 4, !dbg !24
  %24 = add i32 %23, 1000, !dbg !24
  store i32 %24, ptr %r, align 4, !dbg !24
  %25 = load i32, ptr %r, align 4, !dbg !24
  br label %switch.end6, !dbg !25

switch.end6:                                      ; preds = %case.25, %case.14
  %26 = load i32, ptr %r, align 4, !dbg !26
  ret i32 %26, !dbg !26
}

define i32 @threeDeep(i32 %0) !dbg !27 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !30, !DIExpression(), !31)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !32, !DIExpression(), !33)
  store i32 %0, ptr %x, align 4, !dbg !33
  store i32 0, ptr %r, align 4, !dbg !31
  %1 = load i32, ptr %x, align 4, !dbg !34
  %2 = icmp eq i32 %1, 1, !dbg !34
  br i1 %2, label %case.0, label %switch.compare.0, !dbg !34

switch.compare.0:                                 ; preds = %entry
  br label %case.15, !dbg !34

case.0:                                           ; preds = %entry
  %3 = load i32, ptr %x, align 4, !dbg !35
  %4 = icmp eq i32 %3, 1, !dbg !35
  br i1 %4, label %case.02, label %switch.compare.01, !dbg !35

switch.compare.01:                                ; preds = %case.0
  %5 = icmp eq i32 %3, 2, !dbg !35
  br i1 %5, label %case.1, label %switch.end4, !dbg !35

case.02:                                          ; preds = %case.0
  %6 = load i32, ptr %x, align 4, !dbg !36
  %7 = icmp eq i32 %6, 1, !dbg !36
  br i1 %7, label %case.03, label %switch.end, !dbg !36

case.03:                                          ; preds = %case.02
  %8 = load i32, ptr %r, align 4, !dbg !37
  %9 = add i32 %8, 1, !dbg !37
  store i32 %9, ptr %r, align 4, !dbg !37
  %10 = load i32, ptr %r, align 4, !dbg !37
  br label %switch.end, !dbg !38

switch.end:                                       ; preds = %case.03, %case.02
  %11 = load i32, ptr %r, align 4, !dbg !39
  %12 = add i32 %11, 2, !dbg !39
  store i32 %12, ptr %r, align 4, !dbg !39
  %13 = load i32, ptr %r, align 4, !dbg !39
  br label %case.1, !dbg !39

case.1:                                           ; preds = %switch.end, %switch.compare.01
  %14 = load i32, ptr %r, align 4, !dbg !40
  %15 = add i32 %14, 4, !dbg !40
  store i32 %15, ptr %r, align 4, !dbg !40
  %16 = load i32, ptr %r, align 4, !dbg !40
  br label %switch.end4, !dbg !41

switch.end4:                                      ; preds = %case.1, %switch.compare.01
  %17 = load i32, ptr %r, align 4, !dbg !42
  %18 = add i32 %17, 8, !dbg !42
  store i32 %18, ptr %r, align 4, !dbg !42
  %19 = load i32, ptr %r, align 4, !dbg !42
  br label %switch.end6, !dbg !43

case.15:                                          ; preds = %switch.compare.0
  %20 = load i32, ptr %r, align 4, !dbg !44
  %21 = add i32 %20, 16, !dbg !44
  store i32 %21, ptr %r, align 4, !dbg !44
  %22 = load i32, ptr %r, align 4, !dbg !44
  br label %switch.end6, !dbg !45

switch.end6:                                      ; preds = %case.15, %switch.end4
  %23 = load i32, ptr %r, align 4, !dbg !46
  ret i32 %23, !dbg !46
}

define i32 @loopWithNestedSwitch() !dbg !47 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !50, !DIExpression(), !51)
  %total = alloca i32, align 4
    #dbg_declare(ptr %total, !52, !DIExpression(), !53)
  store i32 0, ptr %total, align 4, !dbg !53
  store i32 0, ptr %i, align 4, !dbg !51
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, ptr %i, align 4, !dbg !51
  %1 = icmp slt i32 %0, 5, !dbg !51
  br i1 %1, label %for.loop, label %for.end, !dbg !51

for.loop:                                         ; preds = %for.cond
  %2 = load i32, ptr %i, align 4, !dbg !54
  %3 = icmp eq i32 %2, 0, !dbg !54
  br i1 %3, label %case.0, label %switch.compare.0, !dbg !54

switch.compare.0:                                 ; preds = %for.loop
  %4 = icmp eq i32 %2, 3, !dbg !54
  br i1 %4, label %case.1, label %switch.compare.1, !dbg !54

switch.compare.1:                                 ; preds = %switch.compare.0
  br label %case.2, !dbg !54

case.0:                                           ; preds = %for.loop
  %5 = load i32, ptr %i, align 4, !dbg !56
  %6 = icmp eq i32 %5, 0, !dbg !56
  br i1 %6, label %case.01, label %switch.end, !dbg !56

case.01:                                          ; preds = %case.0
  br label %switch.end, !dbg !57

switch.end:                                       ; preds = %case.01, %case.0
  %7 = load i32, ptr %total, align 4, !dbg !58
  %8 = add i32 %7, 1, !dbg !58
  store i32 %8, ptr %total, align 4, !dbg !58
  %9 = load i32, ptr %total, align 4, !dbg !58
  br label %switch.end2, !dbg !59

case.1:                                           ; preds = %switch.compare.0
  br label %for.update, !dbg !60

case.2:                                           ; preds = %switch.compare.1
  %10 = load i32, ptr %total, align 4, !dbg !61
  %11 = add i32 %10, 10, !dbg !61
  store i32 %11, ptr %total, align 4, !dbg !61
  %12 = load i32, ptr %total, align 4, !dbg !61
  br label %switch.end2, !dbg !62

switch.end2:                                      ; preds = %case.2, %switch.end
  %13 = load i32, ptr %total, align 4, !dbg !63
  %14 = add i32 %13, 100, !dbg !63
  store i32 %14, ptr %total, align 4, !dbg !63
  %15 = load i32, ptr %total, align 4, !dbg !63
  br label %for.update, !dbg !63

for.update:                                       ; preds = %switch.end2, %case.1
  %16 = load i32, ptr %i, align 4, !dbg !63
  %17 = add i32 %16, 1, !dbg !63
  store i32 %17, ptr %i, align 4, !dbg !63
  br label %for.cond, !dbg !63

for.end:                                          ; preds = %for.cond
  %18 = load i32, ptr %total, align 4, !dbg !64
  ret i32 %18, !dbg !64
}

define i32 @main() !dbg !65 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !66, !DIExpression(), !67)
  store i32 0, ptr %err, align 4, !dbg !67
  %0 = call i32 @nested(i32 1, i32 1), !dbg !68
  %1 = icmp ne i32 %0, 111, !dbg !68
  br i1 %1, label %then, label %else, !dbg !68

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !69
  %2 = load i32, ptr %err, align 4, !dbg !69
  br label %if.end, !dbg !69

else:                                             ; preds = %entry
  br label %if.end, !dbg !69

if.end:                                           ; preds = %else, %then
  %3 = call i32 @nested(i32 1, i32 2), !dbg !70
  %4 = icmp ne i32 %3, 112, !dbg !70
  br i1 %4, label %then1, label %else2, !dbg !70

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !71
  %5 = load i32, ptr %err, align 4, !dbg !71
  br label %if.end3, !dbg !71

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !71

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @nested(i32 1, i32 5), !dbg !72
  %7 = icmp ne i32 %6, 114, !dbg !72
  br i1 %7, label %then4, label %else5, !dbg !72

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !73
  %8 = load i32, ptr %err, align 4, !dbg !73
  br label %if.end6, !dbg !73

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !73

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @nested(i32 2, i32 1), !dbg !74
  %10 = icmp ne i32 %9, 100, !dbg !74
  br i1 %10, label %then7, label %else8, !dbg !74

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !75
  %11 = load i32, ptr %err, align 4, !dbg !75
  br label %if.end9, !dbg !75

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !75

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @nested(i32 3, i32 1), !dbg !76
  %13 = icmp ne i32 %12, 1000, !dbg !76
  br i1 %13, label %then10, label %else11, !dbg !76

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !77
  %14 = load i32, ptr %err, align 4, !dbg !77
  br label %if.end12, !dbg !77

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !77

if.end12:                                         ; preds = %else11, %then10
  %15 = call i32 @threeDeep(i32 1), !dbg !78
  %16 = icmp ne i32 %15, 15, !dbg !78
  br i1 %16, label %then13, label %else14, !dbg !78

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !79
  %17 = load i32, ptr %err, align 4, !dbg !79
  br label %if.end15, !dbg !79

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !79

if.end15:                                         ; preds = %else14, %then13
  %18 = call i32 @threeDeep(i32 9), !dbg !80
  %19 = icmp ne i32 %18, 16, !dbg !80
  br i1 %19, label %then16, label %else17, !dbg !80

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !81
  %20 = load i32, ptr %err, align 4, !dbg !81
  br label %if.end18, !dbg !81

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !81

if.end18:                                         ; preds = %else17, %then16
  %21 = call i32 @loopWithNestedSwitch(), !dbg !82
  %22 = icmp ne i32 %21, 431, !dbg !82
  br i1 %22, label %then19, label %else20, !dbg !82

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !83
  %23 = load i32, ptr %err, align 4, !dbg !83
  br label %if.end21, !dbg !83

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !83

if.end21:                                         ; preds = %else20, %then19
  %24 = load i32, ptr %err, align 4, !dbg !84
  %25 = icmp eq i32 %24, 0, !dbg !84
  br i1 %25, label %then22, label %else23, !dbg !84

then22:                                           ; preds = %if.end21
  %26 = call i32 (ptr, ...) @printf(ptr @0), !dbg !85
  br label %if.end24, !dbg !85

else23:                                           ; preds = %if.end21
  %27 = call i32 (ptr, ...) @printf(ptr @1), !dbg !87
  br label %if.end24, !dbg !87

if.end24:                                         ; preds = %else23, %then22
  %28 = load i32, ptr %err, align 4, !dbg !89
  ret i32 %28, !dbg !89
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "43.nested_switch.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "nested", linkageName: "nested", scope: null, file: !3, line: 12, type: !5, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "r", scope: !4, file: !3, line: 13, type: !7)
!9 = !DILocation(line: 13, column: 3, scope: !4)
!10 = !DILocalVariable(name: "inner", arg: 2, scope: !4, file: !3, line: 12, type: !7)
!11 = !DILocation(line: 12, column: 5, scope: !4)
!12 = !DILocalVariable(name: "outer", arg: 1, scope: !4, file: !3, line: 12, type: !7)
!13 = !DILocation(line: 14, column: 3, scope: !4)
!14 = !DILocation(line: 16, column: 7, scope: !4)
!15 = !DILocation(line: 18, column: 11, scope: !4)
!16 = !DILocation(line: 19, column: 11, scope: !4)
!17 = !DILocation(line: 21, column: 11, scope: !4)
!18 = !DILocation(line: 22, column: 11, scope: !4)
!19 = !DILocation(line: 24, column: 11, scope: !4)
!20 = !DILocation(line: 25, column: 11, scope: !4)
!21 = !DILocation(line: 27, column: 7, scope: !4)
!22 = !DILocation(line: 30, column: 7, scope: !4)
!23 = !DILocation(line: 31, column: 7, scope: !4)
!24 = !DILocation(line: 33, column: 7, scope: !4)
!25 = !DILocation(line: 34, column: 7, scope: !4)
!26 = !DILocation(line: 36, column: 3, scope: !4)
!27 = distinct !DISubprogram(name: "threeDeep", linkageName: "threeDeep", scope: null, file: !3, line: 40, type: !28, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{!7, !7}
!30 = !DILocalVariable(name: "r", scope: !27, file: !3, line: 41, type: !7)
!31 = !DILocation(line: 41, column: 3, scope: !27)
!32 = !DILocalVariable(name: "x", arg: 1, scope: !27, file: !3, line: 40, type: !7)
!33 = !DILocation(line: 40, column: 5, scope: !27)
!34 = !DILocation(line: 42, column: 3, scope: !27)
!35 = !DILocation(line: 44, column: 7, scope: !27)
!36 = !DILocation(line: 46, column: 11, scope: !27)
!37 = !DILocation(line: 48, column: 15, scope: !27)
!38 = !DILocation(line: 49, column: 15, scope: !27)
!39 = !DILocation(line: 51, column: 11, scope: !27)
!40 = !DILocation(line: 54, column: 11, scope: !27)
!41 = !DILocation(line: 55, column: 11, scope: !27)
!42 = !DILocation(line: 57, column: 7, scope: !27)
!43 = !DILocation(line: 58, column: 7, scope: !27)
!44 = !DILocation(line: 60, column: 7, scope: !27)
!45 = !DILocation(line: 61, column: 7, scope: !27)
!46 = !DILocation(line: 63, column: 3, scope: !27)
!47 = distinct !DISubprogram(name: "loopWithNestedSwitch", linkageName: "loopWithNestedSwitch", scope: null, file: !3, line: 68, type: !48, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!7}
!50 = !DILocalVariable(name: "i", scope: !47, file: !3, line: 70, type: !7)
!51 = !DILocation(line: 70, column: 8, scope: !47)
!52 = !DILocalVariable(name: "total", scope: !47, file: !3, line: 69, type: !7)
!53 = !DILocation(line: 69, column: 3, scope: !47)
!54 = !DILocation(line: 71, column: 5, scope: !55)
!55 = distinct !DILexicalBlock(scope: !47, file: !3, line: 70, column: 31)
!56 = !DILocation(line: 73, column: 9, scope: !55)
!57 = !DILocation(line: 75, column: 13, scope: !55)
!58 = !DILocation(line: 77, column: 9, scope: !55)
!59 = !DILocation(line: 78, column: 9, scope: !55)
!60 = !DILocation(line: 80, column: 9, scope: !55)
!61 = !DILocation(line: 82, column: 9, scope: !55)
!62 = !DILocation(line: 83, column: 9, scope: !55)
!63 = !DILocation(line: 85, column: 5, scope: !55)
!64 = !DILocation(line: 87, column: 3, scope: !47)
!65 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 90, type: !48, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !2)
!66 = !DILocalVariable(name: "err", scope: !65, file: !3, line: 91, type: !7)
!67 = !DILocation(line: 91, column: 3, scope: !65)
!68 = !DILocation(line: 93, column: 3, scope: !65)
!69 = !DILocation(line: 93, column: 28, scope: !65)
!70 = !DILocation(line: 94, column: 3, scope: !65)
!71 = !DILocation(line: 94, column: 28, scope: !65)
!72 = !DILocation(line: 95, column: 3, scope: !65)
!73 = !DILocation(line: 95, column: 28, scope: !65)
!74 = !DILocation(line: 96, column: 3, scope: !65)
!75 = !DILocation(line: 96, column: 28, scope: !65)
!76 = !DILocation(line: 97, column: 3, scope: !65)
!77 = !DILocation(line: 97, column: 29, scope: !65)
!78 = !DILocation(line: 99, column: 3, scope: !65)
!79 = !DILocation(line: 99, column: 27, scope: !65)
!80 = !DILocation(line: 100, column: 3, scope: !65)
!81 = !DILocation(line: 100, column: 27, scope: !65)
!82 = !DILocation(line: 102, column: 3, scope: !65)
!83 = !DILocation(line: 102, column: 38, scope: !65)
!84 = !DILocation(line: 104, column: 3, scope: !65)
!85 = !DILocation(line: 105, column: 5, scope: !86)
!86 = distinct !DILexicalBlock(scope: !65, file: !3, line: 104, column: 17)
!87 = !DILocation(line: 107, column: 5, scope: !88)
!88 = distinct !DILexicalBlock(scope: !65, file: !3, line: 106, column: 10)
!89 = !DILocation(line: 109, column: 3, scope: !65)
