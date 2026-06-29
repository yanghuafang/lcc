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
    #dbg_declare(ptr %lc, !7, !DIExpression(), !11)
  %lb = alloca [3 x i32], align 4
    #dbg_declare(ptr %lb, !12, !DIExpression(), !16)
  %la = alloca [4 x i32], align 4
    #dbg_declare(ptr %la, !17, !DIExpression(), !21)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !22, !DIExpression(), !23)
  store i32 0, ptr %err, align 4, !dbg !23
  %0 = getelementptr [4 x i32], ptr %la, i32 0, i32 0, !dbg !21
  store i32 1, ptr %0, align 4, !dbg !21
  %1 = getelementptr [4 x i32], ptr %la, i32 0, i32 1, !dbg !21
  store i32 2, ptr %1, align 4, !dbg !21
  %2 = getelementptr [4 x i32], ptr %la, i32 0, i32 2, !dbg !21
  store i32 3, ptr %2, align 4, !dbg !21
  %3 = getelementptr [4 x i32], ptr %la, i32 0, i32 3, !dbg !21
  store i32 0, ptr %3, align 4, !dbg !21
  %4 = getelementptr [3 x i32], ptr %lb, i32 0, i32 0, !dbg !16
  store i32 4, ptr %4, align 4, !dbg !16
  %5 = getelementptr [3 x i32], ptr %lb, i32 0, i32 1, !dbg !16
  store i32 5, ptr %5, align 4, !dbg !16
  %6 = getelementptr [3 x i32], ptr %lb, i32 0, i32 2, !dbg !16
  store i32 6, ptr %6, align 4, !dbg !16
  %7 = getelementptr [2 x i32], ptr %lc, i32 0, i32 0, !dbg !11
  store i32 0, ptr %7, align 4, !dbg !11
  %8 = getelementptr [2 x i32], ptr %lc, i32 0, i32 1, !dbg !11
  store i32 0, ptr %8, align 4, !dbg !11
  %9 = getelementptr i32, ptr %la, i32 0, !dbg !24
  %10 = load i32, ptr %9, align 4, !dbg !24
  %11 = icmp ne i32 %10, 1, !dbg !24
  br i1 %11, label %then, label %else, !dbg !24

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !25
  %12 = load i32, ptr %err, align 4, !dbg !25
  br label %if.end, !dbg !25

else:                                             ; preds = %entry
  br label %if.end, !dbg !25

if.end:                                           ; preds = %else, %then
  %13 = getelementptr i32, ptr %la, i32 1, !dbg !26
  %14 = load i32, ptr %13, align 4, !dbg !26
  %15 = icmp ne i32 %14, 2, !dbg !26
  br i1 %15, label %then1, label %else2, !dbg !26

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !27
  %16 = load i32, ptr %err, align 4, !dbg !27
  br label %if.end3, !dbg !27

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !27

if.end3:                                          ; preds = %else2, %then1
  %17 = getelementptr i32, ptr %la, i32 2, !dbg !28
  %18 = load i32, ptr %17, align 4, !dbg !28
  %19 = icmp ne i32 %18, 3, !dbg !28
  br i1 %19, label %then4, label %else5, !dbg !28

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !29
  %20 = load i32, ptr %err, align 4, !dbg !29
  br label %if.end6, !dbg !29

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !29

if.end6:                                          ; preds = %else5, %then4
  %21 = getelementptr i32, ptr %la, i32 3, !dbg !30
  %22 = load i32, ptr %21, align 4, !dbg !30
  %23 = icmp ne i32 %22, 0, !dbg !30
  br i1 %23, label %then7, label %else8, !dbg !30

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !31
  %24 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end9, !dbg !31

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !31

if.end9:                                          ; preds = %else8, %then7
  %25 = getelementptr i32, ptr %lb, i32 0, !dbg !32
  %26 = load i32, ptr %25, align 4, !dbg !32
  %27 = icmp ne i32 %26, 4, !dbg !32
  br i1 %27, label %then10, label %else11, !dbg !32

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !33
  %28 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end12, !dbg !33

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !33

if.end12:                                         ; preds = %else11, %then10
  %29 = getelementptr i32, ptr %lb, i32 1, !dbg !34
  %30 = load i32, ptr %29, align 4, !dbg !34
  %31 = icmp ne i32 %30, 5, !dbg !34
  br i1 %31, label %then13, label %else14, !dbg !34

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !35
  %32 = load i32, ptr %err, align 4, !dbg !35
  br label %if.end15, !dbg !35

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !35

if.end15:                                         ; preds = %else14, %then13
  %33 = getelementptr i32, ptr %lb, i32 2, !dbg !36
  %34 = load i32, ptr %33, align 4, !dbg !36
  %35 = icmp ne i32 %34, 6, !dbg !36
  br i1 %35, label %then16, label %else17, !dbg !36

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !37
  %36 = load i32, ptr %err, align 4, !dbg !37
  br label %if.end18, !dbg !37

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !37

if.end18:                                         ; preds = %else17, %then16
  %37 = getelementptr i32, ptr %lc, i32 0, !dbg !38
  %38 = load i32, ptr %37, align 4, !dbg !38
  %39 = icmp ne i32 %38, 0, !dbg !38
  br i1 %39, label %then19, label %else20, !dbg !38

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !39
  %40 = load i32, ptr %err, align 4, !dbg !39
  br label %if.end21, !dbg !39

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !39

if.end21:                                         ; preds = %else20, %then19
  %41 = getelementptr i32, ptr %lc, i32 1, !dbg !40
  %42 = load i32, ptr %41, align 4, !dbg !40
  %43 = icmp ne i32 %42, 0, !dbg !40
  br i1 %43, label %then22, label %else23, !dbg !40

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !41
  %44 = load i32, ptr %err, align 4, !dbg !41
  br label %if.end24, !dbg !41

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !41

if.end24:                                         ; preds = %else23, %then22
  %45 = load i32, ptr @ga, align 4, !dbg !42
  %46 = icmp ne i32 %45, 1, !dbg !42
  br i1 %46, label %then25, label %else26, !dbg !42

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !43
  %47 = load i32, ptr %err, align 4, !dbg !43
  br label %if.end27, !dbg !43

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !43

if.end27:                                         ; preds = %else26, %then25
  %48 = load i32, ptr getelementptr (i32, ptr @ga, i32 1), align 4, !dbg !44
  %49 = icmp ne i32 %48, 2, !dbg !44
  br i1 %49, label %then28, label %else29, !dbg !44

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !45
  %50 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end30, !dbg !45

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !45

if.end30:                                         ; preds = %else29, %then28
  %51 = load i32, ptr getelementptr (i32, ptr @ga, i32 2), align 4, !dbg !46
  %52 = icmp ne i32 %51, 3, !dbg !46
  br i1 %52, label %then31, label %else32, !dbg !46

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !47
  %53 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end33, !dbg !47

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !47

if.end33:                                         ; preds = %else32, %then31
  %54 = load i32, ptr getelementptr (i32, ptr @ga, i32 3), align 4, !dbg !48
  %55 = icmp ne i32 %54, 0, !dbg !48
  br i1 %55, label %then34, label %else35, !dbg !48

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !49
  %56 = load i32, ptr %err, align 4, !dbg !49
  br label %if.end36, !dbg !49

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !49

if.end36:                                         ; preds = %else35, %then34
  %57 = load i32, ptr @gb, align 4, !dbg !50
  %58 = icmp ne i32 %57, 10, !dbg !50
  br i1 %58, label %then37, label %else38, !dbg !50

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !51
  %59 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end39, !dbg !51

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !51

if.end39:                                         ; preds = %else38, %then37
  %60 = load i32, ptr getelementptr (i32, ptr @gb, i32 1), align 4, !dbg !52
  %61 = icmp ne i32 %60, 20, !dbg !52
  br i1 %61, label %then40, label %else41, !dbg !52

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !53
  %62 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end42, !dbg !53

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !53

if.end42:                                         ; preds = %else41, %then40
  %63 = load i32, ptr %err, align 4, !dbg !54
  %64 = icmp eq i32 %63, 0, !dbg !54
  br i1 %64, label %then43, label %else44, !dbg !54

then43:                                           ; preds = %if.end42
  %65 = call i32 (ptr, ...) @printf(ptr @0), !dbg !55
  br label %if.end45, !dbg !55

else44:                                           ; preds = %if.end42
  %66 = call i32 (ptr, ...) @printf(ptr @1), !dbg !57
  br label %if.end45, !dbg !57

if.end45:                                         ; preds = %else44, %then43
  %67 = load i32, ptr %err, align 4, !dbg !59
  ret i32 %67, !dbg !59
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "31.array_1d_brace_init.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 6, type: !3, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "lc", scope: !2, file: !1, line: 10, type: !8)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 64, align: 32, elements: !9)
!9 = !{!10}
!10 = !DISubrange(count: 2, lowerBound: 0)
!11 = !DILocation(line: 10, column: 3, scope: !2)
!12 = !DILocalVariable(name: "lb", scope: !2, file: !1, line: 9, type: !13)
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 96, align: 32, elements: !14)
!14 = !{!15}
!15 = !DISubrange(count: 3, lowerBound: 0)
!16 = !DILocation(line: 9, column: 3, scope: !2)
!17 = !DILocalVariable(name: "la", scope: !2, file: !1, line: 8, type: !18)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 128, align: 32, elements: !19)
!19 = !{!20}
!20 = !DISubrange(count: 4, lowerBound: 0)
!21 = !DILocation(line: 8, column: 3, scope: !2)
!22 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 7, type: !5)
!23 = !DILocation(line: 7, column: 3, scope: !2)
!24 = !DILocation(line: 12, column: 3, scope: !2)
!25 = !DILocation(line: 12, column: 19, scope: !2)
!26 = !DILocation(line: 13, column: 3, scope: !2)
!27 = !DILocation(line: 13, column: 19, scope: !2)
!28 = !DILocation(line: 14, column: 3, scope: !2)
!29 = !DILocation(line: 14, column: 19, scope: !2)
!30 = !DILocation(line: 15, column: 3, scope: !2)
!31 = !DILocation(line: 15, column: 19, scope: !2)
!32 = !DILocation(line: 17, column: 3, scope: !2)
!33 = !DILocation(line: 17, column: 19, scope: !2)
!34 = !DILocation(line: 18, column: 3, scope: !2)
!35 = !DILocation(line: 18, column: 19, scope: !2)
!36 = !DILocation(line: 19, column: 3, scope: !2)
!37 = !DILocation(line: 19, column: 19, scope: !2)
!38 = !DILocation(line: 21, column: 3, scope: !2)
!39 = !DILocation(line: 21, column: 19, scope: !2)
!40 = !DILocation(line: 22, column: 3, scope: !2)
!41 = !DILocation(line: 22, column: 19, scope: !2)
!42 = !DILocation(line: 24, column: 3, scope: !2)
!43 = !DILocation(line: 24, column: 19, scope: !2)
!44 = !DILocation(line: 25, column: 3, scope: !2)
!45 = !DILocation(line: 25, column: 19, scope: !2)
!46 = !DILocation(line: 26, column: 3, scope: !2)
!47 = !DILocation(line: 26, column: 19, scope: !2)
!48 = !DILocation(line: 27, column: 3, scope: !2)
!49 = !DILocation(line: 27, column: 19, scope: !2)
!50 = !DILocation(line: 29, column: 3, scope: !2)
!51 = !DILocation(line: 29, column: 20, scope: !2)
!52 = !DILocation(line: 30, column: 3, scope: !2)
!53 = !DILocation(line: 30, column: 20, scope: !2)
!54 = !DILocation(line: 32, column: 3, scope: !2)
!55 = !DILocation(line: 33, column: 5, scope: !56)
!56 = distinct !DILexicalBlock(scope: !2, file: !1, line: 32, column: 17)
!57 = !DILocation(line: 35, column: 5, scope: !58)
!58 = distinct !DILexicalBlock(scope: !2, file: !1, line: 34, column: 10)
!59 = !DILocation(line: 37, column: 3, scope: !2)
