; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@counter_calls.count = internal global i32 0
@counter_with_init.count = internal global i32 10
@bump_runtime_static_decl.value = internal global i32 0
@bump_runtime_static_decl.value.inited = private global i1 false
@0 = private unnamed_addr constant [24 x i8] c"38.static_local.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"38.static_local.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @get_seed() !dbg !4 {
entry:
  ret i32 7, !dbg !8
}

define i32 @counter_calls() !dbg !9 {
entry:
  %0 = load i32, ptr @counter_calls.count, align 4, !dbg !10
  %1 = add i32 %0, 1, !dbg !10
  store i32 %1, ptr @counter_calls.count, align 4, !dbg !10
  %2 = load i32, ptr @counter_calls.count, align 4, !dbg !11
  ret i32 %2, !dbg !11
}

define i32 @counter_with_init() !dbg !12 {
entry:
  %0 = load i32, ptr @counter_with_init.count, align 4, !dbg !13
  %1 = add i32 %0, 1, !dbg !13
  store i32 %1, ptr @counter_with_init.count, align 4, !dbg !13
  %2 = load i32, ptr @counter_with_init.count, align 4, !dbg !14
  ret i32 %2, !dbg !14
}

define i32 @bump_runtime_static_decl() !dbg !15 {
entry:
  %static.inited = load i1, ptr @bump_runtime_static_decl.value.inited, align 1, !dbg !16
  br i1 %static.inited, label %static.cont, label %static.init, !dbg !16

static.init:                                      ; preds = %entry
  %0 = call i32 @get_seed(), !dbg !16
  store i32 %0, ptr @bump_runtime_static_decl.value, align 4, !dbg !16
  store i1 true, ptr @bump_runtime_static_decl.value.inited, align 1, !dbg !16
  br label %static.cont, !dbg !16

static.cont:                                      ; preds = %static.init, %entry
  %1 = load i32, ptr @bump_runtime_static_decl.value, align 4, !dbg !17
  %2 = add i32 %1, 1, !dbg !17
  store i32 %2, ptr @bump_runtime_static_decl.value, align 4, !dbg !17
  %3 = load i32, ptr @bump_runtime_static_decl.value, align 4, !dbg !18
  ret i32 %3, !dbg !18
}

define i32 @main() !dbg !19 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !21, !DIExpression(), !22)
  store i32 0, ptr %err, align 4, !dbg !22
  %0 = call i32 @counter_calls(), !dbg !23
  %1 = icmp ne i32 %0, 1, !dbg !23
  br i1 %1, label %then, label %else, !dbg !23

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !24
  %2 = load i32, ptr %err, align 4, !dbg !24
  br label %if.end, !dbg !24

else:                                             ; preds = %entry
  br label %if.end, !dbg !24

if.end:                                           ; preds = %else, %then
  %3 = call i32 @counter_calls(), !dbg !25
  %4 = icmp ne i32 %3, 2, !dbg !25
  br i1 %4, label %then1, label %else2, !dbg !25

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !26
  %5 = load i32, ptr %err, align 4, !dbg !26
  br label %if.end3, !dbg !26

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !26

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @counter_calls(), !dbg !27
  %7 = icmp ne i32 %6, 3, !dbg !27
  br i1 %7, label %then4, label %else5, !dbg !27

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !28
  %8 = load i32, ptr %err, align 4, !dbg !28
  br label %if.end6, !dbg !28

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !28

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @counter_with_init(), !dbg !29
  %10 = icmp ne i32 %9, 11, !dbg !29
  br i1 %10, label %then7, label %else8, !dbg !29

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !30
  %11 = load i32, ptr %err, align 4, !dbg !30
  br label %if.end9, !dbg !30

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !30

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @counter_with_init(), !dbg !31
  %13 = icmp ne i32 %12, 12, !dbg !31
  br i1 %13, label %then10, label %else11, !dbg !31

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !32
  %14 = load i32, ptr %err, align 4, !dbg !32
  br label %if.end12, !dbg !32

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !32

if.end12:                                         ; preds = %else11, %then10
  %15 = call i32 @bump_runtime_static_decl(), !dbg !33
  %16 = icmp ne i32 %15, 8, !dbg !33
  br i1 %16, label %then13, label %else14, !dbg !33

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !34
  %17 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end15, !dbg !34

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !34

if.end15:                                         ; preds = %else14, %then13
  %18 = call i32 @bump_runtime_static_decl(), !dbg !35
  %19 = icmp ne i32 %18, 9, !dbg !35
  br i1 %19, label %then16, label %else17, !dbg !35

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !36
  %20 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end18, !dbg !36

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !36

if.end18:                                         ; preds = %else17, %then16
  %21 = load i32, ptr %err, align 4, !dbg !37
  %22 = icmp eq i32 %21, 0, !dbg !37
  br i1 %22, label %then19, label %else20, !dbg !37

then19:                                           ; preds = %if.end18
  %23 = call i32 (ptr, ...) @printf(ptr @0), !dbg !38
  br label %if.end21, !dbg !38

else20:                                           ; preds = %if.end18
  %24 = call i32 (ptr, ...) @printf(ptr @1), !dbg !40
  br label %if.end21, !dbg !40

if.end21:                                         ; preds = %else20, %then19
  %25 = load i32, ptr %err, align 4, !dbg !42
  ret i32 %25, !dbg !42
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "38.static_local.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "get_seed", linkageName: "get_seed", scope: null, file: !1, line: 7, type: !5, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocation(line: 7, column: 22, scope: !4)
!9 = distinct !DISubprogram(name: "counter_calls", linkageName: "counter_calls", scope: null, file: !1, line: 9, type: !5, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DILocation(line: 11, column: 3, scope: !9)
!11 = !DILocation(line: 12, column: 3, scope: !9)
!12 = distinct !DISubprogram(name: "counter_with_init", linkageName: "counter_with_init", scope: null, file: !1, line: 15, type: !5, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !0)
!13 = !DILocation(line: 17, column: 3, scope: !12)
!14 = !DILocation(line: 18, column: 3, scope: !12)
!15 = distinct !DISubprogram(name: "bump_runtime_static_decl", linkageName: "bump_runtime_static_decl", scope: null, file: !1, line: 21, type: !5, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !0)
!16 = !DILocation(line: 22, column: 10, scope: !15)
!17 = !DILocation(line: 23, column: 3, scope: !15)
!18 = !DILocation(line: 24, column: 3, scope: !15)
!19 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 27, type: !5, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!20 = !{}
!21 = !DILocalVariable(name: "err", scope: !19, file: !1, line: 28, type: !7)
!22 = !DILocation(line: 28, column: 3, scope: !19)
!23 = !DILocation(line: 30, column: 3, scope: !19)
!24 = !DILocation(line: 30, column: 29, scope: !19)
!25 = !DILocation(line: 31, column: 3, scope: !19)
!26 = !DILocation(line: 31, column: 29, scope: !19)
!27 = !DILocation(line: 32, column: 3, scope: !19)
!28 = !DILocation(line: 32, column: 29, scope: !19)
!29 = !DILocation(line: 34, column: 3, scope: !19)
!30 = !DILocation(line: 34, column: 34, scope: !19)
!31 = !DILocation(line: 35, column: 3, scope: !19)
!32 = !DILocation(line: 35, column: 34, scope: !19)
!33 = !DILocation(line: 37, column: 3, scope: !19)
!34 = !DILocation(line: 37, column: 40, scope: !19)
!35 = !DILocation(line: 38, column: 3, scope: !19)
!36 = !DILocation(line: 38, column: 40, scope: !19)
!37 = !DILocation(line: 40, column: 3, scope: !19)
!38 = !DILocation(line: 41, column: 5, scope: !39)
!39 = distinct !DILexicalBlock(scope: !19, file: !1, line: 40, column: 17)
!40 = !DILocation(line: 43, column: 5, scope: !41)
!41 = distinct !DILexicalBlock(scope: !19, file: !1, line: 42, column: 10)
!42 = !DILocation(line: 45, column: 3, scope: !19)
