; ModuleID = 'lcc'
source_filename = "lcc"

%struct.Employee = type { ptr, i8, i32, i32, float }

@0 = private unnamed_addr constant [9 x i8] c"employee\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"2.struct_type.c PASS\0A\00", align 1
@2 = private unnamed_addr constant [22 x i8] c"2.struct_type.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %age = alloca i32, align 4
    #dbg_declare(ptr %age, !6, !DIExpression(), !7)
  %sex = alloca i32, align 4
    #dbg_declare(ptr %sex, !8, !DIExpression(), !9)
  %id = alloca i32, align 4
    #dbg_declare(ptr %id, !10, !DIExpression(), !11)
  %employee = alloca %struct.Employee, align 8
    #dbg_declare(ptr %employee, !12, !DIExpression(), !24)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !25, !DIExpression(), !26)
  store i32 0, ptr %err, align 4, !dbg !26
  %0 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 0, !dbg !27
  store ptr @0, ptr %0, align 8, !dbg !27
  %1 = load ptr, ptr %0, align 8, !dbg !27
  %2 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 1, !dbg !28
  store i8 77, ptr %2, align 1, !dbg !28
  %3 = load i8, ptr %2, align 1, !dbg !28
  %4 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 2, !dbg !29
  store i32 100, ptr %4, align 4, !dbg !29
  %5 = load i32, ptr %4, align 4, !dbg !29
  %6 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 3, !dbg !30
  store i32 22, ptr %6, align 4, !dbg !30
  %7 = load i32, ptr %6, align 4, !dbg !30
  %8 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 4, !dbg !31
  store float 3.000000e+03, ptr %8, align 4, !dbg !31
  %9 = load float, ptr %8, align 4, !dbg !31
  %10 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 2, !dbg !11
  %11 = load i32, ptr %10, align 4, !dbg !11
  store i32 %11, ptr %id, align 4, !dbg !11
  %12 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 1, !dbg !9
  %13 = load i8, ptr %12, align 1, !dbg !9
  %14 = sext i8 %13 to i32, !dbg !9
  store i32 %14, ptr %sex, align 4, !dbg !9
  %15 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 3, !dbg !7
  %16 = load i32, ptr %15, align 4, !dbg !7
  store i32 %16, ptr %age, align 4, !dbg !7
  %17 = load i32, ptr %id, align 4, !dbg !32
  %18 = icmp ne i32 %17, 100, !dbg !32
  br i1 %18, label %then, label %else, !dbg !32

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !33
  %19 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end, !dbg !33

else:                                             ; preds = %entry
  br label %if.end, !dbg !33

if.end:                                           ; preds = %else, %then
  %20 = load i32, ptr %sex, align 4, !dbg !34
  %21 = icmp ne i32 %20, 77, !dbg !34
  br i1 %21, label %then1, label %else2, !dbg !34

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !35
  %22 = load i32, ptr %err, align 4, !dbg !35
  br label %if.end3, !dbg !35

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !35

if.end3:                                          ; preds = %else2, %then1
  %23 = load i32, ptr %age, align 4, !dbg !36
  %24 = icmp ne i32 %23, 22, !dbg !36
  br i1 %24, label %then4, label %else5, !dbg !36

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !37
  %25 = load i32, ptr %err, align 4, !dbg !37
  br label %if.end6, !dbg !37

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !37

if.end6:                                          ; preds = %else5, %then4
  %26 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 3, !dbg !38
  store i32 0, ptr %26, align 4, !dbg !38
  %27 = load i32, ptr %26, align 4, !dbg !38
  %28 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 3, !dbg !39
  %29 = load i32, ptr %28, align 4, !dbg !39
  store i32 %29, ptr %age, align 4, !dbg !39
  %30 = load i32, ptr %age, align 4, !dbg !39
  %31 = load i32, ptr %age, align 4, !dbg !40
  %32 = icmp ne i32 %31, 0, !dbg !40
  br i1 %32, label %then7, label %else8, !dbg !40

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !41
  %33 = load i32, ptr %err, align 4, !dbg !41
  br label %if.end9, !dbg !41

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !41

if.end9:                                          ; preds = %else8, %then7
  %34 = load i32, ptr %err, align 4, !dbg !42
  %35 = icmp eq i32 %34, 0, !dbg !42
  br i1 %35, label %then10, label %else11, !dbg !42

then10:                                           ; preds = %if.end9
  %36 = call i32 (ptr, ...) @printf(ptr @1), !dbg !43
  br label %if.end12, !dbg !43

else11:                                           ; preds = %if.end9
  %37 = call i32 (ptr, ...) @printf(ptr @2), !dbg !45
  br label %if.end12, !dbg !45

if.end12:                                         ; preds = %else11, %then10
  %38 = load i32, ptr %err, align 4, !dbg !47
  ret i32 %38, !dbg !47
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "2.struct_type.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 11, type: !3, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "age", scope: !2, file: !1, line: 22, type: !5)
!7 = !DILocation(line: 22, column: 3, scope: !2)
!8 = !DILocalVariable(name: "sex", scope: !2, file: !1, line: 21, type: !5)
!9 = !DILocation(line: 21, column: 3, scope: !2)
!10 = !DILocalVariable(name: "id", scope: !2, file: !1, line: 20, type: !5)
!11 = !DILocation(line: 20, column: 3, scope: !2)
!12 = !DILocalVariable(name: "employee", scope: !2, file: !1, line: 13, type: !13)
!13 = !DICompositeType(tag: DW_TAG_structure_type, name: "Employee", file: !1, size: 192, align: 64, elements: !14)
!14 = !{!15, !18, !19, !20, !22}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "name", file: !1, baseType: !16, size: 64, align: 64)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "sex", file: !1, baseType: !17, size: 8, align: 8, offset: 64)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "id", file: !1, baseType: !5, size: 32, align: 32, offset: 96)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "age", file: !1, baseType: !21, size: 32, align: 32, offset: 128)
!21 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "salary", file: !1, baseType: !23, size: 32, align: 32, offset: 160)
!23 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!24 = !DILocation(line: 13, column: 3, scope: !2)
!25 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 12, type: !5)
!26 = !DILocation(line: 12, column: 3, scope: !2)
!27 = !DILocation(line: 14, column: 3, scope: !2)
!28 = !DILocation(line: 15, column: 3, scope: !2)
!29 = !DILocation(line: 16, column: 3, scope: !2)
!30 = !DILocation(line: 17, column: 3, scope: !2)
!31 = !DILocation(line: 18, column: 3, scope: !2)
!32 = !DILocation(line: 23, column: 3, scope: !2)
!33 = !DILocation(line: 23, column: 18, scope: !2)
!34 = !DILocation(line: 24, column: 3, scope: !2)
!35 = !DILocation(line: 24, column: 19, scope: !2)
!36 = !DILocation(line: 25, column: 3, scope: !2)
!37 = !DILocation(line: 25, column: 18, scope: !2)
!38 = !DILocation(line: 27, column: 3, scope: !2)
!39 = !DILocation(line: 28, column: 3, scope: !2)
!40 = !DILocation(line: 29, column: 3, scope: !2)
!41 = !DILocation(line: 29, column: 17, scope: !2)
!42 = !DILocation(line: 31, column: 3, scope: !2)
!43 = !DILocation(line: 32, column: 5, scope: !44)
!44 = distinct !DILexicalBlock(scope: !2, file: !1, line: 31, column: 17)
!45 = !DILocation(line: 34, column: 5, scope: !46)
!46 = distinct !DILexicalBlock(scope: !2, file: !1, line: 33, column: 10)
!47 = !DILocation(line: 36, column: 3, scope: !2)
