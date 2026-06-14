; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@chosen = global ptr null
@0 = private unnamed_addr constant [24 x i8] c"49.func_pointer.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"49.func_pointer.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @addOne(i32 %0) !dbg !4 {
entry:
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !9, !DIExpression(), !10)
  store i32 %0, ptr %x, align 4, !dbg !10
  %1 = load i32, ptr %x, align 4, !dbg !11
  %2 = add i32 %1, 1, !dbg !11
  ret i32 %2, !dbg !11
}

define i32 @square(i32 %0) !dbg !12 {
entry:
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !13, !DIExpression(), !14)
  store i32 %0, ptr %x, align 4, !dbg !14
  %1 = load i32, ptr %x, align 4, !dbg !15
  %2 = load i32, ptr %x, align 4, !dbg !15
  %3 = mul i32 %1, %2, !dbg !15
  ret i32 %3, !dbg !15
}

define i32 @addTwo(i32 %0, i32 %1) !dbg !16 {
entry:
  %b = alloca i32, align 4
    #dbg_declare(ptr %b, !19, !DIExpression(), !20)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !21, !DIExpression(), !20)
  store i32 %0, ptr %a, align 4, !dbg !20
  store i32 %1, ptr %b, align 4, !dbg !20
  %2 = load i32, ptr %a, align 4, !dbg !22
  %3 = load i32, ptr %b, align 4, !dbg !22
  %4 = add i32 %2, %3, !dbg !22
  ret i32 %4, !dbg !22
}

define i32 @apply(ptr %0, i32 %1) !dbg !23 {
entry:
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !28, !DIExpression(), !29)
  %fn = alloca ptr, align 8
    #dbg_declare(ptr %fn, !30, !DIExpression(), !29)
  store ptr %0, ptr %fn, align 8, !dbg !29
  store i32 %1, ptr %n, align 4, !dbg !29
  %2 = load ptr, ptr %fn, align 8, !dbg !31
  %3 = load i32, ptr %n, align 4, !dbg !31
  %4 = call i32 %2(i32 %3), !dbg !31
  ret i32 %4, !dbg !31
}

define i32 @sumWith(ptr %0, i32 %1, i32 %2) !dbg !32 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !35, !DIExpression(), !36)
  %total = alloca i32, align 4
    #dbg_declare(ptr %total, !37, !DIExpression(), !38)
  %to = alloca i32, align 4
    #dbg_declare(ptr %to, !39, !DIExpression(), !40)
  %from = alloca i32, align 4
    #dbg_declare(ptr %from, !41, !DIExpression(), !40)
  %fn = alloca ptr, align 8
    #dbg_declare(ptr %fn, !42, !DIExpression(), !40)
  store ptr %0, ptr %fn, align 8, !dbg !40
  store i32 %1, ptr %from, align 4, !dbg !40
  store i32 %2, ptr %to, align 4, !dbg !40
  store i32 0, ptr %total, align 4, !dbg !38
  %3 = load i32, ptr %from, align 4, !dbg !36
  store i32 %3, ptr %i, align 4, !dbg !36
  br label %while.cond, !dbg !43

while.cond:                                       ; preds = %while.loop, %entry
  %4 = load i32, ptr %i, align 4, !dbg !43
  %5 = load i32, ptr %to, align 4, !dbg !43
  %6 = icmp sle i32 %4, %5, !dbg !43
  br i1 %6, label %while.loop, label %while.end, !dbg !43

while.loop:                                       ; preds = %while.cond
  %7 = load i32, ptr %total, align 4, !dbg !44
  %8 = load ptr, ptr %fn, align 8, !dbg !44
  %9 = load i32, ptr %i, align 4, !dbg !44
  %10 = call i32 %8(i32 %9), !dbg !44
  %11 = add i32 %7, %10, !dbg !44
  store i32 %11, ptr %total, align 4, !dbg !44
  %12 = load i32, ptr %total, align 4, !dbg !44
  %13 = load i32, ptr %i, align 4, !dbg !46
  %14 = add i32 %13, 1, !dbg !46
  store i32 %14, ptr %i, align 4, !dbg !46
  %15 = load i32, ptr %i, align 4, !dbg !46
  br label %while.cond, !dbg !46

while.end:                                        ; preds = %while.cond
  %16 = load i32, ptr %total, align 4, !dbg !47
  ret i32 %16, !dbg !47
}

define i32 @main() !dbg !48 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !51, !DIExpression(), !52)
  %q = alloca ptr, align 8
    #dbg_declare(ptr %q, !53, !DIExpression(), !54)
  %p = alloca ptr, align 8
    #dbg_declare(ptr %p, !55, !DIExpression(), !56)
  %failed = alloca i32, align 4
    #dbg_declare(ptr %failed, !57, !DIExpression(), !58)
  store i32 0, ptr %failed, align 4, !dbg !58
  store ptr @addOne, ptr %p, align 8, !dbg !59
  %0 = load ptr, ptr %p, align 8, !dbg !59
  %1 = load ptr, ptr %p, align 8, !dbg !60
  %2 = call i32 %1(i32 10), !dbg !60
  %3 = icmp ne i32 %2, 11, !dbg !60
  br i1 %3, label %then, label %else, !dbg !60

then:                                             ; preds = %entry
  store i32 1, ptr %failed, align 4, !dbg !61
  %4 = load i32, ptr %failed, align 4, !dbg !61
  br label %if.end, !dbg !61

else:                                             ; preds = %entry
  br label %if.end, !dbg !61

if.end:                                           ; preds = %else, %then
  store ptr @square, ptr %p, align 8, !dbg !63
  %5 = load ptr, ptr %p, align 8, !dbg !63
  %6 = load ptr, ptr %p, align 8, !dbg !64
  %7 = call i32 %6(i32 6), !dbg !64
  %8 = icmp ne i32 %7, 36, !dbg !64
  br i1 %8, label %then1, label %else2, !dbg !64

then1:                                            ; preds = %if.end
  store i32 1, ptr %failed, align 4, !dbg !65
  %9 = load i32, ptr %failed, align 4, !dbg !65
  br label %if.end3, !dbg !65

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !65

if.end3:                                          ; preds = %else2, %then1
  store ptr @addTwo, ptr %q, align 8, !dbg !67
  %10 = load ptr, ptr %q, align 8, !dbg !67
  %11 = load ptr, ptr %q, align 8, !dbg !68
  %12 = call i32 %11(i32 3, i32 4), !dbg !68
  %13 = icmp ne i32 %12, 7, !dbg !68
  br i1 %13, label %then4, label %else5, !dbg !68

then4:                                            ; preds = %if.end3
  store i32 1, ptr %failed, align 4, !dbg !69
  %14 = load i32, ptr %failed, align 4, !dbg !69
  br label %if.end6, !dbg !69

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !69

if.end6:                                          ; preds = %else5, %then4
  %15 = load ptr, ptr %p, align 8, !dbg !71
  %16 = call i32 %15(i32 5), !dbg !71
  %17 = add i32 %16, 1, !dbg !71
  store i32 %17, ptr %r, align 4, !dbg !71
  %18 = load i32, ptr %r, align 4, !dbg !71
  %19 = load i32, ptr %r, align 4, !dbg !72
  %20 = icmp ne i32 %19, 26, !dbg !72
  br i1 %20, label %then7, label %else8, !dbg !72

then7:                                            ; preds = %if.end6
  store i32 1, ptr %failed, align 4, !dbg !73
  %21 = load i32, ptr %failed, align 4, !dbg !73
  br label %if.end9, !dbg !73

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !73

if.end9:                                          ; preds = %else8, %then7
  %22 = call i32 @apply(ptr @addOne, i32 41), !dbg !75
  %23 = icmp ne i32 %22, 42, !dbg !75
  br i1 %23, label %then10, label %else11, !dbg !75

then10:                                           ; preds = %if.end9
  store i32 1, ptr %failed, align 4, !dbg !76
  %24 = load i32, ptr %failed, align 4, !dbg !76
  br label %if.end12, !dbg !76

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !76

if.end12:                                         ; preds = %else11, %then10
  %25 = call i32 @apply(ptr @square, i32 7), !dbg !78
  %26 = icmp ne i32 %25, 49, !dbg !78
  br i1 %26, label %then13, label %else14, !dbg !78

then13:                                           ; preds = %if.end12
  store i32 1, ptr %failed, align 4, !dbg !79
  %27 = load i32, ptr %failed, align 4, !dbg !79
  br label %if.end15, !dbg !79

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !79

if.end15:                                         ; preds = %else14, %then13
  %28 = call i32 @sumWith(ptr @square, i32 1, i32 4), !dbg !81
  %29 = icmp ne i32 %28, 30, !dbg !81
  br i1 %29, label %then16, label %else17, !dbg !81

then16:                                           ; preds = %if.end15
  store i32 1, ptr %failed, align 4, !dbg !82
  %30 = load i32, ptr %failed, align 4, !dbg !82
  br label %if.end18, !dbg !82

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !82

if.end18:                                         ; preds = %else17, %then16
  store ptr @addOne, ptr @chosen, align 8, !dbg !84
  %31 = load ptr, ptr @chosen, align 8, !dbg !84
  %32 = load ptr, ptr @chosen, align 8, !dbg !85
  %33 = call i32 %32(i32 99), !dbg !85
  %34 = icmp ne i32 %33, 100, !dbg !85
  br i1 %34, label %then19, label %else20, !dbg !85

then19:                                           ; preds = %if.end18
  store i32 1, ptr %failed, align 4, !dbg !86
  %35 = load i32, ptr %failed, align 4, !dbg !86
  br label %if.end21, !dbg !86

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !86

if.end21:                                         ; preds = %else20, %then19
  store ptr @addOne, ptr %p, align 8, !dbg !88
  %36 = load ptr, ptr %p, align 8, !dbg !88
  %37 = load ptr, ptr %p, align 8, !dbg !89
  %38 = call i32 %37(i32 7), !dbg !89
  %39 = icmp ne i32 %38, 8, !dbg !89
  br i1 %39, label %then22, label %else23, !dbg !89

then22:                                           ; preds = %if.end21
  store i32 1, ptr %failed, align 4, !dbg !90
  %40 = load i32, ptr %failed, align 4, !dbg !90
  br label %if.end24, !dbg !90

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !90

if.end24:                                         ; preds = %else23, %then22
  %41 = load i32, ptr %failed, align 4, !dbg !92
  %42 = icmp eq i32 %41, 0, !dbg !92
  br i1 %42, label %then25, label %else26, !dbg !92

then25:                                           ; preds = %if.end24
  %43 = call i32 (ptr, ...) @printf(ptr @0), !dbg !93
  ret i32 0, !dbg !95

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !95

if.end27:                                         ; preds = %else26
  %44 = call i32 (ptr, ...) @printf(ptr @1), !dbg !96
  ret i32 1, !dbg !97
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "49.func_pointer.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "addOne", linkageName: "addOne", scope: null, file: !3, line: 17, type: !5, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "x", arg: 1, scope: !4, file: !3, line: 17, type: !7)
!10 = !DILocation(line: 17, column: 5, scope: !4)
!11 = !DILocation(line: 17, column: 21, scope: !4)
!12 = distinct !DISubprogram(name: "square", linkageName: "square", scope: null, file: !3, line: 18, type: !5, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!13 = !DILocalVariable(name: "x", arg: 1, scope: !12, file: !3, line: 18, type: !7)
!14 = !DILocation(line: 18, column: 5, scope: !12)
!15 = !DILocation(line: 18, column: 21, scope: !12)
!16 = distinct !DISubprogram(name: "addTwo", linkageName: "addTwo", scope: null, file: !3, line: 19, type: !17, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!17 = !DISubroutineType(types: !18)
!18 = !{!7, !7, !7}
!19 = !DILocalVariable(name: "b", arg: 2, scope: !16, file: !3, line: 19, type: !7)
!20 = !DILocation(line: 19, column: 5, scope: !16)
!21 = !DILocalVariable(name: "a", arg: 1, scope: !16, file: !3, line: 19, type: !7)
!22 = !DILocation(line: 19, column: 28, scope: !16)
!23 = distinct !DISubprogram(name: "apply", linkageName: "apply", scope: null, file: !3, line: 21, type: !24, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!24 = !DISubroutineType(types: !25)
!25 = !{!7, !26, !7}
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!28 = !DILocalVariable(name: "n", arg: 2, scope: !23, file: !3, line: 21, type: !7)
!29 = !DILocation(line: 21, column: 5, scope: !23)
!30 = !DILocalVariable(name: "fn", arg: 1, scope: !23, file: !3, line: 21, type: !26)
!31 = !DILocation(line: 21, column: 36, scope: !23)
!32 = distinct !DISubprogram(name: "sumWith", linkageName: "sumWith", scope: null, file: !3, line: 23, type: !33, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!33 = !DISubroutineType(types: !34)
!34 = !{!7, !26, !7, !7}
!35 = !DILocalVariable(name: "i", scope: !32, file: !3, line: 25, type: !7)
!36 = !DILocation(line: 25, column: 3, scope: !32)
!37 = !DILocalVariable(name: "total", scope: !32, file: !3, line: 24, type: !7)
!38 = !DILocation(line: 24, column: 3, scope: !32)
!39 = !DILocalVariable(name: "to", arg: 3, scope: !32, file: !3, line: 23, type: !7)
!40 = !DILocation(line: 23, column: 5, scope: !32)
!41 = !DILocalVariable(name: "from", arg: 2, scope: !32, file: !3, line: 23, type: !7)
!42 = !DILocalVariable(name: "fn", arg: 1, scope: !32, file: !3, line: 23, type: !26)
!43 = !DILocation(line: 27, column: 3, scope: !32)
!44 = !DILocation(line: 28, column: 5, scope: !45)
!45 = distinct !DILexicalBlock(scope: !32, file: !3, line: 27, column: 19)
!46 = !DILocation(line: 29, column: 5, scope: !45)
!47 = !DILocation(line: 31, column: 3, scope: !32)
!48 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 37, type: !49, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!49 = !DISubroutineType(types: !50)
!50 = !{!7}
!51 = !DILocalVariable(name: "r", scope: !48, file: !3, line: 41, type: !7)
!52 = !DILocation(line: 41, column: 3, scope: !48)
!53 = !DILocalVariable(name: "q", scope: !48, file: !3, line: 40, type: !26)
!54 = !DILocation(line: 40, column: 3, scope: !48)
!55 = !DILocalVariable(name: "p", scope: !48, file: !3, line: 39, type: !26)
!56 = !DILocation(line: 39, column: 3, scope: !48)
!57 = !DILocalVariable(name: "failed", scope: !48, file: !3, line: 38, type: !7)
!58 = !DILocation(line: 38, column: 3, scope: !48)
!59 = !DILocation(line: 44, column: 3, scope: !48)
!60 = !DILocation(line: 45, column: 3, scope: !48)
!61 = !DILocation(line: 46, column: 5, scope: !62)
!62 = distinct !DILexicalBlock(scope: !48, file: !3, line: 45, column: 20)
!63 = !DILocation(line: 50, column: 3, scope: !48)
!64 = !DILocation(line: 51, column: 3, scope: !48)
!65 = !DILocation(line: 52, column: 5, scope: !66)
!66 = distinct !DILexicalBlock(scope: !48, file: !3, line: 51, column: 19)
!67 = !DILocation(line: 56, column: 3, scope: !48)
!68 = !DILocation(line: 57, column: 3, scope: !48)
!69 = !DILocation(line: 58, column: 5, scope: !70)
!70 = distinct !DILexicalBlock(scope: !48, file: !3, line: 57, column: 21)
!71 = !DILocation(line: 62, column: 3, scope: !48)
!72 = !DILocation(line: 63, column: 3, scope: !48)
!73 = !DILocation(line: 64, column: 5, scope: !74)
!74 = distinct !DILexicalBlock(scope: !48, file: !3, line: 63, column: 16)
!75 = !DILocation(line: 68, column: 3, scope: !48)
!76 = !DILocation(line: 69, column: 5, scope: !77)
!77 = distinct !DILexicalBlock(scope: !48, file: !3, line: 68, column: 32)
!78 = !DILocation(line: 71, column: 3, scope: !48)
!79 = !DILocation(line: 72, column: 5, scope: !80)
!80 = distinct !DILexicalBlock(scope: !48, file: !3, line: 71, column: 31)
!81 = !DILocation(line: 76, column: 3, scope: !48)
!82 = !DILocation(line: 77, column: 5, scope: !83)
!83 = distinct !DILexicalBlock(scope: !48, file: !3, line: 76, column: 36)
!84 = !DILocation(line: 81, column: 3, scope: !48)
!85 = !DILocation(line: 82, column: 3, scope: !48)
!86 = !DILocation(line: 83, column: 5, scope: !87)
!87 = distinct !DILexicalBlock(scope: !48, file: !3, line: 82, column: 26)
!88 = !DILocation(line: 87, column: 3, scope: !48)
!89 = !DILocation(line: 88, column: 3, scope: !48)
!90 = !DILocation(line: 89, column: 5, scope: !91)
!91 = distinct !DILexicalBlock(scope: !48, file: !3, line: 88, column: 18)
!92 = !DILocation(line: 92, column: 3, scope: !48)
!93 = !DILocation(line: 93, column: 5, scope: !94)
!94 = distinct !DILexicalBlock(scope: !48, file: !3, line: 92, column: 20)
!95 = !DILocation(line: 94, column: 5, scope: !94)
!96 = !DILocation(line: 96, column: 3, scope: !48)
!97 = !DILocation(line: 97, column: 3, scope: !48)
