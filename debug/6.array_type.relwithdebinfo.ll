; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@gs = global [16 x i8] undef
@0 = private unnamed_addr constant [13 x i8] c"hello world!\00", align 1
@gps = global i8* getelementptr inbounds ([13 x i8], [13 x i8]* @0, i32 0, i32 0)
@gi = global [4 x i32] undef
@1 = private unnamed_addr constant [21 x i8] c"6.array_type.c PASS\0A\00", align 1
@2 = private unnamed_addr constant [21 x i8] c"6.array_type.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %i = alloca [4 x i32], align 4
  %s = alloca [16 x i8], align 1
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  %0 = bitcast [16 x i8]* %s to i8*, !dbg !8
  %1 = bitcast i8* %0 to i8*, !dbg !8
  store i8 103, i8* %1, align 1, !dbg !8
  %2 = load i8, i8* %1, align 1, !dbg !8
  %3 = bitcast [16 x i8]* %s to i8*, !dbg !9
  %4 = getelementptr i8, i8* %3, i32 1, !dbg !9
  store i8 111, i8* %4, align 1, !dbg !9
  %5 = load i8, i8* %4, align 1, !dbg !9
  %6 = bitcast [16 x i8]* %s to i8*, !dbg !10
  %7 = getelementptr i8, i8* %6, i32 2, !dbg !10
  store i8 111, i8* %7, align 1, !dbg !10
  %8 = load i8, i8* %7, align 1, !dbg !10
  %9 = bitcast [16 x i8]* %s to i8*, !dbg !11
  %10 = getelementptr i8, i8* %9, i32 3, !dbg !11
  store i8 100, i8* %10, align 1, !dbg !11
  %11 = load i8, i8* %10, align 1, !dbg !11
  %12 = bitcast [16 x i8]* %s to i8*, !dbg !12
  %13 = getelementptr i8, i8* %12, i32 4, !dbg !12
  store i8 0, i8* %13, align 1, !dbg !12
  %14 = load i8, i8* %13, align 1, !dbg !12
  store i8 108, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 0), align 1, !dbg !13
  %15 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 0), align 1, !dbg !13
  store i8 117, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 1), align 1, !dbg !14
  %16 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 1), align 1, !dbg !14
  store i8 99, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 2), align 1, !dbg !15
  %17 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 2), align 1, !dbg !15
  store i8 107, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 3), align 1, !dbg !16
  %18 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 3), align 1, !dbg !16
  store i8 121, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 4), align 1, !dbg !17
  %19 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 4), align 1, !dbg !17
  store i8 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 5), align 1, !dbg !18
  %20 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 5), align 1, !dbg !18
  %21 = bitcast [4 x i32]* %i to i32*, !dbg !19
  %22 = bitcast i32* %21 to i32*, !dbg !19
  store i32 128, i32* %22, align 4, !dbg !19
  %23 = load i32, i32* %22, align 4, !dbg !19
  %24 = bitcast [4 x i32]* %i to i32*, !dbg !20
  %25 = getelementptr i32, i32* %24, i32 1, !dbg !20
  store i32 256, i32* %25, align 4, !dbg !20
  %26 = load i32, i32* %25, align 4, !dbg !20
  store i32 1024, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 0), align 4, !dbg !21
  %27 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 0), align 4, !dbg !21
  store i32 2048, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 1), align 4, !dbg !22
  %28 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 1), align 4, !dbg !22
  %29 = bitcast [4 x i32]* %i to i32*, !dbg !23
  %30 = bitcast i32* %29 to i32*, !dbg !23
  %31 = load i32, i32* %30, align 4, !dbg !23
  %32 = icmp ne i32 %31, 128, !dbg !23
  br i1 %32, label %then, label %if.end, !dbg !23

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !24
  %33 = load i32, i32* %err, align 4, !dbg !24
  br label %if.end, !dbg !24

if.end:                                           ; preds = %entry, %then
  %34 = bitcast [4 x i32]* %i to i32*, !dbg !25
  %35 = getelementptr i32, i32* %34, i32 1, !dbg !25
  %36 = load i32, i32* %35, align 4, !dbg !25
  %37 = icmp ne i32 %36, 256, !dbg !25
  br i1 %37, label %then1, label %if.end3, !dbg !25

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !26
  %38 = load i32, i32* %err, align 4, !dbg !26
  br label %if.end3, !dbg !26

if.end3:                                          ; preds = %if.end, %then1
  %39 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 0), align 4, !dbg !27
  %40 = icmp ne i32 %39, 1024, !dbg !27
  br i1 %40, label %then4, label %if.end6, !dbg !27

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !28
  %41 = load i32, i32* %err, align 4, !dbg !28
  br label %if.end6, !dbg !28

if.end6:                                          ; preds = %if.end3, %then4
  %42 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 1), align 4, !dbg !29
  %43 = icmp ne i32 %42, 2048, !dbg !29
  br i1 %43, label %then7, label %if.end9, !dbg !29

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !30
  %44 = load i32, i32* %err, align 4, !dbg !30
  br label %if.end9, !dbg !30

if.end9:                                          ; preds = %if.end6, %then7
  %45 = bitcast [16 x i8]* %s to i8*, !dbg !31
  %46 = bitcast i8* %45 to i8*, !dbg !31
  %47 = load i8, i8* %46, align 1, !dbg !31
  %48 = sext i8 %47 to i32, !dbg !31
  %49 = icmp ne i32 %48, 103, !dbg !31
  br i1 %49, label %then10, label %if.end12, !dbg !31

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !32
  %50 = load i32, i32* %err, align 4, !dbg !32
  br label %if.end12, !dbg !32

if.end12:                                         ; preds = %if.end9, %then10
  %51 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 0), align 1, !dbg !33
  %52 = sext i8 %51 to i32, !dbg !33
  %53 = icmp ne i32 %52, 108, !dbg !33
  br i1 %53, label %then13, label %if.end15, !dbg !33

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !34
  %54 = load i32, i32* %err, align 4, !dbg !34
  br label %if.end15, !dbg !34

if.end15:                                         ; preds = %if.end12, %then13
  %55 = bitcast [4 x i32]* %i to i32*, !dbg !35
  %56 = getelementptr i32, i32* %55, i32 2, !dbg !35
  store i32 0, i32* %56, align 4, !dbg !35
  %57 = load i32, i32* %56, align 4, !dbg !35
  %58 = bitcast [4 x i32]* %i to i32*, !dbg !36
  %59 = getelementptr i32, i32* %58, i32 3, !dbg !36
  store i32 -1, i32* %59, align 4, !dbg !36
  %60 = load i32, i32* %59, align 4, !dbg !36
  %61 = bitcast [4 x i32]* %i to i32*, !dbg !37
  %62 = getelementptr i32, i32* %61, i32 2, !dbg !37
  %63 = load i32, i32* %62, align 4, !dbg !37
  %64 = icmp ne i32 %63, 0, !dbg !37
  br i1 %64, label %then16, label %if.end18, !dbg !37

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !38
  %65 = load i32, i32* %err, align 4, !dbg !38
  br label %if.end18, !dbg !38

if.end18:                                         ; preds = %if.end15, %then16
  %66 = bitcast [4 x i32]* %i to i32*, !dbg !39
  %67 = getelementptr i32, i32* %66, i32 3, !dbg !39
  %68 = load i32, i32* %67, align 4, !dbg !39
  %69 = icmp ne i32 %68, -1, !dbg !39
  br i1 %69, label %then19, label %if.end21, !dbg !39

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !40
  %70 = load i32, i32* %err, align 4, !dbg !40
  br label %if.end21, !dbg !40

if.end21:                                         ; preds = %if.end18, %then19
  %71 = load i32, i32* %err, align 4, !dbg !41
  %72 = icmp eq i32 %71, 0, !dbg !41
  %. = select i1 %72, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @1, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @2, i32 0, i32 0), !dbg !42
  %73 = call i32 (i8*, ...) @printf(i8* %.), !dbg !42
  %74 = load i32, i32* %err, align 4, !dbg !43
  ret i32 %74, !dbg !43
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "6.array_type.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 7, type: !3, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 8, column: 3, scope: !2)
!8 = !DILocation(line: 12, column: 3, scope: !2)
!9 = !DILocation(line: 13, column: 3, scope: !2)
!10 = !DILocation(line: 14, column: 3, scope: !2)
!11 = !DILocation(line: 15, column: 3, scope: !2)
!12 = !DILocation(line: 16, column: 3, scope: !2)
!13 = !DILocation(line: 18, column: 3, scope: !2)
!14 = !DILocation(line: 19, column: 3, scope: !2)
!15 = !DILocation(line: 20, column: 3, scope: !2)
!16 = !DILocation(line: 21, column: 3, scope: !2)
!17 = !DILocation(line: 22, column: 3, scope: !2)
!18 = !DILocation(line: 23, column: 3, scope: !2)
!19 = !DILocation(line: 25, column: 3, scope: !2)
!20 = !DILocation(line: 26, column: 3, scope: !2)
!21 = !DILocation(line: 27, column: 3, scope: !2)
!22 = !DILocation(line: 28, column: 3, scope: !2)
!23 = !DILocation(line: 30, column: 3, scope: !2)
!24 = !DILocation(line: 30, column: 20, scope: !2)
!25 = !DILocation(line: 31, column: 3, scope: !2)
!26 = !DILocation(line: 31, column: 20, scope: !2)
!27 = !DILocation(line: 32, column: 3, scope: !2)
!28 = !DILocation(line: 32, column: 22, scope: !2)
!29 = !DILocation(line: 33, column: 3, scope: !2)
!30 = !DILocation(line: 33, column: 22, scope: !2)
!31 = !DILocation(line: 34, column: 3, scope: !2)
!32 = !DILocation(line: 34, column: 20, scope: !2)
!33 = !DILocation(line: 35, column: 3, scope: !2)
!34 = !DILocation(line: 35, column: 21, scope: !2)
!35 = !DILocation(line: 37, column: 3, scope: !2)
!36 = !DILocation(line: 38, column: 3, scope: !2)
!37 = !DILocation(line: 39, column: 3, scope: !2)
!38 = !DILocation(line: 39, column: 18, scope: !2)
!39 = !DILocation(line: 40, column: 3, scope: !2)
!40 = !DILocation(line: 40, column: 19, scope: !2)
!41 = !DILocation(line: 42, column: 3, scope: !2)
!42 = !DILocation(line: 0, scope: !2)
!43 = !DILocation(line: 47, column: 3, scope: !2)
