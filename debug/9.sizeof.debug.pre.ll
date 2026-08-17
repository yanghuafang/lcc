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
    #dbg_declare(ptr %longs, !8, !DIExpression(), !13)
  %students = alloca [3 x %struct.Student], align 8
    #dbg_declare(ptr %students, !14, !DIExpression(), !19)
  %padded = alloca %struct.Padded, align 8
    #dbg_declare(ptr %padded, !20, !DIExpression(), !26)
  %sex = alloca i32, align 4
    #dbg_declare(ptr %sex, !27, !DIExpression(), !28)
  %id = alloca %union.ID, align 8
    #dbg_declare(ptr %id, !29, !DIExpression(), !35)
  %student = alloca %struct.Student, align 8
    #dbg_declare(ptr %student, !36, !DIExpression(), !43)
  %pc = alloca ptr, align 8
    #dbg_declare(ptr %pc, !44, !DIExpression(), !45)
  %d = alloca double, align 8
    #dbg_declare(ptr %d, !46, !DIExpression(), !48)
  %f = alloca float, align 4
    #dbg_declare(ptr %f, !49, !DIExpression(), !50)
  %l = alloca i64, align 8
    #dbg_declare(ptr %l, !51, !DIExpression(), !52)
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !53, !DIExpression(), !54)
  %c = alloca i8, align 1
    #dbg_declare(ptr %c, !55, !DIExpression(), !56)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !57, !DIExpression(), !58)
  store i32 0, ptr %err, align 4, !dbg !58
  br i1 false, label %then, label %else, !dbg !59

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !60
  %0 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end, !dbg !60

else:                                             ; preds = %entry
  br label %if.end, !dbg !60

if.end:                                           ; preds = %else, %then
  br i1 false, label %then1, label %else2, !dbg !61

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !62
  %1 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end3, !dbg !62

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !62

if.end3:                                          ; preds = %else2, %then1
  br i1 false, label %then4, label %else5, !dbg !63

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !64
  %2 = load i32, ptr %err, align 4, !dbg !64
  br label %if.end6, !dbg !64

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !64

if.end6:                                          ; preds = %else5, %then4
  br i1 false, label %then7, label %else8, !dbg !65

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !66
  %3 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end9, !dbg !66

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !66

if.end9:                                          ; preds = %else8, %then7
  br i1 false, label %then10, label %else11, !dbg !67

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !68
  %4 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end12, !dbg !68

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !68

if.end12:                                         ; preds = %else11, %then10
  br i1 false, label %then13, label %else14, !dbg !69

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !70
  %5 = load i32, ptr %err, align 4, !dbg !70
  br label %if.end15, !dbg !70

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !70

if.end15:                                         ; preds = %else14, %then13
  br i1 false, label %then16, label %else17, !dbg !71

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !72
  %6 = load i32, ptr %err, align 4, !dbg !72
  br label %if.end18, !dbg !72

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !72

if.end18:                                         ; preds = %else17, %then16
  br i1 false, label %then19, label %else20, !dbg !73

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !74
  %7 = load i32, ptr %err, align 4, !dbg !74
  br label %if.end21, !dbg !74

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !74

if.end21:                                         ; preds = %else20, %then19
  br i1 false, label %then22, label %else23, !dbg !75

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !76
  %8 = load i32, ptr %err, align 4, !dbg !76
  br label %if.end24, !dbg !76

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !76

if.end24:                                         ; preds = %else23, %then22
  br i1 false, label %then25, label %else26, !dbg !77

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !78
  %9 = load i32, ptr %err, align 4, !dbg !78
  br label %if.end27, !dbg !78

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !78

if.end27:                                         ; preds = %else26, %then25
  br i1 false, label %then28, label %else29, !dbg !79

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !80
  %10 = load i32, ptr %err, align 4, !dbg !80
  br label %if.end30, !dbg !80

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !80

if.end30:                                         ; preds = %else29, %then28
  br i1 false, label %then31, label %else32, !dbg !81

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !82
  %11 = load i32, ptr %err, align 4, !dbg !82
  br label %if.end33, !dbg !82

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !82

if.end33:                                         ; preds = %else32, %then31
  br i1 false, label %then34, label %else35, !dbg !83

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !84
  %12 = load i32, ptr %err, align 4, !dbg !84
  br label %if.end36, !dbg !84

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !84

if.end36:                                         ; preds = %else35, %then34
  br i1 false, label %then37, label %else38, !dbg !85

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !86
  %13 = load i32, ptr %err, align 4, !dbg !86
  br label %if.end39, !dbg !86

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !86

if.end39:                                         ; preds = %else38, %then37
  br i1 false, label %then40, label %else41, !dbg !87

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !88
  %14 = load i32, ptr %err, align 4, !dbg !88
  br label %if.end42, !dbg !88

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !88

if.end42:                                         ; preds = %else41, %then40
  br i1 false, label %then43, label %else44, !dbg !89

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4, !dbg !90
  %15 = load i32, ptr %err, align 4, !dbg !90
  br label %if.end45, !dbg !90

else44:                                           ; preds = %if.end42
  br label %if.end45, !dbg !90

if.end45:                                         ; preds = %else44, %then43
  br i1 false, label %then46, label %else47, !dbg !91

then46:                                           ; preds = %if.end45
  store i32 1, ptr %err, align 4, !dbg !92
  %16 = load i32, ptr %err, align 4, !dbg !92
  br label %if.end48, !dbg !92

else47:                                           ; preds = %if.end45
  br label %if.end48, !dbg !92

if.end48:                                         ; preds = %else47, %then46
  br i1 false, label %then49, label %else50, !dbg !93

then49:                                           ; preds = %if.end48
  store i32 1, ptr %err, align 4, !dbg !94
  %17 = load i32, ptr %err, align 4, !dbg !94
  br label %if.end51, !dbg !94

else50:                                           ; preds = %if.end48
  br label %if.end51, !dbg !94

if.end51:                                         ; preds = %else50, %then49
  br i1 false, label %then52, label %else53, !dbg !95

then52:                                           ; preds = %if.end51
  store i32 1, ptr %err, align 4, !dbg !96
  %18 = load i32, ptr %err, align 4, !dbg !96
  br label %if.end54, !dbg !96

else53:                                           ; preds = %if.end51
  br label %if.end54, !dbg !96

if.end54:                                         ; preds = %else53, %then52
  br i1 false, label %then55, label %else56, !dbg !97

then55:                                           ; preds = %if.end54
  store i32 1, ptr %err, align 4, !dbg !98
  %19 = load i32, ptr %err, align 4, !dbg !98
  br label %if.end57, !dbg !98

else56:                                           ; preds = %if.end54
  br label %if.end57, !dbg !98

if.end57:                                         ; preds = %else56, %then55
  %20 = load i32, ptr %err, align 4, !dbg !99
  %21 = icmp eq i32 %20, 0, !dbg !99
  br i1 %21, label %then58, label %else59, !dbg !99

then58:                                           ; preds = %if.end57
  %22 = call i32 (ptr, ...) @printf(ptr @0), !dbg !100
  br label %if.end60, !dbg !100

else59:                                           ; preds = %if.end57
  %23 = call i32 (ptr, ...) @printf(ptr @1), !dbg !102
  br label %if.end60, !dbg !102

if.end60:                                         ; preds = %else59, %then58
  %24 = load i32, ptr %err, align 4, !dbg !104
  ret i32 %24, !dbg !104
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "9.sizeof.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 30, type: !5, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "longs", scope: !4, file: !3, line: 43, type: !9)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 256, align: 64, elements: !11)
!10 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!11 = !{!12}
!12 = !DISubrange(count: 4, lowerBound: 0)
!13 = !DILocation(line: 43, column: 3, scope: !4)
!14 = !DILocalVariable(name: "students", scope: !4, file: !3, line: 42, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 576, align: 64, elements: !17)
!16 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!17 = !{!18}
!18 = !DISubrange(count: 3, lowerBound: 0)
!19 = !DILocation(line: 42, column: 3, scope: !4)
!20 = !DILocalVariable(name: "padded", scope: !4, file: !3, line: 41, type: !21)
!21 = !DICompositeType(tag: DW_TAG_structure_type, name: "Padded", file: !3, size: 128, align: 64, elements: !22)
!22 = !{!23, !25}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "c", file: !3, baseType: !24, size: 8, align: 8)
!24 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "l", file: !3, baseType: !10, size: 64, align: 64, offset: 64)
!26 = !DILocation(line: 41, column: 3, scope: !4)
!27 = !DILocalVariable(name: "sex", scope: !4, file: !3, line: 40, type: !7)
!28 = !DILocation(line: 40, column: 3, scope: !4)
!29 = !DILocalVariable(name: "id", scope: !4, file: !3, line: 39, type: !30)
!30 = !DICompositeType(tag: DW_TAG_union_type, name: "ID", file: !3, size: 64, align: 64, elements: !31)
!31 = !{!32, !33}
!32 = !DIDerivedType(tag: DW_TAG_member, name: "id", file: !3, baseType: !7, size: 32, align: 32)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "name", file: !3, baseType: !34, size: 64, align: 64)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!35 = !DILocation(line: 39, column: 3, scope: !4)
!36 = !DILocalVariable(name: "student", scope: !4, file: !3, line: 38, type: !37)
!37 = !DICompositeType(tag: DW_TAG_structure_type, name: "Student", file: !3, size: 192, align: 64, elements: !38)
!38 = !{!32, !39, !40, !41}
!39 = !DIDerivedType(tag: DW_TAG_member, name: "name", file: !3, baseType: !34, size: 64, align: 64, offset: 64)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "sex", file: !3, baseType: !24, size: 8, align: 8, offset: 128)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "score", file: !3, baseType: !42, size: 32, align: 32, offset: 160)
!42 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!43 = !DILocation(line: 38, column: 3, scope: !4)
!44 = !DILocalVariable(name: "pc", scope: !4, file: !3, line: 37, type: !34)
!45 = !DILocation(line: 37, column: 3, scope: !4)
!46 = !DILocalVariable(name: "d", scope: !4, file: !3, line: 36, type: !47)
!47 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!48 = !DILocation(line: 36, column: 3, scope: !4)
!49 = !DILocalVariable(name: "f", scope: !4, file: !3, line: 35, type: !42)
!50 = !DILocation(line: 35, column: 3, scope: !4)
!51 = !DILocalVariable(name: "l", scope: !4, file: !3, line: 34, type: !10)
!52 = !DILocation(line: 34, column: 3, scope: !4)
!53 = !DILocalVariable(name: "i", scope: !4, file: !3, line: 33, type: !7)
!54 = !DILocation(line: 33, column: 3, scope: !4)
!55 = !DILocalVariable(name: "c", scope: !4, file: !3, line: 32, type: !24)
!56 = !DILocation(line: 32, column: 3, scope: !4)
!57 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 31, type: !7)
!58 = !DILocation(line: 31, column: 3, scope: !4)
!59 = !DILocation(line: 45, column: 3, scope: !4)
!60 = !DILocation(line: 45, column: 26, scope: !4)
!61 = !DILocation(line: 46, column: 3, scope: !4)
!62 = !DILocation(line: 46, column: 27, scope: !4)
!63 = !DILocation(line: 47, column: 3, scope: !4)
!64 = !DILocation(line: 47, column: 25, scope: !4)
!65 = !DILocation(line: 48, column: 3, scope: !4)
!66 = !DILocation(line: 48, column: 26, scope: !4)
!67 = !DILocation(line: 49, column: 3, scope: !4)
!68 = !DILocation(line: 49, column: 27, scope: !4)
!69 = !DILocation(line: 50, column: 3, scope: !4)
!70 = !DILocation(line: 50, column: 28, scope: !4)
!71 = !DILocation(line: 51, column: 3, scope: !4)
!72 = !DILocation(line: 51, column: 27, scope: !4)
!73 = !DILocation(line: 52, column: 3, scope: !4)
!74 = !DILocation(line: 52, column: 26, scope: !4)
!75 = !DILocation(line: 53, column: 3, scope: !4)
!76 = !DILocation(line: 53, column: 23, scope: !4)
!77 = !DILocation(line: 54, column: 3, scope: !4)
!78 = !DILocation(line: 54, column: 23, scope: !4)
!79 = !DILocation(line: 55, column: 3, scope: !4)
!80 = !DILocation(line: 55, column: 25, scope: !4)
!81 = !DILocation(line: 56, column: 3, scope: !4)
!82 = !DILocation(line: 56, column: 25, scope: !4)
!83 = !DILocation(line: 60, column: 3, scope: !4)
!84 = !DILocation(line: 60, column: 29, scope: !4)
!85 = !DILocation(line: 61, column: 3, scope: !4)
!86 = !DILocation(line: 61, column: 29, scope: !4)
!87 = !DILocation(line: 62, column: 3, scope: !4)
!88 = !DILocation(line: 62, column: 30, scope: !4)
!89 = !DILocation(line: 63, column: 3, scope: !4)
!90 = !DILocation(line: 63, column: 30, scope: !4)
!91 = !DILocation(line: 64, column: 3, scope: !4)
!92 = !DILocation(line: 64, column: 24, scope: !4)
!93 = !DILocation(line: 65, column: 3, scope: !4)
!94 = !DILocation(line: 65, column: 24, scope: !4)
!95 = !DILocation(line: 66, column: 3, scope: !4)
!96 = !DILocation(line: 66, column: 31, scope: !4)
!97 = !DILocation(line: 67, column: 3, scope: !4)
!98 = !DILocation(line: 67, column: 28, scope: !4)
!99 = !DILocation(line: 69, column: 3, scope: !4)
!100 = !DILocation(line: 70, column: 5, scope: !101)
!101 = distinct !DILexicalBlock(scope: !4, file: !3, line: 69, column: 17)
!102 = !DILocation(line: 72, column: 5, scope: !103)
!103 = distinct !DILexicalBlock(scope: !4, file: !3, line: 71, column: 10)
!104 = !DILocation(line: 74, column: 3, scope: !4)
