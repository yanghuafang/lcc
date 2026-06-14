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
    #dbg_declare(ptr %x, !8, !DIExpression(), !9)
  store i32 %0, ptr %x, align 4, !dbg !9
  %1 = load i32, ptr %x, align 4, !dbg !10
  %2 = add i32 %1, 1, !dbg !10
  ret i32 %2, !dbg !10
}

define i32 @square(i32 %0) !dbg !11 {
entry:
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !12, !DIExpression(), !13)
  store i32 %0, ptr %x, align 4, !dbg !13
  %1 = load i32, ptr %x, align 4, !dbg !14
  %2 = load i32, ptr %x, align 4, !dbg !14
  %3 = mul i32 %1, %2, !dbg !14
  ret i32 %3, !dbg !14
}

define i32 @addTwo(i32 %0, i32 %1) !dbg !15 {
entry:
  %b = alloca i32, align 4
    #dbg_declare(ptr %b, !18, !DIExpression(), !19)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !20, !DIExpression(), !19)
  store i32 %0, ptr %a, align 4, !dbg !19
  store i32 %1, ptr %b, align 4, !dbg !19
  %2 = load i32, ptr %a, align 4, !dbg !21
  %3 = load i32, ptr %b, align 4, !dbg !21
  %4 = add i32 %2, %3, !dbg !21
  ret i32 %4, !dbg !21
}

define i32 @apply(ptr %0, i32 %1) !dbg !22 {
entry:
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !27, !DIExpression(), !28)
  %fn = alloca ptr, align 8
    #dbg_declare(ptr %fn, !29, !DIExpression(), !28)
  store ptr %0, ptr %fn, align 8, !dbg !28
  store i32 %1, ptr %n, align 4, !dbg !28
  %2 = load ptr, ptr %fn, align 8, !dbg !30
  %3 = load i32, ptr %n, align 4, !dbg !30
  %4 = call i32 %2(i32 %3), !dbg !30
  ret i32 %4, !dbg !30
}

define i32 @sumWith(ptr %0, i32 %1, i32 %2) !dbg !31 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !34, !DIExpression(), !35)
  %total = alloca i32, align 4
    #dbg_declare(ptr %total, !36, !DIExpression(), !37)
  %to = alloca i32, align 4
    #dbg_declare(ptr %to, !38, !DIExpression(), !39)
  %from = alloca i32, align 4
    #dbg_declare(ptr %from, !40, !DIExpression(), !39)
  %fn = alloca ptr, align 8
    #dbg_declare(ptr %fn, !41, !DIExpression(), !39)
  store ptr %0, ptr %fn, align 8, !dbg !39
  store i32 %1, ptr %from, align 4, !dbg !39
  store i32 %2, ptr %to, align 4, !dbg !39
  store i32 0, ptr %total, align 4, !dbg !37
  %3 = load i32, ptr %from, align 4, !dbg !35
  store i32 %3, ptr %i, align 4, !dbg !35
  br label %while.cond, !dbg !42

while.cond:                                       ; preds = %while.loop, %entry
  %4 = load i32, ptr %i, align 4, !dbg !42
  %5 = load i32, ptr %to, align 4, !dbg !42
  %6 = icmp sle i32 %4, %5, !dbg !42
  br i1 %6, label %while.loop, label %while.end, !dbg !42

while.loop:                                       ; preds = %while.cond
  %7 = load i32, ptr %total, align 4, !dbg !43
  %8 = load ptr, ptr %fn, align 8, !dbg !43
  %9 = load i32, ptr %i, align 4, !dbg !43
  %10 = call i32 %8(i32 %9), !dbg !43
  %11 = add i32 %7, %10, !dbg !43
  store i32 %11, ptr %total, align 4, !dbg !43
  %12 = load i32, ptr %total, align 4, !dbg !43
  %13 = load i32, ptr %i, align 4, !dbg !45
  %14 = add i32 %13, 1, !dbg !45
  store i32 %14, ptr %i, align 4, !dbg !45
  %15 = load i32, ptr %i, align 4, !dbg !45
  br label %while.cond, !dbg !45

while.end:                                        ; preds = %while.cond
  %16 = load i32, ptr %total, align 4, !dbg !46
  ret i32 %16, !dbg !46
}

define i32 @main() !dbg !47 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !50, !DIExpression(), !51)
  %q = alloca ptr, align 8
    #dbg_declare(ptr %q, !52, !DIExpression(), !53)
  %p = alloca ptr, align 8
    #dbg_declare(ptr %p, !54, !DIExpression(), !55)
  %failed = alloca i32, align 4
    #dbg_declare(ptr %failed, !56, !DIExpression(), !57)
  store i32 0, ptr %failed, align 4, !dbg !57
  store ptr @addOne, ptr %p, align 8, !dbg !58
  %0 = load ptr, ptr %p, align 8, !dbg !58
  %1 = load ptr, ptr %p, align 8, !dbg !59
  %2 = call i32 %1(i32 10), !dbg !59
  %3 = icmp ne i32 %2, 11, !dbg !59
  br i1 %3, label %then, label %else, !dbg !59

then:                                             ; preds = %entry
  store i32 1, ptr %failed, align 4, !dbg !60
  %4 = load i32, ptr %failed, align 4, !dbg !60
  br label %if.end, !dbg !60

else:                                             ; preds = %entry
  br label %if.end, !dbg !60

if.end:                                           ; preds = %else, %then
  store ptr @square, ptr %p, align 8, !dbg !62
  %5 = load ptr, ptr %p, align 8, !dbg !62
  %6 = load ptr, ptr %p, align 8, !dbg !63
  %7 = call i32 %6(i32 6), !dbg !63
  %8 = icmp ne i32 %7, 36, !dbg !63
  br i1 %8, label %then1, label %else2, !dbg !63

then1:                                            ; preds = %if.end
  store i32 1, ptr %failed, align 4, !dbg !64
  %9 = load i32, ptr %failed, align 4, !dbg !64
  br label %if.end3, !dbg !64

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !64

if.end3:                                          ; preds = %else2, %then1
  store ptr @addTwo, ptr %q, align 8, !dbg !66
  %10 = load ptr, ptr %q, align 8, !dbg !66
  %11 = load ptr, ptr %q, align 8, !dbg !67
  %12 = call i32 %11(i32 3, i32 4), !dbg !67
  %13 = icmp ne i32 %12, 7, !dbg !67
  br i1 %13, label %then4, label %else5, !dbg !67

then4:                                            ; preds = %if.end3
  store i32 1, ptr %failed, align 4, !dbg !68
  %14 = load i32, ptr %failed, align 4, !dbg !68
  br label %if.end6, !dbg !68

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !68

if.end6:                                          ; preds = %else5, %then4
  %15 = load ptr, ptr %p, align 8, !dbg !70
  %16 = call i32 %15(i32 5), !dbg !70
  %17 = add i32 %16, 1, !dbg !70
  store i32 %17, ptr %r, align 4, !dbg !70
  %18 = load i32, ptr %r, align 4, !dbg !70
  %19 = load i32, ptr %r, align 4, !dbg !71
  %20 = icmp ne i32 %19, 26, !dbg !71
  br i1 %20, label %then7, label %else8, !dbg !71

then7:                                            ; preds = %if.end6
  store i32 1, ptr %failed, align 4, !dbg !72
  %21 = load i32, ptr %failed, align 4, !dbg !72
  br label %if.end9, !dbg !72

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !72

if.end9:                                          ; preds = %else8, %then7
  %22 = call i32 @apply(ptr @addOne, i32 41), !dbg !74
  %23 = icmp ne i32 %22, 42, !dbg !74
  br i1 %23, label %then10, label %else11, !dbg !74

then10:                                           ; preds = %if.end9
  store i32 1, ptr %failed, align 4, !dbg !75
  %24 = load i32, ptr %failed, align 4, !dbg !75
  br label %if.end12, !dbg !75

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !75

if.end12:                                         ; preds = %else11, %then10
  %25 = call i32 @apply(ptr @square, i32 7), !dbg !77
  %26 = icmp ne i32 %25, 49, !dbg !77
  br i1 %26, label %then13, label %else14, !dbg !77

then13:                                           ; preds = %if.end12
  store i32 1, ptr %failed, align 4, !dbg !78
  %27 = load i32, ptr %failed, align 4, !dbg !78
  br label %if.end15, !dbg !78

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !78

if.end15:                                         ; preds = %else14, %then13
  %28 = call i32 @sumWith(ptr @square, i32 1, i32 4), !dbg !80
  %29 = icmp ne i32 %28, 30, !dbg !80
  br i1 %29, label %then16, label %else17, !dbg !80

then16:                                           ; preds = %if.end15
  store i32 1, ptr %failed, align 4, !dbg !81
  %30 = load i32, ptr %failed, align 4, !dbg !81
  br label %if.end18, !dbg !81

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !81

if.end18:                                         ; preds = %else17, %then16
  store ptr @addOne, ptr @chosen, align 8, !dbg !83
  %31 = load ptr, ptr @chosen, align 8, !dbg !83
  %32 = load ptr, ptr @chosen, align 8, !dbg !84
  %33 = call i32 %32(i32 99), !dbg !84
  %34 = icmp ne i32 %33, 100, !dbg !84
  br i1 %34, label %then19, label %else20, !dbg !84

then19:                                           ; preds = %if.end18
  store i32 1, ptr %failed, align 4, !dbg !85
  %35 = load i32, ptr %failed, align 4, !dbg !85
  br label %if.end21, !dbg !85

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !85

if.end21:                                         ; preds = %else20, %then19
  store ptr @addOne, ptr %p, align 8, !dbg !87
  %36 = load ptr, ptr %p, align 8, !dbg !87
  %37 = load ptr, ptr %p, align 8, !dbg !88
  %38 = call i32 %37(i32 7), !dbg !88
  %39 = icmp ne i32 %38, 8, !dbg !88
  br i1 %39, label %then22, label %else23, !dbg !88

then22:                                           ; preds = %if.end21
  store i32 1, ptr %failed, align 4, !dbg !89
  %40 = load i32, ptr %failed, align 4, !dbg !89
  br label %if.end24, !dbg !89

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !89

if.end24:                                         ; preds = %else23, %then22
  %41 = load i32, ptr %failed, align 4, !dbg !91
  %42 = icmp eq i32 %41, 0, !dbg !91
  br i1 %42, label %then25, label %else26, !dbg !91

then25:                                           ; preds = %if.end24
  %43 = call i32 (ptr, ...) @printf(ptr @0), !dbg !92
  ret i32 0, !dbg !94

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !94

if.end27:                                         ; preds = %else26
  %44 = call i32 (ptr, ...) @printf(ptr @1), !dbg !95
  ret i32 1, !dbg !96
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "49.func_pointer.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "addOne", linkageName: "addOne", scope: null, file: !3, line: 17, type: !5, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "x", arg: 1, scope: !4, file: !3, line: 17, type: !7)
!9 = !DILocation(line: 17, column: 5, scope: !4)
!10 = !DILocation(line: 17, column: 21, scope: !4)
!11 = distinct !DISubprogram(name: "square", linkageName: "square", scope: null, file: !3, line: 18, type: !5, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !2)
!12 = !DILocalVariable(name: "x", arg: 1, scope: !11, file: !3, line: 18, type: !7)
!13 = !DILocation(line: 18, column: 5, scope: !11)
!14 = !DILocation(line: 18, column: 21, scope: !11)
!15 = distinct !DISubprogram(name: "addTwo", linkageName: "addTwo", scope: null, file: !3, line: 19, type: !16, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !2)
!16 = !DISubroutineType(types: !17)
!17 = !{!7, !7, !7}
!18 = !DILocalVariable(name: "b", arg: 2, scope: !15, file: !3, line: 19, type: !7)
!19 = !DILocation(line: 19, column: 5, scope: !15)
!20 = !DILocalVariable(name: "a", arg: 1, scope: !15, file: !3, line: 19, type: !7)
!21 = !DILocation(line: 19, column: 28, scope: !15)
!22 = distinct !DISubprogram(name: "apply", linkageName: "apply", scope: null, file: !3, line: 21, type: !23, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!7, !25, !7}
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!27 = !DILocalVariable(name: "n", arg: 2, scope: !22, file: !3, line: 21, type: !7)
!28 = !DILocation(line: 21, column: 5, scope: !22)
!29 = !DILocalVariable(name: "fn", arg: 1, scope: !22, file: !3, line: 21, type: !25)
!30 = !DILocation(line: 21, column: 36, scope: !22)
!31 = distinct !DISubprogram(name: "sumWith", linkageName: "sumWith", scope: null, file: !3, line: 23, type: !32, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{!7, !25, !7, !7}
!34 = !DILocalVariable(name: "i", scope: !31, file: !3, line: 25, type: !7)
!35 = !DILocation(line: 25, column: 3, scope: !31)
!36 = !DILocalVariable(name: "total", scope: !31, file: !3, line: 24, type: !7)
!37 = !DILocation(line: 24, column: 3, scope: !31)
!38 = !DILocalVariable(name: "to", arg: 3, scope: !31, file: !3, line: 23, type: !7)
!39 = !DILocation(line: 23, column: 5, scope: !31)
!40 = !DILocalVariable(name: "from", arg: 2, scope: !31, file: !3, line: 23, type: !7)
!41 = !DILocalVariable(name: "fn", arg: 1, scope: !31, file: !3, line: 23, type: !25)
!42 = !DILocation(line: 27, column: 3, scope: !31)
!43 = !DILocation(line: 28, column: 5, scope: !44)
!44 = distinct !DILexicalBlock(scope: !31, file: !3, line: 27, column: 19)
!45 = !DILocation(line: 29, column: 5, scope: !44)
!46 = !DILocation(line: 31, column: 3, scope: !31)
!47 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 37, type: !48, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!7}
!50 = !DILocalVariable(name: "r", scope: !47, file: !3, line: 41, type: !7)
!51 = !DILocation(line: 41, column: 3, scope: !47)
!52 = !DILocalVariable(name: "q", scope: !47, file: !3, line: 40, type: !25)
!53 = !DILocation(line: 40, column: 3, scope: !47)
!54 = !DILocalVariable(name: "p", scope: !47, file: !3, line: 39, type: !25)
!55 = !DILocation(line: 39, column: 3, scope: !47)
!56 = !DILocalVariable(name: "failed", scope: !47, file: !3, line: 38, type: !7)
!57 = !DILocation(line: 38, column: 3, scope: !47)
!58 = !DILocation(line: 44, column: 3, scope: !47)
!59 = !DILocation(line: 45, column: 3, scope: !47)
!60 = !DILocation(line: 46, column: 5, scope: !61)
!61 = distinct !DILexicalBlock(scope: !47, file: !3, line: 45, column: 20)
!62 = !DILocation(line: 50, column: 3, scope: !47)
!63 = !DILocation(line: 51, column: 3, scope: !47)
!64 = !DILocation(line: 52, column: 5, scope: !65)
!65 = distinct !DILexicalBlock(scope: !47, file: !3, line: 51, column: 19)
!66 = !DILocation(line: 56, column: 3, scope: !47)
!67 = !DILocation(line: 57, column: 3, scope: !47)
!68 = !DILocation(line: 58, column: 5, scope: !69)
!69 = distinct !DILexicalBlock(scope: !47, file: !3, line: 57, column: 21)
!70 = !DILocation(line: 62, column: 3, scope: !47)
!71 = !DILocation(line: 63, column: 3, scope: !47)
!72 = !DILocation(line: 64, column: 5, scope: !73)
!73 = distinct !DILexicalBlock(scope: !47, file: !3, line: 63, column: 16)
!74 = !DILocation(line: 68, column: 3, scope: !47)
!75 = !DILocation(line: 69, column: 5, scope: !76)
!76 = distinct !DILexicalBlock(scope: !47, file: !3, line: 68, column: 32)
!77 = !DILocation(line: 71, column: 3, scope: !47)
!78 = !DILocation(line: 72, column: 5, scope: !79)
!79 = distinct !DILexicalBlock(scope: !47, file: !3, line: 71, column: 31)
!80 = !DILocation(line: 76, column: 3, scope: !47)
!81 = !DILocation(line: 77, column: 5, scope: !82)
!82 = distinct !DILexicalBlock(scope: !47, file: !3, line: 76, column: 36)
!83 = !DILocation(line: 81, column: 3, scope: !47)
!84 = !DILocation(line: 82, column: 3, scope: !47)
!85 = !DILocation(line: 83, column: 5, scope: !86)
!86 = distinct !DILexicalBlock(scope: !47, file: !3, line: 82, column: 26)
!87 = !DILocation(line: 87, column: 3, scope: !47)
!88 = !DILocation(line: 88, column: 3, scope: !47)
!89 = !DILocation(line: 89, column: 5, scope: !90)
!90 = distinct !DILexicalBlock(scope: !47, file: !3, line: 88, column: 18)
!91 = !DILocation(line: 92, column: 3, scope: !47)
!92 = !DILocation(line: 93, column: 5, scope: !93)
!93 = distinct !DILexicalBlock(scope: !47, file: !3, line: 92, column: 20)
!94 = !DILocation(line: 94, column: 5, scope: !93)
!95 = !DILocation(line: 96, column: 3, scope: !47)
!96 = !DILocation(line: 97, column: 3, scope: !47)
