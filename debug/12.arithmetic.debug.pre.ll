; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [22 x i8] c"12.arithmetic.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"12.arithmetic.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %mixedUi = alloca i32, align 4
    #dbg_declare(ptr %mixedUi, !6, !DIExpression(), !8)
  %mixedSi = alloca i32, align 4
    #dbg_declare(ptr %mixedSi, !9, !DIExpression(), !10)
  %negB = alloca i32, align 4
    #dbg_declare(ptr %negB, !11, !DIExpression(), !12)
  %negA = alloca i32, align 4
    #dbg_declare(ptr %negA, !13, !DIExpression(), !14)
  %ub = alloca i32, align 4
    #dbg_declare(ptr %ub, !15, !DIExpression(), !16)
  %ua = alloca i32, align 4
    #dbg_declare(ptr %ua, !17, !DIExpression(), !18)
  %modeq = alloca i32, align 4
    #dbg_declare(ptr %modeq, !19, !DIExpression(), !20)
  %diveq = alloca i32, align 4
    #dbg_declare(ptr %diveq, !21, !DIExpression(), !22)
  %muleq = alloca i32, align 4
    #dbg_declare(ptr %muleq, !23, !DIExpression(), !24)
  %subeq = alloca i32, align 4
    #dbg_declare(ptr %subeq, !25, !DIExpression(), !26)
  %sumeq = alloca i32, align 4
    #dbg_declare(ptr %sumeq, !27, !DIExpression(), !28)
  %mod = alloca i32, align 4
    #dbg_declare(ptr %mod, !29, !DIExpression(), !30)
  %div = alloca i32, align 4
    #dbg_declare(ptr %div, !31, !DIExpression(), !32)
  %mul = alloca i32, align 4
    #dbg_declare(ptr %mul, !33, !DIExpression(), !34)
  %sub2 = alloca i32, align 4
    #dbg_declare(ptr %sub2, !35, !DIExpression(), !36)
  %sub = alloca i32, align 4
    #dbg_declare(ptr %sub, !37, !DIExpression(), !38)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !39, !DIExpression(), !40)
  %b = alloca i32, align 4
    #dbg_declare(ptr %b, !41, !DIExpression(), !42)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !43, !DIExpression(), !44)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !45, !DIExpression(), !46)
  store i32 0, ptr %err, align 4, !dbg !46
  store i32 37, ptr %a, align 4, !dbg !44
  store i32 8, ptr %b, align 4, !dbg !42
  %0 = load i32, ptr %a, align 4, !dbg !40
  %1 = load i32, ptr %b, align 4, !dbg !40
  %2 = add i32 %0, %1, !dbg !40
  store i32 %2, ptr %sum, align 4, !dbg !40
  %3 = load i32, ptr %a, align 4, !dbg !38
  %4 = load i32, ptr %b, align 4, !dbg !38
  %5 = sub i32 %3, %4, !dbg !38
  store i32 %5, ptr %sub, align 4, !dbg !38
  %6 = load i32, ptr %b, align 4, !dbg !36
  %7 = load i32, ptr %a, align 4, !dbg !36
  %8 = sub i32 %6, %7, !dbg !36
  store i32 %8, ptr %sub2, align 4, !dbg !36
  %9 = load i32, ptr %a, align 4, !dbg !34
  %10 = load i32, ptr %b, align 4, !dbg !34
  %11 = mul i32 %9, %10, !dbg !34
  store i32 %11, ptr %mul, align 4, !dbg !34
  %12 = load i32, ptr %a, align 4, !dbg !32
  %13 = load i32, ptr %b, align 4, !dbg !32
  %14 = sdiv i32 %12, %13, !dbg !32
  store i32 %14, ptr %div, align 4, !dbg !32
  %15 = load i32, ptr %a, align 4, !dbg !30
  %16 = load i32, ptr %b, align 4, !dbg !30
  %17 = srem i32 %15, %16, !dbg !30
  store i32 %17, ptr %mod, align 4, !dbg !30
  %18 = load i32, ptr %sum, align 4, !dbg !28
  store i32 %18, ptr %sumeq, align 4, !dbg !28
  %19 = load i32, ptr %b, align 4, !dbg !47
  %20 = load i32, ptr %sumeq, align 4, !dbg !47
  %21 = add i32 %20, %19, !dbg !47
  store i32 %21, ptr %sumeq, align 4, !dbg !47
  %22 = load i32, ptr %sumeq, align 4, !dbg !47
  %23 = load i32, ptr %sumeq, align 4, !dbg !26
  store i32 %23, ptr %subeq, align 4, !dbg !26
  %24 = load i32, ptr %b, align 4, !dbg !48
  %25 = load i32, ptr %subeq, align 4, !dbg !48
  %26 = sub i32 %25, %24, !dbg !48
  store i32 %26, ptr %subeq, align 4, !dbg !48
  %27 = load i32, ptr %subeq, align 4, !dbg !48
  %28 = load i32, ptr %subeq, align 4, !dbg !24
  store i32 %28, ptr %muleq, align 4, !dbg !24
  %29 = load i32, ptr %b, align 4, !dbg !49
  %30 = load i32, ptr %muleq, align 4, !dbg !49
  %31 = mul i32 %30, %29, !dbg !49
  store i32 %31, ptr %muleq, align 4, !dbg !49
  %32 = load i32, ptr %muleq, align 4, !dbg !49
  %33 = load i32, ptr %muleq, align 4, !dbg !22
  store i32 %33, ptr %diveq, align 4, !dbg !22
  %34 = load i32, ptr %b, align 4, !dbg !50
  %35 = load i32, ptr %diveq, align 4, !dbg !50
  %36 = sdiv i32 %35, %34, !dbg !50
  store i32 %36, ptr %diveq, align 4, !dbg !50
  %37 = load i32, ptr %diveq, align 4, !dbg !50
  %38 = load i32, ptr %diveq, align 4, !dbg !20
  store i32 %38, ptr %modeq, align 4, !dbg !20
  %39 = load i32, ptr %b, align 4, !dbg !51
  %40 = load i32, ptr %modeq, align 4, !dbg !51
  %41 = srem i32 %40, %39, !dbg !51
  store i32 %41, ptr %modeq, align 4, !dbg !51
  %42 = load i32, ptr %modeq, align 4, !dbg !51
  %43 = load i32, ptr %sum, align 4, !dbg !52
  %44 = icmp ne i32 %43, 45, !dbg !52
  br i1 %44, label %then, label %else, !dbg !52

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !53
  %45 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end, !dbg !53

else:                                             ; preds = %entry
  br label %if.end, !dbg !53

if.end:                                           ; preds = %else, %then
  %46 = load i32, ptr %sub, align 4, !dbg !54
  %47 = icmp ne i32 %46, 29, !dbg !54
  br i1 %47, label %then1, label %else2, !dbg !54

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !55
  %48 = load i32, ptr %err, align 4, !dbg !55
  br label %if.end3, !dbg !55

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !55

if.end3:                                          ; preds = %else2, %then1
  %49 = load i32, ptr %sub2, align 4, !dbg !56
  %50 = icmp ne i32 %49, -29, !dbg !56
  br i1 %50, label %then4, label %else5, !dbg !56

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !57
  %51 = load i32, ptr %err, align 4, !dbg !57
  br label %if.end6, !dbg !57

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !57

if.end6:                                          ; preds = %else5, %then4
  %52 = load i32, ptr %mul, align 4, !dbg !58
  %53 = icmp ne i32 %52, 296, !dbg !58
  br i1 %53, label %then7, label %else8, !dbg !58

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !59
  %54 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end9, !dbg !59

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !59

if.end9:                                          ; preds = %else8, %then7
  %55 = load i32, ptr %a, align 4, !dbg !60
  %56 = add i32 %55, 0, !dbg !60
  %57 = icmp ne i32 %56, 37, !dbg !60
  br i1 %57, label %then10, label %else11, !dbg !60

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !61
  %58 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end12, !dbg !61

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !61

if.end12:                                         ; preds = %else11, %then10
  %59 = load i32, ptr %div, align 4, !dbg !62
  %60 = icmp ne i32 %59, 4, !dbg !62
  br i1 %60, label %then13, label %else14, !dbg !62

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !63
  %61 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end15, !dbg !63

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !63

if.end15:                                         ; preds = %else14, %then13
  %62 = load i32, ptr %mod, align 4, !dbg !64
  %63 = icmp ne i32 %62, 5, !dbg !64
  br i1 %63, label %then16, label %else17, !dbg !64

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !65
  %64 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end18, !dbg !65

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !65

if.end18:                                         ; preds = %else17, %then16
  %65 = load i32, ptr %sumeq, align 4, !dbg !66
  %66 = icmp ne i32 %65, 53, !dbg !66
  br i1 %66, label %then19, label %else20, !dbg !66

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !67
  %67 = load i32, ptr %err, align 4, !dbg !67
  br label %if.end21, !dbg !67

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !67

if.end21:                                         ; preds = %else20, %then19
  %68 = load i32, ptr %subeq, align 4, !dbg !68
  %69 = icmp ne i32 %68, 45, !dbg !68
  br i1 %69, label %then22, label %else23, !dbg !68

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !69
  %70 = load i32, ptr %err, align 4, !dbg !69
  br label %if.end24, !dbg !69

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !69

if.end24:                                         ; preds = %else23, %then22
  %71 = load i32, ptr %muleq, align 4, !dbg !70
  %72 = icmp ne i32 %71, 360, !dbg !70
  br i1 %72, label %then25, label %else26, !dbg !70

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !71
  %73 = load i32, ptr %err, align 4, !dbg !71
  br label %if.end27, !dbg !71

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !71

if.end27:                                         ; preds = %else26, %then25
  %74 = load i32, ptr %diveq, align 4, !dbg !72
  %75 = icmp ne i32 %74, 45, !dbg !72
  br i1 %75, label %then28, label %else29, !dbg !72

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !73
  %76 = load i32, ptr %err, align 4, !dbg !73
  br label %if.end30, !dbg !73

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !73

if.end30:                                         ; preds = %else29, %then28
  %77 = load i32, ptr %modeq, align 4, !dbg !74
  %78 = icmp ne i32 %77, 5, !dbg !74
  br i1 %78, label %then31, label %else32, !dbg !74

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !75
  %79 = load i32, ptr %err, align 4, !dbg !75
  br label %if.end33, !dbg !75

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !75

if.end33:                                         ; preds = %else32, %then31
  store i32 10, ptr %ua, align 4, !dbg !18
  store i32 3, ptr %ub, align 4, !dbg !16
  %80 = load i32, ptr %ua, align 4, !dbg !76
  %81 = load i32, ptr %ub, align 4, !dbg !76
  %82 = udiv i32 %80, %81, !dbg !76
  %83 = icmp ne i32 %82, 3, !dbg !76
  br i1 %83, label %then34, label %else35, !dbg !76

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !77
  %84 = load i32, ptr %err, align 4, !dbg !77
  br label %if.end36, !dbg !77

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !77

if.end36:                                         ; preds = %else35, %then34
  %85 = load i32, ptr %ua, align 4, !dbg !78
  %86 = load i32, ptr %ub, align 4, !dbg !78
  %87 = urem i32 %85, %86, !dbg !78
  %88 = icmp ne i32 %87, 1, !dbg !78
  br i1 %88, label %then37, label %else38, !dbg !78

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !79
  %89 = load i32, ptr %err, align 4, !dbg !79
  br label %if.end39, !dbg !79

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !79

if.end39:                                         ; preds = %else38, %then37
  store i32 -8, ptr %negA, align 4, !dbg !14
  store i32 3, ptr %negB, align 4, !dbg !12
  %90 = load i32, ptr %negA, align 4, !dbg !80
  %91 = load i32, ptr %negB, align 4, !dbg !80
  %92 = srem i32 %90, %91, !dbg !80
  %93 = icmp ne i32 %92, -2, !dbg !80
  br i1 %93, label %then40, label %else41, !dbg !80

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !81
  %94 = load i32, ptr %err, align 4, !dbg !81
  br label %if.end42, !dbg !81

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !81

if.end42:                                         ; preds = %else41, %then40
  store i32 -1, ptr %mixedSi, align 4, !dbg !10
  store i32 1, ptr %mixedUi, align 4, !dbg !8
  %95 = load i32, ptr %mixedSi, align 4, !dbg !82
  %96 = load i32, ptr %mixedUi, align 4, !dbg !82
  %97 = add i32 %95, %96, !dbg !82
  %98 = icmp ne i32 %97, 0, !dbg !82
  br i1 %98, label %then43, label %else44, !dbg !82

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4, !dbg !83
  %99 = load i32, ptr %err, align 4, !dbg !83
  br label %if.end45, !dbg !83

else44:                                           ; preds = %if.end42
  br label %if.end45, !dbg !83

if.end45:                                         ; preds = %else44, %then43
  %100 = load i32, ptr %err, align 4, !dbg !84
  %101 = icmp eq i32 %100, 0, !dbg !84
  br i1 %101, label %then46, label %else47, !dbg !84

then46:                                           ; preds = %if.end45
  %102 = call i32 (ptr, ...) @printf(ptr @0), !dbg !85
  br label %if.end48, !dbg !85

else47:                                           ; preds = %if.end45
  %103 = call i32 (ptr, ...) @printf(ptr @1), !dbg !87
  br label %if.end48, !dbg !87

if.end48:                                         ; preds = %else47, %then46
  %104 = load i32, ptr %err, align 4, !dbg !89
  ret i32 %104, !dbg !89
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "12.arithmetic.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 6, type: !3, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "mixedUi", scope: !2, file: !1, line: 52, type: !7)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !DILocation(line: 52, column: 3, scope: !2)
!9 = !DILocalVariable(name: "mixedSi", scope: !2, file: !1, line: 51, type: !5)
!10 = !DILocation(line: 51, column: 3, scope: !2)
!11 = !DILocalVariable(name: "negB", scope: !2, file: !1, line: 48, type: !5)
!12 = !DILocation(line: 48, column: 3, scope: !2)
!13 = !DILocalVariable(name: "negA", scope: !2, file: !1, line: 47, type: !5)
!14 = !DILocation(line: 47, column: 3, scope: !2)
!15 = !DILocalVariable(name: "ub", scope: !2, file: !1, line: 43, type: !7)
!16 = !DILocation(line: 43, column: 3, scope: !2)
!17 = !DILocalVariable(name: "ua", scope: !2, file: !1, line: 42, type: !7)
!18 = !DILocation(line: 42, column: 3, scope: !2)
!19 = !DILocalVariable(name: "modeq", scope: !2, file: !1, line: 26, type: !5)
!20 = !DILocation(line: 26, column: 3, scope: !2)
!21 = !DILocalVariable(name: "diveq", scope: !2, file: !1, line: 24, type: !5)
!22 = !DILocation(line: 24, column: 3, scope: !2)
!23 = !DILocalVariable(name: "muleq", scope: !2, file: !1, line: 22, type: !5)
!24 = !DILocation(line: 22, column: 3, scope: !2)
!25 = !DILocalVariable(name: "subeq", scope: !2, file: !1, line: 20, type: !5)
!26 = !DILocation(line: 20, column: 3, scope: !2)
!27 = !DILocalVariable(name: "sumeq", scope: !2, file: !1, line: 18, type: !5)
!28 = !DILocation(line: 18, column: 3, scope: !2)
!29 = !DILocalVariable(name: "mod", scope: !2, file: !1, line: 16, type: !5)
!30 = !DILocation(line: 16, column: 3, scope: !2)
!31 = !DILocalVariable(name: "div", scope: !2, file: !1, line: 15, type: !5)
!32 = !DILocation(line: 15, column: 3, scope: !2)
!33 = !DILocalVariable(name: "mul", scope: !2, file: !1, line: 14, type: !5)
!34 = !DILocation(line: 14, column: 3, scope: !2)
!35 = !DILocalVariable(name: "sub2", scope: !2, file: !1, line: 13, type: !5)
!36 = !DILocation(line: 13, column: 3, scope: !2)
!37 = !DILocalVariable(name: "sub", scope: !2, file: !1, line: 12, type: !5)
!38 = !DILocation(line: 12, column: 3, scope: !2)
!39 = !DILocalVariable(name: "sum", scope: !2, file: !1, line: 11, type: !5)
!40 = !DILocation(line: 11, column: 3, scope: !2)
!41 = !DILocalVariable(name: "b", scope: !2, file: !1, line: 9, type: !5)
!42 = !DILocation(line: 9, column: 3, scope: !2)
!43 = !DILocalVariable(name: "a", scope: !2, file: !1, line: 8, type: !5)
!44 = !DILocation(line: 8, column: 3, scope: !2)
!45 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 7, type: !5)
!46 = !DILocation(line: 7, column: 3, scope: !2)
!47 = !DILocation(line: 19, column: 3, scope: !2)
!48 = !DILocation(line: 21, column: 3, scope: !2)
!49 = !DILocation(line: 23, column: 3, scope: !2)
!50 = !DILocation(line: 25, column: 3, scope: !2)
!51 = !DILocation(line: 27, column: 3, scope: !2)
!52 = !DILocation(line: 29, column: 3, scope: !2)
!53 = !DILocation(line: 29, column: 18, scope: !2)
!54 = !DILocation(line: 30, column: 3, scope: !2)
!55 = !DILocation(line: 30, column: 18, scope: !2)
!56 = !DILocation(line: 31, column: 3, scope: !2)
!57 = !DILocation(line: 31, column: 20, scope: !2)
!58 = !DILocation(line: 32, column: 3, scope: !2)
!59 = !DILocation(line: 32, column: 19, scope: !2)
!60 = !DILocation(line: 33, column: 3, scope: !2)
!61 = !DILocation(line: 33, column: 20, scope: !2)
!62 = !DILocation(line: 34, column: 3, scope: !2)
!63 = !DILocation(line: 34, column: 17, scope: !2)
!64 = !DILocation(line: 35, column: 3, scope: !2)
!65 = !DILocation(line: 35, column: 17, scope: !2)
!66 = !DILocation(line: 36, column: 3, scope: !2)
!67 = !DILocation(line: 36, column: 20, scope: !2)
!68 = !DILocation(line: 37, column: 3, scope: !2)
!69 = !DILocation(line: 37, column: 20, scope: !2)
!70 = !DILocation(line: 38, column: 3, scope: !2)
!71 = !DILocation(line: 38, column: 21, scope: !2)
!72 = !DILocation(line: 39, column: 3, scope: !2)
!73 = !DILocation(line: 39, column: 20, scope: !2)
!74 = !DILocation(line: 40, column: 3, scope: !2)
!75 = !DILocation(line: 40, column: 19, scope: !2)
!76 = !DILocation(line: 44, column: 3, scope: !2)
!77 = !DILocation(line: 44, column: 21, scope: !2)
!78 = !DILocation(line: 45, column: 3, scope: !2)
!79 = !DILocation(line: 45, column: 21, scope: !2)
!80 = !DILocation(line: 49, column: 3, scope: !2)
!81 = !DILocation(line: 49, column: 26, scope: !2)
!82 = !DILocation(line: 53, column: 3, scope: !2)
!83 = !DILocation(line: 53, column: 31, scope: !2)
!84 = !DILocation(line: 55, column: 3, scope: !2)
!85 = !DILocation(line: 56, column: 5, scope: !86)
!86 = distinct !DILexicalBlock(scope: !2, file: !1, line: 55, column: 17)
!87 = !DILocation(line: 58, column: 5, scope: !88)
!88 = distinct !DILexicalBlock(scope: !2, file: !1, line: 57, column: 10)
!89 = !DILocation(line: 60, column: 3, scope: !2)
