; ModuleID = 'lcc'
source_filename = "lcc"

@ga = global [6 x i32] [i32 10, i32 7, i32 8, i32 9, i32 1, i32 5]
@gs = global [3 x i8] c"hi\00"
@gt = global [4 x i8] c"hey\00"
@0 = private unnamed_addr constant [41 x i8] c"32.array_1d_inferred_string_init.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [41 x i8] c"32.array_1d_inferred_string_init.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %lb = alloca [6 x i8], align 1
    #dbg_declare(ptr %lb, !7, !DIExpression(), !12)
  %ls = alloca [6 x i8], align 1
    #dbg_declare(ptr %ls, !13, !DIExpression(), !14)
  %la = alloca [3 x i32], align 4
    #dbg_declare(ptr %la, !15, !DIExpression(), !19)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !20, !DIExpression(), !21)
  store i32 0, ptr %err, align 4, !dbg !21
  %0 = getelementptr [3 x i32], ptr %la, i32 0, i32 0, !dbg !19
  store i32 1, ptr %0, align 4, !dbg !19
  %1 = getelementptr [3 x i32], ptr %la, i32 0, i32 1, !dbg !19
  store i32 2, ptr %1, align 4, !dbg !19
  %2 = getelementptr [3 x i32], ptr %la, i32 0, i32 2, !dbg !19
  store i32 3, ptr %2, align 4, !dbg !19
  %3 = getelementptr [6 x i8], ptr %ls, i32 0, i32 0, !dbg !14
  store i8 104, ptr %3, align 1, !dbg !14
  %4 = getelementptr [6 x i8], ptr %ls, i32 0, i32 1, !dbg !14
  store i8 101, ptr %4, align 1, !dbg !14
  %5 = getelementptr [6 x i8], ptr %ls, i32 0, i32 2, !dbg !14
  store i8 108, ptr %5, align 1, !dbg !14
  %6 = getelementptr [6 x i8], ptr %ls, i32 0, i32 3, !dbg !14
  store i8 108, ptr %6, align 1, !dbg !14
  %7 = getelementptr [6 x i8], ptr %ls, i32 0, i32 4, !dbg !14
  store i8 111, ptr %7, align 1, !dbg !14
  %8 = getelementptr [6 x i8], ptr %ls, i32 0, i32 5, !dbg !14
  store i8 0, ptr %8, align 1, !dbg !14
  %9 = getelementptr [6 x i8], ptr %lb, i32 0, i32 0, !dbg !12
  store i8 104, ptr %9, align 1, !dbg !12
  %10 = getelementptr [6 x i8], ptr %lb, i32 0, i32 1, !dbg !12
  store i8 101, ptr %10, align 1, !dbg !12
  %11 = getelementptr [6 x i8], ptr %lb, i32 0, i32 2, !dbg !12
  store i8 108, ptr %11, align 1, !dbg !12
  %12 = getelementptr [6 x i8], ptr %lb, i32 0, i32 3, !dbg !12
  store i8 108, ptr %12, align 1, !dbg !12
  %13 = getelementptr [6 x i8], ptr %lb, i32 0, i32 4, !dbg !12
  store i8 111, ptr %13, align 1, !dbg !12
  %14 = getelementptr [6 x i8], ptr %lb, i32 0, i32 5, !dbg !12
  store i8 0, ptr %14, align 1, !dbg !12
  %15 = getelementptr i32, ptr %la, i32 0, !dbg !22
  %16 = load i32, ptr %15, align 4, !dbg !22
  %17 = icmp ne i32 %16, 1, !dbg !22
  br i1 %17, label %then, label %else, !dbg !22

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !23
  %18 = load i32, ptr %err, align 4, !dbg !23
  br label %if.end, !dbg !23

else:                                             ; preds = %entry
  br label %if.end, !dbg !23

if.end:                                           ; preds = %else, %then
  %19 = getelementptr i32, ptr %la, i32 1, !dbg !24
  %20 = load i32, ptr %19, align 4, !dbg !24
  %21 = icmp ne i32 %20, 2, !dbg !24
  br i1 %21, label %then1, label %else2, !dbg !24

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !25
  %22 = load i32, ptr %err, align 4, !dbg !25
  br label %if.end3, !dbg !25

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !25

if.end3:                                          ; preds = %else2, %then1
  %23 = getelementptr i32, ptr %la, i32 2, !dbg !26
  %24 = load i32, ptr %23, align 4, !dbg !26
  %25 = icmp ne i32 %24, 3, !dbg !26
  br i1 %25, label %then4, label %else5, !dbg !26

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !27
  %26 = load i32, ptr %err, align 4, !dbg !27
  br label %if.end6, !dbg !27

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !27

if.end6:                                          ; preds = %else5, %then4
  %27 = getelementptr i8, ptr %ls, i32 0, !dbg !28
  %28 = load i8, ptr %27, align 1, !dbg !28
  %29 = sext i8 %28 to i32, !dbg !28
  %30 = icmp ne i32 %29, 104, !dbg !28
  br i1 %30, label %then7, label %else8, !dbg !28

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !29
  %31 = load i32, ptr %err, align 4, !dbg !29
  br label %if.end9, !dbg !29

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !29

if.end9:                                          ; preds = %else8, %then7
  %32 = getelementptr i8, ptr %ls, i32 1, !dbg !30
  %33 = load i8, ptr %32, align 1, !dbg !30
  %34 = sext i8 %33 to i32, !dbg !30
  %35 = icmp ne i32 %34, 101, !dbg !30
  br i1 %35, label %then10, label %else11, !dbg !30

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !31
  %36 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end12, !dbg !31

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !31

if.end12:                                         ; preds = %else11, %then10
  %37 = getelementptr i8, ptr %ls, i32 2, !dbg !32
  %38 = load i8, ptr %37, align 1, !dbg !32
  %39 = sext i8 %38 to i32, !dbg !32
  %40 = icmp ne i32 %39, 108, !dbg !32
  br i1 %40, label %then13, label %else14, !dbg !32

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !33
  %41 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end15, !dbg !33

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !33

if.end15:                                         ; preds = %else14, %then13
  %42 = getelementptr i8, ptr %ls, i32 3, !dbg !34
  %43 = load i8, ptr %42, align 1, !dbg !34
  %44 = sext i8 %43 to i32, !dbg !34
  %45 = icmp ne i32 %44, 108, !dbg !34
  br i1 %45, label %then16, label %else17, !dbg !34

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !35
  %46 = load i32, ptr %err, align 4, !dbg !35
  br label %if.end18, !dbg !35

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !35

if.end18:                                         ; preds = %else17, %then16
  %47 = getelementptr i8, ptr %ls, i32 4, !dbg !36
  %48 = load i8, ptr %47, align 1, !dbg !36
  %49 = sext i8 %48 to i32, !dbg !36
  %50 = icmp ne i32 %49, 111, !dbg !36
  br i1 %50, label %then19, label %else20, !dbg !36

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !37
  %51 = load i32, ptr %err, align 4, !dbg !37
  br label %if.end21, !dbg !37

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !37

if.end21:                                         ; preds = %else20, %then19
  %52 = getelementptr i8, ptr %ls, i32 5, !dbg !38
  %53 = load i8, ptr %52, align 1, !dbg !38
  %54 = sext i8 %53 to i32, !dbg !38
  %55 = icmp ne i32 %54, 0, !dbg !38
  br i1 %55, label %then22, label %else23, !dbg !38

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !39
  %56 = load i32, ptr %err, align 4, !dbg !39
  br label %if.end24, !dbg !39

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !39

if.end24:                                         ; preds = %else23, %then22
  %57 = getelementptr i8, ptr %lb, i32 0, !dbg !40
  %58 = load i8, ptr %57, align 1, !dbg !40
  %59 = sext i8 %58 to i32, !dbg !40
  %60 = icmp ne i32 %59, 104, !dbg !40
  br i1 %60, label %then25, label %else26, !dbg !40

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !41
  %61 = load i32, ptr %err, align 4, !dbg !41
  br label %if.end27, !dbg !41

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !41

if.end27:                                         ; preds = %else26, %then25
  %62 = getelementptr i8, ptr %lb, i32 5, !dbg !42
  %63 = load i8, ptr %62, align 1, !dbg !42
  %64 = sext i8 %63 to i32, !dbg !42
  %65 = icmp ne i32 %64, 0, !dbg !42
  br i1 %65, label %then28, label %else29, !dbg !42

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !43
  %66 = load i32, ptr %err, align 4, !dbg !43
  br label %if.end30, !dbg !43

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !43

if.end30:                                         ; preds = %else29, %then28
  %67 = load i32, ptr @ga, align 4, !dbg !44
  %68 = icmp ne i32 %67, 10, !dbg !44
  br i1 %68, label %then31, label %else32, !dbg !44

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !45
  %69 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end33, !dbg !45

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !45

if.end33:                                         ; preds = %else32, %then31
  %70 = load i32, ptr getelementptr (i32, ptr @ga, i32 1), align 4, !dbg !46
  %71 = icmp ne i32 %70, 7, !dbg !46
  br i1 %71, label %then34, label %else35, !dbg !46

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !47
  %72 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end36, !dbg !47

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !47

if.end36:                                         ; preds = %else35, %then34
  %73 = load i32, ptr getelementptr (i32, ptr @ga, i32 2), align 4, !dbg !48
  %74 = icmp ne i32 %73, 8, !dbg !48
  br i1 %74, label %then37, label %else38, !dbg !48

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !49
  %75 = load i32, ptr %err, align 4, !dbg !49
  br label %if.end39, !dbg !49

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !49

if.end39:                                         ; preds = %else38, %then37
  %76 = load i32, ptr getelementptr (i32, ptr @ga, i32 3), align 4, !dbg !50
  %77 = icmp ne i32 %76, 9, !dbg !50
  br i1 %77, label %then40, label %else41, !dbg !50

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !51
  %78 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end42, !dbg !51

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !51

if.end42:                                         ; preds = %else41, %then40
  %79 = load i32, ptr getelementptr (i32, ptr @ga, i32 4), align 4, !dbg !52
  %80 = icmp ne i32 %79, 1, !dbg !52
  br i1 %80, label %then43, label %else44, !dbg !52

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4, !dbg !53
  %81 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end45, !dbg !53

else44:                                           ; preds = %if.end42
  br label %if.end45, !dbg !53

if.end45:                                         ; preds = %else44, %then43
  %82 = load i32, ptr getelementptr (i32, ptr @ga, i32 5), align 4, !dbg !54
  %83 = icmp ne i32 %82, 5, !dbg !54
  br i1 %83, label %then46, label %else47, !dbg !54

then46:                                           ; preds = %if.end45
  store i32 1, ptr %err, align 4, !dbg !55
  %84 = load i32, ptr %err, align 4, !dbg !55
  br label %if.end48, !dbg !55

else47:                                           ; preds = %if.end45
  br label %if.end48, !dbg !55

if.end48:                                         ; preds = %else47, %then46
  %85 = load i8, ptr @gs, align 1, !dbg !56
  %86 = sext i8 %85 to i32, !dbg !56
  %87 = icmp ne i32 %86, 104, !dbg !56
  br i1 %87, label %then49, label %else50, !dbg !56

then49:                                           ; preds = %if.end48
  store i32 1, ptr %err, align 4, !dbg !57
  %88 = load i32, ptr %err, align 4, !dbg !57
  br label %if.end51, !dbg !57

else50:                                           ; preds = %if.end48
  br label %if.end51, !dbg !57

if.end51:                                         ; preds = %else50, %then49
  %89 = load i8, ptr getelementptr (i8, ptr @gs, i32 1), align 1, !dbg !58
  %90 = sext i8 %89 to i32, !dbg !58
  %91 = icmp ne i32 %90, 105, !dbg !58
  br i1 %91, label %then52, label %else53, !dbg !58

then52:                                           ; preds = %if.end51
  store i32 1, ptr %err, align 4, !dbg !59
  %92 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end54, !dbg !59

else53:                                           ; preds = %if.end51
  br label %if.end54, !dbg !59

if.end54:                                         ; preds = %else53, %then52
  %93 = load i8, ptr getelementptr (i8, ptr @gs, i32 2), align 1, !dbg !60
  %94 = sext i8 %93 to i32, !dbg !60
  %95 = icmp ne i32 %94, 0, !dbg !60
  br i1 %95, label %then55, label %else56, !dbg !60

then55:                                           ; preds = %if.end54
  store i32 1, ptr %err, align 4, !dbg !61
  %96 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end57, !dbg !61

else56:                                           ; preds = %if.end54
  br label %if.end57, !dbg !61

if.end57:                                         ; preds = %else56, %then55
  %97 = load i8, ptr @gt, align 1, !dbg !62
  %98 = sext i8 %97 to i32, !dbg !62
  %99 = icmp ne i32 %98, 104, !dbg !62
  br i1 %99, label %then58, label %else59, !dbg !62

then58:                                           ; preds = %if.end57
  store i32 1, ptr %err, align 4, !dbg !63
  %100 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end60, !dbg !63

else59:                                           ; preds = %if.end57
  br label %if.end60, !dbg !63

if.end60:                                         ; preds = %else59, %then58
  %101 = load i8, ptr getelementptr (i8, ptr @gt, i32 1), align 1, !dbg !64
  %102 = sext i8 %101 to i32, !dbg !64
  %103 = icmp ne i32 %102, 101, !dbg !64
  br i1 %103, label %then61, label %else62, !dbg !64

then61:                                           ; preds = %if.end60
  store i32 1, ptr %err, align 4, !dbg !65
  %104 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end63, !dbg !65

else62:                                           ; preds = %if.end60
  br label %if.end63, !dbg !65

if.end63:                                         ; preds = %else62, %then61
  %105 = load i8, ptr getelementptr (i8, ptr @gt, i32 2), align 1, !dbg !66
  %106 = sext i8 %105 to i32, !dbg !66
  %107 = icmp ne i32 %106, 121, !dbg !66
  br i1 %107, label %then64, label %else65, !dbg !66

then64:                                           ; preds = %if.end63
  store i32 1, ptr %err, align 4, !dbg !67
  %108 = load i32, ptr %err, align 4, !dbg !67
  br label %if.end66, !dbg !67

else65:                                           ; preds = %if.end63
  br label %if.end66, !dbg !67

if.end66:                                         ; preds = %else65, %then64
  %109 = load i8, ptr getelementptr (i8, ptr @gt, i32 3), align 1, !dbg !68
  %110 = sext i8 %109 to i32, !dbg !68
  %111 = icmp ne i32 %110, 0, !dbg !68
  br i1 %111, label %then67, label %else68, !dbg !68

then67:                                           ; preds = %if.end66
  store i32 1, ptr %err, align 4, !dbg !69
  %112 = load i32, ptr %err, align 4, !dbg !69
  br label %if.end69, !dbg !69

else68:                                           ; preds = %if.end66
  br label %if.end69, !dbg !69

if.end69:                                         ; preds = %else68, %then67
  %113 = load i32, ptr %err, align 4, !dbg !70
  %114 = icmp eq i32 %113, 0, !dbg !70
  br i1 %114, label %then70, label %else71, !dbg !70

then70:                                           ; preds = %if.end69
  %115 = call i32 (ptr, ...) @printf(ptr @0), !dbg !71
  br label %if.end72, !dbg !71

else71:                                           ; preds = %if.end69
  %116 = call i32 (ptr, ...) @printf(ptr @1), !dbg !73
  br label %if.end72, !dbg !73

if.end72:                                         ; preds = %else71, %then70
  %117 = load i32, ptr %err, align 4, !dbg !75
  ret i32 %117, !dbg !75
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "32.array_1d_inferred_string_init.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 7, type: !3, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "lb", scope: !2, file: !1, line: 11, type: !8)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 48, align: 8, elements: !10)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !{!11}
!11 = !DISubrange(count: 6, lowerBound: 0)
!12 = !DILocation(line: 11, column: 3, scope: !2)
!13 = !DILocalVariable(name: "ls", scope: !2, file: !1, line: 10, type: !8)
!14 = !DILocation(line: 10, column: 3, scope: !2)
!15 = !DILocalVariable(name: "la", scope: !2, file: !1, line: 9, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 96, align: 32, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 3, lowerBound: 0)
!19 = !DILocation(line: 9, column: 3, scope: !2)
!20 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 8, type: !5)
!21 = !DILocation(line: 8, column: 3, scope: !2)
!22 = !DILocation(line: 13, column: 3, scope: !2)
!23 = !DILocation(line: 13, column: 19, scope: !2)
!24 = !DILocation(line: 14, column: 3, scope: !2)
!25 = !DILocation(line: 14, column: 19, scope: !2)
!26 = !DILocation(line: 15, column: 3, scope: !2)
!27 = !DILocation(line: 15, column: 19, scope: !2)
!28 = !DILocation(line: 17, column: 3, scope: !2)
!29 = !DILocation(line: 17, column: 21, scope: !2)
!30 = !DILocation(line: 18, column: 3, scope: !2)
!31 = !DILocation(line: 18, column: 21, scope: !2)
!32 = !DILocation(line: 19, column: 3, scope: !2)
!33 = !DILocation(line: 19, column: 21, scope: !2)
!34 = !DILocation(line: 20, column: 3, scope: !2)
!35 = !DILocation(line: 20, column: 21, scope: !2)
!36 = !DILocation(line: 21, column: 3, scope: !2)
!37 = !DILocation(line: 21, column: 21, scope: !2)
!38 = !DILocation(line: 22, column: 3, scope: !2)
!39 = !DILocation(line: 22, column: 19, scope: !2)
!40 = !DILocation(line: 24, column: 3, scope: !2)
!41 = !DILocation(line: 24, column: 21, scope: !2)
!42 = !DILocation(line: 25, column: 3, scope: !2)
!43 = !DILocation(line: 25, column: 19, scope: !2)
!44 = !DILocation(line: 27, column: 3, scope: !2)
!45 = !DILocation(line: 27, column: 20, scope: !2)
!46 = !DILocation(line: 28, column: 3, scope: !2)
!47 = !DILocation(line: 28, column: 19, scope: !2)
!48 = !DILocation(line: 29, column: 3, scope: !2)
!49 = !DILocation(line: 29, column: 19, scope: !2)
!50 = !DILocation(line: 30, column: 3, scope: !2)
!51 = !DILocation(line: 30, column: 19, scope: !2)
!52 = !DILocation(line: 31, column: 3, scope: !2)
!53 = !DILocation(line: 31, column: 19, scope: !2)
!54 = !DILocation(line: 32, column: 3, scope: !2)
!55 = !DILocation(line: 32, column: 19, scope: !2)
!56 = !DILocation(line: 34, column: 3, scope: !2)
!57 = !DILocation(line: 34, column: 21, scope: !2)
!58 = !DILocation(line: 35, column: 3, scope: !2)
!59 = !DILocation(line: 35, column: 21, scope: !2)
!60 = !DILocation(line: 36, column: 3, scope: !2)
!61 = !DILocation(line: 36, column: 19, scope: !2)
!62 = !DILocation(line: 38, column: 3, scope: !2)
!63 = !DILocation(line: 38, column: 21, scope: !2)
!64 = !DILocation(line: 39, column: 3, scope: !2)
!65 = !DILocation(line: 39, column: 21, scope: !2)
!66 = !DILocation(line: 40, column: 3, scope: !2)
!67 = !DILocation(line: 40, column: 21, scope: !2)
!68 = !DILocation(line: 41, column: 3, scope: !2)
!69 = !DILocation(line: 41, column: 19, scope: !2)
!70 = !DILocation(line: 43, column: 3, scope: !2)
!71 = !DILocation(line: 44, column: 5, scope: !72)
!72 = distinct !DILexicalBlock(scope: !2, file: !1, line: 43, column: 17)
!73 = !DILocation(line: 46, column: 5, scope: !74)
!74 = distinct !DILexicalBlock(scope: !2, file: !1, line: 45, column: 10)
!75 = !DILocation(line: 48, column: 3, scope: !2)
