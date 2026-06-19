; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [19 x i8] c"16.ternary.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"16.ternary.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %ternarySame = alloca i32, align 4
  %same = alloca i32, align 4
  %maxNeg = alloca i32, align 4
  %minNeg = alloca i32, align 4
  %e = alloca i32, align 4
  %d = alloca i32, align 4
  %maxVal = alloca i32, align 4
  %minVal = alloca i32, align 4
  %c = alloca i32, align 4
  %a = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  store i32 3, i32* %a, align 4, !dbg !7
  store i32 7, i32* %c, align 4, !dbg !7
  %0 = load i32, i32* %a, align 4, !dbg !7
  %1 = load i32, i32* %c, align 4, !dbg !7
  %2 = icmp slt i32 %0, %1, !dbg !7
  %3 = load i32, i32* %a, align 4, !dbg !7
  %4 = load i32, i32* %c, align 4, !dbg !7
  %5 = select i1 %2, i32 %3, i32 %4, !dbg !7
  store i32 %5, i32* %minVal, align 4, !dbg !7
  %6 = load i32, i32* %a, align 4, !dbg !7
  %7 = load i32, i32* %c, align 4, !dbg !7
  %8 = icmp slt i32 %6, %7, !dbg !7
  %9 = load i32, i32* %c, align 4, !dbg !7
  %10 = load i32, i32* %a, align 4, !dbg !7
  %11 = select i1 %8, i32 %9, i32 %10, !dbg !7
  store i32 %11, i32* %maxVal, align 4, !dbg !7
  %12 = load i32, i32* %minVal, align 4, !dbg !7
  %13 = icmp ne i32 %12, 3, !dbg !7
  br i1 %13, label %then, label %if.end, !dbg !7

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !7
  %14 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end, !dbg !7

if.end:                                           ; preds = %entry, %then
  %15 = load i32, i32* %maxVal, align 4, !dbg !7
  %16 = icmp ne i32 %15, 7, !dbg !7
  br i1 %16, label %then1, label %if.end3, !dbg !7

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !7
  %17 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end3, !dbg !7

if.end3:                                          ; preds = %if.end, %then1
  store i32 -5, i32* %d, align 4, !dbg !7
  store i32 2, i32* %e, align 4, !dbg !7
  %18 = load i32, i32* %d, align 4, !dbg !7
  %19 = load i32, i32* %e, align 4, !dbg !7
  %20 = icmp slt i32 %18, %19, !dbg !7
  %21 = load i32, i32* %d, align 4, !dbg !7
  %22 = load i32, i32* %e, align 4, !dbg !7
  %23 = select i1 %20, i32 %21, i32 %22, !dbg !7
  store i32 %23, i32* %minNeg, align 4, !dbg !7
  %24 = load i32, i32* %d, align 4, !dbg !7
  %25 = load i32, i32* %e, align 4, !dbg !7
  %26 = icmp slt i32 %24, %25, !dbg !7
  %27 = load i32, i32* %e, align 4, !dbg !7
  %28 = load i32, i32* %d, align 4, !dbg !7
  %29 = select i1 %26, i32 %27, i32 %28, !dbg !7
  store i32 %29, i32* %maxNeg, align 4, !dbg !7
  %30 = load i32, i32* %minNeg, align 4, !dbg !7
  %31 = icmp ne i32 %30, -5, !dbg !7
  br i1 %31, label %then4, label %if.end6, !dbg !7

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !7
  %32 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end6, !dbg !7

if.end6:                                          ; preds = %if.end3, %then4
  %33 = load i32, i32* %maxNeg, align 4, !dbg !7
  %34 = icmp ne i32 %33, 2, !dbg !7
  br i1 %34, label %then7, label %if.end9, !dbg !7

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !7
  %35 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end9, !dbg !7

if.end9:                                          ; preds = %if.end6, %then7
  store i32 42, i32* %same, align 4, !dbg !7
  %36 = load i32, i32* %same, align 4, !dbg !7
  %37 = load i32, i32* %same, align 4, !dbg !7
  %38 = icmp slt i32 %36, %37, !dbg !7
  %39 = select i1 %38, i32 0, i32 1, !dbg !7
  store i32 %39, i32* %ternarySame, align 4, !dbg !7
  %40 = load i32, i32* %ternarySame, align 4, !dbg !7
  %41 = icmp ne i32 %40, 1, !dbg !7
  br i1 %41, label %then10, label %if.end12, !dbg !7

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !7
  %42 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end12, !dbg !7

if.end12:                                         ; preds = %if.end9, %then10
  %43 = load i32, i32* %err, align 4, !dbg !7
  %44 = icmp eq i32 %43, 0, !dbg !7
  %. = select i1 %44, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @1, i32 0, i32 0), !dbg !7
  %45 = call i32 (i8*, ...) @printf(i8* %.), !dbg !7
  %46 = load i32, i32* %err, align 4, !dbg !7
  ret i32 %46, !dbg !7
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "16.ternary.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
