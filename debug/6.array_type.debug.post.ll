; ModuleID = 'lcc'
source_filename = "lcc"

@gs = global [16 x i8] undef
@0 = private unnamed_addr constant [13 x i8] c"hello world!\00", align 1
@gps = global ptr @0
@gi = global [4 x i32] undef
@1 = private unnamed_addr constant [21 x i8] c"6.array_type.c PASS\0A\00", align 1
@2 = private unnamed_addr constant [21 x i8] c"6.array_type.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %i = alloca [4 x i32], align 4
    #dbg_declare(ptr %i, !7, !DIExpression(), !11)
  %s = alloca [16 x i8], align 1
    #dbg_declare(ptr %s, !12, !DIExpression(), !17)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !18, !DIExpression(), !19)
  store i32 0, ptr %err, align 4, !dbg !19
  %0 = getelementptr i8, ptr %s, i32 0, !dbg !20
  store i8 103, ptr %0, align 1, !dbg !20
  %1 = load i8, ptr %0, align 1, !dbg !20
  %2 = getelementptr i8, ptr %s, i32 1, !dbg !21
  store i8 111, ptr %2, align 1, !dbg !21
  %3 = load i8, ptr %2, align 1, !dbg !21
  %4 = getelementptr i8, ptr %s, i32 2, !dbg !22
  store i8 111, ptr %4, align 1, !dbg !22
  %5 = load i8, ptr %4, align 1, !dbg !22
  %6 = getelementptr i8, ptr %s, i32 3, !dbg !23
  store i8 100, ptr %6, align 1, !dbg !23
  %7 = load i8, ptr %6, align 1, !dbg !23
  %8 = getelementptr i8, ptr %s, i32 4, !dbg !24
  store i8 0, ptr %8, align 1, !dbg !24
  %9 = load i8, ptr %8, align 1, !dbg !24
  store i8 108, ptr @gs, align 1, !dbg !25
  %10 = load i8, ptr @gs, align 1, !dbg !25
  store i8 117, ptr getelementptr (i8, ptr @gs, i32 1), align 1, !dbg !26
  %11 = load i8, ptr getelementptr (i8, ptr @gs, i32 1), align 1, !dbg !26
  store i8 99, ptr getelementptr (i8, ptr @gs, i32 2), align 1, !dbg !27
  %12 = load i8, ptr getelementptr (i8, ptr @gs, i32 2), align 1, !dbg !27
  store i8 107, ptr getelementptr (i8, ptr @gs, i32 3), align 1, !dbg !28
  %13 = load i8, ptr getelementptr (i8, ptr @gs, i32 3), align 1, !dbg !28
  store i8 121, ptr getelementptr (i8, ptr @gs, i32 4), align 1, !dbg !29
  %14 = load i8, ptr getelementptr (i8, ptr @gs, i32 4), align 1, !dbg !29
  store i8 0, ptr getelementptr (i8, ptr @gs, i32 5), align 1, !dbg !30
  %15 = load i8, ptr getelementptr (i8, ptr @gs, i32 5), align 1, !dbg !30
  %16 = getelementptr i32, ptr %i, i32 0, !dbg !31
  store i32 128, ptr %16, align 4, !dbg !31
  %17 = load i32, ptr %16, align 4, !dbg !31
  %18 = getelementptr i32, ptr %i, i32 1, !dbg !32
  store i32 256, ptr %18, align 4, !dbg !32
  %19 = load i32, ptr %18, align 4, !dbg !32
  store i32 1024, ptr @gi, align 4, !dbg !33
  %20 = load i32, ptr @gi, align 4, !dbg !33
  store i32 2048, ptr getelementptr (i32, ptr @gi, i32 1), align 4, !dbg !34
  %21 = load i32, ptr getelementptr (i32, ptr @gi, i32 1), align 4, !dbg !34
  %22 = getelementptr i32, ptr %i, i32 0, !dbg !35
  %23 = load i32, ptr %22, align 4, !dbg !35
  %24 = icmp ne i32 %23, 128, !dbg !35
  br i1 %24, label %then, label %else, !dbg !35

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !36
  %25 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end, !dbg !36

else:                                             ; preds = %entry
  br label %if.end, !dbg !36

if.end:                                           ; preds = %else, %then
  %26 = getelementptr i32, ptr %i, i32 1, !dbg !37
  %27 = load i32, ptr %26, align 4, !dbg !37
  %28 = icmp ne i32 %27, 256, !dbg !37
  br i1 %28, label %then1, label %else2, !dbg !37

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !38
  %29 = load i32, ptr %err, align 4, !dbg !38
  br label %if.end3, !dbg !38

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !38

if.end3:                                          ; preds = %else2, %then1
  %30 = load i32, ptr @gi, align 4, !dbg !39
  %31 = icmp ne i32 %30, 1024, !dbg !39
  br i1 %31, label %then4, label %else5, !dbg !39

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !40
  %32 = load i32, ptr %err, align 4, !dbg !40
  br label %if.end6, !dbg !40

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !40

if.end6:                                          ; preds = %else5, %then4
  %33 = load i32, ptr getelementptr (i32, ptr @gi, i32 1), align 4, !dbg !41
  %34 = icmp ne i32 %33, 2048, !dbg !41
  br i1 %34, label %then7, label %else8, !dbg !41

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !42
  %35 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end9, !dbg !42

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !42

if.end9:                                          ; preds = %else8, %then7
  %36 = getelementptr i8, ptr %s, i32 0, !dbg !43
  %37 = load i8, ptr %36, align 1, !dbg !43
  %38 = sext i8 %37 to i32, !dbg !43
  %39 = icmp ne i32 %38, 103, !dbg !43
  br i1 %39, label %then10, label %else11, !dbg !43

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !44
  %40 = load i32, ptr %err, align 4, !dbg !44
  br label %if.end12, !dbg !44

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !44

if.end12:                                         ; preds = %else11, %then10
  %41 = load i8, ptr @gs, align 1, !dbg !45
  %42 = sext i8 %41 to i32, !dbg !45
  %43 = icmp ne i32 %42, 108, !dbg !45
  br i1 %43, label %then13, label %else14, !dbg !45

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !46
  %44 = load i32, ptr %err, align 4, !dbg !46
  br label %if.end15, !dbg !46

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !46

if.end15:                                         ; preds = %else14, %then13
  %45 = getelementptr i32, ptr %i, i32 2, !dbg !47
  store i32 0, ptr %45, align 4, !dbg !47
  %46 = load i32, ptr %45, align 4, !dbg !47
  %47 = getelementptr i32, ptr %i, i32 3, !dbg !48
  store i32 -1, ptr %47, align 4, !dbg !48
  %48 = load i32, ptr %47, align 4, !dbg !48
  %49 = getelementptr i32, ptr %i, i32 2, !dbg !49
  %50 = load i32, ptr %49, align 4, !dbg !49
  %51 = icmp ne i32 %50, 0, !dbg !49
  br i1 %51, label %then16, label %else17, !dbg !49

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !50
  %52 = load i32, ptr %err, align 4, !dbg !50
  br label %if.end18, !dbg !50

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !50

if.end18:                                         ; preds = %else17, %then16
  %53 = getelementptr i32, ptr %i, i32 3, !dbg !51
  %54 = load i32, ptr %53, align 4, !dbg !51
  %55 = icmp ne i32 %54, -1, !dbg !51
  br i1 %55, label %then19, label %else20, !dbg !51

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !52
  %56 = load i32, ptr %err, align 4, !dbg !52
  br label %if.end21, !dbg !52

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !52

if.end21:                                         ; preds = %else20, %then19
  %57 = load i32, ptr %err, align 4, !dbg !53
  %58 = icmp eq i32 %57, 0, !dbg !53
  br i1 %58, label %then22, label %else23, !dbg !53

then22:                                           ; preds = %if.end21
  %59 = call i32 (ptr, ...) @printf(ptr @1), !dbg !54
  br label %if.end24, !dbg !54

else23:                                           ; preds = %if.end21
  %60 = call i32 (ptr, ...) @printf(ptr @2), !dbg !56
  br label %if.end24, !dbg !56

if.end24:                                         ; preds = %else23, %then22
  %61 = load i32, ptr %err, align 4, !dbg !58
  ret i32 %61, !dbg !58
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "6.array_type.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 7, type: !3, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "i", scope: !2, file: !1, line: 10, type: !8)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 128, align: 32, elements: !9)
!9 = !{!10}
!10 = !DISubrange(count: 4, lowerBound: 0)
!11 = !DILocation(line: 10, column: 3, scope: !2)
!12 = !DILocalVariable(name: "s", scope: !2, file: !1, line: 9, type: !13)
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 128, align: 8, elements: !15)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !{!16}
!16 = !DISubrange(count: 16, lowerBound: 0)
!17 = !DILocation(line: 9, column: 3, scope: !2)
!18 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 8, type: !5)
!19 = !DILocation(line: 8, column: 3, scope: !2)
!20 = !DILocation(line: 12, column: 3, scope: !2)
!21 = !DILocation(line: 13, column: 3, scope: !2)
!22 = !DILocation(line: 14, column: 3, scope: !2)
!23 = !DILocation(line: 15, column: 3, scope: !2)
!24 = !DILocation(line: 16, column: 3, scope: !2)
!25 = !DILocation(line: 18, column: 3, scope: !2)
!26 = !DILocation(line: 19, column: 3, scope: !2)
!27 = !DILocation(line: 20, column: 3, scope: !2)
!28 = !DILocation(line: 21, column: 3, scope: !2)
!29 = !DILocation(line: 22, column: 3, scope: !2)
!30 = !DILocation(line: 23, column: 3, scope: !2)
!31 = !DILocation(line: 25, column: 3, scope: !2)
!32 = !DILocation(line: 26, column: 3, scope: !2)
!33 = !DILocation(line: 27, column: 3, scope: !2)
!34 = !DILocation(line: 28, column: 3, scope: !2)
!35 = !DILocation(line: 30, column: 3, scope: !2)
!36 = !DILocation(line: 30, column: 20, scope: !2)
!37 = !DILocation(line: 31, column: 3, scope: !2)
!38 = !DILocation(line: 31, column: 20, scope: !2)
!39 = !DILocation(line: 32, column: 3, scope: !2)
!40 = !DILocation(line: 32, column: 22, scope: !2)
!41 = !DILocation(line: 33, column: 3, scope: !2)
!42 = !DILocation(line: 33, column: 22, scope: !2)
!43 = !DILocation(line: 34, column: 3, scope: !2)
!44 = !DILocation(line: 34, column: 20, scope: !2)
!45 = !DILocation(line: 35, column: 3, scope: !2)
!46 = !DILocation(line: 35, column: 21, scope: !2)
!47 = !DILocation(line: 37, column: 3, scope: !2)
!48 = !DILocation(line: 38, column: 3, scope: !2)
!49 = !DILocation(line: 39, column: 3, scope: !2)
!50 = !DILocation(line: 39, column: 18, scope: !2)
!51 = !DILocation(line: 40, column: 3, scope: !2)
!52 = !DILocation(line: 40, column: 19, scope: !2)
!53 = !DILocation(line: 42, column: 3, scope: !2)
!54 = !DILocation(line: 43, column: 5, scope: !55)
!55 = distinct !DILexicalBlock(scope: !2, file: !1, line: 42, column: 17)
!56 = !DILocation(line: 45, column: 5, scope: !57)
!57 = distinct !DILexicalBlock(scope: !2, file: !1, line: 44, column: 10)
!58 = !DILocation(line: 47, column: 3, scope: !2)
