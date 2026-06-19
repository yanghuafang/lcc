; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@gs = global [16 x i8] undef
@0 = private unnamed_addr constant [13 x i8] c"hello world!\00", align 1
@gps = global i8* getelementptr inbounds ([13 x i8], [13 x i8]* @0, i32 0, i32 0)
@gi = global [4 x i32] undef
@1 = private unnamed_addr constant [21 x i8] c"6.array_type.c PASS\0A\00", align 1
@2 = private unnamed_addr constant [21 x i8] c"6.array_type.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %i = alloca [4 x i32], align 4
  %s = alloca [16 x i8], align 1
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  %0 = bitcast [16 x i8]* %s to i8*, !dbg !7
  %1 = bitcast i8* %0 to i8*, !dbg !7
  store i8 103, i8* %1, align 1, !dbg !7
  %2 = load i8, i8* %1, align 1, !dbg !7
  %3 = bitcast [16 x i8]* %s to i8*, !dbg !7
  %4 = getelementptr i8, i8* %3, i32 1, !dbg !7
  store i8 111, i8* %4, align 1, !dbg !7
  %5 = load i8, i8* %4, align 1, !dbg !7
  %6 = bitcast [16 x i8]* %s to i8*, !dbg !7
  %7 = getelementptr i8, i8* %6, i32 2, !dbg !7
  store i8 111, i8* %7, align 1, !dbg !7
  %8 = load i8, i8* %7, align 1, !dbg !7
  %9 = bitcast [16 x i8]* %s to i8*, !dbg !7
  %10 = getelementptr i8, i8* %9, i32 3, !dbg !7
  store i8 100, i8* %10, align 1, !dbg !7
  %11 = load i8, i8* %10, align 1, !dbg !7
  %12 = bitcast [16 x i8]* %s to i8*, !dbg !7
  %13 = getelementptr i8, i8* %12, i32 4, !dbg !7
  store i8 0, i8* %13, align 1, !dbg !7
  %14 = load i8, i8* %13, align 1, !dbg !7
  store i8 108, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 0), align 1, !dbg !7
  %15 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 0), align 1, !dbg !7
  store i8 117, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 1), align 1, !dbg !7
  %16 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 1), align 1, !dbg !7
  store i8 99, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 2), align 1, !dbg !7
  %17 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 2), align 1, !dbg !7
  store i8 107, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 3), align 1, !dbg !7
  %18 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 3), align 1, !dbg !7
  store i8 121, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 4), align 1, !dbg !7
  %19 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 4), align 1, !dbg !7
  store i8 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 5), align 1, !dbg !7
  %20 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 5), align 1, !dbg !7
  %21 = bitcast [4 x i32]* %i to i32*, !dbg !7
  %22 = bitcast i32* %21 to i32*, !dbg !7
  store i32 128, i32* %22, align 4, !dbg !7
  %23 = load i32, i32* %22, align 4, !dbg !7
  %24 = bitcast [4 x i32]* %i to i32*, !dbg !7
  %25 = getelementptr i32, i32* %24, i32 1, !dbg !7
  store i32 256, i32* %25, align 4, !dbg !7
  %26 = load i32, i32* %25, align 4, !dbg !7
  store i32 1024, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 0), align 4, !dbg !7
  %27 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 0), align 4, !dbg !7
  store i32 2048, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 1), align 4, !dbg !7
  %28 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 1), align 4, !dbg !7
  %29 = bitcast [4 x i32]* %i to i32*, !dbg !7
  %30 = bitcast i32* %29 to i32*, !dbg !7
  %31 = load i32, i32* %30, align 4, !dbg !7
  %32 = icmp ne i32 %31, 128, !dbg !7
  br i1 %32, label %then, label %if.end, !dbg !7

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !7
  %33 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end, !dbg !7

if.end:                                           ; preds = %entry, %then
  %34 = bitcast [4 x i32]* %i to i32*, !dbg !7
  %35 = getelementptr i32, i32* %34, i32 1, !dbg !7
  %36 = load i32, i32* %35, align 4, !dbg !7
  %37 = icmp ne i32 %36, 256, !dbg !7
  br i1 %37, label %then1, label %if.end3, !dbg !7

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !7
  %38 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end3, !dbg !7

if.end3:                                          ; preds = %if.end, %then1
  %39 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 0), align 4, !dbg !7
  %40 = icmp ne i32 %39, 1024, !dbg !7
  br i1 %40, label %then4, label %if.end6, !dbg !7

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !7
  %41 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end6, !dbg !7

if.end6:                                          ; preds = %if.end3, %then4
  %42 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 1), align 4, !dbg !7
  %43 = icmp ne i32 %42, 2048, !dbg !7
  br i1 %43, label %then7, label %if.end9, !dbg !7

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !7
  %44 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end9, !dbg !7

if.end9:                                          ; preds = %if.end6, %then7
  %45 = bitcast [16 x i8]* %s to i8*, !dbg !7
  %46 = bitcast i8* %45 to i8*, !dbg !7
  %47 = load i8, i8* %46, align 1, !dbg !7
  %48 = sext i8 %47 to i32, !dbg !7
  %49 = icmp ne i32 %48, 103, !dbg !7
  br i1 %49, label %then10, label %if.end12, !dbg !7

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !7
  %50 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end12, !dbg !7

if.end12:                                         ; preds = %if.end9, %then10
  %51 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 0), align 1, !dbg !7
  %52 = sext i8 %51 to i32, !dbg !7
  %53 = icmp ne i32 %52, 108, !dbg !7
  br i1 %53, label %then13, label %if.end15, !dbg !7

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !7
  %54 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end15, !dbg !7

if.end15:                                         ; preds = %if.end12, %then13
  %55 = bitcast [4 x i32]* %i to i32*, !dbg !7
  %56 = getelementptr i32, i32* %55, i32 2, !dbg !7
  store i32 0, i32* %56, align 4, !dbg !7
  %57 = load i32, i32* %56, align 4, !dbg !7
  %58 = bitcast [4 x i32]* %i to i32*, !dbg !7
  %59 = getelementptr i32, i32* %58, i32 3, !dbg !7
  store i32 -1, i32* %59, align 4, !dbg !7
  %60 = load i32, i32* %59, align 4, !dbg !7
  %61 = bitcast [4 x i32]* %i to i32*, !dbg !7
  %62 = getelementptr i32, i32* %61, i32 2, !dbg !7
  %63 = load i32, i32* %62, align 4, !dbg !7
  %64 = icmp ne i32 %63, 0, !dbg !7
  br i1 %64, label %then16, label %if.end18, !dbg !7

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !7
  %65 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end18, !dbg !7

if.end18:                                         ; preds = %if.end15, %then16
  %66 = bitcast [4 x i32]* %i to i32*, !dbg !7
  %67 = getelementptr i32, i32* %66, i32 3, !dbg !7
  %68 = load i32, i32* %67, align 4, !dbg !7
  %69 = icmp ne i32 %68, -1, !dbg !7
  br i1 %69, label %then19, label %if.end21, !dbg !7

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !7
  %70 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end21, !dbg !7

if.end21:                                         ; preds = %if.end18, %then19
  %71 = load i32, i32* %err, align 4, !dbg !7
  %72 = icmp eq i32 %71, 0, !dbg !7
  %. = select i1 %72, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @1, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @2, i32 0, i32 0), !dbg !7
  %73 = call i32 (i8*, ...) @printf(i8* %.), !dbg !7
  %74 = load i32, i32* %err, align 4, !dbg !7
  ret i32 %74, !dbg !7
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "6.array_type.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
