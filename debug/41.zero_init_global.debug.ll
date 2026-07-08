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

define i32 @main() !dbg !4 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !9, !DIExpression(), !10)
  store i32 0, ptr %err, align 4, !dbg !10
  %0 = load i32, ptr @g_scalar, align 4, !dbg !11
  %1 = icmp ne i32 %0, 0, !dbg !11
  br i1 %1, label %then, label %else, !dbg !11

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !12
  %2 = load i32, ptr %err, align 4, !dbg !12
  br label %if.end, !dbg !12

else:                                             ; preds = %entry
  br label %if.end, !dbg !12

if.end:                                           ; preds = %else, %then
  %3 = load i32, ptr @g_arr, align 4, !dbg !13
  %4 = icmp ne i32 %3, 0, !dbg !13
  br i1 %4, label %then1, label %else2, !dbg !13

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !14
  %5 = load i32, ptr %err, align 4, !dbg !14
  br label %if.end3, !dbg !14

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !14

if.end3:                                          ; preds = %else2, %then1
  %6 = load i32, ptr getelementptr (i32, ptr @g_arr, i32 1), align 4, !dbg !15
  %7 = icmp ne i32 %6, 0, !dbg !15
  br i1 %7, label %then4, label %else5, !dbg !15

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !16
  %8 = load i32, ptr %err, align 4, !dbg !16
  br label %if.end6, !dbg !16

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !16

if.end6:                                          ; preds = %else5, %then4
  %9 = load i32, ptr getelementptr (i32, ptr @g_arr, i32 2), align 4, !dbg !17
  %10 = icmp ne i32 %9, 0, !dbg !17
  br i1 %10, label %then7, label %else8, !dbg !17

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !18
  %11 = load i32, ptr %err, align 4, !dbg !18
  br label %if.end9, !dbg !18

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !18

if.end9:                                          ; preds = %else8, %then7
  %12 = load i32, ptr getelementptr (i32, ptr @g_arr, i32 3), align 4, !dbg !19
  %13 = icmp ne i32 %12, 0, !dbg !19
  br i1 %13, label %then10, label %else11, !dbg !19

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !20
  %14 = load i32, ptr %err, align 4, !dbg !20
  br label %if.end12, !dbg !20

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !20

if.end12:                                         ; preds = %else11, %then10
  %15 = load i32, ptr @g_matrix, align 4, !dbg !21
  %16 = icmp ne i32 %15, 0, !dbg !21
  br i1 %16, label %then13, label %else14, !dbg !21

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !22
  %17 = load i32, ptr %err, align 4, !dbg !22
  br label %if.end15, !dbg !22

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !22

if.end15:                                         ; preds = %else14, %then13
  %18 = load i32, ptr getelementptr (i32, ptr @g_matrix, i32 2), align 4, !dbg !23
  %19 = icmp ne i32 %18, 0, !dbg !23
  br i1 %19, label %then16, label %else17, !dbg !23

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !24
  %20 = load i32, ptr %err, align 4, !dbg !24
  br label %if.end18, !dbg !24

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !24

if.end18:                                         ; preds = %else17, %then16
  %21 = load i32, ptr getelementptr (i32, ptr getelementptr ([3 x i32], ptr @g_matrix, i32 1), i32 1), align 4, !dbg !25
  %22 = icmp ne i32 %21, 0, !dbg !25
  br i1 %22, label %then19, label %else20, !dbg !25

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !26
  %23 = load i32, ptr %err, align 4, !dbg !26
  br label %if.end21, !dbg !26

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !26

if.end21:                                         ; preds = %else20, %then19
  %24 = load i32, ptr getelementptr (i32, ptr getelementptr ([3 x i32], ptr @g_matrix, i32 1), i32 2), align 4, !dbg !27
  %25 = icmp ne i32 %24, 0, !dbg !27
  br i1 %25, label %then22, label %else23, !dbg !27

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !28
  %26 = load i32, ptr %err, align 4, !dbg !28
  br label %if.end24, !dbg !28

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !28

if.end24:                                         ; preds = %else23, %then22
  %27 = load ptr, ptr @g_ptr, align 8, !dbg !29
  %28 = ptrtoint ptr %27 to i64, !dbg !29
  %29 = icmp ne i64 %28, 0, !dbg !29
  br i1 %29, label %then25, label %else26, !dbg !29

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !30
  %30 = load i32, ptr %err, align 4, !dbg !30
  br label %if.end27, !dbg !30

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !30

if.end27:                                         ; preds = %else26, %then25
  %31 = load i32, ptr @g_point, align 4, !dbg !31
  %32 = icmp ne i32 %31, 0, !dbg !31
  br i1 %32, label %then28, label %else29, !dbg !31

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !32
  %33 = load i32, ptr %err, align 4, !dbg !32
  br label %if.end30, !dbg !32

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !32

if.end30:                                         ; preds = %else29, %then28
  %34 = load i32, ptr getelementptr (%struct.Point, ptr @g_point, i32 0, i32 1), align 4, !dbg !33
  %35 = icmp ne i32 %34, 0, !dbg !33
  br i1 %35, label %then31, label %else32, !dbg !33

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !34
  %36 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end33, !dbg !34

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !34

if.end33:                                         ; preds = %else32, %then31
  %37 = load i32, ptr %err, align 4, !dbg !35
  %38 = icmp eq i32 %37, 0, !dbg !35
  br i1 %38, label %then34, label %else35, !dbg !35

then34:                                           ; preds = %if.end33
  %39 = call i32 (ptr, ...) @printf(ptr @0), !dbg !36
  br label %if.end36, !dbg !36

else35:                                           ; preds = %if.end33
  %40 = call i32 (ptr, ...) @printf(ptr @1), !dbg !38
  br label %if.end36, !dbg !38

if.end36:                                         ; preds = %else35, %then34
  %41 = load i32, ptr %err, align 4, !dbg !40
  ret i32 %41, !dbg !40
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "41.zero_init_global.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 17, type: !5, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 18, type: !7)
!10 = !DILocation(line: 18, column: 3, scope: !4)
!11 = !DILocation(line: 20, column: 3, scope: !4)
!12 = !DILocation(line: 20, column: 22, scope: !4)
!13 = !DILocation(line: 22, column: 3, scope: !4)
!14 = !DILocation(line: 22, column: 22, scope: !4)
!15 = !DILocation(line: 23, column: 3, scope: !4)
!16 = !DILocation(line: 23, column: 22, scope: !4)
!17 = !DILocation(line: 24, column: 3, scope: !4)
!18 = !DILocation(line: 24, column: 22, scope: !4)
!19 = !DILocation(line: 25, column: 3, scope: !4)
!20 = !DILocation(line: 25, column: 22, scope: !4)
!21 = !DILocation(line: 27, column: 3, scope: !4)
!22 = !DILocation(line: 27, column: 28, scope: !4)
!23 = !DILocation(line: 28, column: 3, scope: !4)
!24 = !DILocation(line: 28, column: 28, scope: !4)
!25 = !DILocation(line: 29, column: 3, scope: !4)
!26 = !DILocation(line: 29, column: 28, scope: !4)
!27 = !DILocation(line: 30, column: 3, scope: !4)
!28 = !DILocation(line: 30, column: 28, scope: !4)
!29 = !DILocation(line: 32, column: 3, scope: !4)
!30 = !DILocation(line: 32, column: 19, scope: !4)
!31 = !DILocation(line: 34, column: 3, scope: !4)
!32 = !DILocation(line: 34, column: 23, scope: !4)
!33 = !DILocation(line: 35, column: 3, scope: !4)
!34 = !DILocation(line: 35, column: 23, scope: !4)
!35 = !DILocation(line: 37, column: 3, scope: !4)
!36 = !DILocation(line: 38, column: 5, scope: !37)
!37 = distinct !DILexicalBlock(scope: !4, file: !1, line: 37, column: 17)
!38 = !DILocation(line: 40, column: 5, scope: !39)
!39 = distinct !DILexicalBlock(scope: !4, file: !1, line: 39, column: 10)
!40 = !DILocation(line: 42, column: 3, scope: !4)
