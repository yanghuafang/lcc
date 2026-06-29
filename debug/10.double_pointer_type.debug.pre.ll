; ModuleID = 'lcc'
source_filename = "lcc"

@g_data = global i32 0
@0 = private unnamed_addr constant [31 x i8] c"10.double_pointer_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"10.double_pointer_type.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define void @getAddress(ptr %0) !dbg !2 {
entry:
  %p = alloca ptr, align 8
    #dbg_declare(ptr %p, !9, !DIExpression(), !10)
  store ptr %0, ptr %p, align 8, !dbg !10
  %1 = load ptr, ptr %p, align 8, !dbg !11
  store ptr @g_data, ptr %1, align 8, !dbg !11
  %2 = load ptr, ptr %1, align 8, !dbg !11
  ret void, !dbg !11
}

define i32 @main() !dbg !12 {
entry:
  %p2 = alloca ptr, align 8
    #dbg_declare(ptr %p2, !15, !DIExpression(), !16)
  %p = alloca ptr, align 8
    #dbg_declare(ptr %p, !17, !DIExpression(), !18)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !19, !DIExpression(), !20)
  store i32 0, ptr %err, align 4, !dbg !20
  store ptr @g_data, ptr %p, align 8, !dbg !18
  %0 = load ptr, ptr %p, align 8, !dbg !21
  store i32 1234, ptr %0, align 4, !dbg !21
  %1 = load i32, ptr %0, align 4, !dbg !21
  call void @getAddress(ptr %p2), !dbg !22
  %2 = load ptr, ptr %p2, align 8, !dbg !23
  store i32 5678, ptr %2, align 4, !dbg !23
  %3 = load i32, ptr %2, align 4, !dbg !23
  %4 = load i32, ptr @g_data, align 4, !dbg !24
  %5 = icmp ne i32 %4, 5678, !dbg !24
  br i1 %5, label %then, label %else, !dbg !24

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !25
  %6 = load i32, ptr %err, align 4, !dbg !25
  br label %if.end, !dbg !25

else:                                             ; preds = %entry
  br label %if.end, !dbg !25

if.end:                                           ; preds = %else, %then
  %7 = load ptr, ptr %p2, align 8, !dbg !26
  %8 = load i32, ptr %7, align 4, !dbg !26
  %9 = icmp ne i32 %8, 5678, !dbg !26
  br i1 %9, label %then1, label %else2, !dbg !26

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !27
  %10 = load i32, ptr %err, align 4, !dbg !27
  br label %if.end3, !dbg !27

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !27

if.end3:                                          ; preds = %else2, %then1
  %11 = load ptr, ptr %p, align 8, !dbg !28
  %12 = load i32, ptr %11, align 4, !dbg !28
  %13 = icmp ne i32 %12, 5678, !dbg !28
  br i1 %13, label %then4, label %else5, !dbg !28

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !29
  %14 = load i32, ptr %err, align 4, !dbg !29
  br label %if.end6, !dbg !29

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !29

if.end6:                                          ; preds = %else5, %then4
  %15 = load ptr, ptr %p, align 8, !dbg !30
  store i32 0, ptr %15, align 4, !dbg !30
  %16 = load i32, ptr %15, align 4, !dbg !30
  %17 = load i32, ptr @g_data, align 4, !dbg !31
  %18 = icmp ne i32 %17, 0, !dbg !31
  br i1 %18, label %then7, label %else8, !dbg !31

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !32
  %19 = load i32, ptr %err, align 4, !dbg !32
  br label %if.end9, !dbg !32

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !32

if.end9:                                          ; preds = %else8, %then7
  %20 = load ptr, ptr %p2, align 8, !dbg !33
  store i32 -42, ptr %20, align 4, !dbg !33
  %21 = load i32, ptr %20, align 4, !dbg !33
  %22 = load i32, ptr @g_data, align 4, !dbg !34
  %23 = icmp ne i32 %22, -42, !dbg !34
  br i1 %23, label %then10, label %else11, !dbg !34

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !35
  %24 = load i32, ptr %err, align 4, !dbg !35
  br label %if.end12, !dbg !35

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !35

if.end12:                                         ; preds = %else11, %then10
  %25 = load i32, ptr %err, align 4, !dbg !36
  %26 = icmp eq i32 %25, 0, !dbg !36
  br i1 %26, label %then13, label %else14, !dbg !36

then13:                                           ; preds = %if.end12
  %27 = call i32 (ptr, ...) @printf(ptr @0), !dbg !37
  br label %if.end15, !dbg !37

else14:                                           ; preds = %if.end12
  %28 = call i32 (ptr, ...) @printf(ptr @1), !dbg !39
  br label %if.end15, !dbg !39

if.end15:                                         ; preds = %else14, %then13
  %29 = load i32, ptr %err, align 4, !dbg !41
  ret i32 %29, !dbg !41
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "10.double_pointer_type.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "getAddress", linkageName: "getAddress", scope: null, file: !1, line: 5, type: !3, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6}
!5 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DILocalVariable(name: "p", arg: 1, scope: !2, file: !1, line: 5, type: !6)
!10 = !DILocation(line: 5, column: 6, scope: !2)
!11 = !DILocation(line: 5, column: 28, scope: !2)
!12 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 7, type: !13, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0)
!13 = !DISubroutineType(types: !14)
!14 = !{!8}
!15 = !DILocalVariable(name: "p2", scope: !12, file: !1, line: 12, type: !7)
!16 = !DILocation(line: 12, column: 3, scope: !12)
!17 = !DILocalVariable(name: "p", scope: !12, file: !1, line: 9, type: !7)
!18 = !DILocation(line: 9, column: 3, scope: !12)
!19 = !DILocalVariable(name: "err", scope: !12, file: !1, line: 8, type: !8)
!20 = !DILocation(line: 8, column: 3, scope: !12)
!21 = !DILocation(line: 10, column: 3, scope: !12)
!22 = !DILocation(line: 13, column: 3, scope: !12)
!23 = !DILocation(line: 14, column: 3, scope: !12)
!24 = !DILocation(line: 16, column: 3, scope: !12)
!25 = !DILocation(line: 16, column: 23, scope: !12)
!26 = !DILocation(line: 17, column: 3, scope: !12)
!27 = !DILocation(line: 17, column: 20, scope: !12)
!28 = !DILocation(line: 18, column: 3, scope: !12)
!29 = !DILocation(line: 18, column: 19, scope: !12)
!30 = !DILocation(line: 20, column: 3, scope: !12)
!31 = !DILocation(line: 21, column: 3, scope: !12)
!32 = !DILocation(line: 21, column: 20, scope: !12)
!33 = !DILocation(line: 23, column: 3, scope: !12)
!34 = !DILocation(line: 24, column: 3, scope: !12)
!35 = !DILocation(line: 24, column: 22, scope: !12)
!36 = !DILocation(line: 26, column: 3, scope: !12)
!37 = !DILocation(line: 27, column: 5, scope: !38)
!38 = distinct !DILexicalBlock(scope: !12, file: !1, line: 26, column: 17)
!39 = !DILocation(line: 29, column: 5, scope: !40)
!40 = distinct !DILexicalBlock(scope: !12, file: !1, line: 28, column: 10)
!41 = !DILocation(line: 31, column: 3, scope: !12)
