; ModuleID = 'lcc'
source_filename = "lcc"

%struct.Cell = type { i32, i32 }

@gm = global [3 x [4 x i32]] undef
@0 = private unnamed_addr constant [25 x i8] c"33.array_2d_decl.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [25 x i8] c"33.array_2d_decl.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %v = alloca i32, align 4
    #dbg_declare(ptr %v, !6, !DIExpression(), !7)
  %grid = alloca [2 x [2 x %struct.Cell]], align 8
    #dbg_declare(ptr %grid, !8, !DIExpression(), !14)
  %scalar = alloca i32, align 4
    #dbg_declare(ptr %scalar, !15, !DIExpression(), !16)
  %m = alloca [2 x [3 x i32]], align 4
    #dbg_declare(ptr %m, !17, !DIExpression(), !16)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !22, !DIExpression(), !23)
  store i32 0, ptr %err, align 4, !dbg !23
  %0 = getelementptr [3 x i32], ptr %m, i32 0, !dbg !24
  %1 = getelementptr i32, ptr %0, i32 0, !dbg !24
  store i32 1, ptr %1, align 4, !dbg !24
  %2 = load i32, ptr %1, align 4, !dbg !24
  %3 = getelementptr [3 x i32], ptr %m, i32 0, !dbg !25
  %4 = getelementptr i32, ptr %3, i32 1, !dbg !25
  store i32 2, ptr %4, align 4, !dbg !25
  %5 = load i32, ptr %4, align 4, !dbg !25
  %6 = getelementptr [3 x i32], ptr %m, i32 0, !dbg !26
  %7 = getelementptr i32, ptr %6, i32 2, !dbg !26
  store i32 3, ptr %7, align 4, !dbg !26
  %8 = load i32, ptr %7, align 4, !dbg !26
  %9 = getelementptr [3 x i32], ptr %m, i32 1, !dbg !27
  %10 = getelementptr i32, ptr %9, i32 0, !dbg !27
  store i32 4, ptr %10, align 4, !dbg !27
  %11 = load i32, ptr %10, align 4, !dbg !27
  %12 = getelementptr [3 x i32], ptr %m, i32 1, !dbg !28
  %13 = getelementptr i32, ptr %12, i32 1, !dbg !28
  store i32 5, ptr %13, align 4, !dbg !28
  %14 = load i32, ptr %13, align 4, !dbg !28
  %15 = getelementptr [3 x i32], ptr %m, i32 1, !dbg !29
  %16 = getelementptr i32, ptr %15, i32 2, !dbg !29
  store i32 6, ptr %16, align 4, !dbg !29
  %17 = load i32, ptr %16, align 4, !dbg !29
  store i32 99, ptr %scalar, align 4, !dbg !30
  %18 = load i32, ptr %scalar, align 4, !dbg !30
  store i32 10, ptr @gm, align 4, !dbg !31
  %19 = load i32, ptr @gm, align 4, !dbg !31
  store i32 20, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 1), i32 2), align 4, !dbg !32
  %20 = load i32, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 1), i32 2), align 4, !dbg !32
  store i32 30, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 2), i32 3), align 4, !dbg !33
  %21 = load i32, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 2), i32 3), align 4, !dbg !33
  %22 = getelementptr [2 x %struct.Cell], ptr %grid, i32 0, !dbg !34
  %23 = getelementptr %struct.Cell, ptr %22, i32 1, !dbg !34
  %24 = getelementptr %struct.Cell, ptr %23, i32 0, i32 0, !dbg !34
  store i32 7, ptr %24, align 4, !dbg !34
  %25 = load i32, ptr %24, align 4, !dbg !34
  %26 = getelementptr [2 x %struct.Cell], ptr %grid, i32 0, !dbg !35
  %27 = getelementptr %struct.Cell, ptr %26, i32 1, !dbg !35
  %28 = getelementptr %struct.Cell, ptr %27, i32 0, i32 1, !dbg !35
  store i32 70, ptr %28, align 4, !dbg !35
  %29 = load i32, ptr %28, align 4, !dbg !35
  %30 = getelementptr [2 x %struct.Cell], ptr %grid, i32 1, !dbg !36
  %31 = getelementptr %struct.Cell, ptr %30, i32 0, !dbg !36
  %32 = getelementptr %struct.Cell, ptr %31, i32 0, i32 0, !dbg !36
  store i32 8, ptr %32, align 4, !dbg !36
  %33 = load i32, ptr %32, align 4, !dbg !36
  %34 = getelementptr [3 x i32], ptr %m, i32 0, !dbg !37
  %35 = getelementptr i32, ptr %34, i32 0, !dbg !37
  %36 = load i32, ptr %35, align 4, !dbg !37
  store i32 %36, ptr %v, align 4, !dbg !37
  %37 = load i32, ptr %v, align 4, !dbg !37
  %38 = load i32, ptr %v, align 4, !dbg !38
  %39 = icmp ne i32 %38, 1, !dbg !38
  br i1 %39, label %then, label %else, !dbg !38

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !39
  %40 = load i32, ptr %err, align 4, !dbg !39
  br label %if.end, !dbg !39

else:                                             ; preds = %entry
  br label %if.end, !dbg !39

if.end:                                           ; preds = %else, %then
  %41 = getelementptr [3 x i32], ptr %m, i32 0, !dbg !40
  %42 = getelementptr i32, ptr %41, i32 2, !dbg !40
  %43 = load i32, ptr %42, align 4, !dbg !40
  store i32 %43, ptr %v, align 4, !dbg !40
  %44 = load i32, ptr %v, align 4, !dbg !40
  %45 = load i32, ptr %v, align 4, !dbg !41
  %46 = icmp ne i32 %45, 3, !dbg !41
  br i1 %46, label %then1, label %else2, !dbg !41

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !42
  %47 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end3, !dbg !42

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !42

if.end3:                                          ; preds = %else2, %then1
  %48 = getelementptr [3 x i32], ptr %m, i32 1, !dbg !43
  %49 = getelementptr i32, ptr %48, i32 1, !dbg !43
  %50 = load i32, ptr %49, align 4, !dbg !43
  store i32 %50, ptr %v, align 4, !dbg !43
  %51 = load i32, ptr %v, align 4, !dbg !43
  %52 = load i32, ptr %v, align 4, !dbg !44
  %53 = icmp ne i32 %52, 5, !dbg !44
  br i1 %53, label %then4, label %else5, !dbg !44

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !45
  %54 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end6, !dbg !45

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !45

if.end6:                                          ; preds = %else5, %then4
  %55 = getelementptr [3 x i32], ptr %m, i32 1, !dbg !46
  %56 = getelementptr i32, ptr %55, i32 2, !dbg !46
  %57 = load i32, ptr %56, align 4, !dbg !46
  store i32 %57, ptr %v, align 4, !dbg !46
  %58 = load i32, ptr %v, align 4, !dbg !46
  %59 = load i32, ptr %v, align 4, !dbg !47
  %60 = icmp ne i32 %59, 6, !dbg !47
  br i1 %60, label %then7, label %else8, !dbg !47

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !48
  %61 = load i32, ptr %err, align 4, !dbg !48
  br label %if.end9, !dbg !48

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !48

if.end9:                                          ; preds = %else8, %then7
  %62 = load i32, ptr %scalar, align 4, !dbg !49
  %63 = icmp ne i32 %62, 99, !dbg !49
  br i1 %63, label %then10, label %else11, !dbg !49

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !50
  %64 = load i32, ptr %err, align 4, !dbg !50
  br label %if.end12, !dbg !50

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !50

if.end12:                                         ; preds = %else11, %then10
  %65 = load i32, ptr @gm, align 4, !dbg !51
  store i32 %65, ptr %v, align 4, !dbg !51
  %66 = load i32, ptr %v, align 4, !dbg !51
  %67 = load i32, ptr %v, align 4, !dbg !52
  %68 = icmp ne i32 %67, 10, !dbg !52
  br i1 %68, label %then13, label %else14, !dbg !52

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !53
  %69 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end15, !dbg !53

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !53

if.end15:                                         ; preds = %else14, %then13
  %70 = load i32, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 1), i32 2), align 4, !dbg !54
  store i32 %70, ptr %v, align 4, !dbg !54
  %71 = load i32, ptr %v, align 4, !dbg !54
  %72 = load i32, ptr %v, align 4, !dbg !55
  %73 = icmp ne i32 %72, 20, !dbg !55
  br i1 %73, label %then16, label %else17, !dbg !55

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !56
  %74 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end18, !dbg !56

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !56

if.end18:                                         ; preds = %else17, %then16
  %75 = load i32, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 2), i32 3), align 4, !dbg !57
  store i32 %75, ptr %v, align 4, !dbg !57
  %76 = load i32, ptr %v, align 4, !dbg !57
  %77 = load i32, ptr %v, align 4, !dbg !58
  %78 = icmp ne i32 %77, 30, !dbg !58
  br i1 %78, label %then19, label %else20, !dbg !58

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !59
  %79 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end21, !dbg !59

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !59

if.end21:                                         ; preds = %else20, %then19
  %80 = load i32, ptr getelementptr (i32, ptr @gm, i32 1), align 4, !dbg !60
  store i32 %80, ptr %v, align 4, !dbg !60
  %81 = load i32, ptr %v, align 4, !dbg !60
  %82 = load i32, ptr %v, align 4, !dbg !61
  %83 = icmp ne i32 %82, 0, !dbg !61
  br i1 %83, label %then22, label %else23, !dbg !61

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !62
  %84 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end24, !dbg !62

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !62

if.end24:                                         ; preds = %else23, %then22
  %85 = getelementptr [2 x %struct.Cell], ptr %grid, i32 0, !dbg !63
  %86 = getelementptr %struct.Cell, ptr %85, i32 1, !dbg !63
  %87 = getelementptr %struct.Cell, ptr %86, i32 0, i32 0, !dbg !63
  %88 = load i32, ptr %87, align 4, !dbg !63
  store i32 %88, ptr %v, align 4, !dbg !63
  %89 = load i32, ptr %v, align 4, !dbg !63
  %90 = load i32, ptr %v, align 4, !dbg !64
  %91 = icmp ne i32 %90, 7, !dbg !64
  br i1 %91, label %then25, label %else26, !dbg !64

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !65
  %92 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end27, !dbg !65

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !65

if.end27:                                         ; preds = %else26, %then25
  %93 = getelementptr [2 x %struct.Cell], ptr %grid, i32 0, !dbg !66
  %94 = getelementptr %struct.Cell, ptr %93, i32 1, !dbg !66
  %95 = getelementptr %struct.Cell, ptr %94, i32 0, i32 1, !dbg !66
  %96 = load i32, ptr %95, align 4, !dbg !66
  store i32 %96, ptr %v, align 4, !dbg !66
  %97 = load i32, ptr %v, align 4, !dbg !66
  %98 = load i32, ptr %v, align 4, !dbg !67
  %99 = icmp ne i32 %98, 70, !dbg !67
  br i1 %99, label %then28, label %else29, !dbg !67

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !68
  %100 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end30, !dbg !68

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !68

if.end30:                                         ; preds = %else29, %then28
  %101 = getelementptr [2 x %struct.Cell], ptr %grid, i32 1, !dbg !69
  %102 = getelementptr %struct.Cell, ptr %101, i32 0, !dbg !69
  %103 = getelementptr %struct.Cell, ptr %102, i32 0, i32 0, !dbg !69
  %104 = load i32, ptr %103, align 4, !dbg !69
  store i32 %104, ptr %v, align 4, !dbg !69
  %105 = load i32, ptr %v, align 4, !dbg !69
  %106 = load i32, ptr %v, align 4, !dbg !70
  %107 = icmp ne i32 %106, 8, !dbg !70
  br i1 %107, label %then31, label %else32, !dbg !70

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !71
  %108 = load i32, ptr %err, align 4, !dbg !71
  br label %if.end33, !dbg !71

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !71

if.end33:                                         ; preds = %else32, %then31
  %109 = load i32, ptr %err, align 4, !dbg !72
  %110 = icmp eq i32 %109, 0, !dbg !72
  br i1 %110, label %then34, label %else35, !dbg !72

then34:                                           ; preds = %if.end33
  %111 = call i32 (ptr, ...) @printf(ptr @0), !dbg !73
  br label %if.end36, !dbg !73

else35:                                           ; preds = %if.end33
  %112 = call i32 (ptr, ...) @printf(ptr @1), !dbg !75
  br label %if.end36, !dbg !75

if.end36:                                         ; preds = %else35, %then34
  %113 = load i32, ptr %err, align 4, !dbg !77
  ret i32 %113, !dbg !77
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "33.array_2d_decl.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 10, type: !3, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "v", scope: !2, file: !1, line: 14, type: !5)
!7 = !DILocation(line: 14, column: 3, scope: !2)
!8 = !DILocalVariable(name: "grid", scope: !2, file: !1, line: 13, type: !9)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 256, align: 32, elements: !12)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 128, align: 32, elements: !12)
!11 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!12 = !{!13}
!13 = !DISubrange(count: 2, lowerBound: 0)
!14 = !DILocation(line: 13, column: 3, scope: !2)
!15 = !DILocalVariable(name: "scalar", scope: !2, file: !1, line: 12, type: !5)
!16 = !DILocation(line: 12, column: 3, scope: !2)
!17 = !DILocalVariable(name: "m", scope: !2, file: !1, line: 12, type: !18)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 192, align: 32, elements: !12)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 96, align: 32, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 3, lowerBound: 0)
!22 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 11, type: !5)
!23 = !DILocation(line: 11, column: 3, scope: !2)
!24 = !DILocation(line: 16, column: 3, scope: !2)
!25 = !DILocation(line: 17, column: 3, scope: !2)
!26 = !DILocation(line: 18, column: 3, scope: !2)
!27 = !DILocation(line: 19, column: 3, scope: !2)
!28 = !DILocation(line: 20, column: 3, scope: !2)
!29 = !DILocation(line: 21, column: 3, scope: !2)
!30 = !DILocation(line: 22, column: 3, scope: !2)
!31 = !DILocation(line: 24, column: 3, scope: !2)
!32 = !DILocation(line: 25, column: 3, scope: !2)
!33 = !DILocation(line: 26, column: 3, scope: !2)
!34 = !DILocation(line: 28, column: 3, scope: !2)
!35 = !DILocation(line: 29, column: 3, scope: !2)
!36 = !DILocation(line: 30, column: 3, scope: !2)
!37 = !DILocation(line: 32, column: 3, scope: !2)
!38 = !DILocation(line: 33, column: 3, scope: !2)
!39 = !DILocation(line: 33, column: 15, scope: !2)
!40 = !DILocation(line: 34, column: 3, scope: !2)
!41 = !DILocation(line: 35, column: 3, scope: !2)
!42 = !DILocation(line: 35, column: 15, scope: !2)
!43 = !DILocation(line: 36, column: 3, scope: !2)
!44 = !DILocation(line: 37, column: 3, scope: !2)
!45 = !DILocation(line: 37, column: 15, scope: !2)
!46 = !DILocation(line: 38, column: 3, scope: !2)
!47 = !DILocation(line: 39, column: 3, scope: !2)
!48 = !DILocation(line: 39, column: 15, scope: !2)
!49 = !DILocation(line: 40, column: 3, scope: !2)
!50 = !DILocation(line: 40, column: 21, scope: !2)
!51 = !DILocation(line: 42, column: 3, scope: !2)
!52 = !DILocation(line: 43, column: 3, scope: !2)
!53 = !DILocation(line: 43, column: 16, scope: !2)
!54 = !DILocation(line: 44, column: 3, scope: !2)
!55 = !DILocation(line: 45, column: 3, scope: !2)
!56 = !DILocation(line: 45, column: 16, scope: !2)
!57 = !DILocation(line: 46, column: 3, scope: !2)
!58 = !DILocation(line: 47, column: 3, scope: !2)
!59 = !DILocation(line: 47, column: 16, scope: !2)
!60 = !DILocation(line: 48, column: 3, scope: !2)
!61 = !DILocation(line: 49, column: 3, scope: !2)
!62 = !DILocation(line: 49, column: 15, scope: !2)
!63 = !DILocation(line: 51, column: 3, scope: !2)
!64 = !DILocation(line: 52, column: 3, scope: !2)
!65 = !DILocation(line: 52, column: 15, scope: !2)
!66 = !DILocation(line: 53, column: 3, scope: !2)
!67 = !DILocation(line: 54, column: 3, scope: !2)
!68 = !DILocation(line: 54, column: 16, scope: !2)
!69 = !DILocation(line: 55, column: 3, scope: !2)
!70 = !DILocation(line: 56, column: 3, scope: !2)
!71 = !DILocation(line: 56, column: 15, scope: !2)
!72 = !DILocation(line: 58, column: 3, scope: !2)
!73 = !DILocation(line: 59, column: 5, scope: !74)
!74 = distinct !DILexicalBlock(scope: !2, file: !1, line: 58, column: 17)
!75 = !DILocation(line: 61, column: 5, scope: !76)
!76 = distinct !DILexicalBlock(scope: !2, file: !1, line: 60, column: 10)
!77 = !DILocation(line: 63, column: 3, scope: !2)
