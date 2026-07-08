; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [22 x i8] c"12.arithmetic.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"12.arithmetic.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !4 {
entry:
  %mixedUi = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %mixedUi, metadata !9, metadata !DIExpression()), !dbg !11
  %mixedSi = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %mixedSi, metadata !12, metadata !DIExpression()), !dbg !13
  %negB = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %negB, metadata !14, metadata !DIExpression()), !dbg !15
  %negA = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %negA, metadata !16, metadata !DIExpression()), !dbg !17
  %ub = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %ub, metadata !18, metadata !DIExpression()), !dbg !19
  %ua = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %ua, metadata !20, metadata !DIExpression()), !dbg !21
  %modeq = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %modeq, metadata !22, metadata !DIExpression()), !dbg !23
  %diveq = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %diveq, metadata !24, metadata !DIExpression()), !dbg !25
  %muleq = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %muleq, metadata !26, metadata !DIExpression()), !dbg !27
  %subeq = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %subeq, metadata !28, metadata !DIExpression()), !dbg !29
  %sumeq = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sumeq, metadata !30, metadata !DIExpression()), !dbg !31
  %mod = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %mod, metadata !32, metadata !DIExpression()), !dbg !33
  %div = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %div, metadata !34, metadata !DIExpression()), !dbg !35
  %mul = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %mul, metadata !36, metadata !DIExpression()), !dbg !37
  %sub2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sub2, metadata !38, metadata !DIExpression()), !dbg !39
  %sub = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sub, metadata !40, metadata !DIExpression()), !dbg !41
  %sum = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !42, metadata !DIExpression()), !dbg !43
  %b = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %b, metadata !44, metadata !DIExpression()), !dbg !45
  %a = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !46, metadata !DIExpression()), !dbg !47
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !48, metadata !DIExpression()), !dbg !49
  store i32 0, i32* %err, align 4, !dbg !49
  store i32 37, i32* %a, align 4, !dbg !47
  store i32 8, i32* %b, align 4, !dbg !45
  %0 = load i32, i32* %a, align 4, !dbg !43
  %1 = load i32, i32* %b, align 4, !dbg !43
  %2 = add i32 %0, %1, !dbg !43
  store i32 %2, i32* %sum, align 4, !dbg !43
  %3 = load i32, i32* %a, align 4, !dbg !41
  %4 = load i32, i32* %b, align 4, !dbg !41
  %5 = sub i32 %3, %4, !dbg !41
  store i32 %5, i32* %sub, align 4, !dbg !41
  %6 = load i32, i32* %b, align 4, !dbg !39
  %7 = load i32, i32* %a, align 4, !dbg !39
  %8 = sub i32 %6, %7, !dbg !39
  store i32 %8, i32* %sub2, align 4, !dbg !39
  %9 = load i32, i32* %a, align 4, !dbg !37
  %10 = load i32, i32* %b, align 4, !dbg !37
  %11 = mul i32 %9, %10, !dbg !37
  store i32 %11, i32* %mul, align 4, !dbg !37
  %12 = load i32, i32* %a, align 4, !dbg !35
  %13 = load i32, i32* %b, align 4, !dbg !35
  %14 = sdiv i32 %12, %13, !dbg !35
  store i32 %14, i32* %div, align 4, !dbg !35
  %15 = load i32, i32* %a, align 4, !dbg !33
  %16 = load i32, i32* %b, align 4, !dbg !33
  %17 = srem i32 %15, %16, !dbg !33
  store i32 %17, i32* %mod, align 4, !dbg !33
  %18 = load i32, i32* %sum, align 4, !dbg !31
  store i32 %18, i32* %sumeq, align 4, !dbg !31
  %19 = load i32, i32* %b, align 4, !dbg !50
  %20 = load i32, i32* %sumeq, align 4, !dbg !50
  %21 = add i32 %20, %19, !dbg !50
  store i32 %21, i32* %sumeq, align 4, !dbg !50
  %22 = load i32, i32* %sumeq, align 4, !dbg !50
  %23 = load i32, i32* %sumeq, align 4, !dbg !29
  store i32 %23, i32* %subeq, align 4, !dbg !29
  %24 = load i32, i32* %b, align 4, !dbg !51
  %25 = load i32, i32* %subeq, align 4, !dbg !51
  %26 = sub i32 %25, %24, !dbg !51
  store i32 %26, i32* %subeq, align 4, !dbg !51
  %27 = load i32, i32* %subeq, align 4, !dbg !51
  %28 = load i32, i32* %subeq, align 4, !dbg !27
  store i32 %28, i32* %muleq, align 4, !dbg !27
  %29 = load i32, i32* %b, align 4, !dbg !52
  %30 = load i32, i32* %muleq, align 4, !dbg !52
  %31 = mul i32 %30, %29, !dbg !52
  store i32 %31, i32* %muleq, align 4, !dbg !52
  %32 = load i32, i32* %muleq, align 4, !dbg !52
  %33 = load i32, i32* %muleq, align 4, !dbg !25
  store i32 %33, i32* %diveq, align 4, !dbg !25
  %34 = load i32, i32* %b, align 4, !dbg !53
  %35 = load i32, i32* %diveq, align 4, !dbg !53
  %36 = sdiv i32 %35, %34, !dbg !53
  store i32 %36, i32* %diveq, align 4, !dbg !53
  %37 = load i32, i32* %diveq, align 4, !dbg !53
  %38 = load i32, i32* %diveq, align 4, !dbg !23
  store i32 %38, i32* %modeq, align 4, !dbg !23
  %39 = load i32, i32* %b, align 4, !dbg !54
  %40 = load i32, i32* %modeq, align 4, !dbg !54
  %41 = srem i32 %40, %39, !dbg !54
  store i32 %41, i32* %modeq, align 4, !dbg !54
  %42 = load i32, i32* %modeq, align 4, !dbg !54
  %43 = load i32, i32* %sum, align 4, !dbg !55
  %44 = icmp ne i32 %43, 45, !dbg !55
  br i1 %44, label %then, label %if.end, !dbg !55

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !56
  %45 = load i32, i32* %err, align 4, !dbg !56
  br label %if.end, !dbg !56

if.end:                                           ; preds = %entry, %then
  %46 = load i32, i32* %sub, align 4, !dbg !57
  %47 = icmp ne i32 %46, 29, !dbg !57
  br i1 %47, label %then1, label %if.end3, !dbg !57

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !58
  %48 = load i32, i32* %err, align 4, !dbg !58
  br label %if.end3, !dbg !58

if.end3:                                          ; preds = %if.end, %then1
  %49 = load i32, i32* %sub2, align 4, !dbg !59
  %50 = icmp ne i32 %49, -29, !dbg !59
  br i1 %50, label %then4, label %if.end6, !dbg !59

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !60
  %51 = load i32, i32* %err, align 4, !dbg !60
  br label %if.end6, !dbg !60

if.end6:                                          ; preds = %if.end3, %then4
  %52 = load i32, i32* %mul, align 4, !dbg !61
  %53 = icmp ne i32 %52, 296, !dbg !61
  br i1 %53, label %then7, label %if.end9, !dbg !61

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !62
  %54 = load i32, i32* %err, align 4, !dbg !62
  br label %if.end9, !dbg !62

if.end9:                                          ; preds = %if.end6, %then7
  %55 = load i32, i32* %div, align 4, !dbg !63
  %56 = icmp ne i32 %55, 4, !dbg !63
  br i1 %56, label %then10, label %if.end12, !dbg !63

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !64
  %57 = load i32, i32* %err, align 4, !dbg !64
  br label %if.end12, !dbg !64

if.end12:                                         ; preds = %if.end9, %then10
  %58 = load i32, i32* %mod, align 4, !dbg !65
  %59 = icmp ne i32 %58, 5, !dbg !65
  br i1 %59, label %then13, label %if.end15, !dbg !65

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !66
  %60 = load i32, i32* %err, align 4, !dbg !66
  br label %if.end15, !dbg !66

if.end15:                                         ; preds = %if.end12, %then13
  %61 = load i32, i32* %sumeq, align 4, !dbg !67
  %62 = icmp ne i32 %61, 53, !dbg !67
  br i1 %62, label %then16, label %if.end18, !dbg !67

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !68
  %63 = load i32, i32* %err, align 4, !dbg !68
  br label %if.end18, !dbg !68

if.end18:                                         ; preds = %if.end15, %then16
  %64 = load i32, i32* %subeq, align 4, !dbg !69
  %65 = icmp ne i32 %64, 45, !dbg !69
  br i1 %65, label %then19, label %if.end21, !dbg !69

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !70
  %66 = load i32, i32* %err, align 4, !dbg !70
  br label %if.end21, !dbg !70

if.end21:                                         ; preds = %if.end18, %then19
  %67 = load i32, i32* %muleq, align 4, !dbg !71
  %68 = icmp ne i32 %67, 360, !dbg !71
  br i1 %68, label %then22, label %if.end24, !dbg !71

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !72
  %69 = load i32, i32* %err, align 4, !dbg !72
  br label %if.end24, !dbg !72

if.end24:                                         ; preds = %if.end21, %then22
  %70 = load i32, i32* %diveq, align 4, !dbg !73
  %71 = icmp ne i32 %70, 45, !dbg !73
  br i1 %71, label %then25, label %if.end27, !dbg !73

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !74
  %72 = load i32, i32* %err, align 4, !dbg !74
  br label %if.end27, !dbg !74

if.end27:                                         ; preds = %if.end24, %then25
  %73 = load i32, i32* %modeq, align 4, !dbg !75
  %74 = icmp ne i32 %73, 5, !dbg !75
  br i1 %74, label %then28, label %if.end30, !dbg !75

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !76
  %75 = load i32, i32* %err, align 4, !dbg !76
  br label %if.end30, !dbg !76

if.end30:                                         ; preds = %if.end27, %then28
  store i32 10, i32* %ua, align 4, !dbg !21
  store i32 3, i32* %ub, align 4, !dbg !19
  %76 = load i32, i32* %ua, align 4, !dbg !77
  %77 = load i32, i32* %ub, align 4, !dbg !77
  %78 = udiv i32 %76, %77, !dbg !77
  %79 = icmp ne i32 %78, 3, !dbg !77
  br i1 %79, label %then31, label %if.end33, !dbg !77

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !78
  %80 = load i32, i32* %err, align 4, !dbg !78
  br label %if.end33, !dbg !78

if.end33:                                         ; preds = %if.end30, %then31
  %81 = load i32, i32* %ua, align 4, !dbg !79
  %82 = load i32, i32* %ub, align 4, !dbg !79
  %83 = urem i32 %81, %82, !dbg !79
  %84 = icmp ne i32 %83, 1, !dbg !79
  br i1 %84, label %then34, label %if.end36, !dbg !79

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4, !dbg !80
  %85 = load i32, i32* %err, align 4, !dbg !80
  br label %if.end36, !dbg !80

if.end36:                                         ; preds = %if.end33, %then34
  store i32 -8, i32* %negA, align 4, !dbg !17
  store i32 3, i32* %negB, align 4, !dbg !15
  %86 = load i32, i32* %negA, align 4, !dbg !81
  %87 = load i32, i32* %negB, align 4, !dbg !81
  %88 = srem i32 %86, %87, !dbg !81
  %89 = icmp ne i32 %88, -2, !dbg !81
  br i1 %89, label %then37, label %if.end39, !dbg !81

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4, !dbg !82
  %90 = load i32, i32* %err, align 4, !dbg !82
  br label %if.end39, !dbg !82

if.end39:                                         ; preds = %if.end36, %then37
  store i32 -1, i32* %mixedSi, align 4, !dbg !13
  store i32 1, i32* %mixedUi, align 4, !dbg !11
  %91 = load i32, i32* %mixedSi, align 4, !dbg !83
  %92 = load i32, i32* %mixedUi, align 4, !dbg !83
  %93 = add i32 %91, %92, !dbg !83
  %94 = icmp ne i32 %93, 0, !dbg !83
  br i1 %94, label %then40, label %if.end42, !dbg !83

then40:                                           ; preds = %if.end39
  store i32 1, i32* %err, align 4, !dbg !84
  %95 = load i32, i32* %err, align 4, !dbg !84
  br label %if.end42, !dbg !84

if.end42:                                         ; preds = %if.end39, %then40
  %96 = load i32, i32* %err, align 4, !dbg !85
  %97 = icmp eq i32 %96, 0, !dbg !85
  %. = select i1 %97, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @1, i32 0, i32 0), !dbg !86
  %98 = call i32 (i8*, ...) @printf(i8* %.), !dbg !86
  %99 = load i32, i32* %err, align 4, !dbg !87
  ret i32 %99, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "12.arithmetic.c", directory: "../tests")
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "mixedUi", scope: !4, file: !1, line: 48, type: !10)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !DILocation(line: 48, column: 3, scope: !4)
!12 = !DILocalVariable(name: "mixedSi", scope: !4, file: !1, line: 47, type: !7)
!13 = !DILocation(line: 47, column: 3, scope: !4)
!14 = !DILocalVariable(name: "negB", scope: !4, file: !1, line: 44, type: !7)
!15 = !DILocation(line: 44, column: 3, scope: !4)
!16 = !DILocalVariable(name: "negA", scope: !4, file: !1, line: 43, type: !7)
!17 = !DILocation(line: 43, column: 3, scope: !4)
!18 = !DILocalVariable(name: "ub", scope: !4, file: !1, line: 39, type: !10)
!19 = !DILocation(line: 39, column: 3, scope: !4)
!20 = !DILocalVariable(name: "ua", scope: !4, file: !1, line: 38, type: !10)
!21 = !DILocation(line: 38, column: 3, scope: !4)
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
!64 = !DILocation(line: 30, column: 17, scope: !4)
!65 = !DILocation(line: 31, column: 3, scope: !4)
!66 = !DILocation(line: 31, column: 17, scope: !4)
!67 = !DILocation(line: 32, column: 3, scope: !4)
!68 = !DILocation(line: 32, column: 20, scope: !4)
!69 = !DILocation(line: 33, column: 3, scope: !4)
!70 = !DILocation(line: 33, column: 20, scope: !4)
!71 = !DILocation(line: 34, column: 3, scope: !4)
!72 = !DILocation(line: 34, column: 21, scope: !4)
!73 = !DILocation(line: 35, column: 3, scope: !4)
!74 = !DILocation(line: 35, column: 20, scope: !4)
!75 = !DILocation(line: 36, column: 3, scope: !4)
!76 = !DILocation(line: 36, column: 19, scope: !4)
!77 = !DILocation(line: 40, column: 3, scope: !4)
!78 = !DILocation(line: 40, column: 21, scope: !4)
!79 = !DILocation(line: 41, column: 3, scope: !4)
!80 = !DILocation(line: 41, column: 21, scope: !4)
!81 = !DILocation(line: 45, column: 3, scope: !4)
!82 = !DILocation(line: 45, column: 26, scope: !4)
!83 = !DILocation(line: 49, column: 3, scope: !4)
!84 = !DILocation(line: 49, column: 31, scope: !4)
!85 = !DILocation(line: 51, column: 3, scope: !4)
!86 = !DILocation(line: 0, scope: !4)
!87 = !DILocation(line: 56, column: 3, scope: !4)
