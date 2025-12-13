; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@ga = global [4 x i32] [i32 1, i32 2, i32 3, i32 0]
@gb = global [2 x i32] [i32 10, i32 20]
@gc = global [3 x i32] zeroinitializer
@0 = private unnamed_addr constant [31 x i8] c"31.array_1d_brace_init.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"31.array_1d_brace_init.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %lc = alloca [2 x i32], align 4
    #dbg_declare(ptr %lc, !8, !DIExpression(), !12)
  %lb = alloca [3 x i32], align 4
    #dbg_declare(ptr %lb, !13, !DIExpression(), !17)
  %la = alloca [4 x i32], align 4
    #dbg_declare(ptr %la, !18, !DIExpression(), !22)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !23, !DIExpression(), !24)
  store i32 0, ptr %err, align 4, !dbg !24
  %0 = getelementptr [4 x i32], ptr %la, i32 0, i32 0, !dbg !22
  store i32 1, ptr %0, align 4, !dbg !22
  %1 = getelementptr [4 x i32], ptr %la, i32 0, i32 1, !dbg !22
  store i32 2, ptr %1, align 4, !dbg !22
  %2 = getelementptr [4 x i32], ptr %la, i32 0, i32 2, !dbg !22
  store i32 3, ptr %2, align 4, !dbg !22
  %3 = getelementptr [4 x i32], ptr %la, i32 0, i32 3, !dbg !22
  store i32 0, ptr %3, align 4, !dbg !22
  %4 = getelementptr [3 x i32], ptr %lb, i32 0, i32 0, !dbg !17
  store i32 4, ptr %4, align 4, !dbg !17
  %5 = getelementptr [3 x i32], ptr %lb, i32 0, i32 1, !dbg !17
  store i32 5, ptr %5, align 4, !dbg !17
  %6 = getelementptr [3 x i32], ptr %lb, i32 0, i32 2, !dbg !17
  store i32 6, ptr %6, align 4, !dbg !17
  %7 = getelementptr [2 x i32], ptr %lc, i32 0, i32 0, !dbg !12
  store i32 0, ptr %7, align 4, !dbg !12
  %8 = getelementptr [2 x i32], ptr %lc, i32 0, i32 1, !dbg !12
  store i32 0, ptr %8, align 4, !dbg !12
  %9 = getelementptr i32, ptr %la, i32 0, !dbg !25
  %10 = load i32, ptr %9, align 4, !dbg !25
  %11 = icmp ne i32 %10, 1, !dbg !25
  br i1 %11, label %then, label %else, !dbg !25

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !26
  %12 = load i32, ptr %err, align 4, !dbg !26
  br label %if.end, !dbg !26

else:                                             ; preds = %entry
  br label %if.end, !dbg !26

if.end:                                           ; preds = %else, %then
  %13 = getelementptr i32, ptr %la, i32 1, !dbg !27
  %14 = load i32, ptr %13, align 4, !dbg !27
  %15 = icmp ne i32 %14, 2, !dbg !27
  br i1 %15, label %then1, label %else2, !dbg !27

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !28
  %16 = load i32, ptr %err, align 4, !dbg !28
  br label %if.end3, !dbg !28

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !28

if.end3:                                          ; preds = %else2, %then1
  %17 = getelementptr i32, ptr %la, i32 2, !dbg !29
  %18 = load i32, ptr %17, align 4, !dbg !29
  %19 = icmp ne i32 %18, 3, !dbg !29
  br i1 %19, label %then4, label %else5, !dbg !29

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !30
  %20 = load i32, ptr %err, align 4, !dbg !30
  br label %if.end6, !dbg !30

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !30

if.end6:                                          ; preds = %else5, %then4
  %21 = getelementptr i32, ptr %la, i32 3, !dbg !31
  %22 = load i32, ptr %21, align 4, !dbg !31
  %23 = icmp ne i32 %22, 0, !dbg !31
  br i1 %23, label %then7, label %else8, !dbg !31

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !32
  %24 = load i32, ptr %err, align 4, !dbg !32
  br label %if.end9, !dbg !32

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !32

if.end9:                                          ; preds = %else8, %then7
  %25 = getelementptr i32, ptr %lb, i32 0, !dbg !33
  %26 = load i32, ptr %25, align 4, !dbg !33
  %27 = icmp ne i32 %26, 4, !dbg !33
  br i1 %27, label %then10, label %else11, !dbg !33

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !34
  %28 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end12, !dbg !34

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !34

if.end12:                                         ; preds = %else11, %then10
  %29 = getelementptr i32, ptr %lb, i32 1, !dbg !35
  %30 = load i32, ptr %29, align 4, !dbg !35
  %31 = icmp ne i32 %30, 5, !dbg !35
  br i1 %31, label %then13, label %else14, !dbg !35

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !36
  %32 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end15, !dbg !36

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !36

if.end15:                                         ; preds = %else14, %then13
  %33 = getelementptr i32, ptr %lb, i32 2, !dbg !37
  %34 = load i32, ptr %33, align 4, !dbg !37
  %35 = icmp ne i32 %34, 6, !dbg !37
  br i1 %35, label %then16, label %else17, !dbg !37

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !38
  %36 = load i32, ptr %err, align 4, !dbg !38
  br label %if.end18, !dbg !38

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !38

if.end18:                                         ; preds = %else17, %then16
  %37 = getelementptr i32, ptr %lc, i32 0, !dbg !39
  %38 = load i32, ptr %37, align 4, !dbg !39
  %39 = icmp ne i32 %38, 0, !dbg !39
  br i1 %39, label %then19, label %else20, !dbg !39

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !40
  %40 = load i32, ptr %err, align 4, !dbg !40
  br label %if.end21, !dbg !40

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !40

if.end21:                                         ; preds = %else20, %then19
  %41 = getelementptr i32, ptr %lc, i32 1, !dbg !41
  %42 = load i32, ptr %41, align 4, !dbg !41
  %43 = icmp ne i32 %42, 0, !dbg !41
  br i1 %43, label %then22, label %else23, !dbg !41

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !42
  %44 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end24, !dbg !42

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !42

if.end24:                                         ; preds = %else23, %then22
  %45 = load i32, ptr @ga, align 4, !dbg !43
  %46 = icmp ne i32 %45, 1, !dbg !43
  br i1 %46, label %then25, label %else26, !dbg !43

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !44
  %47 = load i32, ptr %err, align 4, !dbg !44
  br label %if.end27, !dbg !44

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !44

if.end27:                                         ; preds = %else26, %then25
  %48 = load i32, ptr getelementptr (i32, ptr @ga, i32 1), align 4, !dbg !45
  %49 = icmp ne i32 %48, 2, !dbg !45
  br i1 %49, label %then28, label %else29, !dbg !45

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !46
  %50 = load i32, ptr %err, align 4, !dbg !46
  br label %if.end30, !dbg !46

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !46

if.end30:                                         ; preds = %else29, %then28
  %51 = load i32, ptr getelementptr (i32, ptr @ga, i32 2), align 4, !dbg !47
  %52 = icmp ne i32 %51, 3, !dbg !47
  br i1 %52, label %then31, label %else32, !dbg !47

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !48
  %53 = load i32, ptr %err, align 4, !dbg !48
  br label %if.end33, !dbg !48

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !48

if.end33:                                         ; preds = %else32, %then31
  %54 = load i32, ptr getelementptr (i32, ptr @ga, i32 3), align 4, !dbg !49
  %55 = icmp ne i32 %54, 0, !dbg !49
  br i1 %55, label %then34, label %else35, !dbg !49

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !50
  %56 = load i32, ptr %err, align 4, !dbg !50
  br label %if.end36, !dbg !50

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !50

if.end36:                                         ; preds = %else35, %then34
  %57 = load i32, ptr @gb, align 4, !dbg !51
  %58 = icmp ne i32 %57, 10, !dbg !51
  br i1 %58, label %then37, label %else38, !dbg !51

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !52
  %59 = load i32, ptr %err, align 4, !dbg !52
  br label %if.end39, !dbg !52

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !52

if.end39:                                         ; preds = %else38, %then37
  %60 = load i32, ptr getelementptr (i32, ptr @gb, i32 1), align 4, !dbg !53
  %61 = icmp ne i32 %60, 20, !dbg !53
  br i1 %61, label %then40, label %else41, !dbg !53

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !54
  %62 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end42, !dbg !54

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !54

if.end42:                                         ; preds = %else41, %then40
  %63 = load i32, ptr @gc, align 4, !dbg !55
  %64 = icmp ne i32 %63, 0, !dbg !55
  br i1 %64, label %then43, label %else44, !dbg !55

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4, !dbg !56
  %65 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end45, !dbg !56

else44:                                           ; preds = %if.end42
  br label %if.end45, !dbg !56

if.end45:                                         ; preds = %else44, %then43
  %66 = load i32, ptr getelementptr (i32, ptr @gc, i32 1), align 4, !dbg !57
  %67 = icmp ne i32 %66, 0, !dbg !57
  br i1 %67, label %then46, label %else47, !dbg !57

then46:                                           ; preds = %if.end45
  store i32 1, ptr %err, align 4, !dbg !58
  %68 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end48, !dbg !58

else47:                                           ; preds = %if.end45
  br label %if.end48, !dbg !58

if.end48:                                         ; preds = %else47, %then46
  %69 = load i32, ptr getelementptr (i32, ptr @gc, i32 2), align 4, !dbg !59
  %70 = icmp ne i32 %69, 0, !dbg !59
  br i1 %70, label %then49, label %else50, !dbg !59

then49:                                           ; preds = %if.end48
  store i32 1, ptr %err, align 4, !dbg !60
  %71 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end51, !dbg !60

else50:                                           ; preds = %if.end48
  br label %if.end51, !dbg !60

if.end51:                                         ; preds = %else50, %then49
  %72 = load i32, ptr %err, align 4, !dbg !61
  %73 = icmp eq i32 %72, 0, !dbg !61
  br i1 %73, label %then52, label %else53, !dbg !61

then52:                                           ; preds = %if.end51
  %74 = call i32 (ptr, ...) @printf(ptr @0), !dbg !62
  br label %if.end54, !dbg !62

else53:                                           ; preds = %if.end51
  %75 = call i32 (ptr, ...) @printf(ptr @1), !dbg !64
  br label %if.end54, !dbg !64

if.end54:                                         ; preds = %else53, %then52
  %76 = load i32, ptr %err, align 4, !dbg !66
  ret i32 %76, !dbg !66
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "31.array_1d_brace_init.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 12, type: !5, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "lc", scope: !4, file: !3, line: 16, type: !9)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 64, align: 32, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 2, lowerBound: 0)
!12 = !DILocation(line: 16, column: 3, scope: !4)
!13 = !DILocalVariable(name: "lb", scope: !4, file: !3, line: 15, type: !14)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 96, align: 32, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 3, lowerBound: 0)
!17 = !DILocation(line: 15, column: 3, scope: !4)
!18 = !DILocalVariable(name: "la", scope: !4, file: !3, line: 14, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 128, align: 32, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 4, lowerBound: 0)
!22 = !DILocation(line: 14, column: 3, scope: !4)
!23 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 13, type: !7)
!24 = !DILocation(line: 13, column: 3, scope: !4)
!25 = !DILocation(line: 18, column: 3, scope: !4)
!26 = !DILocation(line: 18, column: 19, scope: !4)
!27 = !DILocation(line: 19, column: 3, scope: !4)
!28 = !DILocation(line: 19, column: 19, scope: !4)
!29 = !DILocation(line: 20, column: 3, scope: !4)
!30 = !DILocation(line: 20, column: 19, scope: !4)
!31 = !DILocation(line: 21, column: 3, scope: !4)
!32 = !DILocation(line: 21, column: 19, scope: !4)
!33 = !DILocation(line: 23, column: 3, scope: !4)
!34 = !DILocation(line: 23, column: 19, scope: !4)
!35 = !DILocation(line: 24, column: 3, scope: !4)
!36 = !DILocation(line: 24, column: 19, scope: !4)
!37 = !DILocation(line: 25, column: 3, scope: !4)
!38 = !DILocation(line: 25, column: 19, scope: !4)
!39 = !DILocation(line: 27, column: 3, scope: !4)
!40 = !DILocation(line: 27, column: 19, scope: !4)
!41 = !DILocation(line: 28, column: 3, scope: !4)
!42 = !DILocation(line: 28, column: 19, scope: !4)
!43 = !DILocation(line: 30, column: 3, scope: !4)
!44 = !DILocation(line: 30, column: 19, scope: !4)
!45 = !DILocation(line: 31, column: 3, scope: !4)
!46 = !DILocation(line: 31, column: 19, scope: !4)
!47 = !DILocation(line: 32, column: 3, scope: !4)
!48 = !DILocation(line: 32, column: 19, scope: !4)
!49 = !DILocation(line: 33, column: 3, scope: !4)
!50 = !DILocation(line: 33, column: 19, scope: !4)
!51 = !DILocation(line: 35, column: 3, scope: !4)
!52 = !DILocation(line: 35, column: 20, scope: !4)
!53 = !DILocation(line: 36, column: 3, scope: !4)
!54 = !DILocation(line: 36, column: 20, scope: !4)
!55 = !DILocation(line: 38, column: 3, scope: !4)
!56 = !DILocation(line: 38, column: 19, scope: !4)
!57 = !DILocation(line: 39, column: 3, scope: !4)
!58 = !DILocation(line: 39, column: 19, scope: !4)
!59 = !DILocation(line: 40, column: 3, scope: !4)
!60 = !DILocation(line: 40, column: 19, scope: !4)
!61 = !DILocation(line: 42, column: 3, scope: !4)
!62 = !DILocation(line: 43, column: 5, scope: !63)
!63 = distinct !DILexicalBlock(scope: !4, file: !3, line: 42, column: 17)
!64 = !DILocation(line: 45, column: 5, scope: !65)
!65 = distinct !DILexicalBlock(scope: !4, file: !3, line: 44, column: 10)
!66 = !DILocation(line: 47, column: 3, scope: !4)
