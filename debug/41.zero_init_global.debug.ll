; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@g_scalar = global i32 0
@g_arr = global [4 x i32] zeroinitializer
@g_matrix = global [2 x [3 x i32]] zeroinitializer
@g_ptr = global i32* null
@0 = private unnamed_addr constant [28 x i8] c"41.zero_init_global.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [28 x i8] c"41.zero_init_global.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !4 {
entry:
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !9, metadata !DIExpression()), !dbg !10
  store i32 0, i32* %err, align 4, !dbg !10
  %0 = load i32, i32* @g_scalar, align 4, !dbg !11
  %1 = icmp ne i32 %0, 0, !dbg !11
  br i1 %1, label %then, label %if.end, !dbg !11

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !12
  %2 = load i32, i32* %err, align 4, !dbg !12
  br label %if.end, !dbg !12

if.end:                                           ; preds = %entry, %then
  %3 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @g_arr, i32 0, i32 0), align 4, !dbg !13
  %4 = icmp ne i32 %3, 0, !dbg !13
  br i1 %4, label %then1, label %if.end3, !dbg !13

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !14
  %5 = load i32, i32* %err, align 4, !dbg !14
  br label %if.end3, !dbg !14

if.end3:                                          ; preds = %if.end, %then1
  %6 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @g_arr, i32 0, i32 1), align 4, !dbg !15
  %7 = icmp ne i32 %6, 0, !dbg !15
  br i1 %7, label %then4, label %if.end6, !dbg !15

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !16
  %8 = load i32, i32* %err, align 4, !dbg !16
  br label %if.end6, !dbg !16

if.end6:                                          ; preds = %if.end3, %then4
  %9 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @g_arr, i32 0, i32 2), align 4, !dbg !17
  %10 = icmp ne i32 %9, 0, !dbg !17
  br i1 %10, label %then7, label %if.end9, !dbg !17

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !18
  %11 = load i32, i32* %err, align 4, !dbg !18
  br label %if.end9, !dbg !18

if.end9:                                          ; preds = %if.end6, %then7
  %12 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @g_arr, i32 0, i32 3), align 4, !dbg !19
  %13 = icmp ne i32 %12, 0, !dbg !19
  br i1 %13, label %then10, label %if.end12, !dbg !19

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !20
  %14 = load i32, i32* %err, align 4, !dbg !20
  br label %if.end12, !dbg !20

if.end12:                                         ; preds = %if.end9, %then10
  %15 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @g_matrix, i32 0, i32 0, i32 0), align 4, !dbg !21
  %16 = icmp ne i32 %15, 0, !dbg !21
  br i1 %16, label %then13, label %if.end15, !dbg !21

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !22
  %17 = load i32, i32* %err, align 4, !dbg !22
  br label %if.end15, !dbg !22

if.end15:                                         ; preds = %if.end12, %then13
  %18 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @g_matrix, i32 0, i32 0, i32 2), align 4, !dbg !23
  %19 = icmp ne i32 %18, 0, !dbg !23
  br i1 %19, label %then16, label %if.end18, !dbg !23

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !24
  %20 = load i32, i32* %err, align 4, !dbg !24
  br label %if.end18, !dbg !24

if.end18:                                         ; preds = %if.end15, %then16
  %21 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @g_matrix, i32 0, i32 1, i32 1), align 4, !dbg !25
  %22 = icmp ne i32 %21, 0, !dbg !25
  br i1 %22, label %then19, label %if.end21, !dbg !25

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !26
  %23 = load i32, i32* %err, align 4, !dbg !26
  br label %if.end21, !dbg !26

if.end21:                                         ; preds = %if.end18, %then19
  %24 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @g_matrix, i32 0, i32 1, i32 2), align 4, !dbg !27
  %25 = icmp ne i32 %24, 0, !dbg !27
  br i1 %25, label %then22, label %if.end24, !dbg !27

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !28
  %26 = load i32, i32* %err, align 4, !dbg !28
  br label %if.end24, !dbg !28

if.end24:                                         ; preds = %if.end21, %then22
  %27 = load i32*, i32** @g_ptr, align 8, !dbg !29
  %28 = ptrtoint i32* %27 to i64, !dbg !29
  %29 = icmp ne i64 %28, 0, !dbg !29
  br i1 %29, label %then25, label %if.end27, !dbg !29

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !30
  %30 = load i32, i32* %err, align 4, !dbg !30
  br label %if.end27, !dbg !30

if.end27:                                         ; preds = %if.end24, %then25
  %31 = load i32, i32* %err, align 4, !dbg !31
  %32 = icmp eq i32 %31, 0, !dbg !31
  %. = select i1 %32, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @1, i32 0, i32 0), !dbg !32
  %33 = call i32 (i8*, ...) @printf(i8* %.), !dbg !32
  %34 = load i32, i32* %err, align 4, !dbg !33
  ret i32 %34, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "41.zero_init_global.c", directory: "../tests")
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 10, type: !5, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 11, type: !7)
!10 = !DILocation(line: 11, column: 3, scope: !4)
!11 = !DILocation(line: 13, column: 3, scope: !4)
!12 = !DILocation(line: 13, column: 22, scope: !4)
!13 = !DILocation(line: 15, column: 3, scope: !4)
!14 = !DILocation(line: 15, column: 22, scope: !4)
!15 = !DILocation(line: 16, column: 3, scope: !4)
!16 = !DILocation(line: 16, column: 22, scope: !4)
!17 = !DILocation(line: 17, column: 3, scope: !4)
!18 = !DILocation(line: 17, column: 22, scope: !4)
!19 = !DILocation(line: 18, column: 3, scope: !4)
!20 = !DILocation(line: 18, column: 22, scope: !4)
!21 = !DILocation(line: 20, column: 3, scope: !4)
!22 = !DILocation(line: 20, column: 28, scope: !4)
!23 = !DILocation(line: 21, column: 3, scope: !4)
!24 = !DILocation(line: 21, column: 28, scope: !4)
!25 = !DILocation(line: 22, column: 3, scope: !4)
!26 = !DILocation(line: 22, column: 28, scope: !4)
!27 = !DILocation(line: 23, column: 3, scope: !4)
!28 = !DILocation(line: 23, column: 28, scope: !4)
!29 = !DILocation(line: 25, column: 3, scope: !4)
!30 = !DILocation(line: 25, column: 19, scope: !4)
!31 = !DILocation(line: 27, column: 3, scope: !4)
!32 = !DILocation(line: 0, scope: !4)
!33 = !DILocation(line: 32, column: 3, scope: !4)
