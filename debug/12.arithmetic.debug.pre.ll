; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [22 x i8] c"12.arithmetic.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"12.arithmetic.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %mixedUi = alloca i32, align 4
    #dbg_declare(ptr %mixedUi, !8, !DIExpression(), !10)
  %mixedSi = alloca i32, align 4
    #dbg_declare(ptr %mixedSi, !11, !DIExpression(), !12)
  %negB = alloca i32, align 4
    #dbg_declare(ptr %negB, !13, !DIExpression(), !14)
  %negA = alloca i32, align 4
    #dbg_declare(ptr %negA, !15, !DIExpression(), !16)
  %ub = alloca i32, align 4
    #dbg_declare(ptr %ub, !17, !DIExpression(), !18)
  %ua = alloca i32, align 4
    #dbg_declare(ptr %ua, !19, !DIExpression(), !20)
  %modeq = alloca i32, align 4
    #dbg_declare(ptr %modeq, !21, !DIExpression(), !22)
  %diveq = alloca i32, align 4
    #dbg_declare(ptr %diveq, !23, !DIExpression(), !24)
  %muleq = alloca i32, align 4
    #dbg_declare(ptr %muleq, !25, !DIExpression(), !26)
  %subeq = alloca i32, align 4
    #dbg_declare(ptr %subeq, !27, !DIExpression(), !28)
  %sumeq = alloca i32, align 4
    #dbg_declare(ptr %sumeq, !29, !DIExpression(), !30)
  %mod = alloca i32, align 4
    #dbg_declare(ptr %mod, !31, !DIExpression(), !32)
  %div = alloca i32, align 4
    #dbg_declare(ptr %div, !33, !DIExpression(), !34)
  %mul = alloca i32, align 4
    #dbg_declare(ptr %mul, !35, !DIExpression(), !36)
  %sub2 = alloca i32, align 4
    #dbg_declare(ptr %sub2, !37, !DIExpression(), !38)
  %sub = alloca i32, align 4
    #dbg_declare(ptr %sub, !39, !DIExpression(), !40)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !41, !DIExpression(), !42)
  %b = alloca i32, align 4
    #dbg_declare(ptr %b, !43, !DIExpression(), !44)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !45, !DIExpression(), !46)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !47, !DIExpression(), !48)
  store i32 0, ptr %err, align 4, !dbg !48
  store i32 37, ptr %a, align 4, !dbg !46
  store i32 8, ptr %b, align 4, !dbg !44
  %0 = load i32, ptr %a, align 4, !dbg !42
  %1 = load i32, ptr %b, align 4, !dbg !42
  %2 = add i32 %0, %1, !dbg !42
  store i32 %2, ptr %sum, align 4, !dbg !42
  %3 = load i32, ptr %a, align 4, !dbg !40
  %4 = load i32, ptr %b, align 4, !dbg !40
  %5 = sub i32 %3, %4, !dbg !40
  store i32 %5, ptr %sub, align 4, !dbg !40
  %6 = load i32, ptr %b, align 4, !dbg !38
  %7 = load i32, ptr %a, align 4, !dbg !38
  %8 = sub i32 %6, %7, !dbg !38
  store i32 %8, ptr %sub2, align 4, !dbg !38
  %9 = load i32, ptr %a, align 4, !dbg !36
  %10 = load i32, ptr %b, align 4, !dbg !36
  %11 = mul i32 %9, %10, !dbg !36
  store i32 %11, ptr %mul, align 4, !dbg !36
  %12 = load i32, ptr %a, align 4, !dbg !34
  %13 = load i32, ptr %b, align 4, !dbg !34
  %14 = sdiv i32 %12, %13, !dbg !34
  store i32 %14, ptr %div, align 4, !dbg !34
  %15 = load i32, ptr %a, align 4, !dbg !32
  %16 = load i32, ptr %b, align 4, !dbg !32
  %17 = srem i32 %15, %16, !dbg !32
  store i32 %17, ptr %mod, align 4, !dbg !32
  %18 = load i32, ptr %sum, align 4, !dbg !30
  store i32 %18, ptr %sumeq, align 4, !dbg !30
  %19 = load i32, ptr %b, align 4, !dbg !49
  %20 = load i32, ptr %sumeq, align 4, !dbg !49
  %21 = add i32 %20, %19, !dbg !49
  store i32 %21, ptr %sumeq, align 4, !dbg !49
  %22 = load i32, ptr %sumeq, align 4, !dbg !49
  %23 = load i32, ptr %sumeq, align 4, !dbg !28
  store i32 %23, ptr %subeq, align 4, !dbg !28
  %24 = load i32, ptr %b, align 4, !dbg !50
  %25 = load i32, ptr %subeq, align 4, !dbg !50
  %26 = sub i32 %25, %24, !dbg !50
  store i32 %26, ptr %subeq, align 4, !dbg !50
  %27 = load i32, ptr %subeq, align 4, !dbg !50
  %28 = load i32, ptr %subeq, align 4, !dbg !26
  store i32 %28, ptr %muleq, align 4, !dbg !26
  %29 = load i32, ptr %b, align 4, !dbg !51
  %30 = load i32, ptr %muleq, align 4, !dbg !51
  %31 = mul i32 %30, %29, !dbg !51
  store i32 %31, ptr %muleq, align 4, !dbg !51
  %32 = load i32, ptr %muleq, align 4, !dbg !51
  %33 = load i32, ptr %muleq, align 4, !dbg !24
  store i32 %33, ptr %diveq, align 4, !dbg !24
  %34 = load i32, ptr %b, align 4, !dbg !52
  %35 = load i32, ptr %diveq, align 4, !dbg !52
  %36 = sdiv i32 %35, %34, !dbg !52
  store i32 %36, ptr %diveq, align 4, !dbg !52
  %37 = load i32, ptr %diveq, align 4, !dbg !52
  %38 = load i32, ptr %diveq, align 4, !dbg !22
  store i32 %38, ptr %modeq, align 4, !dbg !22
  %39 = load i32, ptr %b, align 4, !dbg !53
  %40 = load i32, ptr %modeq, align 4, !dbg !53
  %41 = srem i32 %40, %39, !dbg !53
  store i32 %41, ptr %modeq, align 4, !dbg !53
  %42 = load i32, ptr %modeq, align 4, !dbg !53
  %43 = load i32, ptr %sum, align 4, !dbg !54
  %44 = icmp ne i32 %43, 45, !dbg !54
  br i1 %44, label %then, label %else, !dbg !54

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !55
  %45 = load i32, ptr %err, align 4, !dbg !55
  br label %if.end, !dbg !55

else:                                             ; preds = %entry
  br label %if.end, !dbg !55

if.end:                                           ; preds = %else, %then
  %46 = load i32, ptr %sub, align 4, !dbg !56
  %47 = icmp ne i32 %46, 29, !dbg !56
  br i1 %47, label %then1, label %else2, !dbg !56

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !57
  %48 = load i32, ptr %err, align 4, !dbg !57
  br label %if.end3, !dbg !57

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !57

if.end3:                                          ; preds = %else2, %then1
  %49 = load i32, ptr %sub2, align 4, !dbg !58
  %50 = icmp ne i32 %49, -29, !dbg !58
  br i1 %50, label %then4, label %else5, !dbg !58

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !59
  %51 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end6, !dbg !59

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !59

if.end6:                                          ; preds = %else5, %then4
  %52 = load i32, ptr %mul, align 4, !dbg !60
  %53 = icmp ne i32 %52, 296, !dbg !60
  br i1 %53, label %then7, label %else8, !dbg !60

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !61
  %54 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end9, !dbg !61

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !61

if.end9:                                          ; preds = %else8, %then7
  %55 = load i32, ptr %a, align 4, !dbg !62
  %56 = add i32 %55, 0, !dbg !62
  %57 = icmp ne i32 %56, 37, !dbg !62
  br i1 %57, label %then10, label %else11, !dbg !62

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !63
  %58 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end12, !dbg !63

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !63

if.end12:                                         ; preds = %else11, %then10
  %59 = load i32, ptr %div, align 4, !dbg !64
  %60 = icmp ne i32 %59, 4, !dbg !64
  br i1 %60, label %then13, label %else14, !dbg !64

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !65
  %61 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end15, !dbg !65

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !65

if.end15:                                         ; preds = %else14, %then13
  %62 = load i32, ptr %mod, align 4, !dbg !66
  %63 = icmp ne i32 %62, 5, !dbg !66
  br i1 %63, label %then16, label %else17, !dbg !66

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !67
  %64 = load i32, ptr %err, align 4, !dbg !67
  br label %if.end18, !dbg !67

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !67

if.end18:                                         ; preds = %else17, %then16
  %65 = load i32, ptr %sumeq, align 4, !dbg !68
  %66 = icmp ne i32 %65, 53, !dbg !68
  br i1 %66, label %then19, label %else20, !dbg !68

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !69
  %67 = load i32, ptr %err, align 4, !dbg !69
  br label %if.end21, !dbg !69

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !69

if.end21:                                         ; preds = %else20, %then19
  %68 = load i32, ptr %subeq, align 4, !dbg !70
  %69 = icmp ne i32 %68, 45, !dbg !70
  br i1 %69, label %then22, label %else23, !dbg !70

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !71
  %70 = load i32, ptr %err, align 4, !dbg !71
  br label %if.end24, !dbg !71

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !71

if.end24:                                         ; preds = %else23, %then22
  %71 = load i32, ptr %muleq, align 4, !dbg !72
  %72 = icmp ne i32 %71, 360, !dbg !72
  br i1 %72, label %then25, label %else26, !dbg !72

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !73
  %73 = load i32, ptr %err, align 4, !dbg !73
  br label %if.end27, !dbg !73

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !73

if.end27:                                         ; preds = %else26, %then25
  %74 = load i32, ptr %diveq, align 4, !dbg !74
  %75 = icmp ne i32 %74, 45, !dbg !74
  br i1 %75, label %then28, label %else29, !dbg !74

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !75
  %76 = load i32, ptr %err, align 4, !dbg !75
  br label %if.end30, !dbg !75

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !75

if.end30:                                         ; preds = %else29, %then28
  %77 = load i32, ptr %modeq, align 4, !dbg !76
  %78 = icmp ne i32 %77, 5, !dbg !76
  br i1 %78, label %then31, label %else32, !dbg !76

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !77
  %79 = load i32, ptr %err, align 4, !dbg !77
  br label %if.end33, !dbg !77

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !77

if.end33:                                         ; preds = %else32, %then31
  store i32 10, ptr %ua, align 4, !dbg !20
  store i32 3, ptr %ub, align 4, !dbg !18
  %80 = load i32, ptr %ua, align 4, !dbg !78
  %81 = load i32, ptr %ub, align 4, !dbg !78
  %82 = udiv i32 %80, %81, !dbg !78
  %83 = icmp ne i32 %82, 3, !dbg !78
  br i1 %83, label %then34, label %else35, !dbg !78

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !79
  %84 = load i32, ptr %err, align 4, !dbg !79
  br label %if.end36, !dbg !79

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !79

if.end36:                                         ; preds = %else35, %then34
  %85 = load i32, ptr %ua, align 4, !dbg !80
  %86 = load i32, ptr %ub, align 4, !dbg !80
  %87 = urem i32 %85, %86, !dbg !80
  %88 = icmp ne i32 %87, 1, !dbg !80
  br i1 %88, label %then37, label %else38, !dbg !80

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !81
  %89 = load i32, ptr %err, align 4, !dbg !81
  br label %if.end39, !dbg !81

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !81

if.end39:                                         ; preds = %else38, %then37
  store i32 -8, ptr %negA, align 4, !dbg !16
  store i32 3, ptr %negB, align 4, !dbg !14
  %90 = load i32, ptr %negA, align 4, !dbg !82
  %91 = load i32, ptr %negB, align 4, !dbg !82
  %92 = srem i32 %90, %91, !dbg !82
  %93 = icmp ne i32 %92, -2, !dbg !82
  br i1 %93, label %then40, label %else41, !dbg !82

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !83
  %94 = load i32, ptr %err, align 4, !dbg !83
  br label %if.end42, !dbg !83

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !83

if.end42:                                         ; preds = %else41, %then40
  store i32 -1, ptr %mixedSi, align 4, !dbg !12
  store i32 1, ptr %mixedUi, align 4, !dbg !10
  %95 = load i32, ptr %mixedSi, align 4, !dbg !84
  %96 = load i32, ptr %mixedUi, align 4, !dbg !84
  %97 = add i32 %95, %96, !dbg !84
  %98 = icmp ne i32 %97, 0, !dbg !84
  br i1 %98, label %then43, label %else44, !dbg !84

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4, !dbg !85
  %99 = load i32, ptr %err, align 4, !dbg !85
  br label %if.end45, !dbg !85

else44:                                           ; preds = %if.end42
  br label %if.end45, !dbg !85

if.end45:                                         ; preds = %else44, %then43
  %100 = load i32, ptr %err, align 4, !dbg !86
  %101 = icmp eq i32 %100, 0, !dbg !86
  br i1 %101, label %then46, label %else47, !dbg !86

then46:                                           ; preds = %if.end45
  %102 = call i32 (ptr, ...) @printf(ptr @0), !dbg !87
  br label %if.end48, !dbg !87

else47:                                           ; preds = %if.end45
  %103 = call i32 (ptr, ...) @printf(ptr @1), !dbg !89
  br label %if.end48, !dbg !89

if.end48:                                         ; preds = %else47, %then46
  %104 = load i32, ptr %err, align 4, !dbg !91
  ret i32 %104, !dbg !91
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "12.arithmetic.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "mixedUi", scope: !4, file: !3, line: 52, type: !9)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !DILocation(line: 52, column: 3, scope: !4)
!11 = !DILocalVariable(name: "mixedSi", scope: !4, file: !3, line: 51, type: !7)
!12 = !DILocation(line: 51, column: 3, scope: !4)
!13 = !DILocalVariable(name: "negB", scope: !4, file: !3, line: 48, type: !7)
!14 = !DILocation(line: 48, column: 3, scope: !4)
!15 = !DILocalVariable(name: "negA", scope: !4, file: !3, line: 47, type: !7)
!16 = !DILocation(line: 47, column: 3, scope: !4)
!17 = !DILocalVariable(name: "ub", scope: !4, file: !3, line: 43, type: !9)
!18 = !DILocation(line: 43, column: 3, scope: !4)
!19 = !DILocalVariable(name: "ua", scope: !4, file: !3, line: 42, type: !9)
!20 = !DILocation(line: 42, column: 3, scope: !4)
!21 = !DILocalVariable(name: "modeq", scope: !4, file: !3, line: 26, type: !7)
!22 = !DILocation(line: 26, column: 3, scope: !4)
!23 = !DILocalVariable(name: "diveq", scope: !4, file: !3, line: 24, type: !7)
!24 = !DILocation(line: 24, column: 3, scope: !4)
!25 = !DILocalVariable(name: "muleq", scope: !4, file: !3, line: 22, type: !7)
!26 = !DILocation(line: 22, column: 3, scope: !4)
!27 = !DILocalVariable(name: "subeq", scope: !4, file: !3, line: 20, type: !7)
!28 = !DILocation(line: 20, column: 3, scope: !4)
!29 = !DILocalVariable(name: "sumeq", scope: !4, file: !3, line: 18, type: !7)
!30 = !DILocation(line: 18, column: 3, scope: !4)
!31 = !DILocalVariable(name: "mod", scope: !4, file: !3, line: 16, type: !7)
!32 = !DILocation(line: 16, column: 3, scope: !4)
!33 = !DILocalVariable(name: "div", scope: !4, file: !3, line: 15, type: !7)
!34 = !DILocation(line: 15, column: 3, scope: !4)
!35 = !DILocalVariable(name: "mul", scope: !4, file: !3, line: 14, type: !7)
!36 = !DILocation(line: 14, column: 3, scope: !4)
!37 = !DILocalVariable(name: "sub2", scope: !4, file: !3, line: 13, type: !7)
!38 = !DILocation(line: 13, column: 3, scope: !4)
!39 = !DILocalVariable(name: "sub", scope: !4, file: !3, line: 12, type: !7)
!40 = !DILocation(line: 12, column: 3, scope: !4)
!41 = !DILocalVariable(name: "sum", scope: !4, file: !3, line: 11, type: !7)
!42 = !DILocation(line: 11, column: 3, scope: !4)
!43 = !DILocalVariable(name: "b", scope: !4, file: !3, line: 9, type: !7)
!44 = !DILocation(line: 9, column: 3, scope: !4)
!45 = !DILocalVariable(name: "a", scope: !4, file: !3, line: 8, type: !7)
!46 = !DILocation(line: 8, column: 3, scope: !4)
!47 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 7, type: !7)
!48 = !DILocation(line: 7, column: 3, scope: !4)
!49 = !DILocation(line: 19, column: 3, scope: !4)
!50 = !DILocation(line: 21, column: 3, scope: !4)
!51 = !DILocation(line: 23, column: 3, scope: !4)
!52 = !DILocation(line: 25, column: 3, scope: !4)
!53 = !DILocation(line: 27, column: 3, scope: !4)
!54 = !DILocation(line: 29, column: 3, scope: !4)
!55 = !DILocation(line: 29, column: 18, scope: !4)
!56 = !DILocation(line: 30, column: 3, scope: !4)
!57 = !DILocation(line: 30, column: 18, scope: !4)
!58 = !DILocation(line: 31, column: 3, scope: !4)
!59 = !DILocation(line: 31, column: 20, scope: !4)
!60 = !DILocation(line: 32, column: 3, scope: !4)
!61 = !DILocation(line: 32, column: 19, scope: !4)
!62 = !DILocation(line: 33, column: 3, scope: !4)
!63 = !DILocation(line: 33, column: 20, scope: !4)
!64 = !DILocation(line: 34, column: 3, scope: !4)
!65 = !DILocation(line: 34, column: 17, scope: !4)
!66 = !DILocation(line: 35, column: 3, scope: !4)
!67 = !DILocation(line: 35, column: 17, scope: !4)
!68 = !DILocation(line: 36, column: 3, scope: !4)
!69 = !DILocation(line: 36, column: 20, scope: !4)
!70 = !DILocation(line: 37, column: 3, scope: !4)
!71 = !DILocation(line: 37, column: 20, scope: !4)
!72 = !DILocation(line: 38, column: 3, scope: !4)
!73 = !DILocation(line: 38, column: 21, scope: !4)
!74 = !DILocation(line: 39, column: 3, scope: !4)
!75 = !DILocation(line: 39, column: 20, scope: !4)
!76 = !DILocation(line: 40, column: 3, scope: !4)
!77 = !DILocation(line: 40, column: 19, scope: !4)
!78 = !DILocation(line: 44, column: 3, scope: !4)
!79 = !DILocation(line: 44, column: 21, scope: !4)
!80 = !DILocation(line: 45, column: 3, scope: !4)
!81 = !DILocation(line: 45, column: 21, scope: !4)
!82 = !DILocation(line: 49, column: 3, scope: !4)
!83 = !DILocation(line: 49, column: 26, scope: !4)
!84 = !DILocation(line: 53, column: 3, scope: !4)
!85 = !DILocation(line: 53, column: 31, scope: !4)
!86 = !DILocation(line: 55, column: 3, scope: !4)
!87 = !DILocation(line: 56, column: 5, scope: !88)
!88 = distinct !DILexicalBlock(scope: !4, file: !3, line: 55, column: 17)
!89 = !DILocation(line: 58, column: 5, scope: !90)
!90 = distinct !DILexicalBlock(scope: !4, file: !3, line: 57, column: 10)
!91 = !DILocation(line: 60, column: 3, scope: !4)
