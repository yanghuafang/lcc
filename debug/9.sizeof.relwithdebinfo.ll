; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%union.ID = type { i8* }
%struct.Student = type { i32, i8*, i8, float }

@0 = private unnamed_addr constant [17 x i8] c"9.sizeof.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"9.sizeof.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %sex = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sex, metadata !7, metadata !DIExpression()), !dbg !8
  %id = alloca %union.ID, align 8
  call void @llvm.dbg.declare(metadata %union.ID* %id, metadata !9, metadata !DIExpression()), !dbg !11
  %student = alloca %struct.Student, align 8
  call void @llvm.dbg.declare(metadata %struct.Student* %student, metadata !12, metadata !DIExpression()), !dbg !14
  %pc = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %pc, metadata !15, metadata !DIExpression()), !dbg !18
  %d = alloca double, align 8
  call void @llvm.dbg.declare(metadata double* %d, metadata !19, metadata !DIExpression()), !dbg !21
  %f = alloca float, align 4
  call void @llvm.dbg.declare(metadata float* %f, metadata !22, metadata !DIExpression()), !dbg !24
  %l = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %l, metadata !25, metadata !DIExpression()), !dbg !27
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !28, metadata !DIExpression()), !dbg !29
  %c = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %c, metadata !30, metadata !DIExpression()), !dbg !31
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !32, metadata !DIExpression()), !dbg !33
  store i32 0, i32* %err, align 4, !dbg !33
  %0 = load i32, i32* %err, align 4, !dbg !34
  %1 = icmp eq i32 %0, 0, !dbg !34
  %. = select i1 %1, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @1, i32 0, i32 0), !dbg !35
  %2 = call i32 (i8*, ...) @printf(i8* %.), !dbg !35
  %3 = load i32, i32* %err, align 4, !dbg !36
  ret i32 %3, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "9.sizeof.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 17, type: !3, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "sex", scope: !2, file: !1, line: 27, type: !5)
!8 = !DILocation(line: 27, column: 3, scope: !2)
!9 = !DILocalVariable(name: "id", scope: !2, file: !1, line: 26, type: !10)
!10 = !DIBasicType(name: "union.ID", size: 64, encoding: DW_ATE_unsigned)
!11 = !DILocation(line: 26, column: 3, scope: !2)
!12 = !DILocalVariable(name: "student", scope: !2, file: !1, line: 25, type: !13)
!13 = !DIBasicType(name: "struct.Student", size: 192, encoding: DW_ATE_unsigned)
!14 = !DILocation(line: 25, column: 3, scope: !2)
!15 = !DILocalVariable(name: "pc", scope: !2, file: !1, line: 24, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 24, column: 3, scope: !2)
!19 = !DILocalVariable(name: "d", scope: !2, file: !1, line: 23, type: !20)
!20 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!21 = !DILocation(line: 23, column: 3, scope: !2)
!22 = !DILocalVariable(name: "f", scope: !2, file: !1, line: 22, type: !23)
!23 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!24 = !DILocation(line: 22, column: 3, scope: !2)
!25 = !DILocalVariable(name: "l", scope: !2, file: !1, line: 21, type: !26)
!26 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!27 = !DILocation(line: 21, column: 3, scope: !2)
!28 = !DILocalVariable(name: "i", scope: !2, file: !1, line: 20, type: !5)
!29 = !DILocation(line: 20, column: 3, scope: !2)
!30 = !DILocalVariable(name: "c", scope: !2, file: !1, line: 19, type: !17)
!31 = !DILocation(line: 19, column: 3, scope: !2)
!32 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 18, type: !5)
!33 = !DILocation(line: 18, column: 3, scope: !2)
!34 = !DILocation(line: 42, column: 3, scope: !2)
!35 = !DILocation(line: 0, scope: !2)
!36 = !DILocation(line: 47, column: 3, scope: !2)
