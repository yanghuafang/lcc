; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@ga = global [2 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 4, i32 5, i32 6]]
@gb = global [2 x [3 x i32]] [[3 x i32] [i32 0, i32 1, i32 2], [3 x i32] [i32 3, i32 4, i32 5]]
@gc = global [2 x [2 x i32]] [[2 x i32] [i32 10, i32 11], [2 x i32] [i32 20, i32 0]]
@0 = private unnamed_addr constant [31 x i8] c"34.array_2d_brace_init.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"34.array_2d_brace_init.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %lc = alloca [2 x [3 x i32]], align 4
    #dbg_declare(ptr %lc, !8, !DIExpression(), !15)
  %lb = alloca [2 x [3 x i32]], align 4
    #dbg_declare(ptr %lb, !16, !DIExpression(), !17)
  %la = alloca [2 x [3 x i32]], align 4
    #dbg_declare(ptr %la, !18, !DIExpression(), !19)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !20, !DIExpression(), !21)
  store i32 0, ptr %err, align 4, !dbg !21
  %0 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 0, i32 0, !dbg !19
  store i32 1, ptr %0, align 4, !dbg !19
  %1 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 0, i32 1, !dbg !19
  store i32 2, ptr %1, align 4, !dbg !19
  %2 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 0, i32 2, !dbg !19
  store i32 0, ptr %2, align 4, !dbg !19
  %3 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 1, i32 0, !dbg !19
  store i32 3, ptr %3, align 4, !dbg !19
  %4 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 1, i32 1, !dbg !19
  store i32 0, ptr %4, align 4, !dbg !19
  %5 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 1, i32 2, !dbg !19
  store i32 0, ptr %5, align 4, !dbg !19
  %6 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 0, i32 0, !dbg !17
  store i32 7, ptr %6, align 4, !dbg !17
  %7 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 0, i32 1, !dbg !17
  store i32 8, ptr %7, align 4, !dbg !17
  %8 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 0, i32 2, !dbg !17
  store i32 9, ptr %8, align 4, !dbg !17
  %9 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 1, i32 0, !dbg !17
  store i32 10, ptr %9, align 4, !dbg !17
  %10 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 1, i32 1, !dbg !17
  store i32 11, ptr %10, align 4, !dbg !17
  %11 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 1, i32 2, !dbg !17
  store i32 12, ptr %11, align 4, !dbg !17
  %12 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 0, i32 0, !dbg !15
  store i32 1, ptr %12, align 4, !dbg !15
  %13 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 0, i32 1, !dbg !15
  store i32 2, ptr %13, align 4, !dbg !15
  %14 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 0, i32 2, !dbg !15
  store i32 3, ptr %14, align 4, !dbg !15
  %15 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 1, i32 0, !dbg !15
  store i32 4, ptr %15, align 4, !dbg !15
  %16 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 1, i32 1, !dbg !15
  store i32 0, ptr %16, align 4, !dbg !15
  %17 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 1, i32 2, !dbg !15
  store i32 0, ptr %17, align 4, !dbg !15
  %18 = getelementptr [3 x i32], ptr %la, i32 0, !dbg !22
  %19 = getelementptr i32, ptr %18, i32 0, !dbg !22
  %20 = load i32, ptr %19, align 4, !dbg !22
  %21 = icmp ne i32 %20, 1, !dbg !22
  br i1 %21, label %then, label %else, !dbg !22

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !23
  %22 = load i32, ptr %err, align 4, !dbg !23
  br label %if.end, !dbg !23

else:                                             ; preds = %entry
  br label %if.end, !dbg !23

if.end:                                           ; preds = %else, %then
  %23 = getelementptr [3 x i32], ptr %la, i32 0, !dbg !24
  %24 = getelementptr i32, ptr %23, i32 2, !dbg !24
  %25 = load i32, ptr %24, align 4, !dbg !24
  %26 = icmp ne i32 %25, 0, !dbg !24
  br i1 %26, label %then1, label %else2, !dbg !24

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !25
  %27 = load i32, ptr %err, align 4, !dbg !25
  br label %if.end3, !dbg !25

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !25

if.end3:                                          ; preds = %else2, %then1
  %28 = getelementptr [3 x i32], ptr %la, i32 1, !dbg !26
  %29 = getelementptr i32, ptr %28, i32 0, !dbg !26
  %30 = load i32, ptr %29, align 4, !dbg !26
  %31 = icmp ne i32 %30, 3, !dbg !26
  br i1 %31, label %then4, label %else5, !dbg !26

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !27
  %32 = load i32, ptr %err, align 4, !dbg !27
  br label %if.end6, !dbg !27

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !27

if.end6:                                          ; preds = %else5, %then4
  %33 = getelementptr [3 x i32], ptr %la, i32 1, !dbg !28
  %34 = getelementptr i32, ptr %33, i32 2, !dbg !28
  %35 = load i32, ptr %34, align 4, !dbg !28
  %36 = icmp ne i32 %35, 0, !dbg !28
  br i1 %36, label %then7, label %else8, !dbg !28

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !29
  %37 = load i32, ptr %err, align 4, !dbg !29
  br label %if.end9, !dbg !29

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !29

if.end9:                                          ; preds = %else8, %then7
  %38 = getelementptr [3 x i32], ptr %lb, i32 0, !dbg !30
  %39 = getelementptr i32, ptr %38, i32 0, !dbg !30
  %40 = load i32, ptr %39, align 4, !dbg !30
  %41 = icmp ne i32 %40, 7, !dbg !30
  br i1 %41, label %then10, label %else11, !dbg !30

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !31
  %42 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end12, !dbg !31

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !31

if.end12:                                         ; preds = %else11, %then10
  %43 = getelementptr [3 x i32], ptr %lb, i32 1, !dbg !32
  %44 = getelementptr i32, ptr %43, i32 2, !dbg !32
  %45 = load i32, ptr %44, align 4, !dbg !32
  %46 = icmp ne i32 %45, 12, !dbg !32
  br i1 %46, label %then13, label %else14, !dbg !32

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !33
  %47 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end15, !dbg !33

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !33

if.end15:                                         ; preds = %else14, %then13
  %48 = getelementptr [3 x i32], ptr %lc, i32 0, !dbg !34
  %49 = getelementptr i32, ptr %48, i32 2, !dbg !34
  %50 = load i32, ptr %49, align 4, !dbg !34
  %51 = icmp ne i32 %50, 3, !dbg !34
  br i1 %51, label %then16, label %else17, !dbg !34

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !35
  %52 = load i32, ptr %err, align 4, !dbg !35
  br label %if.end18, !dbg !35

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !35

if.end18:                                         ; preds = %else17, %then16
  %53 = getelementptr [3 x i32], ptr %lc, i32 1, !dbg !36
  %54 = getelementptr i32, ptr %53, i32 0, !dbg !36
  %55 = load i32, ptr %54, align 4, !dbg !36
  %56 = icmp ne i32 %55, 4, !dbg !36
  br i1 %56, label %then19, label %else20, !dbg !36

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !37
  %57 = load i32, ptr %err, align 4, !dbg !37
  br label %if.end21, !dbg !37

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !37

if.end21:                                         ; preds = %else20, %then19
  %58 = getelementptr [3 x i32], ptr %lc, i32 1, !dbg !38
  %59 = getelementptr i32, ptr %58, i32 2, !dbg !38
  %60 = load i32, ptr %59, align 4, !dbg !38
  %61 = icmp ne i32 %60, 0, !dbg !38
  br i1 %61, label %then22, label %else23, !dbg !38

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !39
  %62 = load i32, ptr %err, align 4, !dbg !39
  br label %if.end24, !dbg !39

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !39

if.end24:                                         ; preds = %else23, %then22
  %63 = load i32, ptr @ga, align 4, !dbg !40
  %64 = icmp ne i32 %63, 1, !dbg !40
  br i1 %64, label %then25, label %else26, !dbg !40

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !41
  %65 = load i32, ptr %err, align 4, !dbg !41
  br label %if.end27, !dbg !41

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !41

if.end27:                                         ; preds = %else26, %then25
  %66 = load i32, ptr getelementptr (i32, ptr getelementptr ([3 x i32], ptr @ga, i32 1), i32 2), align 4, !dbg !42
  %67 = icmp ne i32 %66, 6, !dbg !42
  br i1 %67, label %then28, label %else29, !dbg !42

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !43
  %68 = load i32, ptr %err, align 4, !dbg !43
  br label %if.end30, !dbg !43

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !43

if.end30:                                         ; preds = %else29, %then28
  %69 = load i32, ptr getelementptr (i32, ptr @gb, i32 1), align 4, !dbg !44
  %70 = icmp ne i32 %69, 1, !dbg !44
  br i1 %70, label %then31, label %else32, !dbg !44

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !45
  %71 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end33, !dbg !45

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !45

if.end33:                                         ; preds = %else32, %then31
  %72 = load i32, ptr getelementptr ([3 x i32], ptr @gb, i32 1), align 4, !dbg !46
  %73 = icmp ne i32 %72, 3, !dbg !46
  br i1 %73, label %then34, label %else35, !dbg !46

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !47
  %74 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end36, !dbg !47

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !47

if.end36:                                         ; preds = %else35, %then34
  %75 = load i32, ptr getelementptr (i32, ptr @gc, i32 1), align 4, !dbg !48
  %76 = icmp ne i32 %75, 11, !dbg !48
  br i1 %76, label %then37, label %else38, !dbg !48

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !49
  %77 = load i32, ptr %err, align 4, !dbg !49
  br label %if.end39, !dbg !49

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !49

if.end39:                                         ; preds = %else38, %then37
  %78 = load i32, ptr getelementptr ([2 x i32], ptr @gc, i32 1), align 4, !dbg !50
  %79 = icmp ne i32 %78, 20, !dbg !50
  br i1 %79, label %then40, label %else41, !dbg !50

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !51
  %80 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end42, !dbg !51

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !51

if.end42:                                         ; preds = %else41, %then40
  %81 = load i32, ptr getelementptr (i32, ptr getelementptr ([2 x i32], ptr @gc, i32 1), i32 1), align 4, !dbg !52
  %82 = icmp ne i32 %81, 0, !dbg !52
  br i1 %82, label %then43, label %else44, !dbg !52

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4, !dbg !53
  %83 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end45, !dbg !53

else44:                                           ; preds = %if.end42
  br label %if.end45, !dbg !53

if.end45:                                         ; preds = %else44, %then43
  %84 = load i32, ptr %err, align 4, !dbg !54
  %85 = icmp eq i32 %84, 0, !dbg !54
  br i1 %85, label %then46, label %else47, !dbg !54

then46:                                           ; preds = %if.end45
  %86 = call i32 (ptr, ...) @printf(ptr @0), !dbg !55
  br label %if.end48, !dbg !55

else47:                                           ; preds = %if.end45
  %87 = call i32 (ptr, ...) @printf(ptr @1), !dbg !57
  br label %if.end48, !dbg !57

if.end48:                                         ; preds = %else47, %then46
  %88 = load i32, ptr %err, align 4, !dbg !59
  ret i32 %88, !dbg !59
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "34.array_2d_brace_init.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 9, type: !5, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "lc", scope: !4, file: !3, line: 13, type: !9)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 192, align: 32, elements: !13)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 96, align: 32, elements: !11)
!11 = !{!12}
!12 = !DISubrange(count: 3, lowerBound: 0)
!13 = !{!14}
!14 = !DISubrange(count: 2, lowerBound: 0)
!15 = !DILocation(line: 13, column: 3, scope: !4)
!16 = !DILocalVariable(name: "lb", scope: !4, file: !3, line: 12, type: !9)
!17 = !DILocation(line: 12, column: 3, scope: !4)
!18 = !DILocalVariable(name: "la", scope: !4, file: !3, line: 11, type: !9)
!19 = !DILocation(line: 11, column: 3, scope: !4)
!20 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 10, type: !7)
!21 = !DILocation(line: 10, column: 3, scope: !4)
!22 = !DILocation(line: 15, column: 3, scope: !4)
!23 = !DILocation(line: 15, column: 22, scope: !4)
!24 = !DILocation(line: 16, column: 3, scope: !4)
!25 = !DILocation(line: 16, column: 22, scope: !4)
!26 = !DILocation(line: 17, column: 3, scope: !4)
!27 = !DILocation(line: 17, column: 22, scope: !4)
!28 = !DILocation(line: 18, column: 3, scope: !4)
!29 = !DILocation(line: 18, column: 22, scope: !4)
!30 = !DILocation(line: 20, column: 3, scope: !4)
!31 = !DILocation(line: 20, column: 22, scope: !4)
!32 = !DILocation(line: 21, column: 3, scope: !4)
!33 = !DILocation(line: 21, column: 23, scope: !4)
!34 = !DILocation(line: 23, column: 3, scope: !4)
!35 = !DILocation(line: 23, column: 22, scope: !4)
!36 = !DILocation(line: 24, column: 3, scope: !4)
!37 = !DILocation(line: 24, column: 22, scope: !4)
!38 = !DILocation(line: 25, column: 3, scope: !4)
!39 = !DILocation(line: 25, column: 22, scope: !4)
!40 = !DILocation(line: 27, column: 3, scope: !4)
!41 = !DILocation(line: 27, column: 22, scope: !4)
!42 = !DILocation(line: 28, column: 3, scope: !4)
!43 = !DILocation(line: 28, column: 22, scope: !4)
!44 = !DILocation(line: 30, column: 3, scope: !4)
!45 = !DILocation(line: 30, column: 22, scope: !4)
!46 = !DILocation(line: 31, column: 3, scope: !4)
!47 = !DILocation(line: 31, column: 22, scope: !4)
!48 = !DILocation(line: 33, column: 3, scope: !4)
!49 = !DILocation(line: 33, column: 23, scope: !4)
!50 = !DILocation(line: 34, column: 3, scope: !4)
!51 = !DILocation(line: 34, column: 23, scope: !4)
!52 = !DILocation(line: 35, column: 3, scope: !4)
!53 = !DILocation(line: 35, column: 22, scope: !4)
!54 = !DILocation(line: 37, column: 3, scope: !4)
!55 = !DILocation(line: 38, column: 5, scope: !56)
!56 = distinct !DILexicalBlock(scope: !4, file: !3, line: 37, column: 17)
!57 = !DILocation(line: 40, column: 5, scope: !58)
!58 = distinct !DILexicalBlock(scope: !4, file: !3, line: 39, column: 10)
!59 = !DILocation(line: 42, column: 3, scope: !4)
