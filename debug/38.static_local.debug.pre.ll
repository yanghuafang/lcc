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
    #dbg_declare(ptr %err, !20, !DIExpression(), !21)
  store i32 0, ptr %err, align 4, !dbg !21
  %0 = call i32 @counter_calls(), !dbg !22
  %1 = icmp ne i32 %0, 1, !dbg !22
  br i1 %1, label %then, label %else, !dbg !22

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !23
  %2 = load i32, ptr %err, align 4, !dbg !23
  br label %if.end, !dbg !23

else:                                             ; preds = %entry
  br label %if.end, !dbg !23

if.end:                                           ; preds = %else, %then
  %3 = call i32 @counter_calls(), !dbg !24
  %4 = icmp ne i32 %3, 2, !dbg !24
  br i1 %4, label %then1, label %else2, !dbg !24

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !25
  %5 = load i32, ptr %err, align 4, !dbg !25
  br label %if.end3, !dbg !25

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !25

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @counter_calls(), !dbg !26
  %7 = icmp ne i32 %6, 3, !dbg !26
  br i1 %7, label %then4, label %else5, !dbg !26

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !27
  %8 = load i32, ptr %err, align 4, !dbg !27
  br label %if.end6, !dbg !27

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !27

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @counter_with_init(), !dbg !28
  %10 = icmp ne i32 %9, 11, !dbg !28
  br i1 %10, label %then7, label %else8, !dbg !28

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !29
  %11 = load i32, ptr %err, align 4, !dbg !29
  br label %if.end9, !dbg !29

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !29

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @counter_with_init(), !dbg !30
  %13 = icmp ne i32 %12, 12, !dbg !30
  br i1 %13, label %then10, label %else11, !dbg !30

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !31
  %14 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end12, !dbg !31

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !31

if.end12:                                         ; preds = %else11, %then10
  %15 = call i32 @bump_runtime_static_decl(), !dbg !32
  %16 = icmp ne i32 %15, 8, !dbg !32
  br i1 %16, label %then13, label %else14, !dbg !32

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !33
  %17 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end15, !dbg !33

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !33

if.end15:                                         ; preds = %else14, %then13
  %18 = call i32 @bump_runtime_static_decl(), !dbg !34
  %19 = icmp ne i32 %18, 9, !dbg !34
  br i1 %19, label %then16, label %else17, !dbg !34

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !35
  %20 = load i32, ptr %err, align 4, !dbg !35
  br label %if.end18, !dbg !35

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !35

if.end18:                                         ; preds = %else17, %then16
  %21 = load i32, ptr %err, align 4, !dbg !36
  %22 = icmp eq i32 %21, 0, !dbg !36
  br i1 %22, label %then19, label %else20, !dbg !36

then19:                                           ; preds = %if.end18
  %23 = call i32 (ptr, ...) @printf(ptr @0), !dbg !37
  br label %if.end21, !dbg !37

else20:                                           ; preds = %if.end18
  %24 = call i32 (ptr, ...) @printf(ptr @1), !dbg !39
  br label %if.end21, !dbg !39

if.end21:                                         ; preds = %else20, %then19
  %25 = load i32, ptr %err, align 4, !dbg !41
  ret i32 %25, !dbg !41
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "38.static_local.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "get_seed", linkageName: "get_seed", scope: null, file: !3, line: 7, type: !5, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocation(line: 7, column: 22, scope: !4)
!9 = distinct !DISubprogram(name: "counter_calls", linkageName: "counter_calls", scope: null, file: !3, line: 9, type: !5, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !2)
!10 = !DILocation(line: 11, column: 3, scope: !9)
!11 = !DILocation(line: 12, column: 3, scope: !9)
!12 = distinct !DISubprogram(name: "counter_with_init", linkageName: "counter_with_init", scope: null, file: !3, line: 15, type: !5, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !2)
!13 = !DILocation(line: 17, column: 3, scope: !12)
!14 = !DILocation(line: 18, column: 3, scope: !12)
!15 = distinct !DISubprogram(name: "bump_runtime_static_decl", linkageName: "bump_runtime_static_decl", scope: null, file: !3, line: 21, type: !5, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !2)
!16 = !DILocation(line: 22, column: 10, scope: !15)
!17 = !DILocation(line: 23, column: 3, scope: !15)
!18 = !DILocation(line: 24, column: 3, scope: !15)
!19 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 27, type: !5, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !2)
!20 = !DILocalVariable(name: "err", scope: !19, file: !3, line: 28, type: !7)
!21 = !DILocation(line: 28, column: 3, scope: !19)
!22 = !DILocation(line: 30, column: 3, scope: !19)
!23 = !DILocation(line: 30, column: 29, scope: !19)
!24 = !DILocation(line: 31, column: 3, scope: !19)
!25 = !DILocation(line: 31, column: 29, scope: !19)
!26 = !DILocation(line: 32, column: 3, scope: !19)
!27 = !DILocation(line: 32, column: 29, scope: !19)
!28 = !DILocation(line: 34, column: 3, scope: !19)
!29 = !DILocation(line: 34, column: 34, scope: !19)
!30 = !DILocation(line: 35, column: 3, scope: !19)
!31 = !DILocation(line: 35, column: 34, scope: !19)
!32 = !DILocation(line: 37, column: 3, scope: !19)
!33 = !DILocation(line: 37, column: 40, scope: !19)
!34 = !DILocation(line: 38, column: 3, scope: !19)
!35 = !DILocation(line: 38, column: 40, scope: !19)
!36 = !DILocation(line: 40, column: 3, scope: !19)
!37 = !DILocation(line: 41, column: 5, scope: !38)
!38 = distinct !DILexicalBlock(scope: !19, file: !3, line: 40, column: 17)
!39 = !DILocation(line: 43, column: 5, scope: !40)
!40 = distinct !DILexicalBlock(scope: !19, file: !3, line: 42, column: 10)
!41 = !DILocation(line: 45, column: 3, scope: !19)
