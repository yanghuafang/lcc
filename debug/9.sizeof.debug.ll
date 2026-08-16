; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

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
  br i1 false, label %then, label %else, !dbg !43

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !44
  %0 = load i32, ptr %err, align 4, !dbg !44
  br label %if.end, !dbg !44

else:                                             ; preds = %entry
  br label %if.end, !dbg !44

if.end:                                           ; preds = %else, %then
  br i1 false, label %then1, label %else2, !dbg !45

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !46
  %1 = load i32, ptr %err, align 4, !dbg !46
  br label %if.end3, !dbg !46

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !46

if.end3:                                          ; preds = %else2, %then1
  br i1 false, label %then4, label %else5, !dbg !47

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !48
  %2 = load i32, ptr %err, align 4, !dbg !48
  br label %if.end6, !dbg !48

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !48

if.end6:                                          ; preds = %else5, %then4
  br i1 false, label %then7, label %else8, !dbg !49

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !50
  %3 = load i32, ptr %err, align 4, !dbg !50
  br label %if.end9, !dbg !50

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !50

if.end9:                                          ; preds = %else8, %then7
  br i1 false, label %then10, label %else11, !dbg !51

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !52
  %4 = load i32, ptr %err, align 4, !dbg !52
  br label %if.end12, !dbg !52

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !52

if.end12:                                         ; preds = %else11, %then10
  br i1 false, label %then13, label %else14, !dbg !53

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !54
  %5 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end15, !dbg !54

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !54

if.end15:                                         ; preds = %else14, %then13
  br i1 false, label %then16, label %else17, !dbg !55

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !56
  %6 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end18, !dbg !56

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !56

if.end18:                                         ; preds = %else17, %then16
  br i1 false, label %then19, label %else20, !dbg !57

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !58
  %7 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end21, !dbg !58

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !58

if.end21:                                         ; preds = %else20, %then19
  br i1 false, label %then22, label %else23, !dbg !59

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !60
  %8 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end24, !dbg !60

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !60

if.end24:                                         ; preds = %else23, %then22
  br i1 false, label %then25, label %else26, !dbg !61

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !62
  %9 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end27, !dbg !62

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !62

if.end27:                                         ; preds = %else26, %then25
  br i1 false, label %then28, label %else29, !dbg !63

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !64
  %10 = load i32, ptr %err, align 4, !dbg !64
  br label %if.end30, !dbg !64

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !64

if.end30:                                         ; preds = %else29, %then28
  br i1 false, label %then31, label %else32, !dbg !65

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !66
  %11 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end33, !dbg !66

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !66

if.end33:                                         ; preds = %else32, %then31
  %12 = load i32, ptr %err, align 4, !dbg !67
  %13 = icmp eq i32 %12, 0, !dbg !67
  br i1 %13, label %then34, label %else35, !dbg !67

then34:                                           ; preds = %if.end33
  %14 = call i32 (ptr, ...) @printf(ptr @0), !dbg !68
  br label %if.end36, !dbg !68

else35:                                           ; preds = %if.end33
  %15 = call i32 (ptr, ...) @printf(ptr @1), !dbg !70
  br label %if.end36, !dbg !70

if.end36:                                         ; preds = %else35, %then34
  %16 = load i32, ptr %err, align 4, !dbg !72
  ret i32 %16, !dbg !72
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "9.sizeof.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 20, type: !5, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "sex", scope: !4, file: !1, line: 30, type: !7)
!10 = !DILocation(line: 30, column: 3, scope: !4)
!11 = !DILocalVariable(name: "id", scope: !4, file: !1, line: 29, type: !12)
!12 = !DICompositeType(tag: DW_TAG_union_type, name: "ID", file: !1, size: 64, align: 64, elements: !13)
!13 = !{!14, !15}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "id", file: !1, baseType: !7, size: 32, align: 32)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "name", file: !1, baseType: !16, size: 64, align: 64)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 29, column: 3, scope: !4)
!19 = !DILocalVariable(name: "student", scope: !4, file: !1, line: 28, type: !20)
!20 = !DICompositeType(tag: DW_TAG_structure_type, name: "Student", file: !1, size: 192, align: 64, elements: !21)
!21 = !{!14, !22, !23, !24}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "name", file: !1, baseType: !16, size: 64, align: 64, offset: 64)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "sex", file: !1, baseType: !17, size: 8, align: 8, offset: 128)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "score", file: !1, baseType: !25, size: 32, align: 32, offset: 160)
!25 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!26 = !DILocation(line: 28, column: 3, scope: !4)
!27 = !DILocalVariable(name: "pc", scope: !4, file: !1, line: 27, type: !16)
!28 = !DILocation(line: 27, column: 3, scope: !4)
!29 = !DILocalVariable(name: "d", scope: !4, file: !1, line: 26, type: !30)
!30 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!31 = !DILocation(line: 26, column: 3, scope: !4)
!32 = !DILocalVariable(name: "f", scope: !4, file: !1, line: 25, type: !25)
!33 = !DILocation(line: 25, column: 3, scope: !4)
!34 = !DILocalVariable(name: "l", scope: !4, file: !1, line: 24, type: !35)
!35 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!36 = !DILocation(line: 24, column: 3, scope: !4)
!37 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 23, type: !7)
!38 = !DILocation(line: 23, column: 3, scope: !4)
!39 = !DILocalVariable(name: "c", scope: !4, file: !1, line: 22, type: !17)
!40 = !DILocation(line: 22, column: 3, scope: !4)
!41 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 21, type: !7)
!42 = !DILocation(line: 21, column: 3, scope: !4)
!43 = !DILocation(line: 32, column: 3, scope: !4)
!44 = !DILocation(line: 32, column: 26, scope: !4)
!45 = !DILocation(line: 33, column: 3, scope: !4)
!46 = !DILocation(line: 33, column: 27, scope: !4)
!47 = !DILocation(line: 34, column: 3, scope: !4)
!48 = !DILocation(line: 34, column: 25, scope: !4)
!49 = !DILocation(line: 35, column: 3, scope: !4)
!50 = !DILocation(line: 35, column: 26, scope: !4)
!51 = !DILocation(line: 36, column: 3, scope: !4)
!52 = !DILocation(line: 36, column: 27, scope: !4)
!53 = !DILocation(line: 37, column: 3, scope: !4)
!54 = !DILocation(line: 37, column: 28, scope: !4)
!55 = !DILocation(line: 38, column: 3, scope: !4)
!56 = !DILocation(line: 38, column: 27, scope: !4)
!57 = !DILocation(line: 39, column: 3, scope: !4)
!58 = !DILocation(line: 39, column: 26, scope: !4)
!59 = !DILocation(line: 40, column: 3, scope: !4)
!60 = !DILocation(line: 40, column: 23, scope: !4)
!61 = !DILocation(line: 41, column: 3, scope: !4)
!62 = !DILocation(line: 41, column: 23, scope: !4)
!63 = !DILocation(line: 42, column: 3, scope: !4)
!64 = !DILocation(line: 42, column: 25, scope: !4)
!65 = !DILocation(line: 43, column: 3, scope: !4)
!66 = !DILocation(line: 43, column: 25, scope: !4)
!67 = !DILocation(line: 45, column: 3, scope: !4)
!68 = !DILocation(line: 46, column: 5, scope: !69)
!69 = distinct !DILexicalBlock(scope: !4, file: !1, line: 45, column: 17)
!70 = !DILocation(line: 48, column: 5, scope: !71)
!71 = distinct !DILexicalBlock(scope: !4, file: !1, line: 47, column: 10)
!72 = !DILocation(line: 50, column: 3, scope: !4)
