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
  %id = alloca i32, align 4
  %employee = alloca %struct.Employee*, align 8
  store %struct.Employee* %0, %struct.Employee** %employee, align 8
  store i32 %1, i32* %id, align 4
  store i8 %2, i8* %sex, align 1
  %3 = load %struct.Employee*, %struct.Employee** %employee, align 8, !dbg !11
  %4 = bitcast %struct.Employee* %3 to i32*, !dbg !11
  %5 = load i32, i32* %id, align 4, !dbg !11
  store i32 %5, i32* %4, align 4, !dbg !11
  %6 = load i32, i32* %4, align 4, !dbg !11
  %7 = load %struct.Employee*, %struct.Employee** %employee, align 8, !dbg !12
  %8 = getelementptr %struct.Employee, %struct.Employee* %7, i32 0, i32 1, !dbg !12
  %9 = load i8, i8* %sex, align 1, !dbg !12
  store i8 %9, i8* %8, align 1, !dbg !12
  %10 = load i8, i8* %8, align 1, !dbg !12
  ret void, !dbg !12
}

define i32 @main() !dbg !13 {
entry:
  %len = alloca i64, align 8
  %sex = alloca i32, align 4
  %id = alloca i32, align 4
  %sz = alloca i32, align 4
  %origin = alloca %struct.Point, align 8
  %workerPtr = alloca %struct.Employee*, align 8
  %worker = alloca %struct.Employee, align 8
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !16
  %0 = getelementptr %struct.Employee, %struct.Employee* %worker, i32 0, i32 1, !dbg !17
  store i8 77, i8* %0, align 1, !dbg !17
  %1 = load i8, i8* %0, align 1, !dbg !17
  store %struct.Employee* %worker, %struct.Employee** %workerPtr, align 8, !dbg !18
  %2 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8, !dbg !18
  %3 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8, !dbg !19
  call void @fill_employee(%struct.Employee* %3, i32 11, i8 70), !dbg !19
  %4 = bitcast %struct.Point* %origin to i32*, !dbg !20
  store i32 3, i32* %4, align 4, !dbg !20
  %5 = load i32, i32* %4, align 4, !dbg !20
  %6 = getelementptr %struct.Point, %struct.Point* %origin, i32 0, i32 1, !dbg !21
  store i32 4, i32* %6, align 4, !dbg !21
  %7 = load i32, i32* %6, align 4, !dbg !21
  store i32 8, i32* %sz, align 4, !dbg !22
  %8 = load i32, i32* %sz, align 4, !dbg !22
  %9 = load i32, i32* %sz, align 4, !dbg !23
  %10 = icmp ne i32 %9, 8, !dbg !23
  br i1 %10, label %then, label %if.end, !dbg !23

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !24
  %11 = load i32, i32* %err, align 4, !dbg !24
  br label %if.end, !dbg !24

if.end:                                           ; preds = %entry, %then
  store i32 8, i32* %sz, align 4, !dbg !25
  %12 = load i32, i32* %sz, align 4, !dbg !25
  %13 = load i32, i32* %sz, align 4, !dbg !26
  %14 = icmp ne i32 %13, 8, !dbg !26
  br i1 %14, label %then1, label %if.end3, !dbg !26

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !27
  %15 = load i32, i32* %err, align 4, !dbg !27
  br label %if.end3, !dbg !27

if.end3:                                          ; preds = %if.end, %then1
  store i32 8, i32* %sz, align 4, !dbg !28
  %16 = load i32, i32* %sz, align 4, !dbg !28
  %17 = load i32, i32* %sz, align 4, !dbg !29
  %18 = icmp ne i32 %17, 8, !dbg !29
  br i1 %18, label %then4, label %if.end6, !dbg !29

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !30
  %19 = load i32, i32* %err, align 4, !dbg !30
  br label %if.end6, !dbg !30

if.end6:                                          ; preds = %if.end3, %then4
  store i32 8, i32* %sz, align 4, !dbg !31
  %20 = load i32, i32* %sz, align 4, !dbg !31
  %21 = load i32, i32* %sz, align 4, !dbg !32
  %22 = icmp ne i32 %21, 8, !dbg !32
  br i1 %22, label %then7, label %if.end9, !dbg !32

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !33
  %23 = load i32, i32* %err, align 4, !dbg !33
  br label %if.end9, !dbg !33

if.end9:                                          ; preds = %if.end6, %then7
  %24 = call i64 @strlen(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @0, i32 0, i32 0)), !dbg !34
  store i64 %24, i64* %len, align 4, !dbg !34
  %25 = load i64, i64* %len, align 4, !dbg !34
  %26 = load i64, i64* %len, align 4, !dbg !35
  %27 = icmp ne i64 %26, 2, !dbg !35
  br i1 %27, label %then10, label %if.end12, !dbg !35

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !36
  %28 = load i32, i32* %err, align 4, !dbg !36
  br label %if.end12, !dbg !36

if.end12:                                         ; preds = %if.end9, %then10
  %29 = bitcast %struct.Employee* %worker to i32*, !dbg !37
  %30 = load i32, i32* %29, align 4, !dbg !37
  store i32 %30, i32* %id, align 4, !dbg !37
  %31 = load i32, i32* %id, align 4, !dbg !37
  %32 = load i32, i32* %id, align 4, !dbg !38
  %33 = icmp ne i32 %32, 11, !dbg !38
  br i1 %33, label %then13, label %if.end15, !dbg !38

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !39
  %34 = load i32, i32* %err, align 4, !dbg !39
  br label %if.end15, !dbg !39

if.end15:                                         ; preds = %if.end12, %then13
  %35 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8, !dbg !40
  %36 = bitcast %struct.Employee* %35 to i32*, !dbg !40
  %37 = load i32, i32* %36, align 4, !dbg !40
  store i32 %37, i32* %id, align 4, !dbg !40
  %38 = load i32, i32* %id, align 4, !dbg !40
  %39 = load i32, i32* %id, align 4, !dbg !41
  %40 = icmp ne i32 %39, 11, !dbg !41
  br i1 %40, label %then16, label %if.end18, !dbg !41

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !42
  %41 = load i32, i32* %err, align 4, !dbg !42
  br label %if.end18, !dbg !42

if.end18:                                         ; preds = %if.end15, %then16
  %42 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8, !dbg !43
  %43 = getelementptr %struct.Employee, %struct.Employee* %42, i32 0, i32 1, !dbg !43
  %44 = load i8, i8* %43, align 1, !dbg !43
  %45 = sext i8 %44 to i32, !dbg !43
  store i32 %45, i32* %sex, align 4, !dbg !43
  %46 = load i32, i32* %sex, align 4, !dbg !43
  %47 = load i32, i32* %sex, align 4, !dbg !44
  %48 = icmp ne i32 %47, 70, !dbg !44
  br i1 %48, label %then19, label %if.end21, !dbg !44

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !45
  %49 = load i32, i32* %err, align 4, !dbg !45
  br label %if.end21, !dbg !45

if.end21:                                         ; preds = %if.end18, %then19
  %50 = bitcast %struct.Point* %origin to i32*, !dbg !46
  %51 = load i32, i32* %50, align 4, !dbg !46
  store i32 %51, i32* %id, align 4, !dbg !46
  %52 = load i32, i32* %id, align 4, !dbg !46
  %53 = load i32, i32* %id, align 4, !dbg !47
  %54 = icmp ne i32 %53, 3, !dbg !47
  br i1 %54, label %then22, label %if.end24, !dbg !47

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !48
  %55 = load i32, i32* %err, align 4, !dbg !48
  br label %if.end24, !dbg !48

if.end24:                                         ; preds = %if.end21, %then22
  %56 = getelementptr %struct.Point, %struct.Point* %origin, i32 0, i32 1, !dbg !49
  %57 = load i32, i32* %56, align 4, !dbg !49
  store i32 %57, i32* %sex, align 4, !dbg !49
  %58 = load i32, i32* %sex, align 4, !dbg !49
  %59 = load i32, i32* %sex, align 4, !dbg !50
  %60 = icmp ne i32 %59, 4, !dbg !50
  br i1 %60, label %then25, label %if.end27, !dbg !50

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !51
  %61 = load i32, i32* %err, align 4, !dbg !51
  br label %if.end27, !dbg !51

if.end27:                                         ; preds = %if.end24, %then25
  %62 = load i32, i32* %err, align 4, !dbg !52
  %63 = icmp eq i32 %62, 0, !dbg !52
  %. = select i1 %63, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @1, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @2, i32 0, i32 0), !dbg !53
  %64 = call i32 (i8*, ...) @printf(i8* %.), !dbg !53
  %65 = load i32, i32* %err, align 4, !dbg !54
  ret i32 %65, !dbg !54
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "36.typedef_struct.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "fill_employee", linkageName: "fill_employee", scope: null, file: !1, line: 21, type: !3, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !10)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6, !8, !9}
!5 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "unknown", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !{}
!11 = !DILocation(line: 22, column: 3, scope: !2)
!12 = !DILocation(line: 23, column: 3, scope: !2)
!13 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 26, type: !14, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !10)
!14 = !DISubroutineType(types: !15)
!15 = !{!8}
!16 = !DILocation(line: 27, column: 3, scope: !13)
!17 = !DILocation(line: 36, column: 3, scope: !13)
!18 = !DILocation(line: 37, column: 3, scope: !13)
!19 = !DILocation(line: 38, column: 3, scope: !13)
!20 = !DILocation(line: 40, column: 3, scope: !13)
!21 = !DILocation(line: 41, column: 3, scope: !13)
!22 = !DILocation(line: 43, column: 3, scope: !13)
!23 = !DILocation(line: 44, column: 3, scope: !13)
!24 = !DILocation(line: 44, column: 16, scope: !13)
!25 = !DILocation(line: 45, column: 3, scope: !13)
!26 = !DILocation(line: 46, column: 3, scope: !13)
!27 = !DILocation(line: 46, column: 16, scope: !13)
!28 = !DILocation(line: 47, column: 3, scope: !13)
!29 = !DILocation(line: 48, column: 3, scope: !13)
!30 = !DILocation(line: 48, column: 16, scope: !13)
!31 = !DILocation(line: 49, column: 3, scope: !13)
!32 = !DILocation(line: 50, column: 3, scope: !13)
!33 = !DILocation(line: 50, column: 16, scope: !13)
!34 = !DILocation(line: 52, column: 3, scope: !13)
!35 = !DILocation(line: 53, column: 3, scope: !13)
!36 = !DILocation(line: 53, column: 17, scope: !13)
!37 = !DILocation(line: 55, column: 3, scope: !13)
!38 = !DILocation(line: 56, column: 3, scope: !13)
!39 = !DILocation(line: 56, column: 17, scope: !13)
!40 = !DILocation(line: 57, column: 3, scope: !13)
!41 = !DILocation(line: 58, column: 3, scope: !13)
!42 = !DILocation(line: 58, column: 17, scope: !13)
!43 = !DILocation(line: 59, column: 3, scope: !13)
!44 = !DILocation(line: 60, column: 3, scope: !13)
!45 = !DILocation(line: 60, column: 19, scope: !13)
!46 = !DILocation(line: 61, column: 3, scope: !13)
!47 = !DILocation(line: 62, column: 3, scope: !13)
!48 = !DILocation(line: 62, column: 16, scope: !13)
!49 = !DILocation(line: 63, column: 3, scope: !13)
!50 = !DILocation(line: 64, column: 3, scope: !13)
!51 = !DILocation(line: 64, column: 17, scope: !13)
!52 = !DILocation(line: 66, column: 3, scope: !13)
!53 = !DILocation(line: 0, scope: !13)
!54 = !DILocation(line: 71, column: 3, scope: !13)
