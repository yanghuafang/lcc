; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [22 x i8] c"12.arithmetic.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"12.arithmetic.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %mixedUi = alloca i32, align 4
    #dbg_declare(ptr %mixedUi, !7, !DIExpression(), !9)
  %mixedSi = alloca i32, align 4
    #dbg_declare(ptr %mixedSi, !10, !DIExpression(), !11)
  %negB = alloca i32, align 4
    #dbg_declare(ptr %negB, !12, !DIExpression(), !13)
  %negA = alloca i32, align 4
    #dbg_declare(ptr %negA, !14, !DIExpression(), !15)
  %ub = alloca i32, align 4
    #dbg_declare(ptr %ub, !16, !DIExpression(), !17)
  %ua = alloca i32, align 4
    #dbg_declare(ptr %ua, !18, !DIExpression(), !19)
  %modeq = alloca i32, align 4
    #dbg_declare(ptr %modeq, !20, !DIExpression(), !21)
  %diveq = alloca i32, align 4
    #dbg_declare(ptr %diveq, !22, !DIExpression(), !23)
  %muleq = alloca i32, align 4
    #dbg_declare(ptr %muleq, !24, !DIExpression(), !25)
  %subeq = alloca i32, align 4
    #dbg_declare(ptr %subeq, !26, !DIExpression(), !27)
  %sumeq = alloca i32, align 4
    #dbg_declare(ptr %sumeq, !28, !DIExpression(), !29)
  %mod = alloca i32, align 4
    #dbg_declare(ptr %mod, !30, !DIExpression(), !31)
  %div = alloca i32, align 4
    #dbg_declare(ptr %div, !32, !DIExpression(), !33)
  %mul = alloca i32, align 4
    #dbg_declare(ptr %mul, !34, !DIExpression(), !35)
  %sub2 = alloca i32, align 4
    #dbg_declare(ptr %sub2, !36, !DIExpression(), !37)
  %sub = alloca i32, align 4
    #dbg_declare(ptr %sub, !38, !DIExpression(), !39)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !40, !DIExpression(), !41)
  %b = alloca i32, align 4
    #dbg_declare(ptr %b, !42, !DIExpression(), !43)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !44, !DIExpression(), !45)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !46, !DIExpression(), !47)
  store i32 0, ptr %err, align 4, !dbg !47
  store i32 37, ptr %a, align 4, !dbg !45
  store i32 8, ptr %b, align 4, !dbg !43
  %0 = load i32, ptr %a, align 4, !dbg !41
  %1 = load i32, ptr %b, align 4, !dbg !41
  %2 = add i32 %0, %1, !dbg !41
  store i32 %2, ptr %sum, align 4, !dbg !41
  %3 = load i32, ptr %a, align 4, !dbg !39
  %4 = load i32, ptr %b, align 4, !dbg !39
  %5 = sub i32 %3, %4, !dbg !39
  store i32 %5, ptr %sub, align 4, !dbg !39
  %6 = load i32, ptr %b, align 4, !dbg !37
  %7 = load i32, ptr %a, align 4, !dbg !37
  %8 = sub i32 %6, %7, !dbg !37
  store i32 %8, ptr %sub2, align 4, !dbg !37
  %9 = load i32, ptr %a, align 4, !dbg !35
  %10 = load i32, ptr %b, align 4, !dbg !35
  %11 = mul i32 %9, %10, !dbg !35
  store i32 %11, ptr %mul, align 4, !dbg !35
  %12 = load i32, ptr %a, align 4, !dbg !33
  %13 = load i32, ptr %b, align 4, !dbg !33
  %14 = sdiv i32 %12, %13, !dbg !33
  store i32 %14, ptr %div, align 4, !dbg !33
  %15 = load i32, ptr %a, align 4, !dbg !31
  %16 = load i32, ptr %b, align 4, !dbg !31
  %17 = srem i32 %15, %16, !dbg !31
  store i32 %17, ptr %mod, align 4, !dbg !31
  %18 = load i32, ptr %sum, align 4, !dbg !29
  store i32 %18, ptr %sumeq, align 4, !dbg !29
  %19 = load i32, ptr %b, align 4, !dbg !48
  %20 = load i32, ptr %sumeq, align 4, !dbg !48
  %21 = add i32 %20, %19, !dbg !48
  store i32 %21, ptr %sumeq, align 4, !dbg !48
  %22 = load i32, ptr %sumeq, align 4, !dbg !48
  %23 = load i32, ptr %sumeq, align 4, !dbg !27
  store i32 %23, ptr %subeq, align 4, !dbg !27
  %24 = load i32, ptr %b, align 4, !dbg !49
  %25 = load i32, ptr %subeq, align 4, !dbg !49
  %26 = sub i32 %25, %24, !dbg !49
  store i32 %26, ptr %subeq, align 4, !dbg !49
  %27 = load i32, ptr %subeq, align 4, !dbg !49
  %28 = load i32, ptr %subeq, align 4, !dbg !25
  store i32 %28, ptr %muleq, align 4, !dbg !25
  %29 = load i32, ptr %b, align 4, !dbg !50
  %30 = load i32, ptr %muleq, align 4, !dbg !50
  %31 = mul i32 %30, %29, !dbg !50
  store i32 %31, ptr %muleq, align 4, !dbg !50
  %32 = load i32, ptr %muleq, align 4, !dbg !50
  %33 = load i32, ptr %muleq, align 4, !dbg !23
  store i32 %33, ptr %diveq, align 4, !dbg !23
  %34 = load i32, ptr %b, align 4, !dbg !51
  %35 = load i32, ptr %diveq, align 4, !dbg !51
  %36 = sdiv i32 %35, %34, !dbg !51
  store i32 %36, ptr %diveq, align 4, !dbg !51
  %37 = load i32, ptr %diveq, align 4, !dbg !51
  %38 = load i32, ptr %diveq, align 4, !dbg !21
  store i32 %38, ptr %modeq, align 4, !dbg !21
  %39 = load i32, ptr %b, align 4, !dbg !52
  %40 = load i32, ptr %modeq, align 4, !dbg !52
  %41 = srem i32 %40, %39, !dbg !52
  store i32 %41, ptr %modeq, align 4, !dbg !52
  %42 = load i32, ptr %modeq, align 4, !dbg !52
  %43 = load i32, ptr %sum, align 4, !dbg !53
  %44 = icmp ne i32 %43, 45, !dbg !53
  br i1 %44, label %then, label %else, !dbg !53

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !54
  %45 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end, !dbg !54

else:                                             ; preds = %entry
  br label %if.end, !dbg !54

if.end:                                           ; preds = %else, %then
  %46 = load i32, ptr %sub, align 4, !dbg !55
  %47 = icmp ne i32 %46, 29, !dbg !55
  br i1 %47, label %then1, label %else2, !dbg !55

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !56
  %48 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end3, !dbg !56

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !56

if.end3:                                          ; preds = %else2, %then1
  %49 = load i32, ptr %sub2, align 4, !dbg !57
  %50 = icmp ne i32 %49, -29, !dbg !57
  br i1 %50, label %then4, label %else5, !dbg !57

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !58
  %51 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end6, !dbg !58

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !58

if.end6:                                          ; preds = %else5, %then4
  %52 = load i32, ptr %mul, align 4, !dbg !59
  %53 = icmp ne i32 %52, 296, !dbg !59
  br i1 %53, label %then7, label %else8, !dbg !59

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !60
  %54 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end9, !dbg !60

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !60

if.end9:                                          ; preds = %else8, %then7
  %55 = load i32, ptr %a, align 4, !dbg !61
  %56 = add i32 %55, 0, !dbg !61
  %57 = icmp ne i32 %56, 37, !dbg !61
  br i1 %57, label %then10, label %else11, !dbg !61

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !62
  %58 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end12, !dbg !62

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !62

if.end12:                                         ; preds = %else11, %then10
  %59 = load i32, ptr %div, align 4, !dbg !63
  %60 = icmp ne i32 %59, 4, !dbg !63
  br i1 %60, label %then13, label %else14, !dbg !63

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !64
  %61 = load i32, ptr %err, align 4, !dbg !64
  br label %if.end15, !dbg !64

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !64

if.end15:                                         ; preds = %else14, %then13
  %62 = load i32, ptr %mod, align 4, !dbg !65
  %63 = icmp ne i32 %62, 5, !dbg !65
  br i1 %63, label %then16, label %else17, !dbg !65

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !66
  %64 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end18, !dbg !66

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !66

if.end18:                                         ; preds = %else17, %then16
  %65 = load i32, ptr %sumeq, align 4, !dbg !67
  %66 = icmp ne i32 %65, 53, !dbg !67
  br i1 %66, label %then19, label %else20, !dbg !67

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !68
  %67 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end21, !dbg !68

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !68

if.end21:                                         ; preds = %else20, %then19
  %68 = load i32, ptr %subeq, align 4, !dbg !69
  %69 = icmp ne i32 %68, 45, !dbg !69
  br i1 %69, label %then22, label %else23, !dbg !69

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !70
  %70 = load i32, ptr %err, align 4, !dbg !70
  br label %if.end24, !dbg !70

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !70

if.end24:                                         ; preds = %else23, %then22
  %71 = load i32, ptr %muleq, align 4, !dbg !71
  %72 = icmp ne i32 %71, 360, !dbg !71
  br i1 %72, label %then25, label %else26, !dbg !71

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !72
  %73 = load i32, ptr %err, align 4, !dbg !72
  br label %if.end27, !dbg !72

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !72

if.end27:                                         ; preds = %else26, %then25
  %74 = load i32, ptr %diveq, align 4, !dbg !73
  %75 = icmp ne i32 %74, 45, !dbg !73
  br i1 %75, label %then28, label %else29, !dbg !73

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !74
  %76 = load i32, ptr %err, align 4, !dbg !74
  br label %if.end30, !dbg !74

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !74

if.end30:                                         ; preds = %else29, %then28
  %77 = load i32, ptr %modeq, align 4, !dbg !75
  %78 = icmp ne i32 %77, 5, !dbg !75
  br i1 %78, label %then31, label %else32, !dbg !75

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !76
  %79 = load i32, ptr %err, align 4, !dbg !76
  br label %if.end33, !dbg !76

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !76

if.end33:                                         ; preds = %else32, %then31
  store i32 10, ptr %ua, align 4, !dbg !19
  store i32 3, ptr %ub, align 4, !dbg !17
  %80 = load i32, ptr %ua, align 4, !dbg !77
  %81 = load i32, ptr %ub, align 4, !dbg !77
  %82 = udiv i32 %80, %81, !dbg !77
  %83 = icmp ne i32 %82, 3, !dbg !77
  br i1 %83, label %then34, label %else35, !dbg !77

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !78
  %84 = load i32, ptr %err, align 4, !dbg !78
  br label %if.end36, !dbg !78

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !78

if.end36:                                         ; preds = %else35, %then34
  %85 = load i32, ptr %ua, align 4, !dbg !79
  %86 = load i32, ptr %ub, align 4, !dbg !79
  %87 = urem i32 %85, %86, !dbg !79
  %88 = icmp ne i32 %87, 1, !dbg !79
  br i1 %88, label %then37, label %else38, !dbg !79

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !80
  %89 = load i32, ptr %err, align 4, !dbg !80
  br label %if.end39, !dbg !80

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !80

if.end39:                                         ; preds = %else38, %then37
  store i32 -8, ptr %negA, align 4, !dbg !15
  store i32 3, ptr %negB, align 4, !dbg !13
  %90 = load i32, ptr %negA, align 4, !dbg !81
  %91 = load i32, ptr %negB, align 4, !dbg !81
  %92 = srem i32 %90, %91, !dbg !81
  %93 = icmp ne i32 %92, -2, !dbg !81
  br i1 %93, label %then40, label %else41, !dbg !81

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !82
  %94 = load i32, ptr %err, align 4, !dbg !82
  br label %if.end42, !dbg !82

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !82

if.end42:                                         ; preds = %else41, %then40
  store i32 -1, ptr %mixedSi, align 4, !dbg !11
  store i32 1, ptr %mixedUi, align 4, !dbg !9
  %95 = load i32, ptr %mixedSi, align 4, !dbg !83
  %96 = load i32, ptr %mixedUi, align 4, !dbg !83
  %97 = add i32 %95, %96, !dbg !83
  %98 = icmp ne i32 %97, 0, !dbg !83
  br i1 %98, label %then43, label %else44, !dbg !83

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4, !dbg !84
  %99 = load i32, ptr %err, align 4, !dbg !84
  br label %if.end45, !dbg !84

else44:                                           ; preds = %if.end42
  br label %if.end45, !dbg !84

if.end45:                                         ; preds = %else44, %then43
  %100 = load i32, ptr %err, align 4, !dbg !85
  %101 = icmp eq i32 %100, 0, !dbg !85
  br i1 %101, label %then46, label %else47, !dbg !85

then46:                                           ; preds = %if.end45
  %102 = call i32 (ptr, ...) @printf(ptr @0), !dbg !86
  br label %if.end48, !dbg !86

else47:                                           ; preds = %if.end45
  %103 = call i32 (ptr, ...) @printf(ptr @1), !dbg !88
  br label %if.end48, !dbg !88

if.end48:                                         ; preds = %else47, %then46
  %104 = load i32, ptr %err, align 4, !dbg !90
  ret i32 %104, !dbg !90
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "12.arithmetic.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 6, type: !3, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "mixedUi", scope: !2, file: !1, line: 52, type: !8)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !DILocation(line: 52, column: 3, scope: !2)
!10 = !DILocalVariable(name: "mixedSi", scope: !2, file: !1, line: 51, type: !5)
!11 = !DILocation(line: 51, column: 3, scope: !2)
!12 = !DILocalVariable(name: "negB", scope: !2, file: !1, line: 48, type: !5)
!13 = !DILocation(line: 48, column: 3, scope: !2)
!14 = !DILocalVariable(name: "negA", scope: !2, file: !1, line: 47, type: !5)
!15 = !DILocation(line: 47, column: 3, scope: !2)
!16 = !DILocalVariable(name: "ub", scope: !2, file: !1, line: 43, type: !8)
!17 = !DILocation(line: 43, column: 3, scope: !2)
!18 = !DILocalVariable(name: "ua", scope: !2, file: !1, line: 42, type: !8)
!19 = !DILocation(line: 42, column: 3, scope: !2)
!20 = !DILocalVariable(name: "modeq", scope: !2, file: !1, line: 26, type: !5)
!21 = !DILocation(line: 26, column: 3, scope: !2)
!22 = !DILocalVariable(name: "diveq", scope: !2, file: !1, line: 24, type: !5)
!23 = !DILocation(line: 24, column: 3, scope: !2)
!24 = !DILocalVariable(name: "muleq", scope: !2, file: !1, line: 22, type: !5)
!25 = !DILocation(line: 22, column: 3, scope: !2)
!26 = !DILocalVariable(name: "subeq", scope: !2, file: !1, line: 20, type: !5)
!27 = !DILocation(line: 20, column: 3, scope: !2)
!28 = !DILocalVariable(name: "sumeq", scope: !2, file: !1, line: 18, type: !5)
!29 = !DILocation(line: 18, column: 3, scope: !2)
!30 = !DILocalVariable(name: "mod", scope: !2, file: !1, line: 16, type: !5)
!31 = !DILocation(line: 16, column: 3, scope: !2)
!32 = !DILocalVariable(name: "div", scope: !2, file: !1, line: 15, type: !5)
!33 = !DILocation(line: 15, column: 3, scope: !2)
!34 = !DILocalVariable(name: "mul", scope: !2, file: !1, line: 14, type: !5)
!35 = !DILocation(line: 14, column: 3, scope: !2)
!36 = !DILocalVariable(name: "sub2", scope: !2, file: !1, line: 13, type: !5)
!37 = !DILocation(line: 13, column: 3, scope: !2)
!38 = !DILocalVariable(name: "sub", scope: !2, file: !1, line: 12, type: !5)
!39 = !DILocation(line: 12, column: 3, scope: !2)
!40 = !DILocalVariable(name: "sum", scope: !2, file: !1, line: 11, type: !5)
!41 = !DILocation(line: 11, column: 3, scope: !2)
!42 = !DILocalVariable(name: "b", scope: !2, file: !1, line: 9, type: !5)
!43 = !DILocation(line: 9, column: 3, scope: !2)
!44 = !DILocalVariable(name: "a", scope: !2, file: !1, line: 8, type: !5)
!45 = !DILocation(line: 8, column: 3, scope: !2)
!46 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 7, type: !5)
!47 = !DILocation(line: 7, column: 3, scope: !2)
!48 = !DILocation(line: 19, column: 3, scope: !2)
!49 = !DILocation(line: 21, column: 3, scope: !2)
!50 = !DILocation(line: 23, column: 3, scope: !2)
!51 = !DILocation(line: 25, column: 3, scope: !2)
!52 = !DILocation(line: 27, column: 3, scope: !2)
!53 = !DILocation(line: 29, column: 3, scope: !2)
!54 = !DILocation(line: 29, column: 18, scope: !2)
!55 = !DILocation(line: 30, column: 3, scope: !2)
!56 = !DILocation(line: 30, column: 18, scope: !2)
!57 = !DILocation(line: 31, column: 3, scope: !2)
!58 = !DILocation(line: 31, column: 20, scope: !2)
!59 = !DILocation(line: 32, column: 3, scope: !2)
!60 = !DILocation(line: 32, column: 19, scope: !2)
!61 = !DILocation(line: 33, column: 3, scope: !2)
!62 = !DILocation(line: 33, column: 20, scope: !2)
!63 = !DILocation(line: 34, column: 3, scope: !2)
!64 = !DILocation(line: 34, column: 17, scope: !2)
!65 = !DILocation(line: 35, column: 3, scope: !2)
!66 = !DILocation(line: 35, column: 17, scope: !2)
!67 = !DILocation(line: 36, column: 3, scope: !2)
!68 = !DILocation(line: 36, column: 20, scope: !2)
!69 = !DILocation(line: 37, column: 3, scope: !2)
!70 = !DILocation(line: 37, column: 20, scope: !2)
!71 = !DILocation(line: 38, column: 3, scope: !2)
!72 = !DILocation(line: 38, column: 21, scope: !2)
!73 = !DILocation(line: 39, column: 3, scope: !2)
!74 = !DILocation(line: 39, column: 20, scope: !2)
!75 = !DILocation(line: 40, column: 3, scope: !2)
!76 = !DILocation(line: 40, column: 19, scope: !2)
!77 = !DILocation(line: 44, column: 3, scope: !2)
!78 = !DILocation(line: 44, column: 21, scope: !2)
!79 = !DILocation(line: 45, column: 3, scope: !2)
!80 = !DILocation(line: 45, column: 21, scope: !2)
!81 = !DILocation(line: 49, column: 3, scope: !2)
!82 = !DILocation(line: 49, column: 26, scope: !2)
!83 = !DILocation(line: 53, column: 3, scope: !2)
!84 = !DILocation(line: 53, column: 31, scope: !2)
!85 = !DILocation(line: 55, column: 3, scope: !2)
!86 = !DILocation(line: 56, column: 5, scope: !87)
!87 = distinct !DILexicalBlock(scope: !2, file: !1, line: 55, column: 17)
!88 = !DILocation(line: 58, column: 5, scope: !89)
!89 = distinct !DILexicalBlock(scope: !2, file: !1, line: 57, column: 10)
!90 = !DILocation(line: 60, column: 3, scope: !2)
