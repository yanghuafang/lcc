; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@ga = global [2 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 4, i32 5, i32 6]]
@gb = global [2 x [3 x i32]] [[3 x i32] [i32 0, i32 1, i32 2], [3 x i32] [i32 3, i32 4, i32 5]]
@gc = global [2 x [2 x i32]] [[2 x i32] [i32 10, i32 11], [2 x i32] [i32 20, i32 0]]
@0 = private unnamed_addr constant [31 x i8] c"34.array_2d_brace_init.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"34.array_2d_brace_init.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %lc = alloca [2 x [3 x i32]], align 4
    #dbg_declare(ptr %lc, !9, !DIExpression(), !16)
  %lb = alloca [2 x [3 x i32]], align 4
    #dbg_declare(ptr %lb, !17, !DIExpression(), !18)
  %la = alloca [2 x [3 x i32]], align 4
    #dbg_declare(ptr %la, !19, !DIExpression(), !20)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !21, !DIExpression(), !22)
  store i32 0, ptr %err, align 4, !dbg !22
  %0 = bitcast ptr %la to ptr, !dbg !20
  store i32 1, ptr %0, align 4, !dbg !20
  %1 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 0, i32 1, !dbg !20
  store i32 2, ptr %1, align 4, !dbg !20
  %2 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 0, i32 2, !dbg !20
  store i32 0, ptr %2, align 4, !dbg !20
  %3 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 1, i32 0, !dbg !20
  store i32 3, ptr %3, align 4, !dbg !20
  %4 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 1, i32 1, !dbg !20
  store i32 0, ptr %4, align 4, !dbg !20
  %5 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 1, i32 2, !dbg !20
  store i32 0, ptr %5, align 4, !dbg !20
  %6 = bitcast ptr %lb to ptr, !dbg !18
  store i32 7, ptr %6, align 4, !dbg !18
  %7 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 0, i32 1, !dbg !18
  store i32 8, ptr %7, align 4, !dbg !18
  %8 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 0, i32 2, !dbg !18
  store i32 9, ptr %8, align 4, !dbg !18
  %9 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 1, i32 0, !dbg !18
  store i32 10, ptr %9, align 4, !dbg !18
  %10 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 1, i32 1, !dbg !18
  store i32 11, ptr %10, align 4, !dbg !18
  %11 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 1, i32 2, !dbg !18
  store i32 12, ptr %11, align 4, !dbg !18
  %12 = bitcast ptr %lc to ptr, !dbg !16
  store i32 1, ptr %12, align 4, !dbg !16
  %13 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 0, i32 1, !dbg !16
  store i32 2, ptr %13, align 4, !dbg !16
  %14 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 0, i32 2, !dbg !16
  store i32 3, ptr %14, align 4, !dbg !16
  %15 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 1, i32 0, !dbg !16
  store i32 4, ptr %15, align 4, !dbg !16
  %16 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 1, i32 1, !dbg !16
  store i32 0, ptr %16, align 4, !dbg !16
  %17 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 1, i32 2, !dbg !16
  store i32 0, ptr %17, align 4, !dbg !16
  %18 = bitcast ptr %la to ptr, !dbg !23
  %19 = bitcast ptr %18 to ptr, !dbg !23
  %20 = load i32, ptr %19, align 4, !dbg !23
  %21 = icmp ne i32 %20, 1, !dbg !23
  br i1 %21, label %then, label %if.end, !dbg !23

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !24
  %22 = load i32, ptr %err, align 4, !dbg !24
  br label %if.end, !dbg !24

if.end:                                           ; preds = %entry, %then
  %23 = bitcast ptr %la to ptr, !dbg !25
  %24 = getelementptr i32, ptr %23, i32 2, !dbg !25
  %25 = load i32, ptr %24, align 4, !dbg !25
  %26 = icmp ne i32 %25, 0, !dbg !25
  br i1 %26, label %then1, label %if.end3, !dbg !25

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !26
  %27 = load i32, ptr %err, align 4, !dbg !26
  br label %if.end3, !dbg !26

if.end3:                                          ; preds = %if.end, %then1
  %28 = getelementptr [3 x i32], ptr %la, i32 1, !dbg !27
  %29 = bitcast ptr %28 to ptr, !dbg !27
  %30 = load i32, ptr %29, align 4, !dbg !27
  %31 = icmp ne i32 %30, 3, !dbg !27
  br i1 %31, label %then4, label %if.end6, !dbg !27

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !28
  %32 = load i32, ptr %err, align 4, !dbg !28
  br label %if.end6, !dbg !28

if.end6:                                          ; preds = %if.end3, %then4
  %33 = getelementptr [3 x i32], ptr %la, i32 1, !dbg !29
  %34 = getelementptr i32, ptr %33, i32 2, !dbg !29
  %35 = load i32, ptr %34, align 4, !dbg !29
  %36 = icmp ne i32 %35, 0, !dbg !29
  br i1 %36, label %then7, label %if.end9, !dbg !29

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !30
  %37 = load i32, ptr %err, align 4, !dbg !30
  br label %if.end9, !dbg !30

if.end9:                                          ; preds = %if.end6, %then7
  %38 = bitcast ptr %lb to ptr, !dbg !31
  %39 = bitcast ptr %38 to ptr, !dbg !31
  %40 = load i32, ptr %39, align 4, !dbg !31
  %41 = icmp ne i32 %40, 7, !dbg !31
  br i1 %41, label %then10, label %if.end12, !dbg !31

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !32
  %42 = load i32, ptr %err, align 4, !dbg !32
  br label %if.end12, !dbg !32

if.end12:                                         ; preds = %if.end9, %then10
  %43 = getelementptr [3 x i32], ptr %lb, i32 1, !dbg !33
  %44 = getelementptr i32, ptr %43, i32 2, !dbg !33
  %45 = load i32, ptr %44, align 4, !dbg !33
  %46 = icmp ne i32 %45, 12, !dbg !33
  br i1 %46, label %then13, label %if.end15, !dbg !33

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !34
  %47 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end15, !dbg !34

if.end15:                                         ; preds = %if.end12, %then13
  %48 = bitcast ptr %lc to ptr, !dbg !35
  %49 = getelementptr i32, ptr %48, i32 2, !dbg !35
  %50 = load i32, ptr %49, align 4, !dbg !35
  %51 = icmp ne i32 %50, 3, !dbg !35
  br i1 %51, label %then16, label %if.end18, !dbg !35

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !36
  %52 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end18, !dbg !36

if.end18:                                         ; preds = %if.end15, %then16
  %53 = getelementptr [3 x i32], ptr %lc, i32 1, !dbg !37
  %54 = bitcast ptr %53 to ptr, !dbg !37
  %55 = load i32, ptr %54, align 4, !dbg !37
  %56 = icmp ne i32 %55, 4, !dbg !37
  br i1 %56, label %then19, label %if.end21, !dbg !37

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !38
  %57 = load i32, ptr %err, align 4, !dbg !38
  br label %if.end21, !dbg !38

if.end21:                                         ; preds = %if.end18, %then19
  %58 = getelementptr [3 x i32], ptr %lc, i32 1, !dbg !39
  %59 = getelementptr i32, ptr %58, i32 2, !dbg !39
  %60 = load i32, ptr %59, align 4, !dbg !39
  %61 = icmp ne i32 %60, 0, !dbg !39
  br i1 %61, label %then22, label %if.end24, !dbg !39

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !40
  %62 = load i32, ptr %err, align 4, !dbg !40
  br label %if.end24, !dbg !40

if.end24:                                         ; preds = %if.end21, %then22
  %63 = load i32, ptr @ga, align 4, !dbg !41
  %64 = icmp ne i32 %63, 1, !dbg !41
  br i1 %64, label %then25, label %if.end27, !dbg !41

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !42
  %65 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end27, !dbg !42

if.end27:                                         ; preds = %if.end24, %then25
  %66 = load i32, ptr getelementptr (i32, ptr getelementptr ([3 x i32], ptr @ga, i32 1), i32 2), align 4, !dbg !43
  %67 = icmp ne i32 %66, 6, !dbg !43
  br i1 %67, label %then28, label %if.end30, !dbg !43

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !44
  %68 = load i32, ptr %err, align 4, !dbg !44
  br label %if.end30, !dbg !44

if.end30:                                         ; preds = %if.end27, %then28
  %69 = load i32, ptr getelementptr (i32, ptr @gb, i32 1), align 4, !dbg !45
  %70 = icmp ne i32 %69, 1, !dbg !45
  br i1 %70, label %then31, label %if.end33, !dbg !45

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !46
  %71 = load i32, ptr %err, align 4, !dbg !46
  br label %if.end33, !dbg !46

if.end33:                                         ; preds = %if.end30, %then31
  %72 = load i32, ptr getelementptr ([3 x i32], ptr @gb, i32 1), align 4, !dbg !47
  %73 = icmp ne i32 %72, 3, !dbg !47
  br i1 %73, label %then34, label %if.end36, !dbg !47

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !48
  %74 = load i32, ptr %err, align 4, !dbg !48
  br label %if.end36, !dbg !48

if.end36:                                         ; preds = %if.end33, %then34
  %75 = load i32, ptr getelementptr (i32, ptr @gc, i32 1), align 4, !dbg !49
  %76 = icmp ne i32 %75, 11, !dbg !49
  br i1 %76, label %then37, label %if.end39, !dbg !49

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !50
  %77 = load i32, ptr %err, align 4, !dbg !50
  br label %if.end39, !dbg !50

if.end39:                                         ; preds = %if.end36, %then37
  %78 = load i32, ptr getelementptr ([2 x i32], ptr @gc, i32 1), align 4, !dbg !51
  %79 = icmp ne i32 %78, 20, !dbg !51
  br i1 %79, label %then40, label %if.end42, !dbg !51

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !52
  %80 = load i32, ptr %err, align 4, !dbg !52
  br label %if.end42, !dbg !52

if.end42:                                         ; preds = %if.end39, %then40
  %81 = load i32, ptr getelementptr (i32, ptr getelementptr ([2 x i32], ptr @gc, i32 1), i32 1), align 4, !dbg !53
  %82 = icmp ne i32 %81, 0, !dbg !53
  br i1 %82, label %then43, label %if.end45, !dbg !53

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4, !dbg !54
  %83 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end45, !dbg !54

if.end45:                                         ; preds = %if.end42, %then43
  %84 = load i32, ptr %err, align 4, !dbg !55
  %85 = icmp eq i32 %84, 0, !dbg !55
  %. = select i1 %85, ptr @0, ptr @1, !dbg !56
  %86 = call i32 (ptr, ...) @printf(ptr %.), !dbg !56
  %87 = load i32, ptr %err, align 4, !dbg !57
  ret i32 %87, !dbg !57
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "34.array_2d_brace_init.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 7, type: !5, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "lc", scope: !4, file: !1, line: 11, type: !10)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 192, align: 32, elements: !14)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 96, align: 32, elements: !12)
!12 = !{!13}
!13 = !DISubrange(count: 3, lowerBound: 0)
!14 = !{!15}
!15 = !DISubrange(count: 2, lowerBound: 0)
!16 = !DILocation(line: 11, column: 3, scope: !4)
!17 = !DILocalVariable(name: "lb", scope: !4, file: !1, line: 10, type: !10)
!18 = !DILocation(line: 10, column: 3, scope: !4)
!19 = !DILocalVariable(name: "la", scope: !4, file: !1, line: 9, type: !10)
!20 = !DILocation(line: 9, column: 3, scope: !4)
!21 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 8, type: !7)
!22 = !DILocation(line: 8, column: 3, scope: !4)
!23 = !DILocation(line: 13, column: 3, scope: !4)
!24 = !DILocation(line: 13, column: 22, scope: !4)
!25 = !DILocation(line: 14, column: 3, scope: !4)
!26 = !DILocation(line: 14, column: 22, scope: !4)
!27 = !DILocation(line: 15, column: 3, scope: !4)
!28 = !DILocation(line: 15, column: 22, scope: !4)
!29 = !DILocation(line: 16, column: 3, scope: !4)
!30 = !DILocation(line: 16, column: 22, scope: !4)
!31 = !DILocation(line: 18, column: 3, scope: !4)
!32 = !DILocation(line: 18, column: 22, scope: !4)
!33 = !DILocation(line: 19, column: 3, scope: !4)
!34 = !DILocation(line: 19, column: 23, scope: !4)
!35 = !DILocation(line: 21, column: 3, scope: !4)
!36 = !DILocation(line: 21, column: 22, scope: !4)
!37 = !DILocation(line: 22, column: 3, scope: !4)
!38 = !DILocation(line: 22, column: 22, scope: !4)
!39 = !DILocation(line: 23, column: 3, scope: !4)
!40 = !DILocation(line: 23, column: 22, scope: !4)
!41 = !DILocation(line: 25, column: 3, scope: !4)
!42 = !DILocation(line: 25, column: 22, scope: !4)
!43 = !DILocation(line: 26, column: 3, scope: !4)
!44 = !DILocation(line: 26, column: 22, scope: !4)
!45 = !DILocation(line: 28, column: 3, scope: !4)
!46 = !DILocation(line: 28, column: 22, scope: !4)
!47 = !DILocation(line: 29, column: 3, scope: !4)
!48 = !DILocation(line: 29, column: 22, scope: !4)
!49 = !DILocation(line: 31, column: 3, scope: !4)
!50 = !DILocation(line: 31, column: 23, scope: !4)
!51 = !DILocation(line: 32, column: 3, scope: !4)
!52 = !DILocation(line: 32, column: 23, scope: !4)
!53 = !DILocation(line: 33, column: 3, scope: !4)
!54 = !DILocation(line: 33, column: 22, scope: !4)
!55 = !DILocation(line: 35, column: 3, scope: !4)
!56 = !DILocation(line: 0, scope: !4)
!57 = !DILocation(line: 40, column: 3, scope: !4)
