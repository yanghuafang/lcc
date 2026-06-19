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
  call void @llvm.dbg.declare(metadata i32* %age, metadata !7, metadata !DIExpression()), !dbg !8
  store i32 %0, i32* %age, align 4, !dbg !8
  %1 = load i32, i32* %age, align 4, !dbg !9
  %2 = icmp slt i32 %1, 18, !dbg !9
  %3 = load i32, i32* %age, align 4, !dbg !10
  %4 = icmp eq i32 %3, 18, !dbg !9
  %5 = load i32, i32* %age, align 4, !dbg !9
  %6 = load i32, i32* %age, align 4, !dbg !9
  %spec.select = select i1 %4, i32 %5, i32 %6, !dbg !9
  %common.ret.op = select i1 %2, i32 %3, i32 %spec.select, !dbg !9
  ret i32 %common.ret.op, !dbg !10
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @checkAge2(i32 %0) !dbg !11 {
entry:
  %age = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %age, metadata !12, metadata !DIExpression()), !dbg !13
  store i32 %0, i32* %age, align 4, !dbg !13
  %1 = load i32, i32* %age, align 4, !dbg !14
  %2 = icmp slt i32 %1, 18, !dbg !14
  %3 = load i32, i32* %age, align 4, !dbg !15
  %4 = load i32, i32* %age, align 4
  %spec.select = select i1 %2, i32 %3, i32 %4, !dbg !14
  ret i32 %spec.select, !dbg !15
}

define i32 @checkAge3(i32 %0) !dbg !16 {
entry:
  %age = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %age, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 %0, i32* %age, align 4, !dbg !18
  %1 = load i32, i32* %age, align 4, !dbg !19
  %2 = icmp sle i32 %1, 6, !dbg !19
  %3 = load i32, i32* %age, align 4, !dbg !20
  br i1 %2, label %common.ret, label %else, !dbg !19

common.ret:                                       ; preds = %else2, %else, %entry
  %common.ret.op = phi i32 [ %3, %entry ], [ %8, %else ], [ %spec.select, %else2 ]
  ret i32 %common.ret.op, !dbg !20

else:                                             ; preds = %entry
  %4 = icmp sgt i32 %3, 6, !dbg !21
  %5 = load i32, i32* %age, align 4, !dbg !21
  %6 = icmp sle i32 %5, 14, !dbg !21
  %7 = select i1 %4, i1 %6, i1 false, !dbg !21
  %8 = load i32, i32* %age, align 4, !dbg !20
  br i1 %7, label %common.ret, label %else2, !dbg !21

else2:                                            ; preds = %else
  %9 = icmp sgt i32 %8, 14, !dbg !22
  %10 = load i32, i32* %age, align 4, !dbg !22
  %11 = icmp sle i32 %10, 18, !dbg !22
  %12 = select i1 %9, i1 %11, i1 false, !dbg !22
  %13 = load i32, i32* %age, align 4, !dbg !20
  %14 = load i32, i32* %age, align 4
  %spec.select = select i1 %12, i32 %13, i32 %14, !dbg !22
  br label %common.ret, !dbg !22
}

define i32 @main() !dbg !23 {
entry:
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !26, metadata !DIExpression()), !dbg !27
  store i32 0, i32* %err, align 4, !dbg !27
  %0 = call i32 @checkAge1(i32 16), !dbg !28
  %1 = icmp ne i32 %0, 16, !dbg !28
  br i1 %1, label %then, label %if.end, !dbg !28

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !29
  %2 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end, !dbg !29

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @checkAge1(i32 18), !dbg !30
  %4 = icmp ne i32 %3, 18, !dbg !30
  br i1 %4, label %then1, label %if.end3, !dbg !30

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !31
  %5 = load i32, i32* %err, align 4, !dbg !31
  br label %if.end3, !dbg !31

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @checkAge1(i32 20), !dbg !32
  %7 = icmp ne i32 %6, 20, !dbg !32
  br i1 %7, label %then4, label %if.end6, !dbg !32

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !33
  %8 = load i32, i32* %err, align 4, !dbg !33
  br label %if.end6, !dbg !33

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @checkAge2(i32 16), !dbg !34
  %10 = icmp ne i32 %9, 16, !dbg !34
  br i1 %10, label %then7, label %if.end9, !dbg !34

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !35
  %11 = load i32, i32* %err, align 4, !dbg !35
  br label %if.end9, !dbg !35

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @checkAge2(i32 18), !dbg !36
  %13 = icmp ne i32 %12, 18, !dbg !36
  br i1 %13, label %then10, label %if.end12, !dbg !36

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !37
  %14 = load i32, i32* %err, align 4, !dbg !37
  br label %if.end12, !dbg !37

if.end12:                                         ; preds = %if.end9, %then10
  %15 = call i32 @checkAge2(i32 20), !dbg !38
  %16 = icmp ne i32 %15, 20, !dbg !38
  br i1 %16, label %then13, label %if.end15, !dbg !38

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !39
  %17 = load i32, i32* %err, align 4, !dbg !39
  br label %if.end15, !dbg !39

if.end15:                                         ; preds = %if.end12, %then13
  %18 = call i32 @checkAge3(i32 6), !dbg !40
  %19 = icmp ne i32 %18, 6, !dbg !40
  br i1 %19, label %then16, label %if.end18, !dbg !40

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !41
  %20 = load i32, i32* %err, align 4, !dbg !41
  br label %if.end18, !dbg !41

if.end18:                                         ; preds = %if.end15, %then16
  %21 = call i32 @checkAge3(i32 35), !dbg !42
  %22 = icmp ne i32 %21, 35, !dbg !42
  br i1 %22, label %then19, label %if.end21, !dbg !42

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !43
  %23 = load i32, i32* %err, align 4, !dbg !43
  br label %if.end21, !dbg !43

if.end21:                                         ; preds = %if.end18, %then19
  %24 = load i32, i32* %err, align 4, !dbg !44
  %25 = icmp eq i32 %24, 0, !dbg !44
  %. = select i1 %25, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @1, i32 0, i32 0), !dbg !45
  %26 = call i32 (i8*, ...) @printf(i8* %.), !dbg !45
  %27 = load i32, i32* %err, align 4, !dbg !46
  ret i32 %27, !dbg !46
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

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
!9 = !DILocation(line: 4, column: 3, scope: !2)
!10 = !DILocation(line: 0, scope: !2)
!11 = distinct !DISubprogram(name: "checkAge2", linkageName: "checkAge2", scope: null, file: !1, line: 17, type: !3, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!12 = !DILocalVariable(name: "age", arg: 1, scope: !11, file: !1, line: 17, type: !5)
!13 = !DILocation(line: 17, column: 5, scope: !11)
!14 = !DILocation(line: 18, column: 3, scope: !11)
!15 = !DILocation(line: 0, scope: !11)
!16 = distinct !DISubprogram(name: "checkAge3", linkageName: "checkAge3", scope: null, file: !1, line: 27, type: !3, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!17 = !DILocalVariable(name: "age", arg: 1, scope: !16, file: !1, line: 27, type: !5)
!18 = !DILocation(line: 27, column: 5, scope: !16)
!19 = !DILocation(line: 28, column: 3, scope: !16)
!20 = !DILocation(line: 0, scope: !16)
!21 = !DILocation(line: 30, column: 10, scope: !16)
!22 = !DILocation(line: 32, column: 10, scope: !16)
!23 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 40, type: !24, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!24 = !DISubroutineType(types: !25)
!25 = !{!5}
!26 = !DILocalVariable(name: "err", scope: !23, file: !1, line: 41, type: !5)
!27 = !DILocation(line: 41, column: 3, scope: !23)
!28 = !DILocation(line: 43, column: 3, scope: !23)
!29 = !DILocation(line: 43, column: 28, scope: !23)
!30 = !DILocation(line: 44, column: 3, scope: !23)
!31 = !DILocation(line: 44, column: 28, scope: !23)
!32 = !DILocation(line: 45, column: 3, scope: !23)
!33 = !DILocation(line: 45, column: 28, scope: !23)
!34 = !DILocation(line: 46, column: 3, scope: !23)
!35 = !DILocation(line: 46, column: 28, scope: !23)
!36 = !DILocation(line: 47, column: 3, scope: !23)
!37 = !DILocation(line: 47, column: 28, scope: !23)
!38 = !DILocation(line: 48, column: 3, scope: !23)
!39 = !DILocation(line: 48, column: 28, scope: !23)
!40 = !DILocation(line: 49, column: 3, scope: !23)
!41 = !DILocation(line: 49, column: 26, scope: !23)
!42 = !DILocation(line: 50, column: 3, scope: !23)
!43 = !DILocation(line: 50, column: 28, scope: !23)
!44 = !DILocation(line: 52, column: 3, scope: !23)
!45 = !DILocation(line: 0, scope: !23)
!46 = !DILocation(line: 57, column: 3, scope: !23)
