; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@ga = global [6 x i32] [i32 10, i32 7, i32 8, i32 9, i32 1, i32 5]
@gs = global [3 x i8] c"hi\00"
@gt = global [4 x i8] c"hey\00"
@0 = private unnamed_addr constant [41 x i8] c"32.array_1d_inferred_string_init.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [41 x i8] c"32.array_1d_inferred_string_init.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %lb = alloca [6 x i8], align 1
  call void @llvm.dbg.declare(metadata [6 x i8]* %lb, metadata !7, metadata !DIExpression()), !dbg !12
  %ls = alloca [6 x i8], align 1
  call void @llvm.dbg.declare(metadata [6 x i8]* %ls, metadata !13, metadata !DIExpression()), !dbg !14
  %la = alloca [3 x i32], align 4
  call void @llvm.dbg.declare(metadata [3 x i32]* %la, metadata !15, metadata !DIExpression()), !dbg !19
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 0, i32* %err, align 4, !dbg !21
  %0 = bitcast [3 x i32]* %la to i32*, !dbg !19
  store i32 1, i32* %0, align 4, !dbg !19
  %1 = getelementptr [3 x i32], [3 x i32]* %la, i32 0, i32 1, !dbg !19
  store i32 2, i32* %1, align 4, !dbg !19
  %2 = getelementptr [3 x i32], [3 x i32]* %la, i32 0, i32 2, !dbg !19
  store i32 3, i32* %2, align 4, !dbg !19
  %3 = bitcast [6 x i8]* %ls to i8*, !dbg !14
  store i8 104, i8* %3, align 1, !dbg !14
  %4 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 1, !dbg !14
  store i8 101, i8* %4, align 1, !dbg !14
  %5 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 2, !dbg !14
  store i8 108, i8* %5, align 1, !dbg !14
  %6 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 3, !dbg !14
  store i8 108, i8* %6, align 1, !dbg !14
  %7 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 4, !dbg !14
  store i8 111, i8* %7, align 1, !dbg !14
  %8 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 5, !dbg !14
  store i8 0, i8* %8, align 1, !dbg !14
  %9 = bitcast [6 x i8]* %lb to i8*, !dbg !12
  store i8 104, i8* %9, align 1, !dbg !12
  %10 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 1, !dbg !12
  store i8 101, i8* %10, align 1, !dbg !12
  %11 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 2, !dbg !12
  store i8 108, i8* %11, align 1, !dbg !12
  %12 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 3, !dbg !12
  store i8 108, i8* %12, align 1, !dbg !12
  %13 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 4, !dbg !12
  store i8 111, i8* %13, align 1, !dbg !12
  %14 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 5, !dbg !12
  store i8 0, i8* %14, align 1, !dbg !12
  %15 = bitcast [3 x i32]* %la to i32*, !dbg !22
  %16 = bitcast i32* %15 to i32*, !dbg !22
  %17 = load i32, i32* %16, align 4, !dbg !22
  %18 = icmp ne i32 %17, 1, !dbg !22
  br i1 %18, label %then, label %if.end, !dbg !22

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !23
  %19 = load i32, i32* %err, align 4, !dbg !23
  br label %if.end, !dbg !23

if.end:                                           ; preds = %entry, %then
  %20 = bitcast [3 x i32]* %la to i32*, !dbg !24
  %21 = getelementptr i32, i32* %20, i32 1, !dbg !24
  %22 = load i32, i32* %21, align 4, !dbg !24
  %23 = icmp ne i32 %22, 2, !dbg !24
  br i1 %23, label %then1, label %if.end3, !dbg !24

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !25
  %24 = load i32, i32* %err, align 4, !dbg !25
  br label %if.end3, !dbg !25

if.end3:                                          ; preds = %if.end, %then1
  %25 = bitcast [3 x i32]* %la to i32*, !dbg !26
  %26 = getelementptr i32, i32* %25, i32 2, !dbg !26
  %27 = load i32, i32* %26, align 4, !dbg !26
  %28 = icmp ne i32 %27, 3, !dbg !26
  br i1 %28, label %then4, label %if.end6, !dbg !26

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !27
  %29 = load i32, i32* %err, align 4, !dbg !27
  br label %if.end6, !dbg !27

if.end6:                                          ; preds = %if.end3, %then4
  %30 = bitcast [6 x i8]* %ls to i8*, !dbg !28
  %31 = bitcast i8* %30 to i8*, !dbg !28
  %32 = load i8, i8* %31, align 1, !dbg !28
  %33 = sext i8 %32 to i32, !dbg !28
  %34 = icmp ne i32 %33, 104, !dbg !28
  br i1 %34, label %then7, label %if.end9, !dbg !28

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !29
  %35 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end9, !dbg !29

if.end9:                                          ; preds = %if.end6, %then7
  %36 = bitcast [6 x i8]* %ls to i8*, !dbg !30
  %37 = getelementptr i8, i8* %36, i32 1, !dbg !30
  %38 = load i8, i8* %37, align 1, !dbg !30
  %39 = sext i8 %38 to i32, !dbg !30
  %40 = icmp ne i32 %39, 101, !dbg !30
  br i1 %40, label %then10, label %if.end12, !dbg !30

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !31
  %41 = load i32, i32* %err, align 4, !dbg !31
  br label %if.end12, !dbg !31

if.end12:                                         ; preds = %if.end9, %then10
  %42 = bitcast [6 x i8]* %ls to i8*, !dbg !32
  %43 = getelementptr i8, i8* %42, i32 2, !dbg !32
  %44 = load i8, i8* %43, align 1, !dbg !32
  %45 = sext i8 %44 to i32, !dbg !32
  %46 = icmp ne i32 %45, 108, !dbg !32
  br i1 %46, label %then13, label %if.end15, !dbg !32

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !33
  %47 = load i32, i32* %err, align 4, !dbg !33
  br label %if.end15, !dbg !33

if.end15:                                         ; preds = %if.end12, %then13
  %48 = bitcast [6 x i8]* %ls to i8*, !dbg !34
  %49 = getelementptr i8, i8* %48, i32 3, !dbg !34
  %50 = load i8, i8* %49, align 1, !dbg !34
  %51 = sext i8 %50 to i32, !dbg !34
  %52 = icmp ne i32 %51, 108, !dbg !34
  br i1 %52, label %then16, label %if.end18, !dbg !34

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !35
  %53 = load i32, i32* %err, align 4, !dbg !35
  br label %if.end18, !dbg !35

if.end18:                                         ; preds = %if.end15, %then16
  %54 = bitcast [6 x i8]* %ls to i8*, !dbg !36
  %55 = getelementptr i8, i8* %54, i32 4, !dbg !36
  %56 = load i8, i8* %55, align 1, !dbg !36
  %57 = sext i8 %56 to i32, !dbg !36
  %58 = icmp ne i32 %57, 111, !dbg !36
  br i1 %58, label %then19, label %if.end21, !dbg !36

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !37
  %59 = load i32, i32* %err, align 4, !dbg !37
  br label %if.end21, !dbg !37

if.end21:                                         ; preds = %if.end18, %then19
  %60 = bitcast [6 x i8]* %ls to i8*, !dbg !38
  %61 = getelementptr i8, i8* %60, i32 5, !dbg !38
  %62 = load i8, i8* %61, align 1, !dbg !38
  %63 = sext i8 %62 to i32, !dbg !38
  %64 = icmp ne i32 %63, 0, !dbg !38
  br i1 %64, label %then22, label %if.end24, !dbg !38

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !39
  %65 = load i32, i32* %err, align 4, !dbg !39
  br label %if.end24, !dbg !39

if.end24:                                         ; preds = %if.end21, %then22
  %66 = bitcast [6 x i8]* %lb to i8*, !dbg !40
  %67 = bitcast i8* %66 to i8*, !dbg !40
  %68 = load i8, i8* %67, align 1, !dbg !40
  %69 = sext i8 %68 to i32, !dbg !40
  %70 = icmp ne i32 %69, 104, !dbg !40
  br i1 %70, label %then25, label %if.end27, !dbg !40

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !41
  %71 = load i32, i32* %err, align 4, !dbg !41
  br label %if.end27, !dbg !41

if.end27:                                         ; preds = %if.end24, %then25
  %72 = bitcast [6 x i8]* %lb to i8*, !dbg !42
  %73 = getelementptr i8, i8* %72, i32 5, !dbg !42
  %74 = load i8, i8* %73, align 1, !dbg !42
  %75 = sext i8 %74 to i32, !dbg !42
  %76 = icmp ne i32 %75, 0, !dbg !42
  br i1 %76, label %then28, label %if.end30, !dbg !42

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !43
  %77 = load i32, i32* %err, align 4, !dbg !43
  br label %if.end30, !dbg !43

if.end30:                                         ; preds = %if.end27, %then28
  %78 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 0), align 4, !dbg !44
  %79 = icmp ne i32 %78, 10, !dbg !44
  br i1 %79, label %then31, label %if.end33, !dbg !44

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !45
  %80 = load i32, i32* %err, align 4, !dbg !45
  br label %if.end33, !dbg !45

if.end33:                                         ; preds = %if.end30, %then31
  %81 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 1), align 4, !dbg !46
  %82 = icmp ne i32 %81, 7, !dbg !46
  br i1 %82, label %then34, label %if.end36, !dbg !46

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4, !dbg !47
  %83 = load i32, i32* %err, align 4, !dbg !47
  br label %if.end36, !dbg !47

if.end36:                                         ; preds = %if.end33, %then34
  %84 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 2), align 4, !dbg !48
  %85 = icmp ne i32 %84, 8, !dbg !48
  br i1 %85, label %then37, label %if.end39, !dbg !48

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4, !dbg !49
  %86 = load i32, i32* %err, align 4, !dbg !49
  br label %if.end39, !dbg !49

if.end39:                                         ; preds = %if.end36, %then37
  %87 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 3), align 4, !dbg !50
  %88 = icmp ne i32 %87, 9, !dbg !50
  br i1 %88, label %then40, label %if.end42, !dbg !50

then40:                                           ; preds = %if.end39
  store i32 1, i32* %err, align 4, !dbg !51
  %89 = load i32, i32* %err, align 4, !dbg !51
  br label %if.end42, !dbg !51

if.end42:                                         ; preds = %if.end39, %then40
  %90 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 4), align 4, !dbg !52
  %91 = icmp ne i32 %90, 1, !dbg !52
  br i1 %91, label %then43, label %if.end45, !dbg !52

then43:                                           ; preds = %if.end42
  store i32 1, i32* %err, align 4, !dbg !53
  %92 = load i32, i32* %err, align 4, !dbg !53
  br label %if.end45, !dbg !53

if.end45:                                         ; preds = %if.end42, %then43
  %93 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 5), align 4, !dbg !54
  %94 = icmp ne i32 %93, 5, !dbg !54
  br i1 %94, label %then46, label %if.end48, !dbg !54

then46:                                           ; preds = %if.end45
  store i32 1, i32* %err, align 4, !dbg !55
  %95 = load i32, i32* %err, align 4, !dbg !55
  br label %if.end48, !dbg !55

if.end48:                                         ; preds = %if.end45, %then46
  %96 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @gs, i32 0, i32 0), align 1, !dbg !56
  %97 = sext i8 %96 to i32, !dbg !56
  %98 = icmp ne i32 %97, 104, !dbg !56
  br i1 %98, label %then49, label %if.end51, !dbg !56

then49:                                           ; preds = %if.end48
  store i32 1, i32* %err, align 4, !dbg !57
  %99 = load i32, i32* %err, align 4, !dbg !57
  br label %if.end51, !dbg !57

if.end51:                                         ; preds = %if.end48, %then49
  %100 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @gs, i32 0, i32 1), align 1, !dbg !58
  %101 = sext i8 %100 to i32, !dbg !58
  %102 = icmp ne i32 %101, 105, !dbg !58
  br i1 %102, label %then52, label %if.end54, !dbg !58

then52:                                           ; preds = %if.end51
  store i32 1, i32* %err, align 4, !dbg !59
  %103 = load i32, i32* %err, align 4, !dbg !59
  br label %if.end54, !dbg !59

if.end54:                                         ; preds = %if.end51, %then52
  %104 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @gs, i32 0, i32 2), align 1, !dbg !60
  %105 = sext i8 %104 to i32, !dbg !60
  %106 = icmp ne i32 %105, 0, !dbg !60
  br i1 %106, label %then55, label %if.end57, !dbg !60

then55:                                           ; preds = %if.end54
  store i32 1, i32* %err, align 4, !dbg !61
  %107 = load i32, i32* %err, align 4, !dbg !61
  br label %if.end57, !dbg !61

if.end57:                                         ; preds = %if.end54, %then55
  %108 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @gt, i32 0, i32 0), align 1, !dbg !62
  %109 = sext i8 %108 to i32, !dbg !62
  %110 = icmp ne i32 %109, 104, !dbg !62
  br i1 %110, label %then58, label %if.end60, !dbg !62

then58:                                           ; preds = %if.end57
  store i32 1, i32* %err, align 4, !dbg !63
  %111 = load i32, i32* %err, align 4, !dbg !63
  br label %if.end60, !dbg !63

if.end60:                                         ; preds = %if.end57, %then58
  %112 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @gt, i32 0, i32 1), align 1, !dbg !64
  %113 = sext i8 %112 to i32, !dbg !64
  %114 = icmp ne i32 %113, 101, !dbg !64
  br i1 %114, label %then61, label %if.end63, !dbg !64

then61:                                           ; preds = %if.end60
  store i32 1, i32* %err, align 4, !dbg !65
  %115 = load i32, i32* %err, align 4, !dbg !65
  br label %if.end63, !dbg !65

if.end63:                                         ; preds = %if.end60, %then61
  %116 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @gt, i32 0, i32 2), align 1, !dbg !66
  %117 = sext i8 %116 to i32, !dbg !66
  %118 = icmp ne i32 %117, 121, !dbg !66
  br i1 %118, label %then64, label %if.end66, !dbg !66

then64:                                           ; preds = %if.end63
  store i32 1, i32* %err, align 4, !dbg !67
  %119 = load i32, i32* %err, align 4, !dbg !67
  br label %if.end66, !dbg !67

if.end66:                                         ; preds = %if.end63, %then64
  %120 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @gt, i32 0, i32 3), align 1, !dbg !68
  %121 = sext i8 %120 to i32, !dbg !68
  %122 = icmp ne i32 %121, 0, !dbg !68
  br i1 %122, label %then67, label %if.end69, !dbg !68

then67:                                           ; preds = %if.end66
  store i32 1, i32* %err, align 4, !dbg !69
  %123 = load i32, i32* %err, align 4, !dbg !69
  br label %if.end69, !dbg !69

if.end69:                                         ; preds = %if.end66, %then67
  %124 = load i32, i32* %err, align 4, !dbg !70
  %125 = icmp eq i32 %124, 0, !dbg !70
  %. = select i1 %125, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([41 x i8], [41 x i8]* @1, i32 0, i32 0), !dbg !71
  %126 = call i32 (i8*, ...) @printf(i8* %.), !dbg !71
  %127 = load i32, i32* %err, align 4, !dbg !72
  ret i32 %127, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

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
!71 = !DILocation(line: 0, scope: !2)
!72 = !DILocation(line: 48, column: 3, scope: !2)
