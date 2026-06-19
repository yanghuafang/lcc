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
  store i32 37, i32* %a, align 4, !dbg !8
  store i32 8, i32* %b, align 4, !dbg !9
  %0 = load i32, i32* %a, align 4, !dbg !10
  %1 = load i32, i32* %b, align 4, !dbg !10
  %2 = add i32 %0, %1, !dbg !10
  store i32 %2, i32* %sum, align 4, !dbg !10
  %3 = load i32, i32* %a, align 4, !dbg !11
  %4 = load i32, i32* %b, align 4, !dbg !11
  %5 = sub i32 %3, %4, !dbg !11
  store i32 %5, i32* %sub, align 4, !dbg !11
  %6 = load i32, i32* %b, align 4, !dbg !12
  %7 = load i32, i32* %a, align 4, !dbg !12
  %8 = sub i32 %6, %7, !dbg !12
  store i32 %8, i32* %sub2, align 4, !dbg !12
  %9 = load i32, i32* %a, align 4, !dbg !13
  %10 = load i32, i32* %b, align 4, !dbg !13
  %11 = mul i32 %9, %10, !dbg !13
  store i32 %11, i32* %mul, align 4, !dbg !13
  %12 = load i32, i32* %a, align 4, !dbg !14
  %13 = load i32, i32* %b, align 4, !dbg !14
  %14 = sdiv i32 %12, %13, !dbg !14
  store i32 %14, i32* %div, align 4, !dbg !14
  %15 = load i32, i32* %a, align 4, !dbg !15
  %16 = load i32, i32* %b, align 4, !dbg !15
  %17 = srem i32 %15, %16, !dbg !15
  store i32 %17, i32* %mod, align 4, !dbg !15
  %18 = load i32, i32* %sum, align 4, !dbg !16
  store i32 %18, i32* %sumeq, align 4, !dbg !16
  %19 = load i32, i32* %b, align 4, !dbg !17
  %20 = load i32, i32* %sumeq, align 4, !dbg !17
  %21 = add i32 %20, %19, !dbg !17
  store i32 %21, i32* %sumeq, align 4, !dbg !17
  %22 = load i32, i32* %sumeq, align 4, !dbg !17
  %23 = load i32, i32* %sumeq, align 4, !dbg !18
  store i32 %23, i32* %subeq, align 4, !dbg !18
  %24 = load i32, i32* %b, align 4, !dbg !19
  %25 = load i32, i32* %subeq, align 4, !dbg !19
  %26 = sub i32 %25, %24, !dbg !19
  store i32 %26, i32* %subeq, align 4, !dbg !19
  %27 = load i32, i32* %subeq, align 4, !dbg !19
  %28 = load i32, i32* %subeq, align 4, !dbg !20
  store i32 %28, i32* %muleq, align 4, !dbg !20
  %29 = load i32, i32* %b, align 4, !dbg !21
  %30 = load i32, i32* %muleq, align 4, !dbg !21
  %31 = mul i32 %30, %29, !dbg !21
  store i32 %31, i32* %muleq, align 4, !dbg !21
  %32 = load i32, i32* %muleq, align 4, !dbg !21
  %33 = load i32, i32* %muleq, align 4, !dbg !22
  store i32 %33, i32* %diveq, align 4, !dbg !22
  %34 = load i32, i32* %b, align 4, !dbg !23
  %35 = load i32, i32* %diveq, align 4, !dbg !23
  %36 = sdiv i32 %35, %34, !dbg !23
  store i32 %36, i32* %diveq, align 4, !dbg !23
  %37 = load i32, i32* %diveq, align 4, !dbg !23
  %38 = load i32, i32* %diveq, align 4, !dbg !24
  store i32 %38, i32* %modeq, align 4, !dbg !24
  %39 = load i32, i32* %b, align 4, !dbg !25
  %40 = load i32, i32* %modeq, align 4, !dbg !25
  %41 = srem i32 %40, %39, !dbg !25
  store i32 %41, i32* %modeq, align 4, !dbg !25
  %42 = load i32, i32* %modeq, align 4, !dbg !25
  %43 = load i32, i32* %sum, align 4, !dbg !26
  %44 = icmp ne i32 %43, 45, !dbg !26
  br i1 %44, label %then, label %if.end, !dbg !26

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !27
  %45 = load i32, i32* %err, align 4, !dbg !27
  br label %if.end, !dbg !27

if.end:                                           ; preds = %entry, %then
  %46 = load i32, i32* %sub, align 4, !dbg !28
  %47 = icmp ne i32 %46, 29, !dbg !28
  br i1 %47, label %then1, label %if.end3, !dbg !28

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !29
  %48 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end3, !dbg !29

if.end3:                                          ; preds = %if.end, %then1
  %49 = load i32, i32* %sub2, align 4, !dbg !30
  %50 = icmp ne i32 %49, -29, !dbg !30
  br i1 %50, label %then4, label %if.end6, !dbg !30

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !31
  %51 = load i32, i32* %err, align 4, !dbg !31
  br label %if.end6, !dbg !31

if.end6:                                          ; preds = %if.end3, %then4
  %52 = load i32, i32* %mul, align 4, !dbg !32
  %53 = icmp ne i32 %52, 296, !dbg !32
  br i1 %53, label %then7, label %if.end9, !dbg !32

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !33
  %54 = load i32, i32* %err, align 4, !dbg !33
  br label %if.end9, !dbg !33

if.end9:                                          ; preds = %if.end6, %then7
  %55 = load i32, i32* %div, align 4, !dbg !34
  %56 = icmp ne i32 %55, 4, !dbg !34
  br i1 %56, label %then10, label %if.end12, !dbg !34

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !35
  %57 = load i32, i32* %err, align 4, !dbg !35
  br label %if.end12, !dbg !35

if.end12:                                         ; preds = %if.end9, %then10
  %58 = load i32, i32* %mod, align 4, !dbg !36
  %59 = icmp ne i32 %58, 5, !dbg !36
  br i1 %59, label %then13, label %if.end15, !dbg !36

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !37
  %60 = load i32, i32* %err, align 4, !dbg !37
  br label %if.end15, !dbg !37

if.end15:                                         ; preds = %if.end12, %then13
  %61 = load i32, i32* %sumeq, align 4, !dbg !38
  %62 = icmp ne i32 %61, 53, !dbg !38
  br i1 %62, label %then16, label %if.end18, !dbg !38

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !39
  %63 = load i32, i32* %err, align 4, !dbg !39
  br label %if.end18, !dbg !39

if.end18:                                         ; preds = %if.end15, %then16
  %64 = load i32, i32* %subeq, align 4, !dbg !40
  %65 = icmp ne i32 %64, 45, !dbg !40
  br i1 %65, label %then19, label %if.end21, !dbg !40

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !41
  %66 = load i32, i32* %err, align 4, !dbg !41
  br label %if.end21, !dbg !41

if.end21:                                         ; preds = %if.end18, %then19
  %67 = load i32, i32* %muleq, align 4, !dbg !42
  %68 = icmp ne i32 %67, 360, !dbg !42
  br i1 %68, label %then22, label %if.end24, !dbg !42

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !43
  %69 = load i32, i32* %err, align 4, !dbg !43
  br label %if.end24, !dbg !43

if.end24:                                         ; preds = %if.end21, %then22
  %70 = load i32, i32* %diveq, align 4, !dbg !44
  %71 = icmp ne i32 %70, 45, !dbg !44
  br i1 %71, label %then25, label %if.end27, !dbg !44

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !45
  %72 = load i32, i32* %err, align 4, !dbg !45
  br label %if.end27, !dbg !45

if.end27:                                         ; preds = %if.end24, %then25
  %73 = load i32, i32* %modeq, align 4, !dbg !46
  %74 = icmp ne i32 %73, 5, !dbg !46
  br i1 %74, label %then28, label %if.end30, !dbg !46

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !47
  %75 = load i32, i32* %err, align 4, !dbg !47
  br label %if.end30, !dbg !47

if.end30:                                         ; preds = %if.end27, %then28
  store i32 10, i32* %ua, align 4, !dbg !48
  store i32 3, i32* %ub, align 4, !dbg !49
  %76 = load i32, i32* %ua, align 4, !dbg !50
  %77 = load i32, i32* %ub, align 4, !dbg !50
  %78 = udiv i32 %76, %77, !dbg !50
  %79 = icmp ne i32 %78, 3, !dbg !50
  br i1 %79, label %then31, label %if.end33, !dbg !50

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !51
  %80 = load i32, i32* %err, align 4, !dbg !51
  br label %if.end33, !dbg !51

if.end33:                                         ; preds = %if.end30, %then31
  %81 = load i32, i32* %ua, align 4, !dbg !52
  %82 = load i32, i32* %ub, align 4, !dbg !52
  %83 = urem i32 %81, %82, !dbg !52
  %84 = icmp ne i32 %83, 1, !dbg !52
  br i1 %84, label %then34, label %if.end36, !dbg !52

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4, !dbg !53
  %85 = load i32, i32* %err, align 4, !dbg !53
  br label %if.end36, !dbg !53

if.end36:                                         ; preds = %if.end33, %then34
  store i32 -8, i32* %negA, align 4, !dbg !54
  store i32 3, i32* %negB, align 4, !dbg !55
  %86 = load i32, i32* %negA, align 4, !dbg !56
  %87 = load i32, i32* %negB, align 4, !dbg !56
  %88 = srem i32 %86, %87, !dbg !56
  %89 = icmp ne i32 %88, -2, !dbg !56
  br i1 %89, label %then37, label %if.end39, !dbg !56

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4, !dbg !57
  %90 = load i32, i32* %err, align 4, !dbg !57
  br label %if.end39, !dbg !57

if.end39:                                         ; preds = %if.end36, %then37
  store i32 -1, i32* %mixedSi, align 4, !dbg !58
  store i32 1, i32* %mixedUi, align 4, !dbg !59
  %91 = load i32, i32* %mixedSi, align 4, !dbg !60
  %92 = load i32, i32* %mixedUi, align 4, !dbg !60
  %93 = add i32 %91, %92, !dbg !60
  %94 = icmp ne i32 %93, 0, !dbg !60
  br i1 %94, label %then40, label %if.end42, !dbg !60

then40:                                           ; preds = %if.end39
  store i32 1, i32* %err, align 4, !dbg !61
  %95 = load i32, i32* %err, align 4, !dbg !61
  br label %if.end42, !dbg !61

if.end42:                                         ; preds = %if.end39, %then40
  %96 = load i32, i32* %err, align 4, !dbg !62
  %97 = icmp eq i32 %96, 0, !dbg !62
  %. = select i1 %97, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @1, i32 0, i32 0), !dbg !63
  %98 = call i32 (i8*, ...) @printf(i8* %.), !dbg !63
  %99 = load i32, i32* %err, align 4, !dbg !64
  ret i32 %99, !dbg !64
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "12.arithmetic.c", directory: "../tests")
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
!15 = !DILocation(line: 13, column: 3, scope: !2)
!16 = !DILocation(line: 15, column: 3, scope: !2)
!17 = !DILocation(line: 16, column: 3, scope: !2)
!18 = !DILocation(line: 17, column: 3, scope: !2)
!19 = !DILocation(line: 18, column: 3, scope: !2)
!20 = !DILocation(line: 19, column: 3, scope: !2)
!21 = !DILocation(line: 20, column: 3, scope: !2)
!22 = !DILocation(line: 21, column: 3, scope: !2)
!23 = !DILocation(line: 22, column: 3, scope: !2)
!24 = !DILocation(line: 23, column: 3, scope: !2)
!25 = !DILocation(line: 24, column: 3, scope: !2)
!26 = !DILocation(line: 26, column: 3, scope: !2)
!27 = !DILocation(line: 26, column: 18, scope: !2)
!28 = !DILocation(line: 27, column: 3, scope: !2)
!29 = !DILocation(line: 27, column: 18, scope: !2)
!30 = !DILocation(line: 28, column: 3, scope: !2)
!31 = !DILocation(line: 28, column: 20, scope: !2)
!32 = !DILocation(line: 29, column: 3, scope: !2)
!33 = !DILocation(line: 29, column: 19, scope: !2)
!34 = !DILocation(line: 30, column: 3, scope: !2)
!35 = !DILocation(line: 30, column: 17, scope: !2)
!36 = !DILocation(line: 31, column: 3, scope: !2)
!37 = !DILocation(line: 31, column: 17, scope: !2)
!38 = !DILocation(line: 32, column: 3, scope: !2)
!39 = !DILocation(line: 32, column: 20, scope: !2)
!40 = !DILocation(line: 33, column: 3, scope: !2)
!41 = !DILocation(line: 33, column: 20, scope: !2)
!42 = !DILocation(line: 34, column: 3, scope: !2)
!43 = !DILocation(line: 34, column: 21, scope: !2)
!44 = !DILocation(line: 35, column: 3, scope: !2)
!45 = !DILocation(line: 35, column: 20, scope: !2)
!46 = !DILocation(line: 36, column: 3, scope: !2)
!47 = !DILocation(line: 36, column: 19, scope: !2)
!48 = !DILocation(line: 38, column: 3, scope: !2)
!49 = !DILocation(line: 39, column: 3, scope: !2)
!50 = !DILocation(line: 40, column: 3, scope: !2)
!51 = !DILocation(line: 40, column: 21, scope: !2)
!52 = !DILocation(line: 41, column: 3, scope: !2)
!53 = !DILocation(line: 41, column: 21, scope: !2)
!54 = !DILocation(line: 43, column: 3, scope: !2)
!55 = !DILocation(line: 44, column: 3, scope: !2)
!56 = !DILocation(line: 45, column: 3, scope: !2)
!57 = !DILocation(line: 45, column: 26, scope: !2)
!58 = !DILocation(line: 47, column: 3, scope: !2)
!59 = !DILocation(line: 48, column: 3, scope: !2)
!60 = !DILocation(line: 49, column: 3, scope: !2)
!61 = !DILocation(line: 49, column: 31, scope: !2)
!62 = !DILocation(line: 51, column: 3, scope: !2)
!63 = !DILocation(line: 0, scope: !2)
!64 = !DILocation(line: 56, column: 3, scope: !2)
