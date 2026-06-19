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
  %msbSet = alloca i32, align 4
  %rightShiftVal = alloca i32, align 4
  %leftShiftVal = alloca i32, align 4
  %xoreqVal = alloca i32, align 4
  %oreqVal = alloca i32, align 4
  %andeqVal = alloca i32, align 4
  %notVal2 = alloca i32, align 4
  %notVal1 = alloca i32, align 4
  %xorVal = alloca i32, align 4
  %orVal = alloca i32, align 4
  %andVal = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  store i32 305419896, i32* %a, align 4, !dbg !8
  store i32 %const37, i32* %b, align 4, !dbg !9
  %0 = load i32, i32* %a, align 4, !dbg !10
  %1 = load i32, i32* %b, align 4, !dbg !10
  %2 = and i32 %0, %1, !dbg !10
  store i32 %2, i32* %andVal, align 4, !dbg !10
  %3 = load i32, i32* %a, align 4, !dbg !11
  %4 = load i32, i32* %b, align 4, !dbg !11
  %5 = or i32 %3, %4, !dbg !11
  store i32 %5, i32* %orVal, align 4, !dbg !11
  %6 = load i32, i32* %a, align 4, !dbg !12
  %7 = load i32, i32* %b, align 4, !dbg !12
  %8 = xor i32 %6, %7, !dbg !12
  store i32 %8, i32* %xorVal, align 4, !dbg !12
  %9 = load i32, i32* %a, align 4, !dbg !13
  %10 = xor i32 %9, -1, !dbg !13
  store i32 %10, i32* %notVal1, align 4, !dbg !13
  %11 = load i32, i32* %b, align 4, !dbg !14
  %12 = xor i32 %11, -1, !dbg !14
  store i32 %12, i32* %notVal2, align 4, !dbg !14
  %13 = load i32, i32* %andVal, align 4, !dbg !15
  store i32 %13, i32* %andeqVal, align 4, !dbg !15
  %14 = load i32, i32* %a, align 4, !dbg !16
  %15 = load i32, i32* %andeqVal, align 4, !dbg !16
  %16 = and i32 %15, %14, !dbg !16
  store i32 %16, i32* %andeqVal, align 4, !dbg !16
  %17 = load i32, i32* %andeqVal, align 4, !dbg !16
  %18 = load i32, i32* %orVal, align 4, !dbg !17
  store i32 %18, i32* %oreqVal, align 4, !dbg !17
  %19 = load i32, i32* %a, align 4, !dbg !18
  %20 = load i32, i32* %oreqVal, align 4, !dbg !18
  %21 = or i32 %20, %19, !dbg !18
  store i32 %21, i32* %oreqVal, align 4, !dbg !18
  %22 = load i32, i32* %oreqVal, align 4, !dbg !18
  %23 = load i32, i32* %xorVal, align 4, !dbg !19
  store i32 %23, i32* %xoreqVal, align 4, !dbg !19
  %24 = load i32, i32* %a, align 4, !dbg !20
  %25 = load i32, i32* %xoreqVal, align 4, !dbg !20
  %26 = xor i32 %25, %24, !dbg !20
  store i32 %26, i32* %xoreqVal, align 4, !dbg !20
  %27 = load i32, i32* %xoreqVal, align 4, !dbg !20
  %28 = load i32, i32* %a, align 4, !dbg !21
  %29 = shl i32 %28, 8, !dbg !21
  store i32 %29, i32* %leftShiftVal, align 4, !dbg !21
  %30 = load i32, i32* %b, align 4, !dbg !22
  %31 = lshr i32 %30, 8, !dbg !22
  store i32 %31, i32* %rightShiftVal, align 4, !dbg !22
  %32 = load i32, i32* %leftShiftVal, align 4, !dbg !23
  %33 = shl i32 %32, 8, !dbg !23
  store i32 %33, i32* %leftShiftVal, align 4, !dbg !23
  %34 = load i32, i32* %leftShiftVal, align 4, !dbg !23
  %35 = load i32, i32* %rightShiftVal, align 4, !dbg !24
  %36 = lshr i32 %35, 8, !dbg !24
  store i32 %36, i32* %rightShiftVal, align 4, !dbg !24
  %37 = load i32, i32* %rightShiftVal, align 4, !dbg !24
  %38 = load i32, i32* %andVal, align 4, !dbg !25
  %39 = icmp ne i32 %38, %const, !dbg !25
  br i1 %39, label %then, label %if.end, !dbg !25

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !26
  %40 = load i32, i32* %err, align 4, !dbg !26
  br label %if.end, !dbg !26

if.end:                                           ; preds = %entry, %then
  %const38 = bitcast i32 -1753917575 to i32, !dbg !27
  %41 = load i32, i32* %orVal, align 4, !dbg !28
  %42 = icmp ne i32 %41, %const38, !dbg !28
  br i1 %42, label %then1, label %if.end3, !dbg !28

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !29
  %43 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end3, !dbg !29

if.end3:                                          ; preds = %if.end, %then1
  %44 = load i32, i32* %xorVal, align 4, !dbg !30
  %45 = icmp ne i32 %44, -1789848231, !dbg !30
  br i1 %45, label %then4, label %if.end6, !dbg !30

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !31
  %46 = load i32, i32* %err, align 4, !dbg !31
  br label %if.end6, !dbg !31

if.end6:                                          ; preds = %if.end3, %then4
  %47 = load i32, i32* %notVal1, align 4, !dbg !32
  %48 = icmp ne i32 %47, -305419897, !dbg !32
  br i1 %48, label %then7, label %if.end9, !dbg !32

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !33
  %49 = load i32, i32* %err, align 4, !dbg !33
  br label %if.end9, !dbg !33

if.end9:                                          ; preds = %if.end6, %then7
  %50 = load i32, i32* %notVal2, align 4, !dbg !34
  %51 = icmp ne i32 %50, 2023406814, !dbg !34
  br i1 %51, label %then10, label %if.end12, !dbg !34

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !35
  %52 = load i32, i32* %err, align 4, !dbg !35
  br label %if.end12, !dbg !35

if.end12:                                         ; preds = %if.end9, %then10
  %53 = load i32, i32* %andeqVal, align 4, !dbg !36
  %54 = icmp ne i32 %53, %const, !dbg !36
  br i1 %54, label %then13, label %if.end15, !dbg !36

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !37
  %55 = load i32, i32* %err, align 4, !dbg !37
  br label %if.end15, !dbg !37

if.end15:                                         ; preds = %if.end12, %then13
  %56 = load i32, i32* %oreqVal, align 4, !dbg !38
  %57 = icmp ne i32 %56, %const38, !dbg !38
  br i1 %57, label %then16, label %if.end18, !dbg !38

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !39
  %58 = load i32, i32* %err, align 4, !dbg !39
  br label %if.end18, !dbg !39

if.end18:                                         ; preds = %if.end15, %then16
  %59 = load i32, i32* %xoreqVal, align 4, !dbg !40
  %60 = icmp ne i32 %59, %const37, !dbg !40
  br i1 %60, label %then19, label %if.end21, !dbg !40

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !41
  %61 = load i32, i32* %err, align 4, !dbg !41
  br label %if.end21, !dbg !41

if.end21:                                         ; preds = %if.end18, %then19
  %62 = load i32, i32* %leftShiftVal, align 4, !dbg !42
  %63 = icmp ne i32 %62, 1450704896, !dbg !42
  br i1 %63, label %then22, label %if.end24, !dbg !42

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !43
  %64 = load i32, i32* %err, align 4, !dbg !43
  br label %if.end24, !dbg !43

if.end24:                                         ; preds = %if.end21, %then22
  %65 = load i32, i32* %rightShiftVal, align 4, !dbg !44
  %66 = icmp ne i32 %65, 34661, !dbg !44
  br i1 %66, label %then25, label %if.end27, !dbg !44

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !45
  %67 = load i32, i32* %err, align 4, !dbg !45
  br label %if.end27, !dbg !45

if.end27:                                         ; preds = %if.end24, %then25
  store i32 -2147483648, i32* %msbSet, align 4, !dbg !46
  %68 = load i32, i32* %msbSet, align 4, !dbg !47
  %69 = lshr i32 %68, 1, !dbg !47
  %70 = icmp ne i32 %69, 1073741824, !dbg !47
  br i1 %70, label %then28, label %if.end30, !dbg !47

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !48
  %71 = load i32, i32* %err, align 4, !dbg !48
  br label %if.end30, !dbg !48

if.end30:                                         ; preds = %if.end27, %then28
  store i32 -8, i32* %signedVal, align 4, !dbg !49
  %72 = load i32, i32* %signedVal, align 4, !dbg !50
  %73 = ashr i32 %72, 1, !dbg !50
  %74 = icmp ne i32 %73, -4, !dbg !50
  br i1 %74, label %then31, label %if.end33, !dbg !50

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !51
  %75 = load i32, i32* %err, align 4, !dbg !51
  br label %if.end33, !dbg !51

if.end33:                                         ; preds = %if.end30, %then31
  %76 = load i32, i32* %err, align 4, !dbg !52
  %77 = icmp eq i32 %76, 0, !dbg !52
  %. = select i1 %77, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @1, i32 0, i32 0), !dbg !27
  %78 = call i32 (i8*, ...) @printf(i8* %.), !dbg !27
  %79 = load i32, i32* %err, align 4, !dbg !53
  ret i32 %79, !dbg !53
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "14.bitwise.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 4, column: 3, scope: !2)
!8 = !DILocation(line: 5, column: 3, scope: !2)
!9 = !DILocation(line: 6, column: 3, scope: !2)
!10 = !DILocation(line: 8, column: 3, scope: !2)
!11 = !DILocation(line: 9, column: 3, scope: !2)
!12 = !DILocation(line: 10, column: 3, scope: !2)
!13 = !DILocation(line: 11, column: 3, scope: !2)
!14 = !DILocation(line: 12, column: 3, scope: !2)
!15 = !DILocation(line: 14, column: 3, scope: !2)
!16 = !DILocation(line: 15, column: 3, scope: !2)
!17 = !DILocation(line: 16, column: 3, scope: !2)
!18 = !DILocation(line: 17, column: 3, scope: !2)
!19 = !DILocation(line: 18, column: 3, scope: !2)
!20 = !DILocation(line: 19, column: 3, scope: !2)
!21 = !DILocation(line: 21, column: 3, scope: !2)
!22 = !DILocation(line: 22, column: 3, scope: !2)
!23 = !DILocation(line: 23, column: 3, scope: !2)
!24 = !DILocation(line: 24, column: 3, scope: !2)
!25 = !DILocation(line: 26, column: 3, scope: !2)
!26 = !DILocation(line: 26, column: 29, scope: !2)
!27 = !DILocation(line: 0, scope: !2)
!28 = !DILocation(line: 27, column: 3, scope: !2)
!29 = !DILocation(line: 27, column: 28, scope: !2)
!30 = !DILocation(line: 28, column: 3, scope: !2)
!31 = !DILocation(line: 28, column: 29, scope: !2)
!32 = !DILocation(line: 29, column: 3, scope: !2)
!33 = !DILocation(line: 29, column: 30, scope: !2)
!34 = !DILocation(line: 30, column: 3, scope: !2)
!35 = !DILocation(line: 30, column: 30, scope: !2)
!36 = !DILocation(line: 31, column: 3, scope: !2)
!37 = !DILocation(line: 31, column: 31, scope: !2)
!38 = !DILocation(line: 32, column: 3, scope: !2)
!39 = !DILocation(line: 32, column: 30, scope: !2)
!40 = !DILocation(line: 33, column: 3, scope: !2)
!41 = !DILocation(line: 33, column: 31, scope: !2)
!42 = !DILocation(line: 34, column: 3, scope: !2)
!43 = !DILocation(line: 34, column: 35, scope: !2)
!44 = !DILocation(line: 35, column: 3, scope: !2)
!45 = !DILocation(line: 35, column: 32, scope: !2)
!46 = !DILocation(line: 37, column: 3, scope: !2)
!47 = !DILocation(line: 38, column: 3, scope: !2)
!48 = !DILocation(line: 38, column: 36, scope: !2)
!49 = !DILocation(line: 40, column: 3, scope: !2)
!50 = !DILocation(line: 41, column: 3, scope: !2)
!51 = !DILocation(line: 41, column: 31, scope: !2)
!52 = !DILocation(line: 43, column: 3, scope: !2)
!53 = !DILocation(line: 48, column: 3, scope: !2)
