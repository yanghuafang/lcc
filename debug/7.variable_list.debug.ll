; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [24 x i8] c"7.variable_list.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"7.variable_list.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !4 {
entry:
  %h = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %h, metadata !9, metadata !DIExpression()), !dbg !10
  %g = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %g, metadata !11, metadata !DIExpression()), !dbg !10
  %f = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %f, metadata !12, metadata !DIExpression()), !dbg !13
  %e = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %e, metadata !14, metadata !DIExpression()), !dbg !15
  %d = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %d, metadata !16, metadata !DIExpression()), !dbg !15
  %c = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %c, metadata !17, metadata !DIExpression()), !dbg !18
  %b = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %b, metadata !19, metadata !DIExpression()), !dbg !18
  %a = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !20, metadata !DIExpression()), !dbg !18
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 0, i32* %err, align 4, !dbg !22
  store i32 1, i32* %b, align 4, !dbg !18
  store i32 2, i32* %c, align 4, !dbg !18
  store i32 3, i32* %d, align 4, !dbg !15
  store i32 0, i32* %a, align 4, !dbg !23
  %0 = load i32, i32* %a, align 4, !dbg !23
  store i32 4, i32* %e, align 4, !dbg !24
  %1 = load i32, i32* %e, align 4, !dbg !24
  store i32 5, i32* %f, align 4, !dbg !25
  %2 = load i32, i32* %f, align 4, !dbg !25
  store i32 6, i32* %g, align 4, !dbg !26
  %3 = load i32, i32* %g, align 4, !dbg !26
  store i32 7, i32* %h, align 4, !dbg !27
  %4 = load i32, i32* %h, align 4, !dbg !27
  %5 = load i32, i32* %a, align 4, !dbg !28
  %6 = icmp ne i32 %5, 0, !dbg !28
  br i1 %6, label %then, label %if.end, !dbg !28

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !29
  %7 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end, !dbg !29

if.end:                                           ; preds = %entry, %then
  %8 = load i32, i32* %b, align 4, !dbg !30
  %9 = icmp ne i32 %8, 1, !dbg !30
  br i1 %9, label %then1, label %if.end3, !dbg !30

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !31
  %10 = load i32, i32* %err, align 4, !dbg !31
  br label %if.end3, !dbg !31

if.end3:                                          ; preds = %if.end, %then1
  %11 = load i32, i32* %c, align 4, !dbg !32
  %12 = icmp ne i32 %11, 2, !dbg !32
  br i1 %12, label %then4, label %if.end6, !dbg !32

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !33
  %13 = load i32, i32* %err, align 4, !dbg !33
  br label %if.end6, !dbg !33

if.end6:                                          ; preds = %if.end3, %then4
  %14 = load i32, i32* %d, align 4, !dbg !34
  %15 = icmp ne i32 %14, 3, !dbg !34
  br i1 %15, label %then7, label %if.end9, !dbg !34

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !35
  %16 = load i32, i32* %err, align 4, !dbg !35
  br label %if.end9, !dbg !35

if.end9:                                          ; preds = %if.end6, %then7
  %17 = load i32, i32* %e, align 4, !dbg !36
  %18 = icmp ne i32 %17, 4, !dbg !36
  br i1 %18, label %then10, label %if.end12, !dbg !36

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !37
  %19 = load i32, i32* %err, align 4, !dbg !37
  br label %if.end12, !dbg !37

if.end12:                                         ; preds = %if.end9, %then10
  %20 = load i32, i32* %f, align 4, !dbg !38
  %21 = icmp ne i32 %20, 5, !dbg !38
  br i1 %21, label %then13, label %if.end15, !dbg !38

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !39
  %22 = load i32, i32* %err, align 4, !dbg !39
  br label %if.end15, !dbg !39

if.end15:                                         ; preds = %if.end12, %then13
  %23 = load i32, i32* %g, align 4, !dbg !40
  %24 = icmp ne i32 %23, 6, !dbg !40
  br i1 %24, label %then16, label %if.end18, !dbg !40

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !41
  %25 = load i32, i32* %err, align 4, !dbg !41
  br label %if.end18, !dbg !41

if.end18:                                         ; preds = %if.end15, %then16
  %26 = load i32, i32* %h, align 4, !dbg !42
  %27 = icmp ne i32 %26, 7, !dbg !42
  br i1 %27, label %then19, label %if.end21, !dbg !42

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !43
  %28 = load i32, i32* %err, align 4, !dbg !43
  br label %if.end21, !dbg !43

if.end21:                                         ; preds = %if.end18, %then19
  %29 = load i32, i32* %err, align 4, !dbg !44
  %30 = icmp eq i32 %29, 0, !dbg !44
  %. = select i1 %30, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0), !dbg !45
  %31 = call i32 (i8*, ...) @printf(i8* %.), !dbg !45
  %32 = load i32, i32* %err, align 4, !dbg !46
  ret i32 %32, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "7.variable_list.c", directory: "../tests")
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "h", scope: !4, file: !1, line: 11, type: !7)
!10 = !DILocation(line: 11, column: 3, scope: !4)
!11 = !DILocalVariable(name: "g", scope: !4, file: !1, line: 11, type: !7)
!12 = !DILocalVariable(name: "f", scope: !4, file: !1, line: 7, type: !7)
!13 = !DILocation(line: 7, column: 3, scope: !4)
!14 = !DILocalVariable(name: "e", scope: !4, file: !1, line: 6, type: !7)
!15 = !DILocation(line: 6, column: 3, scope: !4)
!16 = !DILocalVariable(name: "d", scope: !4, file: !1, line: 6, type: !7)
!17 = !DILocalVariable(name: "c", scope: !4, file: !1, line: 5, type: !7)
!18 = !DILocation(line: 5, column: 3, scope: !4)
!19 = !DILocalVariable(name: "b", scope: !4, file: !1, line: 5, type: !7)
!20 = !DILocalVariable(name: "a", scope: !4, file: !1, line: 5, type: !7)
!21 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 4, type: !7)
!22 = !DILocation(line: 4, column: 3, scope: !4)
!23 = !DILocation(line: 8, column: 3, scope: !4)
!24 = !DILocation(line: 9, column: 3, scope: !4)
!25 = !DILocation(line: 10, column: 3, scope: !4)
!26 = !DILocation(line: 12, column: 3, scope: !4)
!27 = !DILocation(line: 13, column: 3, scope: !4)
!28 = !DILocation(line: 15, column: 3, scope: !4)
!29 = !DILocation(line: 15, column: 15, scope: !4)
!30 = !DILocation(line: 16, column: 3, scope: !4)
!31 = !DILocation(line: 16, column: 15, scope: !4)
!32 = !DILocation(line: 17, column: 3, scope: !4)
!33 = !DILocation(line: 17, column: 15, scope: !4)
!34 = !DILocation(line: 18, column: 3, scope: !4)
!35 = !DILocation(line: 18, column: 15, scope: !4)
!36 = !DILocation(line: 19, column: 3, scope: !4)
!37 = !DILocation(line: 19, column: 15, scope: !4)
!38 = !DILocation(line: 20, column: 3, scope: !4)
!39 = !DILocation(line: 20, column: 15, scope: !4)
!40 = !DILocation(line: 21, column: 3, scope: !4)
!41 = !DILocation(line: 21, column: 15, scope: !4)
!42 = !DILocation(line: 22, column: 3, scope: !4)
!43 = !DILocation(line: 22, column: 15, scope: !4)
!44 = !DILocation(line: 24, column: 3, scope: !4)
!45 = !DILocation(line: 0, scope: !4)
!46 = !DILocation(line: 29, column: 3, scope: !4)
