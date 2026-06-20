; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [18 x i8] c"23.return.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [18 x i8] c"23.return.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @checkAge1(i32 %0) !dbg !2 {
entry:
  %age = alloca i32, align 4
    #dbg_declare(ptr %age, !7, !DIExpression(), !8)
  store i32 %0, ptr %age, align 4, !dbg !8
  %1 = load i32, ptr %age, align 4, !dbg !9
  ret i32 %1, !dbg !9
}

define i32 @checkAge2(i32 %0) !dbg !10 {
entry:
  %age = alloca i32, align 4
    #dbg_declare(ptr %age, !11, !DIExpression(), !12)
  store i32 %0, ptr %age, align 4, !dbg !12
  %1 = load i32, ptr %age, align 4, !dbg !13
  %2 = icmp slt i32 %1, 18, !dbg !13
  %3 = load i32, ptr %age, align 4, !dbg !14
  %4 = load i32, ptr %age, align 4
  %spec.select = select i1 %2, i32 %3, i32 %4, !dbg !13
  ret i32 %spec.select, !dbg !14
}

define i32 @checkAge3(i32 %0) !dbg !15 {
entry:
  %age = alloca i32, align 4
    #dbg_declare(ptr %age, !16, !DIExpression(), !17)
  store i32 %0, ptr %age, align 4, !dbg !17
  %1 = load i32, ptr %age, align 4, !dbg !18
  %2 = icmp sle i32 %1, 6, !dbg !18
  %3 = load i32, ptr %age, align 4, !dbg !19
  br i1 %2, label %common.ret, label %else, !dbg !18

common.ret:                                       ; preds = %else2, %else, %entry
  %common.ret.op = phi i32 [ %3, %entry ], [ %8, %else ], [ %spec.select, %else2 ]
  ret i32 %common.ret.op, !dbg !19

else:                                             ; preds = %entry
  %4 = icmp sgt i32 %3, 6, !dbg !20
  %5 = load i32, ptr %age, align 4, !dbg !20
  %6 = icmp sle i32 %5, 14, !dbg !20
  %7 = select i1 %4, i1 %6, i1 false, !dbg !20
  %8 = load i32, ptr %age, align 4, !dbg !19
  br i1 %7, label %common.ret, label %else2, !dbg !20

else2:                                            ; preds = %else
  %9 = icmp sgt i32 %8, 14, !dbg !21
  %10 = load i32, ptr %age, align 4, !dbg !21
  %11 = icmp sle i32 %10, 18, !dbg !21
  %12 = select i1 %9, i1 %11, i1 false, !dbg !21
  %13 = load i32, ptr %age, align 4, !dbg !19
  %14 = load i32, ptr %age, align 4
  %spec.select = select i1 %12, i32 %13, i32 %14, !dbg !21
  br label %common.ret, !dbg !21
}

define i32 @main() !dbg !22 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !25, !DIExpression(), !26)
  store i32 0, ptr %err, align 4, !dbg !26
  %0 = call i32 @checkAge1(i32 16), !dbg !27
  %1 = icmp ne i32 %0, 16, !dbg !27
  br i1 %1, label %then, label %if.end, !dbg !27

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !28
  %2 = load i32, ptr %err, align 4, !dbg !28
  br label %if.end, !dbg !28

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @checkAge1(i32 18), !dbg !29
  %4 = icmp ne i32 %3, 18, !dbg !29
  br i1 %4, label %then1, label %if.end3, !dbg !29

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !30
  %5 = load i32, ptr %err, align 4, !dbg !30
  br label %if.end3, !dbg !30

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @checkAge1(i32 20), !dbg !31
  %7 = icmp ne i32 %6, 20, !dbg !31
  br i1 %7, label %then4, label %if.end6, !dbg !31

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !32
  %8 = load i32, ptr %err, align 4, !dbg !32
  br label %if.end6, !dbg !32

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @checkAge2(i32 16), !dbg !33
  %10 = icmp ne i32 %9, 16, !dbg !33
  br i1 %10, label %then7, label %if.end9, !dbg !33

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !34
  %11 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end9, !dbg !34

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @checkAge2(i32 18), !dbg !35
  %13 = icmp ne i32 %12, 18, !dbg !35
  br i1 %13, label %then10, label %if.end12, !dbg !35

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !36
  %14 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end12, !dbg !36

if.end12:                                         ; preds = %if.end9, %then10
  %15 = call i32 @checkAge2(i32 20), !dbg !37
  %16 = icmp ne i32 %15, 20, !dbg !37
  br i1 %16, label %then13, label %if.end15, !dbg !37

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !38
  %17 = load i32, ptr %err, align 4, !dbg !38
  br label %if.end15, !dbg !38

if.end15:                                         ; preds = %if.end12, %then13
  %18 = call i32 @checkAge3(i32 6), !dbg !39
  %19 = icmp ne i32 %18, 6, !dbg !39
  br i1 %19, label %then16, label %if.end18, !dbg !39

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !40
  %20 = load i32, ptr %err, align 4, !dbg !40
  br label %if.end18, !dbg !40

if.end18:                                         ; preds = %if.end15, %then16
  %21 = call i32 @checkAge3(i32 35), !dbg !41
  %22 = icmp ne i32 %21, 35, !dbg !41
  br i1 %22, label %then19, label %if.end21, !dbg !41

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !42
  %23 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end21, !dbg !42

if.end21:                                         ; preds = %if.end18, %then19
  %24 = load i32, ptr %err, align 4, !dbg !43
  %25 = icmp eq i32 %24, 0, !dbg !43
  %. = select i1 %25, ptr @0, ptr @1, !dbg !44
  %26 = call i32 (ptr, ...) @printf(ptr %.), !dbg !44
  %27 = load i32, ptr %err, align 4, !dbg !45
  ret i32 %27, !dbg !45
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "23.return.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "checkAge1", linkageName: "checkAge1", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "age", arg: 1, scope: !2, file: !1, line: 3, type: !5)
!8 = !DILocation(line: 3, column: 5, scope: !2)
!9 = !DILocation(line: 0, scope: !2)
!10 = distinct !DISubprogram(name: "checkAge2", linkageName: "checkAge2", scope: null, file: !1, line: 17, type: !3, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!11 = !DILocalVariable(name: "age", arg: 1, scope: !10, file: !1, line: 17, type: !5)
!12 = !DILocation(line: 17, column: 5, scope: !10)
!13 = !DILocation(line: 18, column: 3, scope: !10)
!14 = !DILocation(line: 0, scope: !10)
!15 = distinct !DISubprogram(name: "checkAge3", linkageName: "checkAge3", scope: null, file: !1, line: 27, type: !3, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!16 = !DILocalVariable(name: "age", arg: 1, scope: !15, file: !1, line: 27, type: !5)
!17 = !DILocation(line: 27, column: 5, scope: !15)
!18 = !DILocation(line: 28, column: 3, scope: !15)
!19 = !DILocation(line: 0, scope: !15)
!20 = !DILocation(line: 30, column: 10, scope: !15)
!21 = !DILocation(line: 32, column: 10, scope: !15)
!22 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 40, type: !23, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!23 = !DISubroutineType(types: !24)
!24 = !{!5}
!25 = !DILocalVariable(name: "err", scope: !22, file: !1, line: 41, type: !5)
!26 = !DILocation(line: 41, column: 3, scope: !22)
!27 = !DILocation(line: 43, column: 3, scope: !22)
!28 = !DILocation(line: 43, column: 28, scope: !22)
!29 = !DILocation(line: 44, column: 3, scope: !22)
!30 = !DILocation(line: 44, column: 28, scope: !22)
!31 = !DILocation(line: 45, column: 3, scope: !22)
!32 = !DILocation(line: 45, column: 28, scope: !22)
!33 = !DILocation(line: 46, column: 3, scope: !22)
!34 = !DILocation(line: 46, column: 28, scope: !22)
!35 = !DILocation(line: 47, column: 3, scope: !22)
!36 = !DILocation(line: 47, column: 28, scope: !22)
!37 = !DILocation(line: 48, column: 3, scope: !22)
!38 = !DILocation(line: 48, column: 28, scope: !22)
!39 = !DILocation(line: 49, column: 3, scope: !22)
!40 = !DILocation(line: 49, column: 26, scope: !22)
!41 = !DILocation(line: 50, column: 3, scope: !22)
!42 = !DILocation(line: 50, column: 28, scope: !22)
!43 = !DILocation(line: 52, column: 3, scope: !22)
!44 = !DILocation(line: 0, scope: !22)
!45 = !DILocation(line: 57, column: 3, scope: !22)
