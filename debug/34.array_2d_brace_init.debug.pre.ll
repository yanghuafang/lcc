; ModuleID = 'lcc'
source_filename = "lcc"

@ga = global [2 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 4, i32 5, i32 6]]
@gb = global [2 x [3 x i32]] [[3 x i32] [i32 0, i32 1, i32 2], [3 x i32] [i32 3, i32 4, i32 5]]
@gc = global [2 x [2 x i32]] [[2 x i32] [i32 10, i32 11], [2 x i32] [i32 20, i32 0]]
@0 = private unnamed_addr constant [31 x i8] c"34.array_2d_brace_init.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"34.array_2d_brace_init.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %lc = alloca [2 x [3 x i32]], align 4
    #dbg_declare(ptr %lc, !6, !DIExpression(), !13)
  %lb = alloca [2 x [3 x i32]], align 4
    #dbg_declare(ptr %lb, !14, !DIExpression(), !15)
  %la = alloca [2 x [3 x i32]], align 4
    #dbg_declare(ptr %la, !16, !DIExpression(), !17)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !18, !DIExpression(), !19)
  store i32 0, ptr %err, align 4, !dbg !19
  %0 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 0, i32 0, !dbg !17
  store i32 1, ptr %0, align 4, !dbg !17
  %1 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 0, i32 1, !dbg !17
  store i32 2, ptr %1, align 4, !dbg !17
  %2 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 0, i32 2, !dbg !17
  store i32 0, ptr %2, align 4, !dbg !17
  %3 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 1, i32 0, !dbg !17
  store i32 3, ptr %3, align 4, !dbg !17
  %4 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 1, i32 1, !dbg !17
  store i32 0, ptr %4, align 4, !dbg !17
  %5 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 1, i32 2, !dbg !17
  store i32 0, ptr %5, align 4, !dbg !17
  %6 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 0, i32 0, !dbg !15
  store i32 7, ptr %6, align 4, !dbg !15
  %7 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 0, i32 1, !dbg !15
  store i32 8, ptr %7, align 4, !dbg !15
  %8 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 0, i32 2, !dbg !15
  store i32 9, ptr %8, align 4, !dbg !15
  %9 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 1, i32 0, !dbg !15
  store i32 10, ptr %9, align 4, !dbg !15
  %10 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 1, i32 1, !dbg !15
  store i32 11, ptr %10, align 4, !dbg !15
  %11 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 1, i32 2, !dbg !15
  store i32 12, ptr %11, align 4, !dbg !15
  %12 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 0, i32 0, !dbg !13
  store i32 1, ptr %12, align 4, !dbg !13
  %13 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 0, i32 1, !dbg !13
  store i32 2, ptr %13, align 4, !dbg !13
  %14 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 0, i32 2, !dbg !13
  store i32 3, ptr %14, align 4, !dbg !13
  %15 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 1, i32 0, !dbg !13
  store i32 4, ptr %15, align 4, !dbg !13
  %16 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 1, i32 1, !dbg !13
  store i32 0, ptr %16, align 4, !dbg !13
  %17 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 1, i32 2, !dbg !13
  store i32 0, ptr %17, align 4, !dbg !13
  %18 = getelementptr [3 x i32], ptr %la, i32 0, !dbg !20
  %19 = getelementptr i32, ptr %18, i32 0, !dbg !20
  %20 = load i32, ptr %19, align 4, !dbg !20
  %21 = icmp ne i32 %20, 1, !dbg !20
  br i1 %21, label %then, label %else, !dbg !20

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !21
  %22 = load i32, ptr %err, align 4, !dbg !21
  br label %if.end, !dbg !21

else:                                             ; preds = %entry
  br label %if.end, !dbg !21

if.end:                                           ; preds = %else, %then
  %23 = getelementptr [3 x i32], ptr %la, i32 0, !dbg !22
  %24 = getelementptr i32, ptr %23, i32 2, !dbg !22
  %25 = load i32, ptr %24, align 4, !dbg !22
  %26 = icmp ne i32 %25, 0, !dbg !22
  br i1 %26, label %then1, label %else2, !dbg !22

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !23
  %27 = load i32, ptr %err, align 4, !dbg !23
  br label %if.end3, !dbg !23

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !23

if.end3:                                          ; preds = %else2, %then1
  %28 = getelementptr [3 x i32], ptr %la, i32 1, !dbg !24
  %29 = getelementptr i32, ptr %28, i32 0, !dbg !24
  %30 = load i32, ptr %29, align 4, !dbg !24
  %31 = icmp ne i32 %30, 3, !dbg !24
  br i1 %31, label %then4, label %else5, !dbg !24

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !25
  %32 = load i32, ptr %err, align 4, !dbg !25
  br label %if.end6, !dbg !25

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !25

if.end6:                                          ; preds = %else5, %then4
  %33 = getelementptr [3 x i32], ptr %la, i32 1, !dbg !26
  %34 = getelementptr i32, ptr %33, i32 2, !dbg !26
  %35 = load i32, ptr %34, align 4, !dbg !26
  %36 = icmp ne i32 %35, 0, !dbg !26
  br i1 %36, label %then7, label %else8, !dbg !26

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !27
  %37 = load i32, ptr %err, align 4, !dbg !27
  br label %if.end9, !dbg !27

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !27

if.end9:                                          ; preds = %else8, %then7
  %38 = getelementptr [3 x i32], ptr %lb, i32 0, !dbg !28
  %39 = getelementptr i32, ptr %38, i32 0, !dbg !28
  %40 = load i32, ptr %39, align 4, !dbg !28
  %41 = icmp ne i32 %40, 7, !dbg !28
  br i1 %41, label %then10, label %else11, !dbg !28

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !29
  %42 = load i32, ptr %err, align 4, !dbg !29
  br label %if.end12, !dbg !29

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !29

if.end12:                                         ; preds = %else11, %then10
  %43 = getelementptr [3 x i32], ptr %lb, i32 1, !dbg !30
  %44 = getelementptr i32, ptr %43, i32 2, !dbg !30
  %45 = load i32, ptr %44, align 4, !dbg !30
  %46 = icmp ne i32 %45, 12, !dbg !30
  br i1 %46, label %then13, label %else14, !dbg !30

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !31
  %47 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end15, !dbg !31

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !31

if.end15:                                         ; preds = %else14, %then13
  %48 = getelementptr [3 x i32], ptr %lc, i32 0, !dbg !32
  %49 = getelementptr i32, ptr %48, i32 2, !dbg !32
  %50 = load i32, ptr %49, align 4, !dbg !32
  %51 = icmp ne i32 %50, 3, !dbg !32
  br i1 %51, label %then16, label %else17, !dbg !32

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !33
  %52 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end18, !dbg !33

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !33

if.end18:                                         ; preds = %else17, %then16
  %53 = getelementptr [3 x i32], ptr %lc, i32 1, !dbg !34
  %54 = getelementptr i32, ptr %53, i32 0, !dbg !34
  %55 = load i32, ptr %54, align 4, !dbg !34
  %56 = icmp ne i32 %55, 4, !dbg !34
  br i1 %56, label %then19, label %else20, !dbg !34

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !35
  %57 = load i32, ptr %err, align 4, !dbg !35
  br label %if.end21, !dbg !35

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !35

if.end21:                                         ; preds = %else20, %then19
  %58 = getelementptr [3 x i32], ptr %lc, i32 1, !dbg !36
  %59 = getelementptr i32, ptr %58, i32 2, !dbg !36
  %60 = load i32, ptr %59, align 4, !dbg !36
  %61 = icmp ne i32 %60, 0, !dbg !36
  br i1 %61, label %then22, label %else23, !dbg !36

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !37
  %62 = load i32, ptr %err, align 4, !dbg !37
  br label %if.end24, !dbg !37

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !37

if.end24:                                         ; preds = %else23, %then22
  %63 = load i32, ptr @ga, align 4, !dbg !38
  %64 = icmp ne i32 %63, 1, !dbg !38
  br i1 %64, label %then25, label %else26, !dbg !38

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !39
  %65 = load i32, ptr %err, align 4, !dbg !39
  br label %if.end27, !dbg !39

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !39

if.end27:                                         ; preds = %else26, %then25
  %66 = load i32, ptr getelementptr (i32, ptr getelementptr ([3 x i32], ptr @ga, i32 1), i32 2), align 4, !dbg !40
  %67 = icmp ne i32 %66, 6, !dbg !40
  br i1 %67, label %then28, label %else29, !dbg !40

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !41
  %68 = load i32, ptr %err, align 4, !dbg !41
  br label %if.end30, !dbg !41

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !41

if.end30:                                         ; preds = %else29, %then28
  %69 = load i32, ptr getelementptr (i32, ptr @gb, i32 1), align 4, !dbg !42
  %70 = icmp ne i32 %69, 1, !dbg !42
  br i1 %70, label %then31, label %else32, !dbg !42

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !43
  %71 = load i32, ptr %err, align 4, !dbg !43
  br label %if.end33, !dbg !43

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !43

if.end33:                                         ; preds = %else32, %then31
  %72 = load i32, ptr getelementptr ([3 x i32], ptr @gb, i32 1), align 4, !dbg !44
  %73 = icmp ne i32 %72, 3, !dbg !44
  br i1 %73, label %then34, label %else35, !dbg !44

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !45
  %74 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end36, !dbg !45

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !45

if.end36:                                         ; preds = %else35, %then34
  %75 = load i32, ptr getelementptr (i32, ptr @gc, i32 1), align 4, !dbg !46
  %76 = icmp ne i32 %75, 11, !dbg !46
  br i1 %76, label %then37, label %else38, !dbg !46

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !47
  %77 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end39, !dbg !47

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !47

if.end39:                                         ; preds = %else38, %then37
  %78 = load i32, ptr getelementptr ([2 x i32], ptr @gc, i32 1), align 4, !dbg !48
  %79 = icmp ne i32 %78, 20, !dbg !48
  br i1 %79, label %then40, label %else41, !dbg !48

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !49
  %80 = load i32, ptr %err, align 4, !dbg !49
  br label %if.end42, !dbg !49

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !49

if.end42:                                         ; preds = %else41, %then40
  %81 = load i32, ptr getelementptr (i32, ptr getelementptr ([2 x i32], ptr @gc, i32 1), i32 1), align 4, !dbg !50
  %82 = icmp ne i32 %81, 0, !dbg !50
  br i1 %82, label %then43, label %else44, !dbg !50

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4, !dbg !51
  %83 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end45, !dbg !51

else44:                                           ; preds = %if.end42
  br label %if.end45, !dbg !51

if.end45:                                         ; preds = %else44, %then43
  %84 = load i32, ptr %err, align 4, !dbg !52
  %85 = icmp eq i32 %84, 0, !dbg !52
  br i1 %85, label %then46, label %else47, !dbg !52

then46:                                           ; preds = %if.end45
  %86 = call i32 (ptr, ...) @printf(ptr @0), !dbg !53
  br label %if.end48, !dbg !53

else47:                                           ; preds = %if.end45
  %87 = call i32 (ptr, ...) @printf(ptr @1), !dbg !55
  br label %if.end48, !dbg !55

if.end48:                                         ; preds = %else47, %then46
  %88 = load i32, ptr %err, align 4, !dbg !57
  ret i32 %88, !dbg !57
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "34.array_2d_brace_init.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 7, type: !3, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "lc", scope: !2, file: !1, line: 11, type: !7)
!7 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 192, align: 32, elements: !11)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 96, align: 32, elements: !9)
!9 = !{!10}
!10 = !DISubrange(count: 3, lowerBound: 0)
!11 = !{!12}
!12 = !DISubrange(count: 2, lowerBound: 0)
!13 = !DILocation(line: 11, column: 3, scope: !2)
!14 = !DILocalVariable(name: "lb", scope: !2, file: !1, line: 10, type: !7)
!15 = !DILocation(line: 10, column: 3, scope: !2)
!16 = !DILocalVariable(name: "la", scope: !2, file: !1, line: 9, type: !7)
!17 = !DILocation(line: 9, column: 3, scope: !2)
!18 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 8, type: !5)
!19 = !DILocation(line: 8, column: 3, scope: !2)
!20 = !DILocation(line: 13, column: 3, scope: !2)
!21 = !DILocation(line: 13, column: 22, scope: !2)
!22 = !DILocation(line: 14, column: 3, scope: !2)
!23 = !DILocation(line: 14, column: 22, scope: !2)
!24 = !DILocation(line: 15, column: 3, scope: !2)
!25 = !DILocation(line: 15, column: 22, scope: !2)
!26 = !DILocation(line: 16, column: 3, scope: !2)
!27 = !DILocation(line: 16, column: 22, scope: !2)
!28 = !DILocation(line: 18, column: 3, scope: !2)
!29 = !DILocation(line: 18, column: 22, scope: !2)
!30 = !DILocation(line: 19, column: 3, scope: !2)
!31 = !DILocation(line: 19, column: 23, scope: !2)
!32 = !DILocation(line: 21, column: 3, scope: !2)
!33 = !DILocation(line: 21, column: 22, scope: !2)
!34 = !DILocation(line: 22, column: 3, scope: !2)
!35 = !DILocation(line: 22, column: 22, scope: !2)
!36 = !DILocation(line: 23, column: 3, scope: !2)
!37 = !DILocation(line: 23, column: 22, scope: !2)
!38 = !DILocation(line: 25, column: 3, scope: !2)
!39 = !DILocation(line: 25, column: 22, scope: !2)
!40 = !DILocation(line: 26, column: 3, scope: !2)
!41 = !DILocation(line: 26, column: 22, scope: !2)
!42 = !DILocation(line: 28, column: 3, scope: !2)
!43 = !DILocation(line: 28, column: 22, scope: !2)
!44 = !DILocation(line: 29, column: 3, scope: !2)
!45 = !DILocation(line: 29, column: 22, scope: !2)
!46 = !DILocation(line: 31, column: 3, scope: !2)
!47 = !DILocation(line: 31, column: 23, scope: !2)
!48 = !DILocation(line: 32, column: 3, scope: !2)
!49 = !DILocation(line: 32, column: 23, scope: !2)
!50 = !DILocation(line: 33, column: 3, scope: !2)
!51 = !DILocation(line: 33, column: 22, scope: !2)
!52 = !DILocation(line: 35, column: 3, scope: !2)
!53 = !DILocation(line: 36, column: 5, scope: !54)
!54 = distinct !DILexicalBlock(scope: !2, file: !1, line: 35, column: 17)
!55 = !DILocation(line: 38, column: 5, scope: !56)
!56 = distinct !DILexicalBlock(scope: !2, file: !1, line: 37, column: 10)
!57 = !DILocation(line: 40, column: 3, scope: !2)
