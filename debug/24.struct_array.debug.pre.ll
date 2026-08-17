; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

%struct.Data = type { i32, i32 }

@0 = private unnamed_addr constant [24 x i8] c"24.struct_array.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"24.struct_array.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %data = alloca i32, align 4
    #dbg_declare(ptr %data, !8, !DIExpression(), !9)
  %id = alloca i32, align 4
    #dbg_declare(ptr %id, !10, !DIExpression(), !11)
  %da = alloca [2 x %struct.Data], align 8
    #dbg_declare(ptr %da, !12, !DIExpression(), !17)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !18, !DIExpression(), !19)
  store i32 0, ptr %err, align 4, !dbg !19
  %0 = getelementptr %struct.Data, ptr %da, i32 0, !dbg !20
  %1 = getelementptr %struct.Data, ptr %0, i32 0, i32 0, !dbg !20
  store i32 0, ptr %1, align 4, !dbg !20
  %2 = load i32, ptr %1, align 4, !dbg !20
  %3 = getelementptr %struct.Data, ptr %da, i32 0, !dbg !21
  %4 = getelementptr %struct.Data, ptr %3, i32 0, i32 1, !dbg !21
  store i32 0, ptr %4, align 4, !dbg !21
  %5 = load i32, ptr %4, align 4, !dbg !21
  %6 = getelementptr %struct.Data, ptr %da, i32 1, !dbg !22
  %7 = getelementptr %struct.Data, ptr %6, i32 0, i32 0, !dbg !22
  store i32 10, ptr %7, align 4, !dbg !22
  %8 = load i32, ptr %7, align 4, !dbg !22
  %9 = getelementptr %struct.Data, ptr %da, i32 1, !dbg !23
  %10 = getelementptr %struct.Data, ptr %9, i32 0, i32 1, !dbg !23
  store i32 80, ptr %10, align 4, !dbg !23
  %11 = load i32, ptr %10, align 4, !dbg !23
  %12 = getelementptr %struct.Data, ptr %da, i32 1, !dbg !24
  %13 = getelementptr %struct.Data, ptr %12, i32 0, i32 0, !dbg !24
  %14 = load i32, ptr %13, align 4, !dbg !24
  store i32 %14, ptr %id, align 4, !dbg !24
  %15 = load i32, ptr %id, align 4, !dbg !24
  %16 = getelementptr %struct.Data, ptr %da, i32 1, !dbg !25
  %17 = getelementptr %struct.Data, ptr %16, i32 0, i32 1, !dbg !25
  %18 = load i32, ptr %17, align 4, !dbg !25
  store i32 %18, ptr %data, align 4, !dbg !25
  %19 = load i32, ptr %data, align 4, !dbg !25
  %20 = load i32, ptr %id, align 4, !dbg !26
  %21 = icmp ne i32 %20, 10, !dbg !26
  br i1 %21, label %then, label %else, !dbg !26

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !27
  %22 = load i32, ptr %err, align 4, !dbg !27
  br label %if.end, !dbg !27

else:                                             ; preds = %entry
  br label %if.end, !dbg !27

if.end:                                           ; preds = %else, %then
  %23 = load i32, ptr %data, align 4, !dbg !28
  %24 = icmp ne i32 %23, 80, !dbg !28
  br i1 %24, label %then1, label %else2, !dbg !28

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !29
  %25 = load i32, ptr %err, align 4, !dbg !29
  br label %if.end3, !dbg !29

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !29

if.end3:                                          ; preds = %else2, %then1
  %26 = getelementptr %struct.Data, ptr %da, i32 0, !dbg !30
  %27 = getelementptr %struct.Data, ptr %26, i32 0, i32 0, !dbg !30
  %28 = load i32, ptr %27, align 4, !dbg !30
  store i32 %28, ptr %id, align 4, !dbg !30
  %29 = load i32, ptr %id, align 4, !dbg !30
  %30 = getelementptr %struct.Data, ptr %da, i32 0, !dbg !31
  %31 = getelementptr %struct.Data, ptr %30, i32 0, i32 1, !dbg !31
  %32 = load i32, ptr %31, align 4, !dbg !31
  store i32 %32, ptr %data, align 4, !dbg !31
  %33 = load i32, ptr %data, align 4, !dbg !31
  %34 = load i32, ptr %id, align 4, !dbg !32
  %35 = icmp ne i32 %34, 0, !dbg !32
  br i1 %35, label %then4, label %else5, !dbg !32

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !33
  %36 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end6, !dbg !33

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !33

if.end6:                                          ; preds = %else5, %then4
  %37 = load i32, ptr %data, align 4, !dbg !34
  %38 = icmp ne i32 %37, 0, !dbg !34
  br i1 %38, label %then7, label %else8, !dbg !34

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !35
  %39 = load i32, ptr %err, align 4, !dbg !35
  br label %if.end9, !dbg !35

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !35

if.end9:                                          ; preds = %else8, %then7
  %40 = load i32, ptr %err, align 4, !dbg !36
  %41 = icmp eq i32 %40, 0, !dbg !36
  br i1 %41, label %then10, label %else11, !dbg !36

then10:                                           ; preds = %if.end9
  %42 = call i32 (ptr, ...) @printf(ptr @0), !dbg !37
  br label %if.end12, !dbg !37

else11:                                           ; preds = %if.end9
  %43 = call i32 (ptr, ...) @printf(ptr @1), !dbg !39
  br label %if.end12, !dbg !39

if.end12:                                         ; preds = %else11, %then10
  %44 = load i32, ptr %err, align 4, !dbg !41
  ret i32 %44, !dbg !41
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "24.struct_array.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 11, type: !5, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "data", scope: !4, file: !3, line: 15, type: !7)
!9 = !DILocation(line: 15, column: 3, scope: !4)
!10 = !DILocalVariable(name: "id", scope: !4, file: !3, line: 14, type: !7)
!11 = !DILocation(line: 14, column: 3, scope: !4)
!12 = !DILocalVariable(name: "da", scope: !4, file: !3, line: 13, type: !13)
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 128, align: 32, elements: !15)
!14 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!15 = !{!16}
!16 = !DISubrange(count: 2, lowerBound: 0)
!17 = !DILocation(line: 13, column: 3, scope: !4)
!18 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 12, type: !7)
!19 = !DILocation(line: 12, column: 3, scope: !4)
!20 = !DILocation(line: 17, column: 3, scope: !4)
!21 = !DILocation(line: 18, column: 3, scope: !4)
!22 = !DILocation(line: 19, column: 3, scope: !4)
!23 = !DILocation(line: 20, column: 3, scope: !4)
!24 = !DILocation(line: 22, column: 3, scope: !4)
!25 = !DILocation(line: 23, column: 3, scope: !4)
!26 = !DILocation(line: 24, column: 3, scope: !4)
!27 = !DILocation(line: 24, column: 17, scope: !4)
!28 = !DILocation(line: 25, column: 3, scope: !4)
!29 = !DILocation(line: 25, column: 19, scope: !4)
!30 = !DILocation(line: 27, column: 3, scope: !4)
!31 = !DILocation(line: 28, column: 3, scope: !4)
!32 = !DILocation(line: 29, column: 3, scope: !4)
!33 = !DILocation(line: 29, column: 16, scope: !4)
!34 = !DILocation(line: 30, column: 3, scope: !4)
!35 = !DILocation(line: 30, column: 18, scope: !4)
!36 = !DILocation(line: 32, column: 3, scope: !4)
!37 = !DILocation(line: 33, column: 5, scope: !38)
!38 = distinct !DILexicalBlock(scope: !4, file: !3, line: 32, column: 17)
!39 = !DILocation(line: 35, column: 5, scope: !40)
!40 = distinct !DILexicalBlock(scope: !4, file: !3, line: 34, column: 10)
!41 = !DILocation(line: 37, column: 3, scope: !4)
