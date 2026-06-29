; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [27 x i8] c"35.typedef_builtin.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [27 x i8] c"35.typedef_builtin.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define void @helper(i64 %0, i32 %1, ptr %2) !dbg !2 {
entry:
  %p = alloca ptr, align 8
    #dbg_declare(ptr %p, !9, !DIExpression(), !10)
  %step = alloca i32, align 4
    #dbg_declare(ptr %step, !11, !DIExpression(), !10)
  %nbytes = alloca i64, align 8
    #dbg_declare(ptr %nbytes, !12, !DIExpression(), !10)
  store i64 %0, ptr %nbytes, align 4, !dbg !10
  store i32 %1, ptr %step, align 4, !dbg !10
  store ptr %2, ptr %p, align 8, !dbg !10
  %3 = load ptr, ptr %p, align 8, !dbg !13
  %4 = load i64, ptr %nbytes, align 4, !dbg !13
  %5 = load i32, ptr %step, align 4, !dbg !13
  %6 = zext i32 %5 to i64, !dbg !13
  %7 = add i64 %4, %6, !dbg !13
  %8 = trunc i64 %7 to i32, !dbg !13
  store i32 %8, ptr %3, align 4, !dbg !13
  %9 = load i32, ptr %3, align 4, !dbg !13
  ret void, !dbg !13
}

define i32 @main() !dbg !14 {
entry:
  %result = alloca i32, align 4
    #dbg_declare(ptr %result, !17, !DIExpression(), !18)
  %p = alloca ptr, align 8
    #dbg_declare(ptr %p, !19, !DIExpression(), !20)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !21, !DIExpression(), !22)
  %c = alloca i32, align 4
    #dbg_declare(ptr %c, !23, !DIExpression(), !24)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !25, !DIExpression(), !26)
  store i32 0, ptr %err, align 4, !dbg !26
  store i32 7, ptr %c, align 4, !dbg !24
  store i32 10, ptr %x, align 4, !dbg !22
  store ptr %x, ptr %p, align 8, !dbg !20
  %0 = load i32, ptr %c, align 4, !dbg !27
  %1 = load ptr, ptr %p, align 8, !dbg !27
  call void @helper(i64 42, i32 %0, ptr %1), !dbg !27
  %2 = load i32, ptr %c, align 4, !dbg !28
  %3 = icmp ne i32 %2, 7, !dbg !28
  br i1 %3, label %then, label %else, !dbg !28

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !29
  %4 = load i32, ptr %err, align 4, !dbg !29
  br label %if.end, !dbg !29

else:                                             ; preds = %entry
  br label %if.end, !dbg !29

if.end:                                           ; preds = %else, %then
  %5 = load i32, ptr %x, align 4, !dbg !30
  %6 = icmp ne i32 %5, 49, !dbg !30
  br i1 %6, label %then1, label %else2, !dbg !30

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !31
  %7 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end3, !dbg !31

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !31

if.end3:                                          ; preds = %else2, %then1
  %8 = load ptr, ptr %p, align 8, !dbg !18
  %9 = load i32, ptr %8, align 4, !dbg !18
  store i32 %9, ptr %result, align 4, !dbg !18
  %10 = load i32, ptr %result, align 4, !dbg !32
  %11 = icmp ne i32 %10, 49, !dbg !32
  br i1 %11, label %then4, label %else5, !dbg !32

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !33
  %12 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end6, !dbg !33

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !33

if.end6:                                          ; preds = %else5, %then4
  %13 = load i32, ptr %err, align 4, !dbg !34
  %14 = icmp eq i32 %13, 0, !dbg !34
  br i1 %14, label %then7, label %else8, !dbg !34

then7:                                            ; preds = %if.end6
  %15 = call i32 (ptr, ...) @printf(ptr @0), !dbg !35
  br label %if.end9, !dbg !35

else8:                                            ; preds = %if.end6
  %16 = call i32 (ptr, ...) @printf(ptr @1), !dbg !37
  br label %if.end9, !dbg !37

if.end9:                                          ; preds = %else8, %then7
  %17 = load i32, ptr %err, align 4, !dbg !39
  ret i32 %17, !dbg !39
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "35.typedef_builtin.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "helper", linkageName: "helper", scope: null, file: !1, line: 7, type: !3, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6, !7, !8}
!5 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!6 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!9 = !DILocalVariable(name: "p", arg: 3, scope: !2, file: !1, line: 7, type: !8)
!10 = !DILocation(line: 7, column: 6, scope: !2)
!11 = !DILocalVariable(name: "step", arg: 2, scope: !2, file: !1, line: 7, type: !7)
!12 = !DILocalVariable(name: "nbytes", arg: 1, scope: !2, file: !1, line: 7, type: !6)
!13 = !DILocation(line: 8, column: 3, scope: !2)
!14 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 11, type: !15, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0)
!15 = !DISubroutineType(types: !16)
!16 = !{!7}
!17 = !DILocalVariable(name: "result", scope: !14, file: !1, line: 21, type: !7)
!18 = !DILocation(line: 21, column: 3, scope: !14)
!19 = !DILocalVariable(name: "p", scope: !14, file: !1, line: 15, type: !8)
!20 = !DILocation(line: 15, column: 3, scope: !14)
!21 = !DILocalVariable(name: "x", scope: !14, file: !1, line: 14, type: !7)
!22 = !DILocation(line: 14, column: 3, scope: !14)
!23 = !DILocalVariable(name: "c", scope: !14, file: !1, line: 13, type: !7)
!24 = !DILocation(line: 13, column: 3, scope: !14)
!25 = !DILocalVariable(name: "err", scope: !14, file: !1, line: 12, type: !7)
!26 = !DILocation(line: 12, column: 3, scope: !14)
!27 = !DILocation(line: 17, column: 3, scope: !14)
!28 = !DILocation(line: 19, column: 3, scope: !14)
!29 = !DILocation(line: 19, column: 15, scope: !14)
!30 = !DILocation(line: 20, column: 3, scope: !14)
!31 = !DILocation(line: 20, column: 16, scope: !14)
!32 = !DILocation(line: 22, column: 3, scope: !14)
!33 = !DILocation(line: 22, column: 21, scope: !14)
!34 = !DILocation(line: 24, column: 3, scope: !14)
!35 = !DILocation(line: 25, column: 5, scope: !36)
!36 = distinct !DILexicalBlock(scope: !14, file: !1, line: 24, column: 17)
!37 = !DILocation(line: 27, column: 5, scope: !38)
!38 = distinct !DILexicalBlock(scope: !14, file: !1, line: 26, column: 10)
!39 = !DILocation(line: 29, column: 3, scope: !14)
