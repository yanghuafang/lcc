; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [31 x i8] c"26.operator_precedence.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"26.operator_precedence.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define void @subFunc(i32 %0) !dbg !2 {
entry:
  %i = alloca i32, align 4
  store i32 %0, i32* %i, align 4, !dbg !8
  ret void, !dbg !8
}

define i32 @main() !dbg !9 {
entry:
  %const43 = bitcast i64 2596069104 to i64
  %const = bitcast i64 305419896 to i64
  %decB = alloca i32, align 4
  %decA = alloca i32, align 4
  %incB = alloca i32, align 4
  %incA = alloca i32, align 4
  %callI = alloca i64, align 8
  %mulC = alloca i32*, align 8
  %mulB = alloca i32, align 4
  %mulA = alloca i32, align 4
  %minusA = alloca i32, align 4
  %plusA = alloca i32, align 4
  %d = alloca i64, align 8
  %c = alloca i64, align 8
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !12
  store i64 %const, i64* %a, align 4, !dbg !12
  store i64 %const43, i64* %b, align 4, !dbg !12
  %0 = ptrtoint i64* %a to i64, !dbg !12
  store i64 %0, i64* %c, align 4, !dbg !12
  %1 = ptrtoint i64* %c to i64, !dbg !12
  %2 = load i64, i64* %a, align 4, !dbg !12
  %3 = and i64 %1, %2, !dbg !12
  %4 = load i64, i64* %b, align 4, !dbg !12
  %5 = and i64 %3, %4, !dbg !12
  store i64 %5, i64* %d, align 4, !dbg !12
  %6 = load i64, i64* %a, align 4, !dbg !12
  %7 = icmp ne i64 %6, %const, !dbg !12
  br i1 %7, label %then, label %if.end, !dbg !12

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !12
  %8 = load i32, i32* %err, align 4, !dbg !12
  br label %if.end, !dbg !12

if.end:                                           ; preds = %entry, %then
  %9 = load i64, i64* %b, align 4, !dbg !12
  %10 = icmp ne i64 %9, %const43, !dbg !12
  br i1 %10, label %then1, label %if.end3, !dbg !12

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !12
  %11 = load i32, i32* %err, align 4, !dbg !12
  br label %if.end3, !dbg !12

if.end3:                                          ; preds = %if.end, %then1
  store i32 13, i32* %plusA, align 4, !dbg !12
  %12 = load i32, i32* %plusA, align 4, !dbg !12
  %13 = add i32 3, %12, !dbg !12
  %14 = icmp ne i32 %13, 16, !dbg !12
  br i1 %14, label %then4, label %if.end6, !dbg !12

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !12
  %15 = load i32, i32* %err, align 4, !dbg !12
  br label %if.end6, !dbg !12

if.end6:                                          ; preds = %if.end3, %then4
  %16 = load i32, i32* %plusA, align 4, !dbg !12
  %17 = sub i32 3, %16, !dbg !12
  %18 = icmp ne i32 %17, -10, !dbg !12
  br i1 %18, label %then7, label %if.end15, !dbg !12

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !12
  %19 = load i32, i32* %err, align 4, !dbg !12
  br label %if.end15, !dbg !12

if.end15:                                         ; preds = %if.end6, %then7
  store i32 13, i32* %minusA, align 4, !dbg !12
  %20 = load i32, i32* %minusA, align 4, !dbg !12
  %21 = sub i32 0, %20, !dbg !12
  %22 = sub i32 3, %21, !dbg !12
  %23 = icmp ne i32 %22, 16, !dbg !12
  br i1 %23, label %then16, label %if.end21, !dbg !12

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !12
  %24 = load i32, i32* %err, align 4, !dbg !12
  br label %if.end21, !dbg !12

if.end21:                                         ; preds = %if.end15, %then16
  store i32 3, i32* %mulA, align 4, !dbg !12
  store i32 4, i32* %mulB, align 4, !dbg !12
  store i32* %mulB, i32** %mulC, align 8, !dbg !12
  %25 = load i32, i32* %mulA, align 4, !dbg !12
  %26 = load i32, i32* %mulB, align 4, !dbg !12
  %27 = mul i32 %25, %26, !dbg !12
  %28 = load i32*, i32** %mulC, align 8, !dbg !12
  %29 = load i32, i32* %28, align 4, !dbg !12
  %30 = mul i32 %27, %29, !dbg !12
  %31 = icmp ne i32 %30, 48, !dbg !12
  br i1 %31, label %then22, label %if.end24, !dbg !12

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !12
  %32 = load i32, i32* %err, align 4, !dbg !12
  br label %if.end24, !dbg !12

if.end24:                                         ; preds = %if.end21, %then22
  store i64 1234, i64* %callI, align 4, !dbg !12
  %33 = load i64, i64* %callI, align 4, !dbg !12
  %34 = trunc i64 %33 to i32, !dbg !12
  call void @subFunc(i32 %34), !dbg !12
  %35 = load i64, i64* %callI, align 4, !dbg !12
  %36 = trunc i64 %35 to i32, !dbg !12
  %37 = icmp ne i32 %36, 1234, !dbg !12
  br i1 %37, label %then25, label %if.end27, !dbg !12

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !12
  %38 = load i32, i32* %err, align 4, !dbg !12
  br label %if.end27, !dbg !12

if.end27:                                         ; preds = %if.end24, %then25
  store i32 10, i32* %incA, align 4, !dbg !12
  %39 = load i32, i32* %incA, align 4, !dbg !12
  %40 = add i32 %39, 1, !dbg !12
  store i32 %40, i32* %incA, align 4, !dbg !12
  %41 = load i32, i32* %incA, align 4, !dbg !12
  %42 = add i32 %41, 1, !dbg !12
  store i32 %42, i32* %incA, align 4, !dbg !12
  store i32 %41, i32* %incB, align 4, !dbg !12
  %43 = load i32, i32* %incA, align 4, !dbg !12
  %44 = icmp ne i32 %43, 12, !dbg !12
  br i1 %44, label %then28, label %if.end30, !dbg !12

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !12
  %45 = load i32, i32* %err, align 4, !dbg !12
  br label %if.end30, !dbg !12

if.end30:                                         ; preds = %if.end27, %then28
  %46 = load i32, i32* %incB, align 4, !dbg !12
  %47 = icmp ne i32 %46, 11, !dbg !12
  br i1 %47, label %then31, label %if.end33, !dbg !12

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !12
  %48 = load i32, i32* %err, align 4, !dbg !12
  br label %if.end33, !dbg !12

if.end33:                                         ; preds = %if.end30, %then31
  store i32 10, i32* %decA, align 4, !dbg !12
  %49 = load i32, i32* %decA, align 4, !dbg !12
  %50 = sub i32 %49, 1, !dbg !12
  store i32 %50, i32* %decA, align 4, !dbg !12
  %51 = load i32, i32* %decA, align 4, !dbg !12
  %52 = sub i32 %51, 1, !dbg !12
  store i32 %52, i32* %decA, align 4, !dbg !12
  store i32 %51, i32* %decB, align 4, !dbg !12
  %53 = load i32, i32* %decA, align 4, !dbg !12
  %54 = icmp ne i32 %53, 8, !dbg !12
  br i1 %54, label %then34, label %if.end36, !dbg !12

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4, !dbg !12
  %55 = load i32, i32* %err, align 4, !dbg !12
  br label %if.end36, !dbg !12

if.end36:                                         ; preds = %if.end33, %then34
  %56 = load i32, i32* %decB, align 4, !dbg !12
  %57 = icmp ne i32 %56, 9, !dbg !12
  br i1 %57, label %then37, label %if.end39, !dbg !12

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4, !dbg !12
  %58 = load i32, i32* %err, align 4, !dbg !12
  br label %if.end39, !dbg !12

if.end39:                                         ; preds = %if.end36, %then37
  %59 = load i32, i32* %err, align 4, !dbg !12
  %60 = icmp eq i32 %59, 0, !dbg !12
  %. = select i1 %60, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @1, i32 0, i32 0), !dbg !12
  %61 = call i32 (i8*, ...) @printf(i8* %.), !dbg !12
  %62 = load i32, i32* %err, align 4, !dbg !12
  ret i32 %62, !dbg !12
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "26.operator_precedence.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "subFunc", linkageName: "subFunc", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !7)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6}
!5 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{}
!8 = !DILocation(line: 1, column: 1, scope: !2)
!9 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !10, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !7)
!10 = !DISubroutineType(types: !11)
!11 = !{!6}
!12 = !DILocation(line: 1, column: 1, scope: !9)
