; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [19 x i8] c"14.bitwise.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"14.bitwise.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %const37 = bitcast i32 -2023406815 to i32
  %const = bitcast i32 35930656 to i32
  %signedVal = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %signedVal, metadata !7, metadata !DIExpression()), !dbg !8
  %msbSet = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %msbSet, metadata !9, metadata !DIExpression()), !dbg !11
  %rightShiftVal = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %rightShiftVal, metadata !12, metadata !DIExpression()), !dbg !13
  %leftShiftVal = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %leftShiftVal, metadata !14, metadata !DIExpression()), !dbg !15
  %xoreqVal = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %xoreqVal, metadata !16, metadata !DIExpression()), !dbg !17
  %oreqVal = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %oreqVal, metadata !18, metadata !DIExpression()), !dbg !19
  %andeqVal = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %andeqVal, metadata !20, metadata !DIExpression()), !dbg !21
  %notVal2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %notVal2, metadata !22, metadata !DIExpression()), !dbg !23
  %notVal1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %notVal1, metadata !24, metadata !DIExpression()), !dbg !25
  %xorVal = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %xorVal, metadata !26, metadata !DIExpression()), !dbg !27
  %orVal = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %orVal, metadata !28, metadata !DIExpression()), !dbg !29
  %andVal = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %andVal, metadata !30, metadata !DIExpression()), !dbg !31
  %b = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %b, metadata !32, metadata !DIExpression()), !dbg !33
  %a = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !34, metadata !DIExpression()), !dbg !35
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !36, metadata !DIExpression()), !dbg !37
  store i32 0, i32* %err, align 4, !dbg !37
  store i32 305419896, i32* %a, align 4, !dbg !35
  store i32 %const37, i32* %b, align 4, !dbg !33
  %0 = load i32, i32* %a, align 4, !dbg !31
  %1 = load i32, i32* %b, align 4, !dbg !31
  %2 = and i32 %0, %1, !dbg !31
  store i32 %2, i32* %andVal, align 4, !dbg !31
  %3 = load i32, i32* %a, align 4, !dbg !29
  %4 = load i32, i32* %b, align 4, !dbg !29
  %5 = or i32 %3, %4, !dbg !29
  store i32 %5, i32* %orVal, align 4, !dbg !29
  %6 = load i32, i32* %a, align 4, !dbg !27
  %7 = load i32, i32* %b, align 4, !dbg !27
  %8 = xor i32 %6, %7, !dbg !27
  store i32 %8, i32* %xorVal, align 4, !dbg !27
  %9 = load i32, i32* %a, align 4, !dbg !25
  %10 = xor i32 %9, -1, !dbg !25
  store i32 %10, i32* %notVal1, align 4, !dbg !25
  %11 = load i32, i32* %b, align 4, !dbg !23
  %12 = xor i32 %11, -1, !dbg !23
  store i32 %12, i32* %notVal2, align 4, !dbg !23
  %13 = load i32, i32* %andVal, align 4, !dbg !21
  store i32 %13, i32* %andeqVal, align 4, !dbg !21
  %14 = load i32, i32* %a, align 4, !dbg !38
  %15 = load i32, i32* %andeqVal, align 4, !dbg !38
  %16 = and i32 %15, %14, !dbg !38
  store i32 %16, i32* %andeqVal, align 4, !dbg !38
  %17 = load i32, i32* %andeqVal, align 4, !dbg !38
  %18 = load i32, i32* %orVal, align 4, !dbg !19
  store i32 %18, i32* %oreqVal, align 4, !dbg !19
  %19 = load i32, i32* %a, align 4, !dbg !39
  %20 = load i32, i32* %oreqVal, align 4, !dbg !39
  %21 = or i32 %20, %19, !dbg !39
  store i32 %21, i32* %oreqVal, align 4, !dbg !39
  %22 = load i32, i32* %oreqVal, align 4, !dbg !39
  %23 = load i32, i32* %xorVal, align 4, !dbg !17
  store i32 %23, i32* %xoreqVal, align 4, !dbg !17
  %24 = load i32, i32* %a, align 4, !dbg !40
  %25 = load i32, i32* %xoreqVal, align 4, !dbg !40
  %26 = xor i32 %25, %24, !dbg !40
  store i32 %26, i32* %xoreqVal, align 4, !dbg !40
  %27 = load i32, i32* %xoreqVal, align 4, !dbg !40
  %28 = load i32, i32* %a, align 4, !dbg !15
  %29 = shl i32 %28, 8, !dbg !15
  store i32 %29, i32* %leftShiftVal, align 4, !dbg !15
  %30 = load i32, i32* %b, align 4, !dbg !13
  %31 = lshr i32 %30, 8, !dbg !13
  store i32 %31, i32* %rightShiftVal, align 4, !dbg !13
  %32 = load i32, i32* %leftShiftVal, align 4, !dbg !41
  %33 = shl i32 %32, 8, !dbg !41
  store i32 %33, i32* %leftShiftVal, align 4, !dbg !41
  %34 = load i32, i32* %leftShiftVal, align 4, !dbg !41
  %35 = load i32, i32* %rightShiftVal, align 4, !dbg !42
  %36 = lshr i32 %35, 8, !dbg !42
  store i32 %36, i32* %rightShiftVal, align 4, !dbg !42
  %37 = load i32, i32* %rightShiftVal, align 4, !dbg !42
  %38 = load i32, i32* %andVal, align 4, !dbg !43
  %39 = icmp ne i32 %38, %const, !dbg !43
  br i1 %39, label %then, label %if.end, !dbg !43

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !44
  %40 = load i32, i32* %err, align 4, !dbg !44
  br label %if.end, !dbg !44

if.end:                                           ; preds = %entry, %then
  %const38 = bitcast i32 -1753917575 to i32, !dbg !45
  %41 = load i32, i32* %orVal, align 4, !dbg !46
  %42 = icmp ne i32 %41, %const38, !dbg !46
  br i1 %42, label %then1, label %if.end3, !dbg !46

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !47
  %43 = load i32, i32* %err, align 4, !dbg !47
  br label %if.end3, !dbg !47

if.end3:                                          ; preds = %if.end, %then1
  %44 = load i32, i32* %xorVal, align 4, !dbg !48
  %45 = icmp ne i32 %44, -1789848231, !dbg !48
  br i1 %45, label %then4, label %if.end6, !dbg !48

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !49
  %46 = load i32, i32* %err, align 4, !dbg !49
  br label %if.end6, !dbg !49

if.end6:                                          ; preds = %if.end3, %then4
  %47 = load i32, i32* %notVal1, align 4, !dbg !50
  %48 = icmp ne i32 %47, -305419897, !dbg !50
  br i1 %48, label %then7, label %if.end9, !dbg !50

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !51
  %49 = load i32, i32* %err, align 4, !dbg !51
  br label %if.end9, !dbg !51

if.end9:                                          ; preds = %if.end6, %then7
  %50 = load i32, i32* %notVal2, align 4, !dbg !52
  %51 = icmp ne i32 %50, 2023406814, !dbg !52
  br i1 %51, label %then10, label %if.end12, !dbg !52

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !53
  %52 = load i32, i32* %err, align 4, !dbg !53
  br label %if.end12, !dbg !53

if.end12:                                         ; preds = %if.end9, %then10
  %53 = load i32, i32* %andeqVal, align 4, !dbg !54
  %54 = icmp ne i32 %53, %const, !dbg !54
  br i1 %54, label %then13, label %if.end15, !dbg !54

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !55
  %55 = load i32, i32* %err, align 4, !dbg !55
  br label %if.end15, !dbg !55

if.end15:                                         ; preds = %if.end12, %then13
  %56 = load i32, i32* %oreqVal, align 4, !dbg !56
  %57 = icmp ne i32 %56, %const38, !dbg !56
  br i1 %57, label %then16, label %if.end18, !dbg !56

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !57
  %58 = load i32, i32* %err, align 4, !dbg !57
  br label %if.end18, !dbg !57

if.end18:                                         ; preds = %if.end15, %then16
  %59 = load i32, i32* %xoreqVal, align 4, !dbg !58
  %60 = icmp ne i32 %59, %const37, !dbg !58
  br i1 %60, label %then19, label %if.end21, !dbg !58

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !59
  %61 = load i32, i32* %err, align 4, !dbg !59
  br label %if.end21, !dbg !59

if.end21:                                         ; preds = %if.end18, %then19
  %62 = load i32, i32* %leftShiftVal, align 4, !dbg !60
  %63 = icmp ne i32 %62, 1450704896, !dbg !60
  br i1 %63, label %then22, label %if.end24, !dbg !60

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !61
  %64 = load i32, i32* %err, align 4, !dbg !61
  br label %if.end24, !dbg !61

if.end24:                                         ; preds = %if.end21, %then22
  %65 = load i32, i32* %rightShiftVal, align 4, !dbg !62
  %66 = icmp ne i32 %65, 34661, !dbg !62
  br i1 %66, label %then25, label %if.end27, !dbg !62

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !63
  %67 = load i32, i32* %err, align 4, !dbg !63
  br label %if.end27, !dbg !63

if.end27:                                         ; preds = %if.end24, %then25
  store i32 -2147483648, i32* %msbSet, align 4, !dbg !11
  %68 = load i32, i32* %msbSet, align 4, !dbg !64
  %69 = lshr i32 %68, 1, !dbg !64
  %70 = icmp ne i32 %69, 1073741824, !dbg !64
  br i1 %70, label %then28, label %if.end30, !dbg !64

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !65
  %71 = load i32, i32* %err, align 4, !dbg !65
  br label %if.end30, !dbg !65

if.end30:                                         ; preds = %if.end27, %then28
  store i32 -8, i32* %signedVal, align 4, !dbg !8
  %72 = load i32, i32* %signedVal, align 4, !dbg !66
  %73 = ashr i32 %72, 1, !dbg !66
  %74 = icmp ne i32 %73, -4, !dbg !66
  br i1 %74, label %then31, label %if.end33, !dbg !66

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !67
  %75 = load i32, i32* %err, align 4, !dbg !67
  br label %if.end33, !dbg !67

if.end33:                                         ; preds = %if.end30, %then31
  %76 = load i32, i32* %err, align 4, !dbg !68
  %77 = icmp eq i32 %76, 0, !dbg !68
  %. = select i1 %77, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @1, i32 0, i32 0), !dbg !45
  %78 = call i32 (i8*, ...) @printf(i8* %.), !dbg !45
  %79 = load i32, i32* %err, align 4, !dbg !69
  ret i32 %79, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "14.bitwise.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "signedVal", scope: !2, file: !1, line: 40, type: !5)
!8 = !DILocation(line: 40, column: 3, scope: !2)
!9 = !DILocalVariable(name: "msbSet", scope: !2, file: !1, line: 37, type: !10)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !DILocation(line: 37, column: 3, scope: !2)
!12 = !DILocalVariable(name: "rightShiftVal", scope: !2, file: !1, line: 22, type: !10)
!13 = !DILocation(line: 22, column: 3, scope: !2)
!14 = !DILocalVariable(name: "leftShiftVal", scope: !2, file: !1, line: 21, type: !10)
!15 = !DILocation(line: 21, column: 3, scope: !2)
!16 = !DILocalVariable(name: "xoreqVal", scope: !2, file: !1, line: 18, type: !10)
!17 = !DILocation(line: 18, column: 3, scope: !2)
!18 = !DILocalVariable(name: "oreqVal", scope: !2, file: !1, line: 16, type: !10)
!19 = !DILocation(line: 16, column: 3, scope: !2)
!20 = !DILocalVariable(name: "andeqVal", scope: !2, file: !1, line: 14, type: !10)
!21 = !DILocation(line: 14, column: 3, scope: !2)
!22 = !DILocalVariable(name: "notVal2", scope: !2, file: !1, line: 12, type: !10)
!23 = !DILocation(line: 12, column: 3, scope: !2)
!24 = !DILocalVariable(name: "notVal1", scope: !2, file: !1, line: 11, type: !10)
!25 = !DILocation(line: 11, column: 3, scope: !2)
!26 = !DILocalVariable(name: "xorVal", scope: !2, file: !1, line: 10, type: !10)
!27 = !DILocation(line: 10, column: 3, scope: !2)
!28 = !DILocalVariable(name: "orVal", scope: !2, file: !1, line: 9, type: !10)
!29 = !DILocation(line: 9, column: 3, scope: !2)
!30 = !DILocalVariable(name: "andVal", scope: !2, file: !1, line: 8, type: !10)
!31 = !DILocation(line: 8, column: 3, scope: !2)
!32 = !DILocalVariable(name: "b", scope: !2, file: !1, line: 6, type: !10)
!33 = !DILocation(line: 6, column: 3, scope: !2)
!34 = !DILocalVariable(name: "a", scope: !2, file: !1, line: 5, type: !10)
!35 = !DILocation(line: 5, column: 3, scope: !2)
!36 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 4, type: !5)
!37 = !DILocation(line: 4, column: 3, scope: !2)
!38 = !DILocation(line: 15, column: 3, scope: !2)
!39 = !DILocation(line: 17, column: 3, scope: !2)
!40 = !DILocation(line: 19, column: 3, scope: !2)
!41 = !DILocation(line: 23, column: 3, scope: !2)
!42 = !DILocation(line: 24, column: 3, scope: !2)
!43 = !DILocation(line: 26, column: 3, scope: !2)
!44 = !DILocation(line: 26, column: 29, scope: !2)
!45 = !DILocation(line: 0, scope: !2)
!46 = !DILocation(line: 27, column: 3, scope: !2)
!47 = !DILocation(line: 27, column: 28, scope: !2)
!48 = !DILocation(line: 28, column: 3, scope: !2)
!49 = !DILocation(line: 28, column: 29, scope: !2)
!50 = !DILocation(line: 29, column: 3, scope: !2)
!51 = !DILocation(line: 29, column: 30, scope: !2)
!52 = !DILocation(line: 30, column: 3, scope: !2)
!53 = !DILocation(line: 30, column: 30, scope: !2)
!54 = !DILocation(line: 31, column: 3, scope: !2)
!55 = !DILocation(line: 31, column: 31, scope: !2)
!56 = !DILocation(line: 32, column: 3, scope: !2)
!57 = !DILocation(line: 32, column: 30, scope: !2)
!58 = !DILocation(line: 33, column: 3, scope: !2)
!59 = !DILocation(line: 33, column: 31, scope: !2)
!60 = !DILocation(line: 34, column: 3, scope: !2)
!61 = !DILocation(line: 34, column: 35, scope: !2)
!62 = !DILocation(line: 35, column: 3, scope: !2)
!63 = !DILocation(line: 35, column: 32, scope: !2)
!64 = !DILocation(line: 38, column: 3, scope: !2)
!65 = !DILocation(line: 38, column: 36, scope: !2)
!66 = !DILocation(line: 41, column: 3, scope: !2)
!67 = !DILocation(line: 41, column: 31, scope: !2)
!68 = !DILocation(line: 43, column: 3, scope: !2)
!69 = !DILocation(line: 48, column: 3, scope: !2)
