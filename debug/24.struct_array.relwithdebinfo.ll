; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%struct.Data = type { i32, i32 }

@0 = private unnamed_addr constant [24 x i8] c"24.struct_array.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"24.struct_array.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %data = alloca i32, align 4
  %id = alloca i32, align 4
  %da = alloca [2 x %struct.Data], align 8
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  %0 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !8
  %1 = bitcast %struct.Data* %0 to %struct.Data*, !dbg !8
  %2 = bitcast %struct.Data* %1 to i32*, !dbg !8
  store i32 0, i32* %2, align 4, !dbg !8
  %3 = load i32, i32* %2, align 4, !dbg !8
  %4 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !9
  %5 = bitcast %struct.Data* %4 to %struct.Data*, !dbg !9
  %6 = getelementptr %struct.Data, %struct.Data* %5, i32 0, i32 1, !dbg !9
  store i32 0, i32* %6, align 4, !dbg !9
  %7 = load i32, i32* %6, align 4, !dbg !9
  %8 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !10
  %9 = getelementptr %struct.Data, %struct.Data* %8, i32 1, !dbg !10
  %10 = bitcast %struct.Data* %9 to i32*, !dbg !10
  store i32 10, i32* %10, align 4, !dbg !10
  %11 = load i32, i32* %10, align 4, !dbg !10
  %12 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !11
  %13 = getelementptr %struct.Data, %struct.Data* %12, i32 1, !dbg !11
  %14 = getelementptr %struct.Data, %struct.Data* %13, i32 0, i32 1, !dbg !11
  store i32 80, i32* %14, align 4, !dbg !11
  %15 = load i32, i32* %14, align 4, !dbg !11
  %16 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !12
  %17 = getelementptr %struct.Data, %struct.Data* %16, i32 1, !dbg !12
  %18 = bitcast %struct.Data* %17 to i32*, !dbg !12
  %19 = load i32, i32* %18, align 4, !dbg !12
  store i32 %19, i32* %id, align 4, !dbg !12
  %20 = load i32, i32* %id, align 4, !dbg !12
  %21 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !13
  %22 = getelementptr %struct.Data, %struct.Data* %21, i32 1, !dbg !13
  %23 = getelementptr %struct.Data, %struct.Data* %22, i32 0, i32 1, !dbg !13
  %24 = load i32, i32* %23, align 4, !dbg !13
  store i32 %24, i32* %data, align 4, !dbg !13
  %25 = load i32, i32* %data, align 4, !dbg !13
  %26 = load i32, i32* %id, align 4, !dbg !14
  %27 = icmp ne i32 %26, 10, !dbg !14
  br i1 %27, label %then, label %if.end, !dbg !14

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !15
  %28 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end, !dbg !15

if.end:                                           ; preds = %entry, %then
  %29 = load i32, i32* %data, align 4, !dbg !16
  %30 = icmp ne i32 %29, 80, !dbg !16
  br i1 %30, label %then1, label %if.end3, !dbg !16

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !17
  %31 = load i32, i32* %err, align 4, !dbg !17
  br label %if.end3, !dbg !17

if.end3:                                          ; preds = %if.end, %then1
  %32 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !18
  %33 = bitcast %struct.Data* %32 to %struct.Data*, !dbg !18
  %34 = bitcast %struct.Data* %33 to i32*, !dbg !18
  %35 = load i32, i32* %34, align 4, !dbg !18
  store i32 %35, i32* %id, align 4, !dbg !18
  %36 = load i32, i32* %id, align 4, !dbg !18
  %37 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !19
  %38 = bitcast %struct.Data* %37 to %struct.Data*, !dbg !19
  %39 = getelementptr %struct.Data, %struct.Data* %38, i32 0, i32 1, !dbg !19
  %40 = load i32, i32* %39, align 4, !dbg !19
  store i32 %40, i32* %data, align 4, !dbg !19
  %41 = load i32, i32* %data, align 4, !dbg !19
  %42 = load i32, i32* %id, align 4, !dbg !20
  %43 = icmp ne i32 %42, 0, !dbg !20
  br i1 %43, label %then4, label %if.end6, !dbg !20

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !21
  %44 = load i32, i32* %err, align 4, !dbg !21
  br label %if.end6, !dbg !21

if.end6:                                          ; preds = %if.end3, %then4
  %45 = load i32, i32* %data, align 4, !dbg !22
  %46 = icmp ne i32 %45, 0, !dbg !22
  br i1 %46, label %then7, label %if.end9, !dbg !22

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !23
  %47 = load i32, i32* %err, align 4, !dbg !23
  br label %if.end9, !dbg !23

if.end9:                                          ; preds = %if.end6, %then7
  %48 = load i32, i32* %err, align 4, !dbg !24
  %49 = icmp eq i32 %48, 0, !dbg !24
  %. = select i1 %49, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0), !dbg !25
  %50 = call i32 (i8*, ...) @printf(i8* %.), !dbg !25
  %51 = load i32, i32* %err, align 4, !dbg !26
  ret i32 %51, !dbg !26
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "24.struct_array.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 8, type: !3, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 9, column: 3, scope: !2)
!8 = !DILocation(line: 14, column: 3, scope: !2)
!9 = !DILocation(line: 15, column: 3, scope: !2)
!10 = !DILocation(line: 16, column: 3, scope: !2)
!11 = !DILocation(line: 17, column: 3, scope: !2)
!12 = !DILocation(line: 19, column: 3, scope: !2)
!13 = !DILocation(line: 20, column: 3, scope: !2)
!14 = !DILocation(line: 21, column: 3, scope: !2)
!15 = !DILocation(line: 21, column: 17, scope: !2)
!16 = !DILocation(line: 22, column: 3, scope: !2)
!17 = !DILocation(line: 22, column: 19, scope: !2)
!18 = !DILocation(line: 24, column: 3, scope: !2)
!19 = !DILocation(line: 25, column: 3, scope: !2)
!20 = !DILocation(line: 26, column: 3, scope: !2)
!21 = !DILocation(line: 26, column: 16, scope: !2)
!22 = !DILocation(line: 27, column: 3, scope: !2)
!23 = !DILocation(line: 27, column: 18, scope: !2)
!24 = !DILocation(line: 29, column: 3, scope: !2)
!25 = !DILocation(line: 0, scope: !2)
!26 = !DILocation(line: 34, column: 3, scope: !2)
