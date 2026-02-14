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
    #dbg_declare(ptr %pos, !9, !DIExpression(), !10)
  %zero = alloca i32, align 4
    #dbg_declare(ptr %zero, !11, !DIExpression(), !12)
  %neg = alloca i32, align 4
    #dbg_declare(ptr %neg, !13, !DIExpression(), !14)
  %f = alloca float, align 4
    #dbg_declare(ptr %f, !15, !DIExpression(), !17)
  %d = alloca double, align 8
    #dbg_declare(ptr %d, !18, !DIExpression(), !20)
  %ulv = alloca i64, align 8
    #dbg_declare(ptr %ulv, !21, !DIExpression(), !23)
  %lv = alloca i64, align 8
    #dbg_declare(ptr %lv, !24, !DIExpression(), !26)
  %ui = alloca i32, align 4
    #dbg_declare(ptr %ui, !27, !DIExpression(), !29)
  %hl = alloca i64, align 8
    #dbg_declare(ptr %hl, !30, !DIExpression(), !31)
  %h = alloca i32, align 4
    #dbg_declare(ptr %h, !32, !DIExpression(), !33)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !34, !DIExpression(), !35)
  %arr = alloca [4 x i32], align 4
    #dbg_declare(ptr %arr, !36, !DIExpression(), !40)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !41, !DIExpression(), !42)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !43, !DIExpression(), !44)
  store i32 0, ptr %err, align 4, !dbg !44
  store i32 5, ptr %a, align 4, !dbg !42
  %0 = load i32, ptr %a, align 4, !dbg !45
  %1 = sub i32 %0, 1, !dbg !45
  %2 = icmp ne i32 %1, 4, !dbg !45
  br i1 %2, label %then, label %else, !dbg !45

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !46
  %3 = load i32, ptr %err, align 4, !dbg !46
  br label %if.end, !dbg !46

else:                                             ; preds = %entry
  br label %if.end, !dbg !46

if.end:                                           ; preds = %else, %then
  %4 = load i32, ptr %a, align 4, !dbg !47
  %5 = add i32 %4, 1, !dbg !47
  %6 = icmp ne i32 %5, 6, !dbg !47
  br i1 %6, label %then1, label %else2, !dbg !47

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !48
  %7 = load i32, ptr %err, align 4, !dbg !48
  br label %if.end3, !dbg !48

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !48

if.end3:                                          ; preds = %else2, %then1
  br i1 false, label %then4, label %else5, !dbg !49

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !50
  %8 = load i32, ptr %err, align 4, !dbg !50
  br label %if.end6, !dbg !50

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !50

if.end6:                                          ; preds = %else5, %then4
  br i1 false, label %then7, label %else8, !dbg !51

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !52
  %9 = load i32, ptr %err, align 4, !dbg !52
  br label %if.end9, !dbg !52

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !52

if.end9:                                          ; preds = %else8, %then7
  %10 = getelementptr [4 x i32], ptr %arr, i32 0, i32 0, !dbg !40
  store i32 10, ptr %10, align 4, !dbg !40
  %11 = getelementptr [4 x i32], ptr %arr, i32 0, i32 1, !dbg !40
  store i32 20, ptr %11, align 4, !dbg !40
  %12 = getelementptr [4 x i32], ptr %arr, i32 0, i32 2, !dbg !40
  store i32 30, ptr %12, align 4, !dbg !40
  %13 = getelementptr [4 x i32], ptr %arr, i32 0, i32 3, !dbg !40
  store i32 40, ptr %13, align 4, !dbg !40
  store i32 3, ptr %n, align 4, !dbg !35
  %14 = load i32, ptr %n, align 4, !dbg !53
  %15 = sub i32 %14, 1, !dbg !53
  %16 = getelementptr i32, ptr %arr, i32 %15, !dbg !53
  %17 = load i32, ptr %16, align 4, !dbg !53
  %18 = icmp ne i32 %17, 30, !dbg !53
  br i1 %18, label %then10, label %else11, !dbg !53

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !54
  %19 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end12, !dbg !54

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !54

if.end12:                                         ; preds = %else11, %then10
  %20 = load i32, ptr %n, align 4, !dbg !55
  %21 = sub i32 %20, 3, !dbg !55
  %22 = getelementptr i32, ptr %arr, i32 %21, !dbg !55
  %23 = load i32, ptr %22, align 4, !dbg !55
  %24 = icmp ne i32 %23, 10, !dbg !55
  br i1 %24, label %then13, label %else14, !dbg !55

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !56
  %25 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end15, !dbg !56

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !56

if.end15:                                         ; preds = %else14, %then13
  store i32 32, ptr %h, align 4, !dbg !33
  %26 = load i32, ptr %h, align 4, !dbg !57
  %27 = sub i32 %26, 16, !dbg !57
  %28 = icmp ne i32 %27, 16, !dbg !57
  br i1 %28, label %then16, label %else17, !dbg !57

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !58
  %29 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end18, !dbg !58

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !58

if.end18:                                         ; preds = %else17, %then16
  store i64 32, ptr %hl, align 8, !dbg !31
  %30 = load i64, ptr %hl, align 8, !dbg !59
  %31 = sub i64 %30, 16, !dbg !59
  %32 = icmp ne i64 %31, 16, !dbg !59
  br i1 %32, label %then19, label %else20, !dbg !59

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !60
  %33 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end21, !dbg !60

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !60

if.end21:                                         ; preds = %else20, %then19
  store i32 5, ptr %ui, align 4, !dbg !29
  %34 = load i32, ptr %ui, align 4, !dbg !61
  %35 = add i32 %34, 1, !dbg !61
  %36 = icmp ne i32 %35, 6, !dbg !61
  br i1 %36, label %then22, label %else23, !dbg !61

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !62
  %37 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end24, !dbg !62

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !62

if.end24:                                         ; preds = %else23, %then22
  store i64 5, ptr %lv, align 8, !dbg !26
  %38 = load i64, ptr %lv, align 8, !dbg !63
  %39 = sub i64 %38, 1, !dbg !63
  %40 = icmp ne i64 %39, 4, !dbg !63
  br i1 %40, label %then25, label %else26, !dbg !63

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !64
  %41 = load i32, ptr %err, align 4, !dbg !64
  br label %if.end27, !dbg !64

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !64

if.end27:                                         ; preds = %else26, %then25
  store i64 5, ptr %ulv, align 8, !dbg !23
  %42 = load i64, ptr %ulv, align 8, !dbg !65
  %43 = add i64 %42, 1, !dbg !65
  %44 = icmp ne i64 %43, 6, !dbg !65
  br i1 %44, label %then28, label %else29, !dbg !65

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !66
  %45 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end30, !dbg !66

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !66

if.end30:                                         ; preds = %else29, %then28
  store double 5.000000e+00, ptr %d, align 8, !dbg !20
  %46 = load double, ptr %d, align 8, !dbg !67
  %47 = fsub double %46, 1.500000e+00, !dbg !67
  %48 = fcmp one double %47, 3.500000e+00, !dbg !67
  br i1 %48, label %then31, label %else32, !dbg !67

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !68
  %49 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end33, !dbg !68

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !68

if.end33:                                         ; preds = %else32, %then31
  %50 = load double, ptr %d, align 8, !dbg !69
  %51 = fadd double %50, 1.500000e+00, !dbg !69
  %52 = fcmp one double %51, 6.500000e+00, !dbg !69
  br i1 %52, label %then34, label %else35, !dbg !69

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !70
  %53 = load i32, ptr %err, align 4, !dbg !70
  br label %if.end36, !dbg !70

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !70

if.end36:                                         ; preds = %else35, %then34
  store float 5.000000e+00, ptr %f, align 4, !dbg !17
  %54 = load float, ptr %f, align 4, !dbg !71
  %55 = fpext float %54 to double, !dbg !71
  %56 = fsub double %55, 1.500000e+00, !dbg !71
  %57 = fcmp one double %56, 3.500000e+00, !dbg !71
  br i1 %57, label %then37, label %else38, !dbg !71

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !72
  %58 = load i32, ptr %err, align 4, !dbg !72
  br label %if.end39, !dbg !72

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !72

if.end39:                                         ; preds = %else38, %then37
  br i1 false, label %then40, label %else41, !dbg !73

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !74
  %59 = load i32, ptr %err, align 4, !dbg !74
  br label %if.end42, !dbg !74

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !74

if.end42:                                         ; preds = %else41, %then40
  br i1 false, label %then43, label %else44, !dbg !75

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4, !dbg !76
  %60 = load i32, ptr %err, align 4, !dbg !76
  br label %if.end45, !dbg !76

else44:                                           ; preds = %if.end42
  br label %if.end45, !dbg !76

if.end45:                                         ; preds = %else44, %then43
  br i1 false, label %then46, label %else47, !dbg !77

then46:                                           ; preds = %if.end45
  store i32 1, ptr %err, align 4, !dbg !78
  %61 = load i32, ptr %err, align 4, !dbg !78
  br label %if.end48, !dbg !78

else47:                                           ; preds = %if.end45
  br label %if.end48, !dbg !78

if.end48:                                         ; preds = %else47, %then46
  %62 = load i32, ptr %a, align 4, !dbg !79
  %63 = sub i32 0, %62, !dbg !79
  %64 = mul i32 %63, 2, !dbg !79
  %65 = icmp ne i32 %64, -10, !dbg !79
  br i1 %65, label %then49, label %else50, !dbg !79

then49:                                           ; preds = %if.end48
  store i32 1, ptr %err, align 4, !dbg !80
  %66 = load i32, ptr %err, align 4, !dbg !80
  br label %if.end51, !dbg !80

else50:                                           ; preds = %if.end48
  br label %if.end51, !dbg !80

if.end51:                                         ; preds = %else50, %then49
  store i32 -1, ptr %neg, align 4, !dbg !14
  store i32 0, ptr %zero, align 4, !dbg !12
  store i32 1, ptr %pos, align 4, !dbg !10
  %67 = load i32, ptr %neg, align 4, !dbg !81
  %68 = icmp ne i32 %67, -1, !dbg !81
  br i1 %68, label %then52, label %else53, !dbg !81

then52:                                           ; preds = %if.end51
  store i32 1, ptr %err, align 4, !dbg !82
  %69 = load i32, ptr %err, align 4, !dbg !82
  br label %if.end54, !dbg !82

else53:                                           ; preds = %if.end51
  br label %if.end54, !dbg !82

if.end54:                                         ; preds = %else53, %then52
  %70 = load i32, ptr %zero, align 4, !dbg !83
  %71 = icmp ne i32 %70, 0, !dbg !83
  br i1 %71, label %then55, label %else56, !dbg !83

then55:                                           ; preds = %if.end54
  store i32 1, ptr %err, align 4, !dbg !84
  %72 = load i32, ptr %err, align 4, !dbg !84
  br label %if.end57, !dbg !84

else56:                                           ; preds = %if.end54
  br label %if.end57, !dbg !84

if.end57:                                         ; preds = %else56, %then55
  %73 = load i32, ptr %pos, align 4, !dbg !85
  %74 = icmp ne i32 %73, 1, !dbg !85
  br i1 %74, label %then58, label %else59, !dbg !85

then58:                                           ; preds = %if.end57
  store i32 1, ptr %err, align 4, !dbg !86
  %75 = load i32, ptr %err, align 4, !dbg !86
  br label %if.end60, !dbg !86

else59:                                           ; preds = %if.end57
  br label %if.end60, !dbg !86

if.end60:                                         ; preds = %else59, %then58
  %76 = load i32, ptr %err, align 4, !dbg !87
  %77 = icmp eq i32 %76, 0, !dbg !87
  br i1 %77, label %then61, label %else62, !dbg !87

then61:                                           ; preds = %if.end60
  %78 = call i32 (ptr, ...) @printf(ptr @0), !dbg !88
  br label %if.end63, !dbg !88

else62:                                           ; preds = %if.end60
  %79 = call i32 (ptr, ...) @printf(ptr @1), !dbg !90
  br label %if.end63, !dbg !90

if.end63:                                         ; preds = %else62, %then61
  %80 = load i32, ptr %err, align 4, !dbg !92
  ret i32 %80, !dbg !92
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "44.token_adjacency.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 25, type: !5, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "pos", scope: !4, file: !3, line: 83, type: !7)
!10 = !DILocation(line: 83, column: 3, scope: !4)
!11 = !DILocalVariable(name: "zero", scope: !4, file: !3, line: 82, type: !7)
!12 = !DILocation(line: 82, column: 3, scope: !4)
!13 = !DILocalVariable(name: "neg", scope: !4, file: !3, line: 81, type: !7)
!14 = !DILocation(line: 81, column: 3, scope: !4)
!15 = !DILocalVariable(name: "f", scope: !4, file: !3, line: 62, type: !16)
!16 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!17 = !DILocation(line: 62, column: 3, scope: !4)
!18 = !DILocalVariable(name: "d", scope: !4, file: !3, line: 59, type: !19)
!19 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!20 = !DILocation(line: 59, column: 3, scope: !4)
!21 = !DILocalVariable(name: "ulv", scope: !4, file: !3, line: 54, type: !22)
!22 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!23 = !DILocation(line: 54, column: 3, scope: !4)
!24 = !DILocalVariable(name: "lv", scope: !4, file: !3, line: 52, type: !25)
!25 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!26 = !DILocation(line: 52, column: 3, scope: !4)
!27 = !DILocalVariable(name: "ui", scope: !4, file: !3, line: 50, type: !28)
!28 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!29 = !DILocation(line: 50, column: 3, scope: !4)
!30 = !DILocalVariable(name: "hl", scope: !4, file: !3, line: 46, type: !25)
!31 = !DILocation(line: 46, column: 3, scope: !4)
!32 = !DILocalVariable(name: "h", scope: !4, file: !3, line: 44, type: !7)
!33 = !DILocation(line: 44, column: 3, scope: !4)
!34 = !DILocalVariable(name: "n", scope: !4, file: !3, line: 39, type: !7)
!35 = !DILocation(line: 39, column: 3, scope: !4)
!36 = !DILocalVariable(name: "arr", scope: !4, file: !3, line: 38, type: !37)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 128, align: 32, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 4, lowerBound: 0)
!40 = !DILocation(line: 38, column: 3, scope: !4)
!41 = !DILocalVariable(name: "a", scope: !4, file: !3, line: 31, type: !7)
!42 = !DILocation(line: 31, column: 3, scope: !4)
!43 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 26, type: !7)
!44 = !DILocation(line: 26, column: 3, scope: !4)
!45 = !DILocation(line: 32, column: 3, scope: !4)
!46 = !DILocation(line: 32, column: 17, scope: !4)
!47 = !DILocation(line: 33, column: 3, scope: !4)
!48 = !DILocation(line: 33, column: 17, scope: !4)
!49 = !DILocation(line: 34, column: 3, scope: !4)
!50 = !DILocation(line: 34, column: 18, scope: !4)
!51 = !DILocation(line: 35, column: 3, scope: !4)
!52 = !DILocation(line: 35, column: 19, scope: !4)
!53 = !DILocation(line: 40, column: 3, scope: !4)
!54 = !DILocation(line: 40, column: 23, scope: !4)
!55 = !DILocation(line: 41, column: 3, scope: !4)
!56 = !DILocation(line: 41, column: 23, scope: !4)
!57 = !DILocation(line: 45, column: 3, scope: !4)
!58 = !DILocation(line: 45, column: 21, scope: !4)
!59 = !DILocation(line: 47, column: 3, scope: !4)
!60 = !DILocation(line: 47, column: 23, scope: !4)
!61 = !DILocation(line: 51, column: 3, scope: !4)
!62 = !DILocation(line: 51, column: 19, scope: !4)
!63 = !DILocation(line: 53, column: 3, scope: !4)
!64 = !DILocation(line: 53, column: 19, scope: !4)
!65 = !DILocation(line: 55, column: 3, scope: !4)
!66 = !DILocation(line: 55, column: 21, scope: !4)
!67 = !DILocation(line: 60, column: 3, scope: !4)
!68 = !DILocation(line: 60, column: 21, scope: !4)
!69 = !DILocation(line: 61, column: 3, scope: !4)
!70 = !DILocation(line: 61, column: 21, scope: !4)
!71 = !DILocation(line: 63, column: 3, scope: !4)
!72 = !DILocation(line: 63, column: 23, scope: !4)
!73 = !DILocation(line: 68, column: 3, scope: !4)
!74 = !DILocation(line: 68, column: 20, scope: !4)
!75 = !DILocation(line: 69, column: 3, scope: !4)
!76 = !DILocation(line: 69, column: 22, scope: !4)
!77 = !DILocation(line: 70, column: 3, scope: !4)
!78 = !DILocation(line: 70, column: 22, scope: !4)
!79 = !DILocation(line: 73, column: 3, scope: !4)
!80 = !DILocation(line: 73, column: 20, scope: !4)
!81 = !DILocation(line: 84, column: 3, scope: !4)
!82 = !DILocation(line: 84, column: 18, scope: !4)
!83 = !DILocation(line: 85, column: 3, scope: !4)
!84 = !DILocation(line: 85, column: 18, scope: !4)
!85 = !DILocation(line: 86, column: 3, scope: !4)
!86 = !DILocation(line: 86, column: 17, scope: !4)
!87 = !DILocation(line: 88, column: 3, scope: !4)
!88 = !DILocation(line: 89, column: 5, scope: !89)
!89 = distinct !DILexicalBlock(scope: !4, file: !3, line: 88, column: 17)
!90 = !DILocation(line: 91, column: 5, scope: !91)
!91 = distinct !DILexicalBlock(scope: !4, file: !3, line: 90, column: 10)
!92 = !DILocation(line: 93, column: 3, scope: !4)
