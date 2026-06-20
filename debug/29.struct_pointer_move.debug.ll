; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

%struct.Data = type { i32, i32 }

@0 = private unnamed_addr constant [31 x i8] c"29.struct_pointer_move.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"29.struct_pointer_move.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %p = alloca ptr, align 8
    #dbg_declare(ptr %p, !7, !DIExpression(), !10)
  %val = alloca i32, align 4
    #dbg_declare(ptr %val, !11, !DIExpression(), !12)
  %id = alloca i32, align 4
    #dbg_declare(ptr %id, !13, !DIExpression(), !14)
  %data = alloca [4 x %struct.Data], align 8
    #dbg_declare(ptr %data, !15, !DIExpression(), !19)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !20, !DIExpression(), !21)
  store i32 0, ptr %err, align 4, !dbg !21
  %0 = bitcast ptr %data to ptr, !dbg !22
  %1 = bitcast ptr %0 to ptr, !dbg !22
  store i32 10, ptr %1, align 4, !dbg !22
  %2 = load i32, ptr %1, align 4, !dbg !22
  %3 = bitcast ptr %data to ptr, !dbg !23
  %4 = getelementptr %struct.Data, ptr %3, i32 0, i32 1, !dbg !23
  store i32 12, ptr %4, align 4, !dbg !23
  %5 = load i32, ptr %4, align 4, !dbg !23
  %6 = getelementptr %struct.Data, ptr %data, i32 1, !dbg !24
  %7 = bitcast ptr %6 to ptr, !dbg !24
  store i32 20, ptr %7, align 4, !dbg !24
  %8 = load i32, ptr %7, align 4, !dbg !24
  %9 = getelementptr %struct.Data, ptr %data, i32 1, !dbg !25
  %10 = getelementptr %struct.Data, ptr %9, i32 0, i32 1, !dbg !25
  store i32 24, ptr %10, align 4, !dbg !25
  %11 = load i32, ptr %10, align 4, !dbg !25
  %12 = getelementptr %struct.Data, ptr %data, i32 2, !dbg !26
  %13 = bitcast ptr %12 to ptr, !dbg !26
  store i32 30, ptr %13, align 4, !dbg !26
  %14 = load i32, ptr %13, align 4, !dbg !26
  %15 = getelementptr %struct.Data, ptr %data, i32 2, !dbg !27
  %16 = getelementptr %struct.Data, ptr %15, i32 0, i32 1, !dbg !27
  store i32 36, ptr %16, align 4, !dbg !27
  %17 = load i32, ptr %16, align 4, !dbg !27
  %18 = getelementptr %struct.Data, ptr %data, i32 3, !dbg !28
  %19 = bitcast ptr %18 to ptr, !dbg !28
  store i32 40, ptr %19, align 4, !dbg !28
  %20 = load i32, ptr %19, align 4, !dbg !28
  %21 = getelementptr %struct.Data, ptr %data, i32 3, !dbg !29
  %22 = getelementptr %struct.Data, ptr %21, i32 0, i32 1, !dbg !29
  store i32 48, ptr %22, align 4, !dbg !29
  %23 = load i32, ptr %22, align 4, !dbg !29
  store ptr %data, ptr %p, align 8, !dbg !10
  %24 = load ptr, ptr %p, align 8, !dbg !30
  %25 = bitcast ptr %24 to ptr, !dbg !30
  %26 = load i32, ptr %25, align 4, !dbg !30
  store i32 %26, ptr %id, align 4, !dbg !30
  %27 = load i32, ptr %id, align 4, !dbg !30
  %28 = load ptr, ptr %p, align 8, !dbg !31
  %29 = getelementptr %struct.Data, ptr %28, i32 0, i32 1, !dbg !31
  %30 = load i32, ptr %29, align 4, !dbg !31
  store i32 %30, ptr %val, align 4, !dbg !31
  %31 = load i32, ptr %val, align 4, !dbg !31
  %32 = load i32, ptr %id, align 4, !dbg !32
  %33 = icmp ne i32 %32, 10, !dbg !32
  br i1 %33, label %then, label %if.end, !dbg !32

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !33
  %34 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end, !dbg !33

if.end:                                           ; preds = %entry, %then
  %35 = load i32, ptr %val, align 4, !dbg !34
  %36 = icmp ne i32 %35, 12, !dbg !34
  br i1 %36, label %then1, label %if.end3, !dbg !34

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !35
  %37 = load i32, ptr %err, align 4, !dbg !35
  br label %if.end3, !dbg !35

if.end3:                                          ; preds = %if.end, %then1
  %38 = load ptr, ptr %p, align 8, !dbg !36
  %39 = getelementptr %struct.Data, ptr %38, i32 1, !dbg !36
  store ptr %39, ptr %p, align 8, !dbg !36
  %40 = load ptr, ptr %p, align 8, !dbg !36
  %41 = load ptr, ptr %p, align 8, !dbg !37
  %42 = bitcast ptr %41 to ptr, !dbg !37
  %43 = load i32, ptr %42, align 4, !dbg !37
  store i32 %43, ptr %id, align 4, !dbg !37
  %44 = load i32, ptr %id, align 4, !dbg !37
  %45 = load ptr, ptr %p, align 8, !dbg !38
  %46 = getelementptr %struct.Data, ptr %45, i32 0, i32 1, !dbg !38
  %47 = load i32, ptr %46, align 4, !dbg !38
  store i32 %47, ptr %val, align 4, !dbg !38
  %48 = load i32, ptr %val, align 4, !dbg !38
  %49 = load i32, ptr %id, align 4, !dbg !39
  %50 = icmp ne i32 %49, 20, !dbg !39
  br i1 %50, label %then4, label %if.end6, !dbg !39

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !40
  %51 = load i32, ptr %err, align 4, !dbg !40
  br label %if.end6, !dbg !40

if.end6:                                          ; preds = %if.end3, %then4
  %52 = load i32, ptr %val, align 4, !dbg !41
  %53 = icmp ne i32 %52, 24, !dbg !41
  br i1 %53, label %then7, label %if.end9, !dbg !41

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !42
  %54 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end9, !dbg !42

if.end9:                                          ; preds = %if.end6, %then7
  %55 = load ptr, ptr %p, align 8, !dbg !43
  %56 = getelementptr %struct.Data, ptr %55, i64 1, !dbg !43
  store ptr %56, ptr %p, align 8, !dbg !43
  %57 = load ptr, ptr %p, align 8, !dbg !43
  %58 = load ptr, ptr %p, align 8, !dbg !44
  %59 = bitcast ptr %58 to ptr, !dbg !44
  %60 = load i32, ptr %59, align 4, !dbg !44
  store i32 %60, ptr %id, align 4, !dbg !44
  %61 = load i32, ptr %id, align 4, !dbg !44
  %62 = load i32, ptr %id, align 4, !dbg !45
  %63 = icmp ne i32 %62, 30, !dbg !45
  br i1 %63, label %then10, label %if.end12, !dbg !45

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !46
  %64 = load i32, ptr %err, align 4, !dbg !46
  br label %if.end12, !dbg !46

if.end12:                                         ; preds = %if.end9, %then10
  %65 = load ptr, ptr %p, align 8, !dbg !47
  %66 = getelementptr %struct.Data, ptr %65, i64 1, !dbg !47
  store ptr %66, ptr %p, align 8, !dbg !47
  %67 = load ptr, ptr %p, align 8, !dbg !48
  %68 = bitcast ptr %67 to ptr, !dbg !48
  %69 = load i32, ptr %68, align 4, !dbg !48
  store i32 %69, ptr %id, align 4, !dbg !48
  %70 = load i32, ptr %id, align 4, !dbg !48
  %71 = load ptr, ptr %p, align 8, !dbg !49
  %72 = getelementptr %struct.Data, ptr %71, i32 0, i32 1, !dbg !49
  %73 = load i32, ptr %72, align 4, !dbg !49
  store i32 %73, ptr %val, align 4, !dbg !49
  %74 = load i32, ptr %val, align 4, !dbg !49
  %75 = load i32, ptr %id, align 4, !dbg !50
  %76 = icmp ne i32 %75, 40, !dbg !50
  br i1 %76, label %then13, label %if.end15, !dbg !50

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !51
  %77 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end15, !dbg !51

if.end15:                                         ; preds = %if.end12, %then13
  %78 = load i32, ptr %val, align 4, !dbg !52
  %79 = icmp ne i32 %78, 48, !dbg !52
  br i1 %79, label %then16, label %if.end18, !dbg !52

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !53
  %80 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end18, !dbg !53

if.end18:                                         ; preds = %if.end15, %then16
  %81 = getelementptr %struct.Data, ptr %data, i32 3, !dbg !54
  store ptr %81, ptr %p, align 8, !dbg !54
  %82 = load ptr, ptr %p, align 8, !dbg !54
  %83 = load ptr, ptr %p, align 8, !dbg !55
  %84 = getelementptr %struct.Data, ptr %83, i32 -1, !dbg !55
  store ptr %84, ptr %p, align 8, !dbg !55
  %85 = load ptr, ptr %p, align 8, !dbg !55
  %86 = load ptr, ptr %p, align 8, !dbg !56
  %87 = bitcast ptr %86 to ptr, !dbg !56
  %88 = load i32, ptr %87, align 4, !dbg !56
  store i32 %88, ptr %id, align 4, !dbg !56
  %89 = load i32, ptr %id, align 4, !dbg !56
  %90 = load i32, ptr %id, align 4, !dbg !57
  %91 = icmp ne i32 %90, 30, !dbg !57
  br i1 %91, label %then19, label %if.end21, !dbg !57

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !58
  %92 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end21, !dbg !58

if.end21:                                         ; preds = %if.end18, %then19
  %93 = load ptr, ptr %p, align 8, !dbg !59
  %94 = getelementptr %struct.Data, ptr %93, i64 -1, !dbg !59
  store ptr %94, ptr %p, align 8, !dbg !59
  %95 = load ptr, ptr %p, align 8, !dbg !59
  %96 = load ptr, ptr %p, align 8, !dbg !60
  %97 = bitcast ptr %96 to ptr, !dbg !60
  %98 = load i32, ptr %97, align 4, !dbg !60
  store i32 %98, ptr %id, align 4, !dbg !60
  %99 = load i32, ptr %id, align 4, !dbg !60
  %100 = load i32, ptr %id, align 4, !dbg !61
  %101 = icmp ne i32 %100, 20, !dbg !61
  br i1 %101, label %then22, label %if.end24, !dbg !61

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !62
  %102 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end24, !dbg !62

if.end24:                                         ; preds = %if.end21, %then22
  %103 = load ptr, ptr %p, align 8, !dbg !63
  %104 = getelementptr %struct.Data, ptr %103, i64 -1, !dbg !63
  store ptr %104, ptr %p, align 8, !dbg !63
  %105 = load ptr, ptr %p, align 8, !dbg !64
  %106 = bitcast ptr %105 to ptr, !dbg !64
  %107 = load i32, ptr %106, align 4, !dbg !64
  store i32 %107, ptr %id, align 4, !dbg !64
  %108 = load i32, ptr %id, align 4, !dbg !64
  %109 = load i32, ptr %id, align 4, !dbg !65
  %110 = icmp ne i32 %109, 10, !dbg !65
  br i1 %110, label %then25, label %if.end27, !dbg !65

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !66
  %111 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end27, !dbg !66

if.end27:                                         ; preds = %if.end24, %then25
  %112 = load i32, ptr %err, align 4, !dbg !67
  %113 = icmp eq i32 %112, 0, !dbg !67
  %. = select i1 %113, ptr @0, ptr @1, !dbg !68
  %114 = call i32 (ptr, ...) @printf(ptr %.), !dbg !68
  %115 = load i32, ptr %err, align 4, !dbg !69
  ret i32 %115, !dbg !69
}

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
!9 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!10 = !DILocation(line: 23, column: 3, scope: !2)
!11 = !DILocalVariable(name: "val", scope: !2, file: !1, line: 12, type: !5)
!12 = !DILocation(line: 12, column: 3, scope: !2)
!13 = !DILocalVariable(name: "id", scope: !2, file: !1, line: 11, type: !5)
!14 = !DILocation(line: 11, column: 3, scope: !2)
!15 = !DILocalVariable(name: "data", scope: !2, file: !1, line: 10, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 256, align: 32, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 4, lowerBound: 0)
!19 = !DILocation(line: 10, column: 3, scope: !2)
!20 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 9, type: !5)
!21 = !DILocation(line: 9, column: 3, scope: !2)
!22 = !DILocation(line: 14, column: 3, scope: !2)
!23 = !DILocation(line: 15, column: 3, scope: !2)
!24 = !DILocation(line: 16, column: 3, scope: !2)
!25 = !DILocation(line: 17, column: 3, scope: !2)
!26 = !DILocation(line: 18, column: 3, scope: !2)
!27 = !DILocation(line: 19, column: 3, scope: !2)
!28 = !DILocation(line: 20, column: 3, scope: !2)
!29 = !DILocation(line: 21, column: 3, scope: !2)
!30 = !DILocation(line: 24, column: 3, scope: !2)
!31 = !DILocation(line: 25, column: 3, scope: !2)
!32 = !DILocation(line: 26, column: 3, scope: !2)
!33 = !DILocation(line: 26, column: 17, scope: !2)
!34 = !DILocation(line: 27, column: 3, scope: !2)
!35 = !DILocation(line: 27, column: 18, scope: !2)
!36 = !DILocation(line: 28, column: 3, scope: !2)
!37 = !DILocation(line: 29, column: 3, scope: !2)
!38 = !DILocation(line: 30, column: 3, scope: !2)
!39 = !DILocation(line: 31, column: 3, scope: !2)
!40 = !DILocation(line: 31, column: 17, scope: !2)
!41 = !DILocation(line: 32, column: 3, scope: !2)
!42 = !DILocation(line: 32, column: 18, scope: !2)
!43 = !DILocation(line: 33, column: 3, scope: !2)
!44 = !DILocation(line: 34, column: 3, scope: !2)
!45 = !DILocation(line: 35, column: 3, scope: !2)
!46 = !DILocation(line: 35, column: 17, scope: !2)
!47 = !DILocation(line: 36, column: 3, scope: !2)
!48 = !DILocation(line: 37, column: 3, scope: !2)
!49 = !DILocation(line: 38, column: 3, scope: !2)
!50 = !DILocation(line: 39, column: 3, scope: !2)
!51 = !DILocation(line: 39, column: 17, scope: !2)
!52 = !DILocation(line: 40, column: 3, scope: !2)
!53 = !DILocation(line: 40, column: 18, scope: !2)
!54 = !DILocation(line: 42, column: 3, scope: !2)
!55 = !DILocation(line: 43, column: 3, scope: !2)
!56 = !DILocation(line: 44, column: 3, scope: !2)
!57 = !DILocation(line: 45, column: 3, scope: !2)
!58 = !DILocation(line: 45, column: 17, scope: !2)
!59 = !DILocation(line: 46, column: 3, scope: !2)
!60 = !DILocation(line: 47, column: 3, scope: !2)
!61 = !DILocation(line: 48, column: 3, scope: !2)
!62 = !DILocation(line: 48, column: 17, scope: !2)
!63 = !DILocation(line: 49, column: 3, scope: !2)
!64 = !DILocation(line: 50, column: 3, scope: !2)
!65 = !DILocation(line: 51, column: 3, scope: !2)
!66 = !DILocation(line: 51, column: 17, scope: !2)
!67 = !DILocation(line: 53, column: 3, scope: !2)
!68 = !DILocation(line: 0, scope: !2)
!69 = !DILocation(line: 58, column: 3, scope: !2)
