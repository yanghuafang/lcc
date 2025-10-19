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
  br i1 false, label %then, label %else, !dbg !58

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !59
  %0 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end, !dbg !59

else:                                             ; preds = %entry
  br label %if.end, !dbg !59

if.end:                                           ; preds = %else, %then
  br i1 false, label %then1, label %else2, !dbg !60

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !61
  %1 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end3, !dbg !61

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !61

if.end3:                                          ; preds = %else2, %then1
  br i1 false, label %then4, label %else5, !dbg !62

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !63
  %2 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end6, !dbg !63

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !63

if.end6:                                          ; preds = %else5, %then4
  br i1 false, label %then7, label %else8, !dbg !64

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !65
  %3 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end9, !dbg !65

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !65

if.end9:                                          ; preds = %else8, %then7
  br i1 false, label %then10, label %else11, !dbg !66

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !67
  %4 = load i32, ptr %err, align 4, !dbg !67
  br label %if.end12, !dbg !67

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !67

if.end12:                                         ; preds = %else11, %then10
  br i1 false, label %then13, label %else14, !dbg !68

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !69
  %5 = load i32, ptr %err, align 4, !dbg !69
  br label %if.end15, !dbg !69

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !69

if.end15:                                         ; preds = %else14, %then13
  br i1 false, label %then16, label %else17, !dbg !70

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !71
  %6 = load i32, ptr %err, align 4, !dbg !71
  br label %if.end18, !dbg !71

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !71

if.end18:                                         ; preds = %else17, %then16
  br i1 false, label %then19, label %else20, !dbg !72

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !73
  %7 = load i32, ptr %err, align 4, !dbg !73
  br label %if.end21, !dbg !73

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !73

if.end21:                                         ; preds = %else20, %then19
  br i1 false, label %then22, label %else23, !dbg !74

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !75
  %8 = load i32, ptr %err, align 4, !dbg !75
  br label %if.end24, !dbg !75

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !75

if.end24:                                         ; preds = %else23, %then22
  br i1 false, label %then25, label %else26, !dbg !76

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !77
  %9 = load i32, ptr %err, align 4, !dbg !77
  br label %if.end27, !dbg !77

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !77

if.end27:                                         ; preds = %else26, %then25
  br i1 false, label %then28, label %else29, !dbg !78

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !79
  %10 = load i32, ptr %err, align 4, !dbg !79
  br label %if.end30, !dbg !79

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !79

if.end30:                                         ; preds = %else29, %then28
  br i1 false, label %then31, label %else32, !dbg !80

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !81
  %11 = load i32, ptr %err, align 4, !dbg !81
  br label %if.end33, !dbg !81

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !81

if.end33:                                         ; preds = %else32, %then31
  br i1 false, label %then34, label %else35, !dbg !82

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !83
  %12 = load i32, ptr %err, align 4, !dbg !83
  br label %if.end36, !dbg !83

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !83

if.end36:                                         ; preds = %else35, %then34
  br i1 false, label %then37, label %else38, !dbg !84

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !85
  %13 = load i32, ptr %err, align 4, !dbg !85
  br label %if.end39, !dbg !85

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !85

if.end39:                                         ; preds = %else38, %then37
  br i1 false, label %then40, label %else41, !dbg !86

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !87
  %14 = load i32, ptr %err, align 4, !dbg !87
  br label %if.end42, !dbg !87

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !87

if.end42:                                         ; preds = %else41, %then40
  br i1 false, label %then43, label %else44, !dbg !88

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4, !dbg !89
  %15 = load i32, ptr %err, align 4, !dbg !89
  br label %if.end45, !dbg !89

else44:                                           ; preds = %if.end42
  br label %if.end45, !dbg !89

if.end45:                                         ; preds = %else44, %then43
  br i1 false, label %then46, label %else47, !dbg !90

then46:                                           ; preds = %if.end45
  store i32 1, ptr %err, align 4, !dbg !91
  %16 = load i32, ptr %err, align 4, !dbg !91
  br label %if.end48, !dbg !91

else47:                                           ; preds = %if.end45
  br label %if.end48, !dbg !91

if.end48:                                         ; preds = %else47, %then46
  br i1 false, label %then49, label %else50, !dbg !92

then49:                                           ; preds = %if.end48
  store i32 1, ptr %err, align 4, !dbg !93
  %17 = load i32, ptr %err, align 4, !dbg !93
  br label %if.end51, !dbg !93

else50:                                           ; preds = %if.end48
  br label %if.end51, !dbg !93

if.end51:                                         ; preds = %else50, %then49
  %18 = load i32, ptr %err, align 4, !dbg !94
  %19 = icmp eq i32 %18, 0, !dbg !94
  br i1 %19, label %then52, label %else53, !dbg !94

then52:                                           ; preds = %if.end51
  %20 = call i32 (ptr, ...) @printf(ptr @0), !dbg !95
  br label %if.end54, !dbg !95

else53:                                           ; preds = %if.end51
  %21 = call i32 (ptr, ...) @printf(ptr @1), !dbg !97
  br label %if.end54, !dbg !97

if.end54:                                         ; preds = %else53, %then52
  %22 = load i32, ptr %err, align 4, !dbg !99
  ret i32 %22, !dbg !99
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
!58 = !DILocation(line: 45, column: 3, scope: !2)
!59 = !DILocation(line: 45, column: 26, scope: !2)
!60 = !DILocation(line: 46, column: 3, scope: !2)
!61 = !DILocation(line: 46, column: 27, scope: !2)
!62 = !DILocation(line: 47, column: 3, scope: !2)
!63 = !DILocation(line: 47, column: 25, scope: !2)
!64 = !DILocation(line: 48, column: 3, scope: !2)
!65 = !DILocation(line: 48, column: 26, scope: !2)
!66 = !DILocation(line: 49, column: 3, scope: !2)
!67 = !DILocation(line: 49, column: 27, scope: !2)
!68 = !DILocation(line: 50, column: 3, scope: !2)
!69 = !DILocation(line: 50, column: 28, scope: !2)
!70 = !DILocation(line: 51, column: 3, scope: !2)
!71 = !DILocation(line: 51, column: 27, scope: !2)
!72 = !DILocation(line: 52, column: 3, scope: !2)
!73 = !DILocation(line: 52, column: 26, scope: !2)
!74 = !DILocation(line: 53, column: 3, scope: !2)
!75 = !DILocation(line: 53, column: 23, scope: !2)
!76 = !DILocation(line: 54, column: 3, scope: !2)
!77 = !DILocation(line: 54, column: 23, scope: !2)
!78 = !DILocation(line: 55, column: 3, scope: !2)
!79 = !DILocation(line: 55, column: 25, scope: !2)
!80 = !DILocation(line: 56, column: 3, scope: !2)
!81 = !DILocation(line: 56, column: 25, scope: !2)
!82 = !DILocation(line: 60, column: 3, scope: !2)
!83 = !DILocation(line: 60, column: 30, scope: !2)
!84 = !DILocation(line: 61, column: 3, scope: !2)
!85 = !DILocation(line: 61, column: 30, scope: !2)
!86 = !DILocation(line: 62, column: 3, scope: !2)
!87 = !DILocation(line: 62, column: 24, scope: !2)
!88 = !DILocation(line: 63, column: 3, scope: !2)
!89 = !DILocation(line: 63, column: 24, scope: !2)
!90 = !DILocation(line: 64, column: 3, scope: !2)
!91 = !DILocation(line: 64, column: 31, scope: !2)
!92 = !DILocation(line: 65, column: 3, scope: !2)
!93 = !DILocation(line: 65, column: 28, scope: !2)
!94 = !DILocation(line: 67, column: 3, scope: !2)
!95 = !DILocation(line: 68, column: 5, scope: !96)
!96 = distinct !DILexicalBlock(scope: !2, file: !1, line: 67, column: 17)
!97 = !DILocation(line: 70, column: 5, scope: !98)
!98 = distinct !DILexicalBlock(scope: !2, file: !1, line: 69, column: 10)
!99 = !DILocation(line: 72, column: 3, scope: !2)
