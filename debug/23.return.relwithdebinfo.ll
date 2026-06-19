; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [18 x i8] c"23.return.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [18 x i8] c"23.return.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @checkAge1(i32 %0) !dbg !2 {
entry:
  %age = alloca i32, align 4
  store i32 %0, i32* %age, align 4, !dbg !7
  %1 = load i32, i32* %age, align 4, !dbg !7
  %2 = icmp slt i32 %1, 18, !dbg !7
  %3 = load i32, i32* %age, align 4, !dbg !7
  %4 = icmp eq i32 %3, 18, !dbg !7
  %5 = load i32, i32* %age, align 4, !dbg !7
  %6 = load i32, i32* %age, align 4, !dbg !7
  %spec.select = select i1 %4, i32 %5, i32 %6, !dbg !7
  %common.ret.op = select i1 %2, i32 %3, i32 %spec.select, !dbg !7
  ret i32 %common.ret.op, !dbg !7
}

define i32 @checkAge2(i32 %0) !dbg !8 {
entry:
  %age = alloca i32, align 4
  store i32 %0, i32* %age, align 4, !dbg !9
  %1 = load i32, i32* %age, align 4, !dbg !9
  %2 = icmp slt i32 %1, 18, !dbg !9
  %3 = load i32, i32* %age, align 4, !dbg !9
  %4 = load i32, i32* %age, align 4
  %spec.select = select i1 %2, i32 %3, i32 %4, !dbg !9
  ret i32 %spec.select, !dbg !9
}

define i32 @checkAge3(i32 %0) !dbg !10 {
entry:
  %age = alloca i32, align 4
  store i32 %0, i32* %age, align 4, !dbg !11
  %1 = load i32, i32* %age, align 4, !dbg !11
  %2 = icmp sle i32 %1, 6, !dbg !11
  %3 = load i32, i32* %age, align 4, !dbg !11
  br i1 %2, label %common.ret, label %else, !dbg !11

common.ret:                                       ; preds = %else2, %else, %entry
  %common.ret.op = phi i32 [ %3, %entry ], [ %8, %else ], [ %spec.select, %else2 ]
  ret i32 %common.ret.op, !dbg !11

else:                                             ; preds = %entry
  %4 = icmp sgt i32 %3, 6, !dbg !11
  %5 = load i32, i32* %age, align 4, !dbg !11
  %6 = icmp sle i32 %5, 14, !dbg !11
  %7 = select i1 %4, i1 %6, i1 false, !dbg !11
  %8 = load i32, i32* %age, align 4, !dbg !11
  br i1 %7, label %common.ret, label %else2, !dbg !11

else2:                                            ; preds = %else
  %9 = icmp sgt i32 %8, 14, !dbg !11
  %10 = load i32, i32* %age, align 4, !dbg !11
  %11 = icmp sle i32 %10, 18, !dbg !11
  %12 = select i1 %9, i1 %11, i1 false, !dbg !11
  %13 = load i32, i32* %age, align 4, !dbg !11
  %14 = load i32, i32* %age, align 4
  %spec.select = select i1 %12, i32 %13, i32 %14, !dbg !11
  br label %common.ret, !dbg !11
}

define i32 @main() !dbg !12 {
entry:
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !15
  %0 = call i32 @checkAge1(i32 16), !dbg !15
  %1 = icmp ne i32 %0, 16, !dbg !15
  br i1 %1, label %then, label %if.end, !dbg !15

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !15
  %2 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end, !dbg !15

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @checkAge1(i32 18), !dbg !15
  %4 = icmp ne i32 %3, 18, !dbg !15
  br i1 %4, label %then1, label %if.end3, !dbg !15

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !15
  %5 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end3, !dbg !15

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @checkAge1(i32 20), !dbg !15
  %7 = icmp ne i32 %6, 20, !dbg !15
  br i1 %7, label %then4, label %if.end6, !dbg !15

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !15
  %8 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end6, !dbg !15

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @checkAge2(i32 16), !dbg !15
  %10 = icmp ne i32 %9, 16, !dbg !15
  br i1 %10, label %then7, label %if.end9, !dbg !15

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !15
  %11 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end9, !dbg !15

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @checkAge2(i32 18), !dbg !15
  %13 = icmp ne i32 %12, 18, !dbg !15
  br i1 %13, label %then10, label %if.end12, !dbg !15

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !15
  %14 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end12, !dbg !15

if.end12:                                         ; preds = %if.end9, %then10
  %15 = call i32 @checkAge2(i32 20), !dbg !15
  %16 = icmp ne i32 %15, 20, !dbg !15
  br i1 %16, label %then13, label %if.end15, !dbg !15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !15
  %17 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end15, !dbg !15

if.end15:                                         ; preds = %if.end12, %then13
  %18 = call i32 @checkAge3(i32 6), !dbg !15
  %19 = icmp ne i32 %18, 6, !dbg !15
  br i1 %19, label %then16, label %if.end18, !dbg !15

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !15
  %20 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end18, !dbg !15

if.end18:                                         ; preds = %if.end15, %then16
  %21 = call i32 @checkAge3(i32 35), !dbg !15
  %22 = icmp ne i32 %21, 35, !dbg !15
  br i1 %22, label %then19, label %if.end21, !dbg !15

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !15
  %23 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end21, !dbg !15

if.end21:                                         ; preds = %if.end18, %then19
  %24 = load i32, i32* %err, align 4, !dbg !15
  %25 = icmp eq i32 %24, 0, !dbg !15
  %. = select i1 %25, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @1, i32 0, i32 0), !dbg !15
  %26 = call i32 (i8*, ...) @printf(i8* %.), !dbg !15
  %27 = load i32, i32* %err, align 4, !dbg !15
  ret i32 %27, !dbg !15
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "23.return.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "checkAge1", linkageName: "checkAge1", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
!8 = distinct !DISubprogram(name: "checkAge2", linkageName: "checkAge2", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!9 = !DILocation(line: 1, column: 1, scope: !8)
!10 = distinct !DISubprogram(name: "checkAge3", linkageName: "checkAge3", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!11 = !DILocation(line: 1, column: 1, scope: !10)
!12 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !13, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!13 = !DISubroutineType(types: !14)
!14 = !{!5}
!15 = !DILocation(line: 1, column: 1, scope: !12)
