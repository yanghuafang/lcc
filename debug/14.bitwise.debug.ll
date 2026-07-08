; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [19 x i8] c"14.bitwise.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"14.bitwise.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !4 {
entry:
  %const37 = bitcast i32 -2023406815 to i32
  %const = bitcast i32 35930656 to i32
  %signedVal = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %signedVal, metadata !9, metadata !DIExpression()), !dbg !10
  %msbSet = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %msbSet, metadata !11, metadata !DIExpression()), !dbg !13
  %rightShiftVal = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %rightShiftVal, metadata !14, metadata !DIExpression()), !dbg !15
  %leftShiftVal = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %leftShiftVal, metadata !16, metadata !DIExpression()), !dbg !17
  %xoreqVal = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %xoreqVal, metadata !18, metadata !DIExpression()), !dbg !19
  %oreqVal = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %oreqVal, metadata !20, metadata !DIExpression()), !dbg !21
  %andeqVal = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %andeqVal, metadata !22, metadata !DIExpression()), !dbg !23
  %notVal2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %notVal2, metadata !24, metadata !DIExpression()), !dbg !25
  %notVal1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %notVal1, metadata !26, metadata !DIExpression()), !dbg !27
  %xorVal = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %xorVal, metadata !28, metadata !DIExpression()), !dbg !29
  %orVal = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %orVal, metadata !30, metadata !DIExpression()), !dbg !31
  %andVal = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %andVal, metadata !32, metadata !DIExpression()), !dbg !33
  %b = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %b, metadata !34, metadata !DIExpression()), !dbg !35
  %a = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !36, metadata !DIExpression()), !dbg !37
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !38, metadata !DIExpression()), !dbg !39
  store i32 0, i32* %err, align 4, !dbg !39
  store i32 305419896, i32* %a, align 4, !dbg !37
  store i32 %const37, i32* %b, align 4, !dbg !35
  %0 = load i32, i32* %a, align 4, !dbg !33
  %1 = load i32, i32* %b, align 4, !dbg !33
  %2 = and i32 %0, %1, !dbg !33
  store i32 %2, i32* %andVal, align 4, !dbg !33
  %3 = load i32, i32* %a, align 4, !dbg !31
  %4 = load i32, i32* %b, align 4, !dbg !31
  %5 = or i32 %3, %4, !dbg !31
  store i32 %5, i32* %orVal, align 4, !dbg !31
  %6 = load i32, i32* %a, align 4, !dbg !29
  %7 = load i32, i32* %b, align 4, !dbg !29
  %8 = xor i32 %6, %7, !dbg !29
  store i32 %8, i32* %xorVal, align 4, !dbg !29
  %9 = load i32, i32* %a, align 4, !dbg !27
  %10 = xor i32 %9, -1, !dbg !27
  store i32 %10, i32* %notVal1, align 4, !dbg !27
  %11 = load i32, i32* %b, align 4, !dbg !25
  %12 = xor i32 %11, -1, !dbg !25
  store i32 %12, i32* %notVal2, align 4, !dbg !25
  %13 = load i32, i32* %andVal, align 4, !dbg !23
  store i32 %13, i32* %andeqVal, align 4, !dbg !23
  %14 = load i32, i32* %a, align 4, !dbg !40
  %15 = load i32, i32* %andeqVal, align 4, !dbg !40
  %16 = and i32 %15, %14, !dbg !40
  store i32 %16, i32* %andeqVal, align 4, !dbg !40
  %17 = load i32, i32* %andeqVal, align 4, !dbg !40
  %18 = load i32, i32* %orVal, align 4, !dbg !21
  store i32 %18, i32* %oreqVal, align 4, !dbg !21
  %19 = load i32, i32* %a, align 4, !dbg !41
  %20 = load i32, i32* %oreqVal, align 4, !dbg !41
  %21 = or i32 %20, %19, !dbg !41
  store i32 %21, i32* %oreqVal, align 4, !dbg !41
  %22 = load i32, i32* %oreqVal, align 4, !dbg !41
  %23 = load i32, i32* %xorVal, align 4, !dbg !19
  store i32 %23, i32* %xoreqVal, align 4, !dbg !19
  %24 = load i32, i32* %a, align 4, !dbg !42
  %25 = load i32, i32* %xoreqVal, align 4, !dbg !42
  %26 = xor i32 %25, %24, !dbg !42
  store i32 %26, i32* %xoreqVal, align 4, !dbg !42
  %27 = load i32, i32* %xoreqVal, align 4, !dbg !42
  %28 = load i32, i32* %a, align 4, !dbg !17
  %29 = shl i32 %28, 8, !dbg !17
  store i32 %29, i32* %leftShiftVal, align 4, !dbg !17
  %30 = load i32, i32* %b, align 4, !dbg !15
  %31 = lshr i32 %30, 8, !dbg !15
  store i32 %31, i32* %rightShiftVal, align 4, !dbg !15
  %32 = load i32, i32* %leftShiftVal, align 4, !dbg !43
  %33 = shl i32 %32, 8, !dbg !43
  store i32 %33, i32* %leftShiftVal, align 4, !dbg !43
  %34 = load i32, i32* %leftShiftVal, align 4, !dbg !43
  %35 = load i32, i32* %rightShiftVal, align 4, !dbg !44
  %36 = lshr i32 %35, 8, !dbg !44
  store i32 %36, i32* %rightShiftVal, align 4, !dbg !44
  %37 = load i32, i32* %rightShiftVal, align 4, !dbg !44
  %38 = load i32, i32* %andVal, align 4, !dbg !45
  %39 = icmp ne i32 %38, %const, !dbg !45
  br i1 %39, label %then, label %if.end, !dbg !45

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !46
  %40 = load i32, i32* %err, align 4, !dbg !46
  br label %if.end, !dbg !46

if.end:                                           ; preds = %entry, %then
  %const38 = bitcast i32 -1753917575 to i32, !dbg !47
  %41 = load i32, i32* %orVal, align 4, !dbg !48
  %42 = icmp ne i32 %41, %const38, !dbg !48
  br i1 %42, label %then1, label %if.end3, !dbg !48

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !49
  %43 = load i32, i32* %err, align 4, !dbg !49
  br label %if.end3, !dbg !49

if.end3:                                          ; preds = %if.end, %then1
  %44 = load i32, i32* %xorVal, align 4, !dbg !50
  %45 = icmp ne i32 %44, -1789848231, !dbg !50
  br i1 %45, label %then4, label %if.end6, !dbg !50

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !51
  %46 = load i32, i32* %err, align 4, !dbg !51
  br label %if.end6, !dbg !51

if.end6:                                          ; preds = %if.end3, %then4
  %47 = load i32, i32* %notVal1, align 4, !dbg !52
  %48 = icmp ne i32 %47, -305419897, !dbg !52
  br i1 %48, label %then7, label %if.end9, !dbg !52

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !53
  %49 = load i32, i32* %err, align 4, !dbg !53
  br label %if.end9, !dbg !53

if.end9:                                          ; preds = %if.end6, %then7
  %50 = load i32, i32* %notVal2, align 4, !dbg !54
  %51 = icmp ne i32 %50, 2023406814, !dbg !54
  br i1 %51, label %then10, label %if.end12, !dbg !54

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !55
  %52 = load i32, i32* %err, align 4, !dbg !55
  br label %if.end12, !dbg !55

if.end12:                                         ; preds = %if.end9, %then10
  %53 = load i32, i32* %andeqVal, align 4, !dbg !56
  %54 = icmp ne i32 %53, %const, !dbg !56
  br i1 %54, label %then13, label %if.end15, !dbg !56

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !57
  %55 = load i32, i32* %err, align 4, !dbg !57
  br label %if.end15, !dbg !57

if.end15:                                         ; preds = %if.end12, %then13
  %56 = load i32, i32* %oreqVal, align 4, !dbg !58
  %57 = icmp ne i32 %56, %const38, !dbg !58
  br i1 %57, label %then16, label %if.end18, !dbg !58

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !59
  %58 = load i32, i32* %err, align 4, !dbg !59
  br label %if.end18, !dbg !59

if.end18:                                         ; preds = %if.end15, %then16
  %59 = load i32, i32* %xoreqVal, align 4, !dbg !60
  %60 = icmp ne i32 %59, %const37, !dbg !60
  br i1 %60, label %then19, label %if.end21, !dbg !60

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !61
  %61 = load i32, i32* %err, align 4, !dbg !61
  br label %if.end21, !dbg !61

if.end21:                                         ; preds = %if.end18, %then19
  %62 = load i32, i32* %leftShiftVal, align 4, !dbg !62
  %63 = icmp ne i32 %62, 1450704896, !dbg !62
  br i1 %63, label %then22, label %if.end24, !dbg !62

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !63
  %64 = load i32, i32* %err, align 4, !dbg !63
  br label %if.end24, !dbg !63

if.end24:                                         ; preds = %if.end21, %then22
  %65 = load i32, i32* %rightShiftVal, align 4, !dbg !64
  %66 = icmp ne i32 %65, 34661, !dbg !64
  br i1 %66, label %then25, label %if.end27, !dbg !64

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !65
  %67 = load i32, i32* %err, align 4, !dbg !65
  br label %if.end27, !dbg !65

if.end27:                                         ; preds = %if.end24, %then25
  store i32 -2147483648, i32* %msbSet, align 4, !dbg !13
  %68 = load i32, i32* %msbSet, align 4, !dbg !66
  %69 = lshr i32 %68, 1, !dbg !66
  %70 = icmp ne i32 %69, 1073741824, !dbg !66
  br i1 %70, label %then28, label %if.end30, !dbg !66

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !67
  %71 = load i32, i32* %err, align 4, !dbg !67
  br label %if.end30, !dbg !67

if.end30:                                         ; preds = %if.end27, %then28
  store i32 -8, i32* %signedVal, align 4, !dbg !10
  %72 = load i32, i32* %signedVal, align 4, !dbg !68
  %73 = ashr i32 %72, 1, !dbg !68
  %74 = icmp ne i32 %73, -4, !dbg !68
  br i1 %74, label %then31, label %if.end33, !dbg !68

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !69
  %75 = load i32, i32* %err, align 4, !dbg !69
  br label %if.end33, !dbg !69

if.end33:                                         ; preds = %if.end30, %then31
  %76 = load i32, i32* %err, align 4, !dbg !70
  %77 = icmp eq i32 %76, 0, !dbg !70
  %. = select i1 %77, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @1, i32 0, i32 0), !dbg !47
  %78 = call i32 (i8*, ...) @printf(i8* %.), !dbg !47
  %79 = load i32, i32* %err, align 4, !dbg !71
  ret i32 %79, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "14.bitwise.c", directory: "../tests")
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "signedVal", scope: !4, file: !1, line: 40, type: !7)
!10 = !DILocation(line: 40, column: 3, scope: !4)
!11 = !DILocalVariable(name: "msbSet", scope: !4, file: !1, line: 37, type: !12)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !DILocation(line: 37, column: 3, scope: !4)
!14 = !DILocalVariable(name: "rightShiftVal", scope: !4, file: !1, line: 22, type: !12)
!15 = !DILocation(line: 22, column: 3, scope: !4)
!16 = !DILocalVariable(name: "leftShiftVal", scope: !4, file: !1, line: 21, type: !12)
!17 = !DILocation(line: 21, column: 3, scope: !4)
!18 = !DILocalVariable(name: "xoreqVal", scope: !4, file: !1, line: 18, type: !12)
!19 = !DILocation(line: 18, column: 3, scope: !4)
!20 = !DILocalVariable(name: "oreqVal", scope: !4, file: !1, line: 16, type: !12)
!21 = !DILocation(line: 16, column: 3, scope: !4)
!22 = !DILocalVariable(name: "andeqVal", scope: !4, file: !1, line: 14, type: !12)
!23 = !DILocation(line: 14, column: 3, scope: !4)
!24 = !DILocalVariable(name: "notVal2", scope: !4, file: !1, line: 12, type: !12)
!25 = !DILocation(line: 12, column: 3, scope: !4)
!26 = !DILocalVariable(name: "notVal1", scope: !4, file: !1, line: 11, type: !12)
!27 = !DILocation(line: 11, column: 3, scope: !4)
!28 = !DILocalVariable(name: "xorVal", scope: !4, file: !1, line: 10, type: !12)
!29 = !DILocation(line: 10, column: 3, scope: !4)
!30 = !DILocalVariable(name: "orVal", scope: !4, file: !1, line: 9, type: !12)
!31 = !DILocation(line: 9, column: 3, scope: !4)
!32 = !DILocalVariable(name: "andVal", scope: !4, file: !1, line: 8, type: !12)
!33 = !DILocation(line: 8, column: 3, scope: !4)
!34 = !DILocalVariable(name: "b", scope: !4, file: !1, line: 6, type: !12)
!35 = !DILocation(line: 6, column: 3, scope: !4)
!36 = !DILocalVariable(name: "a", scope: !4, file: !1, line: 5, type: !12)
!37 = !DILocation(line: 5, column: 3, scope: !4)
!38 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 4, type: !7)
!39 = !DILocation(line: 4, column: 3, scope: !4)
!40 = !DILocation(line: 15, column: 3, scope: !4)
!41 = !DILocation(line: 17, column: 3, scope: !4)
!42 = !DILocation(line: 19, column: 3, scope: !4)
!43 = !DILocation(line: 23, column: 3, scope: !4)
!44 = !DILocation(line: 24, column: 3, scope: !4)
!45 = !DILocation(line: 26, column: 3, scope: !4)
!46 = !DILocation(line: 26, column: 29, scope: !4)
!47 = !DILocation(line: 0, scope: !4)
!48 = !DILocation(line: 27, column: 3, scope: !4)
!49 = !DILocation(line: 27, column: 28, scope: !4)
!50 = !DILocation(line: 28, column: 3, scope: !4)
!51 = !DILocation(line: 28, column: 29, scope: !4)
!52 = !DILocation(line: 29, column: 3, scope: !4)
!53 = !DILocation(line: 29, column: 30, scope: !4)
!54 = !DILocation(line: 30, column: 3, scope: !4)
!55 = !DILocation(line: 30, column: 30, scope: !4)
!56 = !DILocation(line: 31, column: 3, scope: !4)
!57 = !DILocation(line: 31, column: 31, scope: !4)
!58 = !DILocation(line: 32, column: 3, scope: !4)
!59 = !DILocation(line: 32, column: 30, scope: !4)
!60 = !DILocation(line: 33, column: 3, scope: !4)
!61 = !DILocation(line: 33, column: 31, scope: !4)
!62 = !DILocation(line: 34, column: 3, scope: !4)
!63 = !DILocation(line: 34, column: 35, scope: !4)
!64 = !DILocation(line: 35, column: 3, scope: !4)
!65 = !DILocation(line: 35, column: 32, scope: !4)
!66 = !DILocation(line: 38, column: 3, scope: !4)
!67 = !DILocation(line: 38, column: 36, scope: !4)
!68 = !DILocation(line: 41, column: 3, scope: !4)
!69 = !DILocation(line: 41, column: 31, scope: !4)
!70 = !DILocation(line: 43, column: 3, scope: !4)
!71 = !DILocation(line: 48, column: 3, scope: !4)
