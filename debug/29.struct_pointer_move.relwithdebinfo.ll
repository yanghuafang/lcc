; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%struct.Data = type { i32, i32 }

@0 = private unnamed_addr constant [31 x i8] c"29.struct_pointer_move.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"29.struct_pointer_move.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %p = alloca %struct.Data*, align 8
  %val = alloca i32, align 4
  %id = alloca i32, align 4
  %data = alloca [4 x %struct.Data], align 8
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  %0 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !7
  %1 = bitcast %struct.Data* %0 to %struct.Data*, !dbg !7
  %2 = bitcast %struct.Data* %1 to i32*, !dbg !7
  store i32 10, i32* %2, align 4, !dbg !7
  %3 = load i32, i32* %2, align 4, !dbg !7
  %4 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !7
  %5 = bitcast %struct.Data* %4 to %struct.Data*, !dbg !7
  %6 = getelementptr %struct.Data, %struct.Data* %5, i32 0, i32 1, !dbg !7
  store i32 12, i32* %6, align 4, !dbg !7
  %7 = load i32, i32* %6, align 4, !dbg !7
  %8 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !7
  %9 = getelementptr %struct.Data, %struct.Data* %8, i32 1, !dbg !7
  %10 = bitcast %struct.Data* %9 to i32*, !dbg !7
  store i32 20, i32* %10, align 4, !dbg !7
  %11 = load i32, i32* %10, align 4, !dbg !7
  %12 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !7
  %13 = getelementptr %struct.Data, %struct.Data* %12, i32 1, !dbg !7
  %14 = getelementptr %struct.Data, %struct.Data* %13, i32 0, i32 1, !dbg !7
  store i32 24, i32* %14, align 4, !dbg !7
  %15 = load i32, i32* %14, align 4, !dbg !7
  %16 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !7
  %17 = getelementptr %struct.Data, %struct.Data* %16, i32 2, !dbg !7
  %18 = bitcast %struct.Data* %17 to i32*, !dbg !7
  store i32 30, i32* %18, align 4, !dbg !7
  %19 = load i32, i32* %18, align 4, !dbg !7
  %20 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !7
  %21 = getelementptr %struct.Data, %struct.Data* %20, i32 2, !dbg !7
  %22 = getelementptr %struct.Data, %struct.Data* %21, i32 0, i32 1, !dbg !7
  store i32 36, i32* %22, align 4, !dbg !7
  %23 = load i32, i32* %22, align 4, !dbg !7
  %24 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !7
  %25 = getelementptr %struct.Data, %struct.Data* %24, i32 3, !dbg !7
  %26 = bitcast %struct.Data* %25 to i32*, !dbg !7
  store i32 40, i32* %26, align 4, !dbg !7
  %27 = load i32, i32* %26, align 4, !dbg !7
  %28 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !7
  %29 = getelementptr %struct.Data, %struct.Data* %28, i32 3, !dbg !7
  %30 = getelementptr %struct.Data, %struct.Data* %29, i32 0, i32 1, !dbg !7
  store i32 48, i32* %30, align 4, !dbg !7
  %31 = load i32, i32* %30, align 4, !dbg !7
  %32 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !7
  store %struct.Data* %32, %struct.Data** %p, align 8, !dbg !7
  %33 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !7
  %34 = bitcast %struct.Data* %33 to i32*, !dbg !7
  %35 = load i32, i32* %34, align 4, !dbg !7
  store i32 %35, i32* %id, align 4, !dbg !7
  %36 = load i32, i32* %id, align 4, !dbg !7
  %37 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !7
  %38 = getelementptr %struct.Data, %struct.Data* %37, i32 0, i32 1, !dbg !7
  %39 = load i32, i32* %38, align 4, !dbg !7
  store i32 %39, i32* %val, align 4, !dbg !7
  %40 = load i32, i32* %val, align 4, !dbg !7
  %41 = load i32, i32* %id, align 4, !dbg !7
  %42 = icmp ne i32 %41, 10, !dbg !7
  br i1 %42, label %then, label %if.end, !dbg !7

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !7
  %43 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end, !dbg !7

if.end:                                           ; preds = %entry, %then
  %44 = load i32, i32* %val, align 4, !dbg !7
  %45 = icmp ne i32 %44, 12, !dbg !7
  br i1 %45, label %then1, label %if.end3, !dbg !7

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !7
  %46 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end3, !dbg !7

if.end3:                                          ; preds = %if.end, %then1
  %47 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !7
  %48 = getelementptr %struct.Data, %struct.Data* %47, i32 1, !dbg !7
  store %struct.Data* %48, %struct.Data** %p, align 8, !dbg !7
  %49 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !7
  %50 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !7
  %51 = bitcast %struct.Data* %50 to i32*, !dbg !7
  %52 = load i32, i32* %51, align 4, !dbg !7
  store i32 %52, i32* %id, align 4, !dbg !7
  %53 = load i32, i32* %id, align 4, !dbg !7
  %54 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !7
  %55 = getelementptr %struct.Data, %struct.Data* %54, i32 0, i32 1, !dbg !7
  %56 = load i32, i32* %55, align 4, !dbg !7
  store i32 %56, i32* %val, align 4, !dbg !7
  %57 = load i32, i32* %val, align 4, !dbg !7
  %58 = load i32, i32* %id, align 4, !dbg !7
  %59 = icmp ne i32 %58, 20, !dbg !7
  br i1 %59, label %then4, label %if.end6, !dbg !7

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !7
  %60 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end6, !dbg !7

if.end6:                                          ; preds = %if.end3, %then4
  %61 = load i32, i32* %val, align 4, !dbg !7
  %62 = icmp ne i32 %61, 24, !dbg !7
  br i1 %62, label %then7, label %if.end9, !dbg !7

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !7
  %63 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end9, !dbg !7

if.end9:                                          ; preds = %if.end6, %then7
  %64 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !7
  %65 = getelementptr %struct.Data, %struct.Data* %64, i32 1, !dbg !7
  store %struct.Data* %65, %struct.Data** %p, align 8, !dbg !7
  %66 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !7
  %67 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !7
  %68 = bitcast %struct.Data* %67 to i32*, !dbg !7
  %69 = load i32, i32* %68, align 4, !dbg !7
  store i32 %69, i32* %id, align 4, !dbg !7
  %70 = load i32, i32* %id, align 4, !dbg !7
  %71 = load i32, i32* %id, align 4, !dbg !7
  %72 = icmp ne i32 %71, 30, !dbg !7
  br i1 %72, label %then10, label %if.end12, !dbg !7

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !7
  %73 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end12, !dbg !7

if.end12:                                         ; preds = %if.end9, %then10
  %74 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !7
  %75 = getelementptr %struct.Data, %struct.Data* %74, i32 1, !dbg !7
  store %struct.Data* %75, %struct.Data** %p, align 8, !dbg !7
  %76 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !7
  %77 = bitcast %struct.Data* %76 to i32*, !dbg !7
  %78 = load i32, i32* %77, align 4, !dbg !7
  store i32 %78, i32* %id, align 4, !dbg !7
  %79 = load i32, i32* %id, align 4, !dbg !7
  %80 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !7
  %81 = getelementptr %struct.Data, %struct.Data* %80, i32 0, i32 1, !dbg !7
  %82 = load i32, i32* %81, align 4, !dbg !7
  store i32 %82, i32* %val, align 4, !dbg !7
  %83 = load i32, i32* %val, align 4, !dbg !7
  %84 = load i32, i32* %id, align 4, !dbg !7
  %85 = icmp ne i32 %84, 40, !dbg !7
  br i1 %85, label %then13, label %if.end15, !dbg !7

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !7
  %86 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end15, !dbg !7

if.end15:                                         ; preds = %if.end12, %then13
  %87 = load i32, i32* %val, align 4, !dbg !7
  %88 = icmp ne i32 %87, 48, !dbg !7
  br i1 %88, label %then16, label %if.end18, !dbg !7

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !7
  %89 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end18, !dbg !7

if.end18:                                         ; preds = %if.end15, %then16
  %90 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !7
  %91 = getelementptr %struct.Data, %struct.Data* %90, i32 3, !dbg !7
  store %struct.Data* %91, %struct.Data** %p, align 8, !dbg !7
  %92 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !7
  %93 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !7
  %94 = getelementptr %struct.Data, %struct.Data* %93, i32 -1, !dbg !7
  store %struct.Data* %94, %struct.Data** %p, align 8, !dbg !7
  %95 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !7
  %96 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !7
  %97 = bitcast %struct.Data* %96 to i32*, !dbg !7
  %98 = load i32, i32* %97, align 4, !dbg !7
  store i32 %98, i32* %id, align 4, !dbg !7
  %99 = load i32, i32* %id, align 4, !dbg !7
  %100 = load i32, i32* %id, align 4, !dbg !7
  %101 = icmp ne i32 %100, 30, !dbg !7
  br i1 %101, label %then19, label %if.end21, !dbg !7

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !7
  %102 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end21, !dbg !7

if.end21:                                         ; preds = %if.end18, %then19
  %103 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !7
  %104 = getelementptr %struct.Data, %struct.Data* %103, i32 -1, !dbg !7
  store %struct.Data* %104, %struct.Data** %p, align 8, !dbg !7
  %105 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !7
  %106 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !7
  %107 = bitcast %struct.Data* %106 to i32*, !dbg !7
  %108 = load i32, i32* %107, align 4, !dbg !7
  store i32 %108, i32* %id, align 4, !dbg !7
  %109 = load i32, i32* %id, align 4, !dbg !7
  %110 = load i32, i32* %id, align 4, !dbg !7
  %111 = icmp ne i32 %110, 20, !dbg !7
  br i1 %111, label %then22, label %if.end24, !dbg !7

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !7
  %112 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end24, !dbg !7

if.end24:                                         ; preds = %if.end21, %then22
  %113 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !7
  %114 = getelementptr %struct.Data, %struct.Data* %113, i32 -1, !dbg !7
  store %struct.Data* %114, %struct.Data** %p, align 8, !dbg !7
  %115 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !7
  %116 = bitcast %struct.Data* %115 to i32*, !dbg !7
  %117 = load i32, i32* %116, align 4, !dbg !7
  store i32 %117, i32* %id, align 4, !dbg !7
  %118 = load i32, i32* %id, align 4, !dbg !7
  %119 = load i32, i32* %id, align 4, !dbg !7
  %120 = icmp ne i32 %119, 10, !dbg !7
  br i1 %120, label %then25, label %if.end27, !dbg !7

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !7
  %121 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end27, !dbg !7

if.end27:                                         ; preds = %if.end24, %then25
  %122 = load i32, i32* %err, align 4, !dbg !7
  %123 = icmp eq i32 %122, 0, !dbg !7
  %. = select i1 %123, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @1, i32 0, i32 0), !dbg !7
  %124 = call i32 (i8*, ...) @printf(i8* %.), !dbg !7
  %125 = load i32, i32* %err, align 4, !dbg !7
  ret i32 %125, !dbg !7
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "29.struct_pointer_move.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
