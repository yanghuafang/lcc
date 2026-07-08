; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [28 x i8] c"30.array_mixed_decl.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [28 x i8] c"30.array_mixed_decl.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !4 {
entry:
  %b = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %b, metadata !9, metadata !DIExpression()), !dbg !10
  %a = alloca [4 x i32], align 4
  call void @llvm.dbg.declare(metadata [4 x i32]* %a, metadata !11, metadata !DIExpression()), !dbg !10
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 0, i32* %err, align 4, !dbg !16
  %0 = bitcast [4 x i32]* %a to i32*, !dbg !17
  %1 = bitcast i32* %0 to i32*, !dbg !17
  store i32 10, i32* %1, align 4, !dbg !17
  %2 = load i32, i32* %1, align 4, !dbg !17
  %3 = bitcast [4 x i32]* %a to i32*, !dbg !18
  %4 = getelementptr i32, i32* %3, i32 1, !dbg !18
  store i32 20, i32* %4, align 4, !dbg !18
  %5 = load i32, i32* %4, align 4, !dbg !18
  store i32 30, i32* %b, align 4, !dbg !19
  %6 = load i32, i32* %b, align 4, !dbg !19
  %7 = bitcast [4 x i32]* %a to i32*, !dbg !20
  %8 = bitcast i32* %7 to i32*, !dbg !20
  %9 = load i32, i32* %8, align 4, !dbg !20
  %10 = icmp ne i32 %9, 10, !dbg !20
  br i1 %10, label %then, label %if.end, !dbg !20

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !21
  %11 = load i32, i32* %err, align 4, !dbg !21
  br label %if.end, !dbg !21

if.end:                                           ; preds = %entry, %then
  %12 = bitcast [4 x i32]* %a to i32*, !dbg !22
  %13 = getelementptr i32, i32* %12, i32 1, !dbg !22
  %14 = load i32, i32* %13, align 4, !dbg !22
  %15 = icmp ne i32 %14, 20, !dbg !22
  br i1 %15, label %then1, label %if.end3, !dbg !22

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !23
  %16 = load i32, i32* %err, align 4, !dbg !23
  br label %if.end3, !dbg !23

if.end3:                                          ; preds = %if.end, %then1
  %17 = load i32, i32* %b, align 4, !dbg !24
  %18 = icmp ne i32 %17, 30, !dbg !24
  br i1 %18, label %then4, label %if.end6, !dbg !24

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !25
  %19 = load i32, i32* %err, align 4, !dbg !25
  br label %if.end6, !dbg !25

if.end6:                                          ; preds = %if.end3, %then4
  %20 = load i32, i32* %err, align 4, !dbg !26
  %21 = icmp eq i32 %20, 0, !dbg !26
  %. = select i1 %21, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @1, i32 0, i32 0), !dbg !27
  %22 = call i32 (i8*, ...) @printf(i8* %.), !dbg !27
  %23 = load i32, i32* %err, align 4, !dbg !28
  ret i32 %23, !dbg !28
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "30.array_mixed_decl.c", directory: "../tests")
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "b", scope: !4, file: !1, line: 5, type: !7)
!10 = !DILocation(line: 5, column: 3, scope: !4)
!11 = !DILocalVariable(name: "a", scope: !4, file: !1, line: 5, type: !12)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 128, align: 32, elements: !13)
!13 = !{!14}
!14 = !DISubrange(count: 4, lowerBound: 0)
!15 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 4, type: !7)
!16 = !DILocation(line: 4, column: 3, scope: !4)
!17 = !DILocation(line: 6, column: 3, scope: !4)
!18 = !DILocation(line: 7, column: 3, scope: !4)
!19 = !DILocation(line: 8, column: 3, scope: !4)
!20 = !DILocation(line: 10, column: 3, scope: !4)
!21 = !DILocation(line: 10, column: 19, scope: !4)
!22 = !DILocation(line: 11, column: 3, scope: !4)
!23 = !DILocation(line: 11, column: 19, scope: !4)
!24 = !DILocation(line: 12, column: 3, scope: !4)
!25 = !DILocation(line: 12, column: 16, scope: !4)
!26 = !DILocation(line: 14, column: 3, scope: !4)
!27 = !DILocation(line: 0, scope: !4)
!28 = !DILocation(line: 19, column: 3, scope: !4)
