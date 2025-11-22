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

define i32 @main() !dbg !4 {
entry:
  %longs = alloca [4 x i64], align 8
    #dbg_declare(ptr %longs, !9, !DIExpression(), !14)
  %students = alloca [3 x %struct.Student], align 8
    #dbg_declare(ptr %students, !15, !DIExpression(), !20)
  %padded = alloca %struct.Padded, align 8
    #dbg_declare(ptr %padded, !21, !DIExpression(), !27)
  %sex = alloca i32, align 4
    #dbg_declare(ptr %sex, !28, !DIExpression(), !29)
  %id = alloca %union.ID, align 8
    #dbg_declare(ptr %id, !30, !DIExpression(), !36)
  %student = alloca %struct.Student, align 8
    #dbg_declare(ptr %student, !37, !DIExpression(), !44)
  %pc = alloca ptr, align 8
    #dbg_declare(ptr %pc, !45, !DIExpression(), !46)
  %d = alloca double, align 8
    #dbg_declare(ptr %d, !47, !DIExpression(), !49)
  %f = alloca float, align 4
    #dbg_declare(ptr %f, !50, !DIExpression(), !51)
  %l = alloca i64, align 8
    #dbg_declare(ptr %l, !52, !DIExpression(), !53)
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !54, !DIExpression(), !55)
  %c = alloca i8, align 1
    #dbg_declare(ptr %c, !56, !DIExpression(), !57)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !58, !DIExpression(), !59)
  store i32 0, ptr %err, align 4, !dbg !59
  br i1 false, label %then, label %else, !dbg !60

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !61
  %0 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end, !dbg !61

else:                                             ; preds = %entry
  br label %if.end, !dbg !61

if.end:                                           ; preds = %else, %then
  br i1 false, label %then1, label %else2, !dbg !62

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !63
  %1 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end3, !dbg !63

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !63

if.end3:                                          ; preds = %else2, %then1
  br i1 false, label %then4, label %else5, !dbg !64

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !65
  %2 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end6, !dbg !65

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !65

if.end6:                                          ; preds = %else5, %then4
  br i1 false, label %then7, label %else8, !dbg !66

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !67
  %3 = load i32, ptr %err, align 4, !dbg !67
  br label %if.end9, !dbg !67

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !67

if.end9:                                          ; preds = %else8, %then7
  br i1 false, label %then10, label %else11, !dbg !68

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !69
  %4 = load i32, ptr %err, align 4, !dbg !69
  br label %if.end12, !dbg !69

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !69

if.end12:                                         ; preds = %else11, %then10
  br i1 false, label %then13, label %else14, !dbg !70

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !71
  %5 = load i32, ptr %err, align 4, !dbg !71
  br label %if.end15, !dbg !71

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !71

if.end15:                                         ; preds = %else14, %then13
  br i1 false, label %then16, label %else17, !dbg !72

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !73
  %6 = load i32, ptr %err, align 4, !dbg !73
  br label %if.end18, !dbg !73

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !73

if.end18:                                         ; preds = %else17, %then16
  br i1 false, label %then19, label %else20, !dbg !74

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !75
  %7 = load i32, ptr %err, align 4, !dbg !75
  br label %if.end21, !dbg !75

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !75

if.end21:                                         ; preds = %else20, %then19
  br i1 false, label %then22, label %else23, !dbg !76

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !77
  %8 = load i32, ptr %err, align 4, !dbg !77
  br label %if.end24, !dbg !77

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !77

if.end24:                                         ; preds = %else23, %then22
  br i1 false, label %then25, label %else26, !dbg !78

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !79
  %9 = load i32, ptr %err, align 4, !dbg !79
  br label %if.end27, !dbg !79

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !79

if.end27:                                         ; preds = %else26, %then25
  br i1 false, label %then28, label %else29, !dbg !80

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !81
  %10 = load i32, ptr %err, align 4, !dbg !81
  br label %if.end30, !dbg !81

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !81

if.end30:                                         ; preds = %else29, %then28
  br i1 false, label %then31, label %else32, !dbg !82

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !83
  %11 = load i32, ptr %err, align 4, !dbg !83
  br label %if.end33, !dbg !83

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !83

if.end33:                                         ; preds = %else32, %then31
  br i1 false, label %then34, label %else35, !dbg !84

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !85
  %12 = load i32, ptr %err, align 4, !dbg !85
  br label %if.end36, !dbg !85

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !85

if.end36:                                         ; preds = %else35, %then34
  br i1 false, label %then37, label %else38, !dbg !86

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !87
  %13 = load i32, ptr %err, align 4, !dbg !87
  br label %if.end39, !dbg !87

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !87

if.end39:                                         ; preds = %else38, %then37
  br i1 false, label %then40, label %else41, !dbg !88

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !89
  %14 = load i32, ptr %err, align 4, !dbg !89
  br label %if.end42, !dbg !89

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !89

if.end42:                                         ; preds = %else41, %then40
  br i1 false, label %then43, label %else44, !dbg !90

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4, !dbg !91
  %15 = load i32, ptr %err, align 4, !dbg !91
  br label %if.end45, !dbg !91

else44:                                           ; preds = %if.end42
  br label %if.end45, !dbg !91

if.end45:                                         ; preds = %else44, %then43
  br i1 false, label %then46, label %else47, !dbg !92

then46:                                           ; preds = %if.end45
  store i32 1, ptr %err, align 4, !dbg !93
  %16 = load i32, ptr %err, align 4, !dbg !93
  br label %if.end48, !dbg !93

else47:                                           ; preds = %if.end45
  br label %if.end48, !dbg !93

if.end48:                                         ; preds = %else47, %then46
  br i1 false, label %then49, label %else50, !dbg !94

then49:                                           ; preds = %if.end48
  store i32 1, ptr %err, align 4, !dbg !95
  %17 = load i32, ptr %err, align 4, !dbg !95
  br label %if.end51, !dbg !95

else50:                                           ; preds = %if.end48
  br label %if.end51, !dbg !95

if.end51:                                         ; preds = %else50, %then49
  %18 = load i32, ptr %err, align 4, !dbg !96
  %19 = icmp eq i32 %18, 0, !dbg !96
  br i1 %19, label %then52, label %else53, !dbg !96

then52:                                           ; preds = %if.end51
  %20 = call i32 (ptr, ...) @printf(ptr @0), !dbg !97
  br label %if.end54, !dbg !97

else53:                                           ; preds = %if.end51
  %21 = call i32 (ptr, ...) @printf(ptr @1), !dbg !99
  br label %if.end54, !dbg !99

if.end54:                                         ; preds = %else53, %then52
  %22 = load i32, ptr %err, align 4, !dbg !101
  ret i32 %22, !dbg !101
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "9.sizeof.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 30, type: !5, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "longs", scope: !4, file: !1, line: 43, type: !10)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 256, align: 32, elements: !12)
!11 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!12 = !{!13}
!13 = !DISubrange(count: 4, lowerBound: 0)
!14 = !DILocation(line: 43, column: 3, scope: !4)
!15 = !DILocalVariable(name: "students", scope: !4, file: !1, line: 42, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 576, align: 64, elements: !18)
!17 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!18 = !{!19}
!19 = !DISubrange(count: 3, lowerBound: 0)
!20 = !DILocation(line: 42, column: 3, scope: !4)
!21 = !DILocalVariable(name: "padded", scope: !4, file: !1, line: 41, type: !22)
!22 = !DICompositeType(tag: DW_TAG_structure_type, name: "Padded", file: !1, size: 96, align: 32, elements: !23)
!23 = !{!24, !26}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "c", file: !1, baseType: !25, size: 8, align: 8)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "l", file: !1, baseType: !11, size: 64, align: 32, offset: 32)
!27 = !DILocation(line: 41, column: 3, scope: !4)
!28 = !DILocalVariable(name: "sex", scope: !4, file: !1, line: 40, type: !7)
!29 = !DILocation(line: 40, column: 3, scope: !4)
!30 = !DILocalVariable(name: "id", scope: !4, file: !1, line: 39, type: !31)
!31 = !DICompositeType(tag: DW_TAG_union_type, name: "ID", file: !1, size: 64, align: 64, elements: !32)
!32 = !{!33, !34}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "id", file: !1, baseType: !7, size: 32, align: 32)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "name", file: !1, baseType: !35, size: 64, align: 64)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!36 = !DILocation(line: 39, column: 3, scope: !4)
!37 = !DILocalVariable(name: "student", scope: !4, file: !1, line: 38, type: !38)
!38 = !DICompositeType(tag: DW_TAG_structure_type, name: "Student", file: !1, size: 192, align: 64, elements: !39)
!39 = !{!33, !40, !41, !42}
!40 = !DIDerivedType(tag: DW_TAG_member, name: "name", file: !1, baseType: !35, size: 64, align: 64, offset: 64)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "sex", file: !1, baseType: !25, size: 8, align: 8, offset: 128)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "score", file: !1, baseType: !43, size: 32, align: 32, offset: 160)
!43 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!44 = !DILocation(line: 38, column: 3, scope: !4)
!45 = !DILocalVariable(name: "pc", scope: !4, file: !1, line: 37, type: !35)
!46 = !DILocation(line: 37, column: 3, scope: !4)
!47 = !DILocalVariable(name: "d", scope: !4, file: !1, line: 36, type: !48)
!48 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!49 = !DILocation(line: 36, column: 3, scope: !4)
!50 = !DILocalVariable(name: "f", scope: !4, file: !1, line: 35, type: !43)
!51 = !DILocation(line: 35, column: 3, scope: !4)
!52 = !DILocalVariable(name: "l", scope: !4, file: !1, line: 34, type: !11)
!53 = !DILocation(line: 34, column: 3, scope: !4)
!54 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 33, type: !7)
!55 = !DILocation(line: 33, column: 3, scope: !4)
!56 = !DILocalVariable(name: "c", scope: !4, file: !1, line: 32, type: !25)
!57 = !DILocation(line: 32, column: 3, scope: !4)
!58 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 31, type: !7)
!59 = !DILocation(line: 31, column: 3, scope: !4)
!60 = !DILocation(line: 45, column: 3, scope: !4)
!61 = !DILocation(line: 45, column: 26, scope: !4)
!62 = !DILocation(line: 46, column: 3, scope: !4)
!63 = !DILocation(line: 46, column: 27, scope: !4)
!64 = !DILocation(line: 47, column: 3, scope: !4)
!65 = !DILocation(line: 47, column: 25, scope: !4)
!66 = !DILocation(line: 48, column: 3, scope: !4)
!67 = !DILocation(line: 48, column: 26, scope: !4)
!68 = !DILocation(line: 49, column: 3, scope: !4)
!69 = !DILocation(line: 49, column: 27, scope: !4)
!70 = !DILocation(line: 50, column: 3, scope: !4)
!71 = !DILocation(line: 50, column: 28, scope: !4)
!72 = !DILocation(line: 51, column: 3, scope: !4)
!73 = !DILocation(line: 51, column: 27, scope: !4)
!74 = !DILocation(line: 52, column: 3, scope: !4)
!75 = !DILocation(line: 52, column: 26, scope: !4)
!76 = !DILocation(line: 53, column: 3, scope: !4)
!77 = !DILocation(line: 53, column: 23, scope: !4)
!78 = !DILocation(line: 54, column: 3, scope: !4)
!79 = !DILocation(line: 54, column: 23, scope: !4)
!80 = !DILocation(line: 55, column: 3, scope: !4)
!81 = !DILocation(line: 55, column: 25, scope: !4)
!82 = !DILocation(line: 56, column: 3, scope: !4)
!83 = !DILocation(line: 56, column: 25, scope: !4)
!84 = !DILocation(line: 60, column: 3, scope: !4)
!85 = !DILocation(line: 60, column: 30, scope: !4)
!86 = !DILocation(line: 61, column: 3, scope: !4)
!87 = !DILocation(line: 61, column: 30, scope: !4)
!88 = !DILocation(line: 62, column: 3, scope: !4)
!89 = !DILocation(line: 62, column: 24, scope: !4)
!90 = !DILocation(line: 63, column: 3, scope: !4)
!91 = !DILocation(line: 63, column: 24, scope: !4)
!92 = !DILocation(line: 64, column: 3, scope: !4)
!93 = !DILocation(line: 64, column: 31, scope: !4)
!94 = !DILocation(line: 65, column: 3, scope: !4)
!95 = !DILocation(line: 65, column: 28, scope: !4)
!96 = !DILocation(line: 67, column: 3, scope: !4)
!97 = !DILocation(line: 68, column: 5, scope: !98)
!98 = distinct !DILexicalBlock(scope: !4, file: !1, line: 67, column: 17)
!99 = !DILocation(line: 70, column: 5, scope: !100)
!100 = distinct !DILexicalBlock(scope: !4, file: !1, line: 69, column: 10)
!101 = !DILocation(line: 72, column: 3, scope: !4)
