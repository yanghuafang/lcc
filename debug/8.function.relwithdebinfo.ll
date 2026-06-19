; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [19 x i8] c"8.function.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"8.function.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @sum(i32 %0, i32 %1) !dbg !2 {
entry:
  %r = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 %0, i32* %l, align 4, !dbg !7
  store i32 %1, i32* %r, align 4, !dbg !7
  %2 = load i32, i32* %l, align 4, !dbg !13
  %3 = load i32, i32* %r, align 4, !dbg !13
  %4 = add i32 %2, %3, !dbg !13
  ret i32 %4, !dbg !13
}

define i32 @sum2(i32* %0, i32* %1) !dbg !14 {
entry:
  %r = alloca i32*, align 8
  %l = alloca i32*, align 8
  store i32* %0, i32** %l, align 8
  store i32* %1, i32** %r, align 8
  %2 = load i32*, i32** %l, align 8, !dbg !17
  %3 = load i32, i32* %2, align 4, !dbg !17
  %4 = load i32*, i32** %r, align 8, !dbg !17
  %5 = load i32, i32* %4, align 4, !dbg !17
  %6 = call i32 @sum(i32 %3, i32 %5), !dbg !17
  ret i32 %6, !dbg !17
}

define void @sum3(i32 %0, i32 %1, i32* %2) !dbg !8 {
entry:
  %result = alloca i32*, align 8
  %r = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 %0, i32* %l, align 4, !dbg !17
  store i32 %1, i32* %r, align 4, !dbg !17
  store i32* %2, i32** %result, align 8, !dbg !17
  %3 = load i32*, i32** %result, align 8, !dbg !7
  %4 = load i32, i32* %l, align 4, !dbg !7
  %5 = load i32, i32* %r, align 4, !dbg !7
  %6 = add i32 %4, %5, !dbg !7
  store i32 %6, i32* %3, align 4, !dbg !7
  %7 = load i32, i32* %3, align 4, !dbg !7
  ret void, !dbg !7
}

define i32 @main() !dbg !18 {
entry:
  %r = alloca i32, align 4
  %l = alloca i32, align 4
  %i = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !21
  store i32 3, i32* %l, align 4, !dbg !22
  store i32 4, i32* %r, align 4, !dbg !23
  %0 = call i32 @sum(i32 1, i32 2), !dbg !24
  %1 = icmp ne i32 %0, 3, !dbg !24
  br i1 %1, label %then, label %if.end, !dbg !24

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !25
  %2 = load i32, i32* %err, align 4, !dbg !25
  br label %if.end, !dbg !25

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @sum(i32 3, i32 4), !dbg !26
  %4 = icmp ne i32 %3, 7, !dbg !26
  br i1 %4, label %then1, label %if.end3, !dbg !26

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !27
  %5 = load i32, i32* %err, align 4, !dbg !27
  br label %if.end3, !dbg !27

if.end3:                                          ; preds = %if.end, %then1
  %6 = load i32, i32* %l, align 4, !dbg !28
  %7 = load i32, i32* %r, align 4, !dbg !28
  %8 = call i32 @sum(i32 %6, i32 %7), !dbg !28
  %9 = icmp ne i32 %8, 7, !dbg !28
  br i1 %9, label %then4, label %if.end6, !dbg !28

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !29
  %10 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end6, !dbg !29

if.end6:                                          ; preds = %if.end3, %then4
  %11 = call i32 @sum2(i32* %l, i32* %r), !dbg !30
  %12 = icmp ne i32 %11, 7, !dbg !30
  br i1 %12, label %then7, label %if.end9, !dbg !30

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !31
  %13 = load i32, i32* %err, align 4, !dbg !31
  br label %if.end9, !dbg !31

if.end9:                                          ; preds = %if.end6, %then7
  call void @sum3(i32 3, i32 4, i32* %i), !dbg !32
  %14 = load i32, i32* %i, align 4, !dbg !33
  %15 = icmp ne i32 %14, 7, !dbg !33
  br i1 %15, label %then10, label %if.end12, !dbg !33

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !34
  %16 = load i32, i32* %err, align 4, !dbg !34
  br label %if.end12, !dbg !34

if.end12:                                         ; preds = %if.end9, %then10
  %17 = load i32, i32* %l, align 4, !dbg !35
  %18 = load i32, i32* %r, align 4, !dbg !35
  call void @sum3(i32 %17, i32 %18, i32* %i), !dbg !35
  %19 = load i32, i32* %i, align 4, !dbg !36
  %20 = icmp ne i32 %19, 7, !dbg !36
  br i1 %20, label %then13, label %if.end15, !dbg !36

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !37
  %21 = load i32, i32* %err, align 4, !dbg !37
  br label %if.end15, !dbg !37

if.end15:                                         ; preds = %if.end12, %then13
  %22 = call i32 @sum(i32 1000000, i32 2000000), !dbg !38
  %23 = icmp ne i32 %22, 3000000, !dbg !38
  br i1 %23, label %then16, label %if.end18, !dbg !38

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !39
  %24 = load i32, i32* %err, align 4, !dbg !39
  br label %if.end18, !dbg !39

if.end18:                                         ; preds = %if.end15, %then16
  %25 = load i32, i32* %err, align 4, !dbg !40
  %26 = icmp eq i32 %25, 0, !dbg !40
  %. = select i1 %26, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @1, i32 0, i32 0), !dbg !41
  %27 = call i32 (i8*, ...) @printf(i8* %.), !dbg !41
  %28 = load i32, i32* %err, align 4, !dbg !42
  ret i32 %28, !dbg !42
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "8.function.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "sum", linkageName: "sum", scope: null, file: !1, line: 7, type: !3, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 6, column: 40, scope: !8)
!8 = distinct !DISubprogram(name: "sum3", linkageName: "sum3", scope: null, file: !1, line: 6, type: !9, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !5, !5, !12}
!11 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!13 = !DILocation(line: 7, column: 25, scope: !2)
!14 = distinct !DISubprogram(name: "sum2", linkageName: "sum2", scope: null, file: !1, line: 5, type: !15, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!15 = !DISubroutineType(types: !16)
!16 = !{!5, !12, !12}
!17 = !DILocation(line: 5, column: 28, scope: !14)
!18 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 9, type: !19, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!19 = !DISubroutineType(types: !20)
!20 = !{!5}
!21 = !DILocation(line: 10, column: 3, scope: !18)
!22 = !DILocation(line: 12, column: 3, scope: !18)
!23 = !DILocation(line: 13, column: 3, scope: !18)
!24 = !DILocation(line: 15, column: 3, scope: !18)
!25 = !DILocation(line: 15, column: 23, scope: !18)
!26 = !DILocation(line: 16, column: 3, scope: !18)
!27 = !DILocation(line: 16, column: 23, scope: !18)
!28 = !DILocation(line: 17, column: 3, scope: !18)
!29 = !DILocation(line: 17, column: 23, scope: !18)
!30 = !DILocation(line: 18, column: 3, scope: !18)
!31 = !DILocation(line: 18, column: 26, scope: !18)
!32 = !DILocation(line: 20, column: 3, scope: !18)
!33 = !DILocation(line: 21, column: 3, scope: !18)
!34 = !DILocation(line: 21, column: 15, scope: !18)
!35 = !DILocation(line: 22, column: 3, scope: !18)
!36 = !DILocation(line: 23, column: 3, scope: !18)
!37 = !DILocation(line: 23, column: 15, scope: !18)
!38 = !DILocation(line: 25, column: 3, scope: !18)
!39 = !DILocation(line: 25, column: 41, scope: !18)
!40 = !DILocation(line: 27, column: 3, scope: !18)
!41 = !DILocation(line: 0, scope: !18)
!42 = !DILocation(line: 32, column: 3, scope: !18)
!dbg attachment points at wrong subprogram for function
!2 = distinct !DISubprogram(name: "sum", linkageName: "sum", scope: null, file: !1, line: 7, type: !3, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
i32 (i32, i32)* @sum
  store i32 %0, i32* %l, align 4, !dbg !7
!7 = !DILocation(line: 6, column: 40, scope: !8)
!8 = distinct !DISubprogram(name: "sum3", linkageName: "sum3", scope: null, file: !1, line: 6, type: !9, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!8 = distinct !DISubprogram(name: "sum3", linkageName: "sum3", scope: null, file: !1, line: 6, type: !9, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
