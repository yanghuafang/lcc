; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

%struct.Data = type { i32, i32 }

@0 = private unnamed_addr constant [24 x i8] c"24.struct_array.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"24.struct_array.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %data = alloca i32, align 4
    #dbg_declare(ptr %data, !7, !DIExpression(), !8)
  %id = alloca i32, align 4
    #dbg_declare(ptr %id, !9, !DIExpression(), !10)
  %da = alloca [2 x %struct.Data], align 8
    #dbg_declare(ptr %da, !11, !DIExpression(), !16)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !17, !DIExpression(), !18)
  store i32 0, ptr %err, align 4, !dbg !18
  %0 = bitcast ptr %da to ptr, !dbg !19
  %1 = bitcast ptr %0 to ptr, !dbg !19
  store i32 0, ptr %1, align 4, !dbg !19
  %2 = load i32, ptr %1, align 4, !dbg !19
  %3 = bitcast ptr %da to ptr, !dbg !20
  %4 = getelementptr %struct.Data, ptr %3, i32 0, i32 1, !dbg !20
  store i32 0, ptr %4, align 4, !dbg !20
  %5 = load i32, ptr %4, align 4, !dbg !20
  %6 = getelementptr %struct.Data, ptr %da, i32 1, !dbg !21
  %7 = bitcast ptr %6 to ptr, !dbg !21
  store i32 10, ptr %7, align 4, !dbg !21
  %8 = load i32, ptr %7, align 4, !dbg !21
  %9 = getelementptr %struct.Data, ptr %da, i32 1, !dbg !22
  %10 = getelementptr %struct.Data, ptr %9, i32 0, i32 1, !dbg !22
  store i32 80, ptr %10, align 4, !dbg !22
  %11 = load i32, ptr %10, align 4, !dbg !22
  %12 = getelementptr %struct.Data, ptr %da, i32 1, !dbg !23
  %13 = bitcast ptr %12 to ptr, !dbg !23
  %14 = load i32, ptr %13, align 4, !dbg !23
  store i32 %14, ptr %id, align 4, !dbg !23
  %15 = load i32, ptr %id, align 4, !dbg !23
  %16 = getelementptr %struct.Data, ptr %da, i32 1, !dbg !24
  %17 = getelementptr %struct.Data, ptr %16, i32 0, i32 1, !dbg !24
  %18 = load i32, ptr %17, align 4, !dbg !24
  store i32 %18, ptr %data, align 4, !dbg !24
  %19 = load i32, ptr %data, align 4, !dbg !24
  %20 = load i32, ptr %id, align 4, !dbg !25
  %21 = icmp ne i32 %20, 10, !dbg !25
  br i1 %21, label %then, label %if.end, !dbg !25

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !26
  %22 = load i32, ptr %err, align 4, !dbg !26
  br label %if.end, !dbg !26

if.end:                                           ; preds = %entry, %then
  %23 = load i32, ptr %data, align 4, !dbg !27
  %24 = icmp ne i32 %23, 80, !dbg !27
  br i1 %24, label %then1, label %if.end3, !dbg !27

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !28
  %25 = load i32, ptr %err, align 4, !dbg !28
  br label %if.end3, !dbg !28

if.end3:                                          ; preds = %if.end, %then1
  %26 = bitcast ptr %da to ptr, !dbg !29
  %27 = bitcast ptr %26 to ptr, !dbg !29
  %28 = load i32, ptr %27, align 4, !dbg !29
  store i32 %28, ptr %id, align 4, !dbg !29
  %29 = load i32, ptr %id, align 4, !dbg !29
  %30 = bitcast ptr %da to ptr, !dbg !30
  %31 = getelementptr %struct.Data, ptr %30, i32 0, i32 1, !dbg !30
  %32 = load i32, ptr %31, align 4, !dbg !30
  store i32 %32, ptr %data, align 4, !dbg !30
  %33 = load i32, ptr %data, align 4, !dbg !30
  %34 = load i32, ptr %id, align 4, !dbg !31
  %35 = icmp ne i32 %34, 0, !dbg !31
  br i1 %35, label %then4, label %if.end6, !dbg !31

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !32
  %36 = load i32, ptr %err, align 4, !dbg !32
  br label %if.end6, !dbg !32

if.end6:                                          ; preds = %if.end3, %then4
  %37 = load i32, ptr %data, align 4, !dbg !33
  %38 = icmp ne i32 %37, 0, !dbg !33
  br i1 %38, label %then7, label %if.end9, !dbg !33

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !34
  %39 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end9, !dbg !34

if.end9:                                          ; preds = %if.end6, %then7
  %40 = load i32, ptr %err, align 4, !dbg !35
  %41 = icmp eq i32 %40, 0, !dbg !35
  %. = select i1 %41, ptr @0, ptr @1, !dbg !36
  %42 = call i32 (ptr, ...) @printf(ptr %.), !dbg !36
  %43 = load i32, ptr %err, align 4, !dbg !37
  ret i32 %43, !dbg !37
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "24.struct_array.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 8, type: !3, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "data", scope: !2, file: !1, line: 12, type: !5)
!8 = !DILocation(line: 12, column: 3, scope: !2)
!9 = !DILocalVariable(name: "id", scope: !2, file: !1, line: 11, type: !5)
!10 = !DILocation(line: 11, column: 3, scope: !2)
!11 = !DILocalVariable(name: "da", scope: !2, file: !1, line: 10, type: !12)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 128, align: 32, elements: !14)
!13 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!14 = !{!15}
!15 = !DISubrange(count: 2, lowerBound: 0)
!16 = !DILocation(line: 10, column: 3, scope: !2)
!17 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 9, type: !5)
!18 = !DILocation(line: 9, column: 3, scope: !2)
!19 = !DILocation(line: 14, column: 3, scope: !2)
!20 = !DILocation(line: 15, column: 3, scope: !2)
!21 = !DILocation(line: 16, column: 3, scope: !2)
!22 = !DILocation(line: 17, column: 3, scope: !2)
!23 = !DILocation(line: 19, column: 3, scope: !2)
!24 = !DILocation(line: 20, column: 3, scope: !2)
!25 = !DILocation(line: 21, column: 3, scope: !2)
!26 = !DILocation(line: 21, column: 17, scope: !2)
!27 = !DILocation(line: 22, column: 3, scope: !2)
!28 = !DILocation(line: 22, column: 19, scope: !2)
!29 = !DILocation(line: 24, column: 3, scope: !2)
!30 = !DILocation(line: 25, column: 3, scope: !2)
!31 = !DILocation(line: 26, column: 3, scope: !2)
!32 = !DILocation(line: 26, column: 16, scope: !2)
!33 = !DILocation(line: 27, column: 3, scope: !2)
!34 = !DILocation(line: 27, column: 18, scope: !2)
!35 = !DILocation(line: 29, column: 3, scope: !2)
!36 = !DILocation(line: 0, scope: !2)
!37 = !DILocation(line: 34, column: 3, scope: !2)
