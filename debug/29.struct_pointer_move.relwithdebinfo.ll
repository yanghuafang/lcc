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
  call void @llvm.dbg.declare(metadata %struct.Data** %p, metadata !7, metadata !DIExpression()), !dbg !13
  %val = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %val, metadata !14, metadata !DIExpression()), !dbg !15
  %id = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %id, metadata !16, metadata !DIExpression()), !dbg !17
  %data = alloca [4 x %struct.Data], align 8
  call void @llvm.dbg.declare(metadata [4 x %struct.Data]* %data, metadata !18, metadata !DIExpression()), !dbg !22
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 0, i32* %err, align 4, !dbg !24
  %0 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !25
  %1 = bitcast %struct.Data* %0 to %struct.Data*, !dbg !25
  %2 = bitcast %struct.Data* %1 to i32*, !dbg !25
  store i32 10, i32* %2, align 4, !dbg !25
  %3 = load i32, i32* %2, align 4, !dbg !25
  %4 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !26
  %5 = bitcast %struct.Data* %4 to %struct.Data*, !dbg !26
  %6 = getelementptr %struct.Data, %struct.Data* %5, i32 0, i32 1, !dbg !26
  store i32 12, i32* %6, align 4, !dbg !26
  %7 = load i32, i32* %6, align 4, !dbg !26
  %8 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !27
  %9 = getelementptr %struct.Data, %struct.Data* %8, i32 1, !dbg !27
  %10 = bitcast %struct.Data* %9 to i32*, !dbg !27
  store i32 20, i32* %10, align 4, !dbg !27
  %11 = load i32, i32* %10, align 4, !dbg !27
  %12 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !28
  %13 = getelementptr %struct.Data, %struct.Data* %12, i32 1, !dbg !28
  %14 = getelementptr %struct.Data, %struct.Data* %13, i32 0, i32 1, !dbg !28
  store i32 24, i32* %14, align 4, !dbg !28
  %15 = load i32, i32* %14, align 4, !dbg !28
  %16 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !29
  %17 = getelementptr %struct.Data, %struct.Data* %16, i32 2, !dbg !29
  %18 = bitcast %struct.Data* %17 to i32*, !dbg !29
  store i32 30, i32* %18, align 4, !dbg !29
  %19 = load i32, i32* %18, align 4, !dbg !29
  %20 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !30
  %21 = getelementptr %struct.Data, %struct.Data* %20, i32 2, !dbg !30
  %22 = getelementptr %struct.Data, %struct.Data* %21, i32 0, i32 1, !dbg !30
  store i32 36, i32* %22, align 4, !dbg !30
  %23 = load i32, i32* %22, align 4, !dbg !30
  %24 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !31
  %25 = getelementptr %struct.Data, %struct.Data* %24, i32 3, !dbg !31
  %26 = bitcast %struct.Data* %25 to i32*, !dbg !31
  store i32 40, i32* %26, align 4, !dbg !31
  %27 = load i32, i32* %26, align 4, !dbg !31
  %28 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !32
  %29 = getelementptr %struct.Data, %struct.Data* %28, i32 3, !dbg !32
  %30 = getelementptr %struct.Data, %struct.Data* %29, i32 0, i32 1, !dbg !32
  store i32 48, i32* %30, align 4, !dbg !32
  %31 = load i32, i32* %30, align 4, !dbg !32
  %32 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !13
  store %struct.Data* %32, %struct.Data** %p, align 8, !dbg !13
  %33 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !33
  %34 = bitcast %struct.Data* %33 to i32*, !dbg !33
  %35 = load i32, i32* %34, align 4, !dbg !33
  store i32 %35, i32* %id, align 4, !dbg !33
  %36 = load i32, i32* %id, align 4, !dbg !33
  %37 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !34
  %38 = getelementptr %struct.Data, %struct.Data* %37, i32 0, i32 1, !dbg !34
  %39 = load i32, i32* %38, align 4, !dbg !34
  store i32 %39, i32* %val, align 4, !dbg !34
  %40 = load i32, i32* %val, align 4, !dbg !34
  %41 = load i32, i32* %id, align 4, !dbg !35
  %42 = icmp ne i32 %41, 10, !dbg !35
  br i1 %42, label %then, label %if.end, !dbg !35

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !36
  %43 = load i32, i32* %err, align 4, !dbg !36
  br label %if.end, !dbg !36

if.end:                                           ; preds = %entry, %then
  %44 = load i32, i32* %val, align 4, !dbg !37
  %45 = icmp ne i32 %44, 12, !dbg !37
  br i1 %45, label %then1, label %if.end3, !dbg !37

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !38
  %46 = load i32, i32* %err, align 4, !dbg !38
  br label %if.end3, !dbg !38

if.end3:                                          ; preds = %if.end, %then1
  %47 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !39
  %48 = getelementptr %struct.Data, %struct.Data* %47, i32 1, !dbg !39
  store %struct.Data* %48, %struct.Data** %p, align 8, !dbg !39
  %49 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !39
  %50 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !40
  %51 = bitcast %struct.Data* %50 to i32*, !dbg !40
  %52 = load i32, i32* %51, align 4, !dbg !40
  store i32 %52, i32* %id, align 4, !dbg !40
  %53 = load i32, i32* %id, align 4, !dbg !40
  %54 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !41
  %55 = getelementptr %struct.Data, %struct.Data* %54, i32 0, i32 1, !dbg !41
  %56 = load i32, i32* %55, align 4, !dbg !41
  store i32 %56, i32* %val, align 4, !dbg !41
  %57 = load i32, i32* %val, align 4, !dbg !41
  %58 = load i32, i32* %id, align 4, !dbg !42
  %59 = icmp ne i32 %58, 20, !dbg !42
  br i1 %59, label %then4, label %if.end6, !dbg !42

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !43
  %60 = load i32, i32* %err, align 4, !dbg !43
  br label %if.end6, !dbg !43

if.end6:                                          ; preds = %if.end3, %then4
  %61 = load i32, i32* %val, align 4, !dbg !44
  %62 = icmp ne i32 %61, 24, !dbg !44
  br i1 %62, label %then7, label %if.end9, !dbg !44

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !45
  %63 = load i32, i32* %err, align 4, !dbg !45
  br label %if.end9, !dbg !45

if.end9:                                          ; preds = %if.end6, %then7
  %64 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !46
  %65 = getelementptr %struct.Data, %struct.Data* %64, i32 1, !dbg !46
  store %struct.Data* %65, %struct.Data** %p, align 8, !dbg !46
  %66 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !46
  %67 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !47
  %68 = bitcast %struct.Data* %67 to i32*, !dbg !47
  %69 = load i32, i32* %68, align 4, !dbg !47
  store i32 %69, i32* %id, align 4, !dbg !47
  %70 = load i32, i32* %id, align 4, !dbg !47
  %71 = load i32, i32* %id, align 4, !dbg !48
  %72 = icmp ne i32 %71, 30, !dbg !48
  br i1 %72, label %then10, label %if.end12, !dbg !48

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !49
  %73 = load i32, i32* %err, align 4, !dbg !49
  br label %if.end12, !dbg !49

if.end12:                                         ; preds = %if.end9, %then10
  %74 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !50
  %75 = getelementptr %struct.Data, %struct.Data* %74, i32 1, !dbg !50
  store %struct.Data* %75, %struct.Data** %p, align 8, !dbg !50
  %76 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !51
  %77 = bitcast %struct.Data* %76 to i32*, !dbg !51
  %78 = load i32, i32* %77, align 4, !dbg !51
  store i32 %78, i32* %id, align 4, !dbg !51
  %79 = load i32, i32* %id, align 4, !dbg !51
  %80 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !52
  %81 = getelementptr %struct.Data, %struct.Data* %80, i32 0, i32 1, !dbg !52
  %82 = load i32, i32* %81, align 4, !dbg !52
  store i32 %82, i32* %val, align 4, !dbg !52
  %83 = load i32, i32* %val, align 4, !dbg !52
  %84 = load i32, i32* %id, align 4, !dbg !53
  %85 = icmp ne i32 %84, 40, !dbg !53
  br i1 %85, label %then13, label %if.end15, !dbg !53

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !54
  %86 = load i32, i32* %err, align 4, !dbg !54
  br label %if.end15, !dbg !54

if.end15:                                         ; preds = %if.end12, %then13
  %87 = load i32, i32* %val, align 4, !dbg !55
  %88 = icmp ne i32 %87, 48, !dbg !55
  br i1 %88, label %then16, label %if.end18, !dbg !55

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !56
  %89 = load i32, i32* %err, align 4, !dbg !56
  br label %if.end18, !dbg !56

if.end18:                                         ; preds = %if.end15, %then16
  %90 = bitcast [4 x %struct.Data]* %data to %struct.Data*, !dbg !57
  %91 = getelementptr %struct.Data, %struct.Data* %90, i32 3, !dbg !57
  store %struct.Data* %91, %struct.Data** %p, align 8, !dbg !57
  %92 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !57
  %93 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !58
  %94 = getelementptr %struct.Data, %struct.Data* %93, i32 -1, !dbg !58
  store %struct.Data* %94, %struct.Data** %p, align 8, !dbg !58
  %95 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !58
  %96 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !59
  %97 = bitcast %struct.Data* %96 to i32*, !dbg !59
  %98 = load i32, i32* %97, align 4, !dbg !59
  store i32 %98, i32* %id, align 4, !dbg !59
  %99 = load i32, i32* %id, align 4, !dbg !59
  %100 = load i32, i32* %id, align 4, !dbg !60
  %101 = icmp ne i32 %100, 30, !dbg !60
  br i1 %101, label %then19, label %if.end21, !dbg !60

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !61
  %102 = load i32, i32* %err, align 4, !dbg !61
  br label %if.end21, !dbg !61

if.end21:                                         ; preds = %if.end18, %then19
  %103 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !62
  %104 = getelementptr %struct.Data, %struct.Data* %103, i32 -1, !dbg !62
  store %struct.Data* %104, %struct.Data** %p, align 8, !dbg !62
  %105 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !62
  %106 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !63
  %107 = bitcast %struct.Data* %106 to i32*, !dbg !63
  %108 = load i32, i32* %107, align 4, !dbg !63
  store i32 %108, i32* %id, align 4, !dbg !63
  %109 = load i32, i32* %id, align 4, !dbg !63
  %110 = load i32, i32* %id, align 4, !dbg !64
  %111 = icmp ne i32 %110, 20, !dbg !64
  br i1 %111, label %then22, label %if.end24, !dbg !64

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !65
  %112 = load i32, i32* %err, align 4, !dbg !65
  br label %if.end24, !dbg !65

if.end24:                                         ; preds = %if.end21, %then22
  %113 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !66
  %114 = getelementptr %struct.Data, %struct.Data* %113, i32 -1, !dbg !66
  store %struct.Data* %114, %struct.Data** %p, align 8, !dbg !66
  %115 = load %struct.Data*, %struct.Data** %p, align 8, !dbg !67
  %116 = bitcast %struct.Data* %115 to i32*, !dbg !67
  %117 = load i32, i32* %116, align 4, !dbg !67
  store i32 %117, i32* %id, align 4, !dbg !67
  %118 = load i32, i32* %id, align 4, !dbg !67
  %119 = load i32, i32* %id, align 4, !dbg !68
  %120 = icmp ne i32 %119, 10, !dbg !68
  br i1 %120, label %then25, label %if.end27, !dbg !68

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !69
  %121 = load i32, i32* %err, align 4, !dbg !69
  br label %if.end27, !dbg !69

if.end27:                                         ; preds = %if.end24, %then25
  %122 = load i32, i32* %err, align 4, !dbg !70
  %123 = icmp eq i32 %122, 0, !dbg !70
  %. = select i1 %123, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @1, i32 0, i32 0), !dbg !71
  %124 = call i32 (i8*, ...) @printf(i8* %.), !dbg !71
  %125 = load i32, i32* %err, align 4, !dbg !72
  ret i32 %125, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "29.struct_pointer_move.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 8, type: !3, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "p", scope: !2, file: !1, line: 23, type: !8)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DICompositeType(tag: DW_TAG_structure_type, name: "Data", file: !1, size: 64, align: 32, elements: !10)
!10 = !{!11, !12}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "id", file: !1, baseType: !5, size: 32, align: 32)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "data", file: !1, baseType: !5, size: 32, align: 32, offset: 32)
!13 = !DILocation(line: 23, column: 3, scope: !2)
!14 = !DILocalVariable(name: "val", scope: !2, file: !1, line: 12, type: !5)
!15 = !DILocation(line: 12, column: 3, scope: !2)
!16 = !DILocalVariable(name: "id", scope: !2, file: !1, line: 11, type: !5)
!17 = !DILocation(line: 11, column: 3, scope: !2)
!18 = !DILocalVariable(name: "data", scope: !2, file: !1, line: 10, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 256, align: 32, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 4, lowerBound: 0)
!22 = !DILocation(line: 10, column: 3, scope: !2)
!23 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 9, type: !5)
!24 = !DILocation(line: 9, column: 3, scope: !2)
!25 = !DILocation(line: 14, column: 3, scope: !2)
!26 = !DILocation(line: 15, column: 3, scope: !2)
!27 = !DILocation(line: 16, column: 3, scope: !2)
!28 = !DILocation(line: 17, column: 3, scope: !2)
!29 = !DILocation(line: 18, column: 3, scope: !2)
!30 = !DILocation(line: 19, column: 3, scope: !2)
!31 = !DILocation(line: 20, column: 3, scope: !2)
!32 = !DILocation(line: 21, column: 3, scope: !2)
!33 = !DILocation(line: 24, column: 3, scope: !2)
!34 = !DILocation(line: 25, column: 3, scope: !2)
!35 = !DILocation(line: 26, column: 3, scope: !2)
!36 = !DILocation(line: 26, column: 17, scope: !2)
!37 = !DILocation(line: 27, column: 3, scope: !2)
!38 = !DILocation(line: 27, column: 18, scope: !2)
!39 = !DILocation(line: 28, column: 3, scope: !2)
!40 = !DILocation(line: 29, column: 3, scope: !2)
!41 = !DILocation(line: 30, column: 3, scope: !2)
!42 = !DILocation(line: 31, column: 3, scope: !2)
!43 = !DILocation(line: 31, column: 17, scope: !2)
!44 = !DILocation(line: 32, column: 3, scope: !2)
!45 = !DILocation(line: 32, column: 18, scope: !2)
!46 = !DILocation(line: 33, column: 3, scope: !2)
!47 = !DILocation(line: 34, column: 3, scope: !2)
!48 = !DILocation(line: 35, column: 3, scope: !2)
!49 = !DILocation(line: 35, column: 17, scope: !2)
!50 = !DILocation(line: 36, column: 3, scope: !2)
!51 = !DILocation(line: 37, column: 3, scope: !2)
!52 = !DILocation(line: 38, column: 3, scope: !2)
!53 = !DILocation(line: 39, column: 3, scope: !2)
!54 = !DILocation(line: 39, column: 17, scope: !2)
!55 = !DILocation(line: 40, column: 3, scope: !2)
!56 = !DILocation(line: 40, column: 18, scope: !2)
!57 = !DILocation(line: 42, column: 3, scope: !2)
!58 = !DILocation(line: 43, column: 3, scope: !2)
!59 = !DILocation(line: 44, column: 3, scope: !2)
!60 = !DILocation(line: 45, column: 3, scope: !2)
!61 = !DILocation(line: 45, column: 17, scope: !2)
!62 = !DILocation(line: 46, column: 3, scope: !2)
!63 = !DILocation(line: 47, column: 3, scope: !2)
!64 = !DILocation(line: 48, column: 3, scope: !2)
!65 = !DILocation(line: 48, column: 17, scope: !2)
!66 = !DILocation(line: 49, column: 3, scope: !2)
!67 = !DILocation(line: 50, column: 3, scope: !2)
!68 = !DILocation(line: 51, column: 3, scope: !2)
!69 = !DILocation(line: 51, column: 17, scope: !2)
!70 = !DILocation(line: 53, column: 3, scope: !2)
!71 = !DILocation(line: 0, scope: !2)
!72 = !DILocation(line: 58, column: 3, scope: !2)
