; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%struct.Data = type { i32, i32 }

@0 = private unnamed_addr constant [24 x i8] c"24.struct_array.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"24.struct_array.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %data = alloca i32, align 4
  %id = alloca i32, align 4
  %da = alloca [2 x %struct.Data], align 8
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  %0 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !7
  %1 = bitcast %struct.Data* %0 to %struct.Data*, !dbg !7
  %2 = bitcast %struct.Data* %1 to i32*, !dbg !7
  store i32 0, i32* %2, align 4, !dbg !7
  %3 = load i32, i32* %2, align 4, !dbg !7
  %4 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !7
  %5 = bitcast %struct.Data* %4 to %struct.Data*, !dbg !7
  %6 = getelementptr %struct.Data, %struct.Data* %5, i32 0, i32 1, !dbg !7
  store i32 0, i32* %6, align 4, !dbg !7
  %7 = load i32, i32* %6, align 4, !dbg !7
  %8 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !7
  %9 = getelementptr %struct.Data, %struct.Data* %8, i32 1, !dbg !7
  %10 = bitcast %struct.Data* %9 to i32*, !dbg !7
  store i32 10, i32* %10, align 4, !dbg !7
  %11 = load i32, i32* %10, align 4, !dbg !7
  %12 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !7
  %13 = getelementptr %struct.Data, %struct.Data* %12, i32 1, !dbg !7
  %14 = getelementptr %struct.Data, %struct.Data* %13, i32 0, i32 1, !dbg !7
  store i32 80, i32* %14, align 4, !dbg !7
  %15 = load i32, i32* %14, align 4, !dbg !7
  %16 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !7
  %17 = getelementptr %struct.Data, %struct.Data* %16, i32 1, !dbg !7
  %18 = bitcast %struct.Data* %17 to i32*, !dbg !7
  %19 = load i32, i32* %18, align 4, !dbg !7
  store i32 %19, i32* %id, align 4, !dbg !7
  %20 = load i32, i32* %id, align 4, !dbg !7
  %21 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !7
  %22 = getelementptr %struct.Data, %struct.Data* %21, i32 1, !dbg !7
  %23 = getelementptr %struct.Data, %struct.Data* %22, i32 0, i32 1, !dbg !7
  %24 = load i32, i32* %23, align 4, !dbg !7
  store i32 %24, i32* %data, align 4, !dbg !7
  %25 = load i32, i32* %data, align 4, !dbg !7
  %26 = load i32, i32* %id, align 4, !dbg !7
  %27 = icmp ne i32 %26, 10, !dbg !7
  br i1 %27, label %then, label %if.end, !dbg !7

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !7
  %28 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end, !dbg !7

if.end:                                           ; preds = %entry, %then
  %29 = load i32, i32* %data, align 4, !dbg !7
  %30 = icmp ne i32 %29, 80, !dbg !7
  br i1 %30, label %then1, label %if.end3, !dbg !7

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !7
  %31 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end3, !dbg !7

if.end3:                                          ; preds = %if.end, %then1
  %32 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !7
  %33 = bitcast %struct.Data* %32 to %struct.Data*, !dbg !7
  %34 = bitcast %struct.Data* %33 to i32*, !dbg !7
  %35 = load i32, i32* %34, align 4, !dbg !7
  store i32 %35, i32* %id, align 4, !dbg !7
  %36 = load i32, i32* %id, align 4, !dbg !7
  %37 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !7
  %38 = bitcast %struct.Data* %37 to %struct.Data*, !dbg !7
  %39 = getelementptr %struct.Data, %struct.Data* %38, i32 0, i32 1, !dbg !7
  %40 = load i32, i32* %39, align 4, !dbg !7
  store i32 %40, i32* %data, align 4, !dbg !7
  %41 = load i32, i32* %data, align 4, !dbg !7
  %42 = load i32, i32* %id, align 4, !dbg !7
  %43 = icmp ne i32 %42, 0, !dbg !7
  br i1 %43, label %then4, label %if.end6, !dbg !7

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !7
  %44 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end6, !dbg !7

if.end6:                                          ; preds = %if.end3, %then4
  %45 = load i32, i32* %data, align 4, !dbg !7
  %46 = icmp ne i32 %45, 0, !dbg !7
  br i1 %46, label %then7, label %if.end9, !dbg !7

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !7
  %47 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end9, !dbg !7

if.end9:                                          ; preds = %if.end6, %then7
  %48 = load i32, i32* %err, align 4, !dbg !7
  %49 = icmp eq i32 %48, 0, !dbg !7
  %. = select i1 %49, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0), !dbg !7
  %50 = call i32 (i8*, ...) @printf(i8* %.), !dbg !7
  %51 = load i32, i32* %err, align 4, !dbg !7
  ret i32 %51, !dbg !7
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "24.struct_array.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
