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
  store %struct.Employee* %0, %struct.Employee** %employee, align 8, !dbg !11
  store i32 %1, i32* %id, align 4, !dbg !11
  store i8 %2, i8* %sex, align 1, !dbg !11
  %3 = load %struct.Employee*, %struct.Employee** %employee, align 8, !dbg !11
  %4 = bitcast %struct.Employee* %3 to i32*, !dbg !11
  %5 = load i32, i32* %id, align 4, !dbg !11
  store i32 %5, i32* %4, align 4, !dbg !11
  %6 = load i32, i32* %4, align 4, !dbg !11
  %7 = load %struct.Employee*, %struct.Employee** %employee, align 8, !dbg !11
  %8 = getelementptr %struct.Employee, %struct.Employee* %7, i32 0, i32 1, !dbg !11
  %9 = load i8, i8* %sex, align 1, !dbg !11
  store i8 %9, i8* %8, align 1, !dbg !11
  %10 = load i8, i8* %8, align 1, !dbg !11
  ret void, !dbg !11
}

define i32 @main() !dbg !12 {
entry:
  %len = alloca i64, align 8
  %sex = alloca i32, align 4
  %id = alloca i32, align 4
  %sz = alloca i32, align 4
  %origin = alloca %struct.Point, align 8
  %workerPtr = alloca %struct.Employee*, align 8
  %worker = alloca %struct.Employee, align 8
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !15
  %0 = getelementptr %struct.Employee, %struct.Employee* %worker, i32 0, i32 1, !dbg !15
  store i8 77, i8* %0, align 1, !dbg !15
  %1 = load i8, i8* %0, align 1, !dbg !15
  store %struct.Employee* %worker, %struct.Employee** %workerPtr, align 8, !dbg !15
  %2 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8, !dbg !15
  %3 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8, !dbg !15
  call void @fill_employee(%struct.Employee* %3, i32 11, i8 70), !dbg !15
  %4 = bitcast %struct.Point* %origin to i32*, !dbg !15
  store i32 3, i32* %4, align 4, !dbg !15
  %5 = load i32, i32* %4, align 4, !dbg !15
  %6 = getelementptr %struct.Point, %struct.Point* %origin, i32 0, i32 1, !dbg !15
  store i32 4, i32* %6, align 4, !dbg !15
  %7 = load i32, i32* %6, align 4, !dbg !15
  store i32 8, i32* %sz, align 4, !dbg !15
  %8 = load i32, i32* %sz, align 4, !dbg !15
  %9 = load i32, i32* %sz, align 4, !dbg !15
  %10 = icmp ne i32 %9, 8, !dbg !15
  br i1 %10, label %then, label %if.end, !dbg !15

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !15
  %11 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end, !dbg !15

if.end:                                           ; preds = %entry, %then
  store i32 8, i32* %sz, align 4, !dbg !15
  %12 = load i32, i32* %sz, align 4, !dbg !15
  %13 = load i32, i32* %sz, align 4, !dbg !15
  %14 = icmp ne i32 %13, 8, !dbg !15
  br i1 %14, label %then1, label %if.end3, !dbg !15

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !15
  %15 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end3, !dbg !15

if.end3:                                          ; preds = %if.end, %then1
  store i32 8, i32* %sz, align 4, !dbg !15
  %16 = load i32, i32* %sz, align 4, !dbg !15
  %17 = load i32, i32* %sz, align 4, !dbg !15
  %18 = icmp ne i32 %17, 8, !dbg !15
  br i1 %18, label %then4, label %if.end6, !dbg !15

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !15
  %19 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end6, !dbg !15

if.end6:                                          ; preds = %if.end3, %then4
  store i32 8, i32* %sz, align 4, !dbg !15
  %20 = load i32, i32* %sz, align 4, !dbg !15
  %21 = load i32, i32* %sz, align 4, !dbg !15
  %22 = icmp ne i32 %21, 8, !dbg !15
  br i1 %22, label %then7, label %if.end9, !dbg !15

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !15
  %23 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end9, !dbg !15

if.end9:                                          ; preds = %if.end6, %then7
  %24 = call i64 @strlen(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @0, i32 0, i32 0)), !dbg !15
  store i64 %24, i64* %len, align 4, !dbg !15
  %25 = load i64, i64* %len, align 4, !dbg !15
  %26 = load i64, i64* %len, align 4, !dbg !15
  %27 = icmp ne i64 %26, 2, !dbg !15
  br i1 %27, label %then10, label %if.end12, !dbg !15

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !15
  %28 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end12, !dbg !15

if.end12:                                         ; preds = %if.end9, %then10
  %29 = bitcast %struct.Employee* %worker to i32*, !dbg !15
  %30 = load i32, i32* %29, align 4, !dbg !15
  store i32 %30, i32* %id, align 4, !dbg !15
  %31 = load i32, i32* %id, align 4, !dbg !15
  %32 = load i32, i32* %id, align 4, !dbg !15
  %33 = icmp ne i32 %32, 11, !dbg !15
  br i1 %33, label %then13, label %if.end15, !dbg !15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !15
  %34 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end15, !dbg !15

if.end15:                                         ; preds = %if.end12, %then13
  %35 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8, !dbg !15
  %36 = bitcast %struct.Employee* %35 to i32*, !dbg !15
  %37 = load i32, i32* %36, align 4, !dbg !15
  store i32 %37, i32* %id, align 4, !dbg !15
  %38 = load i32, i32* %id, align 4, !dbg !15
  %39 = load i32, i32* %id, align 4, !dbg !15
  %40 = icmp ne i32 %39, 11, !dbg !15
  br i1 %40, label %then16, label %if.end18, !dbg !15

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !15
  %41 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end18, !dbg !15

if.end18:                                         ; preds = %if.end15, %then16
  %42 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8, !dbg !15
  %43 = getelementptr %struct.Employee, %struct.Employee* %42, i32 0, i32 1, !dbg !15
  %44 = load i8, i8* %43, align 1, !dbg !15
  %45 = sext i8 %44 to i32, !dbg !15
  store i32 %45, i32* %sex, align 4, !dbg !15
  %46 = load i32, i32* %sex, align 4, !dbg !15
  %47 = load i32, i32* %sex, align 4, !dbg !15
  %48 = icmp ne i32 %47, 70, !dbg !15
  br i1 %48, label %then19, label %if.end21, !dbg !15

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !15
  %49 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end21, !dbg !15

if.end21:                                         ; preds = %if.end18, %then19
  %50 = bitcast %struct.Point* %origin to i32*, !dbg !15
  %51 = load i32, i32* %50, align 4, !dbg !15
  store i32 %51, i32* %id, align 4, !dbg !15
  %52 = load i32, i32* %id, align 4, !dbg !15
  %53 = load i32, i32* %id, align 4, !dbg !15
  %54 = icmp ne i32 %53, 3, !dbg !15
  br i1 %54, label %then22, label %if.end24, !dbg !15

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !15
  %55 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end24, !dbg !15

if.end24:                                         ; preds = %if.end21, %then22
  %56 = getelementptr %struct.Point, %struct.Point* %origin, i32 0, i32 1, !dbg !15
  %57 = load i32, i32* %56, align 4, !dbg !15
  store i32 %57, i32* %sex, align 4, !dbg !15
  %58 = load i32, i32* %sex, align 4, !dbg !15
  %59 = load i32, i32* %sex, align 4, !dbg !15
  %60 = icmp ne i32 %59, 4, !dbg !15
  br i1 %60, label %then25, label %if.end27, !dbg !15

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !15
  %61 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end27, !dbg !15

if.end27:                                         ; preds = %if.end24, %then25
  %62 = load i32, i32* %err, align 4, !dbg !15
  %63 = icmp eq i32 %62, 0, !dbg !15
  %. = select i1 %63, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @1, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @2, i32 0, i32 0), !dbg !15
  %64 = call i32 (i8*, ...) @printf(i8* %.), !dbg !15
  %65 = load i32, i32* %err, align 4, !dbg !15
  ret i32 %65, !dbg !15
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "36.typedef_struct.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "fill_employee", linkageName: "fill_employee", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !10)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6, !8, !9}
!5 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "unknown", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !{}
!11 = !DILocation(line: 1, column: 1, scope: !2)
!12 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !13, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !10)
!13 = !DISubroutineType(types: !14)
!14 = !{!8}
!15 = !DILocation(line: 1, column: 1, scope: !12)
