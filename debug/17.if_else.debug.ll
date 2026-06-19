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
  call void @llvm.dbg.declare(metadata i32* %flags, metadata !7, metadata !DIExpression()), !dbg !8
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !9, metadata !DIExpression()), !dbg !10
  store i32 %0, i32* %n, align 4, !dbg !10
  store i32 0, i32* %flags, align 4, !dbg !8
  %1 = load i32, i32* %n, align 4, !dbg !11
  %2 = icmp slt i32 %1, 0, !dbg !11
  br i1 %2, label %then, label %if.end, !dbg !11

then:                                             ; preds = %entry
  %3 = load i32, i32* %flags, align 4, !dbg !12
  %4 = add i32 %3, 1, !dbg !12
  store i32 %4, i32* %flags, align 4, !dbg !12
  %5 = load i32, i32* %flags, align 4, !dbg !12
  br label %if.end, !dbg !12

if.end:                                           ; preds = %entry, %then
  %6 = load i32, i32* %n, align 4, !dbg !13
  %7 = icmp eq i32 %6, 0, !dbg !13
  %8 = load i32, i32* %flags, align 4, !dbg !14
  br i1 %7, label %then1, label %else2, !dbg !13

then1:                                            ; preds = %if.end
  %9 = add i32 %8, 2, !dbg !15
  store i32 %9, i32* %flags, align 4, !dbg !15
  %10 = load i32, i32* %flags, align 4, !dbg !15
  br label %if.end3, !dbg !15

else2:                                            ; preds = %if.end
  %11 = add i32 %8, 4, !dbg !16
  store i32 %11, i32* %flags, align 4, !dbg !16
  %12 = load i32, i32* %flags, align 4, !dbg !16
  br label %if.end3, !dbg !16

if.end3:                                          ; preds = %else2, %then1
  %13 = load i32, i32* %n, align 4, !dbg !17
  %14 = icmp sgt i32 %13, 10, !dbg !17
  br i1 %14, label %then4, label %if.end6, !dbg !17

then4:                                            ; preds = %if.end3
  %15 = load i32, i32* %flags, align 4, !dbg !18
  %16 = add i32 %15, 8, !dbg !18
  store i32 %16, i32* %flags, align 4, !dbg !18
  %17 = load i32, i32* %flags, align 4, !dbg !18
  br label %if.end6, !dbg !18

if.end6:                                          ; preds = %if.end3, %then4
  %18 = load i32, i32* %flags, align 4, !dbg !19
  ret i32 %18, !dbg !19
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @signBucket(i32 %0) !dbg !20 {
entry:
  %bucket = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %bucket, metadata !21, metadata !DIExpression()), !dbg !22
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 %0, i32* %n, align 4, !dbg !24
  %1 = load i32, i32* %n, align 4, !dbg !25
  %2 = icmp slt i32 %1, 0, !dbg !25
  br i1 %2, label %then, label %else, !dbg !25

then:                                             ; preds = %entry
  store i32 1, i32* %bucket, align 4, !dbg !26
  %3 = load i32, i32* %bucket, align 4, !dbg !26
  br label %if.end3, !dbg !26

else:                                             ; preds = %entry
  %4 = load i32, i32* %n, align 4, !dbg !27
  %5 = icmp eq i32 %4, 0, !dbg !27
  br i1 %5, label %then1, label %else2, !dbg !27

then1:                                            ; preds = %else
  store i32 2, i32* %bucket, align 4, !dbg !28
  %6 = load i32, i32* %bucket, align 4, !dbg !28
  br label %if.end3, !dbg !28

else2:                                            ; preds = %else
  store i32 3, i32* %bucket, align 4, !dbg !29
  %7 = load i32, i32* %bucket, align 4, !dbg !29
  br label %if.end3, !dbg !29

if.end3:                                          ; preds = %then1, %else2, %then
  %8 = load i32, i32* %bucket, align 4, !dbg !30
  ret i32 %8, !dbg !30
}

define i32 @decadeBucket(i32 %0) !dbg !31 {
entry:
  %bucket = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %bucket, metadata !32, metadata !DIExpression()), !dbg !33
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !34, metadata !DIExpression()), !dbg !35
  store i32 %0, i32* %n, align 4, !dbg !35
  %1 = load i32, i32* %n, align 4, !dbg !36
  %2 = icmp sle i32 %1, 9, !dbg !36
  br i1 %2, label %then, label %else, !dbg !36

then:                                             ; preds = %entry
  store i32 0, i32* %bucket, align 4, !dbg !37
  %3 = load i32, i32* %bucket, align 4, !dbg !37
  br label %if.end6, !dbg !37

else:                                             ; preds = %entry
  %4 = load i32, i32* %n, align 4, !dbg !38
  %5 = icmp sle i32 %4, 19, !dbg !38
  br i1 %5, label %then1, label %else2, !dbg !38

then1:                                            ; preds = %else
  store i32 1, i32* %bucket, align 4, !dbg !39
  %6 = load i32, i32* %bucket, align 4, !dbg !39
  br label %if.end6, !dbg !39

else2:                                            ; preds = %else
  %7 = load i32, i32* %n, align 4, !dbg !40
  %8 = icmp sle i32 %7, 29, !dbg !40
  br i1 %8, label %then3, label %else4, !dbg !40

then3:                                            ; preds = %else2
  store i32 2, i32* %bucket, align 4, !dbg !41
  %9 = load i32, i32* %bucket, align 4, !dbg !41
  br label %if.end6, !dbg !41

else4:                                            ; preds = %else2
  store i32 3, i32* %bucket, align 4, !dbg !42
  %10 = load i32, i32* %bucket, align 4, !dbg !42
  br label %if.end6, !dbg !42

if.end6:                                          ; preds = %then1, %else4, %then3, %then
  %11 = load i32, i32* %bucket, align 4, !dbg !43
  ret i32 %11, !dbg !43
}

define i32 @main() !dbg !44 {
entry:
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !47, metadata !DIExpression()), !dbg !48
  store i32 0, i32* %err, align 4, !dbg !48
  %0 = call i32 @accumulateFlags(i32 -5), !dbg !49
  %1 = icmp ne i32 %0, 5, !dbg !49
  br i1 %1, label %then, label %if.end, !dbg !49

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !50
  %2 = load i32, i32* %err, align 4, !dbg !50
  br label %if.end, !dbg !50

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @accumulateFlags(i32 0), !dbg !51
  %4 = icmp ne i32 %3, 2, !dbg !51
  br i1 %4, label %then1, label %if.end3, !dbg !51

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !52
  %5 = load i32, i32* %err, align 4, !dbg !52
  br label %if.end3, !dbg !52

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @accumulateFlags(i32 5), !dbg !53
  %7 = icmp ne i32 %6, 4, !dbg !53
  br i1 %7, label %then4, label %if.end6, !dbg !53

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !54
  %8 = load i32, i32* %err, align 4, !dbg !54
  br label %if.end6, !dbg !54

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @accumulateFlags(i32 15), !dbg !55
  %10 = icmp ne i32 %9, 12, !dbg !55
  br i1 %10, label %then7, label %if.end9, !dbg !55

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !56
  %11 = load i32, i32* %err, align 4, !dbg !56
  br label %if.end9, !dbg !56

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @signBucket(i32 -1), !dbg !57
  %13 = icmp ne i32 %12, 1, !dbg !57
  br i1 %13, label %then10, label %if.end12, !dbg !57

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !58
  %14 = load i32, i32* %err, align 4, !dbg !58
  br label %if.end12, !dbg !58

if.end12:                                         ; preds = %if.end9, %then10
  %15 = call i32 @signBucket(i32 0), !dbg !59
  %16 = icmp ne i32 %15, 2, !dbg !59
  br i1 %16, label %then13, label %if.end15, !dbg !59

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !60
  %17 = load i32, i32* %err, align 4, !dbg !60
  br label %if.end15, !dbg !60

if.end15:                                         ; preds = %if.end12, %then13
  %18 = call i32 @signBucket(i32 7), !dbg !61
  %19 = icmp ne i32 %18, 3, !dbg !61
  br i1 %19, label %then16, label %if.end18, !dbg !61

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !62
  %20 = load i32, i32* %err, align 4, !dbg !62
  br label %if.end18, !dbg !62

if.end18:                                         ; preds = %if.end15, %then16
  %21 = call i32 @decadeBucket(i32 5), !dbg !63
  %22 = icmp ne i32 %21, 0, !dbg !63
  br i1 %22, label %then19, label %if.end21, !dbg !63

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !64
  %23 = load i32, i32* %err, align 4, !dbg !64
  br label %if.end21, !dbg !64

if.end21:                                         ; preds = %if.end18, %then19
  %24 = call i32 @decadeBucket(i32 15), !dbg !65
  %25 = icmp ne i32 %24, 1, !dbg !65
  br i1 %25, label %then22, label %if.end24, !dbg !65

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !66
  %26 = load i32, i32* %err, align 4, !dbg !66
  br label %if.end24, !dbg !66

if.end24:                                         ; preds = %if.end21, %then22
  %27 = call i32 @decadeBucket(i32 25), !dbg !67
  %28 = icmp ne i32 %27, 2, !dbg !67
  br i1 %28, label %then25, label %if.end27, !dbg !67

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !68
  %29 = load i32, i32* %err, align 4, !dbg !68
  br label %if.end27, !dbg !68

if.end27:                                         ; preds = %if.end24, %then25
  %30 = call i32 @decadeBucket(i32 35), !dbg !69
  %31 = icmp ne i32 %30, 3, !dbg !69
  br i1 %31, label %then28, label %if.end30, !dbg !69

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !70
  %32 = load i32, i32* %err, align 4, !dbg !70
  br label %if.end30, !dbg !70

if.end30:                                         ; preds = %if.end27, %then28
  %33 = load i32, i32* %err, align 4, !dbg !71
  %34 = icmp eq i32 %33, 0, !dbg !71
  %. = select i1 %34, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @1, i32 0, i32 0), !dbg !72
  %35 = call i32 (i8*, ...) @printf(i8* %.), !dbg !72
  %36 = load i32, i32* %err, align 4, !dbg !73
  ret i32 %36, !dbg !73
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "17.if_else.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "accumulateFlags", linkageName: "accumulateFlags", scope: null, file: !1, line: 4, type: !3, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "flags", scope: !2, file: !1, line: 5, type: !5)
!8 = !DILocation(line: 5, column: 3, scope: !2)
!9 = !DILocalVariable(name: "n", arg: 1, scope: !2, file: !1, line: 4, type: !5)
!10 = !DILocation(line: 4, column: 5, scope: !2)
!11 = !DILocation(line: 6, column: 3, scope: !2)
!12 = !DILocation(line: 7, column: 5, scope: !2)
!13 = !DILocation(line: 9, column: 3, scope: !2)
!14 = !DILocation(line: 0, scope: !2)
!15 = !DILocation(line: 10, column: 5, scope: !2)
!16 = !DILocation(line: 12, column: 5, scope: !2)
!17 = !DILocation(line: 14, column: 3, scope: !2)
!18 = !DILocation(line: 15, column: 5, scope: !2)
!19 = !DILocation(line: 17, column: 3, scope: !2)
!20 = distinct !DISubprogram(name: "signBucket", linkageName: "signBucket", scope: null, file: !1, line: 21, type: !3, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!21 = !DILocalVariable(name: "bucket", scope: !20, file: !1, line: 22, type: !5)
!22 = !DILocation(line: 22, column: 3, scope: !20)
!23 = !DILocalVariable(name: "n", arg: 1, scope: !20, file: !1, line: 21, type: !5)
!24 = !DILocation(line: 21, column: 5, scope: !20)
!25 = !DILocation(line: 23, column: 3, scope: !20)
!26 = !DILocation(line: 24, column: 5, scope: !20)
!27 = !DILocation(line: 25, column: 10, scope: !20)
!28 = !DILocation(line: 26, column: 5, scope: !20)
!29 = !DILocation(line: 28, column: 5, scope: !20)
!30 = !DILocation(line: 30, column: 3, scope: !20)
!31 = distinct !DISubprogram(name: "decadeBucket", linkageName: "decadeBucket", scope: null, file: !1, line: 34, type: !3, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!32 = !DILocalVariable(name: "bucket", scope: !31, file: !1, line: 35, type: !5)
!33 = !DILocation(line: 35, column: 3, scope: !31)
!34 = !DILocalVariable(name: "n", arg: 1, scope: !31, file: !1, line: 34, type: !5)
!35 = !DILocation(line: 34, column: 5, scope: !31)
!36 = !DILocation(line: 36, column: 3, scope: !31)
!37 = !DILocation(line: 37, column: 5, scope: !31)
!38 = !DILocation(line: 38, column: 10, scope: !31)
!39 = !DILocation(line: 39, column: 5, scope: !31)
!40 = !DILocation(line: 40, column: 10, scope: !31)
!41 = !DILocation(line: 41, column: 5, scope: !31)
!42 = !DILocation(line: 43, column: 5, scope: !31)
!43 = !DILocation(line: 45, column: 3, scope: !31)
!44 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 48, type: !45, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!45 = !DISubroutineType(types: !46)
!46 = !{!5}
!47 = !DILocalVariable(name: "err", scope: !44, file: !1, line: 49, type: !5)
!48 = !DILocation(line: 49, column: 3, scope: !44)
!49 = !DILocation(line: 51, column: 3, scope: !44)
!50 = !DILocation(line: 51, column: 33, scope: !44)
!51 = !DILocation(line: 52, column: 3, scope: !44)
!52 = !DILocation(line: 52, column: 32, scope: !44)
!53 = !DILocation(line: 53, column: 3, scope: !44)
!54 = !DILocation(line: 53, column: 32, scope: !44)
!55 = !DILocation(line: 54, column: 3, scope: !44)
!56 = !DILocation(line: 54, column: 34, scope: !44)
!57 = !DILocation(line: 56, column: 3, scope: !44)
!58 = !DILocation(line: 56, column: 28, scope: !44)
!59 = !DILocation(line: 57, column: 3, scope: !44)
!60 = !DILocation(line: 57, column: 27, scope: !44)
!61 = !DILocation(line: 58, column: 3, scope: !44)
!62 = !DILocation(line: 58, column: 27, scope: !44)
!63 = !DILocation(line: 60, column: 3, scope: !44)
!64 = !DILocation(line: 60, column: 29, scope: !44)
!65 = !DILocation(line: 61, column: 3, scope: !44)
!66 = !DILocation(line: 61, column: 30, scope: !44)
!67 = !DILocation(line: 62, column: 3, scope: !44)
!68 = !DILocation(line: 62, column: 30, scope: !44)
!69 = !DILocation(line: 63, column: 3, scope: !44)
!70 = !DILocation(line: 63, column: 30, scope: !44)
!71 = !DILocation(line: 65, column: 3, scope: !44)
!72 = !DILocation(line: 0, scope: !44)
!73 = !DILocation(line: 70, column: 3, scope: !44)
