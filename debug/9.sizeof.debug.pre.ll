; ModuleID = 'lcc'
source_filename = "lcc"

%struct.Student = type { i32, ptr, i8, float }
%struct.Padded = type { i8, i64 }
%union.ID = type { ptr }

@0 = private unnamed_addr constant [17 x i8] c"9.sizeof.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"9.sizeof.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %longs = alloca [4 x i64], align 8
    #dbg_declare(ptr %longs, !6, !DIExpression(), !11)
  %students = alloca [3 x %struct.Student], align 8
    #dbg_declare(ptr %students, !12, !DIExpression(), !17)
  %padded = alloca %struct.Padded, align 8
    #dbg_declare(ptr %padded, !18, !DIExpression(), !24)
  %sex = alloca i32, align 4
    #dbg_declare(ptr %sex, !25, !DIExpression(), !26)
  %id = alloca %union.ID, align 8
    #dbg_declare(ptr %id, !27, !DIExpression(), !33)
  %student = alloca %struct.Student, align 8
    #dbg_declare(ptr %student, !34, !DIExpression(), !41)
  %pc = alloca ptr, align 8
    #dbg_declare(ptr %pc, !42, !DIExpression(), !43)
  %d = alloca double, align 8
    #dbg_declare(ptr %d, !44, !DIExpression(), !46)
  %f = alloca float, align 4
    #dbg_declare(ptr %f, !47, !DIExpression(), !48)
  %l = alloca i64, align 8
    #dbg_declare(ptr %l, !49, !DIExpression(), !50)
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !51, !DIExpression(), !52)
  %c = alloca i8, align 1
    #dbg_declare(ptr %c, !53, !DIExpression(), !54)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !55, !DIExpression(), !56)
  store i32 0, ptr %err, align 4, !dbg !56
  br i1 false, label %then, label %else, !dbg !57

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !58
  %0 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end, !dbg !58

else:                                             ; preds = %entry
  br label %if.end, !dbg !58

if.end:                                           ; preds = %else, %then
  br i1 false, label %then1, label %else2, !dbg !59

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !60
  %1 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end3, !dbg !60

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !60

if.end3:                                          ; preds = %else2, %then1
  br i1 false, label %then4, label %else5, !dbg !61

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !62
  %2 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end6, !dbg !62

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !62

if.end6:                                          ; preds = %else5, %then4
  br i1 false, label %then7, label %else8, !dbg !63

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !64
  %3 = load i32, ptr %err, align 4, !dbg !64
  br label %if.end9, !dbg !64

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !64

if.end9:                                          ; preds = %else8, %then7
  br i1 false, label %then10, label %else11, !dbg !65

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !66
  %4 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end12, !dbg !66

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !66

if.end12:                                         ; preds = %else11, %then10
  br i1 false, label %then13, label %else14, !dbg !67

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !68
  %5 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end15, !dbg !68

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !68

if.end15:                                         ; preds = %else14, %then13
  br i1 false, label %then16, label %else17, !dbg !69

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !70
  %6 = load i32, ptr %err, align 4, !dbg !70
  br label %if.end18, !dbg !70

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !70

if.end18:                                         ; preds = %else17, %then16
  br i1 false, label %then19, label %else20, !dbg !71

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !72
  %7 = load i32, ptr %err, align 4, !dbg !72
  br label %if.end21, !dbg !72

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !72

if.end21:                                         ; preds = %else20, %then19
  br i1 false, label %then22, label %else23, !dbg !73

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !74
  %8 = load i32, ptr %err, align 4, !dbg !74
  br label %if.end24, !dbg !74

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !74

if.end24:                                         ; preds = %else23, %then22
  br i1 false, label %then25, label %else26, !dbg !75

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !76
  %9 = load i32, ptr %err, align 4, !dbg !76
  br label %if.end27, !dbg !76

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !76

if.end27:                                         ; preds = %else26, %then25
  br i1 false, label %then28, label %else29, !dbg !77

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !78
  %10 = load i32, ptr %err, align 4, !dbg !78
  br label %if.end30, !dbg !78

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !78

if.end30:                                         ; preds = %else29, %then28
  br i1 false, label %then31, label %else32, !dbg !79

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !80
  %11 = load i32, ptr %err, align 4, !dbg !80
  br label %if.end33, !dbg !80

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !80

if.end33:                                         ; preds = %else32, %then31
  br i1 false, label %then34, label %else35, !dbg !81

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !82
  %12 = load i32, ptr %err, align 4, !dbg !82
  br label %if.end36, !dbg !82

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !82

if.end36:                                         ; preds = %else35, %then34
  br i1 false, label %then37, label %else38, !dbg !83

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !84
  %13 = load i32, ptr %err, align 4, !dbg !84
  br label %if.end39, !dbg !84

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !84

if.end39:                                         ; preds = %else38, %then37
  br i1 false, label %then40, label %else41, !dbg !85

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !86
  %14 = load i32, ptr %err, align 4, !dbg !86
  br label %if.end42, !dbg !86

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !86

if.end42:                                         ; preds = %else41, %then40
  br i1 false, label %then43, label %else44, !dbg !87

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4, !dbg !88
  %15 = load i32, ptr %err, align 4, !dbg !88
  br label %if.end45, !dbg !88

else44:                                           ; preds = %if.end42
  br label %if.end45, !dbg !88

if.end45:                                         ; preds = %else44, %then43
  br i1 false, label %then46, label %else47, !dbg !89

then46:                                           ; preds = %if.end45
  store i32 1, ptr %err, align 4, !dbg !90
  %16 = load i32, ptr %err, align 4, !dbg !90
  br label %if.end48, !dbg !90

else47:                                           ; preds = %if.end45
  br label %if.end48, !dbg !90

if.end48:                                         ; preds = %else47, %then46
  br i1 false, label %then49, label %else50, !dbg !91

then49:                                           ; preds = %if.end48
  store i32 1, ptr %err, align 4, !dbg !92
  %17 = load i32, ptr %err, align 4, !dbg !92
  br label %if.end51, !dbg !92

else50:                                           ; preds = %if.end48
  br label %if.end51, !dbg !92

if.end51:                                         ; preds = %else50, %then49
  %18 = load i32, ptr %err, align 4, !dbg !93
  %19 = icmp eq i32 %18, 0, !dbg !93
  br i1 %19, label %then52, label %else53, !dbg !93

then52:                                           ; preds = %if.end51
  %20 = call i32 (ptr, ...) @printf(ptr @0), !dbg !94
  br label %if.end54, !dbg !94

else53:                                           ; preds = %if.end51
  %21 = call i32 (ptr, ...) @printf(ptr @1), !dbg !96
  br label %if.end54, !dbg !96

if.end54:                                         ; preds = %else53, %then52
  %22 = load i32, ptr %err, align 4, !dbg !98
  ret i32 %22, !dbg !98
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "9.sizeof.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 30, type: !3, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "longs", scope: !2, file: !1, line: 43, type: !7)
!7 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 256, align: 32, elements: !9)
!8 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!9 = !{!10}
!10 = !DISubrange(count: 4, lowerBound: 0)
!11 = !DILocation(line: 43, column: 3, scope: !2)
!12 = !DILocalVariable(name: "students", scope: !2, file: !1, line: 42, type: !13)
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 576, align: 64, elements: !15)
!14 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!15 = !{!16}
!16 = !DISubrange(count: 3, lowerBound: 0)
!17 = !DILocation(line: 42, column: 3, scope: !2)
!18 = !DILocalVariable(name: "padded", scope: !2, file: !1, line: 41, type: !19)
!19 = !DICompositeType(tag: DW_TAG_structure_type, name: "Padded", file: !1, size: 96, align: 32, elements: !20)
!20 = !{!21, !23}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "c", file: !1, baseType: !22, size: 8, align: 8)
!22 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "l", file: !1, baseType: !8, size: 64, align: 32, offset: 32)
!24 = !DILocation(line: 41, column: 3, scope: !2)
!25 = !DILocalVariable(name: "sex", scope: !2, file: !1, line: 40, type: !5)
!26 = !DILocation(line: 40, column: 3, scope: !2)
!27 = !DILocalVariable(name: "id", scope: !2, file: !1, line: 39, type: !28)
!28 = !DICompositeType(tag: DW_TAG_union_type, name: "ID", file: !1, size: 64, align: 64, elements: !29)
!29 = !{!30, !31}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "id", file: !1, baseType: !5, size: 32, align: 32)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "name", file: !1, baseType: !32, size: 64, align: 64)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!33 = !DILocation(line: 39, column: 3, scope: !2)
!34 = !DILocalVariable(name: "student", scope: !2, file: !1, line: 38, type: !35)
!35 = !DICompositeType(tag: DW_TAG_structure_type, name: "Student", file: !1, size: 192, align: 64, elements: !36)
!36 = !{!30, !37, !38, !39}
!37 = !DIDerivedType(tag: DW_TAG_member, name: "name", file: !1, baseType: !32, size: 64, align: 64, offset: 64)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "sex", file: !1, baseType: !22, size: 8, align: 8, offset: 128)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "score", file: !1, baseType: !40, size: 32, align: 32, offset: 160)
!40 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!41 = !DILocation(line: 38, column: 3, scope: !2)
!42 = !DILocalVariable(name: "pc", scope: !2, file: !1, line: 37, type: !32)
!43 = !DILocation(line: 37, column: 3, scope: !2)
!44 = !DILocalVariable(name: "d", scope: !2, file: !1, line: 36, type: !45)
!45 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!46 = !DILocation(line: 36, column: 3, scope: !2)
!47 = !DILocalVariable(name: "f", scope: !2, file: !1, line: 35, type: !40)
!48 = !DILocation(line: 35, column: 3, scope: !2)
!49 = !DILocalVariable(name: "l", scope: !2, file: !1, line: 34, type: !8)
!50 = !DILocation(line: 34, column: 3, scope: !2)
!51 = !DILocalVariable(name: "i", scope: !2, file: !1, line: 33, type: !5)
!52 = !DILocation(line: 33, column: 3, scope: !2)
!53 = !DILocalVariable(name: "c", scope: !2, file: !1, line: 32, type: !22)
!54 = !DILocation(line: 32, column: 3, scope: !2)
!55 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 31, type: !5)
!56 = !DILocation(line: 31, column: 3, scope: !2)
!57 = !DILocation(line: 45, column: 3, scope: !2)
!58 = !DILocation(line: 45, column: 26, scope: !2)
!59 = !DILocation(line: 46, column: 3, scope: !2)
!60 = !DILocation(line: 46, column: 27, scope: !2)
!61 = !DILocation(line: 47, column: 3, scope: !2)
!62 = !DILocation(line: 47, column: 25, scope: !2)
!63 = !DILocation(line: 48, column: 3, scope: !2)
!64 = !DILocation(line: 48, column: 26, scope: !2)
!65 = !DILocation(line: 49, column: 3, scope: !2)
!66 = !DILocation(line: 49, column: 27, scope: !2)
!67 = !DILocation(line: 50, column: 3, scope: !2)
!68 = !DILocation(line: 50, column: 28, scope: !2)
!69 = !DILocation(line: 51, column: 3, scope: !2)
!70 = !DILocation(line: 51, column: 27, scope: !2)
!71 = !DILocation(line: 52, column: 3, scope: !2)
!72 = !DILocation(line: 52, column: 26, scope: !2)
!73 = !DILocation(line: 53, column: 3, scope: !2)
!74 = !DILocation(line: 53, column: 23, scope: !2)
!75 = !DILocation(line: 54, column: 3, scope: !2)
!76 = !DILocation(line: 54, column: 23, scope: !2)
!77 = !DILocation(line: 55, column: 3, scope: !2)
!78 = !DILocation(line: 55, column: 25, scope: !2)
!79 = !DILocation(line: 56, column: 3, scope: !2)
!80 = !DILocation(line: 56, column: 25, scope: !2)
!81 = !DILocation(line: 60, column: 3, scope: !2)
!82 = !DILocation(line: 60, column: 30, scope: !2)
!83 = !DILocation(line: 61, column: 3, scope: !2)
!84 = !DILocation(line: 61, column: 30, scope: !2)
!85 = !DILocation(line: 62, column: 3, scope: !2)
!86 = !DILocation(line: 62, column: 24, scope: !2)
!87 = !DILocation(line: 63, column: 3, scope: !2)
!88 = !DILocation(line: 63, column: 24, scope: !2)
!89 = !DILocation(line: 64, column: 3, scope: !2)
!90 = !DILocation(line: 64, column: 31, scope: !2)
!91 = !DILocation(line: 65, column: 3, scope: !2)
!92 = !DILocation(line: 65, column: 28, scope: !2)
!93 = !DILocation(line: 67, column: 3, scope: !2)
!94 = !DILocation(line: 68, column: 5, scope: !95)
!95 = distinct !DILexicalBlock(scope: !2, file: !1, line: 67, column: 17)
!96 = !DILocation(line: 70, column: 5, scope: !97)
!97 = distinct !DILexicalBlock(scope: !2, file: !1, line: 69, column: 10)
!98 = !DILocation(line: 72, column: 3, scope: !2)
