; ModuleID = 'lcc'
source_filename = "lcc"

@g_data = global i32 0
@0 = private unnamed_addr constant [31 x i8] c"10.double_pointer_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"10.double_pointer_type.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define void @getAddress(ptr %0) !dbg !2 {
entry:
  %p = alloca ptr, align 8
    #dbg_declare(ptr %p, !10, !DIExpression(), !11)
  store ptr %0, ptr %p, align 8, !dbg !11
  %1 = load ptr, ptr %p, align 8, !dbg !12
  store ptr @g_data, ptr %1, align 8, !dbg !12
  %2 = load ptr, ptr %1, align 8, !dbg !12
  ret void, !dbg !12
}

define i32 @main() !dbg !13 {
entry:
  %p2 = alloca ptr, align 8
    #dbg_declare(ptr %p2, !16, !DIExpression(), !17)
  %p = alloca ptr, align 8
    #dbg_declare(ptr %p, !18, !DIExpression(), !19)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !20, !DIExpression(), !21)
  store i32 0, ptr %err, align 4, !dbg !21
  store ptr @g_data, ptr %p, align 8, !dbg !19
  %0 = load ptr, ptr %p, align 8, !dbg !22
  store i32 1234, ptr %0, align 4, !dbg !22
  %1 = load i32, ptr %0, align 4, !dbg !22
  call void @getAddress(ptr %p2), !dbg !23
  %2 = load ptr, ptr %p2, align 8, !dbg !24
  store i32 5678, ptr %2, align 4, !dbg !24
  %3 = load i32, ptr %2, align 4, !dbg !24
  %4 = load i32, ptr @g_data, align 4, !dbg !25
  %5 = icmp ne i32 %4, 5678, !dbg !25
  br i1 %5, label %then, label %else, !dbg !25

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !26
  %6 = load i32, ptr %err, align 4, !dbg !26
  br label %if.end, !dbg !26

else:                                             ; preds = %entry
  br label %if.end, !dbg !26

if.end:                                           ; preds = %else, %then
  %7 = load ptr, ptr %p2, align 8, !dbg !27
  %8 = load i32, ptr %7, align 4, !dbg !27
  %9 = icmp ne i32 %8, 5678, !dbg !27
  br i1 %9, label %then1, label %else2, !dbg !27

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !28
  %10 = load i32, ptr %err, align 4, !dbg !28
  br label %if.end3, !dbg !28

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !28

if.end3:                                          ; preds = %else2, %then1
  %11 = load ptr, ptr %p, align 8, !dbg !29
  %12 = load i32, ptr %11, align 4, !dbg !29
  %13 = icmp ne i32 %12, 5678, !dbg !29
  br i1 %13, label %then4, label %else5, !dbg !29

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !30
  %14 = load i32, ptr %err, align 4, !dbg !30
  br label %if.end6, !dbg !30

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !30

if.end6:                                          ; preds = %else5, %then4
  %15 = load ptr, ptr %p, align 8, !dbg !31
  store i32 0, ptr %15, align 4, !dbg !31
  %16 = load i32, ptr %15, align 4, !dbg !31
  %17 = load i32, ptr @g_data, align 4, !dbg !32
  %18 = icmp ne i32 %17, 0, !dbg !32
  br i1 %18, label %then7, label %else8, !dbg !32

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !33
  %19 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end9, !dbg !33

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !33

if.end9:                                          ; preds = %else8, %then7
  %20 = load ptr, ptr %p2, align 8, !dbg !34
  store i32 -42, ptr %20, align 4, !dbg !34
  %21 = load i32, ptr %20, align 4, !dbg !34
  %22 = load i32, ptr @g_data, align 4, !dbg !35
  %23 = icmp ne i32 %22, -42, !dbg !35
  br i1 %23, label %then10, label %else11, !dbg !35

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !36
  %24 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end12, !dbg !36

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !36

if.end12:                                         ; preds = %else11, %then10
  %25 = load i32, ptr %err, align 4, !dbg !37
  %26 = icmp eq i32 %25, 0, !dbg !37
  br i1 %26, label %then13, label %else14, !dbg !37

then13:                                           ; preds = %if.end12
  %27 = call i32 (ptr, ...) @printf(ptr @0), !dbg !38
  br label %if.end15, !dbg !38

else14:                                           ; preds = %if.end12
  %28 = call i32 (ptr, ...) @printf(ptr @1), !dbg !40
  br label %if.end15, !dbg !40

if.end15:                                         ; preds = %else14, %then13
  %29 = load i32, ptr %err, align 4, !dbg !42
  ret i32 %29, !dbg !42
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "10.double_pointer_type.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "getAddress", linkageName: "getAddress", scope: null, file: !1, line: 5, type: !3, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !9)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6}
!5 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{}
!10 = !DILocalVariable(name: "p", arg: 1, scope: !2, file: !1, line: 5, type: !6)
!11 = !DILocation(line: 5, column: 6, scope: !2)
!12 = !DILocation(line: 5, column: 28, scope: !2)
!13 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 7, type: !14, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !9)
!14 = !DISubroutineType(types: !15)
!15 = !{!8}
!16 = !DILocalVariable(name: "p2", scope: !13, file: !1, line: 12, type: !7)
!17 = !DILocation(line: 12, column: 3, scope: !13)
!18 = !DILocalVariable(name: "p", scope: !13, file: !1, line: 9, type: !7)
!19 = !DILocation(line: 9, column: 3, scope: !13)
!20 = !DILocalVariable(name: "err", scope: !13, file: !1, line: 8, type: !8)
!21 = !DILocation(line: 8, column: 3, scope: !13)
!22 = !DILocation(line: 10, column: 3, scope: !13)
!23 = !DILocation(line: 13, column: 3, scope: !13)
!24 = !DILocation(line: 14, column: 3, scope: !13)
!25 = !DILocation(line: 16, column: 3, scope: !13)
!26 = !DILocation(line: 16, column: 23, scope: !13)
!27 = !DILocation(line: 17, column: 3, scope: !13)
!28 = !DILocation(line: 17, column: 20, scope: !13)
!29 = !DILocation(line: 18, column: 3, scope: !13)
!30 = !DILocation(line: 18, column: 19, scope: !13)
!31 = !DILocation(line: 20, column: 3, scope: !13)
!32 = !DILocation(line: 21, column: 3, scope: !13)
!33 = !DILocation(line: 21, column: 20, scope: !13)
!34 = !DILocation(line: 23, column: 3, scope: !13)
!35 = !DILocation(line: 24, column: 3, scope: !13)
!36 = !DILocation(line: 24, column: 22, scope: !13)
!37 = !DILocation(line: 26, column: 3, scope: !13)
!38 = !DILocation(line: 27, column: 5, scope: !39)
!39 = distinct !DILexicalBlock(scope: !13, file: !1, line: 26, column: 17)
!40 = !DILocation(line: 29, column: 5, scope: !41)
!41 = distinct !DILexicalBlock(scope: !13, file: !1, line: 28, column: 10)
!42 = !DILocation(line: 31, column: 3, scope: !13)
