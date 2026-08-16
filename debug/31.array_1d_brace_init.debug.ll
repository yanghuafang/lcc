; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@ga = global [4 x i32] [i32 1, i32 2, i32 3, i32 0]
@gb = global [2 x i32] [i32 10, i32 20]
@0 = private unnamed_addr constant [31 x i8] c"31.array_1d_brace_init.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"31.array_1d_brace_init.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %lc = alloca [2 x i32], align 4
    #dbg_declare(ptr %lc, !9, !DIExpression(), !13)
  %lb = alloca [3 x i32], align 4
    #dbg_declare(ptr %lb, !14, !DIExpression(), !18)
  %la = alloca [4 x i32], align 4
    #dbg_declare(ptr %la, !19, !DIExpression(), !23)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !24, !DIExpression(), !25)
  store i32 0, ptr %err, align 4, !dbg !25
  %0 = getelementptr [4 x i32], ptr %la, i32 0, i32 0, !dbg !23
  store i32 1, ptr %0, align 4, !dbg !23
  %1 = getelementptr [4 x i32], ptr %la, i32 0, i32 1, !dbg !23
  store i32 2, ptr %1, align 4, !dbg !23
  %2 = getelementptr [4 x i32], ptr %la, i32 0, i32 2, !dbg !23
  store i32 3, ptr %2, align 4, !dbg !23
  %3 = getelementptr [4 x i32], ptr %la, i32 0, i32 3, !dbg !23
  store i32 0, ptr %3, align 4, !dbg !23
  %4 = getelementptr [3 x i32], ptr %lb, i32 0, i32 0, !dbg !18
  store i32 4, ptr %4, align 4, !dbg !18
  %5 = getelementptr [3 x i32], ptr %lb, i32 0, i32 1, !dbg !18
  store i32 5, ptr %5, align 4, !dbg !18
  %6 = getelementptr [3 x i32], ptr %lb, i32 0, i32 2, !dbg !18
  store i32 6, ptr %6, align 4, !dbg !18
  %7 = getelementptr [2 x i32], ptr %lc, i32 0, i32 0, !dbg !13
  store i32 0, ptr %7, align 4, !dbg !13
  %8 = getelementptr [2 x i32], ptr %lc, i32 0, i32 1, !dbg !13
  store i32 0, ptr %8, align 4, !dbg !13
  %9 = getelementptr i32, ptr %la, i32 0, !dbg !26
  %10 = load i32, ptr %9, align 4, !dbg !26
  %11 = icmp ne i32 %10, 1, !dbg !26
  br i1 %11, label %then, label %else, !dbg !26

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !27
  %12 = load i32, ptr %err, align 4, !dbg !27
  br label %if.end, !dbg !27

else:                                             ; preds = %entry
  br label %if.end, !dbg !27

if.end:                                           ; preds = %else, %then
  %13 = getelementptr i32, ptr %la, i32 1, !dbg !28
  %14 = load i32, ptr %13, align 4, !dbg !28
  %15 = icmp ne i32 %14, 2, !dbg !28
  br i1 %15, label %then1, label %else2, !dbg !28

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !29
  %16 = load i32, ptr %err, align 4, !dbg !29
  br label %if.end3, !dbg !29

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !29

if.end3:                                          ; preds = %else2, %then1
  %17 = getelementptr i32, ptr %la, i32 2, !dbg !30
  %18 = load i32, ptr %17, align 4, !dbg !30
  %19 = icmp ne i32 %18, 3, !dbg !30
  br i1 %19, label %then4, label %else5, !dbg !30

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !31
  %20 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end6, !dbg !31

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !31

if.end6:                                          ; preds = %else5, %then4
  %21 = getelementptr i32, ptr %la, i32 3, !dbg !32
  %22 = load i32, ptr %21, align 4, !dbg !32
  %23 = icmp ne i32 %22, 0, !dbg !32
  br i1 %23, label %then7, label %else8, !dbg !32

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !33
  %24 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end9, !dbg !33

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !33

if.end9:                                          ; preds = %else8, %then7
  %25 = getelementptr i32, ptr %lb, i32 0, !dbg !34
  %26 = load i32, ptr %25, align 4, !dbg !34
  %27 = icmp ne i32 %26, 4, !dbg !34
  br i1 %27, label %then10, label %else11, !dbg !34

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !35
  %28 = load i32, ptr %err, align 4, !dbg !35
  br label %if.end12, !dbg !35

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !35

if.end12:                                         ; preds = %else11, %then10
  %29 = getelementptr i32, ptr %lb, i32 1, !dbg !36
  %30 = load i32, ptr %29, align 4, !dbg !36
  %31 = icmp ne i32 %30, 5, !dbg !36
  br i1 %31, label %then13, label %else14, !dbg !36

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !37
  %32 = load i32, ptr %err, align 4, !dbg !37
  br label %if.end15, !dbg !37

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !37

if.end15:                                         ; preds = %else14, %then13
  %33 = getelementptr i32, ptr %lb, i32 2, !dbg !38
  %34 = load i32, ptr %33, align 4, !dbg !38
  %35 = icmp ne i32 %34, 6, !dbg !38
  br i1 %35, label %then16, label %else17, !dbg !38

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !39
  %36 = load i32, ptr %err, align 4, !dbg !39
  br label %if.end18, !dbg !39

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !39

if.end18:                                         ; preds = %else17, %then16
  %37 = getelementptr i32, ptr %lc, i32 0, !dbg !40
  %38 = load i32, ptr %37, align 4, !dbg !40
  %39 = icmp ne i32 %38, 0, !dbg !40
  br i1 %39, label %then19, label %else20, !dbg !40

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !41
  %40 = load i32, ptr %err, align 4, !dbg !41
  br label %if.end21, !dbg !41

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !41

if.end21:                                         ; preds = %else20, %then19
  %41 = getelementptr i32, ptr %lc, i32 1, !dbg !42
  %42 = load i32, ptr %41, align 4, !dbg !42
  %43 = icmp ne i32 %42, 0, !dbg !42
  br i1 %43, label %then22, label %else23, !dbg !42

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !43
  %44 = load i32, ptr %err, align 4, !dbg !43
  br label %if.end24, !dbg !43

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !43

if.end24:                                         ; preds = %else23, %then22
  %45 = load i32, ptr @ga, align 4, !dbg !44
  %46 = icmp ne i32 %45, 1, !dbg !44
  br i1 %46, label %then25, label %else26, !dbg !44

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !45
  %47 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end27, !dbg !45

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !45

if.end27:                                         ; preds = %else26, %then25
  %48 = load i32, ptr getelementptr (i32, ptr @ga, i32 1), align 4, !dbg !46
  %49 = icmp ne i32 %48, 2, !dbg !46
  br i1 %49, label %then28, label %else29, !dbg !46

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !47
  %50 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end30, !dbg !47

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !47

if.end30:                                         ; preds = %else29, %then28
  %51 = load i32, ptr getelementptr (i32, ptr @ga, i32 2), align 4, !dbg !48
  %52 = icmp ne i32 %51, 3, !dbg !48
  br i1 %52, label %then31, label %else32, !dbg !48

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !49
  %53 = load i32, ptr %err, align 4, !dbg !49
  br label %if.end33, !dbg !49

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !49

if.end33:                                         ; preds = %else32, %then31
  %54 = load i32, ptr getelementptr (i32, ptr @ga, i32 3), align 4, !dbg !50
  %55 = icmp ne i32 %54, 0, !dbg !50
  br i1 %55, label %then34, label %else35, !dbg !50

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !51
  %56 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end36, !dbg !51

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !51

if.end36:                                         ; preds = %else35, %then34
  %57 = load i32, ptr @gb, align 4, !dbg !52
  %58 = icmp ne i32 %57, 10, !dbg !52
  br i1 %58, label %then37, label %else38, !dbg !52

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !53
  %59 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end39, !dbg !53

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !53

if.end39:                                         ; preds = %else38, %then37
  %60 = load i32, ptr getelementptr (i32, ptr @gb, i32 1), align 4, !dbg !54
  %61 = icmp ne i32 %60, 20, !dbg !54
  br i1 %61, label %then40, label %else41, !dbg !54

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !55
  %62 = load i32, ptr %err, align 4, !dbg !55
  br label %if.end42, !dbg !55

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !55

if.end42:                                         ; preds = %else41, %then40
  %63 = load i32, ptr %err, align 4, !dbg !56
  %64 = icmp eq i32 %63, 0, !dbg !56
  br i1 %64, label %then43, label %else44, !dbg !56

then43:                                           ; preds = %if.end42
  %65 = call i32 (ptr, ...) @printf(ptr @0), !dbg !57
  br label %if.end45, !dbg !57

else44:                                           ; preds = %if.end42
  %66 = call i32 (ptr, ...) @printf(ptr @1), !dbg !59
  br label %if.end45, !dbg !59

if.end45:                                         ; preds = %else44, %then43
  %67 = load i32, ptr %err, align 4, !dbg !61
  ret i32 %67, !dbg !61
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "31.array_1d_brace_init.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 9, type: !5, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "lc", scope: !4, file: !1, line: 13, type: !10)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 64, align: 32, elements: !11)
!11 = !{!12}
!12 = !DISubrange(count: 2, lowerBound: 0)
!13 = !DILocation(line: 13, column: 3, scope: !4)
!14 = !DILocalVariable(name: "lb", scope: !4, file: !1, line: 12, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 96, align: 32, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 3, lowerBound: 0)
!18 = !DILocation(line: 12, column: 3, scope: !4)
!19 = !DILocalVariable(name: "la", scope: !4, file: !1, line: 11, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 128, align: 32, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 4, lowerBound: 0)
!23 = !DILocation(line: 11, column: 3, scope: !4)
!24 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 10, type: !7)
!25 = !DILocation(line: 10, column: 3, scope: !4)
!26 = !DILocation(line: 15, column: 3, scope: !4)
!27 = !DILocation(line: 15, column: 19, scope: !4)
!28 = !DILocation(line: 16, column: 3, scope: !4)
!29 = !DILocation(line: 16, column: 19, scope: !4)
!30 = !DILocation(line: 17, column: 3, scope: !4)
!31 = !DILocation(line: 17, column: 19, scope: !4)
!32 = !DILocation(line: 18, column: 3, scope: !4)
!33 = !DILocation(line: 18, column: 19, scope: !4)
!34 = !DILocation(line: 20, column: 3, scope: !4)
!35 = !DILocation(line: 20, column: 19, scope: !4)
!36 = !DILocation(line: 21, column: 3, scope: !4)
!37 = !DILocation(line: 21, column: 19, scope: !4)
!38 = !DILocation(line: 22, column: 3, scope: !4)
!39 = !DILocation(line: 22, column: 19, scope: !4)
!40 = !DILocation(line: 24, column: 3, scope: !4)
!41 = !DILocation(line: 24, column: 19, scope: !4)
!42 = !DILocation(line: 25, column: 3, scope: !4)
!43 = !DILocation(line: 25, column: 19, scope: !4)
!44 = !DILocation(line: 27, column: 3, scope: !4)
!45 = !DILocation(line: 27, column: 19, scope: !4)
!46 = !DILocation(line: 28, column: 3, scope: !4)
!47 = !DILocation(line: 28, column: 19, scope: !4)
!48 = !DILocation(line: 29, column: 3, scope: !4)
!49 = !DILocation(line: 29, column: 19, scope: !4)
!50 = !DILocation(line: 30, column: 3, scope: !4)
!51 = !DILocation(line: 30, column: 19, scope: !4)
!52 = !DILocation(line: 32, column: 3, scope: !4)
!53 = !DILocation(line: 32, column: 20, scope: !4)
!54 = !DILocation(line: 33, column: 3, scope: !4)
!55 = !DILocation(line: 33, column: 20, scope: !4)
!56 = !DILocation(line: 35, column: 3, scope: !4)
!57 = !DILocation(line: 36, column: 5, scope: !58)
!58 = distinct !DILexicalBlock(scope: !4, file: !1, line: 35, column: 17)
!59 = !DILocation(line: 38, column: 5, scope: !60)
!60 = distinct !DILexicalBlock(scope: !4, file: !1, line: 37, column: 10)
!61 = !DILocation(line: 40, column: 3, scope: !4)
