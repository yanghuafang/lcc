; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%struct.Employee = type { i32, i8 }
%struct.Point = type { i32, i32 }

@0 = private unnamed_addr constant [3 x i8] c"hi\00", align 1
@1 = private unnamed_addr constant [26 x i8] c"36.typedef_struct.c PASS\0A\00", align 1
@2 = private unnamed_addr constant [26 x i8] c"36.typedef_struct.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

declare void* @malloc(i64)

declare i64 @strlen(i8*)

define void @fill_employee(%struct.Employee* %0, i32 %1, i8 %2) !dbg !4 {
entry:
  %sex = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %sex, metadata !16, metadata !DIExpression()), !dbg !17
  %id = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %id, metadata !18, metadata !DIExpression()), !dbg !17
  %employee = alloca %struct.Employee*, align 8
  call void @llvm.dbg.declare(metadata %struct.Employee** %employee, metadata !19, metadata !DIExpression()), !dbg !17
  store %struct.Employee* %0, %struct.Employee** %employee, align 8, !dbg !17
  store i32 %1, i32* %id, align 4, !dbg !17
  store i8 %2, i8* %sex, align 1, !dbg !17
  %3 = load %struct.Employee*, %struct.Employee** %employee, align 8, !dbg !20
  %4 = bitcast %struct.Employee* %3 to i32*, !dbg !20
  %5 = load i32, i32* %id, align 4, !dbg !20
  store i32 %5, i32* %4, align 4, !dbg !20
  %6 = load i32, i32* %4, align 4, !dbg !20
  %7 = load %struct.Employee*, %struct.Employee** %employee, align 8, !dbg !21
  %8 = getelementptr %struct.Employee, %struct.Employee* %7, i32 0, i32 1, !dbg !21
  %9 = load i8, i8* %sex, align 1, !dbg !21
  store i8 %9, i8* %8, align 1, !dbg !21
  %10 = load i8, i8* %8, align 1, !dbg !21
  ret void, !dbg !21
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @main() !dbg !22 {
entry:
  %len = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %len, metadata !25, metadata !DIExpression()), !dbg !27
  %sex = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sex, metadata !28, metadata !DIExpression()), !dbg !29
  %id = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %id, metadata !30, metadata !DIExpression()), !dbg !31
  %sz = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sz, metadata !32, metadata !DIExpression()), !dbg !33
  %origin = alloca %struct.Point, align 8
  call void @llvm.dbg.declare(metadata %struct.Point* %origin, metadata !34, metadata !DIExpression()), !dbg !39
  %workerPtr = alloca %struct.Employee*, align 8
  call void @llvm.dbg.declare(metadata %struct.Employee** %workerPtr, metadata !40, metadata !DIExpression()), !dbg !41
  %worker = alloca %struct.Employee, align 8
  call void @llvm.dbg.declare(metadata %struct.Employee* %worker, metadata !42, metadata !DIExpression()), !dbg !43
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !44, metadata !DIExpression()), !dbg !45
  store i32 0, i32* %err, align 4, !dbg !45
  %0 = getelementptr %struct.Employee, %struct.Employee* %worker, i32 0, i32 1, !dbg !46
  store i8 77, i8* %0, align 1, !dbg !46
  %1 = load i8, i8* %0, align 1, !dbg !46
  store %struct.Employee* %worker, %struct.Employee** %workerPtr, align 8, !dbg !47
  %2 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8, !dbg !47
  %3 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8, !dbg !48
  call void @fill_employee(%struct.Employee* %3, i32 11, i8 70), !dbg !48
  %4 = bitcast %struct.Point* %origin to i32*, !dbg !49
  store i32 3, i32* %4, align 4, !dbg !49
  %5 = load i32, i32* %4, align 4, !dbg !49
  %6 = getelementptr %struct.Point, %struct.Point* %origin, i32 0, i32 1, !dbg !50
  store i32 4, i32* %6, align 4, !dbg !50
  %7 = load i32, i32* %6, align 4, !dbg !50
  store i32 8, i32* %sz, align 4, !dbg !51
  %8 = load i32, i32* %sz, align 4, !dbg !51
  %9 = load i32, i32* %sz, align 4, !dbg !52
  %10 = icmp ne i32 %9, 8, !dbg !52
  br i1 %10, label %then, label %if.end, !dbg !52

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !53
  %11 = load i32, i32* %err, align 4, !dbg !53
  br label %if.end, !dbg !53

if.end:                                           ; preds = %entry, %then
  store i32 8, i32* %sz, align 4, !dbg !54
  %12 = load i32, i32* %sz, align 4, !dbg !54
  %13 = load i32, i32* %sz, align 4, !dbg !55
  %14 = icmp ne i32 %13, 8, !dbg !55
  br i1 %14, label %then1, label %if.end3, !dbg !55

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !56
  %15 = load i32, i32* %err, align 4, !dbg !56
  br label %if.end3, !dbg !56

if.end3:                                          ; preds = %if.end, %then1
  store i32 8, i32* %sz, align 4, !dbg !57
  %16 = load i32, i32* %sz, align 4, !dbg !57
  %17 = load i32, i32* %sz, align 4, !dbg !58
  %18 = icmp ne i32 %17, 8, !dbg !58
  br i1 %18, label %then4, label %if.end6, !dbg !58

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !59
  %19 = load i32, i32* %err, align 4, !dbg !59
  br label %if.end6, !dbg !59

if.end6:                                          ; preds = %if.end3, %then4
  store i32 8, i32* %sz, align 4, !dbg !60
  %20 = load i32, i32* %sz, align 4, !dbg !60
  %21 = load i32, i32* %sz, align 4, !dbg !61
  %22 = icmp ne i32 %21, 8, !dbg !61
  br i1 %22, label %then7, label %if.end9, !dbg !61

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !62
  %23 = load i32, i32* %err, align 4, !dbg !62
  br label %if.end9, !dbg !62

if.end9:                                          ; preds = %if.end6, %then7
  %24 = call i64 @strlen(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @0, i32 0, i32 0)), !dbg !63
  store i64 %24, i64* %len, align 4, !dbg !63
  %25 = load i64, i64* %len, align 4, !dbg !63
  %26 = load i64, i64* %len, align 4, !dbg !64
  %27 = icmp ne i64 %26, 2, !dbg !64
  br i1 %27, label %then10, label %if.end12, !dbg !64

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !65
  %28 = load i32, i32* %err, align 4, !dbg !65
  br label %if.end12, !dbg !65

if.end12:                                         ; preds = %if.end9, %then10
  %29 = bitcast %struct.Employee* %worker to i32*, !dbg !66
  %30 = load i32, i32* %29, align 4, !dbg !66
  store i32 %30, i32* %id, align 4, !dbg !66
  %31 = load i32, i32* %id, align 4, !dbg !66
  %32 = load i32, i32* %id, align 4, !dbg !67
  %33 = icmp ne i32 %32, 11, !dbg !67
  br i1 %33, label %then13, label %if.end15, !dbg !67

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !68
  %34 = load i32, i32* %err, align 4, !dbg !68
  br label %if.end15, !dbg !68

if.end15:                                         ; preds = %if.end12, %then13
  %35 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8, !dbg !69
  %36 = bitcast %struct.Employee* %35 to i32*, !dbg !69
  %37 = load i32, i32* %36, align 4, !dbg !69
  store i32 %37, i32* %id, align 4, !dbg !69
  %38 = load i32, i32* %id, align 4, !dbg !69
  %39 = load i32, i32* %id, align 4, !dbg !70
  %40 = icmp ne i32 %39, 11, !dbg !70
  br i1 %40, label %then16, label %if.end18, !dbg !70

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !71
  %41 = load i32, i32* %err, align 4, !dbg !71
  br label %if.end18, !dbg !71

if.end18:                                         ; preds = %if.end15, %then16
  %42 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8, !dbg !72
  %43 = getelementptr %struct.Employee, %struct.Employee* %42, i32 0, i32 1, !dbg !72
  %44 = load i8, i8* %43, align 1, !dbg !72
  %45 = sext i8 %44 to i32, !dbg !72
  store i32 %45, i32* %sex, align 4, !dbg !72
  %46 = load i32, i32* %sex, align 4, !dbg !72
  %47 = load i32, i32* %sex, align 4, !dbg !73
  %48 = icmp ne i32 %47, 70, !dbg !73
  br i1 %48, label %then19, label %if.end21, !dbg !73

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !74
  %49 = load i32, i32* %err, align 4, !dbg !74
  br label %if.end21, !dbg !74

if.end21:                                         ; preds = %if.end18, %then19
  %50 = bitcast %struct.Point* %origin to i32*, !dbg !75
  %51 = load i32, i32* %50, align 4, !dbg !75
  store i32 %51, i32* %id, align 4, !dbg !75
  %52 = load i32, i32* %id, align 4, !dbg !75
  %53 = load i32, i32* %id, align 4, !dbg !76
  %54 = icmp ne i32 %53, 3, !dbg !76
  br i1 %54, label %then22, label %if.end24, !dbg !76

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !77
  %55 = load i32, i32* %err, align 4, !dbg !77
  br label %if.end24, !dbg !77

if.end24:                                         ; preds = %if.end21, %then22
  %56 = getelementptr %struct.Point, %struct.Point* %origin, i32 0, i32 1, !dbg !78
  %57 = load i32, i32* %56, align 4, !dbg !78
  store i32 %57, i32* %sex, align 4, !dbg !78
  %58 = load i32, i32* %sex, align 4, !dbg !78
  %59 = load i32, i32* %sex, align 4, !dbg !79
  %60 = icmp ne i32 %59, 4, !dbg !79
  br i1 %60, label %then25, label %if.end27, !dbg !79

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !80
  %61 = load i32, i32* %err, align 4, !dbg !80
  br label %if.end27, !dbg !80

if.end27:                                         ; preds = %if.end24, %then25
  %62 = load i32, i32* %err, align 4, !dbg !81
  %63 = icmp eq i32 %62, 0, !dbg !81
  %. = select i1 %63, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @1, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @2, i32 0, i32 0), !dbg !82
  %64 = call i32 (i8*, ...) @printf(i8* %.), !dbg !82
  %65 = load i32, i32* %err, align 4, !dbg !83
  ret i32 %65, !dbg !83
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "36.typedef_struct.c", directory: "../tests")
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "fill_employee", linkageName: "fill_employee", scope: null, file: !1, line: 21, type: !5, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !8, !12, !14}
!7 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DICompositeType(tag: DW_TAG_structure_type, name: "Employee", file: !1, size: 64, align: 32, elements: !10)
!10 = !{!11, !13}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "id", file: !1, baseType: !12, size: 32, align: 32)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "sex", file: !1, baseType: !14, size: 8, align: 8, offset: 32)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !{}
!16 = !DILocalVariable(name: "sex", arg: 3, scope: !4, file: !1, line: 21, type: !14)
!17 = !DILocation(line: 21, column: 6, scope: !4)
!18 = !DILocalVariable(name: "id", arg: 2, scope: !4, file: !1, line: 21, type: !12)
!19 = !DILocalVariable(name: "employee", arg: 1, scope: !4, file: !1, line: 21, type: !8)
!20 = !DILocation(line: 22, column: 3, scope: !4)
!21 = !DILocation(line: 23, column: 3, scope: !4)
!22 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 26, type: !23, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!23 = !DISubroutineType(types: !24)
!24 = !{!12}
!25 = !DILocalVariable(name: "len", scope: !22, file: !1, line: 34, type: !26)
!26 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!27 = !DILocation(line: 34, column: 3, scope: !22)
!28 = !DILocalVariable(name: "sex", scope: !22, file: !1, line: 33, type: !12)
!29 = !DILocation(line: 33, column: 3, scope: !22)
!30 = !DILocalVariable(name: "id", scope: !22, file: !1, line: 32, type: !12)
!31 = !DILocation(line: 32, column: 3, scope: !22)
!32 = !DILocalVariable(name: "sz", scope: !22, file: !1, line: 31, type: !12)
!33 = !DILocation(line: 31, column: 3, scope: !22)
!34 = !DILocalVariable(name: "origin", scope: !22, file: !1, line: 30, type: !35)
!35 = !DICompositeType(tag: DW_TAG_structure_type, name: "Point", file: !1, size: 64, align: 32, elements: !36)
!36 = !{!37, !38}
!37 = !DIDerivedType(tag: DW_TAG_member, name: "x", file: !1, baseType: !12, size: 32, align: 32)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "y", file: !1, baseType: !12, size: 32, align: 32, offset: 32)
!39 = !DILocation(line: 30, column: 3, scope: !22)
!40 = !DILocalVariable(name: "workerPtr", scope: !22, file: !1, line: 29, type: !8)
!41 = !DILocation(line: 29, column: 3, scope: !22)
!42 = !DILocalVariable(name: "worker", scope: !22, file: !1, line: 28, type: !9)
!43 = !DILocation(line: 28, column: 3, scope: !22)
!44 = !DILocalVariable(name: "err", scope: !22, file: !1, line: 27, type: !12)
!45 = !DILocation(line: 27, column: 3, scope: !22)
!46 = !DILocation(line: 36, column: 3, scope: !22)
!47 = !DILocation(line: 37, column: 3, scope: !22)
!48 = !DILocation(line: 38, column: 3, scope: !22)
!49 = !DILocation(line: 40, column: 3, scope: !22)
!50 = !DILocation(line: 41, column: 3, scope: !22)
!51 = !DILocation(line: 43, column: 3, scope: !22)
!52 = !DILocation(line: 44, column: 3, scope: !22)
!53 = !DILocation(line: 44, column: 16, scope: !22)
!54 = !DILocation(line: 45, column: 3, scope: !22)
!55 = !DILocation(line: 46, column: 3, scope: !22)
!56 = !DILocation(line: 46, column: 16, scope: !22)
!57 = !DILocation(line: 47, column: 3, scope: !22)
!58 = !DILocation(line: 48, column: 3, scope: !22)
!59 = !DILocation(line: 48, column: 16, scope: !22)
!60 = !DILocation(line: 49, column: 3, scope: !22)
!61 = !DILocation(line: 50, column: 3, scope: !22)
!62 = !DILocation(line: 50, column: 16, scope: !22)
!63 = !DILocation(line: 52, column: 3, scope: !22)
!64 = !DILocation(line: 53, column: 3, scope: !22)
!65 = !DILocation(line: 53, column: 17, scope: !22)
!66 = !DILocation(line: 55, column: 3, scope: !22)
!67 = !DILocation(line: 56, column: 3, scope: !22)
!68 = !DILocation(line: 56, column: 17, scope: !22)
!69 = !DILocation(line: 57, column: 3, scope: !22)
!70 = !DILocation(line: 58, column: 3, scope: !22)
!71 = !DILocation(line: 58, column: 17, scope: !22)
!72 = !DILocation(line: 59, column: 3, scope: !22)
!73 = !DILocation(line: 60, column: 3, scope: !22)
!74 = !DILocation(line: 60, column: 19, scope: !22)
!75 = !DILocation(line: 61, column: 3, scope: !22)
!76 = !DILocation(line: 62, column: 3, scope: !22)
!77 = !DILocation(line: 62, column: 16, scope: !22)
!78 = !DILocation(line: 63, column: 3, scope: !22)
!79 = !DILocation(line: 64, column: 3, scope: !22)
!80 = !DILocation(line: 64, column: 17, scope: !22)
!81 = !DILocation(line: 66, column: 3, scope: !22)
!82 = !DILocation(line: 0, scope: !22)
!83 = !DILocation(line: 71, column: 3, scope: !22)
