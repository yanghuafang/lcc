; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

%struct.Point = type { i32, i32 }

@g_scalar = global i32 0
@g_arr = global [4 x i32] zeroinitializer
@g_matrix = global [2 x [3 x i32]] zeroinitializer
@g_ptr = global ptr null
@g_point = global %struct.Point zeroinitializer
@0 = private unnamed_addr constant [28 x i8] c"41.zero_init_global.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [28 x i8] c"41.zero_init_global.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !7, !DIExpression(), !8)
  store i32 0, ptr %err, align 4, !dbg !8
  %0 = load i32, ptr @g_scalar, align 4, !dbg !9
  %1 = icmp ne i32 %0, 0, !dbg !9
  %spec.store.select = select i1 %1, i32 1, i32 0, !dbg !9
  store i32 %spec.store.select, ptr %err, align 4, !dbg !10
  %2 = load i32, ptr @g_arr, align 4, !dbg !11
  %3 = icmp ne i32 %2, 0, !dbg !11
  %spec.store.select37 = select i1 %3, i32 1, i32 %spec.store.select, !dbg !11
  store i32 %spec.store.select37, ptr %err, align 4, !dbg !12
  %4 = load i32, ptr getelementptr (i32, ptr @g_arr, i32 1), align 4, !dbg !13
  %5 = icmp ne i32 %4, 0, !dbg !13
  %spec.store.select38 = select i1 %5, i32 1, i32 %spec.store.select37, !dbg !13
  store i32 %spec.store.select38, ptr %err, align 4, !dbg !14
  %6 = load i32, ptr getelementptr (i32, ptr @g_arr, i32 2), align 4, !dbg !15
  %7 = icmp ne i32 %6, 0, !dbg !15
  %spec.store.select39 = select i1 %7, i32 1, i32 %spec.store.select38, !dbg !15
  store i32 %spec.store.select39, ptr %err, align 4, !dbg !16
  %8 = load i32, ptr getelementptr (i32, ptr @g_arr, i32 3), align 4, !dbg !17
  %9 = icmp ne i32 %8, 0, !dbg !17
  %spec.store.select40 = select i1 %9, i32 1, i32 %spec.store.select39, !dbg !17
  store i32 %spec.store.select40, ptr %err, align 4, !dbg !18
  %10 = load i32, ptr @g_matrix, align 4, !dbg !19
  %11 = icmp ne i32 %10, 0, !dbg !19
  %spec.store.select41 = select i1 %11, i32 1, i32 %spec.store.select40, !dbg !19
  store i32 %spec.store.select41, ptr %err, align 4, !dbg !20
  %12 = load i32, ptr getelementptr (i32, ptr @g_matrix, i32 2), align 4, !dbg !21
  %13 = icmp ne i32 %12, 0, !dbg !21
  %spec.store.select42 = select i1 %13, i32 1, i32 %spec.store.select41, !dbg !21
  store i32 %spec.store.select42, ptr %err, align 4, !dbg !22
  %14 = load i32, ptr getelementptr (i32, ptr getelementptr ([3 x i32], ptr @g_matrix, i32 1), i32 1), align 4, !dbg !23
  %15 = icmp ne i32 %14, 0, !dbg !23
  %spec.store.select43 = select i1 %15, i32 1, i32 %spec.store.select42, !dbg !23
  store i32 %spec.store.select43, ptr %err, align 4, !dbg !24
  %16 = load i32, ptr getelementptr (i32, ptr getelementptr ([3 x i32], ptr @g_matrix, i32 1), i32 2), align 4, !dbg !25
  %17 = icmp ne i32 %16, 0, !dbg !25
  %spec.store.select44 = select i1 %17, i32 1, i32 %spec.store.select43, !dbg !25
  store i32 %spec.store.select44, ptr %err, align 4, !dbg !26
  %18 = load ptr, ptr @g_ptr, align 8, !dbg !27
  %19 = ptrtoint ptr %18 to i64, !dbg !27
  %20 = icmp ne i64 %19, 0, !dbg !27
  %spec.store.select45 = select i1 %20, i32 1, i32 %spec.store.select44, !dbg !27
  store i32 %spec.store.select45, ptr %err, align 4, !dbg !28
  %21 = load i32, ptr @g_point, align 4, !dbg !29
  %22 = icmp ne i32 %21, 0, !dbg !29
  %spec.store.select46 = select i1 %22, i32 1, i32 %spec.store.select45, !dbg !29
  store i32 %spec.store.select46, ptr %err, align 4, !dbg !30
  %23 = load i32, ptr getelementptr (%struct.Point, ptr @g_point, i32 0, i32 1), align 4, !dbg !31
  %24 = icmp ne i32 %23, 0, !dbg !31
  %spec.store.select47 = select i1 %24, i32 1, i32 %spec.store.select46, !dbg !31
  store i32 %spec.store.select47, ptr %err, align 4, !dbg !32
  %25 = load i32, ptr %err, align 4, !dbg !33
  %26 = icmp eq i32 %25, 0, !dbg !33
  %. = select i1 %26, ptr @0, ptr @1, !dbg !34
  %27 = call i32 (ptr, ...) @printf(ptr %.), !dbg !34
  %28 = load i32, ptr %err, align 4, !dbg !35
  ret i32 %28, !dbg !35
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "41.zero_init_global.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 17, type: !3, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 18, type: !5)
!8 = !DILocation(line: 18, column: 3, scope: !2)
!9 = !DILocation(line: 20, column: 3, scope: !2)
!10 = !DILocation(line: 20, scope: !2)
!11 = !DILocation(line: 22, column: 3, scope: !2)
!12 = !DILocation(line: 22, scope: !2)
!13 = !DILocation(line: 23, column: 3, scope: !2)
!14 = !DILocation(line: 23, scope: !2)
!15 = !DILocation(line: 24, column: 3, scope: !2)
!16 = !DILocation(line: 24, scope: !2)
!17 = !DILocation(line: 25, column: 3, scope: !2)
!18 = !DILocation(line: 25, scope: !2)
!19 = !DILocation(line: 27, column: 3, scope: !2)
!20 = !DILocation(line: 27, scope: !2)
!21 = !DILocation(line: 28, column: 3, scope: !2)
!22 = !DILocation(line: 28, scope: !2)
!23 = !DILocation(line: 29, column: 3, scope: !2)
!24 = !DILocation(line: 29, scope: !2)
!25 = !DILocation(line: 30, column: 3, scope: !2)
!26 = !DILocation(line: 30, scope: !2)
!27 = !DILocation(line: 32, column: 3, scope: !2)
!28 = !DILocation(line: 32, scope: !2)
!29 = !DILocation(line: 34, column: 3, scope: !2)
!30 = !DILocation(line: 34, scope: !2)
!31 = !DILocation(line: 35, column: 3, scope: !2)
!32 = !DILocation(line: 35, scope: !2)
!33 = !DILocation(line: 37, column: 3, scope: !2)
!34 = !DILocation(line: 0, scope: !2)
!35 = !DILocation(line: 42, column: 3, scope: !2)
