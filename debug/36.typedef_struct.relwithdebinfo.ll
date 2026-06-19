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
  call void @llvm.dbg.declare(metadata i8* %sex, metadata !11, metadata !DIExpression()), !dbg !12
  %id = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %id, metadata !13, metadata !DIExpression()), !dbg !12
  %employee = alloca %struct.Employee*, align 8
  call void @llvm.dbg.declare(metadata %struct.Employee** %employee, metadata !14, metadata !DIExpression()), !dbg !12
  store %struct.Employee* %0, %struct.Employee** %employee, align 8, !dbg !12
  store i32 %1, i32* %id, align 4, !dbg !12
  store i8 %2, i8* %sex, align 1, !dbg !12
  %3 = load %struct.Employee*, %struct.Employee** %employee, align 8, !dbg !15
  %4 = bitcast %struct.Employee* %3 to i32*, !dbg !15
  %5 = load i32, i32* %id, align 4, !dbg !15
  store i32 %5, i32* %4, align 4, !dbg !15
  %6 = load i32, i32* %4, align 4, !dbg !15
  %7 = load %struct.Employee*, %struct.Employee** %employee, align 8, !dbg !16
  %8 = getelementptr %struct.Employee, %struct.Employee* %7, i32 0, i32 1, !dbg !16
  %9 = load i8, i8* %sex, align 1, !dbg !16
  store i8 %9, i8* %8, align 1, !dbg !16
  %10 = load i8, i8* %8, align 1, !dbg !16
  ret void, !dbg !16
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @main() !dbg !17 {
entry:
  %len = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %len, metadata !20, metadata !DIExpression()), !dbg !22
  %sex = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sex, metadata !23, metadata !DIExpression()), !dbg !24
  %id = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %id, metadata !25, metadata !DIExpression()), !dbg !26
  %sz = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sz, metadata !27, metadata !DIExpression()), !dbg !28
  %origin = alloca %struct.Point, align 8
  call void @llvm.dbg.declare(metadata %struct.Point* %origin, metadata !29, metadata !DIExpression()), !dbg !31
  %workerPtr = alloca %struct.Employee*, align 8
  call void @llvm.dbg.declare(metadata %struct.Employee** %workerPtr, metadata !32, metadata !DIExpression()), !dbg !33
  %worker = alloca %struct.Employee, align 8
  call void @llvm.dbg.declare(metadata %struct.Employee* %worker, metadata !34, metadata !DIExpression()), !dbg !35
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !36, metadata !DIExpression()), !dbg !37
  store i32 0, i32* %err, align 4, !dbg !37
  %0 = getelementptr %struct.Employee, %struct.Employee* %worker, i32 0, i32 1, !dbg !38
  store i8 77, i8* %0, align 1, !dbg !38
  %1 = load i8, i8* %0, align 1, !dbg !38
  store %struct.Employee* %worker, %struct.Employee** %workerPtr, align 8, !dbg !39
  %2 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8, !dbg !39
  %3 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8, !dbg !40
  call void @fill_employee(%struct.Employee* %3, i32 11, i8 70), !dbg !40
  %4 = bitcast %struct.Point* %origin to i32*, !dbg !41
  store i32 3, i32* %4, align 4, !dbg !41
  %5 = load i32, i32* %4, align 4, !dbg !41
  %6 = getelementptr %struct.Point, %struct.Point* %origin, i32 0, i32 1, !dbg !42
  store i32 4, i32* %6, align 4, !dbg !42
  %7 = load i32, i32* %6, align 4, !dbg !42
  store i32 8, i32* %sz, align 4, !dbg !43
  %8 = load i32, i32* %sz, align 4, !dbg !43
  %9 = load i32, i32* %sz, align 4, !dbg !44
  %10 = icmp ne i32 %9, 8, !dbg !44
  br i1 %10, label %then, label %if.end, !dbg !44

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !45
  %11 = load i32, i32* %err, align 4, !dbg !45
  br label %if.end, !dbg !45

if.end:                                           ; preds = %entry, %then
  store i32 8, i32* %sz, align 4, !dbg !46
  %12 = load i32, i32* %sz, align 4, !dbg !46
  %13 = load i32, i32* %sz, align 4, !dbg !47
  %14 = icmp ne i32 %13, 8, !dbg !47
  br i1 %14, label %then1, label %if.end3, !dbg !47

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !48
  %15 = load i32, i32* %err, align 4, !dbg !48
  br label %if.end3, !dbg !48

if.end3:                                          ; preds = %if.end, %then1
  store i32 8, i32* %sz, align 4, !dbg !49
  %16 = load i32, i32* %sz, align 4, !dbg !49
  %17 = load i32, i32* %sz, align 4, !dbg !50
  %18 = icmp ne i32 %17, 8, !dbg !50
  br i1 %18, label %then4, label %if.end6, !dbg !50

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !51
  %19 = load i32, i32* %err, align 4, !dbg !51
  br label %if.end6, !dbg !51

if.end6:                                          ; preds = %if.end3, %then4
  store i32 8, i32* %sz, align 4, !dbg !52
  %20 = load i32, i32* %sz, align 4, !dbg !52
  %21 = load i32, i32* %sz, align 4, !dbg !53
  %22 = icmp ne i32 %21, 8, !dbg !53
  br i1 %22, label %then7, label %if.end9, !dbg !53

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !54
  %23 = load i32, i32* %err, align 4, !dbg !54
  br label %if.end9, !dbg !54

if.end9:                                          ; preds = %if.end6, %then7
  %24 = call i64 @strlen(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @0, i32 0, i32 0)), !dbg !55
  store i64 %24, i64* %len, align 4, !dbg !55
  %25 = load i64, i64* %len, align 4, !dbg !55
  %26 = load i64, i64* %len, align 4, !dbg !56
  %27 = icmp ne i64 %26, 2, !dbg !56
  br i1 %27, label %then10, label %if.end12, !dbg !56

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !57
  %28 = load i32, i32* %err, align 4, !dbg !57
  br label %if.end12, !dbg !57

if.end12:                                         ; preds = %if.end9, %then10
  %29 = bitcast %struct.Employee* %worker to i32*, !dbg !58
  %30 = load i32, i32* %29, align 4, !dbg !58
  store i32 %30, i32* %id, align 4, !dbg !58
  %31 = load i32, i32* %id, align 4, !dbg !58
  %32 = load i32, i32* %id, align 4, !dbg !59
  %33 = icmp ne i32 %32, 11, !dbg !59
  br i1 %33, label %then13, label %if.end15, !dbg !59

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !60
  %34 = load i32, i32* %err, align 4, !dbg !60
  br label %if.end15, !dbg !60

if.end15:                                         ; preds = %if.end12, %then13
  %35 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8, !dbg !61
  %36 = bitcast %struct.Employee* %35 to i32*, !dbg !61
  %37 = load i32, i32* %36, align 4, !dbg !61
  store i32 %37, i32* %id, align 4, !dbg !61
  %38 = load i32, i32* %id, align 4, !dbg !61
  %39 = load i32, i32* %id, align 4, !dbg !62
  %40 = icmp ne i32 %39, 11, !dbg !62
  br i1 %40, label %then16, label %if.end18, !dbg !62

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !63
  %41 = load i32, i32* %err, align 4, !dbg !63
  br label %if.end18, !dbg !63

if.end18:                                         ; preds = %if.end15, %then16
  %42 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8, !dbg !64
  %43 = getelementptr %struct.Employee, %struct.Employee* %42, i32 0, i32 1, !dbg !64
  %44 = load i8, i8* %43, align 1, !dbg !64
  %45 = sext i8 %44 to i32, !dbg !64
  store i32 %45, i32* %sex, align 4, !dbg !64
  %46 = load i32, i32* %sex, align 4, !dbg !64
  %47 = load i32, i32* %sex, align 4, !dbg !65
  %48 = icmp ne i32 %47, 70, !dbg !65
  br i1 %48, label %then19, label %if.end21, !dbg !65

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !66
  %49 = load i32, i32* %err, align 4, !dbg !66
  br label %if.end21, !dbg !66

if.end21:                                         ; preds = %if.end18, %then19
  %50 = bitcast %struct.Point* %origin to i32*, !dbg !67
  %51 = load i32, i32* %50, align 4, !dbg !67
  store i32 %51, i32* %id, align 4, !dbg !67
  %52 = load i32, i32* %id, align 4, !dbg !67
  %53 = load i32, i32* %id, align 4, !dbg !68
  %54 = icmp ne i32 %53, 3, !dbg !68
  br i1 %54, label %then22, label %if.end24, !dbg !68

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !69
  %55 = load i32, i32* %err, align 4, !dbg !69
  br label %if.end24, !dbg !69

if.end24:                                         ; preds = %if.end21, %then22
  %56 = getelementptr %struct.Point, %struct.Point* %origin, i32 0, i32 1, !dbg !70
  %57 = load i32, i32* %56, align 4, !dbg !70
  store i32 %57, i32* %sex, align 4, !dbg !70
  %58 = load i32, i32* %sex, align 4, !dbg !70
  %59 = load i32, i32* %sex, align 4, !dbg !71
  %60 = icmp ne i32 %59, 4, !dbg !71
  br i1 %60, label %then25, label %if.end27, !dbg !71

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !72
  %61 = load i32, i32* %err, align 4, !dbg !72
  br label %if.end27, !dbg !72

if.end27:                                         ; preds = %if.end24, %then25
  %62 = load i32, i32* %err, align 4, !dbg !73
  %63 = icmp eq i32 %62, 0, !dbg !73
  %. = select i1 %63, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @1, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @2, i32 0, i32 0), !dbg !74
  %64 = call i32 (i8*, ...) @printf(i8* %.), !dbg !74
  %65 = load i32, i32* %err, align 4, !dbg !75
  ret i32 %65, !dbg !75
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "36.typedef_struct.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "fill_employee", linkageName: "fill_employee", scope: null, file: !1, line: 21, type: !3, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !10)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6, !8, !9}
!5 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "struct.Employee", size: 64, encoding: DW_ATE_unsigned)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !{}
!11 = !DILocalVariable(name: "sex", arg: 3, scope: !2, file: !1, line: 21, type: !9)
!12 = !DILocation(line: 21, column: 6, scope: !2)
!13 = !DILocalVariable(name: "id", arg: 2, scope: !2, file: !1, line: 21, type: !8)
!14 = !DILocalVariable(name: "employee", arg: 1, scope: !2, file: !1, line: 21, type: !6)
!15 = !DILocation(line: 22, column: 3, scope: !2)
!16 = !DILocation(line: 23, column: 3, scope: !2)
!17 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 26, type: !18, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !10)
!18 = !DISubroutineType(types: !19)
!19 = !{!8}
!20 = !DILocalVariable(name: "len", scope: !17, file: !1, line: 34, type: !21)
!21 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!22 = !DILocation(line: 34, column: 3, scope: !17)
!23 = !DILocalVariable(name: "sex", scope: !17, file: !1, line: 33, type: !8)
!24 = !DILocation(line: 33, column: 3, scope: !17)
!25 = !DILocalVariable(name: "id", scope: !17, file: !1, line: 32, type: !8)
!26 = !DILocation(line: 32, column: 3, scope: !17)
!27 = !DILocalVariable(name: "sz", scope: !17, file: !1, line: 31, type: !8)
!28 = !DILocation(line: 31, column: 3, scope: !17)
!29 = !DILocalVariable(name: "origin", scope: !17, file: !1, line: 30, type: !30)
!30 = !DIBasicType(name: "struct.Point", size: 64, encoding: DW_ATE_unsigned)
!31 = !DILocation(line: 30, column: 3, scope: !17)
!32 = !DILocalVariable(name: "workerPtr", scope: !17, file: !1, line: 29, type: !6)
!33 = !DILocation(line: 29, column: 3, scope: !17)
!34 = !DILocalVariable(name: "worker", scope: !17, file: !1, line: 28, type: !7)
!35 = !DILocation(line: 28, column: 3, scope: !17)
!36 = !DILocalVariable(name: "err", scope: !17, file: !1, line: 27, type: !8)
!37 = !DILocation(line: 27, column: 3, scope: !17)
!38 = !DILocation(line: 36, column: 3, scope: !17)
!39 = !DILocation(line: 37, column: 3, scope: !17)
!40 = !DILocation(line: 38, column: 3, scope: !17)
!41 = !DILocation(line: 40, column: 3, scope: !17)
!42 = !DILocation(line: 41, column: 3, scope: !17)
!43 = !DILocation(line: 43, column: 3, scope: !17)
!44 = !DILocation(line: 44, column: 3, scope: !17)
!45 = !DILocation(line: 44, column: 16, scope: !17)
!46 = !DILocation(line: 45, column: 3, scope: !17)
!47 = !DILocation(line: 46, column: 3, scope: !17)
!48 = !DILocation(line: 46, column: 16, scope: !17)
!49 = !DILocation(line: 47, column: 3, scope: !17)
!50 = !DILocation(line: 48, column: 3, scope: !17)
!51 = !DILocation(line: 48, column: 16, scope: !17)
!52 = !DILocation(line: 49, column: 3, scope: !17)
!53 = !DILocation(line: 50, column: 3, scope: !17)
!54 = !DILocation(line: 50, column: 16, scope: !17)
!55 = !DILocation(line: 52, column: 3, scope: !17)
!56 = !DILocation(line: 53, column: 3, scope: !17)
!57 = !DILocation(line: 53, column: 17, scope: !17)
!58 = !DILocation(line: 55, column: 3, scope: !17)
!59 = !DILocation(line: 56, column: 3, scope: !17)
!60 = !DILocation(line: 56, column: 17, scope: !17)
!61 = !DILocation(line: 57, column: 3, scope: !17)
!62 = !DILocation(line: 58, column: 3, scope: !17)
!63 = !DILocation(line: 58, column: 17, scope: !17)
!64 = !DILocation(line: 59, column: 3, scope: !17)
!65 = !DILocation(line: 60, column: 3, scope: !17)
!66 = !DILocation(line: 60, column: 19, scope: !17)
!67 = !DILocation(line: 61, column: 3, scope: !17)
!68 = !DILocation(line: 62, column: 3, scope: !17)
!69 = !DILocation(line: 62, column: 16, scope: !17)
!70 = !DILocation(line: 63, column: 3, scope: !17)
!71 = !DILocation(line: 64, column: 3, scope: !17)
!72 = !DILocation(line: 64, column: 17, scope: !17)
!73 = !DILocation(line: 66, column: 3, scope: !17)
!74 = !DILocation(line: 0, scope: !17)
!75 = !DILocation(line: 71, column: 3, scope: !17)
