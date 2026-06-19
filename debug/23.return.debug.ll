; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [18 x i8] c"23.return.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [18 x i8] c"23.return.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @checkAge1(i32 %0) !dbg !2 {
entry:
  %age = alloca i32, align 4
  store i32 %0, i32* %age, align 4
  %1 = load i32, i32* %age, align 4, !dbg !7
  %2 = icmp slt i32 %1, 18, !dbg !7
  %3 = load i32, i32* %age, align 4, !dbg !8
  %4 = icmp eq i32 %3, 18, !dbg !7
  %5 = load i32, i32* %age, align 4, !dbg !7
  %6 = load i32, i32* %age, align 4, !dbg !7
  %spec.select = select i1 %4, i32 %5, i32 %6, !dbg !7
  %common.ret.op = select i1 %2, i32 %3, i32 %spec.select, !dbg !7
  ret i32 %common.ret.op, !dbg !8
}

define i32 @checkAge2(i32 %0) !dbg !9 {
entry:
  %age = alloca i32, align 4
  store i32 %0, i32* %age, align 4, !dbg !10
  %1 = load i32, i32* %age, align 4, !dbg !11
  %2 = icmp slt i32 %1, 18, !dbg !11
  %3 = load i32, i32* %age, align 4, !dbg !12
  %4 = load i32, i32* %age, align 4
  %spec.select = select i1 %2, i32 %3, i32 %4, !dbg !11
  ret i32 %spec.select, !dbg !12
}

define i32 @checkAge3(i32 %0) !dbg !13 {
entry:
  %age = alloca i32, align 4
  store i32 %0, i32* %age, align 4, !dbg !14
  %1 = load i32, i32* %age, align 4, !dbg !15
  %2 = icmp sle i32 %1, 6, !dbg !15
  %3 = load i32, i32* %age, align 4, !dbg !16
  br i1 %2, label %common.ret, label %else, !dbg !15

common.ret:                                       ; preds = %else2, %else, %entry
  %common.ret.op = phi i32 [ %3, %entry ], [ %8, %else ], [ %spec.select, %else2 ]
  ret i32 %common.ret.op, !dbg !16

else:                                             ; preds = %entry
  %4 = icmp sgt i32 %3, 6, !dbg !17
  %5 = load i32, i32* %age, align 4, !dbg !17
  %6 = icmp sle i32 %5, 14, !dbg !17
  %7 = select i1 %4, i1 %6, i1 false, !dbg !17
  %8 = load i32, i32* %age, align 4, !dbg !16
  br i1 %7, label %common.ret, label %else2, !dbg !17

else2:                                            ; preds = %else
  %9 = icmp sgt i32 %8, 14, !dbg !18
  %10 = load i32, i32* %age, align 4, !dbg !18
  %11 = icmp sle i32 %10, 18, !dbg !18
  %12 = select i1 %9, i1 %11, i1 false, !dbg !18
  %13 = load i32, i32* %age, align 4, !dbg !16
  %14 = load i32, i32* %age, align 4
  %spec.select = select i1 %12, i32 %13, i32 %14, !dbg !18
  br label %common.ret, !dbg !18
}

define i32 @main() !dbg !19 {
entry:
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !22
  %0 = call i32 @checkAge1(i32 16), !dbg !23
  %1 = icmp ne i32 %0, 16, !dbg !23
  br i1 %1, label %then, label %if.end, !dbg !23

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !24
  %2 = load i32, i32* %err, align 4, !dbg !24
  br label %if.end, !dbg !24

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @checkAge1(i32 18), !dbg !25
  %4 = icmp ne i32 %3, 18, !dbg !25
  br i1 %4, label %then1, label %if.end3, !dbg !25

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !26
  %5 = load i32, i32* %err, align 4, !dbg !26
  br label %if.end3, !dbg !26

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @checkAge1(i32 20), !dbg !27
  %7 = icmp ne i32 %6, 20, !dbg !27
  br i1 %7, label %then4, label %if.end6, !dbg !27

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !28
  %8 = load i32, i32* %err, align 4, !dbg !28
  br label %if.end6, !dbg !28

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @checkAge2(i32 16), !dbg !29
  %10 = icmp ne i32 %9, 16, !dbg !29
  br i1 %10, label %then7, label %if.end9, !dbg !29

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !30
  %11 = load i32, i32* %err, align 4, !dbg !30
  br label %if.end9, !dbg !30

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @checkAge2(i32 18), !dbg !31
  %13 = icmp ne i32 %12, 18, !dbg !31
  br i1 %13, label %then10, label %if.end12, !dbg !31

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !32
  %14 = load i32, i32* %err, align 4, !dbg !32
  br label %if.end12, !dbg !32

if.end12:                                         ; preds = %if.end9, %then10
  %15 = call i32 @checkAge2(i32 20), !dbg !33
  %16 = icmp ne i32 %15, 20, !dbg !33
  br i1 %16, label %then13, label %if.end15, !dbg !33

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !34
  %17 = load i32, i32* %err, align 4, !dbg !34
  br label %if.end15, !dbg !34

if.end15:                                         ; preds = %if.end12, %then13
  %18 = call i32 @checkAge3(i32 6), !dbg !35
  %19 = icmp ne i32 %18, 6, !dbg !35
  br i1 %19, label %then16, label %if.end18, !dbg !35

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !36
  %20 = load i32, i32* %err, align 4, !dbg !36
  br label %if.end18, !dbg !36

if.end18:                                         ; preds = %if.end15, %then16
  %21 = call i32 @checkAge3(i32 35), !dbg !37
  %22 = icmp ne i32 %21, 35, !dbg !37
  br i1 %22, label %then19, label %if.end21, !dbg !37

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !38
  %23 = load i32, i32* %err, align 4, !dbg !38
  br label %if.end21, !dbg !38

if.end21:                                         ; preds = %if.end18, %then19
  %24 = load i32, i32* %err, align 4, !dbg !39
  %25 = icmp eq i32 %24, 0, !dbg !39
  %. = select i1 %25, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @1, i32 0, i32 0), !dbg !40
  %26 = call i32 (i8*, ...) @printf(i8* %.), !dbg !40
  %27 = load i32, i32* %err, align 4, !dbg !41
  ret i32 %27, !dbg !41
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "23.return.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "checkAge1", linkageName: "checkAge1", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 4, column: 3, scope: !2)
!8 = !DILocation(line: 0, scope: !2)
!9 = distinct !DISubprogram(name: "checkAge2", linkageName: "checkAge2", scope: null, file: !1, line: 17, type: !3, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!10 = !DILocation(line: 14, column: 3, scope: !2)
!11 = !DILocation(line: 18, column: 3, scope: !9)
!12 = !DILocation(line: 0, scope: !9)
!13 = distinct !DISubprogram(name: "checkAge3", linkageName: "checkAge3", scope: null, file: !1, line: 27, type: !3, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!14 = !DILocation(line: 23, column: 5, scope: !9)
!15 = !DILocation(line: 28, column: 3, scope: !13)
!16 = !DILocation(line: 0, scope: !13)
!17 = !DILocation(line: 30, column: 10, scope: !13)
!18 = !DILocation(line: 32, column: 10, scope: !13)
!19 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 40, type: !20, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!20 = !DISubroutineType(types: !21)
!21 = !{!5}
!22 = !DILocation(line: 41, column: 3, scope: !19)
!23 = !DILocation(line: 43, column: 3, scope: !19)
!24 = !DILocation(line: 43, column: 28, scope: !19)
!25 = !DILocation(line: 44, column: 3, scope: !19)
!26 = !DILocation(line: 44, column: 28, scope: !19)
!27 = !DILocation(line: 45, column: 3, scope: !19)
!28 = !DILocation(line: 45, column: 28, scope: !19)
!29 = !DILocation(line: 46, column: 3, scope: !19)
!30 = !DILocation(line: 46, column: 28, scope: !19)
!31 = !DILocation(line: 47, column: 3, scope: !19)
!32 = !DILocation(line: 47, column: 28, scope: !19)
!33 = !DILocation(line: 48, column: 3, scope: !19)
!34 = !DILocation(line: 48, column: 28, scope: !19)
!35 = !DILocation(line: 49, column: 3, scope: !19)
!36 = !DILocation(line: 49, column: 26, scope: !19)
!37 = !DILocation(line: 50, column: 3, scope: !19)
!38 = !DILocation(line: 50, column: 28, scope: !19)
!39 = !DILocation(line: 52, column: 3, scope: !19)
!40 = !DILocation(line: 0, scope: !19)
!41 = !DILocation(line: 57, column: 3, scope: !19)
!dbg attachment points at wrong subprogram for function
!9 = distinct !DISubprogram(name: "checkAge2", linkageName: "checkAge2", scope: null, file: !1, line: 17, type: !3, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
i32 (i32)* @checkAge2
  store i32 %0, i32* %age, align 4, !dbg !10
!10 = !DILocation(line: 14, column: 3, scope: !2)
!2 = distinct !DISubprogram(name: "checkAge1", linkageName: "checkAge1", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!2 = distinct !DISubprogram(name: "checkAge1", linkageName: "checkAge1", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
