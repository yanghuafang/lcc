; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.6.0"

%struct.Student = type { i32, i8*, i8, float }
%struct.Padded = type { i8, i64 }
%union.ID = type { i8* }

@0 = private unnamed_addr constant [17 x i8] c"9.sizeof.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"9.sizeof.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %longs = alloca [4 x i64], align 8
  call void @llvm.dbg.declare(metadata [4 x i64]* %longs, metadata !7, metadata !DIExpression()), !dbg !12
  %students = alloca [3 x %struct.Student], align 8
  call void @llvm.dbg.declare(metadata [3 x %struct.Student]* %students, metadata !13, metadata !DIExpression()), !dbg !26
  %padded = alloca %struct.Padded, align 8
  call void @llvm.dbg.declare(metadata %struct.Padded* %padded, metadata !27, metadata !DIExpression()), !dbg !32
  %sex = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sex, metadata !33, metadata !DIExpression()), !dbg !34
  %id = alloca %union.ID, align 8
  call void @llvm.dbg.declare(metadata %union.ID* %id, metadata !35, metadata !DIExpression()), !dbg !39
  %student = alloca %struct.Student, align 8
  call void @llvm.dbg.declare(metadata %struct.Student* %student, metadata !40, metadata !DIExpression()), !dbg !41
  %pc = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %pc, metadata !42, metadata !DIExpression()), !dbg !43
  %d = alloca double, align 8
  call void @llvm.dbg.declare(metadata double* %d, metadata !44, metadata !DIExpression()), !dbg !46
  %f = alloca float, align 4
  call void @llvm.dbg.declare(metadata float* %f, metadata !47, metadata !DIExpression()), !dbg !48
  %l = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %l, metadata !49, metadata !DIExpression()), !dbg !50
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !51, metadata !DIExpression()), !dbg !52
  %c = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %c, metadata !53, metadata !DIExpression()), !dbg !54
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !55, metadata !DIExpression()), !dbg !56
  store i32 0, i32* %err, align 4, !dbg !56
  %0 = load i32, i32* %err, align 4, !dbg !57
  %1 = icmp eq i32 %0, 0, !dbg !57
  %. = select i1 %1, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @1, i32 0, i32 0), !dbg !58
  %2 = call i32 (i8*, ...) @printf(i8* %.), !dbg !58
  %3 = load i32, i32* %err, align 4, !dbg !59
  ret i32 %3, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "9.sizeof.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 30, type: !3, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "longs", scope: !2, file: !1, line: 43, type: !8)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 256, align: 32, elements: !10)
!9 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!10 = !{!11}
!11 = !DISubrange(count: 4, lowerBound: 0)
!12 = !DILocation(line: 43, column: 3, scope: !2)
!13 = !DILocalVariable(name: "students", scope: !2, file: !1, line: 42, type: !14)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 576, align: 64, elements: !24)
!15 = !DICompositeType(tag: DW_TAG_structure_type, name: "Student", file: !1, size: 192, align: 64, elements: !16)
!16 = !{!17, !18, !21, !22}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "id", file: !1, baseType: !5, size: 32, align: 32)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "name", file: !1, baseType: !19, size: 64, align: 64, offset: 64)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "sex", file: !1, baseType: !20, size: 8, align: 8, offset: 128)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "score", file: !1, baseType: !23, size: 32, align: 32, offset: 160)
!23 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!24 = !{!25}
!25 = !DISubrange(count: 3, lowerBound: 0)
!26 = !DILocation(line: 42, column: 3, scope: !2)
!27 = !DILocalVariable(name: "padded", scope: !2, file: !1, line: 41, type: !28)
!28 = !DICompositeType(tag: DW_TAG_structure_type, name: "Padded", file: !1, size: 96, align: 32, elements: !29)
!29 = !{!30, !31}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "c", file: !1, baseType: !20, size: 8, align: 8)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "l", file: !1, baseType: !9, size: 64, align: 32, offset: 32)
!32 = !DILocation(line: 41, column: 3, scope: !2)
!33 = !DILocalVariable(name: "sex", scope: !2, file: !1, line: 40, type: !5)
!34 = !DILocation(line: 40, column: 3, scope: !2)
!35 = !DILocalVariable(name: "id", scope: !2, file: !1, line: 39, type: !36)
!36 = !DICompositeType(tag: DW_TAG_union_type, name: "ID", file: !1, size: 64, align: 64, elements: !37)
!37 = !{!17, !38}
!38 = !DIDerivedType(tag: DW_TAG_member, name: "name", file: !1, baseType: !19, size: 64, align: 64)
!39 = !DILocation(line: 39, column: 3, scope: !2)
!40 = !DILocalVariable(name: "student", scope: !2, file: !1, line: 38, type: !15)
!41 = !DILocation(line: 38, column: 3, scope: !2)
!42 = !DILocalVariable(name: "pc", scope: !2, file: !1, line: 37, type: !19)
!43 = !DILocation(line: 37, column: 3, scope: !2)
!44 = !DILocalVariable(name: "d", scope: !2, file: !1, line: 36, type: !45)
!45 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!46 = !DILocation(line: 36, column: 3, scope: !2)
!47 = !DILocalVariable(name: "f", scope: !2, file: !1, line: 35, type: !23)
!48 = !DILocation(line: 35, column: 3, scope: !2)
!49 = !DILocalVariable(name: "l", scope: !2, file: !1, line: 34, type: !9)
!50 = !DILocation(line: 34, column: 3, scope: !2)
!51 = !DILocalVariable(name: "i", scope: !2, file: !1, line: 33, type: !5)
!52 = !DILocation(line: 33, column: 3, scope: !2)
!53 = !DILocalVariable(name: "c", scope: !2, file: !1, line: 32, type: !20)
!54 = !DILocation(line: 32, column: 3, scope: !2)
!55 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 31, type: !5)
!56 = !DILocation(line: 31, column: 3, scope: !2)
!57 = !DILocation(line: 67, column: 3, scope: !2)
!58 = !DILocation(line: 0, scope: !2)
!59 = !DILocation(line: 72, column: 3, scope: !2)
