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
    #dbg_declare(ptr %v, !7, !DIExpression(), !8)
  %grid = alloca [2 x [2 x %struct.Cell]], align 8
    #dbg_declare(ptr %grid, !9, !DIExpression(), !15)
  %scalar = alloca i32, align 4
    #dbg_declare(ptr %scalar, !16, !DIExpression(), !17)
  %m = alloca [2 x [3 x i32]], align 4
    #dbg_declare(ptr %m, !18, !DIExpression(), !17)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !23, !DIExpression(), !24)
  store i32 0, ptr %err, align 4, !dbg !24
  %0 = getelementptr [3 x i32], ptr %m, i32 0, !dbg !25
  %1 = getelementptr i32, ptr %0, i32 0, !dbg !25
  store i32 1, ptr %1, align 4, !dbg !25
  %2 = load i32, ptr %1, align 4, !dbg !25
  %3 = getelementptr [3 x i32], ptr %m, i32 0, !dbg !26
  %4 = getelementptr i32, ptr %3, i32 1, !dbg !26
  store i32 2, ptr %4, align 4, !dbg !26
  %5 = load i32, ptr %4, align 4, !dbg !26
  %6 = getelementptr [3 x i32], ptr %m, i32 0, !dbg !27
  %7 = getelementptr i32, ptr %6, i32 2, !dbg !27
  store i32 3, ptr %7, align 4, !dbg !27
  %8 = load i32, ptr %7, align 4, !dbg !27
  %9 = getelementptr [3 x i32], ptr %m, i32 1, !dbg !28
  %10 = getelementptr i32, ptr %9, i32 0, !dbg !28
  store i32 4, ptr %10, align 4, !dbg !28
  %11 = load i32, ptr %10, align 4, !dbg !28
  %12 = getelementptr [3 x i32], ptr %m, i32 1, !dbg !29
  %13 = getelementptr i32, ptr %12, i32 1, !dbg !29
  store i32 5, ptr %13, align 4, !dbg !29
  %14 = load i32, ptr %13, align 4, !dbg !29
  %15 = getelementptr [3 x i32], ptr %m, i32 1, !dbg !30
  %16 = getelementptr i32, ptr %15, i32 2, !dbg !30
  store i32 6, ptr %16, align 4, !dbg !30
  %17 = load i32, ptr %16, align 4, !dbg !30
  store i32 99, ptr %scalar, align 4, !dbg !31
  %18 = load i32, ptr %scalar, align 4, !dbg !31
  store i32 10, ptr @gm, align 4, !dbg !32
  %19 = load i32, ptr @gm, align 4, !dbg !32
  store i32 20, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 1), i32 2), align 4, !dbg !33
  %20 = load i32, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 1), i32 2), align 4, !dbg !33
  store i32 30, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 2), i32 3), align 4, !dbg !34
  %21 = load i32, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 2), i32 3), align 4, !dbg !34
  %22 = getelementptr [2 x %struct.Cell], ptr %grid, i32 0, !dbg !35
  %23 = getelementptr %struct.Cell, ptr %22, i32 1, !dbg !35
  %24 = getelementptr %struct.Cell, ptr %23, i32 0, i32 0, !dbg !35
  store i32 7, ptr %24, align 4, !dbg !35
  %25 = load i32, ptr %24, align 4, !dbg !35
  %26 = getelementptr [2 x %struct.Cell], ptr %grid, i32 0, !dbg !36
  %27 = getelementptr %struct.Cell, ptr %26, i32 1, !dbg !36
  %28 = getelementptr %struct.Cell, ptr %27, i32 0, i32 1, !dbg !36
  store i32 70, ptr %28, align 4, !dbg !36
  %29 = load i32, ptr %28, align 4, !dbg !36
  %30 = getelementptr [2 x %struct.Cell], ptr %grid, i32 1, !dbg !37
  %31 = getelementptr %struct.Cell, ptr %30, i32 0, !dbg !37
  %32 = getelementptr %struct.Cell, ptr %31, i32 0, i32 0, !dbg !37
  store i32 8, ptr %32, align 4, !dbg !37
  %33 = load i32, ptr %32, align 4, !dbg !37
  %34 = getelementptr [3 x i32], ptr %m, i32 0, !dbg !38
  %35 = getelementptr i32, ptr %34, i32 0, !dbg !38
  %36 = load i32, ptr %35, align 4, !dbg !38
  store i32 %36, ptr %v, align 4, !dbg !38
  %37 = load i32, ptr %v, align 4, !dbg !38
  %38 = load i32, ptr %v, align 4, !dbg !39
  %39 = icmp ne i32 %38, 1, !dbg !39
  br i1 %39, label %then, label %else, !dbg !39

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !40
  %40 = load i32, ptr %err, align 4, !dbg !40
  br label %if.end, !dbg !40

else:                                             ; preds = %entry
  br label %if.end, !dbg !40

if.end:                                           ; preds = %else, %then
  %41 = getelementptr [3 x i32], ptr %m, i32 0, !dbg !41
  %42 = getelementptr i32, ptr %41, i32 2, !dbg !41
  %43 = load i32, ptr %42, align 4, !dbg !41
  store i32 %43, ptr %v, align 4, !dbg !41
  %44 = load i32, ptr %v, align 4, !dbg !41
  %45 = load i32, ptr %v, align 4, !dbg !42
  %46 = icmp ne i32 %45, 3, !dbg !42
  br i1 %46, label %then1, label %else2, !dbg !42

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !43
  %47 = load i32, ptr %err, align 4, !dbg !43
  br label %if.end3, !dbg !43

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !43

if.end3:                                          ; preds = %else2, %then1
  %48 = getelementptr [3 x i32], ptr %m, i32 1, !dbg !44
  %49 = getelementptr i32, ptr %48, i32 1, !dbg !44
  %50 = load i32, ptr %49, align 4, !dbg !44
  store i32 %50, ptr %v, align 4, !dbg !44
  %51 = load i32, ptr %v, align 4, !dbg !44
  %52 = load i32, ptr %v, align 4, !dbg !45
  %53 = icmp ne i32 %52, 5, !dbg !45
  br i1 %53, label %then4, label %else5, !dbg !45

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !46
  %54 = load i32, ptr %err, align 4, !dbg !46
  br label %if.end6, !dbg !46

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !46

if.end6:                                          ; preds = %else5, %then4
  %55 = getelementptr [3 x i32], ptr %m, i32 1, !dbg !47
  %56 = getelementptr i32, ptr %55, i32 2, !dbg !47
  %57 = load i32, ptr %56, align 4, !dbg !47
  store i32 %57, ptr %v, align 4, !dbg !47
  %58 = load i32, ptr %v, align 4, !dbg !47
  %59 = load i32, ptr %v, align 4, !dbg !48
  %60 = icmp ne i32 %59, 6, !dbg !48
  br i1 %60, label %then7, label %else8, !dbg !48

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !49
  %61 = load i32, ptr %err, align 4, !dbg !49
  br label %if.end9, !dbg !49

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !49

if.end9:                                          ; preds = %else8, %then7
  %62 = load i32, ptr %scalar, align 4, !dbg !50
  %63 = icmp ne i32 %62, 99, !dbg !50
  br i1 %63, label %then10, label %else11, !dbg !50

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !51
  %64 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end12, !dbg !51

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !51

if.end12:                                         ; preds = %else11, %then10
  %65 = load i32, ptr @gm, align 4, !dbg !52
  store i32 %65, ptr %v, align 4, !dbg !52
  %66 = load i32, ptr %v, align 4, !dbg !52
  %67 = load i32, ptr %v, align 4, !dbg !53
  %68 = icmp ne i32 %67, 10, !dbg !53
  br i1 %68, label %then13, label %else14, !dbg !53

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !54
  %69 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end15, !dbg !54

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !54

if.end15:                                         ; preds = %else14, %then13
  %70 = load i32, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 1), i32 2), align 4, !dbg !55
  store i32 %70, ptr %v, align 4, !dbg !55
  %71 = load i32, ptr %v, align 4, !dbg !55
  %72 = load i32, ptr %v, align 4, !dbg !56
  %73 = icmp ne i32 %72, 20, !dbg !56
  br i1 %73, label %then16, label %else17, !dbg !56

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !57
  %74 = load i32, ptr %err, align 4, !dbg !57
  br label %if.end18, !dbg !57

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !57

if.end18:                                         ; preds = %else17, %then16
  %75 = load i32, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 2), i32 3), align 4, !dbg !58
  store i32 %75, ptr %v, align 4, !dbg !58
  %76 = load i32, ptr %v, align 4, !dbg !58
  %77 = load i32, ptr %v, align 4, !dbg !59
  %78 = icmp ne i32 %77, 30, !dbg !59
  br i1 %78, label %then19, label %else20, !dbg !59

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !60
  %79 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end21, !dbg !60

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !60

if.end21:                                         ; preds = %else20, %then19
  %80 = load i32, ptr getelementptr (i32, ptr @gm, i32 1), align 4, !dbg !61
  store i32 %80, ptr %v, align 4, !dbg !61
  %81 = load i32, ptr %v, align 4, !dbg !61
  %82 = load i32, ptr %v, align 4, !dbg !62
  %83 = icmp ne i32 %82, 0, !dbg !62
  br i1 %83, label %then22, label %else23, !dbg !62

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !63
  %84 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end24, !dbg !63

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !63

if.end24:                                         ; preds = %else23, %then22
  %85 = getelementptr [2 x %struct.Cell], ptr %grid, i32 0, !dbg !64
  %86 = getelementptr %struct.Cell, ptr %85, i32 1, !dbg !64
  %87 = getelementptr %struct.Cell, ptr %86, i32 0, i32 0, !dbg !64
  %88 = load i32, ptr %87, align 4, !dbg !64
  store i32 %88, ptr %v, align 4, !dbg !64
  %89 = load i32, ptr %v, align 4, !dbg !64
  %90 = load i32, ptr %v, align 4, !dbg !65
  %91 = icmp ne i32 %90, 7, !dbg !65
  br i1 %91, label %then25, label %else26, !dbg !65

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !66
  %92 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end27, !dbg !66

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !66

if.end27:                                         ; preds = %else26, %then25
  %93 = getelementptr [2 x %struct.Cell], ptr %grid, i32 0, !dbg !67
  %94 = getelementptr %struct.Cell, ptr %93, i32 1, !dbg !67
  %95 = getelementptr %struct.Cell, ptr %94, i32 0, i32 1, !dbg !67
  %96 = load i32, ptr %95, align 4, !dbg !67
  store i32 %96, ptr %v, align 4, !dbg !67
  %97 = load i32, ptr %v, align 4, !dbg !67
  %98 = load i32, ptr %v, align 4, !dbg !68
  %99 = icmp ne i32 %98, 70, !dbg !68
  br i1 %99, label %then28, label %else29, !dbg !68

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !69
  %100 = load i32, ptr %err, align 4, !dbg !69
  br label %if.end30, !dbg !69

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !69

if.end30:                                         ; preds = %else29, %then28
  %101 = getelementptr [2 x %struct.Cell], ptr %grid, i32 1, !dbg !70
  %102 = getelementptr %struct.Cell, ptr %101, i32 0, !dbg !70
  %103 = getelementptr %struct.Cell, ptr %102, i32 0, i32 0, !dbg !70
  %104 = load i32, ptr %103, align 4, !dbg !70
  store i32 %104, ptr %v, align 4, !dbg !70
  %105 = load i32, ptr %v, align 4, !dbg !70
  %106 = load i32, ptr %v, align 4, !dbg !71
  %107 = icmp ne i32 %106, 8, !dbg !71
  br i1 %107, label %then31, label %else32, !dbg !71

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !72
  %108 = load i32, ptr %err, align 4, !dbg !72
  br label %if.end33, !dbg !72

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !72

if.end33:                                         ; preds = %else32, %then31
  %109 = load i32, ptr %err, align 4, !dbg !73
  %110 = icmp eq i32 %109, 0, !dbg !73
  br i1 %110, label %then34, label %else35, !dbg !73

then34:                                           ; preds = %if.end33
  %111 = call i32 (ptr, ...) @printf(ptr @0), !dbg !74
  br label %if.end36, !dbg !74

else35:                                           ; preds = %if.end33
  %112 = call i32 (ptr, ...) @printf(ptr @1), !dbg !76
  br label %if.end36, !dbg !76

if.end36:                                         ; preds = %else35, %then34
  %113 = load i32, ptr %err, align 4, !dbg !78
  ret i32 %113, !dbg !78
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "33.array_2d_decl.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 10, type: !3, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "v", scope: !2, file: !1, line: 14, type: !5)
!8 = !DILocation(line: 14, column: 3, scope: !2)
!9 = !DILocalVariable(name: "grid", scope: !2, file: !1, line: 13, type: !10)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 256, align: 32, elements: !13)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 128, align: 32, elements: !13)
!12 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!13 = !{!14}
!14 = !DISubrange(count: 2, lowerBound: 0)
!15 = !DILocation(line: 13, column: 3, scope: !2)
!16 = !DILocalVariable(name: "scalar", scope: !2, file: !1, line: 12, type: !5)
!17 = !DILocation(line: 12, column: 3, scope: !2)
!18 = !DILocalVariable(name: "m", scope: !2, file: !1, line: 12, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 192, align: 32, elements: !13)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 96, align: 32, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 3, lowerBound: 0)
!23 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 11, type: !5)
!24 = !DILocation(line: 11, column: 3, scope: !2)
!25 = !DILocation(line: 16, column: 3, scope: !2)
!26 = !DILocation(line: 17, column: 3, scope: !2)
!27 = !DILocation(line: 18, column: 3, scope: !2)
!28 = !DILocation(line: 19, column: 3, scope: !2)
!29 = !DILocation(line: 20, column: 3, scope: !2)
!30 = !DILocation(line: 21, column: 3, scope: !2)
!31 = !DILocation(line: 22, column: 3, scope: !2)
!32 = !DILocation(line: 24, column: 3, scope: !2)
!33 = !DILocation(line: 25, column: 3, scope: !2)
!34 = !DILocation(line: 26, column: 3, scope: !2)
!35 = !DILocation(line: 28, column: 3, scope: !2)
!36 = !DILocation(line: 29, column: 3, scope: !2)
!37 = !DILocation(line: 30, column: 3, scope: !2)
!38 = !DILocation(line: 32, column: 3, scope: !2)
!39 = !DILocation(line: 33, column: 3, scope: !2)
!40 = !DILocation(line: 33, column: 15, scope: !2)
!41 = !DILocation(line: 34, column: 3, scope: !2)
!42 = !DILocation(line: 35, column: 3, scope: !2)
!43 = !DILocation(line: 35, column: 15, scope: !2)
!44 = !DILocation(line: 36, column: 3, scope: !2)
!45 = !DILocation(line: 37, column: 3, scope: !2)
!46 = !DILocation(line: 37, column: 15, scope: !2)
!47 = !DILocation(line: 38, column: 3, scope: !2)
!48 = !DILocation(line: 39, column: 3, scope: !2)
!49 = !DILocation(line: 39, column: 15, scope: !2)
!50 = !DILocation(line: 40, column: 3, scope: !2)
!51 = !DILocation(line: 40, column: 21, scope: !2)
!52 = !DILocation(line: 42, column: 3, scope: !2)
!53 = !DILocation(line: 43, column: 3, scope: !2)
!54 = !DILocation(line: 43, column: 16, scope: !2)
!55 = !DILocation(line: 44, column: 3, scope: !2)
!56 = !DILocation(line: 45, column: 3, scope: !2)
!57 = !DILocation(line: 45, column: 16, scope: !2)
!58 = !DILocation(line: 46, column: 3, scope: !2)
!59 = !DILocation(line: 47, column: 3, scope: !2)
!60 = !DILocation(line: 47, column: 16, scope: !2)
!61 = !DILocation(line: 48, column: 3, scope: !2)
!62 = !DILocation(line: 49, column: 3, scope: !2)
!63 = !DILocation(line: 49, column: 15, scope: !2)
!64 = !DILocation(line: 51, column: 3, scope: !2)
!65 = !DILocation(line: 52, column: 3, scope: !2)
!66 = !DILocation(line: 52, column: 15, scope: !2)
!67 = !DILocation(line: 53, column: 3, scope: !2)
!68 = !DILocation(line: 54, column: 3, scope: !2)
!69 = !DILocation(line: 54, column: 16, scope: !2)
!70 = !DILocation(line: 55, column: 3, scope: !2)
!71 = !DILocation(line: 56, column: 3, scope: !2)
!72 = !DILocation(line: 56, column: 15, scope: !2)
!73 = !DILocation(line: 58, column: 3, scope: !2)
!74 = !DILocation(line: 59, column: 5, scope: !75)
!75 = distinct !DILexicalBlock(scope: !2, file: !1, line: 58, column: 17)
!76 = !DILocation(line: 61, column: 5, scope: !77)
!77 = distinct !DILexicalBlock(scope: !2, file: !1, line: 60, column: 10)
!78 = !DILocation(line: 63, column: 3, scope: !2)
