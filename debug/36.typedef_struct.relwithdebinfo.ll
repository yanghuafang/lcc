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

define void @fill_employee(%struct.Employee* %0, i32 %1, i8 %2) !dbg !2 {
entry:
  %sex = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %sex, metadata !14, metadata !DIExpression()), !dbg !15
  %id = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %id, metadata !16, metadata !DIExpression()), !dbg !15
  %employee = alloca %struct.Employee*, align 8
  call void @llvm.dbg.declare(metadata %struct.Employee** %employee, metadata !17, metadata !DIExpression()), !dbg !15
  store %struct.Employee* %0, %struct.Employee** %employee, align 8, !dbg !15
  store i32 %1, i32* %id, align 4, !dbg !15
  store i8 %2, i8* %sex, align 1, !dbg !15
  %3 = load %struct.Employee*, %struct.Employee** %employee, align 8, !dbg !18
  %4 = bitcast %struct.Employee* %3 to i32*, !dbg !18
  %5 = load i32, i32* %id, align 4, !dbg !18
  store i32 %5, i32* %4, align 4, !dbg !18
  %6 = load i32, i32* %4, align 4, !dbg !18
  %7 = load %struct.Employee*, %struct.Employee** %employee, align 8, !dbg !19
  %8 = getelementptr %struct.Employee, %struct.Employee* %7, i32 0, i32 1, !dbg !19
  %9 = load i8, i8* %sex, align 1, !dbg !19
  store i8 %9, i8* %8, align 1, !dbg !19
  %10 = load i8, i8* %8, align 1, !dbg !19
  ret void, !dbg !19
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @main() !dbg !20 {
entry:
  %len = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %len, metadata !23, metadata !DIExpression()), !dbg !25
  %sex = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sex, metadata !26, metadata !DIExpression()), !dbg !27
  %id = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %id, metadata !28, metadata !DIExpression()), !dbg !29
  %sz = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sz, metadata !30, metadata !DIExpression()), !dbg !31
  %origin = alloca %struct.Point, align 8
  call void @llvm.dbg.declare(metadata %struct.Point* %origin, metadata !32, metadata !DIExpression()), !dbg !37
  %workerPtr = alloca %struct.Employee*, align 8
  call void @llvm.dbg.declare(metadata %struct.Employee** %workerPtr, metadata !38, metadata !DIExpression()), !dbg !39
  %worker = alloca %struct.Employee, align 8
  call void @llvm.dbg.declare(metadata %struct.Employee* %worker, metadata !40, metadata !DIExpression()), !dbg !41
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !42, metadata !DIExpression()), !dbg !43
  store i32 0, i32* %err, align 4, !dbg !43
  %0 = getelementptr %struct.Employee, %struct.Employee* %worker, i32 0, i32 1, !dbg !44
  store i8 77, i8* %0, align 1, !dbg !44
  %1 = load i8, i8* %0, align 1, !dbg !44
  store %struct.Employee* %worker, %struct.Employee** %workerPtr, align 8, !dbg !45
  %2 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8, !dbg !45
  %3 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8, !dbg !46
  call void @fill_employee(%struct.Employee* %3, i32 11, i8 70), !dbg !46
  %4 = bitcast %struct.Point* %origin to i32*, !dbg !47
  store i32 3, i32* %4, align 4, !dbg !47
  %5 = load i32, i32* %4, align 4, !dbg !47
  %6 = getelementptr %struct.Point, %struct.Point* %origin, i32 0, i32 1, !dbg !48
  store i32 4, i32* %6, align 4, !dbg !48
  %7 = load i32, i32* %6, align 4, !dbg !48
  store i32 8, i32* %sz, align 4, !dbg !49
  %8 = load i32, i32* %sz, align 4, !dbg !49
  %9 = load i32, i32* %sz, align 4, !dbg !50
  %10 = icmp ne i32 %9, 8, !dbg !50
  br i1 %10, label %then, label %if.end, !dbg !50

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !51
  %11 = load i32, i32* %err, align 4, !dbg !51
  br label %if.end, !dbg !51

if.end:                                           ; preds = %entry, %then
  store i32 8, i32* %sz, align 4, !dbg !52
  %12 = load i32, i32* %sz, align 4, !dbg !52
  %13 = load i32, i32* %sz, align 4, !dbg !53
  %14 = icmp ne i32 %13, 8, !dbg !53
  br i1 %14, label %then1, label %if.end3, !dbg !53

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !54
  %15 = load i32, i32* %err, align 4, !dbg !54
  br label %if.end3, !dbg !54

if.end3:                                          ; preds = %if.end, %then1
  store i32 8, i32* %sz, align 4, !dbg !55
  %16 = load i32, i32* %sz, align 4, !dbg !55
  %17 = load i32, i32* %sz, align 4, !dbg !56
  %18 = icmp ne i32 %17, 8, !dbg !56
  br i1 %18, label %then4, label %if.end6, !dbg !56

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !57
  %19 = load i32, i32* %err, align 4, !dbg !57
  br label %if.end6, !dbg !57

if.end6:                                          ; preds = %if.end3, %then4
  store i32 8, i32* %sz, align 4, !dbg !58
  %20 = load i32, i32* %sz, align 4, !dbg !58
  %21 = load i32, i32* %sz, align 4, !dbg !59
  %22 = icmp ne i32 %21, 8, !dbg !59
  br i1 %22, label %then7, label %if.end9, !dbg !59

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !60
  %23 = load i32, i32* %err, align 4, !dbg !60
  br label %if.end9, !dbg !60

if.end9:                                          ; preds = %if.end6, %then7
  %24 = call i64 @strlen(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @0, i32 0, i32 0)), !dbg !61
  store i64 %24, i64* %len, align 4, !dbg !61
  %25 = load i64, i64* %len, align 4, !dbg !61
  %26 = load i64, i64* %len, align 4, !dbg !62
  %27 = icmp ne i64 %26, 2, !dbg !62
  br i1 %27, label %then10, label %if.end12, !dbg !62

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !63
  %28 = load i32, i32* %err, align 4, !dbg !63
  br label %if.end12, !dbg !63

if.end12:                                         ; preds = %if.end9, %then10
  %29 = bitcast %struct.Employee* %worker to i32*, !dbg !64
  %30 = load i32, i32* %29, align 4, !dbg !64
  store i32 %30, i32* %id, align 4, !dbg !64
  %31 = load i32, i32* %id, align 4, !dbg !64
  %32 = load i32, i32* %id, align 4, !dbg !65
  %33 = icmp ne i32 %32, 11, !dbg !65
  br i1 %33, label %then13, label %if.end15, !dbg !65

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !66
  %34 = load i32, i32* %err, align 4, !dbg !66
  br label %if.end15, !dbg !66

if.end15:                                         ; preds = %if.end12, %then13
  %35 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8, !dbg !67
  %36 = bitcast %struct.Employee* %35 to i32*, !dbg !67
  %37 = load i32, i32* %36, align 4, !dbg !67
  store i32 %37, i32* %id, align 4, !dbg !67
  %38 = load i32, i32* %id, align 4, !dbg !67
  %39 = load i32, i32* %id, align 4, !dbg !68
  %40 = icmp ne i32 %39, 11, !dbg !68
  br i1 %40, label %then16, label %if.end18, !dbg !68

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !69
  %41 = load i32, i32* %err, align 4, !dbg !69
  br label %if.end18, !dbg !69

if.end18:                                         ; preds = %if.end15, %then16
  %42 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8, !dbg !70
  %43 = getelementptr %struct.Employee, %struct.Employee* %42, i32 0, i32 1, !dbg !70
  %44 = load i8, i8* %43, align 1, !dbg !70
  %45 = sext i8 %44 to i32, !dbg !70
  store i32 %45, i32* %sex, align 4, !dbg !70
  %46 = load i32, i32* %sex, align 4, !dbg !70
  %47 = load i32, i32* %sex, align 4, !dbg !71
  %48 = icmp ne i32 %47, 70, !dbg !71
  br i1 %48, label %then19, label %if.end21, !dbg !71

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !72
  %49 = load i32, i32* %err, align 4, !dbg !72
  br label %if.end21, !dbg !72

if.end21:                                         ; preds = %if.end18, %then19
  %50 = bitcast %struct.Point* %origin to i32*, !dbg !73
  %51 = load i32, i32* %50, align 4, !dbg !73
  store i32 %51, i32* %id, align 4, !dbg !73
  %52 = load i32, i32* %id, align 4, !dbg !73
  %53 = load i32, i32* %id, align 4, !dbg !74
  %54 = icmp ne i32 %53, 3, !dbg !74
  br i1 %54, label %then22, label %if.end24, !dbg !74

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !75
  %55 = load i32, i32* %err, align 4, !dbg !75
  br label %if.end24, !dbg !75

if.end24:                                         ; preds = %if.end21, %then22
  %56 = getelementptr %struct.Point, %struct.Point* %origin, i32 0, i32 1, !dbg !76
  %57 = load i32, i32* %56, align 4, !dbg !76
  store i32 %57, i32* %sex, align 4, !dbg !76
  %58 = load i32, i32* %sex, align 4, !dbg !76
  %59 = load i32, i32* %sex, align 4, !dbg !77
  %60 = icmp ne i32 %59, 4, !dbg !77
  br i1 %60, label %then25, label %if.end27, !dbg !77

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !78
  %61 = load i32, i32* %err, align 4, !dbg !78
  br label %if.end27, !dbg !78

if.end27:                                         ; preds = %if.end24, %then25
  %62 = load i32, i32* %err, align 4, !dbg !79
  %63 = icmp eq i32 %62, 0, !dbg !79
  %. = select i1 %63, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @1, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @2, i32 0, i32 0), !dbg !80
  %64 = call i32 (i8*, ...) @printf(i8* %.), !dbg !80
  %65 = load i32, i32* %err, align 4, !dbg !81
  ret i32 %65, !dbg !81
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "36.typedef_struct.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "fill_employee", linkageName: "fill_employee", scope: null, file: !1, line: 21, type: !3, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6, !10, !12}
!5 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DICompositeType(tag: DW_TAG_structure_type, name: "Employee", file: !1, size: 64, align: 32, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "id", file: !1, baseType: !10, size: 32, align: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "sex", file: !1, baseType: !12, size: 8, align: 8, offset: 32)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !{}
!14 = !DILocalVariable(name: "sex", arg: 3, scope: !2, file: !1, line: 21, type: !12)
!15 = !DILocation(line: 21, column: 6, scope: !2)
!16 = !DILocalVariable(name: "id", arg: 2, scope: !2, file: !1, line: 21, type: !10)
!17 = !DILocalVariable(name: "employee", arg: 1, scope: !2, file: !1, line: 21, type: !6)
!18 = !DILocation(line: 22, column: 3, scope: !2)
!19 = !DILocation(line: 23, column: 3, scope: !2)
!20 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 26, type: !21, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!21 = !DISubroutineType(types: !22)
!22 = !{!10}
!23 = !DILocalVariable(name: "len", scope: !20, file: !1, line: 34, type: !24)
!24 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!25 = !DILocation(line: 34, column: 3, scope: !20)
!26 = !DILocalVariable(name: "sex", scope: !20, file: !1, line: 33, type: !10)
!27 = !DILocation(line: 33, column: 3, scope: !20)
!28 = !DILocalVariable(name: "id", scope: !20, file: !1, line: 32, type: !10)
!29 = !DILocation(line: 32, column: 3, scope: !20)
!30 = !DILocalVariable(name: "sz", scope: !20, file: !1, line: 31, type: !10)
!31 = !DILocation(line: 31, column: 3, scope: !20)
!32 = !DILocalVariable(name: "origin", scope: !20, file: !1, line: 30, type: !33)
!33 = !DICompositeType(tag: DW_TAG_structure_type, name: "Point", file: !1, size: 64, align: 32, elements: !34)
!34 = !{!35, !36}
!35 = !DIDerivedType(tag: DW_TAG_member, name: "x", file: !1, baseType: !10, size: 32, align: 32)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "y", file: !1, baseType: !10, size: 32, align: 32, offset: 32)
!37 = !DILocation(line: 30, column: 3, scope: !20)
!38 = !DILocalVariable(name: "workerPtr", scope: !20, file: !1, line: 29, type: !6)
!39 = !DILocation(line: 29, column: 3, scope: !20)
!40 = !DILocalVariable(name: "worker", scope: !20, file: !1, line: 28, type: !7)
!41 = !DILocation(line: 28, column: 3, scope: !20)
!42 = !DILocalVariable(name: "err", scope: !20, file: !1, line: 27, type: !10)
!43 = !DILocation(line: 27, column: 3, scope: !20)
!44 = !DILocation(line: 36, column: 3, scope: !20)
!45 = !DILocation(line: 37, column: 3, scope: !20)
!46 = !DILocation(line: 38, column: 3, scope: !20)
!47 = !DILocation(line: 40, column: 3, scope: !20)
!48 = !DILocation(line: 41, column: 3, scope: !20)
!49 = !DILocation(line: 43, column: 3, scope: !20)
!50 = !DILocation(line: 44, column: 3, scope: !20)
!51 = !DILocation(line: 44, column: 16, scope: !20)
!52 = !DILocation(line: 45, column: 3, scope: !20)
!53 = !DILocation(line: 46, column: 3, scope: !20)
!54 = !DILocation(line: 46, column: 16, scope: !20)
!55 = !DILocation(line: 47, column: 3, scope: !20)
!56 = !DILocation(line: 48, column: 3, scope: !20)
!57 = !DILocation(line: 48, column: 16, scope: !20)
!58 = !DILocation(line: 49, column: 3, scope: !20)
!59 = !DILocation(line: 50, column: 3, scope: !20)
!60 = !DILocation(line: 50, column: 16, scope: !20)
!61 = !DILocation(line: 52, column: 3, scope: !20)
!62 = !DILocation(line: 53, column: 3, scope: !20)
!63 = !DILocation(line: 53, column: 17, scope: !20)
!64 = !DILocation(line: 55, column: 3, scope: !20)
!65 = !DILocation(line: 56, column: 3, scope: !20)
!66 = !DILocation(line: 56, column: 17, scope: !20)
!67 = !DILocation(line: 57, column: 3, scope: !20)
!68 = !DILocation(line: 58, column: 3, scope: !20)
!69 = !DILocation(line: 58, column: 17, scope: !20)
!70 = !DILocation(line: 59, column: 3, scope: !20)
!71 = !DILocation(line: 60, column: 3, scope: !20)
!72 = !DILocation(line: 60, column: 19, scope: !20)
!73 = !DILocation(line: 61, column: 3, scope: !20)
!74 = !DILocation(line: 62, column: 3, scope: !20)
!75 = !DILocation(line: 62, column: 16, scope: !20)
!76 = !DILocation(line: 63, column: 3, scope: !20)
!77 = !DILocation(line: 64, column: 3, scope: !20)
!78 = !DILocation(line: 64, column: 17, scope: !20)
!79 = !DILocation(line: 66, column: 3, scope: !20)
!80 = !DILocation(line: 0, scope: !20)
!81 = !DILocation(line: 71, column: 3, scope: !20)
