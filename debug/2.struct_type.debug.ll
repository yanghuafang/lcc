; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

%struct.Employee = type { ptr, i8, i32, i32, float }

@0 = private unnamed_addr constant [9 x i8] c"employee\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"2.struct_type.c PASS\0A\00", align 1
@2 = private unnamed_addr constant [22 x i8] c"2.struct_type.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %age = alloca i32, align 4
    #dbg_declare(ptr %age, !7, !DIExpression(), !8)
  %sex = alloca i32, align 4
    #dbg_declare(ptr %sex, !9, !DIExpression(), !10)
  %id = alloca i32, align 4
    #dbg_declare(ptr %id, !11, !DIExpression(), !12)
  %employee = alloca %struct.Employee, align 8
    #dbg_declare(ptr %employee, !13, !DIExpression(), !25)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !26, !DIExpression(), !27)
  store i32 0, ptr %err, align 4, !dbg !27
  %0 = bitcast ptr %employee to ptr, !dbg !28
  store ptr @0, ptr %0, align 8, !dbg !28
  %1 = load ptr, ptr %0, align 8, !dbg !28
  %2 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 1, !dbg !29
  store i8 77, ptr %2, align 1, !dbg !29
  %3 = load i8, ptr %2, align 1, !dbg !29
  %4 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 2, !dbg !30
  store i32 100, ptr %4, align 4, !dbg !30
  %5 = load i32, ptr %4, align 4, !dbg !30
  %6 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 3, !dbg !31
  store i32 22, ptr %6, align 4, !dbg !31
  %7 = load i32, ptr %6, align 4, !dbg !31
  %8 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 4, !dbg !32
  store float 3.000000e+03, ptr %8, align 4, !dbg !32
  %9 = load float, ptr %8, align 4, !dbg !32
  %10 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 2, !dbg !12
  %11 = load i32, ptr %10, align 4, !dbg !12
  store i32 %11, ptr %id, align 4, !dbg !12
  %12 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 1, !dbg !10
  %13 = load i8, ptr %12, align 1, !dbg !10
  %14 = sext i8 %13 to i32, !dbg !10
  store i32 %14, ptr %sex, align 4, !dbg !10
  %15 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 3, !dbg !8
  %16 = load i32, ptr %15, align 4, !dbg !8
  store i32 %16, ptr %age, align 4, !dbg !8
  %17 = load i32, ptr %id, align 4, !dbg !33
  %18 = icmp ne i32 %17, 100, !dbg !33
  br i1 %18, label %then, label %if.end, !dbg !33

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !34
  %19 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end, !dbg !34

if.end:                                           ; preds = %entry, %then
  %20 = load i32, ptr %sex, align 4, !dbg !35
  %21 = icmp ne i32 %20, 77, !dbg !35
  br i1 %21, label %then1, label %if.end3, !dbg !35

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !36
  %22 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end3, !dbg !36

if.end3:                                          ; preds = %if.end, %then1
  %23 = load i32, ptr %age, align 4, !dbg !37
  %24 = icmp ne i32 %23, 22, !dbg !37
  br i1 %24, label %then4, label %if.end6, !dbg !37

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !38
  %25 = load i32, ptr %err, align 4, !dbg !38
  br label %if.end6, !dbg !38

if.end6:                                          ; preds = %if.end3, %then4
  %26 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 3, !dbg !39
  store i32 0, ptr %26, align 4, !dbg !39
  %27 = load i32, ptr %26, align 4, !dbg !39
  %28 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 3, !dbg !40
  %29 = load i32, ptr %28, align 4, !dbg !40
  store i32 %29, ptr %age, align 4, !dbg !40
  %30 = load i32, ptr %age, align 4, !dbg !40
  %31 = load i32, ptr %age, align 4, !dbg !41
  %32 = icmp ne i32 %31, 0, !dbg !41
  br i1 %32, label %then7, label %if.end9, !dbg !41

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !42
  %33 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end9, !dbg !42

if.end9:                                          ; preds = %if.end6, %then7
  %34 = load i32, ptr %err, align 4, !dbg !43
  %35 = icmp eq i32 %34, 0, !dbg !43
  %. = select i1 %35, ptr @1, ptr @2, !dbg !44
  %36 = call i32 (ptr, ...) @printf(ptr %.), !dbg !44
  %37 = load i32, ptr %err, align 4, !dbg !45
  ret i32 %37, !dbg !45
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "2.struct_type.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 11, type: !3, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "age", scope: !2, file: !1, line: 22, type: !5)
!8 = !DILocation(line: 22, column: 3, scope: !2)
!9 = !DILocalVariable(name: "sex", scope: !2, file: !1, line: 21, type: !5)
!10 = !DILocation(line: 21, column: 3, scope: !2)
!11 = !DILocalVariable(name: "id", scope: !2, file: !1, line: 20, type: !5)
!12 = !DILocation(line: 20, column: 3, scope: !2)
!13 = !DILocalVariable(name: "employee", scope: !2, file: !1, line: 13, type: !14)
!14 = !DICompositeType(tag: DW_TAG_structure_type, name: "Employee", file: !1, size: 192, align: 64, elements: !15)
!15 = !{!16, !19, !20, !21, !23}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "name", file: !1, baseType: !17, size: 64, align: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "sex", file: !1, baseType: !18, size: 8, align: 8, offset: 64)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "id", file: !1, baseType: !5, size: 32, align: 32, offset: 96)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "age", file: !1, baseType: !22, size: 32, align: 32, offset: 128)
!22 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "salary", file: !1, baseType: !24, size: 32, align: 32, offset: 160)
!24 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!25 = !DILocation(line: 13, column: 3, scope: !2)
!26 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 12, type: !5)
!27 = !DILocation(line: 12, column: 3, scope: !2)
!28 = !DILocation(line: 14, column: 3, scope: !2)
!29 = !DILocation(line: 15, column: 3, scope: !2)
!30 = !DILocation(line: 16, column: 3, scope: !2)
!31 = !DILocation(line: 17, column: 3, scope: !2)
!32 = !DILocation(line: 18, column: 3, scope: !2)
!33 = !DILocation(line: 23, column: 3, scope: !2)
!34 = !DILocation(line: 23, column: 18, scope: !2)
!35 = !DILocation(line: 24, column: 3, scope: !2)
!36 = !DILocation(line: 24, column: 19, scope: !2)
!37 = !DILocation(line: 25, column: 3, scope: !2)
!38 = !DILocation(line: 25, column: 18, scope: !2)
!39 = !DILocation(line: 27, column: 3, scope: !2)
!40 = !DILocation(line: 28, column: 3, scope: !2)
!41 = !DILocation(line: 29, column: 3, scope: !2)
!42 = !DILocation(line: 29, column: 17, scope: !2)
!43 = !DILocation(line: 31, column: 3, scope: !2)
!44 = !DILocation(line: 0, scope: !2)
!45 = !DILocation(line: 36, column: 3, scope: !2)
