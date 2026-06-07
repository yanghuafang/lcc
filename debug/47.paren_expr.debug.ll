; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [22 x i8] c"47.paren_expr.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"47.paren_expr.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @identity(i32 %0) !dbg !4 {
entry:
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !9, !DIExpression(), !10)
  store i32 %0, ptr %x, align 4, !dbg !10
  %1 = load i32, ptr %x, align 4, !dbg !11
  ret i32 %1, !dbg !11
}

define i32 @addTwo(i32 %0, i32 %1) !dbg !12 {
entry:
  %y = alloca i32, align 4
    #dbg_declare(ptr %y, !15, !DIExpression(), !16)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !17, !DIExpression(), !16)
  store i32 %0, ptr %x, align 4, !dbg !16
  store i32 %1, ptr %y, align 4, !dbg !16
  %2 = load i32, ptr %x, align 4, !dbg !18
  %3 = load i32, ptr %y, align 4, !dbg !18
  %4 = add i32 %2, %3, !dbg !18
  ret i32 %4, !dbg !18
}

define i32 @main() !dbg !19 {
entry:
  %s = alloca i64, align 8
    #dbg_declare(ptr %s, !22, !DIExpression(), !24)
  %d = alloca double, align 8
    #dbg_declare(ptr %d, !25, !DIExpression(), !27)
  %arr = alloca [3 x i32], align 4
    #dbg_declare(ptr %arr, !28, !DIExpression(), !32)
  %failed = alloca i32, align 4
    #dbg_declare(ptr %failed, !33, !DIExpression(), !34)
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !35, !DIExpression(), !36)
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !37, !DIExpression(), !38)
  %b = alloca i32, align 4
    #dbg_declare(ptr %b, !39, !DIExpression(), !40)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !41, !DIExpression(), !42)
  store i32 7, ptr %a, align 4, !dbg !42
  store i32 3, ptr %b, align 4, !dbg !40
  store i32 2, ptr %i, align 4, !dbg !38
  store i32 0, ptr %r, align 4, !dbg !36
  store i32 0, ptr %failed, align 4, !dbg !34
  store double 3.900000e+00, ptr %d, align 8, !dbg !27
  store i64 0, ptr %s, align 8, !dbg !24
  %0 = getelementptr i32, ptr %arr, i32 0, !dbg !43
  store i32 11, ptr %0, align 4, !dbg !43
  %1 = load i32, ptr %0, align 4, !dbg !43
  %2 = getelementptr i32, ptr %arr, i32 1, !dbg !44
  store i32 22, ptr %2, align 4, !dbg !44
  %3 = load i32, ptr %2, align 4, !dbg !44
  %4 = getelementptr i32, ptr %arr, i32 2, !dbg !45
  store i32 33, ptr %4, align 4, !dbg !45
  %5 = load i32, ptr %4, align 4, !dbg !45
  %6 = load i32, ptr %a, align 4, !dbg !46
  store i32 %6, ptr %r, align 4, !dbg !46
  %7 = load i32, ptr %r, align 4, !dbg !46
  %8 = load i32, ptr %r, align 4, !dbg !47
  %9 = icmp ne i32 %8, 7, !dbg !47
  br i1 %9, label %then, label %else, !dbg !47

then:                                             ; preds = %entry
  store i32 1, ptr %failed, align 4, !dbg !48
  %10 = load i32, ptr %failed, align 4, !dbg !48
  br label %if.end, !dbg !48

else:                                             ; preds = %entry
  br label %if.end, !dbg !48

if.end:                                           ; preds = %else, %then
  %11 = load i32, ptr %a, align 4, !dbg !50
  %12 = icmp sgt i32 %11, 0, !dbg !50
  br i1 %12, label %then1, label %else2, !dbg !50

then1:                                            ; preds = %if.end
  store i32 1, ptr %r, align 4, !dbg !51
  %13 = load i32, ptr %r, align 4, !dbg !51
  br label %if.end3, !dbg !51

else2:                                            ; preds = %if.end
  store i32 0, ptr %r, align 4, !dbg !53
  %14 = load i32, ptr %r, align 4, !dbg !53
  br label %if.end3, !dbg !53

if.end3:                                          ; preds = %else2, %then1
  %15 = load i32, ptr %r, align 4, !dbg !55
  %16 = icmp ne i32 %15, 1, !dbg !55
  br i1 %16, label %then4, label %else5, !dbg !55

then4:                                            ; preds = %if.end3
  store i32 1, ptr %failed, align 4, !dbg !56
  %17 = load i32, ptr %failed, align 4, !dbg !56
  br label %if.end6, !dbg !56

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !56

if.end6:                                          ; preds = %else5, %then4
  %18 = load i32, ptr %a, align 4, !dbg !58
  %19 = icmp eq i32 %18, 7, !dbg !58
  br i1 %19, label %then7, label %else8, !dbg !58

then7:                                            ; preds = %if.end6
  store i32 2, ptr %r, align 4, !dbg !59
  %20 = load i32, ptr %r, align 4, !dbg !59
  br label %if.end9, !dbg !59

else8:                                            ; preds = %if.end6
  store i32 0, ptr %r, align 4, !dbg !61
  %21 = load i32, ptr %r, align 4, !dbg !61
  br label %if.end9, !dbg !61

if.end9:                                          ; preds = %else8, %then7
  %22 = load i32, ptr %r, align 4, !dbg !63
  %23 = icmp ne i32 %22, 2, !dbg !63
  br i1 %23, label %then10, label %else11, !dbg !63

then10:                                           ; preds = %if.end9
  store i32 1, ptr %failed, align 4, !dbg !64
  %24 = load i32, ptr %failed, align 4, !dbg !64
  br label %if.end12, !dbg !64

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !64

if.end12:                                         ; preds = %else11, %then10
  %25 = load i32, ptr %a, align 4, !dbg !66
  %26 = call i32 @identity(i32 %25), !dbg !66
  %27 = icmp ne i32 %26, 7, !dbg !66
  br i1 %27, label %then13, label %else14, !dbg !66

then13:                                           ; preds = %if.end12
  store i32 1, ptr %failed, align 4, !dbg !67
  %28 = load i32, ptr %failed, align 4, !dbg !67
  br label %if.end15, !dbg !67

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !67

if.end15:                                         ; preds = %else14, %then13
  %29 = load i32, ptr %a, align 4, !dbg !69
  %30 = load i32, ptr %b, align 4, !dbg !69
  %31 = call i32 @addTwo(i32 %29, i32 %30), !dbg !69
  %32 = icmp ne i32 %31, 10, !dbg !69
  br i1 %32, label %then16, label %else17, !dbg !69

then16:                                           ; preds = %if.end15
  store i32 1, ptr %failed, align 4, !dbg !70
  %33 = load i32, ptr %failed, align 4, !dbg !70
  br label %if.end18, !dbg !70

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !70

if.end18:                                         ; preds = %else17, %then16
  %34 = load i32, ptr %a, align 4, !dbg !72
  %35 = icmp ne i32 %34, 7, !dbg !72
  br i1 %35, label %then19, label %else20, !dbg !72

then19:                                           ; preds = %if.end18
  store i32 1, ptr %failed, align 4, !dbg !73
  %36 = load i32, ptr %failed, align 4, !dbg !73
  br label %if.end21, !dbg !73

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !73

if.end21:                                         ; preds = %else20, %then19
  %37 = load i32, ptr %i, align 4, !dbg !75
  %38 = getelementptr i32, ptr %arr, i32 %37, !dbg !75
  %39 = load i32, ptr %38, align 4, !dbg !75
  %40 = icmp ne i32 %39, 33, !dbg !75
  br i1 %40, label %then22, label %else23, !dbg !75

then22:                                           ; preds = %if.end21
  store i32 1, ptr %failed, align 4, !dbg !76
  %41 = load i32, ptr %failed, align 4, !dbg !76
  br label %if.end24, !dbg !76

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !76

if.end24:                                         ; preds = %else23, %then22
  %42 = load i32, ptr %a, align 4, !dbg !78
  %43 = sdiv i32 %42, 7, !dbg !78
  %44 = icmp ne i32 %43, 1, !dbg !78
  br i1 %44, label %then25, label %else26, !dbg !78

then25:                                           ; preds = %if.end24
  store i32 1, ptr %failed, align 4, !dbg !79
  %45 = load i32, ptr %failed, align 4, !dbg !79
  br label %if.end27, !dbg !79

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !79

if.end27:                                         ; preds = %else26, %then25
  %46 = load i32, ptr %a, align 4, !dbg !81
  %47 = srem i32 %46, 4, !dbg !81
  %48 = icmp ne i32 %47, 3, !dbg !81
  br i1 %48, label %then28, label %else29, !dbg !81

then28:                                           ; preds = %if.end27
  store i32 1, ptr %failed, align 4, !dbg !82
  %49 = load i32, ptr %failed, align 4, !dbg !82
  br label %if.end30, !dbg !82

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !82

if.end30:                                         ; preds = %else29, %then28
  %50 = load i32, ptr %b, align 4, !dbg !84
  %51 = shl i32 %50, 1, !dbg !84
  %52 = icmp ne i32 %51, 6, !dbg !84
  br i1 %52, label %then31, label %else32, !dbg !84

then31:                                           ; preds = %if.end30
  store i32 1, ptr %failed, align 4, !dbg !85
  %53 = load i32, ptr %failed, align 4, !dbg !85
  br label %if.end33, !dbg !85

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !85

if.end33:                                         ; preds = %else32, %then31
  %54 = load i32, ptr %b, align 4, !dbg !87
  %55 = load i32, ptr %a, align 4, !dbg !87
  %56 = add i32 %54, %55, !dbg !87
  store i32 %56, ptr %r, align 4, !dbg !87
  %57 = load i32, ptr %r, align 4, !dbg !87
  %58 = load i32, ptr %r, align 4, !dbg !88
  %59 = icmp ne i32 %58, 10, !dbg !88
  br i1 %59, label %then34, label %else35, !dbg !88

then34:                                           ; preds = %if.end33
  store i32 1, ptr %failed, align 4, !dbg !89
  %60 = load i32, ptr %failed, align 4, !dbg !89
  br label %if.end36, !dbg !89

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !89

if.end36:                                         ; preds = %else35, %then34
  %61 = load double, ptr %d, align 8, !dbg !91
  %62 = fptosi double %61 to i32, !dbg !91
  %63 = icmp ne i32 %62, 3, !dbg !91
  br i1 %63, label %then37, label %else38, !dbg !91

then37:                                           ; preds = %if.end36
  store i32 1, ptr %failed, align 4, !dbg !92
  %64 = load i32, ptr %failed, align 4, !dbg !92
  br label %if.end39, !dbg !92

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !92

if.end39:                                         ; preds = %else38, %then37
  %65 = load i32, ptr %a, align 4, !dbg !94
  %66 = sext i32 %65 to i64, !dbg !94
  store i64 %66, ptr %s, align 8, !dbg !94
  %67 = load i64, ptr %s, align 8, !dbg !94
  %68 = load i64, ptr %s, align 8, !dbg !95
  %69 = trunc i64 %68 to i32, !dbg !95
  %70 = icmp ne i32 %69, 7, !dbg !95
  br i1 %70, label %then40, label %else41, !dbg !95

then40:                                           ; preds = %if.end39
  store i32 1, ptr %failed, align 4, !dbg !96
  %71 = load i32, ptr %failed, align 4, !dbg !96
  br label %if.end42, !dbg !96

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !96

if.end42:                                         ; preds = %else41, %then40
  %72 = load i32, ptr %b, align 4, !dbg !98
  %73 = sext i32 %72 to i64, !dbg !98
  %74 = trunc i64 %73 to i32, !dbg !98
  %75 = icmp ne i32 %74, 3, !dbg !98
  br i1 %75, label %then43, label %else44, !dbg !98

then43:                                           ; preds = %if.end42
  store i32 1, ptr %failed, align 4, !dbg !99
  %76 = load i32, ptr %failed, align 4, !dbg !99
  br label %if.end45, !dbg !99

else44:                                           ; preds = %if.end42
  br label %if.end45, !dbg !99

if.end45:                                         ; preds = %else44, %then43
  %77 = load i32, ptr %failed, align 4, !dbg !101
  %78 = icmp eq i32 %77, 0, !dbg !101
  br i1 %78, label %then46, label %else47, !dbg !101

then46:                                           ; preds = %if.end45
  %79 = call i32 (ptr, ...) @printf(ptr @0), !dbg !102
  ret i32 0, !dbg !104

else47:                                           ; preds = %if.end45
  br label %if.end48, !dbg !104

if.end48:                                         ; preds = %else47
  %80 = call i32 (ptr, ...) @printf(ptr @1), !dbg !105
  ret i32 1, !dbg !106
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "47.paren_expr.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "identity", linkageName: "identity", scope: null, file: !3, line: 20, type: !5, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "x", arg: 1, scope: !4, file: !3, line: 20, type: !7)
!10 = !DILocation(line: 20, column: 5, scope: !4)
!11 = !DILocation(line: 20, column: 23, scope: !4)
!12 = distinct !DISubprogram(name: "addTwo", linkageName: "addTwo", scope: null, file: !3, line: 22, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!13 = !DISubroutineType(types: !14)
!14 = !{!7, !7, !7}
!15 = !DILocalVariable(name: "y", arg: 2, scope: !12, file: !3, line: 22, type: !7)
!16 = !DILocation(line: 22, column: 5, scope: !12)
!17 = !DILocalVariable(name: "x", arg: 1, scope: !12, file: !3, line: 22, type: !7)
!18 = !DILocation(line: 22, column: 28, scope: !12)
!19 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 24, type: !20, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!20 = !DISubroutineType(types: !21)
!21 = !{!7}
!22 = !DILocalVariable(name: "s", scope: !19, file: !3, line: 32, type: !23)
!23 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!24 = !DILocation(line: 32, column: 3, scope: !19)
!25 = !DILocalVariable(name: "d", scope: !19, file: !3, line: 31, type: !26)
!26 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!27 = !DILocation(line: 31, column: 3, scope: !19)
!28 = !DILocalVariable(name: "arr", scope: !19, file: !3, line: 30, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 96, align: 32, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 3, lowerBound: 0)
!32 = !DILocation(line: 30, column: 3, scope: !19)
!33 = !DILocalVariable(name: "failed", scope: !19, file: !3, line: 29, type: !7)
!34 = !DILocation(line: 29, column: 3, scope: !19)
!35 = !DILocalVariable(name: "r", scope: !19, file: !3, line: 28, type: !7)
!36 = !DILocation(line: 28, column: 3, scope: !19)
!37 = !DILocalVariable(name: "i", scope: !19, file: !3, line: 27, type: !7)
!38 = !DILocation(line: 27, column: 3, scope: !19)
!39 = !DILocalVariable(name: "b", scope: !19, file: !3, line: 26, type: !7)
!40 = !DILocation(line: 26, column: 3, scope: !19)
!41 = !DILocalVariable(name: "a", scope: !19, file: !3, line: 25, type: !7)
!42 = !DILocation(line: 25, column: 3, scope: !19)
!43 = !DILocation(line: 34, column: 3, scope: !19)
!44 = !DILocation(line: 35, column: 3, scope: !19)
!45 = !DILocation(line: 36, column: 3, scope: !19)
!46 = !DILocation(line: 39, column: 3, scope: !19)
!47 = !DILocation(line: 40, column: 3, scope: !19)
!48 = !DILocation(line: 41, column: 5, scope: !49)
!49 = distinct !DILexicalBlock(scope: !19, file: !3, line: 40, column: 15)
!50 = !DILocation(line: 45, column: 3, scope: !19)
!51 = !DILocation(line: 46, column: 5, scope: !52)
!52 = distinct !DILexicalBlock(scope: !19, file: !3, line: 45, column: 16)
!53 = !DILocation(line: 48, column: 5, scope: !54)
!54 = distinct !DILexicalBlock(scope: !19, file: !3, line: 47, column: 10)
!55 = !DILocation(line: 50, column: 3, scope: !19)
!56 = !DILocation(line: 51, column: 5, scope: !57)
!57 = distinct !DILexicalBlock(scope: !19, file: !3, line: 50, column: 15)
!58 = !DILocation(line: 53, column: 3, scope: !19)
!59 = !DILocation(line: 54, column: 5, scope: !60)
!60 = distinct !DILexicalBlock(scope: !19, file: !3, line: 53, column: 17)
!61 = !DILocation(line: 56, column: 5, scope: !62)
!62 = distinct !DILexicalBlock(scope: !19, file: !3, line: 55, column: 10)
!63 = !DILocation(line: 58, column: 3, scope: !19)
!64 = !DILocation(line: 59, column: 5, scope: !65)
!65 = distinct !DILexicalBlock(scope: !19, file: !3, line: 58, column: 15)
!66 = !DILocation(line: 63, column: 3, scope: !19)
!67 = !DILocation(line: 64, column: 5, scope: !68)
!68 = distinct !DILexicalBlock(scope: !19, file: !3, line: 63, column: 27)
!69 = !DILocation(line: 66, column: 3, scope: !19)
!70 = !DILocation(line: 67, column: 5, scope: !71)
!71 = distinct !DILexicalBlock(scope: !19, file: !3, line: 66, column: 31)
!72 = !DILocation(line: 71, column: 3, scope: !19)
!73 = !DILocation(line: 72, column: 5, scope: !74)
!74 = distinct !DILexicalBlock(scope: !19, file: !3, line: 71, column: 19)
!75 = !DILocation(line: 74, column: 3, scope: !19)
!76 = !DILocation(line: 75, column: 5, scope: !77)
!77 = distinct !DILexicalBlock(scope: !19, file: !3, line: 74, column: 23)
!78 = !DILocation(line: 79, column: 3, scope: !19)
!79 = !DILocation(line: 80, column: 5, scope: !80)
!80 = distinct !DILexicalBlock(scope: !19, file: !3, line: 79, column: 21)
!81 = !DILocation(line: 82, column: 3, scope: !19)
!82 = !DILocation(line: 83, column: 5, scope: !83)
!83 = distinct !DILexicalBlock(scope: !19, file: !3, line: 82, column: 21)
!84 = !DILocation(line: 85, column: 3, scope: !19)
!85 = !DILocation(line: 86, column: 5, scope: !86)
!86 = distinct !DILexicalBlock(scope: !19, file: !3, line: 85, column: 22)
!87 = !DILocation(line: 90, column: 3, scope: !19)
!88 = !DILocation(line: 91, column: 3, scope: !19)
!89 = !DILocation(line: 92, column: 5, scope: !90)
!90 = distinct !DILexicalBlock(scope: !19, file: !3, line: 91, column: 16)
!91 = !DILocation(line: 96, column: 3, scope: !19)
!92 = !DILocation(line: 97, column: 5, scope: !93)
!93 = distinct !DILexicalBlock(scope: !19, file: !3, line: 96, column: 20)
!94 = !DILocation(line: 99, column: 3, scope: !19)
!95 = !DILocation(line: 100, column: 3, scope: !19)
!96 = !DILocation(line: 101, column: 5, scope: !97)
!97 = distinct !DILexicalBlock(scope: !19, file: !3, line: 100, column: 20)
!98 = !DILocation(line: 103, column: 3, scope: !19)
!99 = !DILocation(line: 104, column: 5, scope: !100)
!100 = distinct !DILexicalBlock(scope: !19, file: !3, line: 103, column: 28)
!101 = !DILocation(line: 107, column: 3, scope: !19)
!102 = !DILocation(line: 108, column: 5, scope: !103)
!103 = distinct !DILexicalBlock(scope: !19, file: !3, line: 107, column: 20)
!104 = !DILocation(line: 109, column: 5, scope: !103)
!105 = !DILocation(line: 111, column: 3, scope: !19)
!106 = !DILocation(line: 112, column: 3, scope: !19)
