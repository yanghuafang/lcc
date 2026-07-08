; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [18 x i8] c"23.return.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [18 x i8] c"23.return.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @checkAge1(i32 %0) !dbg !4 {
entry:
  %age = alloca i32, align 4
    #dbg_declare(ptr %age, !9, !DIExpression(), !10)
  store i32 %0, ptr %age, align 4, !dbg !10
  %1 = load i32, ptr %age, align 4, !dbg !11
  ret i32 %1, !dbg !11
}

define i32 @checkAge2(i32 %0) !dbg !12 {
entry:
  %age = alloca i32, align 4
    #dbg_declare(ptr %age, !13, !DIExpression(), !14)
  store i32 %0, ptr %age, align 4, !dbg !14
  %1 = load i32, ptr %age, align 4, !dbg !15
  %2 = icmp slt i32 %1, 18, !dbg !15
  %3 = load i32, ptr %age, align 4, !dbg !16
  %4 = load i32, ptr %age, align 4
  %spec.select = select i1 %2, i32 %3, i32 %4, !dbg !15
  ret i32 %spec.select, !dbg !16
}

define i32 @checkAge3(i32 %0) !dbg !17 {
entry:
  %age = alloca i32, align 4
    #dbg_declare(ptr %age, !18, !DIExpression(), !19)
  store i32 %0, ptr %age, align 4, !dbg !19
  %1 = load i32, ptr %age, align 4, !dbg !20
  %2 = icmp sle i32 %1, 6, !dbg !20
  %3 = load i32, ptr %age, align 4, !dbg !21
  br i1 %2, label %common.ret, label %else, !dbg !20

common.ret:                                       ; preds = %else2, %else, %entry
  %common.ret.op = phi i32 [ %3, %entry ], [ %8, %else ], [ %spec.select, %else2 ]
  ret i32 %common.ret.op, !dbg !21

else:                                             ; preds = %entry
  %4 = icmp sgt i32 %3, 6, !dbg !22
  %5 = load i32, ptr %age, align 4, !dbg !22
  %6 = icmp sle i32 %5, 14, !dbg !22
  %7 = select i1 %4, i1 %6, i1 false, !dbg !22
  %8 = load i32, ptr %age, align 4, !dbg !21
  br i1 %7, label %common.ret, label %else2, !dbg !22

else2:                                            ; preds = %else
  %9 = icmp sgt i32 %8, 14, !dbg !23
  %10 = load i32, ptr %age, align 4, !dbg !23
  %11 = icmp sle i32 %10, 18, !dbg !23
  %12 = select i1 %9, i1 %11, i1 false, !dbg !23
  %13 = load i32, ptr %age, align 4, !dbg !21
  %14 = load i32, ptr %age, align 4
  %spec.select = select i1 %12, i32 %13, i32 %14, !dbg !23
  br label %common.ret, !dbg !23
}

define i32 @main() !dbg !24 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !27, !DIExpression(), !28)
  store i32 0, ptr %err, align 4, !dbg !28
  %0 = call i32 @checkAge1(i32 16), !dbg !29
  %1 = icmp ne i32 %0, 16, !dbg !29
  br i1 %1, label %then, label %if.end, !dbg !29

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !30
  %2 = load i32, ptr %err, align 4, !dbg !30
  br label %if.end, !dbg !30

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @checkAge1(i32 18), !dbg !31
  %4 = icmp ne i32 %3, 18, !dbg !31
  br i1 %4, label %then1, label %if.end3, !dbg !31

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !32
  %5 = load i32, ptr %err, align 4, !dbg !32
  br label %if.end3, !dbg !32

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @checkAge1(i32 20), !dbg !33
  %7 = icmp ne i32 %6, 20, !dbg !33
  br i1 %7, label %then4, label %if.end6, !dbg !33

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !34
  %8 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end6, !dbg !34

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @checkAge2(i32 16), !dbg !35
  %10 = icmp ne i32 %9, 16, !dbg !35
  br i1 %10, label %then7, label %if.end9, !dbg !35

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !36
  %11 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end9, !dbg !36

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @checkAge2(i32 18), !dbg !37
  %13 = icmp ne i32 %12, 18, !dbg !37
  br i1 %13, label %then10, label %if.end12, !dbg !37

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !38
  %14 = load i32, ptr %err, align 4, !dbg !38
  br label %if.end12, !dbg !38

if.end12:                                         ; preds = %if.end9, %then10
  %15 = call i32 @checkAge2(i32 20), !dbg !39
  %16 = icmp ne i32 %15, 20, !dbg !39
  br i1 %16, label %then13, label %if.end15, !dbg !39

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !40
  %17 = load i32, ptr %err, align 4, !dbg !40
  br label %if.end15, !dbg !40

if.end15:                                         ; preds = %if.end12, %then13
  %18 = call i32 @checkAge3(i32 6), !dbg !41
  %19 = icmp ne i32 %18, 6, !dbg !41
  br i1 %19, label %then16, label %if.end18, !dbg !41

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !42
  %20 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end18, !dbg !42

if.end18:                                         ; preds = %if.end15, %then16
  %21 = call i32 @checkAge3(i32 35), !dbg !43
  %22 = icmp ne i32 %21, 35, !dbg !43
  br i1 %22, label %then19, label %if.end21, !dbg !43

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !44
  %23 = load i32, ptr %err, align 4, !dbg !44
  br label %if.end21, !dbg !44

if.end21:                                         ; preds = %if.end18, %then19
  %24 = load i32, ptr %err, align 4, !dbg !45
  %25 = icmp eq i32 %24, 0, !dbg !45
  %. = select i1 %25, ptr @0, ptr @1, !dbg !46
  %26 = call i32 (ptr, ...) @printf(ptr %.), !dbg !46
  %27 = load i32, ptr %err, align 4, !dbg !47
  ret i32 %27, !dbg !47
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "23.return.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "checkAge1", linkageName: "checkAge1", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "age", arg: 1, scope: !4, file: !1, line: 3, type: !7)
!10 = !DILocation(line: 3, column: 5, scope: !4)
!11 = !DILocation(line: 0, scope: !4)
!12 = distinct !DISubprogram(name: "checkAge2", linkageName: "checkAge2", scope: null, file: !1, line: 17, type: !5, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!13 = !DILocalVariable(name: "age", arg: 1, scope: !12, file: !1, line: 17, type: !7)
!14 = !DILocation(line: 17, column: 5, scope: !12)
!15 = !DILocation(line: 18, column: 3, scope: !12)
!16 = !DILocation(line: 0, scope: !12)
!17 = distinct !DISubprogram(name: "checkAge3", linkageName: "checkAge3", scope: null, file: !1, line: 27, type: !5, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!18 = !DILocalVariable(name: "age", arg: 1, scope: !17, file: !1, line: 27, type: !7)
!19 = !DILocation(line: 27, column: 5, scope: !17)
!20 = !DILocation(line: 28, column: 3, scope: !17)
!21 = !DILocation(line: 0, scope: !17)
!22 = !DILocation(line: 30, column: 10, scope: !17)
!23 = !DILocation(line: 32, column: 10, scope: !17)
!24 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 40, type: !25, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!25 = !DISubroutineType(types: !26)
!26 = !{!7}
!27 = !DILocalVariable(name: "err", scope: !24, file: !1, line: 41, type: !7)
!28 = !DILocation(line: 41, column: 3, scope: !24)
!29 = !DILocation(line: 43, column: 3, scope: !24)
!30 = !DILocation(line: 43, column: 28, scope: !24)
!31 = !DILocation(line: 44, column: 3, scope: !24)
!32 = !DILocation(line: 44, column: 28, scope: !24)
!33 = !DILocation(line: 45, column: 3, scope: !24)
!34 = !DILocation(line: 45, column: 28, scope: !24)
!35 = !DILocation(line: 46, column: 3, scope: !24)
!36 = !DILocation(line: 46, column: 28, scope: !24)
!37 = !DILocation(line: 47, column: 3, scope: !24)
!38 = !DILocation(line: 47, column: 28, scope: !24)
!39 = !DILocation(line: 48, column: 3, scope: !24)
!40 = !DILocation(line: 48, column: 28, scope: !24)
!41 = !DILocation(line: 49, column: 3, scope: !24)
!42 = !DILocation(line: 49, column: 26, scope: !24)
!43 = !DILocation(line: 50, column: 3, scope: !24)
!44 = !DILocation(line: 50, column: 28, scope: !24)
!45 = !DILocation(line: 52, column: 3, scope: !24)
!46 = !DILocation(line: 0, scope: !24)
!47 = !DILocation(line: 57, column: 3, scope: !24)
