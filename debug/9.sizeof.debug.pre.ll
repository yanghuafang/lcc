; ModuleID = 'lcc'
source_filename = "lcc"

%union.ID = type { ptr }
%struct.Student = type { i32, ptr, i8, float }

@0 = private unnamed_addr constant [17 x i8] c"9.sizeof.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"9.sizeof.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %sex = alloca i32, align 4
    #dbg_declare(ptr %sex, !6, !DIExpression(), !7)
  %id = alloca %union.ID, align 8
    #dbg_declare(ptr %id, !8, !DIExpression(), !15)
  %student = alloca %struct.Student, align 8
    #dbg_declare(ptr %student, !16, !DIExpression(), !23)
  %pc = alloca ptr, align 8
    #dbg_declare(ptr %pc, !24, !DIExpression(), !25)
  %d = alloca double, align 8
    #dbg_declare(ptr %d, !26, !DIExpression(), !28)
  %f = alloca float, align 4
    #dbg_declare(ptr %f, !29, !DIExpression(), !30)
  %l = alloca i64, align 8
    #dbg_declare(ptr %l, !31, !DIExpression(), !33)
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !34, !DIExpression(), !35)
  %c = alloca i8, align 1
    #dbg_declare(ptr %c, !36, !DIExpression(), !37)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !38, !DIExpression(), !39)
  store i32 0, ptr %err, align 4, !dbg !39
  br i1 false, label %then, label %else, !dbg !40

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !41
  %0 = load i32, ptr %err, align 4, !dbg !41
  br label %if.end, !dbg !41

else:                                             ; preds = %entry
  br label %if.end, !dbg !41

if.end:                                           ; preds = %else, %then
  br i1 false, label %then1, label %else2, !dbg !42

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !43
  %1 = load i32, ptr %err, align 4, !dbg !43
  br label %if.end3, !dbg !43

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !43

if.end3:                                          ; preds = %else2, %then1
  br i1 false, label %then4, label %else5, !dbg !44

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !45
  %2 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end6, !dbg !45

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !45

if.end6:                                          ; preds = %else5, %then4
  br i1 false, label %then7, label %else8, !dbg !46

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !47
  %3 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end9, !dbg !47

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !47

if.end9:                                          ; preds = %else8, %then7
  br i1 false, label %then10, label %else11, !dbg !48

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !49
  %4 = load i32, ptr %err, align 4, !dbg !49
  br label %if.end12, !dbg !49

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !49

if.end12:                                         ; preds = %else11, %then10
  br i1 false, label %then13, label %else14, !dbg !50

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !51
  %5 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end15, !dbg !51

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !51

if.end15:                                         ; preds = %else14, %then13
  br i1 false, label %then16, label %else17, !dbg !52

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !53
  %6 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end18, !dbg !53

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !53

if.end18:                                         ; preds = %else17, %then16
  br i1 false, label %then19, label %else20, !dbg !54

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !55
  %7 = load i32, ptr %err, align 4, !dbg !55
  br label %if.end21, !dbg !55

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !55

if.end21:                                         ; preds = %else20, %then19
  br i1 false, label %then22, label %else23, !dbg !56

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !57
  %8 = load i32, ptr %err, align 4, !dbg !57
  br label %if.end24, !dbg !57

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !57

if.end24:                                         ; preds = %else23, %then22
  br i1 false, label %then25, label %else26, !dbg !58

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !59
  %9 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end27, !dbg !59

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !59

if.end27:                                         ; preds = %else26, %then25
  br i1 false, label %then28, label %else29, !dbg !60

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !61
  %10 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end30, !dbg !61

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !61

if.end30:                                         ; preds = %else29, %then28
  br i1 false, label %then31, label %else32, !dbg !62

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !63
  %11 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end33, !dbg !63

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !63

if.end33:                                         ; preds = %else32, %then31
  %12 = load i32, ptr %err, align 4, !dbg !64
  %13 = icmp eq i32 %12, 0, !dbg !64
  br i1 %13, label %then34, label %else35, !dbg !64

then34:                                           ; preds = %if.end33
  %14 = call i32 (ptr, ...) @printf(ptr @0), !dbg !65
  br label %if.end36, !dbg !65

else35:                                           ; preds = %if.end33
  %15 = call i32 (ptr, ...) @printf(ptr @1), !dbg !67
  br label %if.end36, !dbg !67

if.end36:                                         ; preds = %else35, %then34
  %16 = load i32, ptr %err, align 4, !dbg !69
  ret i32 %16, !dbg !69
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "9.sizeof.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 17, type: !3, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "sex", scope: !2, file: !1, line: 27, type: !5)
!7 = !DILocation(line: 27, column: 3, scope: !2)
!8 = !DILocalVariable(name: "id", scope: !2, file: !1, line: 26, type: !9)
!9 = !DICompositeType(tag: DW_TAG_union_type, name: "ID", file: !1, size: 64, align: 64, elements: !10)
!10 = !{!11, !12}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "id", file: !1, baseType: !5, size: 32, align: 32)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "name", file: !1, baseType: !13, size: 64, align: 64)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DILocation(line: 26, column: 3, scope: !2)
!16 = !DILocalVariable(name: "student", scope: !2, file: !1, line: 25, type: !17)
!17 = !DICompositeType(tag: DW_TAG_structure_type, name: "Student", file: !1, size: 192, align: 64, elements: !18)
!18 = !{!11, !19, !20, !21}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "name", file: !1, baseType: !13, size: 64, align: 64, offset: 64)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "sex", file: !1, baseType: !14, size: 8, align: 8, offset: 128)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "score", file: !1, baseType: !22, size: 32, align: 32, offset: 160)
!22 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!23 = !DILocation(line: 25, column: 3, scope: !2)
!24 = !DILocalVariable(name: "pc", scope: !2, file: !1, line: 24, type: !13)
!25 = !DILocation(line: 24, column: 3, scope: !2)
!26 = !DILocalVariable(name: "d", scope: !2, file: !1, line: 23, type: !27)
!27 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!28 = !DILocation(line: 23, column: 3, scope: !2)
!29 = !DILocalVariable(name: "f", scope: !2, file: !1, line: 22, type: !22)
!30 = !DILocation(line: 22, column: 3, scope: !2)
!31 = !DILocalVariable(name: "l", scope: !2, file: !1, line: 21, type: !32)
!32 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!33 = !DILocation(line: 21, column: 3, scope: !2)
!34 = !DILocalVariable(name: "i", scope: !2, file: !1, line: 20, type: !5)
!35 = !DILocation(line: 20, column: 3, scope: !2)
!36 = !DILocalVariable(name: "c", scope: !2, file: !1, line: 19, type: !14)
!37 = !DILocation(line: 19, column: 3, scope: !2)
!38 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 18, type: !5)
!39 = !DILocation(line: 18, column: 3, scope: !2)
!40 = !DILocation(line: 29, column: 3, scope: !2)
!41 = !DILocation(line: 29, column: 26, scope: !2)
!42 = !DILocation(line: 30, column: 3, scope: !2)
!43 = !DILocation(line: 30, column: 27, scope: !2)
!44 = !DILocation(line: 31, column: 3, scope: !2)
!45 = !DILocation(line: 31, column: 25, scope: !2)
!46 = !DILocation(line: 32, column: 3, scope: !2)
!47 = !DILocation(line: 32, column: 26, scope: !2)
!48 = !DILocation(line: 33, column: 3, scope: !2)
!49 = !DILocation(line: 33, column: 27, scope: !2)
!50 = !DILocation(line: 34, column: 3, scope: !2)
!51 = !DILocation(line: 34, column: 28, scope: !2)
!52 = !DILocation(line: 35, column: 3, scope: !2)
!53 = !DILocation(line: 35, column: 27, scope: !2)
!54 = !DILocation(line: 36, column: 3, scope: !2)
!55 = !DILocation(line: 36, column: 26, scope: !2)
!56 = !DILocation(line: 37, column: 3, scope: !2)
!57 = !DILocation(line: 37, column: 23, scope: !2)
!58 = !DILocation(line: 38, column: 3, scope: !2)
!59 = !DILocation(line: 38, column: 23, scope: !2)
!60 = !DILocation(line: 39, column: 3, scope: !2)
!61 = !DILocation(line: 39, column: 25, scope: !2)
!62 = !DILocation(line: 40, column: 3, scope: !2)
!63 = !DILocation(line: 40, column: 25, scope: !2)
!64 = !DILocation(line: 42, column: 3, scope: !2)
!65 = !DILocation(line: 43, column: 5, scope: !66)
!66 = distinct !DILexicalBlock(scope: !2, file: !1, line: 42, column: 17)
!67 = !DILocation(line: 45, column: 5, scope: !68)
!68 = distinct !DILexicalBlock(scope: !2, file: !1, line: 44, column: 10)
!69 = !DILocation(line: 47, column: 3, scope: !2)
