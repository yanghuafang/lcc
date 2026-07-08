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

define i32 @main() !dbg !4 {
entry:
  %lb = alloca [6 x i8], align 1
  call void @llvm.dbg.declare(metadata [6 x i8]* %lb, metadata !9, metadata !DIExpression()), !dbg !14
  %ls = alloca [6 x i8], align 1
  call void @llvm.dbg.declare(metadata [6 x i8]* %ls, metadata !15, metadata !DIExpression()), !dbg !16
  %la = alloca [3 x i32], align 4
  call void @llvm.dbg.declare(metadata [3 x i32]* %la, metadata !17, metadata !DIExpression()), !dbg !21
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 0, i32* %err, align 4, !dbg !23
  %0 = bitcast [3 x i32]* %la to i32*, !dbg !21
  store i32 1, i32* %0, align 4, !dbg !21
  %1 = getelementptr [3 x i32], [3 x i32]* %la, i32 0, i32 1, !dbg !21
  store i32 2, i32* %1, align 4, !dbg !21
  %2 = getelementptr [3 x i32], [3 x i32]* %la, i32 0, i32 2, !dbg !21
  store i32 3, i32* %2, align 4, !dbg !21
  %3 = bitcast [6 x i8]* %ls to i8*, !dbg !16
  store i8 104, i8* %3, align 1, !dbg !16
  %4 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 1, !dbg !16
  store i8 101, i8* %4, align 1, !dbg !16
  %5 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 2, !dbg !16
  store i8 108, i8* %5, align 1, !dbg !16
  %6 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 3, !dbg !16
  store i8 108, i8* %6, align 1, !dbg !16
  %7 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 4, !dbg !16
  store i8 111, i8* %7, align 1, !dbg !16
  %8 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 5, !dbg !16
  store i8 0, i8* %8, align 1, !dbg !16
  %9 = bitcast [6 x i8]* %lb to i8*, !dbg !14
  store i8 104, i8* %9, align 1, !dbg !14
  %10 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 1, !dbg !14
  store i8 101, i8* %10, align 1, !dbg !14
  %11 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 2, !dbg !14
  store i8 108, i8* %11, align 1, !dbg !14
  %12 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 3, !dbg !14
  store i8 108, i8* %12, align 1, !dbg !14
  %13 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 4, !dbg !14
  store i8 111, i8* %13, align 1, !dbg !14
  %14 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 5, !dbg !14
  store i8 0, i8* %14, align 1, !dbg !14
  %15 = bitcast [3 x i32]* %la to i32*, !dbg !24
  %16 = bitcast i32* %15 to i32*, !dbg !24
  %17 = load i32, i32* %16, align 4, !dbg !24
  %18 = icmp ne i32 %17, 1, !dbg !24
  br i1 %18, label %then, label %if.end, !dbg !24

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !25
  %19 = load i32, i32* %err, align 4, !dbg !25
  br label %if.end, !dbg !25

if.end:                                           ; preds = %entry, %then
  %20 = bitcast [3 x i32]* %la to i32*, !dbg !26
  %21 = getelementptr i32, i32* %20, i32 1, !dbg !26
  %22 = load i32, i32* %21, align 4, !dbg !26
  %23 = icmp ne i32 %22, 2, !dbg !26
  br i1 %23, label %then1, label %if.end3, !dbg !26

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !27
  %24 = load i32, i32* %err, align 4, !dbg !27
  br label %if.end3, !dbg !27

if.end3:                                          ; preds = %if.end, %then1
  %25 = bitcast [3 x i32]* %la to i32*, !dbg !28
  %26 = getelementptr i32, i32* %25, i32 2, !dbg !28
  %27 = load i32, i32* %26, align 4, !dbg !28
  %28 = icmp ne i32 %27, 3, !dbg !28
  br i1 %28, label %then4, label %if.end6, !dbg !28

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !29
  %29 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end6, !dbg !29

if.end6:                                          ; preds = %if.end3, %then4
  %30 = bitcast [6 x i8]* %ls to i8*, !dbg !30
  %31 = bitcast i8* %30 to i8*, !dbg !30
  %32 = load i8, i8* %31, align 1, !dbg !30
  %33 = sext i8 %32 to i32, !dbg !30
  %34 = icmp ne i32 %33, 104, !dbg !30
  br i1 %34, label %then7, label %if.end9, !dbg !30

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !31
  %35 = load i32, i32* %err, align 4, !dbg !31
  br label %if.end9, !dbg !31

if.end9:                                          ; preds = %if.end6, %then7
  %36 = bitcast [6 x i8]* %ls to i8*, !dbg !32
  %37 = getelementptr i8, i8* %36, i32 1, !dbg !32
  %38 = load i8, i8* %37, align 1, !dbg !32
  %39 = sext i8 %38 to i32, !dbg !32
  %40 = icmp ne i32 %39, 101, !dbg !32
  br i1 %40, label %then10, label %if.end12, !dbg !32

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !33
  %41 = load i32, i32* %err, align 4, !dbg !33
  br label %if.end12, !dbg !33

if.end12:                                         ; preds = %if.end9, %then10
  %42 = bitcast [6 x i8]* %ls to i8*, !dbg !34
  %43 = getelementptr i8, i8* %42, i32 2, !dbg !34
  %44 = load i8, i8* %43, align 1, !dbg !34
  %45 = sext i8 %44 to i32, !dbg !34
  %46 = icmp ne i32 %45, 108, !dbg !34
  br i1 %46, label %then13, label %if.end15, !dbg !34

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !35
  %47 = load i32, i32* %err, align 4, !dbg !35
  br label %if.end15, !dbg !35

if.end15:                                         ; preds = %if.end12, %then13
  %48 = bitcast [6 x i8]* %ls to i8*, !dbg !36
  %49 = getelementptr i8, i8* %48, i32 3, !dbg !36
  %50 = load i8, i8* %49, align 1, !dbg !36
  %51 = sext i8 %50 to i32, !dbg !36
  %52 = icmp ne i32 %51, 108, !dbg !36
  br i1 %52, label %then16, label %if.end18, !dbg !36

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !37
  %53 = load i32, i32* %err, align 4, !dbg !37
  br label %if.end18, !dbg !37

if.end18:                                         ; preds = %if.end15, %then16
  %54 = bitcast [6 x i8]* %ls to i8*, !dbg !38
  %55 = getelementptr i8, i8* %54, i32 4, !dbg !38
  %56 = load i8, i8* %55, align 1, !dbg !38
  %57 = sext i8 %56 to i32, !dbg !38
  %58 = icmp ne i32 %57, 111, !dbg !38
  br i1 %58, label %then19, label %if.end21, !dbg !38

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !39
  %59 = load i32, i32* %err, align 4, !dbg !39
  br label %if.end21, !dbg !39

if.end21:                                         ; preds = %if.end18, %then19
  %60 = bitcast [6 x i8]* %ls to i8*, !dbg !40
  %61 = getelementptr i8, i8* %60, i32 5, !dbg !40
  %62 = load i8, i8* %61, align 1, !dbg !40
  %63 = sext i8 %62 to i32, !dbg !40
  %64 = icmp ne i32 %63, 0, !dbg !40
  br i1 %64, label %then22, label %if.end24, !dbg !40

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !41
  %65 = load i32, i32* %err, align 4, !dbg !41
  br label %if.end24, !dbg !41

if.end24:                                         ; preds = %if.end21, %then22
  %66 = bitcast [6 x i8]* %lb to i8*, !dbg !42
  %67 = bitcast i8* %66 to i8*, !dbg !42
  %68 = load i8, i8* %67, align 1, !dbg !42
  %69 = sext i8 %68 to i32, !dbg !42
  %70 = icmp ne i32 %69, 104, !dbg !42
  br i1 %70, label %then25, label %if.end27, !dbg !42

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !43
  %71 = load i32, i32* %err, align 4, !dbg !43
  br label %if.end27, !dbg !43

if.end27:                                         ; preds = %if.end24, %then25
  %72 = bitcast [6 x i8]* %lb to i8*, !dbg !44
  %73 = getelementptr i8, i8* %72, i32 5, !dbg !44
  %74 = load i8, i8* %73, align 1, !dbg !44
  %75 = sext i8 %74 to i32, !dbg !44
  %76 = icmp ne i32 %75, 0, !dbg !44
  br i1 %76, label %then28, label %if.end30, !dbg !44

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !45
  %77 = load i32, i32* %err, align 4, !dbg !45
  br label %if.end30, !dbg !45

if.end30:                                         ; preds = %if.end27, %then28
  %78 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 0), align 4, !dbg !46
  %79 = icmp ne i32 %78, 10, !dbg !46
  br i1 %79, label %then31, label %if.end33, !dbg !46

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !47
  %80 = load i32, i32* %err, align 4, !dbg !47
  br label %if.end33, !dbg !47

if.end33:                                         ; preds = %if.end30, %then31
  %81 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 1), align 4, !dbg !48
  %82 = icmp ne i32 %81, 7, !dbg !48
  br i1 %82, label %then34, label %if.end36, !dbg !48

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4, !dbg !49
  %83 = load i32, i32* %err, align 4, !dbg !49
  br label %if.end36, !dbg !49

if.end36:                                         ; preds = %if.end33, %then34
  %84 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 2), align 4, !dbg !50
  %85 = icmp ne i32 %84, 8, !dbg !50
  br i1 %85, label %then37, label %if.end39, !dbg !50

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4, !dbg !51
  %86 = load i32, i32* %err, align 4, !dbg !51
  br label %if.end39, !dbg !51

if.end39:                                         ; preds = %if.end36, %then37
  %87 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 3), align 4, !dbg !52
  %88 = icmp ne i32 %87, 9, !dbg !52
  br i1 %88, label %then40, label %if.end42, !dbg !52

then40:                                           ; preds = %if.end39
  store i32 1, i32* %err, align 4, !dbg !53
  %89 = load i32, i32* %err, align 4, !dbg !53
  br label %if.end42, !dbg !53

if.end42:                                         ; preds = %if.end39, %then40
  %90 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 4), align 4, !dbg !54
  %91 = icmp ne i32 %90, 1, !dbg !54
  br i1 %91, label %then43, label %if.end45, !dbg !54

then43:                                           ; preds = %if.end42
  store i32 1, i32* %err, align 4, !dbg !55
  %92 = load i32, i32* %err, align 4, !dbg !55
  br label %if.end45, !dbg !55

if.end45:                                         ; preds = %if.end42, %then43
  %93 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 5), align 4, !dbg !56
  %94 = icmp ne i32 %93, 5, !dbg !56
  br i1 %94, label %then46, label %if.end48, !dbg !56

then46:                                           ; preds = %if.end45
  store i32 1, i32* %err, align 4, !dbg !57
  %95 = load i32, i32* %err, align 4, !dbg !57
  br label %if.end48, !dbg !57

if.end48:                                         ; preds = %if.end45, %then46
  %96 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @gs, i32 0, i32 0), align 1, !dbg !58
  %97 = sext i8 %96 to i32, !dbg !58
  %98 = icmp ne i32 %97, 104, !dbg !58
  br i1 %98, label %then49, label %if.end51, !dbg !58

then49:                                           ; preds = %if.end48
  store i32 1, i32* %err, align 4, !dbg !59
  %99 = load i32, i32* %err, align 4, !dbg !59
  br label %if.end51, !dbg !59

if.end51:                                         ; preds = %if.end48, %then49
  %100 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @gs, i32 0, i32 1), align 1, !dbg !60
  %101 = sext i8 %100 to i32, !dbg !60
  %102 = icmp ne i32 %101, 105, !dbg !60
  br i1 %102, label %then52, label %if.end54, !dbg !60

then52:                                           ; preds = %if.end51
  store i32 1, i32* %err, align 4, !dbg !61
  %103 = load i32, i32* %err, align 4, !dbg !61
  br label %if.end54, !dbg !61

if.end54:                                         ; preds = %if.end51, %then52
  %104 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @gs, i32 0, i32 2), align 1, !dbg !62
  %105 = sext i8 %104 to i32, !dbg !62
  %106 = icmp ne i32 %105, 0, !dbg !62
  br i1 %106, label %then55, label %if.end57, !dbg !62

then55:                                           ; preds = %if.end54
  store i32 1, i32* %err, align 4, !dbg !63
  %107 = load i32, i32* %err, align 4, !dbg !63
  br label %if.end57, !dbg !63

if.end57:                                         ; preds = %if.end54, %then55
  %108 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @gt, i32 0, i32 0), align 1, !dbg !64
  %109 = sext i8 %108 to i32, !dbg !64
  %110 = icmp ne i32 %109, 104, !dbg !64
  br i1 %110, label %then58, label %if.end60, !dbg !64

then58:                                           ; preds = %if.end57
  store i32 1, i32* %err, align 4, !dbg !65
  %111 = load i32, i32* %err, align 4, !dbg !65
  br label %if.end60, !dbg !65

if.end60:                                         ; preds = %if.end57, %then58
  %112 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @gt, i32 0, i32 1), align 1, !dbg !66
  %113 = sext i8 %112 to i32, !dbg !66
  %114 = icmp ne i32 %113, 101, !dbg !66
  br i1 %114, label %then61, label %if.end63, !dbg !66

then61:                                           ; preds = %if.end60
  store i32 1, i32* %err, align 4, !dbg !67
  %115 = load i32, i32* %err, align 4, !dbg !67
  br label %if.end63, !dbg !67

if.end63:                                         ; preds = %if.end60, %then61
  %116 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @gt, i32 0, i32 2), align 1, !dbg !68
  %117 = sext i8 %116 to i32, !dbg !68
  %118 = icmp ne i32 %117, 121, !dbg !68
  br i1 %118, label %then64, label %if.end66, !dbg !68

then64:                                           ; preds = %if.end63
  store i32 1, i32* %err, align 4, !dbg !69
  %119 = load i32, i32* %err, align 4, !dbg !69
  br label %if.end66, !dbg !69

if.end66:                                         ; preds = %if.end63, %then64
  %120 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @gt, i32 0, i32 3), align 1, !dbg !70
  %121 = sext i8 %120 to i32, !dbg !70
  %122 = icmp ne i32 %121, 0, !dbg !70
  br i1 %122, label %then67, label %if.end69, !dbg !70

then67:                                           ; preds = %if.end66
  store i32 1, i32* %err, align 4, !dbg !71
  %123 = load i32, i32* %err, align 4, !dbg !71
  br label %if.end69, !dbg !71

if.end69:                                         ; preds = %if.end66, %then67
  %124 = load i32, i32* %err, align 4, !dbg !72
  %125 = icmp eq i32 %124, 0, !dbg !72
  %. = select i1 %125, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([41 x i8], [41 x i8]* @1, i32 0, i32 0), !dbg !73
  %126 = call i32 (i8*, ...) @printf(i8* %.), !dbg !73
  %127 = load i32, i32* %err, align 4, !dbg !74
  ret i32 %127, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "32.array_1d_inferred_string_init.c", directory: "../tests")
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 7, type: !5, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "lb", scope: !4, file: !1, line: 11, type: !10)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 48, align: 8, elements: !12)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !{!13}
!13 = !DISubrange(count: 6, lowerBound: 0)
!14 = !DILocation(line: 11, column: 3, scope: !4)
!15 = !DILocalVariable(name: "ls", scope: !4, file: !1, line: 10, type: !10)
!16 = !DILocation(line: 10, column: 3, scope: !4)
!17 = !DILocalVariable(name: "la", scope: !4, file: !1, line: 9, type: !18)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 96, align: 32, elements: !19)
!19 = !{!20}
!20 = !DISubrange(count: 3, lowerBound: 0)
!21 = !DILocation(line: 9, column: 3, scope: !4)
!22 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 8, type: !7)
!23 = !DILocation(line: 8, column: 3, scope: !4)
!24 = !DILocation(line: 13, column: 3, scope: !4)
!25 = !DILocation(line: 13, column: 19, scope: !4)
!26 = !DILocation(line: 14, column: 3, scope: !4)
!27 = !DILocation(line: 14, column: 19, scope: !4)
!28 = !DILocation(line: 15, column: 3, scope: !4)
!29 = !DILocation(line: 15, column: 19, scope: !4)
!30 = !DILocation(line: 17, column: 3, scope: !4)
!31 = !DILocation(line: 17, column: 21, scope: !4)
!32 = !DILocation(line: 18, column: 3, scope: !4)
!33 = !DILocation(line: 18, column: 21, scope: !4)
!34 = !DILocation(line: 19, column: 3, scope: !4)
!35 = !DILocation(line: 19, column: 21, scope: !4)
!36 = !DILocation(line: 20, column: 3, scope: !4)
!37 = !DILocation(line: 20, column: 21, scope: !4)
!38 = !DILocation(line: 21, column: 3, scope: !4)
!39 = !DILocation(line: 21, column: 21, scope: !4)
!40 = !DILocation(line: 22, column: 3, scope: !4)
!41 = !DILocation(line: 22, column: 19, scope: !4)
!42 = !DILocation(line: 24, column: 3, scope: !4)
!43 = !DILocation(line: 24, column: 21, scope: !4)
!44 = !DILocation(line: 25, column: 3, scope: !4)
!45 = !DILocation(line: 25, column: 19, scope: !4)
!46 = !DILocation(line: 27, column: 3, scope: !4)
!47 = !DILocation(line: 27, column: 20, scope: !4)
!48 = !DILocation(line: 28, column: 3, scope: !4)
!49 = !DILocation(line: 28, column: 19, scope: !4)
!50 = !DILocation(line: 29, column: 3, scope: !4)
!51 = !DILocation(line: 29, column: 19, scope: !4)
!52 = !DILocation(line: 30, column: 3, scope: !4)
!53 = !DILocation(line: 30, column: 19, scope: !4)
!54 = !DILocation(line: 31, column: 3, scope: !4)
!55 = !DILocation(line: 31, column: 19, scope: !4)
!56 = !DILocation(line: 32, column: 3, scope: !4)
!57 = !DILocation(line: 32, column: 19, scope: !4)
!58 = !DILocation(line: 34, column: 3, scope: !4)
!59 = !DILocation(line: 34, column: 21, scope: !4)
!60 = !DILocation(line: 35, column: 3, scope: !4)
!61 = !DILocation(line: 35, column: 21, scope: !4)
!62 = !DILocation(line: 36, column: 3, scope: !4)
!63 = !DILocation(line: 36, column: 19, scope: !4)
!64 = !DILocation(line: 38, column: 3, scope: !4)
!65 = !DILocation(line: 38, column: 21, scope: !4)
!66 = !DILocation(line: 39, column: 3, scope: !4)
!67 = !DILocation(line: 39, column: 21, scope: !4)
!68 = !DILocation(line: 40, column: 3, scope: !4)
!69 = !DILocation(line: 40, column: 21, scope: !4)
!70 = !DILocation(line: 41, column: 3, scope: !4)
!71 = !DILocation(line: 41, column: 19, scope: !4)
!72 = !DILocation(line: 43, column: 3, scope: !4)
!73 = !DILocation(line: 0, scope: !4)
!74 = !DILocation(line: 48, column: 3, scope: !4)
