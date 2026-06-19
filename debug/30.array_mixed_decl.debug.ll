; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [28 x i8] c"30.array_mixed_decl.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [28 x i8] c"30.array_mixed_decl.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %b = alloca i32, align 4
  %a = alloca [4 x i32], align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  %0 = bitcast [4 x i32]* %a to i32*, !dbg !7
  %1 = bitcast i32* %0 to i32*, !dbg !7
  store i32 10, i32* %1, align 4, !dbg !7
  %2 = load i32, i32* %1, align 4, !dbg !7
  %3 = bitcast [4 x i32]* %a to i32*, !dbg !7
  %4 = getelementptr i32, i32* %3, i32 1, !dbg !7
  store i32 20, i32* %4, align 4, !dbg !7
  %5 = load i32, i32* %4, align 4, !dbg !7
  store i32 30, i32* %b, align 4, !dbg !7
  %6 = load i32, i32* %b, align 4, !dbg !7
  %7 = bitcast [4 x i32]* %a to i32*, !dbg !7
  %8 = bitcast i32* %7 to i32*, !dbg !7
  %9 = load i32, i32* %8, align 4, !dbg !7
  %10 = icmp ne i32 %9, 10, !dbg !7
  br i1 %10, label %then, label %if.end, !dbg !7

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !7
  %11 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end, !dbg !7

if.end:                                           ; preds = %entry, %then
  %12 = bitcast [4 x i32]* %a to i32*, !dbg !7
  %13 = getelementptr i32, i32* %12, i32 1, !dbg !7
  %14 = load i32, i32* %13, align 4, !dbg !7
  %15 = icmp ne i32 %14, 20, !dbg !7
  br i1 %15, label %then1, label %if.end3, !dbg !7

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !7
  %16 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end3, !dbg !7

if.end3:                                          ; preds = %if.end, %then1
  %17 = load i32, i32* %b, align 4, !dbg !7
  %18 = icmp ne i32 %17, 30, !dbg !7
  br i1 %18, label %then4, label %if.end6, !dbg !7

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !7
  %19 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end6, !dbg !7

if.end6:                                          ; preds = %if.end3, %then4
  %20 = load i32, i32* %err, align 4, !dbg !7
  %21 = icmp eq i32 %20, 0, !dbg !7
  %. = select i1 %21, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @1, i32 0, i32 0), !dbg !7
  %22 = call i32 (i8*, ...) @printf(i8* %.), !dbg !7
  %23 = load i32, i32* %err, align 4, !dbg !7
  ret i32 %23, !dbg !7
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "30.array_mixed_decl.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
