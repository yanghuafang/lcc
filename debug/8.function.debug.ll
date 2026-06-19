; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [19 x i8] c"8.function.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"8.function.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @sum(i32 %0, i32 %1) !dbg !2 {
entry:
  %r = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %r, metadata !7, metadata !DIExpression()), !dbg !8
  %l = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %l, metadata !9, metadata !DIExpression()), !dbg !8
  store i32 %0, i32* %l, align 4, !dbg !8
  store i32 %1, i32* %r, align 4, !dbg !8
  %2 = load i32, i32* %l, align 4, !dbg !10
  %3 = load i32, i32* %r, align 4, !dbg !10
  %4 = add i32 %2, %3, !dbg !10
  ret i32 %4, !dbg !10
}

define i32 @sum2(i32* %0, i32* %1) !dbg !11 {
entry:
  %r = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %r, metadata !15, metadata !DIExpression()), !dbg !16
  %l = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %l, metadata !17, metadata !DIExpression()), !dbg !16
  store i32* %0, i32** %l, align 8, !dbg !16
  store i32* %1, i32** %r, align 8, !dbg !16
  %2 = load i32*, i32** %l, align 8, !dbg !18
  %3 = load i32, i32* %2, align 4, !dbg !18
  %4 = load i32*, i32** %r, align 8, !dbg !18
  %5 = load i32, i32* %4, align 4, !dbg !18
  %6 = call i32 @sum(i32 %3, i32 %5), !dbg !18
  ret i32 %6, !dbg !18
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define void @sum3(i32 %0, i32 %1, i32* %2) !dbg !19 {
entry:
  %result = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %result, metadata !23, metadata !DIExpression()), !dbg !24
  %r = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %r, metadata !25, metadata !DIExpression()), !dbg !24
  %l = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %l, metadata !26, metadata !DIExpression()), !dbg !24
  store i32 %0, i32* %l, align 4, !dbg !24
  store i32 %1, i32* %r, align 4, !dbg !24
  store i32* %2, i32** %result, align 8, !dbg !24
  %3 = load i32*, i32** %result, align 8, !dbg !27
  %4 = load i32, i32* %l, align 4, !dbg !27
  %5 = load i32, i32* %r, align 4, !dbg !27
  %6 = add i32 %4, %5, !dbg !27
  store i32 %6, i32* %3, align 4, !dbg !27
  %7 = load i32, i32* %3, align 4, !dbg !27
  ret void, !dbg !27
}

define i32 @main() !dbg !28 {
entry:
  %r = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %r, metadata !31, metadata !DIExpression()), !dbg !32
  %l = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %l, metadata !33, metadata !DIExpression()), !dbg !34
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !35, metadata !DIExpression()), !dbg !36
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !37, metadata !DIExpression()), !dbg !38
  store i32 0, i32* %err, align 4, !dbg !38
  store i32 3, i32* %l, align 4, !dbg !34
  store i32 4, i32* %r, align 4, !dbg !32
  %0 = call i32 @sum(i32 1, i32 2), !dbg !39
  %1 = icmp ne i32 %0, 3, !dbg !39
  br i1 %1, label %then, label %if.end, !dbg !39

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !40
  %2 = load i32, i32* %err, align 4, !dbg !40
  br label %if.end, !dbg !40

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @sum(i32 3, i32 4), !dbg !41
  %4 = icmp ne i32 %3, 7, !dbg !41
  br i1 %4, label %then1, label %if.end3, !dbg !41

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !42
  %5 = load i32, i32* %err, align 4, !dbg !42
  br label %if.end3, !dbg !42

if.end3:                                          ; preds = %if.end, %then1
  %6 = load i32, i32* %l, align 4, !dbg !43
  %7 = load i32, i32* %r, align 4, !dbg !43
  %8 = call i32 @sum(i32 %6, i32 %7), !dbg !43
  %9 = icmp ne i32 %8, 7, !dbg !43
  br i1 %9, label %then4, label %if.end6, !dbg !43

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !44
  %10 = load i32, i32* %err, align 4, !dbg !44
  br label %if.end6, !dbg !44

if.end6:                                          ; preds = %if.end3, %then4
  %11 = call i32 @sum2(i32* %l, i32* %r), !dbg !45
  %12 = icmp ne i32 %11, 7, !dbg !45
  br i1 %12, label %then7, label %if.end9, !dbg !45

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !46
  %13 = load i32, i32* %err, align 4, !dbg !46
  br label %if.end9, !dbg !46

if.end9:                                          ; preds = %if.end6, %then7
  call void @sum3(i32 3, i32 4, i32* %i), !dbg !47
  %14 = load i32, i32* %i, align 4, !dbg !48
  %15 = icmp ne i32 %14, 7, !dbg !48
  br i1 %15, label %then10, label %if.end12, !dbg !48

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !49
  %16 = load i32, i32* %err, align 4, !dbg !49
  br label %if.end12, !dbg !49

if.end12:                                         ; preds = %if.end9, %then10
  %17 = load i32, i32* %l, align 4, !dbg !50
  %18 = load i32, i32* %r, align 4, !dbg !50
  call void @sum3(i32 %17, i32 %18, i32* %i), !dbg !50
  %19 = load i32, i32* %i, align 4, !dbg !51
  %20 = icmp ne i32 %19, 7, !dbg !51
  br i1 %20, label %then13, label %if.end15, !dbg !51

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !52
  %21 = load i32, i32* %err, align 4, !dbg !52
  br label %if.end15, !dbg !52

if.end15:                                         ; preds = %if.end12, %then13
  %22 = call i32 @sum(i32 1000000, i32 2000000), !dbg !53
  %23 = icmp ne i32 %22, 3000000, !dbg !53
  br i1 %23, label %then16, label %if.end18, !dbg !53

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !54
  %24 = load i32, i32* %err, align 4, !dbg !54
  br label %if.end18, !dbg !54

if.end18:                                         ; preds = %if.end15, %then16
  %25 = load i32, i32* %err, align 4, !dbg !55
  %26 = icmp eq i32 %25, 0, !dbg !55
  %. = select i1 %26, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @1, i32 0, i32 0), !dbg !56
  %27 = call i32 (i8*, ...) @printf(i8* %.), !dbg !56
  %28 = load i32, i32* %err, align 4, !dbg !57
  ret i32 %28, !dbg !57
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "8.function.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "sum", linkageName: "sum", scope: null, file: !1, line: 7, type: !3, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "r", arg: 2, scope: !2, file: !1, line: 7, type: !5)
!8 = !DILocation(line: 7, column: 5, scope: !2)
!9 = !DILocalVariable(name: "l", arg: 1, scope: !2, file: !1, line: 7, type: !5)
!10 = !DILocation(line: 7, column: 25, scope: !2)
!11 = distinct !DISubprogram(name: "sum2", linkageName: "sum2", scope: null, file: !1, line: 5, type: !12, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!12 = !DISubroutineType(types: !13)
!13 = !{!5, !14, !14}
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!15 = !DILocalVariable(name: "r", arg: 2, scope: !11, file: !1, line: 5, type: !14)
!16 = !DILocation(line: 5, column: 5, scope: !11)
!17 = !DILocalVariable(name: "l", arg: 1, scope: !11, file: !1, line: 5, type: !14)
!18 = !DILocation(line: 5, column: 28, scope: !11)
!19 = distinct !DISubprogram(name: "sum3", linkageName: "sum3", scope: null, file: !1, line: 6, type: !20, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!20 = !DISubroutineType(types: !21)
!21 = !{!22, !5, !5, !14}
!22 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!23 = !DILocalVariable(name: "result", arg: 3, scope: !19, file: !1, line: 6, type: !14)
!24 = !DILocation(line: 6, column: 6, scope: !19)
!25 = !DILocalVariable(name: "r", arg: 2, scope: !19, file: !1, line: 6, type: !5)
!26 = !DILocalVariable(name: "l", arg: 1, scope: !19, file: !1, line: 6, type: !5)
!27 = !DILocation(line: 6, column: 40, scope: !19)
!28 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 9, type: !29, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!29 = !DISubroutineType(types: !30)
!30 = !{!5}
!31 = !DILocalVariable(name: "r", scope: !28, file: !1, line: 13, type: !5)
!32 = !DILocation(line: 13, column: 3, scope: !28)
!33 = !DILocalVariable(name: "l", scope: !28, file: !1, line: 12, type: !5)
!34 = !DILocation(line: 12, column: 3, scope: !28)
!35 = !DILocalVariable(name: "i", scope: !28, file: !1, line: 11, type: !5)
!36 = !DILocation(line: 11, column: 3, scope: !28)
!37 = !DILocalVariable(name: "err", scope: !28, file: !1, line: 10, type: !5)
!38 = !DILocation(line: 10, column: 3, scope: !28)
!39 = !DILocation(line: 15, column: 3, scope: !28)
!40 = !DILocation(line: 15, column: 23, scope: !28)
!41 = !DILocation(line: 16, column: 3, scope: !28)
!42 = !DILocation(line: 16, column: 23, scope: !28)
!43 = !DILocation(line: 17, column: 3, scope: !28)
!44 = !DILocation(line: 17, column: 23, scope: !28)
!45 = !DILocation(line: 18, column: 3, scope: !28)
!46 = !DILocation(line: 18, column: 26, scope: !28)
!47 = !DILocation(line: 20, column: 3, scope: !28)
!48 = !DILocation(line: 21, column: 3, scope: !28)
!49 = !DILocation(line: 21, column: 15, scope: !28)
!50 = !DILocation(line: 22, column: 3, scope: !28)
!51 = !DILocation(line: 23, column: 3, scope: !28)
!52 = !DILocation(line: 23, column: 15, scope: !28)
!53 = !DILocation(line: 25, column: 3, scope: !28)
!54 = !DILocation(line: 25, column: 41, scope: !28)
!55 = !DILocation(line: 27, column: 3, scope: !28)
!56 = !DILocation(line: 0, scope: !28)
!57 = !DILocation(line: 32, column: 3, scope: !28)
