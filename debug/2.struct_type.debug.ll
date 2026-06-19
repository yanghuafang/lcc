; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%struct.Employee = type { i8*, i8, i32, i32, float }

@0 = private unnamed_addr constant [9 x i8] c"employee\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"2.struct_type.c PASS\0A\00", align 1
@2 = private unnamed_addr constant [22 x i8] c"2.struct_type.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %age = alloca i32, align 4
  %sex = alloca i32, align 4
  %id = alloca i32, align 4
  %employee = alloca %struct.Employee, align 8
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  %0 = bitcast %struct.Employee* %employee to i8**, !dbg !7
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @0, i32 0, i32 0), i8** %0, align 8, !dbg !7
  %1 = load i8*, i8** %0, align 8, !dbg !7
  %2 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 1, !dbg !7
  store i8 77, i8* %2, align 1, !dbg !7
  %3 = load i8, i8* %2, align 1, !dbg !7
  %4 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 2, !dbg !7
  store i32 100, i32* %4, align 4, !dbg !7
  %5 = load i32, i32* %4, align 4, !dbg !7
  %6 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 3, !dbg !7
  store i32 22, i32* %6, align 4, !dbg !7
  %7 = load i32, i32* %6, align 4, !dbg !7
  %8 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 4, !dbg !7
  store float 3.000000e+03, float* %8, align 4, !dbg !7
  %9 = load float, float* %8, align 4, !dbg !7
  %10 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 2, !dbg !7
  %11 = load i32, i32* %10, align 4, !dbg !7
  store i32 %11, i32* %id, align 4, !dbg !7
  %12 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 1, !dbg !7
  %13 = load i8, i8* %12, align 1, !dbg !7
  %14 = sext i8 %13 to i32, !dbg !7
  store i32 %14, i32* %sex, align 4, !dbg !7
  %15 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 3, !dbg !7
  %16 = load i32, i32* %15, align 4, !dbg !7
  store i32 %16, i32* %age, align 4, !dbg !7
  %17 = load i32, i32* %id, align 4, !dbg !7
  %18 = icmp ne i32 %17, 100, !dbg !7
  br i1 %18, label %then, label %if.end, !dbg !7

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !7
  %19 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end, !dbg !7

if.end:                                           ; preds = %entry, %then
  %20 = load i32, i32* %sex, align 4, !dbg !7
  %21 = icmp ne i32 %20, 77, !dbg !7
  br i1 %21, label %then1, label %if.end3, !dbg !7

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !7
  %22 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end3, !dbg !7

if.end3:                                          ; preds = %if.end, %then1
  %23 = load i32, i32* %age, align 4, !dbg !7
  %24 = icmp ne i32 %23, 22, !dbg !7
  br i1 %24, label %then4, label %if.end6, !dbg !7

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !7
  %25 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end6, !dbg !7

if.end6:                                          ; preds = %if.end3, %then4
  %26 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 3, !dbg !7
  store i32 0, i32* %26, align 4, !dbg !7
  %27 = load i32, i32* %26, align 4, !dbg !7
  %28 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 3, !dbg !7
  %29 = load i32, i32* %28, align 4, !dbg !7
  store i32 %29, i32* %age, align 4, !dbg !7
  %30 = load i32, i32* %age, align 4, !dbg !7
  %31 = load i32, i32* %age, align 4, !dbg !7
  %32 = icmp ne i32 %31, 0, !dbg !7
  br i1 %32, label %then7, label %if.end9, !dbg !7

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !7
  %33 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end9, !dbg !7

if.end9:                                          ; preds = %if.end6, %then7
  %34 = load i32, i32* %err, align 4, !dbg !7
  %35 = icmp eq i32 %34, 0, !dbg !7
  %. = select i1 %35, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @1, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @2, i32 0, i32 0), !dbg !7
  %36 = call i32 (i8*, ...) @printf(i8* %.), !dbg !7
  %37 = load i32, i32* %err, align 4, !dbg !7
  ret i32 %37, !dbg !7
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "2.struct_type.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
