; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@gc = global i8 97
@gi = global i32 1024
@0 = private unnamed_addr constant [23 x i8] c"5.pointer_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [23 x i8] c"5.pointer_type.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %pgi = alloca i32*, align 8
  %pgc = alloca i8*, align 8
  %pi = alloca i32*, align 8
  %pc = alloca i8*, align 8
  %i = alloca i32, align 4
  %c = alloca i8, align 1
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  store i8 65, i8* %c, align 1, !dbg !7
  store i32 128, i32* %i, align 4, !dbg !7
  store i8* %c, i8** %pc, align 8, !dbg !7
  store i32* %i, i32** %pi, align 8, !dbg !7
  %0 = load i8*, i8** %pc, align 8, !dbg !7
  store i8 66, i8* %0, align 1, !dbg !7
  %1 = load i8, i8* %0, align 1, !dbg !7
  %2 = load i32*, i32** %pi, align 8, !dbg !7
  store i32 256, i32* %2, align 4, !dbg !7
  %3 = load i32, i32* %2, align 4, !dbg !7
  store i8* @gc, i8** %pgc, align 8, !dbg !7
  store i32* @gi, i32** %pgi, align 8, !dbg !7
  %4 = load i8*, i8** %pgc, align 8, !dbg !7
  store i8 98, i8* %4, align 1, !dbg !7
  %5 = load i8, i8* %4, align 1, !dbg !7
  %6 = load i32*, i32** %pgi, align 8, !dbg !7
  store i32 2048, i32* %6, align 4, !dbg !7
  %7 = load i32, i32* %6, align 4, !dbg !7
  %8 = load i8, i8* %c, align 1, !dbg !7
  %9 = sext i8 %8 to i32, !dbg !7
  %10 = icmp ne i32 %9, 66, !dbg !7
  br i1 %10, label %then, label %if.end, !dbg !7

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !7
  %11 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end, !dbg !7

if.end:                                           ; preds = %entry, %then
  %12 = load i8*, i8** %pc, align 8, !dbg !7
  %13 = load i8, i8* %12, align 1, !dbg !7
  %14 = sext i8 %13 to i32, !dbg !7
  %15 = icmp ne i32 %14, 66, !dbg !7
  br i1 %15, label %then1, label %if.end3, !dbg !7

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !7
  %16 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end3, !dbg !7

if.end3:                                          ; preds = %if.end, %then1
  %17 = load i32, i32* %i, align 4, !dbg !7
  %18 = icmp ne i32 %17, 256, !dbg !7
  br i1 %18, label %then4, label %if.end6, !dbg !7

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !7
  %19 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end6, !dbg !7

if.end6:                                          ; preds = %if.end3, %then4
  %20 = load i32*, i32** %pi, align 8, !dbg !7
  %21 = load i32, i32* %20, align 4, !dbg !7
  %22 = icmp ne i32 %21, 256, !dbg !7
  br i1 %22, label %then7, label %if.end9, !dbg !7

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !7
  %23 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end9, !dbg !7

if.end9:                                          ; preds = %if.end6, %then7
  %24 = load i8, i8* @gc, align 1, !dbg !7
  %25 = sext i8 %24 to i32, !dbg !7
  %26 = icmp ne i32 %25, 98, !dbg !7
  br i1 %26, label %then10, label %if.end12, !dbg !7

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !7
  %27 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end12, !dbg !7

if.end12:                                         ; preds = %if.end9, %then10
  %28 = load i32, i32* @gi, align 4, !dbg !7
  %29 = icmp ne i32 %28, 2048, !dbg !7
  br i1 %29, label %then13, label %if.end15, !dbg !7

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !7
  %30 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end15, !dbg !7

if.end15:                                         ; preds = %if.end12, %then13
  %31 = load i32*, i32** %pi, align 8, !dbg !7
  store i32 0, i32* %31, align 4, !dbg !7
  %32 = load i32, i32* %31, align 4, !dbg !7
  %33 = load i32, i32* %i, align 4, !dbg !7
  %34 = icmp ne i32 %33, 0, !dbg !7
  br i1 %34, label %then16, label %if.end18, !dbg !7

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !7
  %35 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end18, !dbg !7

if.end18:                                         ; preds = %if.end15, %then16
  %36 = load i32, i32* %err, align 4, !dbg !7
  %37 = icmp eq i32 %36, 0, !dbg !7
  %. = select i1 %37, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @1, i32 0, i32 0), !dbg !7
  %38 = call i32 (i8*, ...) @printf(i8* %.), !dbg !7
  %39 = load i32, i32* %err, align 4, !dbg !7
  ret i32 %39, !dbg !7
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "5.pointer_type.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
