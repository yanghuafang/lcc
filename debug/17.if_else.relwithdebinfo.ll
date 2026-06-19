; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [19 x i8] c"17.if_else.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"17.if_else.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @accumulateFlags(i32 %0) !dbg !2 {
entry:
  %flags = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, i32* %n, align 4, !dbg !7
  store i32 0, i32* %flags, align 4, !dbg !7
  %1 = load i32, i32* %n, align 4, !dbg !7
  %2 = icmp slt i32 %1, 0, !dbg !7
  br i1 %2, label %then, label %if.end, !dbg !7

then:                                             ; preds = %entry
  %3 = load i32, i32* %flags, align 4, !dbg !7
  %4 = add i32 %3, 1, !dbg !7
  store i32 %4, i32* %flags, align 4, !dbg !7
  %5 = load i32, i32* %flags, align 4, !dbg !7
  br label %if.end, !dbg !7

if.end:                                           ; preds = %entry, %then
  %6 = load i32, i32* %n, align 4, !dbg !7
  %7 = icmp eq i32 %6, 0, !dbg !7
  %8 = load i32, i32* %flags, align 4, !dbg !7
  br i1 %7, label %then1, label %else2, !dbg !7

then1:                                            ; preds = %if.end
  %9 = add i32 %8, 2, !dbg !7
  store i32 %9, i32* %flags, align 4, !dbg !7
  %10 = load i32, i32* %flags, align 4, !dbg !7
  br label %if.end3, !dbg !7

else2:                                            ; preds = %if.end
  %11 = add i32 %8, 4, !dbg !7
  store i32 %11, i32* %flags, align 4, !dbg !7
  %12 = load i32, i32* %flags, align 4, !dbg !7
  br label %if.end3, !dbg !7

if.end3:                                          ; preds = %else2, %then1
  %13 = load i32, i32* %n, align 4, !dbg !7
  %14 = icmp sgt i32 %13, 10, !dbg !7
  br i1 %14, label %then4, label %if.end6, !dbg !7

then4:                                            ; preds = %if.end3
  %15 = load i32, i32* %flags, align 4, !dbg !7
  %16 = add i32 %15, 8, !dbg !7
  store i32 %16, i32* %flags, align 4, !dbg !7
  %17 = load i32, i32* %flags, align 4, !dbg !7
  br label %if.end6, !dbg !7

if.end6:                                          ; preds = %if.end3, %then4
  %18 = load i32, i32* %flags, align 4, !dbg !7
  ret i32 %18, !dbg !7
}

define i32 @signBucket(i32 %0) !dbg !8 {
entry:
  %bucket = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, i32* %n, align 4, !dbg !9
  %1 = load i32, i32* %n, align 4, !dbg !9
  %2 = icmp slt i32 %1, 0, !dbg !9
  br i1 %2, label %then, label %else, !dbg !9

then:                                             ; preds = %entry
  store i32 1, i32* %bucket, align 4, !dbg !9
  %3 = load i32, i32* %bucket, align 4, !dbg !9
  br label %if.end3, !dbg !9

else:                                             ; preds = %entry
  %4 = load i32, i32* %n, align 4, !dbg !9
  %5 = icmp eq i32 %4, 0, !dbg !9
  br i1 %5, label %then1, label %else2, !dbg !9

then1:                                            ; preds = %else
  store i32 2, i32* %bucket, align 4, !dbg !9
  %6 = load i32, i32* %bucket, align 4, !dbg !9
  br label %if.end3, !dbg !9

else2:                                            ; preds = %else
  store i32 3, i32* %bucket, align 4, !dbg !9
  %7 = load i32, i32* %bucket, align 4, !dbg !9
  br label %if.end3, !dbg !9

if.end3:                                          ; preds = %then1, %else2, %then
  %8 = load i32, i32* %bucket, align 4, !dbg !9
  ret i32 %8, !dbg !9
}

define i32 @decadeBucket(i32 %0) !dbg !10 {
entry:
  %bucket = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, i32* %n, align 4, !dbg !11
  %1 = load i32, i32* %n, align 4, !dbg !11
  %2 = icmp sle i32 %1, 9, !dbg !11
  br i1 %2, label %then, label %else, !dbg !11

then:                                             ; preds = %entry
  store i32 0, i32* %bucket, align 4, !dbg !11
  %3 = load i32, i32* %bucket, align 4, !dbg !11
  br label %if.end6, !dbg !11

else:                                             ; preds = %entry
  %4 = load i32, i32* %n, align 4, !dbg !11
  %5 = icmp sle i32 %4, 19, !dbg !11
  br i1 %5, label %then1, label %else2, !dbg !11

then1:                                            ; preds = %else
  store i32 1, i32* %bucket, align 4, !dbg !11
  %6 = load i32, i32* %bucket, align 4, !dbg !11
  br label %if.end6, !dbg !11

else2:                                            ; preds = %else
  %7 = load i32, i32* %n, align 4, !dbg !11
  %8 = icmp sle i32 %7, 29, !dbg !11
  br i1 %8, label %then3, label %else4, !dbg !11

then3:                                            ; preds = %else2
  store i32 2, i32* %bucket, align 4, !dbg !11
  %9 = load i32, i32* %bucket, align 4, !dbg !11
  br label %if.end6, !dbg !11

else4:                                            ; preds = %else2
  store i32 3, i32* %bucket, align 4, !dbg !11
  %10 = load i32, i32* %bucket, align 4, !dbg !11
  br label %if.end6, !dbg !11

if.end6:                                          ; preds = %then1, %else4, %then3, %then
  %11 = load i32, i32* %bucket, align 4, !dbg !11
  ret i32 %11, !dbg !11
}

define i32 @main() !dbg !12 {
entry:
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !15
  %0 = call i32 @accumulateFlags(i32 -5), !dbg !15
  %1 = icmp ne i32 %0, 5, !dbg !15
  br i1 %1, label %then, label %if.end, !dbg !15

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !15
  %2 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end, !dbg !15

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @accumulateFlags(i32 0), !dbg !15
  %4 = icmp ne i32 %3, 2, !dbg !15
  br i1 %4, label %then1, label %if.end3, !dbg !15

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !15
  %5 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end3, !dbg !15

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @accumulateFlags(i32 5), !dbg !15
  %7 = icmp ne i32 %6, 4, !dbg !15
  br i1 %7, label %then4, label %if.end6, !dbg !15

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !15
  %8 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end6, !dbg !15

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @accumulateFlags(i32 15), !dbg !15
  %10 = icmp ne i32 %9, 12, !dbg !15
  br i1 %10, label %then7, label %if.end9, !dbg !15

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !15
  %11 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end9, !dbg !15

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @signBucket(i32 -1), !dbg !15
  %13 = icmp ne i32 %12, 1, !dbg !15
  br i1 %13, label %then10, label %if.end12, !dbg !15

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !15
  %14 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end12, !dbg !15

if.end12:                                         ; preds = %if.end9, %then10
  %15 = call i32 @signBucket(i32 0), !dbg !15
  %16 = icmp ne i32 %15, 2, !dbg !15
  br i1 %16, label %then13, label %if.end15, !dbg !15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !15
  %17 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end15, !dbg !15

if.end15:                                         ; preds = %if.end12, %then13
  %18 = call i32 @signBucket(i32 7), !dbg !15
  %19 = icmp ne i32 %18, 3, !dbg !15
  br i1 %19, label %then16, label %if.end18, !dbg !15

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !15
  %20 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end18, !dbg !15

if.end18:                                         ; preds = %if.end15, %then16
  %21 = call i32 @decadeBucket(i32 5), !dbg !15
  %22 = icmp ne i32 %21, 0, !dbg !15
  br i1 %22, label %then19, label %if.end21, !dbg !15

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !15
  %23 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end21, !dbg !15

if.end21:                                         ; preds = %if.end18, %then19
  %24 = call i32 @decadeBucket(i32 15), !dbg !15
  %25 = icmp ne i32 %24, 1, !dbg !15
  br i1 %25, label %then22, label %if.end24, !dbg !15

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !15
  %26 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end24, !dbg !15

if.end24:                                         ; preds = %if.end21, %then22
  %27 = call i32 @decadeBucket(i32 25), !dbg !15
  %28 = icmp ne i32 %27, 2, !dbg !15
  br i1 %28, label %then25, label %if.end27, !dbg !15

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !15
  %29 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end27, !dbg !15

if.end27:                                         ; preds = %if.end24, %then25
  %30 = call i32 @decadeBucket(i32 35), !dbg !15
  %31 = icmp ne i32 %30, 3, !dbg !15
  br i1 %31, label %then28, label %if.end30, !dbg !15

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !15
  %32 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end30, !dbg !15

if.end30:                                         ; preds = %if.end27, %then28
  %33 = load i32, i32* %err, align 4, !dbg !15
  %34 = icmp eq i32 %33, 0, !dbg !15
  %. = select i1 %34, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @1, i32 0, i32 0), !dbg !15
  %35 = call i32 (i8*, ...) @printf(i8* %.), !dbg !15
  %36 = load i32, i32* %err, align 4, !dbg !15
  ret i32 %36, !dbg !15
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "17.if_else.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "accumulateFlags", linkageName: "accumulateFlags", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
!8 = distinct !DISubprogram(name: "signBucket", linkageName: "signBucket", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!9 = !DILocation(line: 1, column: 1, scope: !8)
!10 = distinct !DISubprogram(name: "decadeBucket", linkageName: "decadeBucket", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!11 = !DILocation(line: 1, column: 1, scope: !10)
!12 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !13, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!13 = !DISubroutineType(types: !14)
!14 = !{!5}
!15 = !DILocation(line: 1, column: 1, scope: !12)
