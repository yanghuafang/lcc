; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

%struct.Employee = type { ptr, i8, i32, i32, float }

@0 = private unnamed_addr constant [9 x i8] c"employee\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"2.struct_type.c PASS\0A\00", align 1
@2 = private unnamed_addr constant [22 x i8] c"2.struct_type.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %age = alloca i32, align 4
    #dbg_declare(ptr %age, !9, !DIExpression(), !10)
  %sex = alloca i32, align 4
    #dbg_declare(ptr %sex, !11, !DIExpression(), !12)
  %id = alloca i32, align 4
    #dbg_declare(ptr %id, !13, !DIExpression(), !14)
  %employee = alloca %struct.Employee, align 8
    #dbg_declare(ptr %employee, !15, !DIExpression(), !27)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !28, !DIExpression(), !29)
  store i32 0, ptr %err, align 4, !dbg !29
  %0 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 0, !dbg !30
  store ptr @0, ptr %0, align 8, !dbg !30
  %1 = load ptr, ptr %0, align 8, !dbg !30
  %2 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 1, !dbg !31
  store i8 77, ptr %2, align 1, !dbg !31
  %3 = load i8, ptr %2, align 1, !dbg !31
  %4 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 2, !dbg !32
  store i32 100, ptr %4, align 4, !dbg !32
  %5 = load i32, ptr %4, align 4, !dbg !32
  %6 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 3, !dbg !33
  store i32 22, ptr %6, align 4, !dbg !33
  %7 = load i32, ptr %6, align 4, !dbg !33
  %8 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 4, !dbg !34
  store float 3.000000e+03, ptr %8, align 4, !dbg !34
  %9 = load float, ptr %8, align 4, !dbg !34
  %10 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 2, !dbg !14
  %11 = load i32, ptr %10, align 4, !dbg !14
  store i32 %11, ptr %id, align 4, !dbg !14
  %12 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 1, !dbg !12
  %13 = load i8, ptr %12, align 1, !dbg !12
  %14 = sext i8 %13 to i32, !dbg !12
  store i32 %14, ptr %sex, align 4, !dbg !12
  %15 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 3, !dbg !10
  %16 = load i32, ptr %15, align 4, !dbg !10
  store i32 %16, ptr %age, align 4, !dbg !10
  %17 = load i32, ptr %id, align 4, !dbg !35
  %18 = icmp ne i32 %17, 100, !dbg !35
  br i1 %18, label %then, label %else, !dbg !35

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !36
  %19 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end, !dbg !36

else:                                             ; preds = %entry
  br label %if.end, !dbg !36

if.end:                                           ; preds = %else, %then
  %20 = load i32, ptr %sex, align 4, !dbg !37
  %21 = icmp ne i32 %20, 77, !dbg !37
  br i1 %21, label %then1, label %else2, !dbg !37

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !38
  %22 = load i32, ptr %err, align 4, !dbg !38
  br label %if.end3, !dbg !38

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !38

if.end3:                                          ; preds = %else2, %then1
  %23 = load i32, ptr %age, align 4, !dbg !39
  %24 = icmp ne i32 %23, 22, !dbg !39
  br i1 %24, label %then4, label %else5, !dbg !39

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !40
  %25 = load i32, ptr %err, align 4, !dbg !40
  br label %if.end6, !dbg !40

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !40

if.end6:                                          ; preds = %else5, %then4
  %26 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 3, !dbg !41
  store i32 0, ptr %26, align 4, !dbg !41
  %27 = load i32, ptr %26, align 4, !dbg !41
  %28 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 3, !dbg !42
  %29 = load i32, ptr %28, align 4, !dbg !42
  store i32 %29, ptr %age, align 4, !dbg !42
  %30 = load i32, ptr %age, align 4, !dbg !42
  %31 = load i32, ptr %age, align 4, !dbg !43
  %32 = icmp ne i32 %31, 0, !dbg !43
  br i1 %32, label %then7, label %else8, !dbg !43

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !44
  %33 = load i32, ptr %err, align 4, !dbg !44
  br label %if.end9, !dbg !44

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !44

if.end9:                                          ; preds = %else8, %then7
  %34 = load i32, ptr %err, align 4, !dbg !45
  %35 = icmp eq i32 %34, 0, !dbg !45
  br i1 %35, label %then10, label %else11, !dbg !45

then10:                                           ; preds = %if.end9
  %36 = call i32 (ptr, ...) @printf(ptr @1), !dbg !46
  br label %if.end12, !dbg !46

else11:                                           ; preds = %if.end9
  %37 = call i32 (ptr, ...) @printf(ptr @2), !dbg !48
  br label %if.end12, !dbg !48

if.end12:                                         ; preds = %else11, %then10
  %38 = load i32, ptr %err, align 4, !dbg !50
  ret i32 %38, !dbg !50
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "2.struct_type.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 13, type: !5, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "age", scope: !4, file: !3, line: 24, type: !7)
!10 = !DILocation(line: 24, column: 3, scope: !4)
!11 = !DILocalVariable(name: "sex", scope: !4, file: !3, line: 23, type: !7)
!12 = !DILocation(line: 23, column: 3, scope: !4)
!13 = !DILocalVariable(name: "id", scope: !4, file: !3, line: 22, type: !7)
!14 = !DILocation(line: 22, column: 3, scope: !4)
!15 = !DILocalVariable(name: "employee", scope: !4, file: !3, line: 15, type: !16)
!16 = !DICompositeType(tag: DW_TAG_structure_type, name: "Employee", file: !3, size: 192, align: 64, elements: !17)
!17 = !{!18, !21, !22, !23, !25}
!18 = !DIDerivedType(tag: DW_TAG_member, name: "name", file: !3, baseType: !19, size: 64, align: 64)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "sex", file: !3, baseType: !20, size: 8, align: 8, offset: 64)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "id", file: !3, baseType: !7, size: 32, align: 32, offset: 96)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "age", file: !3, baseType: !24, size: 32, align: 32, offset: 128)
!24 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "salary", file: !3, baseType: !26, size: 32, align: 32, offset: 160)
!26 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!27 = !DILocation(line: 15, column: 3, scope: !4)
!28 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 14, type: !7)
!29 = !DILocation(line: 14, column: 3, scope: !4)
!30 = !DILocation(line: 16, column: 3, scope: !4)
!31 = !DILocation(line: 17, column: 3, scope: !4)
!32 = !DILocation(line: 18, column: 3, scope: !4)
!33 = !DILocation(line: 19, column: 3, scope: !4)
!34 = !DILocation(line: 20, column: 3, scope: !4)
!35 = !DILocation(line: 25, column: 3, scope: !4)
!36 = !DILocation(line: 25, column: 18, scope: !4)
!37 = !DILocation(line: 26, column: 3, scope: !4)
!38 = !DILocation(line: 26, column: 19, scope: !4)
!39 = !DILocation(line: 27, column: 3, scope: !4)
!40 = !DILocation(line: 27, column: 18, scope: !4)
!41 = !DILocation(line: 29, column: 3, scope: !4)
!42 = !DILocation(line: 30, column: 3, scope: !4)
!43 = !DILocation(line: 31, column: 3, scope: !4)
!44 = !DILocation(line: 31, column: 17, scope: !4)
!45 = !DILocation(line: 33, column: 3, scope: !4)
!46 = !DILocation(line: 34, column: 5, scope: !47)
!47 = distinct !DILexicalBlock(scope: !4, file: !3, line: 33, column: 17)
!48 = !DILocation(line: 36, column: 5, scope: !49)
!49 = distinct !DILexicalBlock(scope: !4, file: !3, line: 35, column: 10)
!50 = !DILocation(line: 38, column: 3, scope: !4)
