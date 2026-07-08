; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%struct.Employee = type { i8*, i8, i32, i32, float }

@0 = private unnamed_addr constant [9 x i8] c"employee\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"2.struct_type.c PASS\0A\00", align 1
@2 = private unnamed_addr constant [22 x i8] c"2.struct_type.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !4 {
entry:
  %age = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %age, metadata !9, metadata !DIExpression()), !dbg !10
  %sex = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sex, metadata !11, metadata !DIExpression()), !dbg !12
  %id = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %id, metadata !13, metadata !DIExpression()), !dbg !14
  %employee = alloca %struct.Employee, align 8
  call void @llvm.dbg.declare(metadata %struct.Employee* %employee, metadata !15, metadata !DIExpression()), !dbg !27
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !28, metadata !DIExpression()), !dbg !29
  store i32 0, i32* %err, align 4, !dbg !29
  %0 = bitcast %struct.Employee* %employee to i8**, !dbg !30
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @0, i32 0, i32 0), i8** %0, align 8, !dbg !30
  %1 = load i8*, i8** %0, align 8, !dbg !30
  %2 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 1, !dbg !31
  store i8 77, i8* %2, align 1, !dbg !31
  %3 = load i8, i8* %2, align 1, !dbg !31
  %4 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 2, !dbg !32
  store i32 100, i32* %4, align 4, !dbg !32
  %5 = load i32, i32* %4, align 4, !dbg !32
  %6 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 3, !dbg !33
  store i32 22, i32* %6, align 4, !dbg !33
  %7 = load i32, i32* %6, align 4, !dbg !33
  %8 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 4, !dbg !34
  store float 3.000000e+03, float* %8, align 4, !dbg !34
  %9 = load float, float* %8, align 4, !dbg !34
  %10 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 2, !dbg !14
  %11 = load i32, i32* %10, align 4, !dbg !14
  store i32 %11, i32* %id, align 4, !dbg !14
  %12 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 1, !dbg !12
  %13 = load i8, i8* %12, align 1, !dbg !12
  %14 = sext i8 %13 to i32, !dbg !12
  store i32 %14, i32* %sex, align 4, !dbg !12
  %15 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 3, !dbg !10
  %16 = load i32, i32* %15, align 4, !dbg !10
  store i32 %16, i32* %age, align 4, !dbg !10
  %17 = load i32, i32* %id, align 4, !dbg !35
  %18 = icmp ne i32 %17, 100, !dbg !35
  br i1 %18, label %then, label %if.end, !dbg !35

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !36
  %19 = load i32, i32* %err, align 4, !dbg !36
  br label %if.end, !dbg !36

if.end:                                           ; preds = %entry, %then
  %20 = load i32, i32* %sex, align 4, !dbg !37
  %21 = icmp ne i32 %20, 77, !dbg !37
  br i1 %21, label %then1, label %if.end3, !dbg !37

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !38
  %22 = load i32, i32* %err, align 4, !dbg !38
  br label %if.end3, !dbg !38

if.end3:                                          ; preds = %if.end, %then1
  %23 = load i32, i32* %age, align 4, !dbg !39
  %24 = icmp ne i32 %23, 22, !dbg !39
  br i1 %24, label %then4, label %if.end6, !dbg !39

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !40
  %25 = load i32, i32* %err, align 4, !dbg !40
  br label %if.end6, !dbg !40

if.end6:                                          ; preds = %if.end3, %then4
  %26 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 3, !dbg !41
  store i32 0, i32* %26, align 4, !dbg !41
  %27 = load i32, i32* %26, align 4, !dbg !41
  %28 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 3, !dbg !42
  %29 = load i32, i32* %28, align 4, !dbg !42
  store i32 %29, i32* %age, align 4, !dbg !42
  %30 = load i32, i32* %age, align 4, !dbg !42
  %31 = load i32, i32* %age, align 4, !dbg !43
  %32 = icmp ne i32 %31, 0, !dbg !43
  br i1 %32, label %then7, label %if.end9, !dbg !43

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !44
  %33 = load i32, i32* %err, align 4, !dbg !44
  br label %if.end9, !dbg !44

if.end9:                                          ; preds = %if.end6, %then7
  %34 = load i32, i32* %err, align 4, !dbg !45
  %35 = icmp eq i32 %34, 0, !dbg !45
  %. = select i1 %35, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @1, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @2, i32 0, i32 0), !dbg !46
  %36 = call i32 (i8*, ...) @printf(i8* %.), !dbg !46
  %37 = load i32, i32* %err, align 4, !dbg !47
  ret i32 %37, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "2.struct_type.c", directory: "../tests")
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 11, type: !5, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "age", scope: !4, file: !1, line: 22, type: !7)
!10 = !DILocation(line: 22, column: 3, scope: !4)
!11 = !DILocalVariable(name: "sex", scope: !4, file: !1, line: 21, type: !7)
!12 = !DILocation(line: 21, column: 3, scope: !4)
!13 = !DILocalVariable(name: "id", scope: !4, file: !1, line: 20, type: !7)
!14 = !DILocation(line: 20, column: 3, scope: !4)
!15 = !DILocalVariable(name: "employee", scope: !4, file: !1, line: 13, type: !16)
!16 = !DICompositeType(tag: DW_TAG_structure_type, name: "Employee", file: !1, size: 192, align: 64, elements: !17)
!17 = !{!18, !21, !22, !23, !25}
!18 = !DIDerivedType(tag: DW_TAG_member, name: "name", file: !1, baseType: !19, size: 64, align: 64)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "sex", file: !1, baseType: !20, size: 8, align: 8, offset: 64)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "id", file: !1, baseType: !7, size: 32, align: 32, offset: 96)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "age", file: !1, baseType: !24, size: 32, align: 32, offset: 128)
!24 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "salary", file: !1, baseType: !26, size: 32, align: 32, offset: 160)
!26 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!27 = !DILocation(line: 13, column: 3, scope: !4)
!28 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 12, type: !7)
!29 = !DILocation(line: 12, column: 3, scope: !4)
!30 = !DILocation(line: 14, column: 3, scope: !4)
!31 = !DILocation(line: 15, column: 3, scope: !4)
!32 = !DILocation(line: 16, column: 3, scope: !4)
!33 = !DILocation(line: 17, column: 3, scope: !4)
!34 = !DILocation(line: 18, column: 3, scope: !4)
!35 = !DILocation(line: 23, column: 3, scope: !4)
!36 = !DILocation(line: 23, column: 18, scope: !4)
!37 = !DILocation(line: 24, column: 3, scope: !4)
!38 = !DILocation(line: 24, column: 19, scope: !4)
!39 = !DILocation(line: 25, column: 3, scope: !4)
!40 = !DILocation(line: 25, column: 18, scope: !4)
!41 = !DILocation(line: 27, column: 3, scope: !4)
!42 = !DILocation(line: 28, column: 3, scope: !4)
!43 = !DILocation(line: 29, column: 3, scope: !4)
!44 = !DILocation(line: 29, column: 17, scope: !4)
!45 = !DILocation(line: 31, column: 3, scope: !4)
!46 = !DILocation(line: 0, scope: !4)
!47 = !DILocation(line: 36, column: 3, scope: !4)
