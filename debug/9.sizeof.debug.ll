; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

%union.ID = type { ptr }
%struct.Student = type { i32, ptr, i8, float }

@0 = private unnamed_addr constant [17 x i8] c"9.sizeof.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"9.sizeof.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %sex = alloca i32, align 4
    #dbg_declare(ptr %sex, !9, !DIExpression(), !10)
  %id = alloca %union.ID, align 8
    #dbg_declare(ptr %id, !11, !DIExpression(), !18)
  %student = alloca %struct.Student, align 8
    #dbg_declare(ptr %student, !19, !DIExpression(), !26)
  %pc = alloca ptr, align 8
    #dbg_declare(ptr %pc, !27, !DIExpression(), !28)
  %d = alloca double, align 8
    #dbg_declare(ptr %d, !29, !DIExpression(), !31)
  %f = alloca float, align 4
    #dbg_declare(ptr %f, !32, !DIExpression(), !33)
  %l = alloca i64, align 8
    #dbg_declare(ptr %l, !34, !DIExpression(), !36)
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !37, !DIExpression(), !38)
  %c = alloca i8, align 1
    #dbg_declare(ptr %c, !39, !DIExpression(), !40)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !41, !DIExpression(), !42)
  store i32 0, ptr %err, align 4, !dbg !42
  %0 = load i32, ptr %err, align 4, !dbg !43
  %1 = icmp eq i32 %0, 0, !dbg !43
  %. = select i1 %1, ptr @0, ptr @1, !dbg !44
  %2 = call i32 (ptr, ...) @printf(ptr %.), !dbg !44
  %3 = load i32, ptr %err, align 4, !dbg !45
  ret i32 %3, !dbg !45
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "9.sizeof.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 17, type: !5, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "sex", scope: !4, file: !1, line: 27, type: !7)
!10 = !DILocation(line: 27, column: 3, scope: !4)
!11 = !DILocalVariable(name: "id", scope: !4, file: !1, line: 26, type: !12)
!12 = !DICompositeType(tag: DW_TAG_union_type, name: "ID", file: !1, size: 64, align: 64, elements: !13)
!13 = !{!14, !15}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "id", file: !1, baseType: !7, size: 32, align: 32)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "name", file: !1, baseType: !16, size: 64, align: 64)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 26, column: 3, scope: !4)
!19 = !DILocalVariable(name: "student", scope: !4, file: !1, line: 25, type: !20)
!20 = !DICompositeType(tag: DW_TAG_structure_type, name: "Student", file: !1, size: 192, align: 64, elements: !21)
!21 = !{!14, !22, !23, !24}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "name", file: !1, baseType: !16, size: 64, align: 64, offset: 64)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "sex", file: !1, baseType: !17, size: 8, align: 8, offset: 128)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "score", file: !1, baseType: !25, size: 32, align: 32, offset: 160)
!25 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!26 = !DILocation(line: 25, column: 3, scope: !4)
!27 = !DILocalVariable(name: "pc", scope: !4, file: !1, line: 24, type: !16)
!28 = !DILocation(line: 24, column: 3, scope: !4)
!29 = !DILocalVariable(name: "d", scope: !4, file: !1, line: 23, type: !30)
!30 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!31 = !DILocation(line: 23, column: 3, scope: !4)
!32 = !DILocalVariable(name: "f", scope: !4, file: !1, line: 22, type: !25)
!33 = !DILocation(line: 22, column: 3, scope: !4)
!34 = !DILocalVariable(name: "l", scope: !4, file: !1, line: 21, type: !35)
!35 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!36 = !DILocation(line: 21, column: 3, scope: !4)
!37 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 20, type: !7)
!38 = !DILocation(line: 20, column: 3, scope: !4)
!39 = !DILocalVariable(name: "c", scope: !4, file: !1, line: 19, type: !17)
!40 = !DILocation(line: 19, column: 3, scope: !4)
!41 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 18, type: !7)
!42 = !DILocation(line: 18, column: 3, scope: !4)
!43 = !DILocation(line: 42, column: 3, scope: !4)
!44 = !DILocation(line: 0, scope: !4)
!45 = !DILocation(line: 47, column: 3, scope: !4)
