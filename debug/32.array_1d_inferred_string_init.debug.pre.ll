; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@ga = global [6 x i32] [i32 10, i32 7, i32 8, i32 9, i32 1, i32 5]
@gs = global [3 x i8] c"hi\00"
@gt = global [4 x i8] c"hey\00"
@0 = private unnamed_addr constant [41 x i8] c"32.array_1d_inferred_string_init.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [41 x i8] c"32.array_1d_inferred_string_init.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %lb = alloca [6 x i8], align 1
    #dbg_declare(ptr %lb, !8, !DIExpression(), !13)
  %ls = alloca [6 x i8], align 1
    #dbg_declare(ptr %ls, !14, !DIExpression(), !15)
  %la = alloca [3 x i32], align 4
    #dbg_declare(ptr %la, !16, !DIExpression(), !20)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !21, !DIExpression(), !22)
  store i32 0, ptr %err, align 4, !dbg !22
  %0 = getelementptr [3 x i32], ptr %la, i32 0, i32 0, !dbg !20
  store i32 1, ptr %0, align 4, !dbg !20
  %1 = getelementptr [3 x i32], ptr %la, i32 0, i32 1, !dbg !20
  store i32 2, ptr %1, align 4, !dbg !20
  %2 = getelementptr [3 x i32], ptr %la, i32 0, i32 2, !dbg !20
  store i32 3, ptr %2, align 4, !dbg !20
  %3 = getelementptr [6 x i8], ptr %ls, i32 0, i32 0, !dbg !15
  store i8 104, ptr %3, align 1, !dbg !15
  %4 = getelementptr [6 x i8], ptr %ls, i32 0, i32 1, !dbg !15
  store i8 101, ptr %4, align 1, !dbg !15
  %5 = getelementptr [6 x i8], ptr %ls, i32 0, i32 2, !dbg !15
  store i8 108, ptr %5, align 1, !dbg !15
  %6 = getelementptr [6 x i8], ptr %ls, i32 0, i32 3, !dbg !15
  store i8 108, ptr %6, align 1, !dbg !15
  %7 = getelementptr [6 x i8], ptr %ls, i32 0, i32 4, !dbg !15
  store i8 111, ptr %7, align 1, !dbg !15
  %8 = getelementptr [6 x i8], ptr %ls, i32 0, i32 5, !dbg !15
  store i8 0, ptr %8, align 1, !dbg !15
  %9 = getelementptr [6 x i8], ptr %lb, i32 0, i32 0, !dbg !13
  store i8 104, ptr %9, align 1, !dbg !13
  %10 = getelementptr [6 x i8], ptr %lb, i32 0, i32 1, !dbg !13
  store i8 101, ptr %10, align 1, !dbg !13
  %11 = getelementptr [6 x i8], ptr %lb, i32 0, i32 2, !dbg !13
  store i8 108, ptr %11, align 1, !dbg !13
  %12 = getelementptr [6 x i8], ptr %lb, i32 0, i32 3, !dbg !13
  store i8 108, ptr %12, align 1, !dbg !13
  %13 = getelementptr [6 x i8], ptr %lb, i32 0, i32 4, !dbg !13
  store i8 111, ptr %13, align 1, !dbg !13
  %14 = getelementptr [6 x i8], ptr %lb, i32 0, i32 5, !dbg !13
  store i8 0, ptr %14, align 1, !dbg !13
  %15 = getelementptr i32, ptr %la, i32 0, !dbg !23
  %16 = load i32, ptr %15, align 4, !dbg !23
  %17 = icmp ne i32 %16, 1, !dbg !23
  br i1 %17, label %then, label %else, !dbg !23

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !24
  %18 = load i32, ptr %err, align 4, !dbg !24
  br label %if.end, !dbg !24

else:                                             ; preds = %entry
  br label %if.end, !dbg !24

if.end:                                           ; preds = %else, %then
  %19 = getelementptr i32, ptr %la, i32 1, !dbg !25
  %20 = load i32, ptr %19, align 4, !dbg !25
  %21 = icmp ne i32 %20, 2, !dbg !25
  br i1 %21, label %then1, label %else2, !dbg !25

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !26
  %22 = load i32, ptr %err, align 4, !dbg !26
  br label %if.end3, !dbg !26

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !26

if.end3:                                          ; preds = %else2, %then1
  %23 = getelementptr i32, ptr %la, i32 2, !dbg !27
  %24 = load i32, ptr %23, align 4, !dbg !27
  %25 = icmp ne i32 %24, 3, !dbg !27
  br i1 %25, label %then4, label %else5, !dbg !27

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !28
  %26 = load i32, ptr %err, align 4, !dbg !28
  br label %if.end6, !dbg !28

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !28

if.end6:                                          ; preds = %else5, %then4
  %27 = getelementptr i8, ptr %ls, i32 0, !dbg !29
  %28 = load i8, ptr %27, align 1, !dbg !29
  %29 = sext i8 %28 to i32, !dbg !29
  %30 = icmp ne i32 %29, 104, !dbg !29
  br i1 %30, label %then7, label %else8, !dbg !29

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !30
  %31 = load i32, ptr %err, align 4, !dbg !30
  br label %if.end9, !dbg !30

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !30

if.end9:                                          ; preds = %else8, %then7
  %32 = getelementptr i8, ptr %ls, i32 1, !dbg !31
  %33 = load i8, ptr %32, align 1, !dbg !31
  %34 = sext i8 %33 to i32, !dbg !31
  %35 = icmp ne i32 %34, 101, !dbg !31
  br i1 %35, label %then10, label %else11, !dbg !31

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !32
  %36 = load i32, ptr %err, align 4, !dbg !32
  br label %if.end12, !dbg !32

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !32

if.end12:                                         ; preds = %else11, %then10
  %37 = getelementptr i8, ptr %ls, i32 2, !dbg !33
  %38 = load i8, ptr %37, align 1, !dbg !33
  %39 = sext i8 %38 to i32, !dbg !33
  %40 = icmp ne i32 %39, 108, !dbg !33
  br i1 %40, label %then13, label %else14, !dbg !33

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !34
  %41 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end15, !dbg !34

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !34

if.end15:                                         ; preds = %else14, %then13
  %42 = getelementptr i8, ptr %ls, i32 3, !dbg !35
  %43 = load i8, ptr %42, align 1, !dbg !35
  %44 = sext i8 %43 to i32, !dbg !35
  %45 = icmp ne i32 %44, 108, !dbg !35
  br i1 %45, label %then16, label %else17, !dbg !35

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !36
  %46 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end18, !dbg !36

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !36

if.end18:                                         ; preds = %else17, %then16
  %47 = getelementptr i8, ptr %ls, i32 4, !dbg !37
  %48 = load i8, ptr %47, align 1, !dbg !37
  %49 = sext i8 %48 to i32, !dbg !37
  %50 = icmp ne i32 %49, 111, !dbg !37
  br i1 %50, label %then19, label %else20, !dbg !37

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !38
  %51 = load i32, ptr %err, align 4, !dbg !38
  br label %if.end21, !dbg !38

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !38

if.end21:                                         ; preds = %else20, %then19
  %52 = getelementptr i8, ptr %ls, i32 5, !dbg !39
  %53 = load i8, ptr %52, align 1, !dbg !39
  %54 = sext i8 %53 to i32, !dbg !39
  %55 = icmp ne i32 %54, 0, !dbg !39
  br i1 %55, label %then22, label %else23, !dbg !39

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !40
  %56 = load i32, ptr %err, align 4, !dbg !40
  br label %if.end24, !dbg !40

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !40

if.end24:                                         ; preds = %else23, %then22
  %57 = getelementptr i8, ptr %lb, i32 0, !dbg !41
  %58 = load i8, ptr %57, align 1, !dbg !41
  %59 = sext i8 %58 to i32, !dbg !41
  %60 = icmp ne i32 %59, 104, !dbg !41
  br i1 %60, label %then25, label %else26, !dbg !41

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !42
  %61 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end27, !dbg !42

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !42

if.end27:                                         ; preds = %else26, %then25
  %62 = getelementptr i8, ptr %lb, i32 5, !dbg !43
  %63 = load i8, ptr %62, align 1, !dbg !43
  %64 = sext i8 %63 to i32, !dbg !43
  %65 = icmp ne i32 %64, 0, !dbg !43
  br i1 %65, label %then28, label %else29, !dbg !43

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !44
  %66 = load i32, ptr %err, align 4, !dbg !44
  br label %if.end30, !dbg !44

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !44

if.end30:                                         ; preds = %else29, %then28
  %67 = load i32, ptr @ga, align 4, !dbg !45
  %68 = icmp ne i32 %67, 10, !dbg !45
  br i1 %68, label %then31, label %else32, !dbg !45

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !46
  %69 = load i32, ptr %err, align 4, !dbg !46
  br label %if.end33, !dbg !46

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !46

if.end33:                                         ; preds = %else32, %then31
  %70 = load i32, ptr getelementptr (i32, ptr @ga, i32 1), align 4, !dbg !47
  %71 = icmp ne i32 %70, 7, !dbg !47
  br i1 %71, label %then34, label %else35, !dbg !47

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !48
  %72 = load i32, ptr %err, align 4, !dbg !48
  br label %if.end36, !dbg !48

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !48

if.end36:                                         ; preds = %else35, %then34
  %73 = load i32, ptr getelementptr (i32, ptr @ga, i32 2), align 4, !dbg !49
  %74 = icmp ne i32 %73, 8, !dbg !49
  br i1 %74, label %then37, label %else38, !dbg !49

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !50
  %75 = load i32, ptr %err, align 4, !dbg !50
  br label %if.end39, !dbg !50

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !50

if.end39:                                         ; preds = %else38, %then37
  %76 = load i32, ptr getelementptr (i32, ptr @ga, i32 3), align 4, !dbg !51
  %77 = icmp ne i32 %76, 9, !dbg !51
  br i1 %77, label %then40, label %else41, !dbg !51

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !52
  %78 = load i32, ptr %err, align 4, !dbg !52
  br label %if.end42, !dbg !52

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !52

if.end42:                                         ; preds = %else41, %then40
  %79 = load i32, ptr getelementptr (i32, ptr @ga, i32 4), align 4, !dbg !53
  %80 = icmp ne i32 %79, 1, !dbg !53
  br i1 %80, label %then43, label %else44, !dbg !53

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4, !dbg !54
  %81 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end45, !dbg !54

else44:                                           ; preds = %if.end42
  br label %if.end45, !dbg !54

if.end45:                                         ; preds = %else44, %then43
  %82 = load i32, ptr getelementptr (i32, ptr @ga, i32 5), align 4, !dbg !55
  %83 = icmp ne i32 %82, 5, !dbg !55
  br i1 %83, label %then46, label %else47, !dbg !55

then46:                                           ; preds = %if.end45
  store i32 1, ptr %err, align 4, !dbg !56
  %84 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end48, !dbg !56

else47:                                           ; preds = %if.end45
  br label %if.end48, !dbg !56

if.end48:                                         ; preds = %else47, %then46
  %85 = load i8, ptr @gs, align 1, !dbg !57
  %86 = sext i8 %85 to i32, !dbg !57
  %87 = icmp ne i32 %86, 104, !dbg !57
  br i1 %87, label %then49, label %else50, !dbg !57

then49:                                           ; preds = %if.end48
  store i32 1, ptr %err, align 4, !dbg !58
  %88 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end51, !dbg !58

else50:                                           ; preds = %if.end48
  br label %if.end51, !dbg !58

if.end51:                                         ; preds = %else50, %then49
  %89 = load i8, ptr getelementptr (i8, ptr @gs, i32 1), align 1, !dbg !59
  %90 = sext i8 %89 to i32, !dbg !59
  %91 = icmp ne i32 %90, 105, !dbg !59
  br i1 %91, label %then52, label %else53, !dbg !59

then52:                                           ; preds = %if.end51
  store i32 1, ptr %err, align 4, !dbg !60
  %92 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end54, !dbg !60

else53:                                           ; preds = %if.end51
  br label %if.end54, !dbg !60

if.end54:                                         ; preds = %else53, %then52
  %93 = load i8, ptr getelementptr (i8, ptr @gs, i32 2), align 1, !dbg !61
  %94 = sext i8 %93 to i32, !dbg !61
  %95 = icmp ne i32 %94, 0, !dbg !61
  br i1 %95, label %then55, label %else56, !dbg !61

then55:                                           ; preds = %if.end54
  store i32 1, ptr %err, align 4, !dbg !62
  %96 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end57, !dbg !62

else56:                                           ; preds = %if.end54
  br label %if.end57, !dbg !62

if.end57:                                         ; preds = %else56, %then55
  %97 = load i8, ptr @gt, align 1, !dbg !63
  %98 = sext i8 %97 to i32, !dbg !63
  %99 = icmp ne i32 %98, 104, !dbg !63
  br i1 %99, label %then58, label %else59, !dbg !63

then58:                                           ; preds = %if.end57
  store i32 1, ptr %err, align 4, !dbg !64
  %100 = load i32, ptr %err, align 4, !dbg !64
  br label %if.end60, !dbg !64

else59:                                           ; preds = %if.end57
  br label %if.end60, !dbg !64

if.end60:                                         ; preds = %else59, %then58
  %101 = load i8, ptr getelementptr (i8, ptr @gt, i32 1), align 1, !dbg !65
  %102 = sext i8 %101 to i32, !dbg !65
  %103 = icmp ne i32 %102, 101, !dbg !65
  br i1 %103, label %then61, label %else62, !dbg !65

then61:                                           ; preds = %if.end60
  store i32 1, ptr %err, align 4, !dbg !66
  %104 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end63, !dbg !66

else62:                                           ; preds = %if.end60
  br label %if.end63, !dbg !66

if.end63:                                         ; preds = %else62, %then61
  %105 = load i8, ptr getelementptr (i8, ptr @gt, i32 2), align 1, !dbg !67
  %106 = sext i8 %105 to i32, !dbg !67
  %107 = icmp ne i32 %106, 121, !dbg !67
  br i1 %107, label %then64, label %else65, !dbg !67

then64:                                           ; preds = %if.end63
  store i32 1, ptr %err, align 4, !dbg !68
  %108 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end66, !dbg !68

else65:                                           ; preds = %if.end63
  br label %if.end66, !dbg !68

if.end66:                                         ; preds = %else65, %then64
  %109 = load i8, ptr getelementptr (i8, ptr @gt, i32 3), align 1, !dbg !69
  %110 = sext i8 %109 to i32, !dbg !69
  %111 = icmp ne i32 %110, 0, !dbg !69
  br i1 %111, label %then67, label %else68, !dbg !69

then67:                                           ; preds = %if.end66
  store i32 1, ptr %err, align 4, !dbg !70
  %112 = load i32, ptr %err, align 4, !dbg !70
  br label %if.end69, !dbg !70

else68:                                           ; preds = %if.end66
  br label %if.end69, !dbg !70

if.end69:                                         ; preds = %else68, %then67
  %113 = load i32, ptr %err, align 4, !dbg !71
  %114 = icmp eq i32 %113, 0, !dbg !71
  br i1 %114, label %then70, label %else71, !dbg !71

then70:                                           ; preds = %if.end69
  %115 = call i32 (ptr, ...) @printf(ptr @0), !dbg !72
  br label %if.end72, !dbg !72

else71:                                           ; preds = %if.end69
  %116 = call i32 (ptr, ...) @printf(ptr @1), !dbg !74
  br label %if.end72, !dbg !74

if.end72:                                         ; preds = %else71, %then70
  %117 = load i32, ptr %err, align 4, !dbg !76
  ret i32 %117, !dbg !76
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "32.array_1d_inferred_string_init.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 10, type: !5, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "lb", scope: !4, file: !3, line: 14, type: !9)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 48, align: 8, elements: !11)
!10 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!11 = !{!12}
!12 = !DISubrange(count: 6, lowerBound: 0)
!13 = !DILocation(line: 14, column: 3, scope: !4)
!14 = !DILocalVariable(name: "ls", scope: !4, file: !3, line: 13, type: !9)
!15 = !DILocation(line: 13, column: 3, scope: !4)
!16 = !DILocalVariable(name: "la", scope: !4, file: !3, line: 12, type: !17)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 96, align: 32, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 3, lowerBound: 0)
!20 = !DILocation(line: 12, column: 3, scope: !4)
!21 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 11, type: !7)
!22 = !DILocation(line: 11, column: 3, scope: !4)
!23 = !DILocation(line: 16, column: 3, scope: !4)
!24 = !DILocation(line: 16, column: 19, scope: !4)
!25 = !DILocation(line: 17, column: 3, scope: !4)
!26 = !DILocation(line: 17, column: 19, scope: !4)
!27 = !DILocation(line: 18, column: 3, scope: !4)
!28 = !DILocation(line: 18, column: 19, scope: !4)
!29 = !DILocation(line: 20, column: 3, scope: !4)
!30 = !DILocation(line: 20, column: 21, scope: !4)
!31 = !DILocation(line: 21, column: 3, scope: !4)
!32 = !DILocation(line: 21, column: 21, scope: !4)
!33 = !DILocation(line: 22, column: 3, scope: !4)
!34 = !DILocation(line: 22, column: 21, scope: !4)
!35 = !DILocation(line: 23, column: 3, scope: !4)
!36 = !DILocation(line: 23, column: 21, scope: !4)
!37 = !DILocation(line: 24, column: 3, scope: !4)
!38 = !DILocation(line: 24, column: 21, scope: !4)
!39 = !DILocation(line: 25, column: 3, scope: !4)
!40 = !DILocation(line: 25, column: 19, scope: !4)
!41 = !DILocation(line: 27, column: 3, scope: !4)
!42 = !DILocation(line: 27, column: 21, scope: !4)
!43 = !DILocation(line: 28, column: 3, scope: !4)
!44 = !DILocation(line: 28, column: 19, scope: !4)
!45 = !DILocation(line: 30, column: 3, scope: !4)
!46 = !DILocation(line: 30, column: 20, scope: !4)
!47 = !DILocation(line: 31, column: 3, scope: !4)
!48 = !DILocation(line: 31, column: 19, scope: !4)
!49 = !DILocation(line: 32, column: 3, scope: !4)
!50 = !DILocation(line: 32, column: 19, scope: !4)
!51 = !DILocation(line: 33, column: 3, scope: !4)
!52 = !DILocation(line: 33, column: 19, scope: !4)
!53 = !DILocation(line: 34, column: 3, scope: !4)
!54 = !DILocation(line: 34, column: 19, scope: !4)
!55 = !DILocation(line: 35, column: 3, scope: !4)
!56 = !DILocation(line: 35, column: 19, scope: !4)
!57 = !DILocation(line: 37, column: 3, scope: !4)
!58 = !DILocation(line: 37, column: 21, scope: !4)
!59 = !DILocation(line: 38, column: 3, scope: !4)
!60 = !DILocation(line: 38, column: 21, scope: !4)
!61 = !DILocation(line: 39, column: 3, scope: !4)
!62 = !DILocation(line: 39, column: 19, scope: !4)
!63 = !DILocation(line: 41, column: 3, scope: !4)
!64 = !DILocation(line: 41, column: 21, scope: !4)
!65 = !DILocation(line: 42, column: 3, scope: !4)
!66 = !DILocation(line: 42, column: 21, scope: !4)
!67 = !DILocation(line: 43, column: 3, scope: !4)
!68 = !DILocation(line: 43, column: 21, scope: !4)
!69 = !DILocation(line: 44, column: 3, scope: !4)
!70 = !DILocation(line: 44, column: 19, scope: !4)
!71 = !DILocation(line: 46, column: 3, scope: !4)
!72 = !DILocation(line: 47, column: 5, scope: !73)
!73 = distinct !DILexicalBlock(scope: !4, file: !3, line: 46, column: 17)
!74 = !DILocation(line: 49, column: 5, scope: !75)
!75 = distinct !DILexicalBlock(scope: !4, file: !3, line: 48, column: 10)
!76 = !DILocation(line: 51, column: 3, scope: !4)
