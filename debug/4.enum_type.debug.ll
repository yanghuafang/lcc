; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [20 x i8] c"4.enum_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"4.enum_type.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %v = alloca i32, align 4
    #dbg_declare(ptr %v, !9, !DIExpression(), !10)
  %sex = alloca i32, align 4
    #dbg_declare(ptr %sex, !11, !DIExpression(), !12)
  %day = alloca i32, align 4
    #dbg_declare(ptr %day, !13, !DIExpression(), !14)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !15, !DIExpression(), !16)
  store i32 0, ptr %err, align 4, !dbg !16
  store i32 5, ptr %day, align 4, !dbg !14
  store i32 1, ptr %sex, align 4, !dbg !12
  store i32 0, ptr %v, align 4, !dbg !17
  %0 = load i32, ptr %v, align 4, !dbg !17
  %1 = load i32, ptr %v, align 4, !dbg !18
  %2 = icmp ne i32 %1, 0, !dbg !18
  br i1 %2, label %then, label %if.end, !dbg !18

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !19
  %3 = load i32, ptr %err, align 4, !dbg !19
  br label %if.end, !dbg !19

if.end:                                           ; preds = %entry, %then
  store i32 1, ptr %v, align 4, !dbg !20
  %4 = load i32, ptr %v, align 4, !dbg !20
  %5 = load i32, ptr %v, align 4, !dbg !21
  %6 = icmp ne i32 %5, 1, !dbg !21
  br i1 %6, label %then1, label %if.end3, !dbg !21

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !22
  %7 = load i32, ptr %err, align 4, !dbg !22
  br label %if.end3, !dbg !22

if.end3:                                          ; preds = %if.end, %then1
  store i32 5, ptr %v, align 4, !dbg !23
  %8 = load i32, ptr %v, align 4, !dbg !23
  %9 = load i32, ptr %v, align 4, !dbg !24
  %10 = icmp ne i32 %9, 5, !dbg !24
  br i1 %10, label %then4, label %if.end6, !dbg !24

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !25
  %11 = load i32, ptr %err, align 4, !dbg !25
  br label %if.end6, !dbg !25

if.end6:                                          ; preds = %if.end3, %then4
  store i32 6, ptr %v, align 4, !dbg !26
  %12 = load i32, ptr %v, align 4, !dbg !26
  %13 = load i32, ptr %v, align 4, !dbg !27
  %14 = icmp ne i32 %13, 6, !dbg !27
  br i1 %14, label %then7, label %if.end9, !dbg !27

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !28
  %15 = load i32, ptr %err, align 4, !dbg !28
  br label %if.end9, !dbg !28

if.end9:                                          ; preds = %if.end6, %then7
  %16 = load i32, ptr %day, align 4, !dbg !29
  store i32 %16, ptr %v, align 4, !dbg !29
  %17 = load i32, ptr %v, align 4, !dbg !29
  %18 = load i32, ptr %v, align 4, !dbg !30
  %19 = icmp ne i32 %18, 5, !dbg !30
  br i1 %19, label %then10, label %if.end12, !dbg !30

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !31
  %20 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end12, !dbg !31

if.end12:                                         ; preds = %if.end9, %then10
  store i32 0, ptr %v, align 4, !dbg !32
  %21 = load i32, ptr %v, align 4, !dbg !32
  %22 = load i32, ptr %v, align 4, !dbg !33
  %23 = icmp ne i32 %22, 0, !dbg !33
  br i1 %23, label %then13, label %if.end15, !dbg !33

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !34
  %24 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end15, !dbg !34

if.end15:                                         ; preds = %if.end12, %then13
  store i32 1, ptr %v, align 4, !dbg !35
  %25 = load i32, ptr %v, align 4, !dbg !35
  %26 = load i32, ptr %v, align 4, !dbg !36
  %27 = icmp ne i32 %26, 1, !dbg !36
  br i1 %27, label %then16, label %if.end18, !dbg !36

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !37
  %28 = load i32, ptr %err, align 4, !dbg !37
  br label %if.end18, !dbg !37

if.end18:                                         ; preds = %if.end15, %then16
  %29 = load i32, ptr %sex, align 4, !dbg !38
  store i32 %29, ptr %v, align 4, !dbg !38
  %30 = load i32, ptr %v, align 4, !dbg !38
  %31 = load i32, ptr %v, align 4, !dbg !39
  %32 = icmp ne i32 %31, 1, !dbg !39
  br i1 %32, label %then19, label %if.end21, !dbg !39

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !40
  %33 = load i32, ptr %err, align 4, !dbg !40
  br label %if.end21, !dbg !40

if.end21:                                         ; preds = %if.end18, %then19
  %34 = load i32, ptr %err, align 4, !dbg !41
  %35 = icmp eq i32 %34, 0, !dbg !41
  %. = select i1 %35, ptr @0, ptr @1, !dbg !42
  %36 = call i32 (ptr, ...) @printf(ptr %.), !dbg !42
  %37 = load i32, ptr %err, align 4, !dbg !43
  ret i32 %37, !dbg !43
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "4.enum_type.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 15, type: !5, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "v", scope: !4, file: !1, line: 19, type: !7)
!10 = !DILocation(line: 19, column: 3, scope: !4)
!11 = !DILocalVariable(name: "sex", scope: !4, file: !1, line: 18, type: !7)
!12 = !DILocation(line: 18, column: 3, scope: !4)
!13 = !DILocalVariable(name: "day", scope: !4, file: !1, line: 17, type: !7)
!14 = !DILocation(line: 17, column: 3, scope: !4)
!15 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 16, type: !7)
!16 = !DILocation(line: 16, column: 3, scope: !4)
!17 = !DILocation(line: 21, column: 3, scope: !4)
!18 = !DILocation(line: 22, column: 3, scope: !4)
!19 = !DILocation(line: 22, column: 15, scope: !4)
!20 = !DILocation(line: 23, column: 3, scope: !4)
!21 = !DILocation(line: 24, column: 3, scope: !4)
!22 = !DILocation(line: 24, column: 15, scope: !4)
!23 = !DILocation(line: 25, column: 3, scope: !4)
!24 = !DILocation(line: 26, column: 3, scope: !4)
!25 = !DILocation(line: 26, column: 15, scope: !4)
!26 = !DILocation(line: 27, column: 3, scope: !4)
!27 = !DILocation(line: 28, column: 3, scope: !4)
!28 = !DILocation(line: 28, column: 15, scope: !4)
!29 = !DILocation(line: 29, column: 3, scope: !4)
!30 = !DILocation(line: 30, column: 3, scope: !4)
!31 = !DILocation(line: 30, column: 15, scope: !4)
!32 = !DILocation(line: 31, column: 3, scope: !4)
!33 = !DILocation(line: 32, column: 3, scope: !4)
!34 = !DILocation(line: 32, column: 15, scope: !4)
!35 = !DILocation(line: 33, column: 3, scope: !4)
!36 = !DILocation(line: 34, column: 3, scope: !4)
!37 = !DILocation(line: 34, column: 15, scope: !4)
!38 = !DILocation(line: 35, column: 3, scope: !4)
!39 = !DILocation(line: 36, column: 3, scope: !4)
!40 = !DILocation(line: 36, column: 15, scope: !4)
!41 = !DILocation(line: 38, column: 3, scope: !4)
!42 = !DILocation(line: 0, scope: !4)
!43 = !DILocation(line: 43, column: 3, scope: !4)
