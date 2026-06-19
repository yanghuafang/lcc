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
  store i32 %0, i32* %i, align 4
  ret void
}

define i32 @main() !dbg !8 {
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
  store i32 0, i32* %err, align 4, !dbg !11
  store i64 %const, i64* %a, align 4, !dbg !12
  store i64 %const43, i64* %b, align 4, !dbg !13
  %0 = ptrtoint i64* %a to i64, !dbg !14
  store i64 %0, i64* %c, align 4, !dbg !14
  %1 = ptrtoint i64* %c to i64, !dbg !15
  %2 = load i64, i64* %a, align 4, !dbg !15
  %3 = and i64 %1, %2, !dbg !15
  %4 = load i64, i64* %b, align 4, !dbg !15
  %5 = and i64 %3, %4, !dbg !15
  store i64 %5, i64* %d, align 4, !dbg !15
  %6 = load i64, i64* %a, align 4, !dbg !16
  %7 = icmp ne i64 %6, %const, !dbg !16
  br i1 %7, label %then, label %if.end, !dbg !16

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !17
  %8 = load i32, i32* %err, align 4, !dbg !17
  br label %if.end, !dbg !17

if.end:                                           ; preds = %entry, %then
  %9 = load i64, i64* %b, align 4, !dbg !18
  %10 = icmp ne i64 %9, %const43, !dbg !18
  br i1 %10, label %then1, label %if.end3, !dbg !18

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !19
  %11 = load i32, i32* %err, align 4, !dbg !19
  br label %if.end3, !dbg !19

if.end3:                                          ; preds = %if.end, %then1
  store i32 13, i32* %plusA, align 4, !dbg !20
  %12 = load i32, i32* %plusA, align 4, !dbg !21
  %13 = add i32 3, %12, !dbg !21
  %14 = icmp ne i32 %13, 16, !dbg !21
  br i1 %14, label %then4, label %if.end6, !dbg !21

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !22
  %15 = load i32, i32* %err, align 4, !dbg !22
  br label %if.end6, !dbg !22

if.end6:                                          ; preds = %if.end3, %then4
  %16 = load i32, i32* %plusA, align 4, !dbg !23
  %17 = sub i32 3, %16, !dbg !23
  %18 = icmp ne i32 %17, -10, !dbg !23
  br i1 %18, label %then7, label %if.end15, !dbg !23

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !24
  %19 = load i32, i32* %err, align 4, !dbg !24
  br label %if.end15, !dbg !24

if.end15:                                         ; preds = %if.end6, %then7
  store i32 13, i32* %minusA, align 4, !dbg !25
  %20 = load i32, i32* %minusA, align 4, !dbg !26
  %21 = sub i32 0, %20, !dbg !26
  %22 = sub i32 3, %21, !dbg !26
  %23 = icmp ne i32 %22, 16, !dbg !26
  br i1 %23, label %then16, label %if.end21, !dbg !26

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !27
  %24 = load i32, i32* %err, align 4, !dbg !27
  br label %if.end21, !dbg !27

if.end21:                                         ; preds = %if.end15, %then16
  store i32 3, i32* %mulA, align 4, !dbg !28
  store i32 4, i32* %mulB, align 4, !dbg !29
  store i32* %mulB, i32** %mulC, align 8, !dbg !30
  %25 = load i32, i32* %mulA, align 4, !dbg !31
  %26 = load i32, i32* %mulB, align 4, !dbg !31
  %27 = mul i32 %25, %26, !dbg !31
  %28 = load i32*, i32** %mulC, align 8, !dbg !31
  %29 = load i32, i32* %28, align 4, !dbg !31
  %30 = mul i32 %27, %29, !dbg !31
  %31 = icmp ne i32 %30, 48, !dbg !31
  br i1 %31, label %then22, label %if.end24, !dbg !31

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !32
  %32 = load i32, i32* %err, align 4, !dbg !32
  br label %if.end24, !dbg !32

if.end24:                                         ; preds = %if.end21, %then22
  store i64 1234, i64* %callI, align 4, !dbg !33
  %33 = load i64, i64* %callI, align 4, !dbg !34
  %34 = trunc i64 %33 to i32, !dbg !34
  call void @subFunc(i32 %34), !dbg !34
  %35 = load i64, i64* %callI, align 4, !dbg !35
  %36 = trunc i64 %35 to i32, !dbg !35
  %37 = icmp ne i32 %36, 1234, !dbg !35
  br i1 %37, label %then25, label %if.end27, !dbg !35

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !36
  %38 = load i32, i32* %err, align 4, !dbg !36
  br label %if.end27, !dbg !36

if.end27:                                         ; preds = %if.end24, %then25
  store i32 10, i32* %incA, align 4, !dbg !37
  %39 = load i32, i32* %incA, align 4, !dbg !38
  %40 = add i32 %39, 1, !dbg !38
  store i32 %40, i32* %incA, align 4, !dbg !38
  %41 = load i32, i32* %incA, align 4, !dbg !38
  %42 = add i32 %41, 1, !dbg !38
  store i32 %42, i32* %incA, align 4, !dbg !38
  store i32 %41, i32* %incB, align 4, !dbg !38
  %43 = load i32, i32* %incA, align 4, !dbg !39
  %44 = icmp ne i32 %43, 12, !dbg !39
  br i1 %44, label %then28, label %if.end30, !dbg !39

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !40
  %45 = load i32, i32* %err, align 4, !dbg !40
  br label %if.end30, !dbg !40

if.end30:                                         ; preds = %if.end27, %then28
  %46 = load i32, i32* %incB, align 4, !dbg !41
  %47 = icmp ne i32 %46, 11, !dbg !41
  br i1 %47, label %then31, label %if.end33, !dbg !41

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !42
  %48 = load i32, i32* %err, align 4, !dbg !42
  br label %if.end33, !dbg !42

if.end33:                                         ; preds = %if.end30, %then31
  store i32 10, i32* %decA, align 4, !dbg !43
  %49 = load i32, i32* %decA, align 4, !dbg !44
  %50 = sub i32 %49, 1, !dbg !44
  store i32 %50, i32* %decA, align 4, !dbg !44
  %51 = load i32, i32* %decA, align 4, !dbg !44
  %52 = sub i32 %51, 1, !dbg !44
  store i32 %52, i32* %decA, align 4, !dbg !44
  store i32 %51, i32* %decB, align 4, !dbg !44
  %53 = load i32, i32* %decA, align 4, !dbg !45
  %54 = icmp ne i32 %53, 8, !dbg !45
  br i1 %54, label %then34, label %if.end36, !dbg !45

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4, !dbg !46
  %55 = load i32, i32* %err, align 4, !dbg !46
  br label %if.end36, !dbg !46

if.end36:                                         ; preds = %if.end33, %then34
  %56 = load i32, i32* %decB, align 4, !dbg !47
  %57 = icmp ne i32 %56, 9, !dbg !47
  br i1 %57, label %then37, label %if.end39, !dbg !47

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4, !dbg !48
  %58 = load i32, i32* %err, align 4, !dbg !48
  br label %if.end39, !dbg !48

if.end39:                                         ; preds = %if.end36, %then37
  %59 = load i32, i32* %err, align 4, !dbg !49
  %60 = icmp eq i32 %59, 0, !dbg !49
  %. = select i1 %60, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @1, i32 0, i32 0), !dbg !50
  %61 = call i32 (i8*, ...) @printf(i8* %.), !dbg !50
  %62 = load i32, i32* %err, align 4, !dbg !51
  ret i32 %62, !dbg !51
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "26.operator_precedence.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "subFunc", linkageName: "subFunc", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !7)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6}
!5 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{}
!8 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 5, type: !9, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !7)
!9 = !DISubroutineType(types: !10)
!10 = !{!6}
!11 = !DILocation(line: 6, column: 3, scope: !8)
!12 = !DILocation(line: 8, column: 3, scope: !8)
!13 = !DILocation(line: 9, column: 3, scope: !8)
!14 = !DILocation(line: 10, column: 3, scope: !8)
!15 = !DILocation(line: 11, column: 3, scope: !8)
!16 = !DILocation(line: 12, column: 3, scope: !8)
!17 = !DILocation(line: 12, column: 32, scope: !8)
!18 = !DILocation(line: 13, column: 3, scope: !8)
!19 = !DILocation(line: 13, column: 32, scope: !8)
!20 = !DILocation(line: 15, column: 3, scope: !8)
!21 = !DILocation(line: 16, column: 3, scope: !8)
!22 = !DILocation(line: 16, column: 25, scope: !8)
!23 = !DILocation(line: 17, column: 3, scope: !8)
!24 = !DILocation(line: 17, column: 26, scope: !8)
!25 = !DILocation(line: 21, column: 3, scope: !8)
!26 = !DILocation(line: 22, column: 3, scope: !8)
!27 = !DILocation(line: 22, column: 26, scope: !8)
!28 = !DILocation(line: 25, column: 3, scope: !8)
!29 = !DILocation(line: 26, column: 3, scope: !8)
!30 = !DILocation(line: 27, column: 3, scope: !8)
!31 = !DILocation(line: 28, column: 3, scope: !8)
!32 = !DILocation(line: 28, column: 34, scope: !8)
!33 = !DILocation(line: 30, column: 3, scope: !8)
!34 = !DILocation(line: 31, column: 3, scope: !8)
!35 = !DILocation(line: 32, column: 3, scope: !8)
!36 = !DILocation(line: 32, column: 27, scope: !8)
!37 = !DILocation(line: 34, column: 3, scope: !8)
!38 = !DILocation(line: 35, column: 3, scope: !8)
!39 = !DILocation(line: 36, column: 3, scope: !8)
!40 = !DILocation(line: 36, column: 19, scope: !8)
!41 = !DILocation(line: 37, column: 3, scope: !8)
!42 = !DILocation(line: 37, column: 19, scope: !8)
!43 = !DILocation(line: 39, column: 3, scope: !8)
!44 = !DILocation(line: 40, column: 3, scope: !8)
!45 = !DILocation(line: 41, column: 3, scope: !8)
!46 = !DILocation(line: 41, column: 18, scope: !8)
!47 = !DILocation(line: 42, column: 3, scope: !8)
!48 = !DILocation(line: 42, column: 18, scope: !8)
!49 = !DILocation(line: 44, column: 3, scope: !8)
!50 = !DILocation(line: 0, scope: !8)
!51 = !DILocation(line: 49, column: 3, scope: !8)
