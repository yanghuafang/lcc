; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [24 x i8] c"28.pointer_move.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"28.pointer_move.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %pc = alloca i8*, align 8
  %c = alloca [4 x i8], align 1
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  %0 = bitcast [4 x i8]* %c to i8*, !dbg !7
  %1 = bitcast i8* %0 to i8*, !dbg !7
  store i8 65, i8* %1, align 1, !dbg !7
  %2 = load i8, i8* %1, align 1, !dbg !7
  %3 = bitcast [4 x i8]* %c to i8*, !dbg !7
  %4 = getelementptr i8, i8* %3, i32 1, !dbg !7
  store i8 66, i8* %4, align 1, !dbg !7
  %5 = load i8, i8* %4, align 1, !dbg !7
  %6 = bitcast [4 x i8]* %c to i8*, !dbg !7
  %7 = getelementptr i8, i8* %6, i32 2, !dbg !7
  store i8 67, i8* %7, align 1, !dbg !7
  %8 = load i8, i8* %7, align 1, !dbg !7
  %9 = bitcast [4 x i8]* %c to i8*, !dbg !7
  %10 = getelementptr i8, i8* %9, i32 3, !dbg !7
  store i8 68, i8* %10, align 1, !dbg !7
  %11 = load i8, i8* %10, align 1, !dbg !7
  %12 = bitcast [4 x i8]* %c to i8*, !dbg !7
  store i8* %12, i8** %pc, align 8, !dbg !7
  %13 = load i8*, i8** %pc, align 8, !dbg !7
  %14 = load i8, i8* %13, align 1, !dbg !7
  %15 = sext i8 %14 to i32, !dbg !7
  %16 = icmp ne i32 %15, 65, !dbg !7
  br i1 %16, label %then, label %if.end, !dbg !7

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !7
  %17 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end, !dbg !7

if.end:                                           ; preds = %entry, %then
  %18 = load i8*, i8** %pc, align 8, !dbg !7
  %19 = getelementptr i8, i8* %18, i32 1, !dbg !7
  store i8* %19, i8** %pc, align 8, !dbg !7
  %20 = load i8*, i8** %pc, align 8, !dbg !7
  %21 = load i8*, i8** %pc, align 8, !dbg !7
  %22 = load i8, i8* %21, align 1, !dbg !7
  %23 = sext i8 %22 to i32, !dbg !7
  %24 = icmp ne i32 %23, 66, !dbg !7
  br i1 %24, label %then1, label %if.end3, !dbg !7

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !7
  %25 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end3, !dbg !7

if.end3:                                          ; preds = %if.end, %then1
  %26 = load i8*, i8** %pc, align 8, !dbg !7
  %27 = getelementptr i8, i8* %26, i32 1, !dbg !7
  store i8* %27, i8** %pc, align 8, !dbg !7
  %28 = load i8*, i8** %pc, align 8, !dbg !7
  %29 = load i8*, i8** %pc, align 8, !dbg !7
  %30 = load i8, i8* %29, align 1, !dbg !7
  %31 = sext i8 %30 to i32, !dbg !7
  %32 = icmp ne i32 %31, 67, !dbg !7
  br i1 %32, label %then4, label %if.end6, !dbg !7

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !7
  %33 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end6, !dbg !7

if.end6:                                          ; preds = %if.end3, %then4
  %34 = load i8*, i8** %pc, align 8, !dbg !7
  %35 = getelementptr i8, i8* %34, i32 1, !dbg !7
  store i8* %35, i8** %pc, align 8, !dbg !7
  %36 = load i8*, i8** %pc, align 8, !dbg !7
  %37 = load i8, i8* %36, align 1, !dbg !7
  %38 = sext i8 %37 to i32, !dbg !7
  %39 = icmp ne i32 %38, 68, !dbg !7
  br i1 %39, label %then7, label %if.end9, !dbg !7

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !7
  %40 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end9, !dbg !7

if.end9:                                          ; preds = %if.end6, %then7
  %41 = bitcast [4 x i8]* %c to i8*, !dbg !7
  %42 = getelementptr i8, i8* %41, i32 3, !dbg !7
  store i8* %42, i8** %pc, align 8, !dbg !7
  %43 = load i8*, i8** %pc, align 8, !dbg !7
  %44 = load i8*, i8** %pc, align 8, !dbg !7
  %45 = load i8, i8* %44, align 1, !dbg !7
  %46 = sext i8 %45 to i32, !dbg !7
  %47 = icmp ne i32 %46, 68, !dbg !7
  br i1 %47, label %then10, label %if.end12, !dbg !7

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !7
  %48 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end12, !dbg !7

if.end12:                                         ; preds = %if.end9, %then10
  %49 = load i8*, i8** %pc, align 8, !dbg !7
  %50 = getelementptr i8, i8* %49, i32 -1, !dbg !7
  store i8* %50, i8** %pc, align 8, !dbg !7
  %51 = load i8*, i8** %pc, align 8, !dbg !7
  %52 = load i8*, i8** %pc, align 8, !dbg !7
  %53 = load i8, i8* %52, align 1, !dbg !7
  %54 = sext i8 %53 to i32, !dbg !7
  %55 = icmp ne i32 %54, 67, !dbg !7
  br i1 %55, label %then13, label %if.end15, !dbg !7

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !7
  %56 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end15, !dbg !7

if.end15:                                         ; preds = %if.end12, %then13
  %57 = load i8*, i8** %pc, align 8, !dbg !7
  %58 = getelementptr i8, i8* %57, i32 -1, !dbg !7
  store i8* %58, i8** %pc, align 8, !dbg !7
  %59 = load i8*, i8** %pc, align 8, !dbg !7
  %60 = load i8*, i8** %pc, align 8, !dbg !7
  %61 = load i8, i8* %60, align 1, !dbg !7
  %62 = sext i8 %61 to i32, !dbg !7
  %63 = icmp ne i32 %62, 66, !dbg !7
  br i1 %63, label %then16, label %if.end18, !dbg !7

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !7
  %64 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end18, !dbg !7

if.end18:                                         ; preds = %if.end15, %then16
  %65 = load i8*, i8** %pc, align 8, !dbg !7
  %66 = getelementptr i8, i8* %65, i32 -1, !dbg !7
  store i8* %66, i8** %pc, align 8, !dbg !7
  %67 = load i8*, i8** %pc, align 8, !dbg !7
  %68 = load i8, i8* %67, align 1, !dbg !7
  %69 = sext i8 %68 to i32, !dbg !7
  %70 = icmp ne i32 %69, 65, !dbg !7
  br i1 %70, label %then19, label %if.end21, !dbg !7

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !7
  %71 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end21, !dbg !7

if.end21:                                         ; preds = %if.end18, %then19
  %72 = load i32, i32* %err, align 4, !dbg !7
  %73 = icmp eq i32 %72, 0, !dbg !7
  %. = select i1 %73, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0), !dbg !7
  %74 = call i32 (i8*, ...) @printf(i8* %.), !dbg !7
  %75 = load i32, i32* %err, align 4, !dbg !7
  ret i32 %75, !dbg !7
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "28.pointer_move.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
