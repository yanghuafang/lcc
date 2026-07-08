; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [18 x i8] c"23.return.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [18 x i8] c"23.return.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @checkAge1(i32 %0) !dbg !4 {
entry:
  %age = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %age, metadata !9, metadata !DIExpression()), !dbg !10
  store i32 %0, i32* %age, align 4, !dbg !10
  %1 = load i32, i32* %age, align 4, !dbg !11
  %2 = icmp slt i32 %1, 18, !dbg !11
  %3 = load i32, i32* %age, align 4, !dbg !12
  %4 = icmp eq i32 %3, 18, !dbg !11
  %5 = load i32, i32* %age, align 4, !dbg !11
  %6 = load i32, i32* %age, align 4, !dbg !11
  %spec.select = select i1 %4, i32 %5, i32 %6, !dbg !11
  %common.ret.op = select i1 %2, i32 %3, i32 %spec.select, !dbg !11
  ret i32 %common.ret.op, !dbg !12
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @checkAge2(i32 %0) !dbg !13 {
entry:
  %age = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %age, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 %0, i32* %age, align 4, !dbg !15
  %1 = load i32, i32* %age, align 4, !dbg !16
  %2 = icmp slt i32 %1, 18, !dbg !16
  %3 = load i32, i32* %age, align 4, !dbg !17
  %4 = load i32, i32* %age, align 4
  %spec.select = select i1 %2, i32 %3, i32 %4, !dbg !16
  ret i32 %spec.select, !dbg !17
}

define i32 @checkAge3(i32 %0) !dbg !18 {
entry:
  %age = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %age, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 %0, i32* %age, align 4, !dbg !20
  %1 = load i32, i32* %age, align 4, !dbg !21
  %2 = icmp sle i32 %1, 6, !dbg !21
  %3 = load i32, i32* %age, align 4, !dbg !22
  br i1 %2, label %common.ret, label %else, !dbg !21

common.ret:                                       ; preds = %else2, %else, %entry
  %common.ret.op = phi i32 [ %3, %entry ], [ %8, %else ], [ %spec.select, %else2 ]
  ret i32 %common.ret.op, !dbg !22

else:                                             ; preds = %entry
  %4 = icmp sgt i32 %3, 6, !dbg !23
  %5 = load i32, i32* %age, align 4, !dbg !23
  %6 = icmp sle i32 %5, 14, !dbg !23
  %7 = select i1 %4, i1 %6, i1 false, !dbg !23
  %8 = load i32, i32* %age, align 4, !dbg !22
  br i1 %7, label %common.ret, label %else2, !dbg !23

else2:                                            ; preds = %else
  %9 = icmp sgt i32 %8, 14, !dbg !24
  %10 = load i32, i32* %age, align 4, !dbg !24
  %11 = icmp sle i32 %10, 18, !dbg !24
  %12 = select i1 %9, i1 %11, i1 false, !dbg !24
  %13 = load i32, i32* %age, align 4, !dbg !22
  %14 = load i32, i32* %age, align 4
  %spec.select = select i1 %12, i32 %13, i32 %14, !dbg !24
  br label %common.ret, !dbg !24
}

define i32 @main() !dbg !25 {
entry:
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !28, metadata !DIExpression()), !dbg !29
  store i32 0, i32* %err, align 4, !dbg !29
  %0 = call i32 @checkAge1(i32 16), !dbg !30
  %1 = icmp ne i32 %0, 16, !dbg !30
  br i1 %1, label %then, label %if.end, !dbg !30

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !31
  %2 = load i32, i32* %err, align 4, !dbg !31
  br label %if.end, !dbg !31

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @checkAge1(i32 18), !dbg !32
  %4 = icmp ne i32 %3, 18, !dbg !32
  br i1 %4, label %then1, label %if.end3, !dbg !32

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !33
  %5 = load i32, i32* %err, align 4, !dbg !33
  br label %if.end3, !dbg !33

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @checkAge1(i32 20), !dbg !34
  %7 = icmp ne i32 %6, 20, !dbg !34
  br i1 %7, label %then4, label %if.end6, !dbg !34

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !35
  %8 = load i32, i32* %err, align 4, !dbg !35
  br label %if.end6, !dbg !35

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @checkAge2(i32 16), !dbg !36
  %10 = icmp ne i32 %9, 16, !dbg !36
  br i1 %10, label %then7, label %if.end9, !dbg !36

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !37
  %11 = load i32, i32* %err, align 4, !dbg !37
  br label %if.end9, !dbg !37

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @checkAge2(i32 18), !dbg !38
  %13 = icmp ne i32 %12, 18, !dbg !38
  br i1 %13, label %then10, label %if.end12, !dbg !38

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !39
  %14 = load i32, i32* %err, align 4, !dbg !39
  br label %if.end12, !dbg !39

if.end12:                                         ; preds = %if.end9, %then10
  %15 = call i32 @checkAge2(i32 20), !dbg !40
  %16 = icmp ne i32 %15, 20, !dbg !40
  br i1 %16, label %then13, label %if.end15, !dbg !40

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !41
  %17 = load i32, i32* %err, align 4, !dbg !41
  br label %if.end15, !dbg !41

if.end15:                                         ; preds = %if.end12, %then13
  %18 = call i32 @checkAge3(i32 6), !dbg !42
  %19 = icmp ne i32 %18, 6, !dbg !42
  br i1 %19, label %then16, label %if.end18, !dbg !42

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !43
  %20 = load i32, i32* %err, align 4, !dbg !43
  br label %if.end18, !dbg !43

if.end18:                                         ; preds = %if.end15, %then16
  %21 = call i32 @checkAge3(i32 35), !dbg !44
  %22 = icmp ne i32 %21, 35, !dbg !44
  br i1 %22, label %then19, label %if.end21, !dbg !44

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !45
  %23 = load i32, i32* %err, align 4, !dbg !45
  br label %if.end21, !dbg !45

if.end21:                                         ; preds = %if.end18, %then19
  %24 = load i32, i32* %err, align 4, !dbg !46
  %25 = icmp eq i32 %24, 0, !dbg !46
  %. = select i1 %25, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @1, i32 0, i32 0), !dbg !47
  %26 = call i32 (i8*, ...) @printf(i8* %.), !dbg !47
  %27 = load i32, i32* %err, align 4, !dbg !48
  ret i32 %27, !dbg !48
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "23.return.c", directory: "../tests")
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "checkAge1", linkageName: "checkAge1", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "age", arg: 1, scope: !4, file: !1, line: 3, type: !7)
!10 = !DILocation(line: 3, column: 5, scope: !4)
!11 = !DILocation(line: 4, column: 3, scope: !4)
!12 = !DILocation(line: 0, scope: !4)
!13 = distinct !DISubprogram(name: "checkAge2", linkageName: "checkAge2", scope: null, file: !1, line: 17, type: !5, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!14 = !DILocalVariable(name: "age", arg: 1, scope: !13, file: !1, line: 17, type: !7)
!15 = !DILocation(line: 17, column: 5, scope: !13)
!16 = !DILocation(line: 18, column: 3, scope: !13)
!17 = !DILocation(line: 0, scope: !13)
!18 = distinct !DISubprogram(name: "checkAge3", linkageName: "checkAge3", scope: null, file: !1, line: 27, type: !5, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!19 = !DILocalVariable(name: "age", arg: 1, scope: !18, file: !1, line: 27, type: !7)
!20 = !DILocation(line: 27, column: 5, scope: !18)
!21 = !DILocation(line: 28, column: 3, scope: !18)
!22 = !DILocation(line: 0, scope: !18)
!23 = !DILocation(line: 30, column: 10, scope: !18)
!24 = !DILocation(line: 32, column: 10, scope: !18)
!25 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 40, type: !26, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!26 = !DISubroutineType(types: !27)
!27 = !{!7}
!28 = !DILocalVariable(name: "err", scope: !25, file: !1, line: 41, type: !7)
!29 = !DILocation(line: 41, column: 3, scope: !25)
!30 = !DILocation(line: 43, column: 3, scope: !25)
!31 = !DILocation(line: 43, column: 28, scope: !25)
!32 = !DILocation(line: 44, column: 3, scope: !25)
!33 = !DILocation(line: 44, column: 28, scope: !25)
!34 = !DILocation(line: 45, column: 3, scope: !25)
!35 = !DILocation(line: 45, column: 28, scope: !25)
!36 = !DILocation(line: 46, column: 3, scope: !25)
!37 = !DILocation(line: 46, column: 28, scope: !25)
!38 = !DILocation(line: 47, column: 3, scope: !25)
!39 = !DILocation(line: 47, column: 28, scope: !25)
!40 = !DILocation(line: 48, column: 3, scope: !25)
!41 = !DILocation(line: 48, column: 28, scope: !25)
!42 = !DILocation(line: 49, column: 3, scope: !25)
!43 = !DILocation(line: 49, column: 26, scope: !25)
!44 = !DILocation(line: 50, column: 3, scope: !25)
!45 = !DILocation(line: 50, column: 28, scope: !25)
!46 = !DILocation(line: 52, column: 3, scope: !25)
!47 = !DILocation(line: 0, scope: !25)
!48 = !DILocation(line: 57, column: 3, scope: !25)
