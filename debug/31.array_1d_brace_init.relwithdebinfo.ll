; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@ga = global [4 x i32] [i32 1, i32 2, i32 3, i32 0]
@gb = global [2 x i32] [i32 10, i32 20]
@0 = private unnamed_addr constant [31 x i8] c"31.array_1d_brace_init.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"31.array_1d_brace_init.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %lc = alloca [2 x i32], align 4
  %lb = alloca [3 x i32], align 4
  %la = alloca [4 x i32], align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  %0 = bitcast [4 x i32]* %la to i32*, !dbg !8
  store i32 1, i32* %0, align 4, !dbg !8
  %1 = getelementptr [4 x i32], [4 x i32]* %la, i32 0, i32 1, !dbg !8
  store i32 2, i32* %1, align 4, !dbg !8
  %2 = getelementptr [4 x i32], [4 x i32]* %la, i32 0, i32 2, !dbg !8
  store i32 3, i32* %2, align 4, !dbg !8
  %3 = getelementptr [4 x i32], [4 x i32]* %la, i32 0, i32 3, !dbg !8
  store i32 0, i32* %3, align 4, !dbg !8
  %4 = bitcast [3 x i32]* %lb to i32*, !dbg !9
  store i32 4, i32* %4, align 4, !dbg !9
  %5 = getelementptr [3 x i32], [3 x i32]* %lb, i32 0, i32 1, !dbg !9
  store i32 5, i32* %5, align 4, !dbg !9
  %6 = getelementptr [3 x i32], [3 x i32]* %lb, i32 0, i32 2, !dbg !9
  store i32 6, i32* %6, align 4, !dbg !9
  %7 = bitcast [2 x i32]* %lc to i32*, !dbg !10
  store i32 0, i32* %7, align 4, !dbg !10
  %8 = getelementptr [2 x i32], [2 x i32]* %lc, i32 0, i32 1, !dbg !10
  store i32 0, i32* %8, align 4, !dbg !10
  %9 = bitcast [4 x i32]* %la to i32*, !dbg !11
  %10 = bitcast i32* %9 to i32*, !dbg !11
  %11 = load i32, i32* %10, align 4, !dbg !11
  %12 = icmp ne i32 %11, 1, !dbg !11
  br i1 %12, label %then, label %if.end, !dbg !11

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !12
  %13 = load i32, i32* %err, align 4, !dbg !12
  br label %if.end, !dbg !12

if.end:                                           ; preds = %entry, %then
  %14 = bitcast [4 x i32]* %la to i32*, !dbg !13
  %15 = getelementptr i32, i32* %14, i32 1, !dbg !13
  %16 = load i32, i32* %15, align 4, !dbg !13
  %17 = icmp ne i32 %16, 2, !dbg !13
  br i1 %17, label %then1, label %if.end3, !dbg !13

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !14
  %18 = load i32, i32* %err, align 4, !dbg !14
  br label %if.end3, !dbg !14

if.end3:                                          ; preds = %if.end, %then1
  %19 = bitcast [4 x i32]* %la to i32*, !dbg !15
  %20 = getelementptr i32, i32* %19, i32 2, !dbg !15
  %21 = load i32, i32* %20, align 4, !dbg !15
  %22 = icmp ne i32 %21, 3, !dbg !15
  br i1 %22, label %then4, label %if.end6, !dbg !15

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !16
  %23 = load i32, i32* %err, align 4, !dbg !16
  br label %if.end6, !dbg !16

if.end6:                                          ; preds = %if.end3, %then4
  %24 = bitcast [4 x i32]* %la to i32*, !dbg !17
  %25 = getelementptr i32, i32* %24, i32 3, !dbg !17
  %26 = load i32, i32* %25, align 4, !dbg !17
  %27 = icmp ne i32 %26, 0, !dbg !17
  br i1 %27, label %then7, label %if.end9, !dbg !17

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !18
  %28 = load i32, i32* %err, align 4, !dbg !18
  br label %if.end9, !dbg !18

if.end9:                                          ; preds = %if.end6, %then7
  %29 = bitcast [3 x i32]* %lb to i32*, !dbg !19
  %30 = bitcast i32* %29 to i32*, !dbg !19
  %31 = load i32, i32* %30, align 4, !dbg !19
  %32 = icmp ne i32 %31, 4, !dbg !19
  br i1 %32, label %then10, label %if.end12, !dbg !19

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !20
  %33 = load i32, i32* %err, align 4, !dbg !20
  br label %if.end12, !dbg !20

if.end12:                                         ; preds = %if.end9, %then10
  %34 = bitcast [3 x i32]* %lb to i32*, !dbg !21
  %35 = getelementptr i32, i32* %34, i32 1, !dbg !21
  %36 = load i32, i32* %35, align 4, !dbg !21
  %37 = icmp ne i32 %36, 5, !dbg !21
  br i1 %37, label %then13, label %if.end15, !dbg !21

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !22
  %38 = load i32, i32* %err, align 4, !dbg !22
  br label %if.end15, !dbg !22

if.end15:                                         ; preds = %if.end12, %then13
  %39 = bitcast [3 x i32]* %lb to i32*, !dbg !23
  %40 = getelementptr i32, i32* %39, i32 2, !dbg !23
  %41 = load i32, i32* %40, align 4, !dbg !23
  %42 = icmp ne i32 %41, 6, !dbg !23
  br i1 %42, label %then16, label %if.end18, !dbg !23

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !24
  %43 = load i32, i32* %err, align 4, !dbg !24
  br label %if.end18, !dbg !24

if.end18:                                         ; preds = %if.end15, %then16
  %44 = bitcast [2 x i32]* %lc to i32*, !dbg !25
  %45 = bitcast i32* %44 to i32*, !dbg !25
  %46 = load i32, i32* %45, align 4, !dbg !25
  %47 = icmp ne i32 %46, 0, !dbg !25
  br i1 %47, label %then19, label %if.end21, !dbg !25

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !26
  %48 = load i32, i32* %err, align 4, !dbg !26
  br label %if.end21, !dbg !26

if.end21:                                         ; preds = %if.end18, %then19
  %49 = bitcast [2 x i32]* %lc to i32*, !dbg !27
  %50 = getelementptr i32, i32* %49, i32 1, !dbg !27
  %51 = load i32, i32* %50, align 4, !dbg !27
  %52 = icmp ne i32 %51, 0, !dbg !27
  br i1 %52, label %then22, label %if.end24, !dbg !27

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !28
  %53 = load i32, i32* %err, align 4, !dbg !28
  br label %if.end24, !dbg !28

if.end24:                                         ; preds = %if.end21, %then22
  %54 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i32 0, i32 0), align 4, !dbg !29
  %55 = icmp ne i32 %54, 1, !dbg !29
  br i1 %55, label %then25, label %if.end27, !dbg !29

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !30
  %56 = load i32, i32* %err, align 4, !dbg !30
  br label %if.end27, !dbg !30

if.end27:                                         ; preds = %if.end24, %then25
  %57 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i32 0, i32 1), align 4, !dbg !31
  %58 = icmp ne i32 %57, 2, !dbg !31
  br i1 %58, label %then28, label %if.end30, !dbg !31

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !32
  %59 = load i32, i32* %err, align 4, !dbg !32
  br label %if.end30, !dbg !32

if.end30:                                         ; preds = %if.end27, %then28
  %60 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i32 0, i32 2), align 4, !dbg !33
  %61 = icmp ne i32 %60, 3, !dbg !33
  br i1 %61, label %then31, label %if.end33, !dbg !33

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !34
  %62 = load i32, i32* %err, align 4, !dbg !34
  br label %if.end33, !dbg !34

if.end33:                                         ; preds = %if.end30, %then31
  %63 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i32 0, i32 3), align 4, !dbg !35
  %64 = icmp ne i32 %63, 0, !dbg !35
  br i1 %64, label %then34, label %if.end36, !dbg !35

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4, !dbg !36
  %65 = load i32, i32* %err, align 4, !dbg !36
  br label %if.end36, !dbg !36

if.end36:                                         ; preds = %if.end33, %then34
  %66 = load i32, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @gb, i32 0, i32 0), align 4, !dbg !37
  %67 = icmp ne i32 %66, 10, !dbg !37
  br i1 %67, label %then37, label %if.end39, !dbg !37

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4, !dbg !38
  %68 = load i32, i32* %err, align 4, !dbg !38
  br label %if.end39, !dbg !38

if.end39:                                         ; preds = %if.end36, %then37
  %69 = load i32, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @gb, i32 0, i32 1), align 4, !dbg !39
  %70 = icmp ne i32 %69, 20, !dbg !39
  br i1 %70, label %then40, label %if.end42, !dbg !39

then40:                                           ; preds = %if.end39
  store i32 1, i32* %err, align 4, !dbg !40
  %71 = load i32, i32* %err, align 4, !dbg !40
  br label %if.end42, !dbg !40

if.end42:                                         ; preds = %if.end39, %then40
  %72 = load i32, i32* %err, align 4, !dbg !41
  %73 = icmp eq i32 %72, 0, !dbg !41
  %. = select i1 %73, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @1, i32 0, i32 0), !dbg !42
  %74 = call i32 (i8*, ...) @printf(i8* %.), !dbg !42
  %75 = load i32, i32* %err, align 4, !dbg !43
  ret i32 %75, !dbg !43
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "31.array_1d_brace_init.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 6, type: !3, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 7, column: 3, scope: !2)
!8 = !DILocation(line: 8, column: 3, scope: !2)
!9 = !DILocation(line: 9, column: 3, scope: !2)
!10 = !DILocation(line: 10, column: 3, scope: !2)
!11 = !DILocation(line: 12, column: 3, scope: !2)
!12 = !DILocation(line: 12, column: 19, scope: !2)
!13 = !DILocation(line: 13, column: 3, scope: !2)
!14 = !DILocation(line: 13, column: 19, scope: !2)
!15 = !DILocation(line: 14, column: 3, scope: !2)
!16 = !DILocation(line: 14, column: 19, scope: !2)
!17 = !DILocation(line: 15, column: 3, scope: !2)
!18 = !DILocation(line: 15, column: 19, scope: !2)
!19 = !DILocation(line: 17, column: 3, scope: !2)
!20 = !DILocation(line: 17, column: 19, scope: !2)
!21 = !DILocation(line: 18, column: 3, scope: !2)
!22 = !DILocation(line: 18, column: 19, scope: !2)
!23 = !DILocation(line: 19, column: 3, scope: !2)
!24 = !DILocation(line: 19, column: 19, scope: !2)
!25 = !DILocation(line: 21, column: 3, scope: !2)
!26 = !DILocation(line: 21, column: 19, scope: !2)
!27 = !DILocation(line: 22, column: 3, scope: !2)
!28 = !DILocation(line: 22, column: 19, scope: !2)
!29 = !DILocation(line: 24, column: 3, scope: !2)
!30 = !DILocation(line: 24, column: 19, scope: !2)
!31 = !DILocation(line: 25, column: 3, scope: !2)
!32 = !DILocation(line: 25, column: 19, scope: !2)
!33 = !DILocation(line: 26, column: 3, scope: !2)
!34 = !DILocation(line: 26, column: 19, scope: !2)
!35 = !DILocation(line: 27, column: 3, scope: !2)
!36 = !DILocation(line: 27, column: 19, scope: !2)
!37 = !DILocation(line: 29, column: 3, scope: !2)
!38 = !DILocation(line: 29, column: 20, scope: !2)
!39 = !DILocation(line: 30, column: 3, scope: !2)
!40 = !DILocation(line: 30, column: 20, scope: !2)
!41 = !DILocation(line: 32, column: 3, scope: !2)
!42 = !DILocation(line: 0, scope: !2)
!43 = !DILocation(line: 37, column: 3, scope: !2)
