; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

%struct.Cell = type { i32, i32 }

@gm = global [3 x [4 x i32]] zeroinitializer
@0 = private unnamed_addr constant [25 x i8] c"33.array_2d_decl.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [25 x i8] c"33.array_2d_decl.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %v = alloca i32, align 4
    #dbg_declare(ptr %v, !9, !DIExpression(), !10)
  %grid = alloca [2 x [2 x %struct.Cell]], align 8
    #dbg_declare(ptr %grid, !11, !DIExpression(), !17)
  %scalar = alloca i32, align 4
    #dbg_declare(ptr %scalar, !18, !DIExpression(), !19)
  %m = alloca [2 x [3 x i32]], align 4
    #dbg_declare(ptr %m, !20, !DIExpression(), !19)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !25, !DIExpression(), !26)
  store i32 0, ptr %err, align 4, !dbg !26
  %0 = getelementptr [3 x i32], ptr %m, i32 0, !dbg !27
  %1 = getelementptr i32, ptr %0, i32 0, !dbg !27
  store i32 1, ptr %1, align 4, !dbg !27
  %2 = load i32, ptr %1, align 4, !dbg !27
  %3 = getelementptr [3 x i32], ptr %m, i32 0, !dbg !28
  %4 = getelementptr i32, ptr %3, i32 1, !dbg !28
  store i32 2, ptr %4, align 4, !dbg !28
  %5 = load i32, ptr %4, align 4, !dbg !28
  %6 = getelementptr [3 x i32], ptr %m, i32 0, !dbg !29
  %7 = getelementptr i32, ptr %6, i32 2, !dbg !29
  store i32 3, ptr %7, align 4, !dbg !29
  %8 = load i32, ptr %7, align 4, !dbg !29
  %9 = getelementptr [3 x i32], ptr %m, i32 1, !dbg !30
  %10 = getelementptr i32, ptr %9, i32 0, !dbg !30
  store i32 4, ptr %10, align 4, !dbg !30
  %11 = load i32, ptr %10, align 4, !dbg !30
  %12 = getelementptr [3 x i32], ptr %m, i32 1, !dbg !31
  %13 = getelementptr i32, ptr %12, i32 1, !dbg !31
  store i32 5, ptr %13, align 4, !dbg !31
  %14 = load i32, ptr %13, align 4, !dbg !31
  %15 = getelementptr [3 x i32], ptr %m, i32 1, !dbg !32
  %16 = getelementptr i32, ptr %15, i32 2, !dbg !32
  store i32 6, ptr %16, align 4, !dbg !32
  %17 = load i32, ptr %16, align 4, !dbg !32
  store i32 99, ptr %scalar, align 4, !dbg !33
  %18 = load i32, ptr %scalar, align 4, !dbg !33
  store i32 10, ptr @gm, align 4, !dbg !34
  %19 = load i32, ptr @gm, align 4, !dbg !34
  store i32 20, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 1), i32 2), align 4, !dbg !35
  %20 = load i32, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 1), i32 2), align 4, !dbg !35
  store i32 30, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 2), i32 3), align 4, !dbg !36
  %21 = load i32, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 2), i32 3), align 4, !dbg !36
  %22 = getelementptr [2 x %struct.Cell], ptr %grid, i32 0, !dbg !37
  %23 = getelementptr %struct.Cell, ptr %22, i32 1, !dbg !37
  %24 = getelementptr %struct.Cell, ptr %23, i32 0, i32 0, !dbg !37
  store i32 7, ptr %24, align 4, !dbg !37
  %25 = load i32, ptr %24, align 4, !dbg !37
  %26 = getelementptr [2 x %struct.Cell], ptr %grid, i32 0, !dbg !38
  %27 = getelementptr %struct.Cell, ptr %26, i32 1, !dbg !38
  %28 = getelementptr %struct.Cell, ptr %27, i32 0, i32 1, !dbg !38
  store i32 70, ptr %28, align 4, !dbg !38
  %29 = load i32, ptr %28, align 4, !dbg !38
  %30 = getelementptr [2 x %struct.Cell], ptr %grid, i32 1, !dbg !39
  %31 = getelementptr %struct.Cell, ptr %30, i32 0, !dbg !39
  %32 = getelementptr %struct.Cell, ptr %31, i32 0, i32 0, !dbg !39
  store i32 8, ptr %32, align 4, !dbg !39
  %33 = load i32, ptr %32, align 4, !dbg !39
  %34 = getelementptr [3 x i32], ptr %m, i32 0, !dbg !40
  %35 = getelementptr i32, ptr %34, i32 0, !dbg !40
  %36 = load i32, ptr %35, align 4, !dbg !40
  store i32 %36, ptr %v, align 4, !dbg !40
  %37 = load i32, ptr %v, align 4, !dbg !40
  %38 = load i32, ptr %v, align 4, !dbg !41
  %39 = icmp ne i32 %38, 1, !dbg !41
  br i1 %39, label %then, label %else, !dbg !41

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !42
  %40 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end, !dbg !42

else:                                             ; preds = %entry
  br label %if.end, !dbg !42

if.end:                                           ; preds = %else, %then
  %41 = getelementptr [3 x i32], ptr %m, i32 0, !dbg !43
  %42 = getelementptr i32, ptr %41, i32 2, !dbg !43
  %43 = load i32, ptr %42, align 4, !dbg !43
  store i32 %43, ptr %v, align 4, !dbg !43
  %44 = load i32, ptr %v, align 4, !dbg !43
  %45 = load i32, ptr %v, align 4, !dbg !44
  %46 = icmp ne i32 %45, 3, !dbg !44
  br i1 %46, label %then1, label %else2, !dbg !44

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !45
  %47 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end3, !dbg !45

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !45

if.end3:                                          ; preds = %else2, %then1
  %48 = getelementptr [3 x i32], ptr %m, i32 1, !dbg !46
  %49 = getelementptr i32, ptr %48, i32 1, !dbg !46
  %50 = load i32, ptr %49, align 4, !dbg !46
  store i32 %50, ptr %v, align 4, !dbg !46
  %51 = load i32, ptr %v, align 4, !dbg !46
  %52 = load i32, ptr %v, align 4, !dbg !47
  %53 = icmp ne i32 %52, 5, !dbg !47
  br i1 %53, label %then4, label %else5, !dbg !47

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !48
  %54 = load i32, ptr %err, align 4, !dbg !48
  br label %if.end6, !dbg !48

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !48

if.end6:                                          ; preds = %else5, %then4
  %55 = getelementptr [3 x i32], ptr %m, i32 1, !dbg !49
  %56 = getelementptr i32, ptr %55, i32 2, !dbg !49
  %57 = load i32, ptr %56, align 4, !dbg !49
  store i32 %57, ptr %v, align 4, !dbg !49
  %58 = load i32, ptr %v, align 4, !dbg !49
  %59 = load i32, ptr %v, align 4, !dbg !50
  %60 = icmp ne i32 %59, 6, !dbg !50
  br i1 %60, label %then7, label %else8, !dbg !50

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !51
  %61 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end9, !dbg !51

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !51

if.end9:                                          ; preds = %else8, %then7
  %62 = load i32, ptr %scalar, align 4, !dbg !52
  %63 = icmp ne i32 %62, 99, !dbg !52
  br i1 %63, label %then10, label %else11, !dbg !52

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !53
  %64 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end12, !dbg !53

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !53

if.end12:                                         ; preds = %else11, %then10
  %65 = load i32, ptr @gm, align 4, !dbg !54
  store i32 %65, ptr %v, align 4, !dbg !54
  %66 = load i32, ptr %v, align 4, !dbg !54
  %67 = load i32, ptr %v, align 4, !dbg !55
  %68 = icmp ne i32 %67, 10, !dbg !55
  br i1 %68, label %then13, label %else14, !dbg !55

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !56
  %69 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end15, !dbg !56

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !56

if.end15:                                         ; preds = %else14, %then13
  %70 = load i32, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 1), i32 2), align 4, !dbg !57
  store i32 %70, ptr %v, align 4, !dbg !57
  %71 = load i32, ptr %v, align 4, !dbg !57
  %72 = load i32, ptr %v, align 4, !dbg !58
  %73 = icmp ne i32 %72, 20, !dbg !58
  br i1 %73, label %then16, label %else17, !dbg !58

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !59
  %74 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end18, !dbg !59

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !59

if.end18:                                         ; preds = %else17, %then16
  %75 = load i32, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 2), i32 3), align 4, !dbg !60
  store i32 %75, ptr %v, align 4, !dbg !60
  %76 = load i32, ptr %v, align 4, !dbg !60
  %77 = load i32, ptr %v, align 4, !dbg !61
  %78 = icmp ne i32 %77, 30, !dbg !61
  br i1 %78, label %then19, label %else20, !dbg !61

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !62
  %79 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end21, !dbg !62

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !62

if.end21:                                         ; preds = %else20, %then19
  %80 = load i32, ptr getelementptr (i32, ptr @gm, i32 1), align 4, !dbg !63
  store i32 %80, ptr %v, align 4, !dbg !63
  %81 = load i32, ptr %v, align 4, !dbg !63
  %82 = load i32, ptr %v, align 4, !dbg !64
  %83 = icmp ne i32 %82, 0, !dbg !64
  br i1 %83, label %then22, label %else23, !dbg !64

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !65
  %84 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end24, !dbg !65

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !65

if.end24:                                         ; preds = %else23, %then22
  %85 = getelementptr [2 x %struct.Cell], ptr %grid, i32 0, !dbg !66
  %86 = getelementptr %struct.Cell, ptr %85, i32 1, !dbg !66
  %87 = getelementptr %struct.Cell, ptr %86, i32 0, i32 0, !dbg !66
  %88 = load i32, ptr %87, align 4, !dbg !66
  store i32 %88, ptr %v, align 4, !dbg !66
  %89 = load i32, ptr %v, align 4, !dbg !66
  %90 = load i32, ptr %v, align 4, !dbg !67
  %91 = icmp ne i32 %90, 7, !dbg !67
  br i1 %91, label %then25, label %else26, !dbg !67

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !68
  %92 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end27, !dbg !68

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !68

if.end27:                                         ; preds = %else26, %then25
  %93 = getelementptr [2 x %struct.Cell], ptr %grid, i32 0, !dbg !69
  %94 = getelementptr %struct.Cell, ptr %93, i32 1, !dbg !69
  %95 = getelementptr %struct.Cell, ptr %94, i32 0, i32 1, !dbg !69
  %96 = load i32, ptr %95, align 4, !dbg !69
  store i32 %96, ptr %v, align 4, !dbg !69
  %97 = load i32, ptr %v, align 4, !dbg !69
  %98 = load i32, ptr %v, align 4, !dbg !70
  %99 = icmp ne i32 %98, 70, !dbg !70
  br i1 %99, label %then28, label %else29, !dbg !70

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !71
  %100 = load i32, ptr %err, align 4, !dbg !71
  br label %if.end30, !dbg !71

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !71

if.end30:                                         ; preds = %else29, %then28
  %101 = getelementptr [2 x %struct.Cell], ptr %grid, i32 1, !dbg !72
  %102 = getelementptr %struct.Cell, ptr %101, i32 0, !dbg !72
  %103 = getelementptr %struct.Cell, ptr %102, i32 0, i32 0, !dbg !72
  %104 = load i32, ptr %103, align 4, !dbg !72
  store i32 %104, ptr %v, align 4, !dbg !72
  %105 = load i32, ptr %v, align 4, !dbg !72
  %106 = load i32, ptr %v, align 4, !dbg !73
  %107 = icmp ne i32 %106, 8, !dbg !73
  br i1 %107, label %then31, label %else32, !dbg !73

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !74
  %108 = load i32, ptr %err, align 4, !dbg !74
  br label %if.end33, !dbg !74

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !74

if.end33:                                         ; preds = %else32, %then31
  %109 = load i32, ptr %err, align 4, !dbg !75
  %110 = icmp eq i32 %109, 0, !dbg !75
  br i1 %110, label %then34, label %else35, !dbg !75

then34:                                           ; preds = %if.end33
  %111 = call i32 (ptr, ...) @printf(ptr @0), !dbg !76
  br label %if.end36, !dbg !76

else35:                                           ; preds = %if.end33
  %112 = call i32 (ptr, ...) @printf(ptr @1), !dbg !78
  br label %if.end36, !dbg !78

if.end36:                                         ; preds = %else35, %then34
  %113 = load i32, ptr %err, align 4, !dbg !80
  ret i32 %113, !dbg !80
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "33.array_2d_decl.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 13, type: !5, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "v", scope: !4, file: !3, line: 17, type: !7)
!10 = !DILocation(line: 17, column: 3, scope: !4)
!11 = !DILocalVariable(name: "grid", scope: !4, file: !3, line: 16, type: !12)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 256, align: 32, elements: !15)
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 128, align: 32, elements: !15)
!14 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!15 = !{!16}
!16 = !DISubrange(count: 2, lowerBound: 0)
!17 = !DILocation(line: 16, column: 3, scope: !4)
!18 = !DILocalVariable(name: "scalar", scope: !4, file: !3, line: 15, type: !7)
!19 = !DILocation(line: 15, column: 3, scope: !4)
!20 = !DILocalVariable(name: "m", scope: !4, file: !3, line: 15, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 192, align: 32, elements: !15)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 96, align: 32, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 3, lowerBound: 0)
!25 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 14, type: !7)
!26 = !DILocation(line: 14, column: 3, scope: !4)
!27 = !DILocation(line: 19, column: 3, scope: !4)
!28 = !DILocation(line: 20, column: 3, scope: !4)
!29 = !DILocation(line: 21, column: 3, scope: !4)
!30 = !DILocation(line: 22, column: 3, scope: !4)
!31 = !DILocation(line: 23, column: 3, scope: !4)
!32 = !DILocation(line: 24, column: 3, scope: !4)
!33 = !DILocation(line: 25, column: 3, scope: !4)
!34 = !DILocation(line: 27, column: 3, scope: !4)
!35 = !DILocation(line: 28, column: 3, scope: !4)
!36 = !DILocation(line: 29, column: 3, scope: !4)
!37 = !DILocation(line: 31, column: 3, scope: !4)
!38 = !DILocation(line: 32, column: 3, scope: !4)
!39 = !DILocation(line: 33, column: 3, scope: !4)
!40 = !DILocation(line: 35, column: 3, scope: !4)
!41 = !DILocation(line: 36, column: 3, scope: !4)
!42 = !DILocation(line: 36, column: 15, scope: !4)
!43 = !DILocation(line: 37, column: 3, scope: !4)
!44 = !DILocation(line: 38, column: 3, scope: !4)
!45 = !DILocation(line: 38, column: 15, scope: !4)
!46 = !DILocation(line: 39, column: 3, scope: !4)
!47 = !DILocation(line: 40, column: 3, scope: !4)
!48 = !DILocation(line: 40, column: 15, scope: !4)
!49 = !DILocation(line: 41, column: 3, scope: !4)
!50 = !DILocation(line: 42, column: 3, scope: !4)
!51 = !DILocation(line: 42, column: 15, scope: !4)
!52 = !DILocation(line: 43, column: 3, scope: !4)
!53 = !DILocation(line: 43, column: 21, scope: !4)
!54 = !DILocation(line: 45, column: 3, scope: !4)
!55 = !DILocation(line: 46, column: 3, scope: !4)
!56 = !DILocation(line: 46, column: 16, scope: !4)
!57 = !DILocation(line: 47, column: 3, scope: !4)
!58 = !DILocation(line: 48, column: 3, scope: !4)
!59 = !DILocation(line: 48, column: 16, scope: !4)
!60 = !DILocation(line: 49, column: 3, scope: !4)
!61 = !DILocation(line: 50, column: 3, scope: !4)
!62 = !DILocation(line: 50, column: 16, scope: !4)
!63 = !DILocation(line: 51, column: 3, scope: !4)
!64 = !DILocation(line: 52, column: 3, scope: !4)
!65 = !DILocation(line: 52, column: 15, scope: !4)
!66 = !DILocation(line: 54, column: 3, scope: !4)
!67 = !DILocation(line: 55, column: 3, scope: !4)
!68 = !DILocation(line: 55, column: 15, scope: !4)
!69 = !DILocation(line: 56, column: 3, scope: !4)
!70 = !DILocation(line: 57, column: 3, scope: !4)
!71 = !DILocation(line: 57, column: 16, scope: !4)
!72 = !DILocation(line: 58, column: 3, scope: !4)
!73 = !DILocation(line: 59, column: 3, scope: !4)
!74 = !DILocation(line: 59, column: 15, scope: !4)
!75 = !DILocation(line: 61, column: 3, scope: !4)
!76 = !DILocation(line: 62, column: 5, scope: !77)
!77 = distinct !DILexicalBlock(scope: !4, file: !3, line: 61, column: 17)
!78 = !DILocation(line: 64, column: 5, scope: !79)
!79 = distinct !DILexicalBlock(scope: !4, file: !3, line: 63, column: 10)
!80 = !DILocation(line: 66, column: 3, scope: !4)
