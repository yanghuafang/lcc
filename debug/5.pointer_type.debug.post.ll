; ModuleID = 'lcc'
source_filename = "lcc"

@gc = global i8 97
@gi = global i32 1024
@0 = private unnamed_addr constant [23 x i8] c"5.pointer_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [23 x i8] c"5.pointer_type.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %pgi = alloca ptr, align 8
    #dbg_declare(ptr %pgi, !7, !DIExpression(), !9)
  %pgc = alloca ptr, align 8
    #dbg_declare(ptr %pgc, !10, !DIExpression(), !13)
  %pi = alloca ptr, align 8
    #dbg_declare(ptr %pi, !14, !DIExpression(), !15)
  %pc = alloca ptr, align 8
    #dbg_declare(ptr %pc, !16, !DIExpression(), !17)
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !18, !DIExpression(), !19)
  %c = alloca i8, align 1
    #dbg_declare(ptr %c, !20, !DIExpression(), !21)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !22, !DIExpression(), !23)
  store i32 0, ptr %err, align 4, !dbg !23
  store i8 65, ptr %c, align 1, !dbg !21
  store i32 128, ptr %i, align 4, !dbg !19
  store ptr %c, ptr %pc, align 8, !dbg !17
  store ptr %i, ptr %pi, align 8, !dbg !15
  %0 = load ptr, ptr %pc, align 8, !dbg !24
  store i8 66, ptr %0, align 1, !dbg !24
  %1 = load i8, ptr %0, align 1, !dbg !24
  %2 = load ptr, ptr %pi, align 8, !dbg !25
  store i32 256, ptr %2, align 4, !dbg !25
  %3 = load i32, ptr %2, align 4, !dbg !25
  store ptr @gc, ptr %pgc, align 8, !dbg !13
  store ptr @gi, ptr %pgi, align 8, !dbg !9
  %4 = load ptr, ptr %pgc, align 8, !dbg !26
  store i8 98, ptr %4, align 1, !dbg !26
  %5 = load i8, ptr %4, align 1, !dbg !26
  %6 = load ptr, ptr %pgi, align 8, !dbg !27
  store i32 2048, ptr %6, align 4, !dbg !27
  %7 = load i32, ptr %6, align 4, !dbg !27
  %8 = load i8, ptr %c, align 1, !dbg !28
  %9 = sext i8 %8 to i32, !dbg !28
  %10 = icmp ne i32 %9, 66, !dbg !28
  br i1 %10, label %then, label %else, !dbg !28

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !29
  %11 = load i32, ptr %err, align 4, !dbg !29
  br label %if.end, !dbg !29

else:                                             ; preds = %entry
  br label %if.end, !dbg !29

if.end:                                           ; preds = %else, %then
  %12 = load ptr, ptr %pc, align 8, !dbg !30
  %13 = load i8, ptr %12, align 1, !dbg !30
  %14 = sext i8 %13 to i32, !dbg !30
  %15 = icmp ne i32 %14, 66, !dbg !30
  br i1 %15, label %then1, label %else2, !dbg !30

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !31
  %16 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end3, !dbg !31

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !31

if.end3:                                          ; preds = %else2, %then1
  %17 = load i32, ptr %i, align 4, !dbg !32
  %18 = icmp ne i32 %17, 256, !dbg !32
  br i1 %18, label %then4, label %else5, !dbg !32

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !33
  %19 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end6, !dbg !33

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !33

if.end6:                                          ; preds = %else5, %then4
  %20 = load ptr, ptr %pi, align 8, !dbg !34
  %21 = load i32, ptr %20, align 4, !dbg !34
  %22 = icmp ne i32 %21, 256, !dbg !34
  br i1 %22, label %then7, label %else8, !dbg !34

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !35
  %23 = load i32, ptr %err, align 4, !dbg !35
  br label %if.end9, !dbg !35

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !35

if.end9:                                          ; preds = %else8, %then7
  %24 = load i8, ptr @gc, align 1, !dbg !36
  %25 = sext i8 %24 to i32, !dbg !36
  %26 = icmp ne i32 %25, 98, !dbg !36
  br i1 %26, label %then10, label %else11, !dbg !36

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !37
  %27 = load i32, ptr %err, align 4, !dbg !37
  br label %if.end12, !dbg !37

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !37

if.end12:                                         ; preds = %else11, %then10
  %28 = load i32, ptr @gi, align 4, !dbg !38
  %29 = icmp ne i32 %28, 2048, !dbg !38
  br i1 %29, label %then13, label %else14, !dbg !38

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !39
  %30 = load i32, ptr %err, align 4, !dbg !39
  br label %if.end15, !dbg !39

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !39

if.end15:                                         ; preds = %else14, %then13
  %31 = load ptr, ptr %pi, align 8, !dbg !40
  store i32 0, ptr %31, align 4, !dbg !40
  %32 = load i32, ptr %31, align 4, !dbg !40
  %33 = load i32, ptr %i, align 4, !dbg !41
  %34 = icmp ne i32 %33, 0, !dbg !41
  br i1 %34, label %then16, label %else17, !dbg !41

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !42
  %35 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end18, !dbg !42

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !42

if.end18:                                         ; preds = %else17, %then16
  %36 = load i32, ptr %err, align 4, !dbg !43
  %37 = icmp eq i32 %36, 0, !dbg !43
  br i1 %37, label %then19, label %else20, !dbg !43

then19:                                           ; preds = %if.end18
  %38 = call i32 (ptr, ...) @printf(ptr @0), !dbg !44
  br label %if.end21, !dbg !44

else20:                                           ; preds = %if.end18
  %39 = call i32 (ptr, ...) @printf(ptr @1), !dbg !46
  br label %if.end21, !dbg !46

if.end21:                                         ; preds = %else20, %then19
  %40 = load i32, ptr %err, align 4, !dbg !48
  ret i32 %40, !dbg !48
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "5.pointer_type.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 6, type: !3, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "pgi", scope: !2, file: !1, line: 17, type: !8)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!9 = !DILocation(line: 17, column: 3, scope: !2)
!10 = !DILocalVariable(name: "pgc", scope: !2, file: !1, line: 16, type: !11)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !DILocation(line: 16, column: 3, scope: !2)
!14 = !DILocalVariable(name: "pi", scope: !2, file: !1, line: 11, type: !8)
!15 = !DILocation(line: 11, column: 3, scope: !2)
!16 = !DILocalVariable(name: "pc", scope: !2, file: !1, line: 10, type: !11)
!17 = !DILocation(line: 10, column: 3, scope: !2)
!18 = !DILocalVariable(name: "i", scope: !2, file: !1, line: 9, type: !5)
!19 = !DILocation(line: 9, column: 3, scope: !2)
!20 = !DILocalVariable(name: "c", scope: !2, file: !1, line: 8, type: !12)
!21 = !DILocation(line: 8, column: 3, scope: !2)
!22 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 7, type: !5)
!23 = !DILocation(line: 7, column: 3, scope: !2)
!24 = !DILocation(line: 13, column: 3, scope: !2)
!25 = !DILocation(line: 14, column: 3, scope: !2)
!26 = !DILocation(line: 18, column: 3, scope: !2)
!27 = !DILocation(line: 19, column: 3, scope: !2)
!28 = !DILocation(line: 21, column: 3, scope: !2)
!29 = !DILocation(line: 21, column: 17, scope: !2)
!30 = !DILocation(line: 22, column: 3, scope: !2)
!31 = !DILocation(line: 22, column: 19, scope: !2)
!32 = !DILocation(line: 23, column: 3, scope: !2)
!33 = !DILocation(line: 23, column: 17, scope: !2)
!34 = !DILocation(line: 24, column: 3, scope: !2)
!35 = !DILocation(line: 24, column: 19, scope: !2)
!36 = !DILocation(line: 25, column: 3, scope: !2)
!37 = !DILocation(line: 25, column: 18, scope: !2)
!38 = !DILocation(line: 26, column: 3, scope: !2)
!39 = !DILocation(line: 26, column: 19, scope: !2)
!40 = !DILocation(line: 28, column: 3, scope: !2)
!41 = !DILocation(line: 29, column: 3, scope: !2)
!42 = !DILocation(line: 29, column: 15, scope: !2)
!43 = !DILocation(line: 31, column: 3, scope: !2)
!44 = !DILocation(line: 32, column: 5, scope: !45)
!45 = distinct !DILexicalBlock(scope: !2, file: !1, line: 31, column: 17)
!46 = !DILocation(line: 34, column: 5, scope: !47)
!47 = distinct !DILexicalBlock(scope: !2, file: !1, line: 33, column: 10)
!48 = !DILocation(line: 36, column: 3, scope: !2)
