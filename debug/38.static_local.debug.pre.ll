; ModuleID = 'lcc'
source_filename = "lcc"

@counter_calls.count = internal global i32 0
@counter_with_init.count = internal global i32 10
@bump_runtime_static_decl.value = internal global i32 0
@bump_runtime_static_decl.value.inited = private global i1 false
@0 = private unnamed_addr constant [24 x i8] c"38.static_local.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"38.static_local.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @get_seed() !dbg !2 {
entry:
  ret i32 7, !dbg !6
}

define i32 @counter_calls() !dbg !7 {
entry:
  %0 = load i32, ptr @counter_calls.count, align 4, !dbg !8
  %1 = add i32 %0, 1, !dbg !8
  store i32 %1, ptr @counter_calls.count, align 4, !dbg !8
  %2 = load i32, ptr @counter_calls.count, align 4, !dbg !9
  ret i32 %2, !dbg !9
}

define i32 @counter_with_init() !dbg !10 {
entry:
  %0 = load i32, ptr @counter_with_init.count, align 4, !dbg !11
  %1 = add i32 %0, 1, !dbg !11
  store i32 %1, ptr @counter_with_init.count, align 4, !dbg !11
  %2 = load i32, ptr @counter_with_init.count, align 4, !dbg !12
  ret i32 %2, !dbg !12
}

define i32 @bump_runtime_static_decl() !dbg !13 {
entry:
  %static.inited = load i1, ptr @bump_runtime_static_decl.value.inited, align 1, !dbg !14
  br i1 %static.inited, label %static.cont, label %static.init, !dbg !14

static.init:                                      ; preds = %entry
  %0 = call i32 @get_seed(), !dbg !14
  store i32 %0, ptr @bump_runtime_static_decl.value, align 4, !dbg !14
  store i1 true, ptr @bump_runtime_static_decl.value.inited, align 1, !dbg !14
  br label %static.cont, !dbg !14

static.cont:                                      ; preds = %static.init, %entry
  %1 = load i32, ptr @bump_runtime_static_decl.value, align 4, !dbg !15
  %2 = add i32 %1, 1, !dbg !15
  store i32 %2, ptr @bump_runtime_static_decl.value, align 4, !dbg !15
  %3 = load i32, ptr @bump_runtime_static_decl.value, align 4, !dbg !16
  ret i32 %3, !dbg !16
}

define i32 @main() !dbg !17 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !18, !DIExpression(), !19)
  store i32 0, ptr %err, align 4, !dbg !19
  %0 = call i32 @counter_calls(), !dbg !20
  %1 = icmp ne i32 %0, 1, !dbg !20
  br i1 %1, label %then, label %else, !dbg !20

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !21
  %2 = load i32, ptr %err, align 4, !dbg !21
  br label %if.end, !dbg !21

else:                                             ; preds = %entry
  br label %if.end, !dbg !21

if.end:                                           ; preds = %else, %then
  %3 = call i32 @counter_calls(), !dbg !22
  %4 = icmp ne i32 %3, 2, !dbg !22
  br i1 %4, label %then1, label %else2, !dbg !22

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !23
  %5 = load i32, ptr %err, align 4, !dbg !23
  br label %if.end3, !dbg !23

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !23

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @counter_calls(), !dbg !24
  %7 = icmp ne i32 %6, 3, !dbg !24
  br i1 %7, label %then4, label %else5, !dbg !24

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !25
  %8 = load i32, ptr %err, align 4, !dbg !25
  br label %if.end6, !dbg !25

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !25

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @counter_with_init(), !dbg !26
  %10 = icmp ne i32 %9, 11, !dbg !26
  br i1 %10, label %then7, label %else8, !dbg !26

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !27
  %11 = load i32, ptr %err, align 4, !dbg !27
  br label %if.end9, !dbg !27

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !27

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @counter_with_init(), !dbg !28
  %13 = icmp ne i32 %12, 12, !dbg !28
  br i1 %13, label %then10, label %else11, !dbg !28

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !29
  %14 = load i32, ptr %err, align 4, !dbg !29
  br label %if.end12, !dbg !29

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !29

if.end12:                                         ; preds = %else11, %then10
  %15 = call i32 @bump_runtime_static_decl(), !dbg !30
  %16 = icmp ne i32 %15, 8, !dbg !30
  br i1 %16, label %then13, label %else14, !dbg !30

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !31
  %17 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end15, !dbg !31

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !31

if.end15:                                         ; preds = %else14, %then13
  %18 = call i32 @bump_runtime_static_decl(), !dbg !32
  %19 = icmp ne i32 %18, 9, !dbg !32
  br i1 %19, label %then16, label %else17, !dbg !32

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !33
  %20 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end18, !dbg !33

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !33

if.end18:                                         ; preds = %else17, %then16
  %21 = load i32, ptr %err, align 4, !dbg !34
  %22 = icmp eq i32 %21, 0, !dbg !34
  br i1 %22, label %then19, label %else20, !dbg !34

then19:                                           ; preds = %if.end18
  %23 = call i32 (ptr, ...) @printf(ptr @0), !dbg !35
  br label %if.end21, !dbg !35

else20:                                           ; preds = %if.end18
  %24 = call i32 (ptr, ...) @printf(ptr @1), !dbg !37
  br label %if.end21, !dbg !37

if.end21:                                         ; preds = %else20, %then19
  %25 = load i32, ptr %err, align 4, !dbg !39
  ret i32 %25, !dbg !39
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "38.static_local.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "get_seed", linkageName: "get_seed", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocation(line: 4, column: 3, scope: !2)
!7 = distinct !DISubprogram(name: "counter_calls", linkageName: "counter_calls", scope: null, file: !1, line: 7, type: !3, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0)
!8 = !DILocation(line: 9, column: 3, scope: !7)
!9 = !DILocation(line: 10, column: 3, scope: !7)
!10 = distinct !DISubprogram(name: "counter_with_init", linkageName: "counter_with_init", scope: null, file: !1, line: 13, type: !3, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0)
!11 = !DILocation(line: 15, column: 3, scope: !10)
!12 = !DILocation(line: 16, column: 3, scope: !10)
!13 = distinct !DISubprogram(name: "bump_runtime_static_decl", linkageName: "bump_runtime_static_decl", scope: null, file: !1, line: 19, type: !3, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !0)
!14 = !DILocation(line: 20, column: 10, scope: !13)
!15 = !DILocation(line: 21, column: 3, scope: !13)
!16 = !DILocation(line: 22, column: 3, scope: !13)
!17 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 25, type: !3, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0)
!18 = !DILocalVariable(name: "err", scope: !17, file: !1, line: 26, type: !5)
!19 = !DILocation(line: 26, column: 3, scope: !17)
!20 = !DILocation(line: 28, column: 3, scope: !17)
!21 = !DILocation(line: 28, column: 29, scope: !17)
!22 = !DILocation(line: 29, column: 3, scope: !17)
!23 = !DILocation(line: 29, column: 29, scope: !17)
!24 = !DILocation(line: 30, column: 3, scope: !17)
!25 = !DILocation(line: 30, column: 29, scope: !17)
!26 = !DILocation(line: 32, column: 3, scope: !17)
!27 = !DILocation(line: 32, column: 34, scope: !17)
!28 = !DILocation(line: 33, column: 3, scope: !17)
!29 = !DILocation(line: 33, column: 34, scope: !17)
!30 = !DILocation(line: 35, column: 3, scope: !17)
!31 = !DILocation(line: 35, column: 40, scope: !17)
!32 = !DILocation(line: 36, column: 3, scope: !17)
!33 = !DILocation(line: 36, column: 40, scope: !17)
!34 = !DILocation(line: 38, column: 3, scope: !17)
!35 = !DILocation(line: 39, column: 5, scope: !36)
!36 = distinct !DILexicalBlock(scope: !17, file: !1, line: 38, column: 17)
!37 = !DILocation(line: 41, column: 5, scope: !38)
!38 = distinct !DILexicalBlock(scope: !17, file: !1, line: 40, column: 10)
!39 = !DILocation(line: 43, column: 3, scope: !17)
