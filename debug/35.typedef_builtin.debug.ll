; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [27 x i8] c"35.typedef_builtin.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [27 x i8] c"35.typedef_builtin.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define void @helper(i64 %0, i32 %1, i32* %2) !dbg !4 {
entry:
  %p = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %p, metadata !12, metadata !DIExpression()), !dbg !13
  %step = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %step, metadata !14, metadata !DIExpression()), !dbg !13
  %nbytes = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %nbytes, metadata !15, metadata !DIExpression()), !dbg !13
  store i64 %0, i64* %nbytes, align 4, !dbg !13
  store i32 %1, i32* %step, align 4, !dbg !13
  store i32* %2, i32** %p, align 8, !dbg !13
  %3 = load i32*, i32** %p, align 8, !dbg !16
  %4 = load i64, i64* %nbytes, align 4, !dbg !16
  %5 = load i32, i32* %step, align 4, !dbg !16
  %6 = zext i32 %5 to i64, !dbg !16
  %7 = add i64 %4, %6, !dbg !16
  %8 = trunc i64 %7 to i32, !dbg !16
  store i32 %8, i32* %3, align 4, !dbg !16
  %9 = load i32, i32* %3, align 4, !dbg !16
  ret void, !dbg !16
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @main() !dbg !17 {
entry:
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %result, metadata !20, metadata !DIExpression()), !dbg !21
  %p = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %p, metadata !22, metadata !DIExpression()), !dbg !23
  %x = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !24, metadata !DIExpression()), !dbg !25
  %c = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %c, metadata !26, metadata !DIExpression()), !dbg !27
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !28, metadata !DIExpression()), !dbg !29
  store i32 0, i32* %err, align 4, !dbg !29
  store i32 7, i32* %c, align 4, !dbg !27
  store i32 10, i32* %x, align 4, !dbg !25
  store i32* %x, i32** %p, align 8, !dbg !23
  %0 = load i32, i32* %c, align 4, !dbg !30
  %1 = load i32*, i32** %p, align 8, !dbg !30
  call void @helper(i64 42, i32 %0, i32* %1), !dbg !30
  %2 = load i32, i32* %c, align 4, !dbg !31
  %3 = icmp ne i32 %2, 7, !dbg !31
  br i1 %3, label %then, label %if.end, !dbg !31

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !32
  %4 = load i32, i32* %err, align 4, !dbg !32
  br label %if.end, !dbg !32

if.end:                                           ; preds = %entry, %then
  %5 = load i32, i32* %x, align 4, !dbg !33
  %6 = icmp ne i32 %5, 49, !dbg !33
  br i1 %6, label %then1, label %if.end3, !dbg !33

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !34
  %7 = load i32, i32* %err, align 4, !dbg !34
  br label %if.end3, !dbg !34

if.end3:                                          ; preds = %if.end, %then1
  %8 = load i32*, i32** %p, align 8, !dbg !21
  %9 = load i32, i32* %8, align 4, !dbg !21
  store i32 %9, i32* %result, align 4, !dbg !21
  %10 = load i32, i32* %result, align 4, !dbg !35
  %11 = icmp ne i32 %10, 49, !dbg !35
  br i1 %11, label %then4, label %if.end6, !dbg !35

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !36
  %12 = load i32, i32* %err, align 4, !dbg !36
  br label %if.end6, !dbg !36

if.end6:                                          ; preds = %if.end3, %then4
  %13 = load i32, i32* %err, align 4, !dbg !37
  %14 = icmp eq i32 %13, 0, !dbg !37
  %. = select i1 %14, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), !dbg !38
  %15 = call i32 (i8*, ...) @printf(i8* %.), !dbg !38
  %16 = load i32, i32* %err, align 4, !dbg !39
  ret i32 %16, !dbg !39
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "35.typedef_builtin.c", directory: "../tests")
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "helper", linkageName: "helper", scope: null, file: !1, line: 7, type: !5, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !11)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !8, !9, !10}
!7 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!8 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!11 = !{}
!12 = !DILocalVariable(name: "p", arg: 3, scope: !4, file: !1, line: 7, type: !10)
!13 = !DILocation(line: 7, column: 6, scope: !4)
!14 = !DILocalVariable(name: "step", arg: 2, scope: !4, file: !1, line: 7, type: !9)
!15 = !DILocalVariable(name: "nbytes", arg: 1, scope: !4, file: !1, line: 7, type: !8)
!16 = !DILocation(line: 8, column: 3, scope: !4)
!17 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 11, type: !18, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !11)
!18 = !DISubroutineType(types: !19)
!19 = !{!9}
!20 = !DILocalVariable(name: "result", scope: !17, file: !1, line: 21, type: !9)
!21 = !DILocation(line: 21, column: 3, scope: !17)
!22 = !DILocalVariable(name: "p", scope: !17, file: !1, line: 15, type: !10)
!23 = !DILocation(line: 15, column: 3, scope: !17)
!24 = !DILocalVariable(name: "x", scope: !17, file: !1, line: 14, type: !9)
!25 = !DILocation(line: 14, column: 3, scope: !17)
!26 = !DILocalVariable(name: "c", scope: !17, file: !1, line: 13, type: !9)
!27 = !DILocation(line: 13, column: 3, scope: !17)
!28 = !DILocalVariable(name: "err", scope: !17, file: !1, line: 12, type: !9)
!29 = !DILocation(line: 12, column: 3, scope: !17)
!30 = !DILocation(line: 17, column: 3, scope: !17)
!31 = !DILocation(line: 19, column: 3, scope: !17)
!32 = !DILocation(line: 19, column: 15, scope: !17)
!33 = !DILocation(line: 20, column: 3, scope: !17)
!34 = !DILocation(line: 20, column: 16, scope: !17)
!35 = !DILocation(line: 22, column: 3, scope: !17)
!36 = !DILocation(line: 22, column: 21, scope: !17)
!37 = !DILocation(line: 24, column: 3, scope: !17)
!38 = !DILocation(line: 0, scope: !17)
!39 = !DILocation(line: 29, column: 3, scope: !17)
