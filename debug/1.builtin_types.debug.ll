; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [24 x i8] c"1.builtin_types.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"1.builtin_types.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %const30 = bitcast i64 -1234567890 to i64
  %const29 = bitcast i64 9876043210 to i64
  %const28 = bitcast i32 -12345678 to i32
  %const = bitcast i32 180150000 to i32
  %bf = alloca i1, align 1
  %bt = alloca i1, align 1
  %db = alloca double, align 8
  %fl = alloca float, align 4
  %uln = alloca i64, align 8
  %uint = alloca i32, align 4
  %uch = alloca i8, align 1
  %ln = alloca i64, align 8
  %in = alloca i32, align 4
  %sh = alloca i16, align 2
  %ch = alloca i8, align 1
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  store i8 65, i8* %ch, align 1, !dbg !8
  store i16 -1024, i16* %sh, align 2, !dbg !9
  store i32 %const28, i32* %in, align 4, !dbg !10
  store i64 %const30, i64* %ln, align 4, !dbg !11
  store i8 -6, i8* %uch, align 1, !dbg !12
  store i32 %const, i32* %uint, align 4, !dbg !13
  store i64 %const29, i64* %uln, align 4, !dbg !14
  store float 0x400921FB40000000, float* %fl, align 4, !dbg !15
  store double 0x400921FB54442D11, double* %db, align 8, !dbg !16
  store i1 true, i1* %bt, align 1, !dbg !17
  store i1 false, i1* %bf, align 1, !dbg !18
  %0 = load i8, i8* %ch, align 1, !dbg !19
  %1 = sext i8 %0 to i32, !dbg !19
  %2 = icmp ne i32 %1, 65, !dbg !19
  br i1 %2, label %then, label %if.end, !dbg !19

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !20
  %3 = load i32, i32* %err, align 4, !dbg !20
  br label %if.end, !dbg !20

if.end:                                           ; preds = %entry, %then
  %4 = load i16, i16* %sh, align 2, !dbg !21
  %5 = sext i16 %4 to i32, !dbg !21
  %6 = icmp ne i32 %5, -1024, !dbg !21
  br i1 %6, label %then1, label %if.end3, !dbg !21

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !22
  %7 = load i32, i32* %err, align 4, !dbg !22
  br label %if.end3, !dbg !22

if.end3:                                          ; preds = %if.end, %then1
  %8 = load i32, i32* %in, align 4, !dbg !23
  %9 = icmp ne i32 %8, %const28, !dbg !23
  br i1 %9, label %then4, label %if.end6, !dbg !23

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !24
  %10 = load i32, i32* %err, align 4, !dbg !24
  br label %if.end6, !dbg !24

if.end6:                                          ; preds = %if.end3, %then4
  %11 = load i64, i64* %ln, align 4, !dbg !25
  %12 = icmp ne i64 %11, %const30, !dbg !25
  br i1 %12, label %then7, label %if.end9, !dbg !25

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !26
  %13 = load i32, i32* %err, align 4, !dbg !26
  br label %if.end9, !dbg !26

if.end9:                                          ; preds = %if.end6, %then7
  %14 = load i8, i8* %uch, align 1, !dbg !27
  %15 = zext i8 %14 to i32, !dbg !27
  %16 = icmp ne i32 %15, 250, !dbg !27
  br i1 %16, label %then10, label %if.end12, !dbg !27

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !28
  %17 = load i32, i32* %err, align 4, !dbg !28
  br label %if.end12, !dbg !28

if.end12:                                         ; preds = %if.end9, %then10
  %18 = load i32, i32* %uint, align 4, !dbg !29
  %19 = icmp ne i32 %18, %const, !dbg !29
  br i1 %19, label %then13, label %if.end15, !dbg !29

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !30
  %20 = load i32, i32* %err, align 4, !dbg !30
  br label %if.end15, !dbg !30

if.end15:                                         ; preds = %if.end12, %then13
  %21 = load i64, i64* %uln, align 4, !dbg !31
  %22 = icmp ne i64 %21, %const29, !dbg !31
  br i1 %22, label %then16, label %if.end18, !dbg !31

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !32
  %23 = load i32, i32* %err, align 4, !dbg !32
  br label %if.end18, !dbg !32

if.end18:                                         ; preds = %if.end15, %then16
  %24 = load i1, i1* %bt, align 1, !dbg !33
  %25 = zext i1 %24 to i32, !dbg !33
  %26 = icmp ne i32 %25, 1, !dbg !33
  br i1 %26, label %then19, label %if.end21, !dbg !33

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !34
  %27 = load i32, i32* %err, align 4, !dbg !34
  br label %if.end21, !dbg !34

if.end21:                                         ; preds = %if.end18, %then19
  %28 = load i1, i1* %bf, align 1, !dbg !35
  %29 = zext i1 %28 to i32, !dbg !35
  %30 = icmp ne i32 %29, 0, !dbg !35
  br i1 %30, label %then22, label %if.end24, !dbg !35

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !36
  %31 = load i32, i32* %err, align 4, !dbg !36
  br label %if.end24, !dbg !36

if.end24:                                         ; preds = %if.end21, %then22
  %32 = load i32, i32* %err, align 4, !dbg !37
  %33 = icmp eq i32 %32, 0, !dbg !37
  %. = select i1 %33, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0), !dbg !38
  %34 = call i32 (i8*, ...) @printf(i8* %.), !dbg !38
  %35 = load i32, i32* %err, align 4, !dbg !39
  ret i32 %35, !dbg !39
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "1.builtin_types.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 4, column: 3, scope: !2)
!8 = !DILocation(line: 5, column: 3, scope: !2)
!9 = !DILocation(line: 6, column: 3, scope: !2)
!10 = !DILocation(line: 7, column: 3, scope: !2)
!11 = !DILocation(line: 8, column: 3, scope: !2)
!12 = !DILocation(line: 9, column: 3, scope: !2)
!13 = !DILocation(line: 10, column: 3, scope: !2)
!14 = !DILocation(line: 11, column: 3, scope: !2)
!15 = !DILocation(line: 12, column: 3, scope: !2)
!16 = !DILocation(line: 13, column: 3, scope: !2)
!17 = !DILocation(line: 14, column: 3, scope: !2)
!18 = !DILocation(line: 15, column: 3, scope: !2)
!19 = !DILocation(line: 17, column: 3, scope: !2)
!20 = !DILocation(line: 17, column: 18, scope: !2)
!21 = !DILocation(line: 18, column: 3, scope: !2)
!22 = !DILocation(line: 18, column: 20, scope: !2)
!23 = !DILocation(line: 19, column: 3, scope: !2)
!24 = !DILocation(line: 19, column: 24, scope: !2)
!25 = !DILocation(line: 20, column: 3, scope: !2)
!26 = !DILocation(line: 20, column: 27, scope: !2)
!27 = !DILocation(line: 21, column: 3, scope: !2)
!28 = !DILocation(line: 21, column: 19, scope: !2)
!29 = !DILocation(line: 22, column: 3, scope: !2)
!30 = !DILocation(line: 22, column: 26, scope: !2)
!31 = !DILocation(line: 23, column: 3, scope: !2)
!32 = !DILocation(line: 23, column: 28, scope: !2)
!33 = !DILocation(line: 24, column: 3, scope: !2)
!34 = !DILocation(line: 24, column: 16, scope: !2)
!35 = !DILocation(line: 25, column: 3, scope: !2)
!36 = !DILocation(line: 25, column: 16, scope: !2)
!37 = !DILocation(line: 27, column: 3, scope: !2)
!38 = !DILocation(line: 0, scope: !2)
!39 = !DILocation(line: 32, column: 3, scope: !2)
