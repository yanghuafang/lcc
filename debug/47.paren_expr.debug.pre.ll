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
    #dbg_declare(ptr %x, !8, !DIExpression(), !9)
  store i32 %0, ptr %x, align 4, !dbg !9
  %1 = load i32, ptr %x, align 4, !dbg !10
  ret i32 %1, !dbg !10
}

define i32 @addTwo(i32 %0, i32 %1) !dbg !11 {
entry:
  %y = alloca i32, align 4
    #dbg_declare(ptr %y, !14, !DIExpression(), !15)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !16, !DIExpression(), !15)
  store i32 %0, ptr %x, align 4, !dbg !15
  store i32 %1, ptr %y, align 4, !dbg !15
  %2 = load i32, ptr %x, align 4, !dbg !17
  %3 = load i32, ptr %y, align 4, !dbg !17
  %4 = add i32 %2, %3, !dbg !17
  ret i32 %4, !dbg !17
}

define i32 @main() !dbg !18 {
entry:
  %s = alloca i64, align 8
    #dbg_declare(ptr %s, !21, !DIExpression(), !23)
  %d = alloca double, align 8
    #dbg_declare(ptr %d, !24, !DIExpression(), !26)
  %arr = alloca [3 x i32], align 4
    #dbg_declare(ptr %arr, !27, !DIExpression(), !31)
  %failed = alloca i32, align 4
    #dbg_declare(ptr %failed, !32, !DIExpression(), !33)
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !34, !DIExpression(), !35)
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !36, !DIExpression(), !37)
  %b = alloca i32, align 4
    #dbg_declare(ptr %b, !38, !DIExpression(), !39)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !40, !DIExpression(), !41)
  store i32 7, ptr %a, align 4, !dbg !41
  store i32 3, ptr %b, align 4, !dbg !39
  store i32 2, ptr %i, align 4, !dbg !37
  store i32 0, ptr %r, align 4, !dbg !35
  store i32 0, ptr %failed, align 4, !dbg !33
  store double 3.900000e+00, ptr %d, align 8, !dbg !26
  store i64 0, ptr %s, align 8, !dbg !23
  %0 = getelementptr i32, ptr %arr, i32 0, !dbg !42
  store i32 11, ptr %0, align 4, !dbg !42
  %1 = load i32, ptr %0, align 4, !dbg !42
  %2 = getelementptr i32, ptr %arr, i32 1, !dbg !43
  store i32 22, ptr %2, align 4, !dbg !43
  %3 = load i32, ptr %2, align 4, !dbg !43
  %4 = getelementptr i32, ptr %arr, i32 2, !dbg !44
  store i32 33, ptr %4, align 4, !dbg !44
  %5 = load i32, ptr %4, align 4, !dbg !44
  %6 = load i32, ptr %a, align 4, !dbg !45
  store i32 %6, ptr %r, align 4, !dbg !45
  %7 = load i32, ptr %r, align 4, !dbg !45
  %8 = load i32, ptr %r, align 4, !dbg !46
  %9 = icmp ne i32 %8, 7, !dbg !46
  br i1 %9, label %then, label %else, !dbg !46

then:                                             ; preds = %entry
  store i32 1, ptr %failed, align 4, !dbg !47
  %10 = load i32, ptr %failed, align 4, !dbg !47
  br label %if.end, !dbg !47

else:                                             ; preds = %entry
  br label %if.end, !dbg !47

if.end:                                           ; preds = %else, %then
  %11 = load i32, ptr %a, align 4, !dbg !49
  %12 = icmp sgt i32 %11, 0, !dbg !49
  br i1 %12, label %then1, label %else2, !dbg !49

then1:                                            ; preds = %if.end
  store i32 1, ptr %r, align 4, !dbg !50
  %13 = load i32, ptr %r, align 4, !dbg !50
  br label %if.end3, !dbg !50

else2:                                            ; preds = %if.end
  store i32 0, ptr %r, align 4, !dbg !52
  %14 = load i32, ptr %r, align 4, !dbg !52
  br label %if.end3, !dbg !52

if.end3:                                          ; preds = %else2, %then1
  %15 = load i32, ptr %r, align 4, !dbg !54
  %16 = icmp ne i32 %15, 1, !dbg !54
  br i1 %16, label %then4, label %else5, !dbg !54

then4:                                            ; preds = %if.end3
  store i32 1, ptr %failed, align 4, !dbg !55
  %17 = load i32, ptr %failed, align 4, !dbg !55
  br label %if.end6, !dbg !55

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !55

if.end6:                                          ; preds = %else5, %then4
  %18 = load i32, ptr %a, align 4, !dbg !57
  %19 = icmp eq i32 %18, 7, !dbg !57
  br i1 %19, label %then7, label %else8, !dbg !57

then7:                                            ; preds = %if.end6
  store i32 2, ptr %r, align 4, !dbg !58
  %20 = load i32, ptr %r, align 4, !dbg !58
  br label %if.end9, !dbg !58

else8:                                            ; preds = %if.end6
  store i32 0, ptr %r, align 4, !dbg !60
  %21 = load i32, ptr %r, align 4, !dbg !60
  br label %if.end9, !dbg !60

if.end9:                                          ; preds = %else8, %then7
  %22 = load i32, ptr %r, align 4, !dbg !62
  %23 = icmp ne i32 %22, 2, !dbg !62
  br i1 %23, label %then10, label %else11, !dbg !62

then10:                                           ; preds = %if.end9
  store i32 1, ptr %failed, align 4, !dbg !63
  %24 = load i32, ptr %failed, align 4, !dbg !63
  br label %if.end12, !dbg !63

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !63

if.end12:                                         ; preds = %else11, %then10
  %25 = load i32, ptr %a, align 4, !dbg !65
  %26 = call i32 @identity(i32 %25), !dbg !65
  %27 = icmp ne i32 %26, 7, !dbg !65
  br i1 %27, label %then13, label %else14, !dbg !65

then13:                                           ; preds = %if.end12
  store i32 1, ptr %failed, align 4, !dbg !66
  %28 = load i32, ptr %failed, align 4, !dbg !66
  br label %if.end15, !dbg !66

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !66

if.end15:                                         ; preds = %else14, %then13
  %29 = load i32, ptr %a, align 4, !dbg !68
  %30 = load i32, ptr %b, align 4, !dbg !68
  %31 = call i32 @addTwo(i32 %29, i32 %30), !dbg !68
  %32 = icmp ne i32 %31, 10, !dbg !68
  br i1 %32, label %then16, label %else17, !dbg !68

then16:                                           ; preds = %if.end15
  store i32 1, ptr %failed, align 4, !dbg !69
  %33 = load i32, ptr %failed, align 4, !dbg !69
  br label %if.end18, !dbg !69

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !69

if.end18:                                         ; preds = %else17, %then16
  %34 = load i32, ptr %a, align 4, !dbg !71
  %35 = icmp ne i32 %34, 7, !dbg !71
  br i1 %35, label %then19, label %else20, !dbg !71

then19:                                           ; preds = %if.end18
  store i32 1, ptr %failed, align 4, !dbg !72
  %36 = load i32, ptr %failed, align 4, !dbg !72
  br label %if.end21, !dbg !72

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !72

if.end21:                                         ; preds = %else20, %then19
  %37 = load i32, ptr %i, align 4, !dbg !74
  %38 = getelementptr i32, ptr %arr, i32 %37, !dbg !74
  %39 = load i32, ptr %38, align 4, !dbg !74
  %40 = icmp ne i32 %39, 33, !dbg !74
  br i1 %40, label %then22, label %else23, !dbg !74

then22:                                           ; preds = %if.end21
  store i32 1, ptr %failed, align 4, !dbg !75
  %41 = load i32, ptr %failed, align 4, !dbg !75
  br label %if.end24, !dbg !75

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !75

if.end24:                                         ; preds = %else23, %then22
  %42 = load i32, ptr %a, align 4, !dbg !77
  %43 = sdiv i32 %42, 7, !dbg !77
  %44 = icmp ne i32 %43, 1, !dbg !77
  br i1 %44, label %then25, label %else26, !dbg !77

then25:                                           ; preds = %if.end24
  store i32 1, ptr %failed, align 4, !dbg !78
  %45 = load i32, ptr %failed, align 4, !dbg !78
  br label %if.end27, !dbg !78

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !78

if.end27:                                         ; preds = %else26, %then25
  %46 = load i32, ptr %a, align 4, !dbg !80
  %47 = srem i32 %46, 4, !dbg !80
  %48 = icmp ne i32 %47, 3, !dbg !80
  br i1 %48, label %then28, label %else29, !dbg !80

then28:                                           ; preds = %if.end27
  store i32 1, ptr %failed, align 4, !dbg !81
  %49 = load i32, ptr %failed, align 4, !dbg !81
  br label %if.end30, !dbg !81

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !81

if.end30:                                         ; preds = %else29, %then28
  %50 = load i32, ptr %b, align 4, !dbg !83
  %51 = shl i32 %50, 1, !dbg !83
  %52 = icmp ne i32 %51, 6, !dbg !83
  br i1 %52, label %then31, label %else32, !dbg !83

then31:                                           ; preds = %if.end30
  store i32 1, ptr %failed, align 4, !dbg !84
  %53 = load i32, ptr %failed, align 4, !dbg !84
  br label %if.end33, !dbg !84

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !84

if.end33:                                         ; preds = %else32, %then31
  %54 = load i32, ptr %b, align 4, !dbg !86
  %55 = load i32, ptr %a, align 4, !dbg !86
  %56 = add i32 %54, %55, !dbg !86
  store i32 %56, ptr %r, align 4, !dbg !86
  %57 = load i32, ptr %r, align 4, !dbg !86
  %58 = load i32, ptr %r, align 4, !dbg !87
  %59 = icmp ne i32 %58, 10, !dbg !87
  br i1 %59, label %then34, label %else35, !dbg !87

then34:                                           ; preds = %if.end33
  store i32 1, ptr %failed, align 4, !dbg !88
  %60 = load i32, ptr %failed, align 4, !dbg !88
  br label %if.end36, !dbg !88

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !88

if.end36:                                         ; preds = %else35, %then34
  %61 = load double, ptr %d, align 8, !dbg !90
  %62 = fptosi double %61 to i32, !dbg !90
  %63 = icmp ne i32 %62, 3, !dbg !90
  br i1 %63, label %then37, label %else38, !dbg !90

then37:                                           ; preds = %if.end36
  store i32 1, ptr %failed, align 4, !dbg !91
  %64 = load i32, ptr %failed, align 4, !dbg !91
  br label %if.end39, !dbg !91

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !91

if.end39:                                         ; preds = %else38, %then37
  %65 = load i32, ptr %a, align 4, !dbg !93
  %66 = sext i32 %65 to i64, !dbg !93
  store i64 %66, ptr %s, align 8, !dbg !93
  %67 = load i64, ptr %s, align 8, !dbg !93
  %68 = load i64, ptr %s, align 8, !dbg !94
  %69 = trunc i64 %68 to i32, !dbg !94
  %70 = icmp ne i32 %69, 7, !dbg !94
  br i1 %70, label %then40, label %else41, !dbg !94

then40:                                           ; preds = %if.end39
  store i32 1, ptr %failed, align 4, !dbg !95
  %71 = load i32, ptr %failed, align 4, !dbg !95
  br label %if.end42, !dbg !95

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !95

if.end42:                                         ; preds = %else41, %then40
  %72 = load i32, ptr %b, align 4, !dbg !97
  %73 = sext i32 %72 to i64, !dbg !97
  %74 = trunc i64 %73 to i32, !dbg !97
  %75 = icmp ne i32 %74, 3, !dbg !97
  br i1 %75, label %then43, label %else44, !dbg !97

then43:                                           ; preds = %if.end42
  store i32 1, ptr %failed, align 4, !dbg !98
  %76 = load i32, ptr %failed, align 4, !dbg !98
  br label %if.end45, !dbg !98

else44:                                           ; preds = %if.end42
  br label %if.end45, !dbg !98

if.end45:                                         ; preds = %else44, %then43
  %77 = load i32, ptr %failed, align 4, !dbg !100
  %78 = icmp eq i32 %77, 0, !dbg !100
  br i1 %78, label %then46, label %else47, !dbg !100

then46:                                           ; preds = %if.end45
  %79 = call i32 (ptr, ...) @printf(ptr @0), !dbg !101
  ret i32 0, !dbg !103

else47:                                           ; preds = %if.end45
  br label %if.end48, !dbg !103

if.end48:                                         ; preds = %else47
  %80 = call i32 (ptr, ...) @printf(ptr @1), !dbg !104
  ret i32 1, !dbg !105
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "47.paren_expr.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "identity", linkageName: "identity", scope: null, file: !3, line: 20, type: !5, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "x", arg: 1, scope: !4, file: !3, line: 20, type: !7)
!9 = !DILocation(line: 20, column: 5, scope: !4)
!10 = !DILocation(line: 20, column: 23, scope: !4)
!11 = distinct !DISubprogram(name: "addTwo", linkageName: "addTwo", scope: null, file: !3, line: 22, type: !12, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !2)
!12 = !DISubroutineType(types: !13)
!13 = !{!7, !7, !7}
!14 = !DILocalVariable(name: "y", arg: 2, scope: !11, file: !3, line: 22, type: !7)
!15 = !DILocation(line: 22, column: 5, scope: !11)
!16 = !DILocalVariable(name: "x", arg: 1, scope: !11, file: !3, line: 22, type: !7)
!17 = !DILocation(line: 22, column: 28, scope: !11)
!18 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 24, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!7}
!21 = !DILocalVariable(name: "s", scope: !18, file: !3, line: 32, type: !22)
!22 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!23 = !DILocation(line: 32, column: 3, scope: !18)
!24 = !DILocalVariable(name: "d", scope: !18, file: !3, line: 31, type: !25)
!25 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!26 = !DILocation(line: 31, column: 3, scope: !18)
!27 = !DILocalVariable(name: "arr", scope: !18, file: !3, line: 30, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 96, align: 32, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 3, lowerBound: 0)
!31 = !DILocation(line: 30, column: 3, scope: !18)
!32 = !DILocalVariable(name: "failed", scope: !18, file: !3, line: 29, type: !7)
!33 = !DILocation(line: 29, column: 3, scope: !18)
!34 = !DILocalVariable(name: "r", scope: !18, file: !3, line: 28, type: !7)
!35 = !DILocation(line: 28, column: 3, scope: !18)
!36 = !DILocalVariable(name: "i", scope: !18, file: !3, line: 27, type: !7)
!37 = !DILocation(line: 27, column: 3, scope: !18)
!38 = !DILocalVariable(name: "b", scope: !18, file: !3, line: 26, type: !7)
!39 = !DILocation(line: 26, column: 3, scope: !18)
!40 = !DILocalVariable(name: "a", scope: !18, file: !3, line: 25, type: !7)
!41 = !DILocation(line: 25, column: 3, scope: !18)
!42 = !DILocation(line: 34, column: 3, scope: !18)
!43 = !DILocation(line: 35, column: 3, scope: !18)
!44 = !DILocation(line: 36, column: 3, scope: !18)
!45 = !DILocation(line: 39, column: 3, scope: !18)
!46 = !DILocation(line: 40, column: 3, scope: !18)
!47 = !DILocation(line: 41, column: 5, scope: !48)
!48 = distinct !DILexicalBlock(scope: !18, file: !3, line: 40, column: 15)
!49 = !DILocation(line: 45, column: 3, scope: !18)
!50 = !DILocation(line: 46, column: 5, scope: !51)
!51 = distinct !DILexicalBlock(scope: !18, file: !3, line: 45, column: 16)
!52 = !DILocation(line: 48, column: 5, scope: !53)
!53 = distinct !DILexicalBlock(scope: !18, file: !3, line: 47, column: 10)
!54 = !DILocation(line: 50, column: 3, scope: !18)
!55 = !DILocation(line: 51, column: 5, scope: !56)
!56 = distinct !DILexicalBlock(scope: !18, file: !3, line: 50, column: 15)
!57 = !DILocation(line: 53, column: 3, scope: !18)
!58 = !DILocation(line: 54, column: 5, scope: !59)
!59 = distinct !DILexicalBlock(scope: !18, file: !3, line: 53, column: 17)
!60 = !DILocation(line: 56, column: 5, scope: !61)
!61 = distinct !DILexicalBlock(scope: !18, file: !3, line: 55, column: 10)
!62 = !DILocation(line: 58, column: 3, scope: !18)
!63 = !DILocation(line: 59, column: 5, scope: !64)
!64 = distinct !DILexicalBlock(scope: !18, file: !3, line: 58, column: 15)
!65 = !DILocation(line: 63, column: 3, scope: !18)
!66 = !DILocation(line: 64, column: 5, scope: !67)
!67 = distinct !DILexicalBlock(scope: !18, file: !3, line: 63, column: 27)
!68 = !DILocation(line: 66, column: 3, scope: !18)
!69 = !DILocation(line: 67, column: 5, scope: !70)
!70 = distinct !DILexicalBlock(scope: !18, file: !3, line: 66, column: 31)
!71 = !DILocation(line: 71, column: 3, scope: !18)
!72 = !DILocation(line: 72, column: 5, scope: !73)
!73 = distinct !DILexicalBlock(scope: !18, file: !3, line: 71, column: 19)
!74 = !DILocation(line: 74, column: 3, scope: !18)
!75 = !DILocation(line: 75, column: 5, scope: !76)
!76 = distinct !DILexicalBlock(scope: !18, file: !3, line: 74, column: 23)
!77 = !DILocation(line: 79, column: 3, scope: !18)
!78 = !DILocation(line: 80, column: 5, scope: !79)
!79 = distinct !DILexicalBlock(scope: !18, file: !3, line: 79, column: 21)
!80 = !DILocation(line: 82, column: 3, scope: !18)
!81 = !DILocation(line: 83, column: 5, scope: !82)
!82 = distinct !DILexicalBlock(scope: !18, file: !3, line: 82, column: 21)
!83 = !DILocation(line: 85, column: 3, scope: !18)
!84 = !DILocation(line: 86, column: 5, scope: !85)
!85 = distinct !DILexicalBlock(scope: !18, file: !3, line: 85, column: 22)
!86 = !DILocation(line: 90, column: 3, scope: !18)
!87 = !DILocation(line: 91, column: 3, scope: !18)
!88 = !DILocation(line: 92, column: 5, scope: !89)
!89 = distinct !DILexicalBlock(scope: !18, file: !3, line: 91, column: 16)
!90 = !DILocation(line: 96, column: 3, scope: !18)
!91 = !DILocation(line: 97, column: 5, scope: !92)
!92 = distinct !DILexicalBlock(scope: !18, file: !3, line: 96, column: 20)
!93 = !DILocation(line: 99, column: 3, scope: !18)
!94 = !DILocation(line: 100, column: 3, scope: !18)
!95 = !DILocation(line: 101, column: 5, scope: !96)
!96 = distinct !DILexicalBlock(scope: !18, file: !3, line: 100, column: 20)
!97 = !DILocation(line: 103, column: 3, scope: !18)
!98 = !DILocation(line: 104, column: 5, scope: !99)
!99 = distinct !DILexicalBlock(scope: !18, file: !3, line: 103, column: 28)
!100 = !DILocation(line: 107, column: 3, scope: !18)
!101 = !DILocation(line: 108, column: 5, scope: !102)
!102 = distinct !DILexicalBlock(scope: !18, file: !3, line: 107, column: 20)
!103 = !DILocation(line: 109, column: 5, scope: !102)
!104 = !DILocation(line: 111, column: 3, scope: !18)
!105 = !DILocation(line: 112, column: 3, scope: !18)
