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
  %0 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !8
  %1 = bitcast %struct.Data* %0 to %struct.Data*, !dbg !8
  %2 = bitcast %struct.Data* %1 to i32*, !dbg !8
  store i32 10, i32* %2, align 4, !dbg !8
  %3 = load i32, i32* %2, align 4, !dbg !8
  %4 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !9
  %5 = bitcast %struct.Data* %4 to %struct.Data*, !dbg !9
  %6 = getelementptr %struct.Data, %struct.Data* %5, i32 0, i32 1, !dbg !9
  store i32 12, i32* %6, align 4, !dbg !9
  %7 = load i32, i32* %6, align 4, !dbg !9
  %8 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !10
  %9 = getelementptr %struct.Data, %struct.Data* %8, i32 1, !dbg !10
  %10 = bitcast %struct.Data* %9 to i32*, !dbg !10
  store i32 20, i32* %10, align 4, !dbg !10
  %11 = load i32, i32* %10, align 4, !dbg !10
  %12 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !11
  %13 = getelementptr %struct.Data, %struct.Data* %12, i32 1, !dbg !11
  %14 = getelementptr %struct.Data, %struct.Data* %13, i32 0, i32 1, !dbg !11
  store i32 24, i32* %14, align 4, !dbg !11
  %15 = load i32, i32* %14, align 4, !dbg !11
  %16 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !12
  %17 = getelementptr %struct.Data, %struct.Data* %16, i32 2, !dbg !12
  %18 = bitcast %struct.Data* %17 to i32*, !dbg !12
  store i32 30, i32* %18, align 4, !dbg !12
  %19 = load i32, i32* %18, align 4, !dbg !12
  %20 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !13
  %21 = getelementptr %struct.Data, %struct.Data* %20, i32 2, !dbg !13
  %22 = getelementptr %struct.Data, %struct.Data* %21, i32 0, i32 1, !dbg !13
  store i32 36, i32* %22, align 4, !dbg !13
  %23 = load i32, i32* %22, align 4, !dbg !13
  %24 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !14
  %25 = getelementptr %struct.Data, %struct.Data* %24, i32 3, !dbg !14
  %26 = bitcast %struct.Data* %25 to i32*, !dbg !14
  store i32 40, i32* %26, align 4, !dbg !14
  %27 = load i32, i32* %26, align 4, !dbg !14
  %28 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !15
  %29 = getelementptr %struct.Data, %struct.Data* %28, i32 3, !dbg !15
  %30 = getelementptr %struct.Data, %struct.Data* %29, i32 0, i32 1, !dbg !15
  store i32 48, i32* %30, align 4, !dbg !15
  %31 = load i32, i32* %30, align 4, !dbg !15
  %32 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !16
  store %struct.Data* %32, %struct.Data** %p, align 8, !dbg !16
  %33 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !17
  %34 = bitcast %struct.Data* %33 to i32*, !dbg !17
  %35 = load i32, i32* %34, align 4, !dbg !17
  store i32 %35, i32* %id, align 4, !dbg !17
  %36 = load i32, i32* %id, align 4, !dbg !17
  %37 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !18
  %38 = getelementptr %struct.Data, %struct.Data* %37, i32 0, i32 1, !dbg !18
  %39 = load i32, i32* %38, align 4, !dbg !18
  store i32 %39, i32* %val, align 4, !dbg !18
  %40 = load i32, i32* %val, align 4, !dbg !18
  %41 = load i32, i32* %id, align 4, !dbg !19
  %42 = icmp ne i32 %41, 10, !dbg !19
  br i1 %42, label %then, label %if.end, !dbg !19

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !20
  %43 = load i32, i32* %err, align 4, !dbg !20
  br label %if.end, !dbg !20

if.end:                                           ; preds = %entry, %then
  %44 = load i32, i32* %val, align 4, !dbg !21
  %45 = icmp ne i32 %44, 12, !dbg !21
  br i1 %45, label %then1, label %if.end3, !dbg !21

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !22
  %46 = load i32, i32* %err, align 4, !dbg !22
  br label %if.end3, !dbg !22

if.end3:                                          ; preds = %if.end, %then1
  %47 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !23
  %48 = getelementptr %struct.Data, %struct.Data* %47, i32 1, !dbg !23
  store %struct.Data* %48, %struct.Data** %p, align 8, !dbg !23
  %49 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !23
  %50 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !24
  %51 = bitcast %struct.Data* %50 to i32*, !dbg !24
  %52 = load i32, i32* %51, align 4, !dbg !24
  store i32 %52, i32* %id, align 4, !dbg !24
  %53 = load i32, i32* %id, align 4, !dbg !24
  %54 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !25
  %55 = getelementptr %struct.Data, %struct.Data* %54, i32 0, i32 1, !dbg !25
  %56 = load i32, i32* %55, align 4, !dbg !25
  store i32 %56, i32* %val, align 4, !dbg !25
  %57 = load i32, i32* %val, align 4, !dbg !25
  %58 = load i32, i32* %id, align 4, !dbg !26
  %59 = icmp ne i32 %58, 20, !dbg !26
  br i1 %59, label %then4, label %if.end6, !dbg !26

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !27
  %60 = load i32, i32* %err, align 4, !dbg !27
  br label %if.end6, !dbg !27

if.end6:                                          ; preds = %if.end3, %then4
  %61 = load i32, i32* %val, align 4, !dbg !28
  %62 = icmp ne i32 %61, 24, !dbg !28
  br i1 %62, label %then7, label %if.end9, !dbg !28

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !29
  %63 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end9, !dbg !29

if.end9:                                          ; preds = %if.end6, %then7
  %64 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !30
  %65 = getelementptr %struct.Data, %struct.Data* %64, i32 1, !dbg !30
  store %struct.Data* %65, %struct.Data** %p, align 8, !dbg !30
  %66 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !30
  %67 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !31
  %68 = bitcast %struct.Data* %67 to i32*, !dbg !31
  %69 = load i32, i32* %68, align 4, !dbg !31
  store i32 %69, i32* %id, align 4, !dbg !31
  %70 = load i32, i32* %id, align 4, !dbg !31
  %71 = load i32, i32* %id, align 4, !dbg !32
  %72 = icmp ne i32 %71, 30, !dbg !32
  br i1 %72, label %then10, label %if.end12, !dbg !32

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !33
  %73 = load i32, i32* %err, align 4, !dbg !33
  br label %if.end12, !dbg !33

if.end12:                                         ; preds = %if.end9, %then10
  %74 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !34
  %75 = getelementptr %struct.Data, %struct.Data* %74, i32 1, !dbg !34
  store %struct.Data* %75, %struct.Data** %p, align 8, !dbg !34
  %76 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !35
  %77 = bitcast %struct.Data* %76 to i32*, !dbg !35
  %78 = load i32, i32* %77, align 4, !dbg !35
  store i32 %78, i32* %id, align 4, !dbg !35
  %79 = load i32, i32* %id, align 4, !dbg !35
  %80 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !36
  %81 = getelementptr %struct.Data, %struct.Data* %80, i32 0, i32 1, !dbg !36
  %82 = load i32, i32* %81, align 4, !dbg !36
  store i32 %82, i32* %val, align 4, !dbg !36
  %83 = load i32, i32* %val, align 4, !dbg !36
  %84 = load i32, i32* %id, align 4, !dbg !37
  %85 = icmp ne i32 %84, 40, !dbg !37
  br i1 %85, label %then13, label %if.end15, !dbg !37

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !38
  %86 = load i32, i32* %err, align 4, !dbg !38
  br label %if.end15, !dbg !38

if.end15:                                         ; preds = %if.end12, %then13
  %87 = load i32, i32* %val, align 4, !dbg !39
  %88 = icmp ne i32 %87, 48, !dbg !39
  br i1 %88, label %then16, label %if.end18, !dbg !39

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !40
  %89 = load i32, i32* %err, align 4, !dbg !40
  br label %if.end18, !dbg !40

if.end18:                                         ; preds = %if.end15, %then16
  %90 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !41
  %91 = getelementptr %struct.Data, %struct.Data* %90, i32 3, !dbg !41
  store %struct.Data* %91, %struct.Data** %p, align 8, !dbg !41
  %92 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !41
  %93 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !42
  %94 = getelementptr %struct.Data, %struct.Data* %93, i32 -1, !dbg !42
  store %struct.Data* %94, %struct.Data** %p, align 8, !dbg !42
  %95 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !42
  %96 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !43
  %97 = bitcast %struct.Data* %96 to i32*, !dbg !43
  %98 = load i32, i32* %97, align 4, !dbg !43
  store i32 %98, i32* %id, align 4, !dbg !43
  %99 = load i32, i32* %id, align 4, !dbg !43
  %100 = load i32, i32* %id, align 4, !dbg !44
  %101 = icmp ne i32 %100, 30, !dbg !44
  br i1 %101, label %then19, label %if.end21, !dbg !44

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !45
  %102 = load i32, i32* %err, align 4, !dbg !45
  br label %if.end21, !dbg !45

if.end21:                                         ; preds = %if.end18, %then19
  %103 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !46
  %104 = getelementptr %struct.Data, %struct.Data* %103, i32 -1, !dbg !46
  store %struct.Data* %104, %struct.Data** %p, align 8, !dbg !46
  %105 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !46
  %106 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !47
  %107 = bitcast %struct.Data* %106 to i32*, !dbg !47
  %108 = load i32, i32* %107, align 4, !dbg !47
  store i32 %108, i32* %id, align 4, !dbg !47
  %109 = load i32, i32* %id, align 4, !dbg !47
  %110 = load i32, i32* %id, align 4, !dbg !48
  %111 = icmp ne i32 %110, 20, !dbg !48
  br i1 %111, label %then22, label %if.end24, !dbg !48

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !49
  %112 = load i32, i32* %err, align 4, !dbg !49
  br label %if.end24, !dbg !49

if.end24:                                         ; preds = %if.end21, %then22
  %113 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !50
  %114 = getelementptr %struct.Data, %struct.Data* %113, i32 -1, !dbg !50
  store %struct.Data* %114, %struct.Data** %p, align 8, !dbg !50
  %115 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !51
  %116 = bitcast %struct.Data* %115 to i32*, !dbg !51
  %117 = load i32, i32* %116, align 4, !dbg !51
  store i32 %117, i32* %id, align 4, !dbg !51
  %118 = load i32, i32* %id, align 4, !dbg !51
  %119 = load i32, i32* %id, align 4, !dbg !52
  %120 = icmp ne i32 %119, 10, !dbg !52
  br i1 %120, label %then25, label %if.end27, !dbg !52

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !53
  %121 = load i32, i32* %err, align 4, !dbg !53
  br label %if.end27, !dbg !53

if.end27:                                         ; preds = %if.end24, %then25
  %122 = load i32, i32* %err, align 4, !dbg !54
  %123 = icmp eq i32 %122, 0, !dbg !54
  %. = select i1 %123, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @1, i32 0, i32 0), !dbg !55
  %124 = call i32 (i8*, ...) @printf(i8* %.), !dbg !55
  %125 = load i32, i32* %err, align 4, !dbg !56
  ret i32 %125, !dbg !56
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "29.struct_pointer_move.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 8, type: !3, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 9, column: 3, scope: !2)
!8 = !DILocation(line: 14, column: 3, scope: !2)
!9 = !DILocation(line: 15, column: 3, scope: !2)
!10 = !DILocation(line: 16, column: 3, scope: !2)
!11 = !DILocation(line: 17, column: 3, scope: !2)
!12 = !DILocation(line: 18, column: 3, scope: !2)
!13 = !DILocation(line: 19, column: 3, scope: !2)
!14 = !DILocation(line: 20, column: 3, scope: !2)
!15 = !DILocation(line: 21, column: 3, scope: !2)
!16 = !DILocation(line: 23, column: 3, scope: !2)
!17 = !DILocation(line: 24, column: 3, scope: !2)
!18 = !DILocation(line: 25, column: 3, scope: !2)
!19 = !DILocation(line: 26, column: 3, scope: !2)
!20 = !DILocation(line: 26, column: 17, scope: !2)
!21 = !DILocation(line: 27, column: 3, scope: !2)
!22 = !DILocation(line: 27, column: 18, scope: !2)
!23 = !DILocation(line: 28, column: 3, scope: !2)
!24 = !DILocation(line: 29, column: 3, scope: !2)
!25 = !DILocation(line: 30, column: 3, scope: !2)
!26 = !DILocation(line: 31, column: 3, scope: !2)
!27 = !DILocation(line: 31, column: 17, scope: !2)
!28 = !DILocation(line: 32, column: 3, scope: !2)
!29 = !DILocation(line: 32, column: 18, scope: !2)
!30 = !DILocation(line: 33, column: 3, scope: !2)
!31 = !DILocation(line: 34, column: 3, scope: !2)
!32 = !DILocation(line: 35, column: 3, scope: !2)
!33 = !DILocation(line: 35, column: 17, scope: !2)
!34 = !DILocation(line: 36, column: 3, scope: !2)
!35 = !DILocation(line: 37, column: 3, scope: !2)
!36 = !DILocation(line: 38, column: 3, scope: !2)
!37 = !DILocation(line: 39, column: 3, scope: !2)
!38 = !DILocation(line: 39, column: 17, scope: !2)
!39 = !DILocation(line: 40, column: 3, scope: !2)
!40 = !DILocation(line: 40, column: 18, scope: !2)
!41 = !DILocation(line: 42, column: 3, scope: !2)
!42 = !DILocation(line: 43, column: 3, scope: !2)
!43 = !DILocation(line: 44, column: 3, scope: !2)
!44 = !DILocation(line: 45, column: 3, scope: !2)
!45 = !DILocation(line: 45, column: 17, scope: !2)
!46 = !DILocation(line: 46, column: 3, scope: !2)
!47 = !DILocation(line: 47, column: 3, scope: !2)
!48 = !DILocation(line: 48, column: 3, scope: !2)
!49 = !DILocation(line: 48, column: 17, scope: !2)
!50 = !DILocation(line: 49, column: 3, scope: !2)
!51 = !DILocation(line: 50, column: 3, scope: !2)
!52 = !DILocation(line: 51, column: 3, scope: !2)
!53 = !DILocation(line: 51, column: 17, scope: !2)
!54 = !DILocation(line: 53, column: 3, scope: !2)
!55 = !DILocation(line: 0, scope: !2)
!56 = !DILocation(line: 58, column: 3, scope: !2)
