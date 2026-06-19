; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [22 x i8] c"12.arithmetic.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"12.arithmetic.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %mixedUi = alloca i32, align 4
  %mixedSi = alloca i32, align 4
  %negB = alloca i32, align 4
  %negA = alloca i32, align 4
  %ub = alloca i32, align 4
  %ua = alloca i32, align 4
  %modeq = alloca i32, align 4
  %diveq = alloca i32, align 4
  %muleq = alloca i32, align 4
  %subeq = alloca i32, align 4
  %sumeq = alloca i32, align 4
  %mod = alloca i32, align 4
  %div = alloca i32, align 4
  %mul = alloca i32, align 4
  %sub2 = alloca i32, align 4
  %sub = alloca i32, align 4
  %sum = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  store i32 37, i32* %a, align 4, !dbg !7
  store i32 8, i32* %b, align 4, !dbg !7
  %0 = load i32, i32* %a, align 4, !dbg !7
  %1 = load i32, i32* %b, align 4, !dbg !7
  %2 = add i32 %0, %1, !dbg !7
  store i32 %2, i32* %sum, align 4, !dbg !7
  %3 = load i32, i32* %a, align 4, !dbg !7
  %4 = load i32, i32* %b, align 4, !dbg !7
  %5 = sub i32 %3, %4, !dbg !7
  store i32 %5, i32* %sub, align 4, !dbg !7
  %6 = load i32, i32* %b, align 4, !dbg !7
  %7 = load i32, i32* %a, align 4, !dbg !7
  %8 = sub i32 %6, %7, !dbg !7
  store i32 %8, i32* %sub2, align 4, !dbg !7
  %9 = load i32, i32* %a, align 4, !dbg !7
  %10 = load i32, i32* %b, align 4, !dbg !7
  %11 = mul i32 %9, %10, !dbg !7
  store i32 %11, i32* %mul, align 4, !dbg !7
  %12 = load i32, i32* %a, align 4, !dbg !7
  %13 = load i32, i32* %b, align 4, !dbg !7
  %14 = sdiv i32 %12, %13, !dbg !7
  store i32 %14, i32* %div, align 4, !dbg !7
  %15 = load i32, i32* %a, align 4, !dbg !7
  %16 = load i32, i32* %b, align 4, !dbg !7
  %17 = srem i32 %15, %16, !dbg !7
  store i32 %17, i32* %mod, align 4, !dbg !7
  %18 = load i32, i32* %sum, align 4, !dbg !7
  store i32 %18, i32* %sumeq, align 4, !dbg !7
  %19 = load i32, i32* %b, align 4, !dbg !7
  %20 = load i32, i32* %sumeq, align 4, !dbg !7
  %21 = add i32 %20, %19, !dbg !7
  store i32 %21, i32* %sumeq, align 4, !dbg !7
  %22 = load i32, i32* %sumeq, align 4, !dbg !7
  %23 = load i32, i32* %sumeq, align 4, !dbg !7
  store i32 %23, i32* %subeq, align 4, !dbg !7
  %24 = load i32, i32* %b, align 4, !dbg !7
  %25 = load i32, i32* %subeq, align 4, !dbg !7
  %26 = sub i32 %25, %24, !dbg !7
  store i32 %26, i32* %subeq, align 4, !dbg !7
  %27 = load i32, i32* %subeq, align 4, !dbg !7
  %28 = load i32, i32* %subeq, align 4, !dbg !7
  store i32 %28, i32* %muleq, align 4, !dbg !7
  %29 = load i32, i32* %b, align 4, !dbg !7
  %30 = load i32, i32* %muleq, align 4, !dbg !7
  %31 = mul i32 %30, %29, !dbg !7
  store i32 %31, i32* %muleq, align 4, !dbg !7
  %32 = load i32, i32* %muleq, align 4, !dbg !7
  %33 = load i32, i32* %muleq, align 4, !dbg !7
  store i32 %33, i32* %diveq, align 4, !dbg !7
  %34 = load i32, i32* %b, align 4, !dbg !7
  %35 = load i32, i32* %diveq, align 4, !dbg !7
  %36 = sdiv i32 %35, %34, !dbg !7
  store i32 %36, i32* %diveq, align 4, !dbg !7
  %37 = load i32, i32* %diveq, align 4, !dbg !7
  %38 = load i32, i32* %diveq, align 4, !dbg !7
  store i32 %38, i32* %modeq, align 4, !dbg !7
  %39 = load i32, i32* %b, align 4, !dbg !7
  %40 = load i32, i32* %modeq, align 4, !dbg !7
  %41 = srem i32 %40, %39, !dbg !7
  store i32 %41, i32* %modeq, align 4, !dbg !7
  %42 = load i32, i32* %modeq, align 4, !dbg !7
  %43 = load i32, i32* %sum, align 4, !dbg !7
  %44 = icmp ne i32 %43, 45, !dbg !7
  br i1 %44, label %then, label %if.end, !dbg !7

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !7
  %45 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end, !dbg !7

if.end:                                           ; preds = %entry, %then
  %46 = load i32, i32* %sub, align 4, !dbg !7
  %47 = icmp ne i32 %46, 29, !dbg !7
  br i1 %47, label %then1, label %if.end3, !dbg !7

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !7
  %48 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end3, !dbg !7

if.end3:                                          ; preds = %if.end, %then1
  %49 = load i32, i32* %sub2, align 4, !dbg !7
  %50 = icmp ne i32 %49, -29, !dbg !7
  br i1 %50, label %then4, label %if.end6, !dbg !7

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !7
  %51 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end6, !dbg !7

if.end6:                                          ; preds = %if.end3, %then4
  %52 = load i32, i32* %mul, align 4, !dbg !7
  %53 = icmp ne i32 %52, 296, !dbg !7
  br i1 %53, label %then7, label %if.end9, !dbg !7

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !7
  %54 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end9, !dbg !7

if.end9:                                          ; preds = %if.end6, %then7
  %55 = load i32, i32* %div, align 4, !dbg !7
  %56 = icmp ne i32 %55, 4, !dbg !7
  br i1 %56, label %then10, label %if.end12, !dbg !7

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !7
  %57 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end12, !dbg !7

if.end12:                                         ; preds = %if.end9, %then10
  %58 = load i32, i32* %mod, align 4, !dbg !7
  %59 = icmp ne i32 %58, 5, !dbg !7
  br i1 %59, label %then13, label %if.end15, !dbg !7

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !7
  %60 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end15, !dbg !7

if.end15:                                         ; preds = %if.end12, %then13
  %61 = load i32, i32* %sumeq, align 4, !dbg !7
  %62 = icmp ne i32 %61, 53, !dbg !7
  br i1 %62, label %then16, label %if.end18, !dbg !7

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !7
  %63 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end18, !dbg !7

if.end18:                                         ; preds = %if.end15, %then16
  %64 = load i32, i32* %subeq, align 4, !dbg !7
  %65 = icmp ne i32 %64, 45, !dbg !7
  br i1 %65, label %then19, label %if.end21, !dbg !7

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !7
  %66 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end21, !dbg !7

if.end21:                                         ; preds = %if.end18, %then19
  %67 = load i32, i32* %muleq, align 4, !dbg !7
  %68 = icmp ne i32 %67, 360, !dbg !7
  br i1 %68, label %then22, label %if.end24, !dbg !7

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !7
  %69 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end24, !dbg !7

if.end24:                                         ; preds = %if.end21, %then22
  %70 = load i32, i32* %diveq, align 4, !dbg !7
  %71 = icmp ne i32 %70, 45, !dbg !7
  br i1 %71, label %then25, label %if.end27, !dbg !7

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !7
  %72 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end27, !dbg !7

if.end27:                                         ; preds = %if.end24, %then25
  %73 = load i32, i32* %modeq, align 4, !dbg !7
  %74 = icmp ne i32 %73, 5, !dbg !7
  br i1 %74, label %then28, label %if.end30, !dbg !7

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !7
  %75 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end30, !dbg !7

if.end30:                                         ; preds = %if.end27, %then28
  store i32 10, i32* %ua, align 4, !dbg !7
  store i32 3, i32* %ub, align 4, !dbg !7
  %76 = load i32, i32* %ua, align 4, !dbg !7
  %77 = load i32, i32* %ub, align 4, !dbg !7
  %78 = udiv i32 %76, %77, !dbg !7
  %79 = icmp ne i32 %78, 3, !dbg !7
  br i1 %79, label %then31, label %if.end33, !dbg !7

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !7
  %80 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end33, !dbg !7

if.end33:                                         ; preds = %if.end30, %then31
  %81 = load i32, i32* %ua, align 4, !dbg !7
  %82 = load i32, i32* %ub, align 4, !dbg !7
  %83 = urem i32 %81, %82, !dbg !7
  %84 = icmp ne i32 %83, 1, !dbg !7
  br i1 %84, label %then34, label %if.end36, !dbg !7

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4, !dbg !7
  %85 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end36, !dbg !7

if.end36:                                         ; preds = %if.end33, %then34
  store i32 -8, i32* %negA, align 4, !dbg !7
  store i32 3, i32* %negB, align 4, !dbg !7
  %86 = load i32, i32* %negA, align 4, !dbg !7
  %87 = load i32, i32* %negB, align 4, !dbg !7
  %88 = srem i32 %86, %87, !dbg !7
  %89 = icmp ne i32 %88, -2, !dbg !7
  br i1 %89, label %then37, label %if.end39, !dbg !7

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4, !dbg !7
  %90 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end39, !dbg !7

if.end39:                                         ; preds = %if.end36, %then37
  store i32 -1, i32* %mixedSi, align 4, !dbg !7
  store i32 1, i32* %mixedUi, align 4, !dbg !7
  %91 = load i32, i32* %mixedSi, align 4, !dbg !7
  %92 = load i32, i32* %mixedUi, align 4, !dbg !7
  %93 = add i32 %91, %92, !dbg !7
  %94 = icmp ne i32 %93, 0, !dbg !7
  br i1 %94, label %then40, label %if.end42, !dbg !7

then40:                                           ; preds = %if.end39
  store i32 1, i32* %err, align 4, !dbg !7
  %95 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end42, !dbg !7

if.end42:                                         ; preds = %if.end39, %then40
  %96 = load i32, i32* %err, align 4, !dbg !7
  %97 = icmp eq i32 %96, 0, !dbg !7
  %. = select i1 %97, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @1, i32 0, i32 0), !dbg !7
  %98 = call i32 (i8*, ...) @printf(i8* %.), !dbg !7
  %99 = load i32, i32* %err, align 4, !dbg !7
  ret i32 %99, !dbg !7
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "12.arithmetic.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
