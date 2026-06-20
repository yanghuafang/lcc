; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

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
  br i1 %44, label %then, label %if.end, !dbg !53

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !54
  %45 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end, !dbg !54

if.end:                                           ; preds = %entry, %then
  %46 = load i32, ptr %sub, align 4, !dbg !55
  %47 = icmp ne i32 %46, 29, !dbg !55
  br i1 %47, label %then1, label %if.end3, !dbg !55

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !56
  %48 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end3, !dbg !56

if.end3:                                          ; preds = %if.end, %then1
  %49 = load i32, ptr %sub2, align 4, !dbg !57
  %50 = icmp ne i32 %49, -29, !dbg !57
  br i1 %50, label %then4, label %if.end6, !dbg !57

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !58
  %51 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end6, !dbg !58

if.end6:                                          ; preds = %if.end3, %then4
  %52 = load i32, ptr %mul, align 4, !dbg !59
  %53 = icmp ne i32 %52, 296, !dbg !59
  br i1 %53, label %then7, label %if.end9, !dbg !59

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !60
  %54 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end9, !dbg !60

if.end9:                                          ; preds = %if.end6, %then7
  %55 = load i32, ptr %div, align 4, !dbg !61
  %56 = icmp ne i32 %55, 4, !dbg !61
  br i1 %56, label %then10, label %if.end12, !dbg !61

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !62
  %57 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end12, !dbg !62

if.end12:                                         ; preds = %if.end9, %then10
  %58 = load i32, ptr %mod, align 4, !dbg !63
  %59 = icmp ne i32 %58, 5, !dbg !63
  br i1 %59, label %then13, label %if.end15, !dbg !63

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !64
  %60 = load i32, ptr %err, align 4, !dbg !64
  br label %if.end15, !dbg !64

if.end15:                                         ; preds = %if.end12, %then13
  %61 = load i32, ptr %sumeq, align 4, !dbg !65
  %62 = icmp ne i32 %61, 53, !dbg !65
  br i1 %62, label %then16, label %if.end18, !dbg !65

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !66
  %63 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end18, !dbg !66

if.end18:                                         ; preds = %if.end15, %then16
  %64 = load i32, ptr %subeq, align 4, !dbg !67
  %65 = icmp ne i32 %64, 45, !dbg !67
  br i1 %65, label %then19, label %if.end21, !dbg !67

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !68
  %66 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end21, !dbg !68

if.end21:                                         ; preds = %if.end18, %then19
  %67 = load i32, ptr %muleq, align 4, !dbg !69
  %68 = icmp ne i32 %67, 360, !dbg !69
  br i1 %68, label %then22, label %if.end24, !dbg !69

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !70
  %69 = load i32, ptr %err, align 4, !dbg !70
  br label %if.end24, !dbg !70

if.end24:                                         ; preds = %if.end21, %then22
  %70 = load i32, ptr %diveq, align 4, !dbg !71
  %71 = icmp ne i32 %70, 45, !dbg !71
  br i1 %71, label %then25, label %if.end27, !dbg !71

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !72
  %72 = load i32, ptr %err, align 4, !dbg !72
  br label %if.end27, !dbg !72

if.end27:                                         ; preds = %if.end24, %then25
  %73 = load i32, ptr %modeq, align 4, !dbg !73
  %74 = icmp ne i32 %73, 5, !dbg !73
  br i1 %74, label %then28, label %if.end30, !dbg !73

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !74
  %75 = load i32, ptr %err, align 4, !dbg !74
  br label %if.end30, !dbg !74

if.end30:                                         ; preds = %if.end27, %then28
  store i32 10, ptr %ua, align 4, !dbg !19
  store i32 3, ptr %ub, align 4, !dbg !17
  %76 = load i32, ptr %ua, align 4, !dbg !75
  %77 = load i32, ptr %ub, align 4, !dbg !75
  %78 = udiv i32 %76, %77, !dbg !75
  %79 = icmp ne i32 %78, 3, !dbg !75
  br i1 %79, label %then31, label %if.end33, !dbg !75

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !76
  %80 = load i32, ptr %err, align 4, !dbg !76
  br label %if.end33, !dbg !76

if.end33:                                         ; preds = %if.end30, %then31
  %81 = load i32, ptr %ua, align 4, !dbg !77
  %82 = load i32, ptr %ub, align 4, !dbg !77
  %83 = urem i32 %81, %82, !dbg !77
  %84 = icmp ne i32 %83, 1, !dbg !77
  br i1 %84, label %then34, label %if.end36, !dbg !77

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !78
  %85 = load i32, ptr %err, align 4, !dbg !78
  br label %if.end36, !dbg !78

if.end36:                                         ; preds = %if.end33, %then34
  store i32 -8, ptr %negA, align 4, !dbg !15
  store i32 3, ptr %negB, align 4, !dbg !13
  %86 = load i32, ptr %negA, align 4, !dbg !79
  %87 = load i32, ptr %negB, align 4, !dbg !79
  %88 = srem i32 %86, %87, !dbg !79
  %89 = icmp ne i32 %88, -2, !dbg !79
  br i1 %89, label %then37, label %if.end39, !dbg !79

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !80
  %90 = load i32, ptr %err, align 4, !dbg !80
  br label %if.end39, !dbg !80

if.end39:                                         ; preds = %if.end36, %then37
  store i32 -1, ptr %mixedSi, align 4, !dbg !11
  store i32 1, ptr %mixedUi, align 4, !dbg !9
  %91 = load i32, ptr %mixedSi, align 4, !dbg !81
  %92 = load i32, ptr %mixedUi, align 4, !dbg !81
  %93 = add i32 %91, %92, !dbg !81
  %94 = icmp ne i32 %93, 0, !dbg !81
  br i1 %94, label %then40, label %if.end42, !dbg !81

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !82
  %95 = load i32, ptr %err, align 4, !dbg !82
  br label %if.end42, !dbg !82

if.end42:                                         ; preds = %if.end39, %then40
  %96 = load i32, ptr %err, align 4, !dbg !83
  %97 = icmp eq i32 %96, 0, !dbg !83
  %. = select i1 %97, ptr @0, ptr @1, !dbg !84
  %98 = call i32 (ptr, ...) @printf(ptr %.), !dbg !84
  %99 = load i32, ptr %err, align 4, !dbg !85
  ret i32 %99, !dbg !85
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "12.arithmetic.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "mixedUi", scope: !2, file: !1, line: 48, type: !8)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !DILocation(line: 48, column: 3, scope: !2)
!10 = !DILocalVariable(name: "mixedSi", scope: !2, file: !1, line: 47, type: !5)
!11 = !DILocation(line: 47, column: 3, scope: !2)
!12 = !DILocalVariable(name: "negB", scope: !2, file: !1, line: 44, type: !5)
!13 = !DILocation(line: 44, column: 3, scope: !2)
!14 = !DILocalVariable(name: "negA", scope: !2, file: !1, line: 43, type: !5)
!15 = !DILocation(line: 43, column: 3, scope: !2)
!16 = !DILocalVariable(name: "ub", scope: !2, file: !1, line: 39, type: !8)
!17 = !DILocation(line: 39, column: 3, scope: !2)
!18 = !DILocalVariable(name: "ua", scope: !2, file: !1, line: 38, type: !8)
!19 = !DILocation(line: 38, column: 3, scope: !2)
!20 = !DILocalVariable(name: "modeq", scope: !2, file: !1, line: 23, type: !5)
!21 = !DILocation(line: 23, column: 3, scope: !2)
!22 = !DILocalVariable(name: "diveq", scope: !2, file: !1, line: 21, type: !5)
!23 = !DILocation(line: 21, column: 3, scope: !2)
!24 = !DILocalVariable(name: "muleq", scope: !2, file: !1, line: 19, type: !5)
!25 = !DILocation(line: 19, column: 3, scope: !2)
!26 = !DILocalVariable(name: "subeq", scope: !2, file: !1, line: 17, type: !5)
!27 = !DILocation(line: 17, column: 3, scope: !2)
!28 = !DILocalVariable(name: "sumeq", scope: !2, file: !1, line: 15, type: !5)
!29 = !DILocation(line: 15, column: 3, scope: !2)
!30 = !DILocalVariable(name: "mod", scope: !2, file: !1, line: 13, type: !5)
!31 = !DILocation(line: 13, column: 3, scope: !2)
!32 = !DILocalVariable(name: "div", scope: !2, file: !1, line: 12, type: !5)
!33 = !DILocation(line: 12, column: 3, scope: !2)
!34 = !DILocalVariable(name: "mul", scope: !2, file: !1, line: 11, type: !5)
!35 = !DILocation(line: 11, column: 3, scope: !2)
!36 = !DILocalVariable(name: "sub2", scope: !2, file: !1, line: 10, type: !5)
!37 = !DILocation(line: 10, column: 3, scope: !2)
!38 = !DILocalVariable(name: "sub", scope: !2, file: !1, line: 9, type: !5)
!39 = !DILocation(line: 9, column: 3, scope: !2)
!40 = !DILocalVariable(name: "sum", scope: !2, file: !1, line: 8, type: !5)
!41 = !DILocation(line: 8, column: 3, scope: !2)
!42 = !DILocalVariable(name: "b", scope: !2, file: !1, line: 6, type: !5)
!43 = !DILocation(line: 6, column: 3, scope: !2)
!44 = !DILocalVariable(name: "a", scope: !2, file: !1, line: 5, type: !5)
!45 = !DILocation(line: 5, column: 3, scope: !2)
!46 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 4, type: !5)
!47 = !DILocation(line: 4, column: 3, scope: !2)
!48 = !DILocation(line: 16, column: 3, scope: !2)
!49 = !DILocation(line: 18, column: 3, scope: !2)
!50 = !DILocation(line: 20, column: 3, scope: !2)
!51 = !DILocation(line: 22, column: 3, scope: !2)
!52 = !DILocation(line: 24, column: 3, scope: !2)
!53 = !DILocation(line: 26, column: 3, scope: !2)
!54 = !DILocation(line: 26, column: 18, scope: !2)
!55 = !DILocation(line: 27, column: 3, scope: !2)
!56 = !DILocation(line: 27, column: 18, scope: !2)
!57 = !DILocation(line: 28, column: 3, scope: !2)
!58 = !DILocation(line: 28, column: 20, scope: !2)
!59 = !DILocation(line: 29, column: 3, scope: !2)
!60 = !DILocation(line: 29, column: 19, scope: !2)
!61 = !DILocation(line: 30, column: 3, scope: !2)
!62 = !DILocation(line: 30, column: 17, scope: !2)
!63 = !DILocation(line: 31, column: 3, scope: !2)
!64 = !DILocation(line: 31, column: 17, scope: !2)
!65 = !DILocation(line: 32, column: 3, scope: !2)
!66 = !DILocation(line: 32, column: 20, scope: !2)
!67 = !DILocation(line: 33, column: 3, scope: !2)
!68 = !DILocation(line: 33, column: 20, scope: !2)
!69 = !DILocation(line: 34, column: 3, scope: !2)
!70 = !DILocation(line: 34, column: 21, scope: !2)
!71 = !DILocation(line: 35, column: 3, scope: !2)
!72 = !DILocation(line: 35, column: 20, scope: !2)
!73 = !DILocation(line: 36, column: 3, scope: !2)
!74 = !DILocation(line: 36, column: 19, scope: !2)
!75 = !DILocation(line: 40, column: 3, scope: !2)
!76 = !DILocation(line: 40, column: 21, scope: !2)
!77 = !DILocation(line: 41, column: 3, scope: !2)
!78 = !DILocation(line: 41, column: 21, scope: !2)
!79 = !DILocation(line: 45, column: 3, scope: !2)
!80 = !DILocation(line: 45, column: 26, scope: !2)
!81 = !DILocation(line: 49, column: 3, scope: !2)
!82 = !DILocation(line: 49, column: 31, scope: !2)
!83 = !DILocation(line: 51, column: 3, scope: !2)
!84 = !DILocation(line: 0, scope: !2)
!85 = !DILocation(line: 56, column: 3, scope: !2)
