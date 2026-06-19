; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [28 x i8] c"30.array_mixed_decl.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [28 x i8] c"30.array_mixed_decl.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %b = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %b, metadata !7, metadata !DIExpression()), !dbg !8
  %a = alloca [4 x i32], align 4
  call void @llvm.dbg.declare(metadata [4 x i32]* %a, metadata !9, metadata !DIExpression()), !dbg !8
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 0, i32* %err, align 4, !dbg !14
  %0 = bitcast [4 x i32]* %a to i32*, !dbg !15
  %1 = bitcast i32* %0 to i32*, !dbg !15
  store i32 10, i32* %1, align 4, !dbg !15
  %2 = load i32, i32* %1, align 4, !dbg !15
  %3 = bitcast [4 x i32]* %a to i32*, !dbg !16
  %4 = getelementptr i32, i32* %3, i32 1, !dbg !16
  store i32 20, i32* %4, align 4, !dbg !16
  %5 = load i32, i32* %4, align 4, !dbg !16
  store i32 30, i32* %b, align 4, !dbg !17
  %6 = load i32, i32* %b, align 4, !dbg !17
  %7 = bitcast [4 x i32]* %a to i32*, !dbg !18
  %8 = bitcast i32* %7 to i32*, !dbg !18
  %9 = load i32, i32* %8, align 4, !dbg !18
  %10 = icmp ne i32 %9, 10, !dbg !18
  br i1 %10, label %then, label %if.end, !dbg !18

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !19
  %11 = load i32, i32* %err, align 4, !dbg !19
  br label %if.end, !dbg !19

if.end:                                           ; preds = %entry, %then
  %12 = bitcast [4 x i32]* %a to i32*, !dbg !20
  %13 = getelementptr i32, i32* %12, i32 1, !dbg !20
  %14 = load i32, i32* %13, align 4, !dbg !20
  %15 = icmp ne i32 %14, 20, !dbg !20
  br i1 %15, label %then1, label %if.end3, !dbg !20

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !21
  %16 = load i32, i32* %err, align 4, !dbg !21
  br label %if.end3, !dbg !21

if.end3:                                          ; preds = %if.end, %then1
  %17 = load i32, i32* %b, align 4, !dbg !22
  %18 = icmp ne i32 %17, 30, !dbg !22
  br i1 %18, label %then4, label %if.end6, !dbg !22

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !23
  %19 = load i32, i32* %err, align 4, !dbg !23
  br label %if.end6, !dbg !23

if.end6:                                          ; preds = %if.end3, %then4
  %20 = load i32, i32* %err, align 4, !dbg !24
  %21 = icmp eq i32 %20, 0, !dbg !24
  %. = select i1 %21, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @1, i32 0, i32 0), !dbg !25
  %22 = call i32 (i8*, ...) @printf(i8* %.), !dbg !25
  %23 = load i32, i32* %err, align 4, !dbg !26
  ret i32 %23, !dbg !26
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "30.array_mixed_decl.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "b", scope: !2, file: !1, line: 5, type: !5)
!8 = !DILocation(line: 5, column: 3, scope: !2)
!9 = !DILocalVariable(name: "a", scope: !2, file: !1, line: 5, type: !10)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 128, align: 32, elements: !11)
!11 = !{!12}
!12 = !DISubrange(count: 4, lowerBound: 0)
!13 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 4, type: !5)
!14 = !DILocation(line: 4, column: 3, scope: !2)
!15 = !DILocation(line: 6, column: 3, scope: !2)
!16 = !DILocation(line: 7, column: 3, scope: !2)
!17 = !DILocation(line: 8, column: 3, scope: !2)
!18 = !DILocation(line: 10, column: 3, scope: !2)
!19 = !DILocation(line: 10, column: 19, scope: !2)
!20 = !DILocation(line: 11, column: 3, scope: !2)
!21 = !DILocation(line: 11, column: 19, scope: !2)
!22 = !DILocation(line: 12, column: 3, scope: !2)
!23 = !DILocation(line: 12, column: 16, scope: !2)
!24 = !DILocation(line: 14, column: 3, scope: !2)
!25 = !DILocation(line: 0, scope: !2)
!26 = !DILocation(line: 19, column: 3, scope: !2)
