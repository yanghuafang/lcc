; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [27 x i8] c"35.typedef_builtin.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [27 x i8] c"35.typedef_builtin.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define void @helper(i64 %0, i32 %1, i32* %2) !dbg !2 {
entry:
  %p = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %p, metadata !10, metadata !DIExpression()), !dbg !11
  %step = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %step, metadata !12, metadata !DIExpression()), !dbg !11
  %nbytes = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %nbytes, metadata !13, metadata !DIExpression()), !dbg !11
  store i64 %0, i64* %nbytes, align 4, !dbg !11
  store i32 %1, i32* %step, align 4, !dbg !11
  store i32* %2, i32** %p, align 8, !dbg !11
  %3 = load i32*, i32** %p, align 8, !dbg !14
  %4 = load i64, i64* %nbytes, align 4, !dbg !14
  %5 = load i32, i32* %step, align 4, !dbg !14
  %6 = zext i32 %5 to i64, !dbg !14
  %7 = add i64 %4, %6, !dbg !14
  %8 = trunc i64 %7 to i32, !dbg !14
  store i32 %8, i32* %3, align 4, !dbg !14
  %9 = load i32, i32* %3, align 4, !dbg !14
  ret void, !dbg !14
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @main() !dbg !15 {
entry:
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %result, metadata !18, metadata !DIExpression()), !dbg !19
  %p = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %p, metadata !20, metadata !DIExpression()), !dbg !21
  %x = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !22, metadata !DIExpression()), !dbg !23
  %c = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %c, metadata !24, metadata !DIExpression()), !dbg !25
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !26, metadata !DIExpression()), !dbg !27
  store i32 0, i32* %err, align 4, !dbg !27
  store i32 7, i32* %c, align 4, !dbg !25
  store i32 10, i32* %x, align 4, !dbg !23
  store i32* %x, i32** %p, align 8, !dbg !21
  %0 = load i32, i32* %c, align 4, !dbg !28
  %1 = load i32*, i32** %p, align 8, !dbg !28
  call void @helper(i64 42, i32 %0, i32* %1), !dbg !28
  %2 = load i32, i32* %c, align 4, !dbg !29
  %3 = icmp ne i32 %2, 7, !dbg !29
  br i1 %3, label %then, label %if.end, !dbg !29

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !30
  %4 = load i32, i32* %err, align 4, !dbg !30
  br label %if.end, !dbg !30

if.end:                                           ; preds = %entry, %then
  %5 = load i32, i32* %x, align 4, !dbg !31
  %6 = icmp ne i32 %5, 49, !dbg !31
  br i1 %6, label %then1, label %if.end3, !dbg !31

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !32
  %7 = load i32, i32* %err, align 4, !dbg !32
  br label %if.end3, !dbg !32

if.end3:                                          ; preds = %if.end, %then1
  %8 = load i32*, i32** %p, align 8, !dbg !19
  %9 = load i32, i32* %8, align 4, !dbg !19
  store i32 %9, i32* %result, align 4, !dbg !19
  %10 = load i32, i32* %result, align 4, !dbg !33
  %11 = icmp ne i32 %10, 49, !dbg !33
  br i1 %11, label %then4, label %if.end6, !dbg !33

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !34
  %12 = load i32, i32* %err, align 4, !dbg !34
  br label %if.end6, !dbg !34

if.end6:                                          ; preds = %if.end3, %then4
  %13 = load i32, i32* %err, align 4, !dbg !35
  %14 = icmp eq i32 %13, 0, !dbg !35
  %. = select i1 %14, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), !dbg !36
  %15 = call i32 (i8*, ...) @printf(i8* %.), !dbg !36
  %16 = load i32, i32* %err, align 4, !dbg !37
  ret i32 %16, !dbg !37
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "35.typedef_builtin.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "helper", linkageName: "helper", scope: null, file: !1, line: 7, type: !3, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !9)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6, !7, !8}
!5 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!6 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!9 = !{}
!10 = !DILocalVariable(name: "p", arg: 3, scope: !2, file: !1, line: 7, type: !8)
!11 = !DILocation(line: 7, column: 6, scope: !2)
!12 = !DILocalVariable(name: "step", arg: 2, scope: !2, file: !1, line: 7, type: !7)
!13 = !DILocalVariable(name: "nbytes", arg: 1, scope: !2, file: !1, line: 7, type: !6)
!14 = !DILocation(line: 8, column: 3, scope: !2)
!15 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 11, type: !16, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !9)
!16 = !DISubroutineType(types: !17)
!17 = !{!7}
!18 = !DILocalVariable(name: "result", scope: !15, file: !1, line: 21, type: !7)
!19 = !DILocation(line: 21, column: 3, scope: !15)
!20 = !DILocalVariable(name: "p", scope: !15, file: !1, line: 15, type: !8)
!21 = !DILocation(line: 15, column: 3, scope: !15)
!22 = !DILocalVariable(name: "x", scope: !15, file: !1, line: 14, type: !7)
!23 = !DILocation(line: 14, column: 3, scope: !15)
!24 = !DILocalVariable(name: "c", scope: !15, file: !1, line: 13, type: !7)
!25 = !DILocation(line: 13, column: 3, scope: !15)
!26 = !DILocalVariable(name: "err", scope: !15, file: !1, line: 12, type: !7)
!27 = !DILocation(line: 12, column: 3, scope: !15)
!28 = !DILocation(line: 17, column: 3, scope: !15)
!29 = !DILocation(line: 19, column: 3, scope: !15)
!30 = !DILocation(line: 19, column: 15, scope: !15)
!31 = !DILocation(line: 20, column: 3, scope: !15)
!32 = !DILocation(line: 20, column: 16, scope: !15)
!33 = !DILocation(line: 22, column: 3, scope: !15)
!34 = !DILocation(line: 22, column: 21, scope: !15)
!35 = !DILocation(line: 24, column: 3, scope: !15)
!36 = !DILocation(line: 0, scope: !15)
!37 = !DILocation(line: 29, column: 3, scope: !15)
