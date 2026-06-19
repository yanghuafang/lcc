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
  store i32 305419896, i32* %a, align 4, !dbg !7
  store i32 %const37, i32* %b, align 4, !dbg !7
  %0 = load i32, i32* %a, align 4, !dbg !7
  %1 = load i32, i32* %b, align 4, !dbg !7
  %2 = and i32 %0, %1, !dbg !7
  store i32 %2, i32* %andVal, align 4, !dbg !7
  %3 = load i32, i32* %a, align 4, !dbg !7
  %4 = load i32, i32* %b, align 4, !dbg !7
  %5 = or i32 %3, %4, !dbg !7
  store i32 %5, i32* %orVal, align 4, !dbg !7
  %6 = load i32, i32* %a, align 4, !dbg !7
  %7 = load i32, i32* %b, align 4, !dbg !7
  %8 = xor i32 %6, %7, !dbg !7
  store i32 %8, i32* %xorVal, align 4, !dbg !7
  %9 = load i32, i32* %a, align 4, !dbg !7
  %10 = xor i32 %9, -1, !dbg !7
  store i32 %10, i32* %notVal1, align 4, !dbg !7
  %11 = load i32, i32* %b, align 4, !dbg !7
  %12 = xor i32 %11, -1, !dbg !7
  store i32 %12, i32* %notVal2, align 4, !dbg !7
  %13 = load i32, i32* %andVal, align 4, !dbg !7
  store i32 %13, i32* %andeqVal, align 4, !dbg !7
  %14 = load i32, i32* %a, align 4, !dbg !7
  %15 = load i32, i32* %andeqVal, align 4, !dbg !7
  %16 = and i32 %15, %14, !dbg !7
  store i32 %16, i32* %andeqVal, align 4, !dbg !7
  %17 = load i32, i32* %andeqVal, align 4, !dbg !7
  %18 = load i32, i32* %orVal, align 4, !dbg !7
  store i32 %18, i32* %oreqVal, align 4, !dbg !7
  %19 = load i32, i32* %a, align 4, !dbg !7
  %20 = load i32, i32* %oreqVal, align 4, !dbg !7
  %21 = or i32 %20, %19, !dbg !7
  store i32 %21, i32* %oreqVal, align 4, !dbg !7
  %22 = load i32, i32* %oreqVal, align 4, !dbg !7
  %23 = load i32, i32* %xorVal, align 4, !dbg !7
  store i32 %23, i32* %xoreqVal, align 4, !dbg !7
  %24 = load i32, i32* %a, align 4, !dbg !7
  %25 = load i32, i32* %xoreqVal, align 4, !dbg !7
  %26 = xor i32 %25, %24, !dbg !7
  store i32 %26, i32* %xoreqVal, align 4, !dbg !7
  %27 = load i32, i32* %xoreqVal, align 4, !dbg !7
  %28 = load i32, i32* %a, align 4, !dbg !7
  %29 = shl i32 %28, 8, !dbg !7
  store i32 %29, i32* %leftShiftVal, align 4, !dbg !7
  %30 = load i32, i32* %b, align 4, !dbg !7
  %31 = lshr i32 %30, 8, !dbg !7
  store i32 %31, i32* %rightShiftVal, align 4, !dbg !7
  %32 = load i32, i32* %leftShiftVal, align 4, !dbg !7
  %33 = shl i32 %32, 8, !dbg !7
  store i32 %33, i32* %leftShiftVal, align 4, !dbg !7
  %34 = load i32, i32* %leftShiftVal, align 4, !dbg !7
  %35 = load i32, i32* %rightShiftVal, align 4, !dbg !7
  %36 = lshr i32 %35, 8, !dbg !7
  store i32 %36, i32* %rightShiftVal, align 4, !dbg !7
  %37 = load i32, i32* %rightShiftVal, align 4, !dbg !7
  %38 = load i32, i32* %andVal, align 4, !dbg !7
  %39 = icmp ne i32 %38, %const, !dbg !7
  br i1 %39, label %then, label %if.end, !dbg !7

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !7
  %40 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end, !dbg !7

if.end:                                           ; preds = %entry, %then
  %const38 = bitcast i32 -1753917575 to i32, !dbg !7
  %41 = load i32, i32* %orVal, align 4, !dbg !7
  %42 = icmp ne i32 %41, %const38, !dbg !7
  br i1 %42, label %then1, label %if.end3, !dbg !7

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !7
  %43 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end3, !dbg !7

if.end3:                                          ; preds = %if.end, %then1
  %44 = load i32, i32* %xorVal, align 4, !dbg !7
  %45 = icmp ne i32 %44, -1789848231, !dbg !7
  br i1 %45, label %then4, label %if.end6, !dbg !7

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !7
  %46 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end6, !dbg !7

if.end6:                                          ; preds = %if.end3, %then4
  %47 = load i32, i32* %notVal1, align 4, !dbg !7
  %48 = icmp ne i32 %47, -305419897, !dbg !7
  br i1 %48, label %then7, label %if.end9, !dbg !7

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !7
  %49 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end9, !dbg !7

if.end9:                                          ; preds = %if.end6, %then7
  %50 = load i32, i32* %notVal2, align 4, !dbg !7
  %51 = icmp ne i32 %50, 2023406814, !dbg !7
  br i1 %51, label %then10, label %if.end12, !dbg !7

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !7
  %52 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end12, !dbg !7

if.end12:                                         ; preds = %if.end9, %then10
  %53 = load i32, i32* %andeqVal, align 4, !dbg !7
  %54 = icmp ne i32 %53, %const, !dbg !7
  br i1 %54, label %then13, label %if.end15, !dbg !7

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !7
  %55 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end15, !dbg !7

if.end15:                                         ; preds = %if.end12, %then13
  %56 = load i32, i32* %oreqVal, align 4, !dbg !7
  %57 = icmp ne i32 %56, %const38, !dbg !7
  br i1 %57, label %then16, label %if.end18, !dbg !7

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !7
  %58 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end18, !dbg !7

if.end18:                                         ; preds = %if.end15, %then16
  %59 = load i32, i32* %xoreqVal, align 4, !dbg !7
  %60 = icmp ne i32 %59, %const37, !dbg !7
  br i1 %60, label %then19, label %if.end21, !dbg !7

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !7
  %61 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end21, !dbg !7

if.end21:                                         ; preds = %if.end18, %then19
  %62 = load i32, i32* %leftShiftVal, align 4, !dbg !7
  %63 = icmp ne i32 %62, 1450704896, !dbg !7
  br i1 %63, label %then22, label %if.end24, !dbg !7

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !7
  %64 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end24, !dbg !7

if.end24:                                         ; preds = %if.end21, %then22
  %65 = load i32, i32* %rightShiftVal, align 4, !dbg !7
  %66 = icmp ne i32 %65, 34661, !dbg !7
  br i1 %66, label %then25, label %if.end27, !dbg !7

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !7
  %67 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end27, !dbg !7

if.end27:                                         ; preds = %if.end24, %then25
  store i32 -2147483648, i32* %msbSet, align 4, !dbg !7
  %68 = load i32, i32* %msbSet, align 4, !dbg !7
  %69 = lshr i32 %68, 1, !dbg !7
  %70 = icmp ne i32 %69, 1073741824, !dbg !7
  br i1 %70, label %then28, label %if.end30, !dbg !7

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !7
  %71 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end30, !dbg !7

if.end30:                                         ; preds = %if.end27, %then28
  store i32 -8, i32* %signedVal, align 4, !dbg !7
  %72 = load i32, i32* %signedVal, align 4, !dbg !7
  %73 = ashr i32 %72, 1, !dbg !7
  %74 = icmp ne i32 %73, -4, !dbg !7
  br i1 %74, label %then31, label %if.end33, !dbg !7

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !7
  %75 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end33, !dbg !7

if.end33:                                         ; preds = %if.end30, %then31
  %76 = load i32, i32* %err, align 4, !dbg !7
  %77 = icmp eq i32 %76, 0, !dbg !7
  %. = select i1 %77, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @1, i32 0, i32 0), !dbg !7
  %78 = call i32 (i8*, ...) @printf(i8* %.), !dbg !7
  %79 = load i32, i32* %err, align 4, !dbg !7
  ret i32 %79, !dbg !7
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "14.bitwise.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
