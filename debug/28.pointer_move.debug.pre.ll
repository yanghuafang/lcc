; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [24 x i8] c"28.pointer_move.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"28.pointer_move.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %pc = alloca ptr, align 8
    #dbg_declare(ptr %pc, !6, !DIExpression(), !9)
  %c = alloca [4 x i8], align 1
    #dbg_declare(ptr %c, !10, !DIExpression(), !14)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !15, !DIExpression(), !16)
  store i32 0, ptr %err, align 4, !dbg !16
  %0 = getelementptr i8, ptr %c, i32 0, !dbg !17
  store i8 65, ptr %0, align 1, !dbg !17
  %1 = load i8, ptr %0, align 1, !dbg !17
  %2 = getelementptr i8, ptr %c, i32 1, !dbg !18
  store i8 66, ptr %2, align 1, !dbg !18
  %3 = load i8, ptr %2, align 1, !dbg !18
  %4 = getelementptr i8, ptr %c, i32 2, !dbg !19
  store i8 67, ptr %4, align 1, !dbg !19
  %5 = load i8, ptr %4, align 1, !dbg !19
  %6 = getelementptr i8, ptr %c, i32 3, !dbg !20
  store i8 68, ptr %6, align 1, !dbg !20
  %7 = load i8, ptr %6, align 1, !dbg !20
  store ptr %c, ptr %pc, align 8, !dbg !9
  %8 = load ptr, ptr %pc, align 8, !dbg !21
  %9 = load i8, ptr %8, align 1, !dbg !21
  %10 = sext i8 %9 to i32, !dbg !21
  %11 = icmp ne i32 %10, 65, !dbg !21
  br i1 %11, label %then, label %else, !dbg !21

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !22
  %12 = load i32, ptr %err, align 4, !dbg !22
  br label %if.end, !dbg !22

else:                                             ; preds = %entry
  br label %if.end, !dbg !22

if.end:                                           ; preds = %else, %then
  %13 = load ptr, ptr %pc, align 8, !dbg !23
  %14 = getelementptr i8, ptr %13, i32 1, !dbg !23
  store ptr %14, ptr %pc, align 8, !dbg !23
  %15 = load ptr, ptr %pc, align 8, !dbg !23
  %16 = load ptr, ptr %pc, align 8, !dbg !24
  %17 = load i8, ptr %16, align 1, !dbg !24
  %18 = sext i8 %17 to i32, !dbg !24
  %19 = icmp ne i32 %18, 66, !dbg !24
  br i1 %19, label %then1, label %else2, !dbg !24

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !25
  %20 = load i32, ptr %err, align 4, !dbg !25
  br label %if.end3, !dbg !25

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !25

if.end3:                                          ; preds = %else2, %then1
  %21 = load ptr, ptr %pc, align 8, !dbg !26
  %22 = getelementptr i8, ptr %21, i64 1, !dbg !26
  store ptr %22, ptr %pc, align 8, !dbg !26
  %23 = load ptr, ptr %pc, align 8, !dbg !26
  %24 = load ptr, ptr %pc, align 8, !dbg !27
  %25 = load i8, ptr %24, align 1, !dbg !27
  %26 = sext i8 %25 to i32, !dbg !27
  %27 = icmp ne i32 %26, 67, !dbg !27
  br i1 %27, label %then4, label %else5, !dbg !27

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !28
  %28 = load i32, ptr %err, align 4, !dbg !28
  br label %if.end6, !dbg !28

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !28

if.end6:                                          ; preds = %else5, %then4
  %29 = load ptr, ptr %pc, align 8, !dbg !29
  %30 = getelementptr i8, ptr %29, i64 1, !dbg !29
  store ptr %30, ptr %pc, align 8, !dbg !29
  %31 = load ptr, ptr %pc, align 8, !dbg !30
  %32 = load i8, ptr %31, align 1, !dbg !30
  %33 = sext i8 %32 to i32, !dbg !30
  %34 = icmp ne i32 %33, 68, !dbg !30
  br i1 %34, label %then7, label %else8, !dbg !30

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !31
  %35 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end9, !dbg !31

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !31

if.end9:                                          ; preds = %else8, %then7
  %36 = getelementptr i8, ptr %c, i32 3, !dbg !32
  store ptr %36, ptr %pc, align 8, !dbg !32
  %37 = load ptr, ptr %pc, align 8, !dbg !32
  %38 = load ptr, ptr %pc, align 8, !dbg !33
  %39 = load i8, ptr %38, align 1, !dbg !33
  %40 = sext i8 %39 to i32, !dbg !33
  %41 = icmp ne i32 %40, 68, !dbg !33
  br i1 %41, label %then10, label %else11, !dbg !33

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !34
  %42 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end12, !dbg !34

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !34

if.end12:                                         ; preds = %else11, %then10
  %43 = load ptr, ptr %pc, align 8, !dbg !35
  %44 = getelementptr i8, ptr %43, i32 -1, !dbg !35
  store ptr %44, ptr %pc, align 8, !dbg !35
  %45 = load ptr, ptr %pc, align 8, !dbg !35
  %46 = load ptr, ptr %pc, align 8, !dbg !36
  %47 = load i8, ptr %46, align 1, !dbg !36
  %48 = sext i8 %47 to i32, !dbg !36
  %49 = icmp ne i32 %48, 67, !dbg !36
  br i1 %49, label %then13, label %else14, !dbg !36

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !37
  %50 = load i32, ptr %err, align 4, !dbg !37
  br label %if.end15, !dbg !37

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !37

if.end15:                                         ; preds = %else14, %then13
  %51 = load ptr, ptr %pc, align 8, !dbg !38
  %52 = getelementptr i8, ptr %51, i64 -1, !dbg !38
  store ptr %52, ptr %pc, align 8, !dbg !38
  %53 = load ptr, ptr %pc, align 8, !dbg !38
  %54 = load ptr, ptr %pc, align 8, !dbg !39
  %55 = load i8, ptr %54, align 1, !dbg !39
  %56 = sext i8 %55 to i32, !dbg !39
  %57 = icmp ne i32 %56, 66, !dbg !39
  br i1 %57, label %then16, label %else17, !dbg !39

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !40
  %58 = load i32, ptr %err, align 4, !dbg !40
  br label %if.end18, !dbg !40

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !40

if.end18:                                         ; preds = %else17, %then16
  %59 = load ptr, ptr %pc, align 8, !dbg !41
  %60 = getelementptr i8, ptr %59, i64 -1, !dbg !41
  store ptr %60, ptr %pc, align 8, !dbg !41
  %61 = load ptr, ptr %pc, align 8, !dbg !42
  %62 = load i8, ptr %61, align 1, !dbg !42
  %63 = sext i8 %62 to i32, !dbg !42
  %64 = icmp ne i32 %63, 65, !dbg !42
  br i1 %64, label %then19, label %else20, !dbg !42

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !43
  %65 = load i32, ptr %err, align 4, !dbg !43
  br label %if.end21, !dbg !43

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !43

if.end21:                                         ; preds = %else20, %then19
  %66 = load i32, ptr %err, align 4, !dbg !44
  %67 = icmp eq i32 %66, 0, !dbg !44
  br i1 %67, label %then22, label %else23, !dbg !44

then22:                                           ; preds = %if.end21
  %68 = call i32 (ptr, ...) @printf(ptr @0), !dbg !45
  br label %if.end24, !dbg !45

else23:                                           ; preds = %if.end21
  %69 = call i32 (ptr, ...) @printf(ptr @1), !dbg !47
  br label %if.end24, !dbg !47

if.end24:                                         ; preds = %else23, %then22
  %70 = load i32, ptr %err, align 4, !dbg !49
  ret i32 %70, !dbg !49
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "28.pointer_move.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "pc", scope: !2, file: !1, line: 11, type: !7)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !DILocation(line: 11, column: 3, scope: !2)
!10 = !DILocalVariable(name: "c", scope: !2, file: !1, line: 5, type: !11)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 32, align: 8, elements: !12)
!12 = !{!13}
!13 = !DISubrange(count: 4, lowerBound: 0)
!14 = !DILocation(line: 5, column: 3, scope: !2)
!15 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 4, type: !5)
!16 = !DILocation(line: 4, column: 3, scope: !2)
!17 = !DILocation(line: 6, column: 3, scope: !2)
!18 = !DILocation(line: 7, column: 3, scope: !2)
!19 = !DILocation(line: 8, column: 3, scope: !2)
!20 = !DILocation(line: 9, column: 3, scope: !2)
!21 = !DILocation(line: 12, column: 3, scope: !2)
!22 = !DILocation(line: 12, column: 19, scope: !2)
!23 = !DILocation(line: 13, column: 3, scope: !2)
!24 = !DILocation(line: 14, column: 3, scope: !2)
!25 = !DILocation(line: 14, column: 19, scope: !2)
!26 = !DILocation(line: 15, column: 3, scope: !2)
!27 = !DILocation(line: 16, column: 3, scope: !2)
!28 = !DILocation(line: 16, column: 19, scope: !2)
!29 = !DILocation(line: 17, column: 3, scope: !2)
!30 = !DILocation(line: 18, column: 3, scope: !2)
!31 = !DILocation(line: 18, column: 19, scope: !2)
!32 = !DILocation(line: 20, column: 3, scope: !2)
!33 = !DILocation(line: 21, column: 3, scope: !2)
!34 = !DILocation(line: 21, column: 19, scope: !2)
!35 = !DILocation(line: 22, column: 3, scope: !2)
!36 = !DILocation(line: 23, column: 3, scope: !2)
!37 = !DILocation(line: 23, column: 19, scope: !2)
!38 = !DILocation(line: 24, column: 3, scope: !2)
!39 = !DILocation(line: 25, column: 3, scope: !2)
!40 = !DILocation(line: 25, column: 19, scope: !2)
!41 = !DILocation(line: 26, column: 3, scope: !2)
!42 = !DILocation(line: 27, column: 3, scope: !2)
!43 = !DILocation(line: 27, column: 19, scope: !2)
!44 = !DILocation(line: 29, column: 3, scope: !2)
!45 = !DILocation(line: 30, column: 5, scope: !46)
!46 = distinct !DILexicalBlock(scope: !2, file: !1, line: 29, column: 17)
!47 = !DILocation(line: 32, column: 5, scope: !48)
!48 = distinct !DILexicalBlock(scope: !2, file: !1, line: 31, column: 10)
!49 = !DILocation(line: 34, column: 3, scope: !2)
