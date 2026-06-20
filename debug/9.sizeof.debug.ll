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
  call void @llvm.dbg.declare(metadata %union.ID* %id, metadata !9, metadata !DIExpression()), !dbg !16
  %student = alloca %struct.Student, align 8
  call void @llvm.dbg.declare(metadata %struct.Student* %student, metadata !17, metadata !DIExpression()), !dbg !24
  %pc = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %pc, metadata !25, metadata !DIExpression()), !dbg !26
  %d = alloca double, align 8
  call void @llvm.dbg.declare(metadata double* %d, metadata !27, metadata !DIExpression()), !dbg !29
  %f = alloca float, align 4
  call void @llvm.dbg.declare(metadata float* %f, metadata !30, metadata !DIExpression()), !dbg !31
  %l = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %l, metadata !32, metadata !DIExpression()), !dbg !34
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !35, metadata !DIExpression()), !dbg !36
  %c = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %c, metadata !37, metadata !DIExpression()), !dbg !38
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 0, i32* %err, align 4, !dbg !40
  %0 = load i32, i32* %err, align 4, !dbg !41
  %1 = icmp eq i32 %0, 0, !dbg !41
  %. = select i1 %1, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @1, i32 0, i32 0), !dbg !42
  %2 = call i32 (i8*, ...) @printf(i8* %.), !dbg !42
  %3 = load i32, i32* %err, align 4, !dbg !43
  ret i32 %3, !dbg !43
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
!10 = !DICompositeType(tag: DW_TAG_union_type, name: "ID", file: !1, size: 64, align: 64, elements: !11)
!11 = !{!12, !13}
!12 = !DIDerivedType(tag: DW_TAG_member, name: "id", file: !1, baseType: !5, size: 32, align: 32)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "name", file: !1, baseType: !14, size: 64, align: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocation(line: 26, column: 3, scope: !2)
!17 = !DILocalVariable(name: "student", scope: !2, file: !1, line: 25, type: !18)
!18 = !DICompositeType(tag: DW_TAG_structure_type, name: "Student", file: !1, size: 192, align: 64, elements: !19)
!19 = !{!12, !20, !21, !22}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "name", file: !1, baseType: !14, size: 64, align: 64, offset: 64)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "sex", file: !1, baseType: !15, size: 8, align: 8, offset: 128)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "score", file: !1, baseType: !23, size: 32, align: 32, offset: 160)
!23 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!24 = !DILocation(line: 25, column: 3, scope: !2)
!25 = !DILocalVariable(name: "pc", scope: !2, file: !1, line: 24, type: !14)
!26 = !DILocation(line: 24, column: 3, scope: !2)
!27 = !DILocalVariable(name: "d", scope: !2, file: !1, line: 23, type: !28)
!28 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!29 = !DILocation(line: 23, column: 3, scope: !2)
!30 = !DILocalVariable(name: "f", scope: !2, file: !1, line: 22, type: !23)
!31 = !DILocation(line: 22, column: 3, scope: !2)
!32 = !DILocalVariable(name: "l", scope: !2, file: !1, line: 21, type: !33)
!33 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!34 = !DILocation(line: 21, column: 3, scope: !2)
!35 = !DILocalVariable(name: "i", scope: !2, file: !1, line: 20, type: !5)
!36 = !DILocation(line: 20, column: 3, scope: !2)
!37 = !DILocalVariable(name: "c", scope: !2, file: !1, line: 19, type: !15)
!38 = !DILocation(line: 19, column: 3, scope: !2)
!39 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 18, type: !5)
!40 = !DILocation(line: 18, column: 3, scope: !2)
!41 = !DILocation(line: 42, column: 3, scope: !2)
!42 = !DILocation(line: 0, scope: !2)
!43 = !DILocation(line: 47, column: 3, scope: !2)
