; ModuleID = 'lcc'
source_filename = "lcc"

%struct.Data = type { i32, i32 }

@0 = private unnamed_addr constant [24 x i8] c"24.struct_array.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"24.struct_array.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %data = alloca i32, align 4
    #dbg_declare(ptr %data, !6, !DIExpression(), !7)
  %id = alloca i32, align 4
    #dbg_declare(ptr %id, !8, !DIExpression(), !9)
  %da = alloca [2 x %struct.Data], align 8
    #dbg_declare(ptr %da, !10, !DIExpression(), !15)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !16, !DIExpression(), !17)
  store i32 0, ptr %err, align 4, !dbg !17
  %0 = getelementptr %struct.Data, ptr %da, i32 0, !dbg !18
  %1 = getelementptr %struct.Data, ptr %0, i32 0, i32 0, !dbg !18
  store i32 0, ptr %1, align 4, !dbg !18
  %2 = load i32, ptr %1, align 4, !dbg !18
  %3 = getelementptr %struct.Data, ptr %da, i32 0, !dbg !19
  %4 = getelementptr %struct.Data, ptr %3, i32 0, i32 1, !dbg !19
  store i32 0, ptr %4, align 4, !dbg !19
  %5 = load i32, ptr %4, align 4, !dbg !19
  %6 = getelementptr %struct.Data, ptr %da, i32 1, !dbg !20
  %7 = getelementptr %struct.Data, ptr %6, i32 0, i32 0, !dbg !20
  store i32 10, ptr %7, align 4, !dbg !20
  %8 = load i32, ptr %7, align 4, !dbg !20
  %9 = getelementptr %struct.Data, ptr %da, i32 1, !dbg !21
  %10 = getelementptr %struct.Data, ptr %9, i32 0, i32 1, !dbg !21
  store i32 80, ptr %10, align 4, !dbg !21
  %11 = load i32, ptr %10, align 4, !dbg !21
  %12 = getelementptr %struct.Data, ptr %da, i32 1, !dbg !22
  %13 = getelementptr %struct.Data, ptr %12, i32 0, i32 0, !dbg !22
  %14 = load i32, ptr %13, align 4, !dbg !22
  store i32 %14, ptr %id, align 4, !dbg !22
  %15 = load i32, ptr %id, align 4, !dbg !22
  %16 = getelementptr %struct.Data, ptr %da, i32 1, !dbg !23
  %17 = getelementptr %struct.Data, ptr %16, i32 0, i32 1, !dbg !23
  %18 = load i32, ptr %17, align 4, !dbg !23
  store i32 %18, ptr %data, align 4, !dbg !23
  %19 = load i32, ptr %data, align 4, !dbg !23
  %20 = load i32, ptr %id, align 4, !dbg !24
  %21 = icmp ne i32 %20, 10, !dbg !24
  br i1 %21, label %then, label %else, !dbg !24

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !25
  %22 = load i32, ptr %err, align 4, !dbg !25
  br label %if.end, !dbg !25

else:                                             ; preds = %entry
  br label %if.end, !dbg !25

if.end:                                           ; preds = %else, %then
  %23 = load i32, ptr %data, align 4, !dbg !26
  %24 = icmp ne i32 %23, 80, !dbg !26
  br i1 %24, label %then1, label %else2, !dbg !26

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !27
  %25 = load i32, ptr %err, align 4, !dbg !27
  br label %if.end3, !dbg !27

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !27

if.end3:                                          ; preds = %else2, %then1
  %26 = getelementptr %struct.Data, ptr %da, i32 0, !dbg !28
  %27 = getelementptr %struct.Data, ptr %26, i32 0, i32 0, !dbg !28
  %28 = load i32, ptr %27, align 4, !dbg !28
  store i32 %28, ptr %id, align 4, !dbg !28
  %29 = load i32, ptr %id, align 4, !dbg !28
  %30 = getelementptr %struct.Data, ptr %da, i32 0, !dbg !29
  %31 = getelementptr %struct.Data, ptr %30, i32 0, i32 1, !dbg !29
  %32 = load i32, ptr %31, align 4, !dbg !29
  store i32 %32, ptr %data, align 4, !dbg !29
  %33 = load i32, ptr %data, align 4, !dbg !29
  %34 = load i32, ptr %id, align 4, !dbg !30
  %35 = icmp ne i32 %34, 0, !dbg !30
  br i1 %35, label %then4, label %else5, !dbg !30

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !31
  %36 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end6, !dbg !31

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !31

if.end6:                                          ; preds = %else5, %then4
  %37 = load i32, ptr %data, align 4, !dbg !32
  %38 = icmp ne i32 %37, 0, !dbg !32
  br i1 %38, label %then7, label %else8, !dbg !32

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !33
  %39 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end9, !dbg !33

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !33

if.end9:                                          ; preds = %else8, %then7
  %40 = load i32, ptr %err, align 4, !dbg !34
  %41 = icmp eq i32 %40, 0, !dbg !34
  br i1 %41, label %then10, label %else11, !dbg !34

then10:                                           ; preds = %if.end9
  %42 = call i32 (ptr, ...) @printf(ptr @0), !dbg !35
  br label %if.end12, !dbg !35

else11:                                           ; preds = %if.end9
  %43 = call i32 (ptr, ...) @printf(ptr @1), !dbg !37
  br label %if.end12, !dbg !37

if.end12:                                         ; preds = %else11, %then10
  %44 = load i32, ptr %err, align 4, !dbg !39
  ret i32 %44, !dbg !39
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "24.struct_array.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 8, type: !3, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "data", scope: !2, file: !1, line: 12, type: !5)
!7 = !DILocation(line: 12, column: 3, scope: !2)
!8 = !DILocalVariable(name: "id", scope: !2, file: !1, line: 11, type: !5)
!9 = !DILocation(line: 11, column: 3, scope: !2)
!10 = !DILocalVariable(name: "da", scope: !2, file: !1, line: 10, type: !11)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 128, align: 32, elements: !13)
!12 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!13 = !{!14}
!14 = !DISubrange(count: 2, lowerBound: 0)
!15 = !DILocation(line: 10, column: 3, scope: !2)
!16 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 9, type: !5)
!17 = !DILocation(line: 9, column: 3, scope: !2)
!18 = !DILocation(line: 14, column: 3, scope: !2)
!19 = !DILocation(line: 15, column: 3, scope: !2)
!20 = !DILocation(line: 16, column: 3, scope: !2)
!21 = !DILocation(line: 17, column: 3, scope: !2)
!22 = !DILocation(line: 19, column: 3, scope: !2)
!23 = !DILocation(line: 20, column: 3, scope: !2)
!24 = !DILocation(line: 21, column: 3, scope: !2)
!25 = !DILocation(line: 21, column: 17, scope: !2)
!26 = !DILocation(line: 22, column: 3, scope: !2)
!27 = !DILocation(line: 22, column: 19, scope: !2)
!28 = !DILocation(line: 24, column: 3, scope: !2)
!29 = !DILocation(line: 25, column: 3, scope: !2)
!30 = !DILocation(line: 26, column: 3, scope: !2)
!31 = !DILocation(line: 26, column: 16, scope: !2)
!32 = !DILocation(line: 27, column: 3, scope: !2)
!33 = !DILocation(line: 27, column: 18, scope: !2)
!34 = !DILocation(line: 29, column: 3, scope: !2)
!35 = !DILocation(line: 30, column: 5, scope: !36)
!36 = distinct !DILexicalBlock(scope: !2, file: !1, line: 29, column: 17)
!37 = !DILocation(line: 32, column: 5, scope: !38)
!38 = distinct !DILexicalBlock(scope: !2, file: !1, line: 31, column: 10)
!39 = !DILocation(line: 34, column: 3, scope: !2)
