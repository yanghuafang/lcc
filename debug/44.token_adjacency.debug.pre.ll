; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [27 x i8] c"44.token_adjacency.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [27 x i8] c"44.token_adjacency.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %pos = alloca i32, align 4
    #dbg_declare(ptr %pos, !8, !DIExpression(), !9)
  %zero = alloca i32, align 4
    #dbg_declare(ptr %zero, !10, !DIExpression(), !11)
  %neg = alloca i32, align 4
    #dbg_declare(ptr %neg, !12, !DIExpression(), !13)
  %f = alloca float, align 4
    #dbg_declare(ptr %f, !14, !DIExpression(), !16)
  %d = alloca double, align 8
    #dbg_declare(ptr %d, !17, !DIExpression(), !19)
  %ulv = alloca i64, align 8
    #dbg_declare(ptr %ulv, !20, !DIExpression(), !22)
  %lv = alloca i64, align 8
    #dbg_declare(ptr %lv, !23, !DIExpression(), !25)
  %ui = alloca i32, align 4
    #dbg_declare(ptr %ui, !26, !DIExpression(), !28)
  %hl = alloca i64, align 8
    #dbg_declare(ptr %hl, !29, !DIExpression(), !30)
  %h = alloca i32, align 4
    #dbg_declare(ptr %h, !31, !DIExpression(), !32)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !33, !DIExpression(), !34)
  %arr = alloca [4 x i32], align 4
    #dbg_declare(ptr %arr, !35, !DIExpression(), !39)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !40, !DIExpression(), !41)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !42, !DIExpression(), !43)
  store i32 0, ptr %err, align 4, !dbg !43
  store i32 5, ptr %a, align 4, !dbg !41
  %0 = load i32, ptr %a, align 4, !dbg !44
  %1 = sub i32 %0, 1, !dbg !44
  %2 = icmp ne i32 %1, 4, !dbg !44
  br i1 %2, label %then, label %else, !dbg !44

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !45
  %3 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end, !dbg !45

else:                                             ; preds = %entry
  br label %if.end, !dbg !45

if.end:                                           ; preds = %else, %then
  %4 = load i32, ptr %a, align 4, !dbg !46
  %5 = add i32 %4, 1, !dbg !46
  %6 = icmp ne i32 %5, 6, !dbg !46
  br i1 %6, label %then1, label %else2, !dbg !46

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !47
  %7 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end3, !dbg !47

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !47

if.end3:                                          ; preds = %else2, %then1
  br i1 false, label %then4, label %else5, !dbg !48

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !49
  %8 = load i32, ptr %err, align 4, !dbg !49
  br label %if.end6, !dbg !49

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !49

if.end6:                                          ; preds = %else5, %then4
  br i1 false, label %then7, label %else8, !dbg !50

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !51
  %9 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end9, !dbg !51

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !51

if.end9:                                          ; preds = %else8, %then7
  %10 = getelementptr [4 x i32], ptr %arr, i32 0, i32 0, !dbg !39
  store i32 10, ptr %10, align 4, !dbg !39
  %11 = getelementptr [4 x i32], ptr %arr, i32 0, i32 1, !dbg !39
  store i32 20, ptr %11, align 4, !dbg !39
  %12 = getelementptr [4 x i32], ptr %arr, i32 0, i32 2, !dbg !39
  store i32 30, ptr %12, align 4, !dbg !39
  %13 = getelementptr [4 x i32], ptr %arr, i32 0, i32 3, !dbg !39
  store i32 40, ptr %13, align 4, !dbg !39
  store i32 3, ptr %n, align 4, !dbg !34
  %14 = load i32, ptr %n, align 4, !dbg !52
  %15 = sub i32 %14, 1, !dbg !52
  %16 = getelementptr i32, ptr %arr, i32 %15, !dbg !52
  %17 = load i32, ptr %16, align 4, !dbg !52
  %18 = icmp ne i32 %17, 30, !dbg !52
  br i1 %18, label %then10, label %else11, !dbg !52

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !53
  %19 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end12, !dbg !53

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !53

if.end12:                                         ; preds = %else11, %then10
  %20 = load i32, ptr %n, align 4, !dbg !54
  %21 = sub i32 %20, 3, !dbg !54
  %22 = getelementptr i32, ptr %arr, i32 %21, !dbg !54
  %23 = load i32, ptr %22, align 4, !dbg !54
  %24 = icmp ne i32 %23, 10, !dbg !54
  br i1 %24, label %then13, label %else14, !dbg !54

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !55
  %25 = load i32, ptr %err, align 4, !dbg !55
  br label %if.end15, !dbg !55

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !55

if.end15:                                         ; preds = %else14, %then13
  store i32 32, ptr %h, align 4, !dbg !32
  %26 = load i32, ptr %h, align 4, !dbg !56
  %27 = sub i32 %26, 16, !dbg !56
  %28 = icmp ne i32 %27, 16, !dbg !56
  br i1 %28, label %then16, label %else17, !dbg !56

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !57
  %29 = load i32, ptr %err, align 4, !dbg !57
  br label %if.end18, !dbg !57

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !57

if.end18:                                         ; preds = %else17, %then16
  store i64 32, ptr %hl, align 8, !dbg !30
  %30 = load i64, ptr %hl, align 8, !dbg !58
  %31 = sub i64 %30, 16, !dbg !58
  %32 = icmp ne i64 %31, 16, !dbg !58
  br i1 %32, label %then19, label %else20, !dbg !58

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !59
  %33 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end21, !dbg !59

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !59

if.end21:                                         ; preds = %else20, %then19
  store i32 5, ptr %ui, align 4, !dbg !28
  %34 = load i32, ptr %ui, align 4, !dbg !60
  %35 = add i32 %34, 1, !dbg !60
  %36 = icmp ne i32 %35, 6, !dbg !60
  br i1 %36, label %then22, label %else23, !dbg !60

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !61
  %37 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end24, !dbg !61

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !61

if.end24:                                         ; preds = %else23, %then22
  store i64 5, ptr %lv, align 8, !dbg !25
  %38 = load i64, ptr %lv, align 8, !dbg !62
  %39 = sub i64 %38, 1, !dbg !62
  %40 = icmp ne i64 %39, 4, !dbg !62
  br i1 %40, label %then25, label %else26, !dbg !62

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !63
  %41 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end27, !dbg !63

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !63

if.end27:                                         ; preds = %else26, %then25
  store i64 5, ptr %ulv, align 8, !dbg !22
  %42 = load i64, ptr %ulv, align 8, !dbg !64
  %43 = add i64 %42, 1, !dbg !64
  %44 = icmp ne i64 %43, 6, !dbg !64
  br i1 %44, label %then28, label %else29, !dbg !64

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !65
  %45 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end30, !dbg !65

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !65

if.end30:                                         ; preds = %else29, %then28
  store double 5.000000e+00, ptr %d, align 8, !dbg !19
  %46 = load double, ptr %d, align 8, !dbg !66
  %47 = fsub double %46, 1.500000e+00, !dbg !66
  %48 = fcmp one double %47, 3.500000e+00, !dbg !66
  br i1 %48, label %then31, label %else32, !dbg !66

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !67
  %49 = load i32, ptr %err, align 4, !dbg !67
  br label %if.end33, !dbg !67

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !67

if.end33:                                         ; preds = %else32, %then31
  %50 = load double, ptr %d, align 8, !dbg !68
  %51 = fadd double %50, 1.500000e+00, !dbg !68
  %52 = fcmp one double %51, 6.500000e+00, !dbg !68
  br i1 %52, label %then34, label %else35, !dbg !68

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !69
  %53 = load i32, ptr %err, align 4, !dbg !69
  br label %if.end36, !dbg !69

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !69

if.end36:                                         ; preds = %else35, %then34
  store float 5.000000e+00, ptr %f, align 4, !dbg !16
  %54 = load float, ptr %f, align 4, !dbg !70
  %55 = fpext float %54 to double, !dbg !70
  %56 = fsub double %55, 1.500000e+00, !dbg !70
  %57 = fcmp one double %56, 3.500000e+00, !dbg !70
  br i1 %57, label %then37, label %else38, !dbg !70

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !71
  %58 = load i32, ptr %err, align 4, !dbg !71
  br label %if.end39, !dbg !71

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !71

if.end39:                                         ; preds = %else38, %then37
  br i1 false, label %then40, label %else41, !dbg !72

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !73
  %59 = load i32, ptr %err, align 4, !dbg !73
  br label %if.end42, !dbg !73

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !73

if.end42:                                         ; preds = %else41, %then40
  br i1 false, label %then43, label %else44, !dbg !74

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4, !dbg !75
  %60 = load i32, ptr %err, align 4, !dbg !75
  br label %if.end45, !dbg !75

else44:                                           ; preds = %if.end42
  br label %if.end45, !dbg !75

if.end45:                                         ; preds = %else44, %then43
  br i1 false, label %then46, label %else47, !dbg !76

then46:                                           ; preds = %if.end45
  store i32 1, ptr %err, align 4, !dbg !77
  %61 = load i32, ptr %err, align 4, !dbg !77
  br label %if.end48, !dbg !77

else47:                                           ; preds = %if.end45
  br label %if.end48, !dbg !77

if.end48:                                         ; preds = %else47, %then46
  %62 = load i32, ptr %a, align 4, !dbg !78
  %63 = sub i32 0, %62, !dbg !78
  %64 = mul i32 %63, 2, !dbg !78
  %65 = icmp ne i32 %64, -10, !dbg !78
  br i1 %65, label %then49, label %else50, !dbg !78

then49:                                           ; preds = %if.end48
  store i32 1, ptr %err, align 4, !dbg !79
  %66 = load i32, ptr %err, align 4, !dbg !79
  br label %if.end51, !dbg !79

else50:                                           ; preds = %if.end48
  br label %if.end51, !dbg !79

if.end51:                                         ; preds = %else50, %then49
  store i32 -1, ptr %neg, align 4, !dbg !13
  store i32 0, ptr %zero, align 4, !dbg !11
  store i32 1, ptr %pos, align 4, !dbg !9
  %67 = load i32, ptr %neg, align 4, !dbg !80
  %68 = icmp ne i32 %67, -1, !dbg !80
  br i1 %68, label %then52, label %else53, !dbg !80

then52:                                           ; preds = %if.end51
  store i32 1, ptr %err, align 4, !dbg !81
  %69 = load i32, ptr %err, align 4, !dbg !81
  br label %if.end54, !dbg !81

else53:                                           ; preds = %if.end51
  br label %if.end54, !dbg !81

if.end54:                                         ; preds = %else53, %then52
  %70 = load i32, ptr %zero, align 4, !dbg !82
  %71 = icmp ne i32 %70, 0, !dbg !82
  br i1 %71, label %then55, label %else56, !dbg !82

then55:                                           ; preds = %if.end54
  store i32 1, ptr %err, align 4, !dbg !83
  %72 = load i32, ptr %err, align 4, !dbg !83
  br label %if.end57, !dbg !83

else56:                                           ; preds = %if.end54
  br label %if.end57, !dbg !83

if.end57:                                         ; preds = %else56, %then55
  %73 = load i32, ptr %pos, align 4, !dbg !84
  %74 = icmp ne i32 %73, 1, !dbg !84
  br i1 %74, label %then58, label %else59, !dbg !84

then58:                                           ; preds = %if.end57
  store i32 1, ptr %err, align 4, !dbg !85
  %75 = load i32, ptr %err, align 4, !dbg !85
  br label %if.end60, !dbg !85

else59:                                           ; preds = %if.end57
  br label %if.end60, !dbg !85

if.end60:                                         ; preds = %else59, %then58
  %76 = load i32, ptr %err, align 4, !dbg !86
  %77 = icmp eq i32 %76, 0, !dbg !86
  br i1 %77, label %then61, label %else62, !dbg !86

then61:                                           ; preds = %if.end60
  %78 = call i32 (ptr, ...) @printf(ptr @0), !dbg !87
  br label %if.end63, !dbg !87

else62:                                           ; preds = %if.end60
  %79 = call i32 (ptr, ...) @printf(ptr @1), !dbg !89
  br label %if.end63, !dbg !89

if.end63:                                         ; preds = %else62, %then61
  %80 = load i32, ptr %err, align 4, !dbg !91
  ret i32 %80, !dbg !91
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "44.token_adjacency.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 25, type: !5, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "pos", scope: !4, file: !3, line: 83, type: !7)
!9 = !DILocation(line: 83, column: 3, scope: !4)
!10 = !DILocalVariable(name: "zero", scope: !4, file: !3, line: 82, type: !7)
!11 = !DILocation(line: 82, column: 3, scope: !4)
!12 = !DILocalVariable(name: "neg", scope: !4, file: !3, line: 81, type: !7)
!13 = !DILocation(line: 81, column: 3, scope: !4)
!14 = !DILocalVariable(name: "f", scope: !4, file: !3, line: 62, type: !15)
!15 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!16 = !DILocation(line: 62, column: 3, scope: !4)
!17 = !DILocalVariable(name: "d", scope: !4, file: !3, line: 59, type: !18)
!18 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!19 = !DILocation(line: 59, column: 3, scope: !4)
!20 = !DILocalVariable(name: "ulv", scope: !4, file: !3, line: 54, type: !21)
!21 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!22 = !DILocation(line: 54, column: 3, scope: !4)
!23 = !DILocalVariable(name: "lv", scope: !4, file: !3, line: 52, type: !24)
!24 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!25 = !DILocation(line: 52, column: 3, scope: !4)
!26 = !DILocalVariable(name: "ui", scope: !4, file: !3, line: 50, type: !27)
!27 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!28 = !DILocation(line: 50, column: 3, scope: !4)
!29 = !DILocalVariable(name: "hl", scope: !4, file: !3, line: 46, type: !24)
!30 = !DILocation(line: 46, column: 3, scope: !4)
!31 = !DILocalVariable(name: "h", scope: !4, file: !3, line: 44, type: !7)
!32 = !DILocation(line: 44, column: 3, scope: !4)
!33 = !DILocalVariable(name: "n", scope: !4, file: !3, line: 39, type: !7)
!34 = !DILocation(line: 39, column: 3, scope: !4)
!35 = !DILocalVariable(name: "arr", scope: !4, file: !3, line: 38, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 128, align: 32, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 4, lowerBound: 0)
!39 = !DILocation(line: 38, column: 3, scope: !4)
!40 = !DILocalVariable(name: "a", scope: !4, file: !3, line: 31, type: !7)
!41 = !DILocation(line: 31, column: 3, scope: !4)
!42 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 26, type: !7)
!43 = !DILocation(line: 26, column: 3, scope: !4)
!44 = !DILocation(line: 32, column: 3, scope: !4)
!45 = !DILocation(line: 32, column: 17, scope: !4)
!46 = !DILocation(line: 33, column: 3, scope: !4)
!47 = !DILocation(line: 33, column: 17, scope: !4)
!48 = !DILocation(line: 34, column: 3, scope: !4)
!49 = !DILocation(line: 34, column: 18, scope: !4)
!50 = !DILocation(line: 35, column: 3, scope: !4)
!51 = !DILocation(line: 35, column: 19, scope: !4)
!52 = !DILocation(line: 40, column: 3, scope: !4)
!53 = !DILocation(line: 40, column: 23, scope: !4)
!54 = !DILocation(line: 41, column: 3, scope: !4)
!55 = !DILocation(line: 41, column: 23, scope: !4)
!56 = !DILocation(line: 45, column: 3, scope: !4)
!57 = !DILocation(line: 45, column: 21, scope: !4)
!58 = !DILocation(line: 47, column: 3, scope: !4)
!59 = !DILocation(line: 47, column: 23, scope: !4)
!60 = !DILocation(line: 51, column: 3, scope: !4)
!61 = !DILocation(line: 51, column: 19, scope: !4)
!62 = !DILocation(line: 53, column: 3, scope: !4)
!63 = !DILocation(line: 53, column: 19, scope: !4)
!64 = !DILocation(line: 55, column: 3, scope: !4)
!65 = !DILocation(line: 55, column: 21, scope: !4)
!66 = !DILocation(line: 60, column: 3, scope: !4)
!67 = !DILocation(line: 60, column: 21, scope: !4)
!68 = !DILocation(line: 61, column: 3, scope: !4)
!69 = !DILocation(line: 61, column: 21, scope: !4)
!70 = !DILocation(line: 63, column: 3, scope: !4)
!71 = !DILocation(line: 63, column: 23, scope: !4)
!72 = !DILocation(line: 68, column: 3, scope: !4)
!73 = !DILocation(line: 68, column: 20, scope: !4)
!74 = !DILocation(line: 69, column: 3, scope: !4)
!75 = !DILocation(line: 69, column: 22, scope: !4)
!76 = !DILocation(line: 70, column: 3, scope: !4)
!77 = !DILocation(line: 70, column: 22, scope: !4)
!78 = !DILocation(line: 73, column: 3, scope: !4)
!79 = !DILocation(line: 73, column: 20, scope: !4)
!80 = !DILocation(line: 84, column: 3, scope: !4)
!81 = !DILocation(line: 84, column: 18, scope: !4)
!82 = !DILocation(line: 85, column: 3, scope: !4)
!83 = !DILocation(line: 85, column: 18, scope: !4)
!84 = !DILocation(line: 86, column: 3, scope: !4)
!85 = !DILocation(line: 86, column: 17, scope: !4)
!86 = !DILocation(line: 88, column: 3, scope: !4)
!87 = !DILocation(line: 89, column: 5, scope: !88)
!88 = distinct !DILexicalBlock(scope: !4, file: !3, line: 88, column: 17)
!89 = !DILocation(line: 91, column: 5, scope: !90)
!90 = distinct !DILexicalBlock(scope: !4, file: !3, line: 90, column: 10)
!91 = !DILocation(line: 93, column: 3, scope: !4)
