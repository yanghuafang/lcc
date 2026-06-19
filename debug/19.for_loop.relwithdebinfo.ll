; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [20 x i8] c"19.for_loop.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"19.for_loop.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @countSum(i32 %0) !dbg !2 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !7, metadata !DIExpression()), !dbg !8
  %sum = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !9, metadata !DIExpression()), !dbg !10
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 %0, i32* %n, align 4, !dbg !12
  store i32 0, i32* %sum, align 4, !dbg !10
  store i32 1, i32* %i, align 4, !dbg !8
  br label %for.cond, !dbg !8

for.cond:                                         ; preds = %for.loop, %entry
  %1 = load i32, i32* %i, align 4, !dbg !8
  %2 = load i32, i32* %n, align 4, !dbg !8
  %3 = icmp sle i32 %1, %2, !dbg !8
  br i1 %3, label %for.loop, label %for.end, !dbg !8

for.loop:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !13
  %5 = load i32, i32* %sum, align 4, !dbg !13
  %6 = add i32 %5, %4, !dbg !13
  store i32 %6, i32* %sum, align 4, !dbg !13
  %7 = load i32, i32* %sum, align 4, !dbg !13
  %8 = load i32, i32* %i, align 4, !dbg !13
  %9 = add i32 %8, 1, !dbg !13
  store i32 %9, i32* %i, align 4, !dbg !13
  %10 = load i32, i32* %i, align 4, !dbg !13
  br label %for.cond, !dbg !13

for.end:                                          ; preds = %for.cond
  %11 = load i32, i32* %sum, align 4, !dbg !14
  ret i32 %11, !dbg !14
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @countSum2(i32 %0) !dbg !15 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !16, metadata !DIExpression()), !dbg !17
  %sum = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !18, metadata !DIExpression()), !dbg !19
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 %0, i32* %n, align 4, !dbg !21
  store i32 0, i32* %sum, align 4, !dbg !19
  store i32 1, i32* %i, align 4, !dbg !17
  br label %for.cond, !dbg !22

for.cond:                                         ; preds = %for.loop, %entry
  %1 = load i32, i32* %i, align 4, !dbg !22
  %2 = load i32, i32* %n, align 4, !dbg !22
  %3 = icmp sle i32 %1, %2, !dbg !22
  br i1 %3, label %for.loop, label %for.end, !dbg !22

for.loop:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !23
  %5 = load i32, i32* %sum, align 4, !dbg !23
  %6 = add i32 %5, %4, !dbg !23
  store i32 %6, i32* %sum, align 4, !dbg !23
  %7 = load i32, i32* %sum, align 4, !dbg !23
  %8 = load i32, i32* %i, align 4, !dbg !23
  %9 = add i32 %8, 1, !dbg !23
  store i32 %9, i32* %i, align 4, !dbg !23
  %10 = load i32, i32* %i, align 4, !dbg !23
  br label %for.cond, !dbg !23

for.end:                                          ; preds = %for.cond
  %11 = load i32, i32* %sum, align 4, !dbg !24
  ret i32 %11, !dbg !24
}

define i32 @countSum3(i32 %0) !dbg !25 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !26, metadata !DIExpression()), !dbg !27
  %sum = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !28, metadata !DIExpression()), !dbg !29
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !30, metadata !DIExpression()), !dbg !31
  store i32 %0, i32* %n, align 4, !dbg !31
  store i32 0, i32* %sum, align 4, !dbg !29
  store i32 1, i32* %i, align 4, !dbg !32
  %1 = load i32, i32* %i, align 4, !dbg !32
  br label %for.cond, !dbg !32

for.cond:                                         ; preds = %for.loop, %entry
  %2 = load i32, i32* %i, align 4, !dbg !32
  %3 = load i32, i32* %n, align 4, !dbg !32
  %4 = icmp sle i32 %2, %3, !dbg !32
  br i1 %4, label %for.loop, label %for.end, !dbg !32

for.loop:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !33
  %6 = load i32, i32* %sum, align 4, !dbg !33
  %7 = add i32 %6, %5, !dbg !33
  store i32 %7, i32* %sum, align 4, !dbg !33
  %8 = load i32, i32* %sum, align 4, !dbg !33
  %9 = load i32, i32* %i, align 4, !dbg !33
  %10 = add i32 %9, 1, !dbg !33
  store i32 %10, i32* %i, align 4, !dbg !33
  %11 = load i32, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !33

for.end:                                          ; preds = %for.cond
  %12 = load i32, i32* %sum, align 4, !dbg !34
  ret i32 %12, !dbg !34
}

define i32 @main() !dbg !35 {
entry:
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !38, metadata !DIExpression()), !dbg !39
  store i32 0, i32* %err, align 4, !dbg !39
  %0 = call i32 @countSum(i32 100), !dbg !40
  %1 = icmp ne i32 %0, 5050, !dbg !40
  br i1 %1, label %then, label %if.end, !dbg !40

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !41
  %2 = load i32, i32* %err, align 4, !dbg !41
  br label %if.end, !dbg !41

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @countSum2(i32 100), !dbg !42
  %4 = icmp ne i32 %3, 5050, !dbg !42
  br i1 %4, label %then1, label %if.end3, !dbg !42

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !43
  %5 = load i32, i32* %err, align 4, !dbg !43
  br label %if.end3, !dbg !43

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @countSum3(i32 100), !dbg !44
  %7 = icmp ne i32 %6, 5050, !dbg !44
  br i1 %7, label %then4, label %if.end6, !dbg !44

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !45
  %8 = load i32, i32* %err, align 4, !dbg !45
  br label %if.end6, !dbg !45

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @countSum(i32 0), !dbg !46
  %10 = icmp ne i32 %9, 0, !dbg !46
  br i1 %10, label %then7, label %if.end9, !dbg !46

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !47
  %11 = load i32, i32* %err, align 4, !dbg !47
  br label %if.end9, !dbg !47

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @countSum(i32 1), !dbg !48
  %13 = icmp ne i32 %12, 1, !dbg !48
  br i1 %13, label %then10, label %if.end12, !dbg !48

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !49
  %14 = load i32, i32* %err, align 4, !dbg !49
  br label %if.end12, !dbg !49

if.end12:                                         ; preds = %if.end9, %then10
  %15 = load i32, i32* %err, align 4, !dbg !50
  %16 = icmp eq i32 %15, 0, !dbg !50
  %. = select i1 %16, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @1, i32 0, i32 0), !dbg !51
  %17 = call i32 (i8*, ...) @printf(i8* %.), !dbg !51
  %18 = load i32, i32* %err, align 4, !dbg !52
  ret i32 %18, !dbg !52
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "19.for_loop.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "countSum", linkageName: "countSum", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "i", scope: !2, file: !1, line: 5, type: !5)
!8 = !DILocation(line: 5, column: 8, scope: !2)
!9 = !DILocalVariable(name: "sum", scope: !2, file: !1, line: 4, type: !5)
!10 = !DILocation(line: 4, column: 3, scope: !2)
!11 = !DILocalVariable(name: "n", arg: 1, scope: !2, file: !1, line: 3, type: !5)
!12 = !DILocation(line: 3, column: 5, scope: !2)
!13 = !DILocation(line: 6, column: 5, scope: !2)
!14 = !DILocation(line: 8, column: 3, scope: !2)
!15 = distinct !DISubprogram(name: "countSum2", linkageName: "countSum2", scope: null, file: !1, line: 11, type: !3, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!16 = !DILocalVariable(name: "i", scope: !15, file: !1, line: 13, type: !5)
!17 = !DILocation(line: 13, column: 3, scope: !15)
!18 = !DILocalVariable(name: "sum", scope: !15, file: !1, line: 12, type: !5)
!19 = !DILocation(line: 12, column: 3, scope: !15)
!20 = !DILocalVariable(name: "n", arg: 1, scope: !15, file: !1, line: 11, type: !5)
!21 = !DILocation(line: 11, column: 5, scope: !15)
!22 = !DILocation(line: 14, column: 3, scope: !15)
!23 = !DILocation(line: 15, column: 5, scope: !15)
!24 = !DILocation(line: 17, column: 3, scope: !15)
!25 = distinct !DISubprogram(name: "countSum3", linkageName: "countSum3", scope: null, file: !1, line: 20, type: !3, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!26 = !DILocalVariable(name: "i", scope: !25, file: !1, line: 22, type: !5)
!27 = !DILocation(line: 22, column: 3, scope: !25)
!28 = !DILocalVariable(name: "sum", scope: !25, file: !1, line: 21, type: !5)
!29 = !DILocation(line: 21, column: 3, scope: !25)
!30 = !DILocalVariable(name: "n", arg: 1, scope: !25, file: !1, line: 20, type: !5)
!31 = !DILocation(line: 20, column: 5, scope: !25)
!32 = !DILocation(line: 23, column: 3, scope: !25)
!33 = !DILocation(line: 24, column: 5, scope: !25)
!34 = !DILocation(line: 26, column: 3, scope: !25)
!35 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 29, type: !36, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!36 = !DISubroutineType(types: !37)
!37 = !{!5}
!38 = !DILocalVariable(name: "err", scope: !35, file: !1, line: 30, type: !5)
!39 = !DILocation(line: 30, column: 3, scope: !35)
!40 = !DILocation(line: 32, column: 3, scope: !35)
!41 = !DILocation(line: 32, column: 30, scope: !35)
!42 = !DILocation(line: 33, column: 3, scope: !35)
!43 = !DILocation(line: 33, column: 31, scope: !35)
!44 = !DILocation(line: 34, column: 3, scope: !35)
!45 = !DILocation(line: 34, column: 31, scope: !35)
!46 = !DILocation(line: 35, column: 3, scope: !35)
!47 = !DILocation(line: 35, column: 25, scope: !35)
!48 = !DILocation(line: 36, column: 3, scope: !35)
!49 = !DILocation(line: 36, column: 25, scope: !35)
!50 = !DILocation(line: 38, column: 3, scope: !35)
!51 = !DILocation(line: 0, scope: !35)
!52 = !DILocation(line: 43, column: 3, scope: !35)
