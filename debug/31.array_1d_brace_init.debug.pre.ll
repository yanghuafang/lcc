; ModuleID = 'lcc'
source_filename = "lcc"

@ga = global [4 x i32] [i32 1, i32 2, i32 3, i32 0]
@gb = global [2 x i32] [i32 10, i32 20]
@0 = private unnamed_addr constant [31 x i8] c"31.array_1d_brace_init.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"31.array_1d_brace_init.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %lc = alloca [2 x i32], align 4
    #dbg_declare(ptr %lc, !6, !DIExpression(), !10)
  %lb = alloca [3 x i32], align 4
    #dbg_declare(ptr %lb, !11, !DIExpression(), !15)
  %la = alloca [4 x i32], align 4
    #dbg_declare(ptr %la, !16, !DIExpression(), !20)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !21, !DIExpression(), !22)
  store i32 0, ptr %err, align 4, !dbg !22
  %0 = getelementptr [4 x i32], ptr %la, i32 0, i32 0, !dbg !20
  store i32 1, ptr %0, align 4, !dbg !20
  %1 = getelementptr [4 x i32], ptr %la, i32 0, i32 1, !dbg !20
  store i32 2, ptr %1, align 4, !dbg !20
  %2 = getelementptr [4 x i32], ptr %la, i32 0, i32 2, !dbg !20
  store i32 3, ptr %2, align 4, !dbg !20
  %3 = getelementptr [4 x i32], ptr %la, i32 0, i32 3, !dbg !20
  store i32 0, ptr %3, align 4, !dbg !20
  %4 = getelementptr [3 x i32], ptr %lb, i32 0, i32 0, !dbg !15
  store i32 4, ptr %4, align 4, !dbg !15
  %5 = getelementptr [3 x i32], ptr %lb, i32 0, i32 1, !dbg !15
  store i32 5, ptr %5, align 4, !dbg !15
  %6 = getelementptr [3 x i32], ptr %lb, i32 0, i32 2, !dbg !15
  store i32 6, ptr %6, align 4, !dbg !15
  %7 = getelementptr [2 x i32], ptr %lc, i32 0, i32 0, !dbg !10
  store i32 0, ptr %7, align 4, !dbg !10
  %8 = getelementptr [2 x i32], ptr %lc, i32 0, i32 1, !dbg !10
  store i32 0, ptr %8, align 4, !dbg !10
  %9 = getelementptr i32, ptr %la, i32 0, !dbg !23
  %10 = load i32, ptr %9, align 4, !dbg !23
  %11 = icmp ne i32 %10, 1, !dbg !23
  br i1 %11, label %then, label %else, !dbg !23

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !24
  %12 = load i32, ptr %err, align 4, !dbg !24
  br label %if.end, !dbg !24

else:                                             ; preds = %entry
  br label %if.end, !dbg !24

if.end:                                           ; preds = %else, %then
  %13 = getelementptr i32, ptr %la, i32 1, !dbg !25
  %14 = load i32, ptr %13, align 4, !dbg !25
  %15 = icmp ne i32 %14, 2, !dbg !25
  br i1 %15, label %then1, label %else2, !dbg !25

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !26
  %16 = load i32, ptr %err, align 4, !dbg !26
  br label %if.end3, !dbg !26

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !26

if.end3:                                          ; preds = %else2, %then1
  %17 = getelementptr i32, ptr %la, i32 2, !dbg !27
  %18 = load i32, ptr %17, align 4, !dbg !27
  %19 = icmp ne i32 %18, 3, !dbg !27
  br i1 %19, label %then4, label %else5, !dbg !27

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !28
  %20 = load i32, ptr %err, align 4, !dbg !28
  br label %if.end6, !dbg !28

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !28

if.end6:                                          ; preds = %else5, %then4
  %21 = getelementptr i32, ptr %la, i32 3, !dbg !29
  %22 = load i32, ptr %21, align 4, !dbg !29
  %23 = icmp ne i32 %22, 0, !dbg !29
  br i1 %23, label %then7, label %else8, !dbg !29

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !30
  %24 = load i32, ptr %err, align 4, !dbg !30
  br label %if.end9, !dbg !30

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !30

if.end9:                                          ; preds = %else8, %then7
  %25 = getelementptr i32, ptr %lb, i32 0, !dbg !31
  %26 = load i32, ptr %25, align 4, !dbg !31
  %27 = icmp ne i32 %26, 4, !dbg !31
  br i1 %27, label %then10, label %else11, !dbg !31

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !32
  %28 = load i32, ptr %err, align 4, !dbg !32
  br label %if.end12, !dbg !32

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !32

if.end12:                                         ; preds = %else11, %then10
  %29 = getelementptr i32, ptr %lb, i32 1, !dbg !33
  %30 = load i32, ptr %29, align 4, !dbg !33
  %31 = icmp ne i32 %30, 5, !dbg !33
  br i1 %31, label %then13, label %else14, !dbg !33

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !34
  %32 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end15, !dbg !34

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !34

if.end15:                                         ; preds = %else14, %then13
  %33 = getelementptr i32, ptr %lb, i32 2, !dbg !35
  %34 = load i32, ptr %33, align 4, !dbg !35
  %35 = icmp ne i32 %34, 6, !dbg !35
  br i1 %35, label %then16, label %else17, !dbg !35

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !36
  %36 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end18, !dbg !36

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !36

if.end18:                                         ; preds = %else17, %then16
  %37 = getelementptr i32, ptr %lc, i32 0, !dbg !37
  %38 = load i32, ptr %37, align 4, !dbg !37
  %39 = icmp ne i32 %38, 0, !dbg !37
  br i1 %39, label %then19, label %else20, !dbg !37

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !38
  %40 = load i32, ptr %err, align 4, !dbg !38
  br label %if.end21, !dbg !38

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !38

if.end21:                                         ; preds = %else20, %then19
  %41 = getelementptr i32, ptr %lc, i32 1, !dbg !39
  %42 = load i32, ptr %41, align 4, !dbg !39
  %43 = icmp ne i32 %42, 0, !dbg !39
  br i1 %43, label %then22, label %else23, !dbg !39

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !40
  %44 = load i32, ptr %err, align 4, !dbg !40
  br label %if.end24, !dbg !40

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !40

if.end24:                                         ; preds = %else23, %then22
  %45 = load i32, ptr @ga, align 4, !dbg !41
  %46 = icmp ne i32 %45, 1, !dbg !41
  br i1 %46, label %then25, label %else26, !dbg !41

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !42
  %47 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end27, !dbg !42

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !42

if.end27:                                         ; preds = %else26, %then25
  %48 = load i32, ptr getelementptr (i32, ptr @ga, i32 1), align 4, !dbg !43
  %49 = icmp ne i32 %48, 2, !dbg !43
  br i1 %49, label %then28, label %else29, !dbg !43

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !44
  %50 = load i32, ptr %err, align 4, !dbg !44
  br label %if.end30, !dbg !44

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !44

if.end30:                                         ; preds = %else29, %then28
  %51 = load i32, ptr getelementptr (i32, ptr @ga, i32 2), align 4, !dbg !45
  %52 = icmp ne i32 %51, 3, !dbg !45
  br i1 %52, label %then31, label %else32, !dbg !45

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !46
  %53 = load i32, ptr %err, align 4, !dbg !46
  br label %if.end33, !dbg !46

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !46

if.end33:                                         ; preds = %else32, %then31
  %54 = load i32, ptr getelementptr (i32, ptr @ga, i32 3), align 4, !dbg !47
  %55 = icmp ne i32 %54, 0, !dbg !47
  br i1 %55, label %then34, label %else35, !dbg !47

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !48
  %56 = load i32, ptr %err, align 4, !dbg !48
  br label %if.end36, !dbg !48

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !48

if.end36:                                         ; preds = %else35, %then34
  %57 = load i32, ptr @gb, align 4, !dbg !49
  %58 = icmp ne i32 %57, 10, !dbg !49
  br i1 %58, label %then37, label %else38, !dbg !49

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !50
  %59 = load i32, ptr %err, align 4, !dbg !50
  br label %if.end39, !dbg !50

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !50

if.end39:                                         ; preds = %else38, %then37
  %60 = load i32, ptr getelementptr (i32, ptr @gb, i32 1), align 4, !dbg !51
  %61 = icmp ne i32 %60, 20, !dbg !51
  br i1 %61, label %then40, label %else41, !dbg !51

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !52
  %62 = load i32, ptr %err, align 4, !dbg !52
  br label %if.end42, !dbg !52

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !52

if.end42:                                         ; preds = %else41, %then40
  %63 = load i32, ptr %err, align 4, !dbg !53
  %64 = icmp eq i32 %63, 0, !dbg !53
  br i1 %64, label %then43, label %else44, !dbg !53

then43:                                           ; preds = %if.end42
  %65 = call i32 (ptr, ...) @printf(ptr @0), !dbg !54
  br label %if.end45, !dbg !54

else44:                                           ; preds = %if.end42
  %66 = call i32 (ptr, ...) @printf(ptr @1), !dbg !56
  br label %if.end45, !dbg !56

if.end45:                                         ; preds = %else44, %then43
  %67 = load i32, ptr %err, align 4, !dbg !58
  ret i32 %67, !dbg !58
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "31.array_1d_brace_init.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 6, type: !3, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "lc", scope: !2, file: !1, line: 10, type: !7)
!7 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 64, align: 32, elements: !8)
!8 = !{!9}
!9 = !DISubrange(count: 2, lowerBound: 0)
!10 = !DILocation(line: 10, column: 3, scope: !2)
!11 = !DILocalVariable(name: "lb", scope: !2, file: !1, line: 9, type: !12)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 96, align: 32, elements: !13)
!13 = !{!14}
!14 = !DISubrange(count: 3, lowerBound: 0)
!15 = !DILocation(line: 9, column: 3, scope: !2)
!16 = !DILocalVariable(name: "la", scope: !2, file: !1, line: 8, type: !17)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 128, align: 32, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 4, lowerBound: 0)
!20 = !DILocation(line: 8, column: 3, scope: !2)
!21 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 7, type: !5)
!22 = !DILocation(line: 7, column: 3, scope: !2)
!23 = !DILocation(line: 12, column: 3, scope: !2)
!24 = !DILocation(line: 12, column: 19, scope: !2)
!25 = !DILocation(line: 13, column: 3, scope: !2)
!26 = !DILocation(line: 13, column: 19, scope: !2)
!27 = !DILocation(line: 14, column: 3, scope: !2)
!28 = !DILocation(line: 14, column: 19, scope: !2)
!29 = !DILocation(line: 15, column: 3, scope: !2)
!30 = !DILocation(line: 15, column: 19, scope: !2)
!31 = !DILocation(line: 17, column: 3, scope: !2)
!32 = !DILocation(line: 17, column: 19, scope: !2)
!33 = !DILocation(line: 18, column: 3, scope: !2)
!34 = !DILocation(line: 18, column: 19, scope: !2)
!35 = !DILocation(line: 19, column: 3, scope: !2)
!36 = !DILocation(line: 19, column: 19, scope: !2)
!37 = !DILocation(line: 21, column: 3, scope: !2)
!38 = !DILocation(line: 21, column: 19, scope: !2)
!39 = !DILocation(line: 22, column: 3, scope: !2)
!40 = !DILocation(line: 22, column: 19, scope: !2)
!41 = !DILocation(line: 24, column: 3, scope: !2)
!42 = !DILocation(line: 24, column: 19, scope: !2)
!43 = !DILocation(line: 25, column: 3, scope: !2)
!44 = !DILocation(line: 25, column: 19, scope: !2)
!45 = !DILocation(line: 26, column: 3, scope: !2)
!46 = !DILocation(line: 26, column: 19, scope: !2)
!47 = !DILocation(line: 27, column: 3, scope: !2)
!48 = !DILocation(line: 27, column: 19, scope: !2)
!49 = !DILocation(line: 29, column: 3, scope: !2)
!50 = !DILocation(line: 29, column: 20, scope: !2)
!51 = !DILocation(line: 30, column: 3, scope: !2)
!52 = !DILocation(line: 30, column: 20, scope: !2)
!53 = !DILocation(line: 32, column: 3, scope: !2)
!54 = !DILocation(line: 33, column: 5, scope: !55)
!55 = distinct !DILexicalBlock(scope: !2, file: !1, line: 32, column: 17)
!56 = !DILocation(line: 35, column: 5, scope: !57)
!57 = distinct !DILexicalBlock(scope: !2, file: !1, line: 34, column: 10)
!58 = !DILocation(line: 37, column: 3, scope: !2)
