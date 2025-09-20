; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

%struct.Student = type { i32, ptr, i8, float }
%struct.Padded = type { i8, i64 }
%union.ID = type { ptr }

@0 = private unnamed_addr constant [17 x i8] c"9.sizeof.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"9.sizeof.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %longs = alloca [4 x i64], align 8
    #dbg_declare(ptr %longs, !7, !DIExpression(), !12)
  %students = alloca [3 x %struct.Student], align 8
    #dbg_declare(ptr %students, !13, !DIExpression(), !18)
  %padded = alloca %struct.Padded, align 8
    #dbg_declare(ptr %padded, !19, !DIExpression(), !25)
  %sex = alloca i32, align 4
    #dbg_declare(ptr %sex, !26, !DIExpression(), !27)
  %id = alloca %union.ID, align 8
    #dbg_declare(ptr %id, !28, !DIExpression(), !34)
  %student = alloca %struct.Student, align 8
    #dbg_declare(ptr %student, !35, !DIExpression(), !42)
  %pc = alloca ptr, align 8
    #dbg_declare(ptr %pc, !43, !DIExpression(), !44)
  %d = alloca double, align 8
    #dbg_declare(ptr %d, !45, !DIExpression(), !47)
  %f = alloca float, align 4
    #dbg_declare(ptr %f, !48, !DIExpression(), !49)
  %l = alloca i64, align 8
    #dbg_declare(ptr %l, !50, !DIExpression(), !51)
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !52, !DIExpression(), !53)
  %c = alloca i8, align 1
    #dbg_declare(ptr %c, !54, !DIExpression(), !55)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !56, !DIExpression(), !57)
  store i32 0, ptr %err, align 4, !dbg !57
  %0 = load i32, ptr %err, align 4, !dbg !58
  %1 = icmp eq i32 %0, 0, !dbg !58
  %. = select i1 %1, ptr @0, ptr @1, !dbg !59
  %2 = call i32 (ptr, ...) @printf(ptr %.), !dbg !59
  %3 = load i32, ptr %err, align 4, !dbg !60
  ret i32 %3, !dbg !60
}

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
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 576, align: 64, elements: !16)
!15 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!16 = !{!17}
!17 = !DISubrange(count: 3, lowerBound: 0)
!18 = !DILocation(line: 42, column: 3, scope: !2)
!19 = !DILocalVariable(name: "padded", scope: !2, file: !1, line: 41, type: !20)
!20 = !DICompositeType(tag: DW_TAG_structure_type, name: "Padded", file: !1, size: 96, align: 32, elements: !21)
!21 = !{!22, !24}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "c", file: !1, baseType: !23, size: 8, align: 8)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "l", file: !1, baseType: !9, size: 64, align: 32, offset: 32)
!25 = !DILocation(line: 41, column: 3, scope: !2)
!26 = !DILocalVariable(name: "sex", scope: !2, file: !1, line: 40, type: !5)
!27 = !DILocation(line: 40, column: 3, scope: !2)
!28 = !DILocalVariable(name: "id", scope: !2, file: !1, line: 39, type: !29)
!29 = !DICompositeType(tag: DW_TAG_union_type, name: "ID", file: !1, size: 64, align: 64, elements: !30)
!30 = !{!31, !32}
!31 = !DIDerivedType(tag: DW_TAG_member, name: "id", file: !1, baseType: !5, size: 32, align: 32)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "name", file: !1, baseType: !33, size: 64, align: 64)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!34 = !DILocation(line: 39, column: 3, scope: !2)
!35 = !DILocalVariable(name: "student", scope: !2, file: !1, line: 38, type: !36)
!36 = !DICompositeType(tag: DW_TAG_structure_type, name: "Student", file: !1, size: 192, align: 64, elements: !37)
!37 = !{!31, !38, !39, !40}
!38 = !DIDerivedType(tag: DW_TAG_member, name: "name", file: !1, baseType: !33, size: 64, align: 64, offset: 64)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "sex", file: !1, baseType: !23, size: 8, align: 8, offset: 128)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "score", file: !1, baseType: !41, size: 32, align: 32, offset: 160)
!41 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!42 = !DILocation(line: 38, column: 3, scope: !2)
!43 = !DILocalVariable(name: "pc", scope: !2, file: !1, line: 37, type: !33)
!44 = !DILocation(line: 37, column: 3, scope: !2)
!45 = !DILocalVariable(name: "d", scope: !2, file: !1, line: 36, type: !46)
!46 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!47 = !DILocation(line: 36, column: 3, scope: !2)
!48 = !DILocalVariable(name: "f", scope: !2, file: !1, line: 35, type: !41)
!49 = !DILocation(line: 35, column: 3, scope: !2)
!50 = !DILocalVariable(name: "l", scope: !2, file: !1, line: 34, type: !9)
!51 = !DILocation(line: 34, column: 3, scope: !2)
!52 = !DILocalVariable(name: "i", scope: !2, file: !1, line: 33, type: !5)
!53 = !DILocation(line: 33, column: 3, scope: !2)
!54 = !DILocalVariable(name: "c", scope: !2, file: !1, line: 32, type: !23)
!55 = !DILocation(line: 32, column: 3, scope: !2)
!56 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 31, type: !5)
!57 = !DILocation(line: 31, column: 3, scope: !2)
!58 = !DILocation(line: 67, column: 3, scope: !2)
!59 = !DILocation(line: 0, scope: !2)
!60 = !DILocation(line: 72, column: 3, scope: !2)
