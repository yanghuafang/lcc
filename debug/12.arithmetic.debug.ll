; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [22 x i8] c"12.arithmetic.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"12.arithmetic.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %mixedUi = alloca i32, align 4
    #dbg_declare(ptr %mixedUi, !9, !DIExpression(), !11)
  %mixedSi = alloca i32, align 4
    #dbg_declare(ptr %mixedSi, !12, !DIExpression(), !13)
  %negB = alloca i32, align 4
    #dbg_declare(ptr %negB, !14, !DIExpression(), !15)
  %negA = alloca i32, align 4
    #dbg_declare(ptr %negA, !16, !DIExpression(), !17)
  %ub = alloca i32, align 4
    #dbg_declare(ptr %ub, !18, !DIExpression(), !19)
  %ua = alloca i32, align 4
    #dbg_declare(ptr %ua, !20, !DIExpression(), !21)
  %modeq = alloca i32, align 4
    #dbg_declare(ptr %modeq, !22, !DIExpression(), !23)
  %diveq = alloca i32, align 4
    #dbg_declare(ptr %diveq, !24, !DIExpression(), !25)
  %muleq = alloca i32, align 4
    #dbg_declare(ptr %muleq, !26, !DIExpression(), !27)
  %subeq = alloca i32, align 4
    #dbg_declare(ptr %subeq, !28, !DIExpression(), !29)
  %sumeq = alloca i32, align 4
    #dbg_declare(ptr %sumeq, !30, !DIExpression(), !31)
  %mod = alloca i32, align 4
    #dbg_declare(ptr %mod, !32, !DIExpression(), !33)
  %div = alloca i32, align 4
    #dbg_declare(ptr %div, !34, !DIExpression(), !35)
  %mul = alloca i32, align 4
    #dbg_declare(ptr %mul, !36, !DIExpression(), !37)
  %sub2 = alloca i32, align 4
    #dbg_declare(ptr %sub2, !38, !DIExpression(), !39)
  %sub = alloca i32, align 4
    #dbg_declare(ptr %sub, !40, !DIExpression(), !41)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !42, !DIExpression(), !43)
  %b = alloca i32, align 4
    #dbg_declare(ptr %b, !44, !DIExpression(), !45)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !46, !DIExpression(), !47)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !48, !DIExpression(), !49)
  store i32 0, ptr %err, align 4, !dbg !49
  store i32 37, ptr %a, align 4, !dbg !47
  store i32 8, ptr %b, align 4, !dbg !45
  %0 = load i32, ptr %a, align 4, !dbg !43
  %1 = load i32, ptr %b, align 4, !dbg !43
  %2 = add i32 %0, %1, !dbg !43
  store i32 %2, ptr %sum, align 4, !dbg !43
  %3 = load i32, ptr %a, align 4, !dbg !41
  %4 = load i32, ptr %b, align 4, !dbg !41
  %5 = sub i32 %3, %4, !dbg !41
  store i32 %5, ptr %sub, align 4, !dbg !41
  %6 = load i32, ptr %b, align 4, !dbg !39
  %7 = load i32, ptr %a, align 4, !dbg !39
  %8 = sub i32 %6, %7, !dbg !39
  store i32 %8, ptr %sub2, align 4, !dbg !39
  %9 = load i32, ptr %a, align 4, !dbg !37
  %10 = load i32, ptr %b, align 4, !dbg !37
  %11 = mul i32 %9, %10, !dbg !37
  store i32 %11, ptr %mul, align 4, !dbg !37
  %12 = load i32, ptr %a, align 4, !dbg !35
  %13 = load i32, ptr %b, align 4, !dbg !35
  %14 = sdiv i32 %12, %13, !dbg !35
  store i32 %14, ptr %div, align 4, !dbg !35
  %15 = load i32, ptr %a, align 4, !dbg !33
  %16 = load i32, ptr %b, align 4, !dbg !33
  %17 = srem i32 %15, %16, !dbg !33
  store i32 %17, ptr %mod, align 4, !dbg !33
  %18 = load i32, ptr %sum, align 4, !dbg !31
  store i32 %18, ptr %sumeq, align 4, !dbg !31
  %19 = load i32, ptr %b, align 4, !dbg !50
  %20 = load i32, ptr %sumeq, align 4, !dbg !50
  %21 = add i32 %20, %19, !dbg !50
  store i32 %21, ptr %sumeq, align 4, !dbg !50
  %22 = load i32, ptr %sumeq, align 4, !dbg !50
  %23 = load i32, ptr %sumeq, align 4, !dbg !29
  store i32 %23, ptr %subeq, align 4, !dbg !29
  %24 = load i32, ptr %b, align 4, !dbg !51
  %25 = load i32, ptr %subeq, align 4, !dbg !51
  %26 = sub i32 %25, %24, !dbg !51
  store i32 %26, ptr %subeq, align 4, !dbg !51
  %27 = load i32, ptr %subeq, align 4, !dbg !51
  %28 = load i32, ptr %subeq, align 4, !dbg !27
  store i32 %28, ptr %muleq, align 4, !dbg !27
  %29 = load i32, ptr %b, align 4, !dbg !52
  %30 = load i32, ptr %muleq, align 4, !dbg !52
  %31 = mul i32 %30, %29, !dbg !52
  store i32 %31, ptr %muleq, align 4, !dbg !52
  %32 = load i32, ptr %muleq, align 4, !dbg !52
  %33 = load i32, ptr %muleq, align 4, !dbg !25
  store i32 %33, ptr %diveq, align 4, !dbg !25
  %34 = load i32, ptr %b, align 4, !dbg !53
  %35 = load i32, ptr %diveq, align 4, !dbg !53
  %36 = sdiv i32 %35, %34, !dbg !53
  store i32 %36, ptr %diveq, align 4, !dbg !53
  %37 = load i32, ptr %diveq, align 4, !dbg !53
  %38 = load i32, ptr %diveq, align 4, !dbg !23
  store i32 %38, ptr %modeq, align 4, !dbg !23
  %39 = load i32, ptr %b, align 4, !dbg !54
  %40 = load i32, ptr %modeq, align 4, !dbg !54
  %41 = srem i32 %40, %39, !dbg !54
  store i32 %41, ptr %modeq, align 4, !dbg !54
  %42 = load i32, ptr %modeq, align 4, !dbg !54
  %43 = load i32, ptr %sum, align 4, !dbg !55
  %44 = icmp ne i32 %43, 45, !dbg !55
  br i1 %44, label %then, label %else, !dbg !55

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !56
  %45 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end, !dbg !56

else:                                             ; preds = %entry
  br label %if.end, !dbg !56

if.end:                                           ; preds = %else, %then
  %46 = load i32, ptr %sub, align 4, !dbg !57
  %47 = icmp ne i32 %46, 29, !dbg !57
  br i1 %47, label %then1, label %else2, !dbg !57

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !58
  %48 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end3, !dbg !58

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !58

if.end3:                                          ; preds = %else2, %then1
  %49 = load i32, ptr %sub2, align 4, !dbg !59
  %50 = icmp ne i32 %49, -29, !dbg !59
  br i1 %50, label %then4, label %else5, !dbg !59

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !60
  %51 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end6, !dbg !60

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !60

if.end6:                                          ; preds = %else5, %then4
  %52 = load i32, ptr %mul, align 4, !dbg !61
  %53 = icmp ne i32 %52, 296, !dbg !61
  br i1 %53, label %then7, label %else8, !dbg !61

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !62
  %54 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end9, !dbg !62

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !62

if.end9:                                          ; preds = %else8, %then7
  %55 = load i32, ptr %a, align 4, !dbg !63
  %56 = add i32 %55, 0, !dbg !63
  %57 = icmp ne i32 %56, 37, !dbg !63
  br i1 %57, label %then10, label %else11, !dbg !63

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !64
  %58 = load i32, ptr %err, align 4, !dbg !64
  br label %if.end12, !dbg !64

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !64

if.end12:                                         ; preds = %else11, %then10
  %59 = load i32, ptr %div, align 4, !dbg !65
  %60 = icmp ne i32 %59, 4, !dbg !65
  br i1 %60, label %then13, label %else14, !dbg !65

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !66
  %61 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end15, !dbg !66

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !66

if.end15:                                         ; preds = %else14, %then13
  %62 = load i32, ptr %mod, align 4, !dbg !67
  %63 = icmp ne i32 %62, 5, !dbg !67
  br i1 %63, label %then16, label %else17, !dbg !67

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !68
  %64 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end18, !dbg !68

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !68

if.end18:                                         ; preds = %else17, %then16
  %65 = load i32, ptr %sumeq, align 4, !dbg !69
  %66 = icmp ne i32 %65, 53, !dbg !69
  br i1 %66, label %then19, label %else20, !dbg !69

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !70
  %67 = load i32, ptr %err, align 4, !dbg !70
  br label %if.end21, !dbg !70

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !70

if.end21:                                         ; preds = %else20, %then19
  %68 = load i32, ptr %subeq, align 4, !dbg !71
  %69 = icmp ne i32 %68, 45, !dbg !71
  br i1 %69, label %then22, label %else23, !dbg !71

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !72
  %70 = load i32, ptr %err, align 4, !dbg !72
  br label %if.end24, !dbg !72

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !72

if.end24:                                         ; preds = %else23, %then22
  %71 = load i32, ptr %muleq, align 4, !dbg !73
  %72 = icmp ne i32 %71, 360, !dbg !73
  br i1 %72, label %then25, label %else26, !dbg !73

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !74
  %73 = load i32, ptr %err, align 4, !dbg !74
  br label %if.end27, !dbg !74

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !74

if.end27:                                         ; preds = %else26, %then25
  %74 = load i32, ptr %diveq, align 4, !dbg !75
  %75 = icmp ne i32 %74, 45, !dbg !75
  br i1 %75, label %then28, label %else29, !dbg !75

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !76
  %76 = load i32, ptr %err, align 4, !dbg !76
  br label %if.end30, !dbg !76

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !76

if.end30:                                         ; preds = %else29, %then28
  %77 = load i32, ptr %modeq, align 4, !dbg !77
  %78 = icmp ne i32 %77, 5, !dbg !77
  br i1 %78, label %then31, label %else32, !dbg !77

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !78
  %79 = load i32, ptr %err, align 4, !dbg !78
  br label %if.end33, !dbg !78

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !78

if.end33:                                         ; preds = %else32, %then31
  store i32 10, ptr %ua, align 4, !dbg !21
  store i32 3, ptr %ub, align 4, !dbg !19
  %80 = load i32, ptr %ua, align 4, !dbg !79
  %81 = load i32, ptr %ub, align 4, !dbg !79
  %82 = udiv i32 %80, %81, !dbg !79
  %83 = icmp ne i32 %82, 3, !dbg !79
  br i1 %83, label %then34, label %else35, !dbg !79

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !80
  %84 = load i32, ptr %err, align 4, !dbg !80
  br label %if.end36, !dbg !80

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !80

if.end36:                                         ; preds = %else35, %then34
  %85 = load i32, ptr %ua, align 4, !dbg !81
  %86 = load i32, ptr %ub, align 4, !dbg !81
  %87 = urem i32 %85, %86, !dbg !81
  %88 = icmp ne i32 %87, 1, !dbg !81
  br i1 %88, label %then37, label %else38, !dbg !81

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !82
  %89 = load i32, ptr %err, align 4, !dbg !82
  br label %if.end39, !dbg !82

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !82

if.end39:                                         ; preds = %else38, %then37
  store i32 -8, ptr %negA, align 4, !dbg !17
  store i32 3, ptr %negB, align 4, !dbg !15
  %90 = load i32, ptr %negA, align 4, !dbg !83
  %91 = load i32, ptr %negB, align 4, !dbg !83
  %92 = srem i32 %90, %91, !dbg !83
  %93 = icmp ne i32 %92, -2, !dbg !83
  br i1 %93, label %then40, label %else41, !dbg !83

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !84
  %94 = load i32, ptr %err, align 4, !dbg !84
  br label %if.end42, !dbg !84

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !84

if.end42:                                         ; preds = %else41, %then40
  store i32 -1, ptr %mixedSi, align 4, !dbg !13
  store i32 1, ptr %mixedUi, align 4, !dbg !11
  %95 = load i32, ptr %mixedSi, align 4, !dbg !85
  %96 = load i32, ptr %mixedUi, align 4, !dbg !85
  %97 = add i32 %95, %96, !dbg !85
  %98 = icmp ne i32 %97, 0, !dbg !85
  br i1 %98, label %then43, label %else44, !dbg !85

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4, !dbg !86
  %99 = load i32, ptr %err, align 4, !dbg !86
  br label %if.end45, !dbg !86

else44:                                           ; preds = %if.end42
  br label %if.end45, !dbg !86

if.end45:                                         ; preds = %else44, %then43
  %100 = load i32, ptr %err, align 4, !dbg !87
  %101 = icmp eq i32 %100, 0, !dbg !87
  br i1 %101, label %then46, label %else47, !dbg !87

then46:                                           ; preds = %if.end45
  %102 = call i32 (ptr, ...) @printf(ptr @0), !dbg !88
  br label %if.end48, !dbg !88

else47:                                           ; preds = %if.end45
  %103 = call i32 (ptr, ...) @printf(ptr @1), !dbg !90
  br label %if.end48, !dbg !90

if.end48:                                         ; preds = %else47, %then46
  %104 = load i32, ptr %err, align 4, !dbg !92
  ret i32 %104, !dbg !92
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "12.arithmetic.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "mixedUi", scope: !4, file: !1, line: 49, type: !10)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !DILocation(line: 49, column: 3, scope: !4)
!12 = !DILocalVariable(name: "mixedSi", scope: !4, file: !1, line: 48, type: !7)
!13 = !DILocation(line: 48, column: 3, scope: !4)
!14 = !DILocalVariable(name: "negB", scope: !4, file: !1, line: 45, type: !7)
!15 = !DILocation(line: 45, column: 3, scope: !4)
!16 = !DILocalVariable(name: "negA", scope: !4, file: !1, line: 44, type: !7)
!17 = !DILocation(line: 44, column: 3, scope: !4)
!18 = !DILocalVariable(name: "ub", scope: !4, file: !1, line: 40, type: !10)
!19 = !DILocation(line: 40, column: 3, scope: !4)
!20 = !DILocalVariable(name: "ua", scope: !4, file: !1, line: 39, type: !10)
!21 = !DILocation(line: 39, column: 3, scope: !4)
!22 = !DILocalVariable(name: "modeq", scope: !4, file: !1, line: 23, type: !7)
!23 = !DILocation(line: 23, column: 3, scope: !4)
!24 = !DILocalVariable(name: "diveq", scope: !4, file: !1, line: 21, type: !7)
!25 = !DILocation(line: 21, column: 3, scope: !4)
!26 = !DILocalVariable(name: "muleq", scope: !4, file: !1, line: 19, type: !7)
!27 = !DILocation(line: 19, column: 3, scope: !4)
!28 = !DILocalVariable(name: "subeq", scope: !4, file: !1, line: 17, type: !7)
!29 = !DILocation(line: 17, column: 3, scope: !4)
!30 = !DILocalVariable(name: "sumeq", scope: !4, file: !1, line: 15, type: !7)
!31 = !DILocation(line: 15, column: 3, scope: !4)
!32 = !DILocalVariable(name: "mod", scope: !4, file: !1, line: 13, type: !7)
!33 = !DILocation(line: 13, column: 3, scope: !4)
!34 = !DILocalVariable(name: "div", scope: !4, file: !1, line: 12, type: !7)
!35 = !DILocation(line: 12, column: 3, scope: !4)
!36 = !DILocalVariable(name: "mul", scope: !4, file: !1, line: 11, type: !7)
!37 = !DILocation(line: 11, column: 3, scope: !4)
!38 = !DILocalVariable(name: "sub2", scope: !4, file: !1, line: 10, type: !7)
!39 = !DILocation(line: 10, column: 3, scope: !4)
!40 = !DILocalVariable(name: "sub", scope: !4, file: !1, line: 9, type: !7)
!41 = !DILocation(line: 9, column: 3, scope: !4)
!42 = !DILocalVariable(name: "sum", scope: !4, file: !1, line: 8, type: !7)
!43 = !DILocation(line: 8, column: 3, scope: !4)
!44 = !DILocalVariable(name: "b", scope: !4, file: !1, line: 6, type: !7)
!45 = !DILocation(line: 6, column: 3, scope: !4)
!46 = !DILocalVariable(name: "a", scope: !4, file: !1, line: 5, type: !7)
!47 = !DILocation(line: 5, column: 3, scope: !4)
!48 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 4, type: !7)
!49 = !DILocation(line: 4, column: 3, scope: !4)
!50 = !DILocation(line: 16, column: 3, scope: !4)
!51 = !DILocation(line: 18, column: 3, scope: !4)
!52 = !DILocation(line: 20, column: 3, scope: !4)
!53 = !DILocation(line: 22, column: 3, scope: !4)
!54 = !DILocation(line: 24, column: 3, scope: !4)
!55 = !DILocation(line: 26, column: 3, scope: !4)
!56 = !DILocation(line: 26, column: 18, scope: !4)
!57 = !DILocation(line: 27, column: 3, scope: !4)
!58 = !DILocation(line: 27, column: 18, scope: !4)
!59 = !DILocation(line: 28, column: 3, scope: !4)
!60 = !DILocation(line: 28, column: 20, scope: !4)
!61 = !DILocation(line: 29, column: 3, scope: !4)
!62 = !DILocation(line: 29, column: 19, scope: !4)
!63 = !DILocation(line: 30, column: 3, scope: !4)
!64 = !DILocation(line: 30, column: 20, scope: !4)
!65 = !DILocation(line: 31, column: 3, scope: !4)
!66 = !DILocation(line: 31, column: 17, scope: !4)
!67 = !DILocation(line: 32, column: 3, scope: !4)
!68 = !DILocation(line: 32, column: 17, scope: !4)
!69 = !DILocation(line: 33, column: 3, scope: !4)
!70 = !DILocation(line: 33, column: 20, scope: !4)
!71 = !DILocation(line: 34, column: 3, scope: !4)
!72 = !DILocation(line: 34, column: 20, scope: !4)
!73 = !DILocation(line: 35, column: 3, scope: !4)
!74 = !DILocation(line: 35, column: 21, scope: !4)
!75 = !DILocation(line: 36, column: 3, scope: !4)
!76 = !DILocation(line: 36, column: 20, scope: !4)
!77 = !DILocation(line: 37, column: 3, scope: !4)
!78 = !DILocation(line: 37, column: 19, scope: !4)
!79 = !DILocation(line: 41, column: 3, scope: !4)
!80 = !DILocation(line: 41, column: 21, scope: !4)
!81 = !DILocation(line: 42, column: 3, scope: !4)
!82 = !DILocation(line: 42, column: 21, scope: !4)
!83 = !DILocation(line: 46, column: 3, scope: !4)
!84 = !DILocation(line: 46, column: 26, scope: !4)
!85 = !DILocation(line: 50, column: 3, scope: !4)
!86 = !DILocation(line: 50, column: 31, scope: !4)
!87 = !DILocation(line: 52, column: 3, scope: !4)
!88 = !DILocation(line: 53, column: 5, scope: !89)
!89 = distinct !DILexicalBlock(scope: !4, file: !1, line: 52, column: 17)
!90 = !DILocation(line: 55, column: 5, scope: !91)
!91 = distinct !DILexicalBlock(scope: !4, file: !1, line: 54, column: 10)
!92 = !DILocation(line: 57, column: 3, scope: !4)
