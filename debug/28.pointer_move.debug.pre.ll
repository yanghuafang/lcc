; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [24 x i8] c"28.pointer_move.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"28.pointer_move.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %pc = alloca ptr, align 8
    #dbg_declare(ptr %pc, !8, !DIExpression(), !11)
  %c = alloca [4 x i8], align 1
    #dbg_declare(ptr %c, !12, !DIExpression(), !16)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !17, !DIExpression(), !18)
  store i32 0, ptr %err, align 4, !dbg !18
  %0 = getelementptr i8, ptr %c, i32 0, !dbg !19
  store i8 65, ptr %0, align 1, !dbg !19
  %1 = load i8, ptr %0, align 1, !dbg !19
  %2 = getelementptr i8, ptr %c, i32 1, !dbg !20
  store i8 66, ptr %2, align 1, !dbg !20
  %3 = load i8, ptr %2, align 1, !dbg !20
  %4 = getelementptr i8, ptr %c, i32 2, !dbg !21
  store i8 67, ptr %4, align 1, !dbg !21
  %5 = load i8, ptr %4, align 1, !dbg !21
  %6 = getelementptr i8, ptr %c, i32 3, !dbg !22
  store i8 68, ptr %6, align 1, !dbg !22
  %7 = load i8, ptr %6, align 1, !dbg !22
  store ptr %c, ptr %pc, align 8, !dbg !11
  %8 = load ptr, ptr %pc, align 8, !dbg !23
  %9 = load i8, ptr %8, align 1, !dbg !23
  %10 = sext i8 %9 to i32, !dbg !23
  %11 = icmp ne i32 %10, 65, !dbg !23
  br i1 %11, label %then, label %else, !dbg !23

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !24
  %12 = load i32, ptr %err, align 4, !dbg !24
  br label %if.end, !dbg !24

else:                                             ; preds = %entry
  br label %if.end, !dbg !24

if.end:                                           ; preds = %else, %then
  %13 = load ptr, ptr %pc, align 8, !dbg !25
  %14 = getelementptr i8, ptr %13, i32 1, !dbg !25
  store ptr %14, ptr %pc, align 8, !dbg !25
  %15 = load ptr, ptr %pc, align 8, !dbg !25
  %16 = load ptr, ptr %pc, align 8, !dbg !26
  %17 = load i8, ptr %16, align 1, !dbg !26
  %18 = sext i8 %17 to i32, !dbg !26
  %19 = icmp ne i32 %18, 66, !dbg !26
  br i1 %19, label %then1, label %else2, !dbg !26

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !27
  %20 = load i32, ptr %err, align 4, !dbg !27
  br label %if.end3, !dbg !27

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !27

if.end3:                                          ; preds = %else2, %then1
  %21 = load ptr, ptr %pc, align 8, !dbg !28
  %22 = getelementptr i8, ptr %21, i64 1, !dbg !28
  store ptr %22, ptr %pc, align 8, !dbg !28
  %23 = load ptr, ptr %pc, align 8, !dbg !28
  %24 = load ptr, ptr %pc, align 8, !dbg !29
  %25 = load i8, ptr %24, align 1, !dbg !29
  %26 = sext i8 %25 to i32, !dbg !29
  %27 = icmp ne i32 %26, 67, !dbg !29
  br i1 %27, label %then4, label %else5, !dbg !29

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !30
  %28 = load i32, ptr %err, align 4, !dbg !30
  br label %if.end6, !dbg !30

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !30

if.end6:                                          ; preds = %else5, %then4
  %29 = load ptr, ptr %pc, align 8, !dbg !31
  %30 = getelementptr i8, ptr %29, i64 1, !dbg !31
  store ptr %30, ptr %pc, align 8, !dbg !31
  %31 = load ptr, ptr %pc, align 8, !dbg !32
  %32 = load i8, ptr %31, align 1, !dbg !32
  %33 = sext i8 %32 to i32, !dbg !32
  %34 = icmp ne i32 %33, 68, !dbg !32
  br i1 %34, label %then7, label %else8, !dbg !32

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !33
  %35 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end9, !dbg !33

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !33

if.end9:                                          ; preds = %else8, %then7
  %36 = getelementptr i8, ptr %c, i32 3, !dbg !34
  store ptr %36, ptr %pc, align 8, !dbg !34
  %37 = load ptr, ptr %pc, align 8, !dbg !34
  %38 = load ptr, ptr %pc, align 8, !dbg !35
  %39 = load i8, ptr %38, align 1, !dbg !35
  %40 = sext i8 %39 to i32, !dbg !35
  %41 = icmp ne i32 %40, 68, !dbg !35
  br i1 %41, label %then10, label %else11, !dbg !35

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !36
  %42 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end12, !dbg !36

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !36

if.end12:                                         ; preds = %else11, %then10
  %43 = load ptr, ptr %pc, align 8, !dbg !37
  %44 = getelementptr i8, ptr %43, i32 -1, !dbg !37
  store ptr %44, ptr %pc, align 8, !dbg !37
  %45 = load ptr, ptr %pc, align 8, !dbg !37
  %46 = load ptr, ptr %pc, align 8, !dbg !38
  %47 = load i8, ptr %46, align 1, !dbg !38
  %48 = sext i8 %47 to i32, !dbg !38
  %49 = icmp ne i32 %48, 67, !dbg !38
  br i1 %49, label %then13, label %else14, !dbg !38

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !39
  %50 = load i32, ptr %err, align 4, !dbg !39
  br label %if.end15, !dbg !39

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !39

if.end15:                                         ; preds = %else14, %then13
  %51 = load ptr, ptr %pc, align 8, !dbg !40
  %52 = getelementptr i8, ptr %51, i64 -1, !dbg !40
  store ptr %52, ptr %pc, align 8, !dbg !40
  %53 = load ptr, ptr %pc, align 8, !dbg !40
  %54 = load ptr, ptr %pc, align 8, !dbg !41
  %55 = load i8, ptr %54, align 1, !dbg !41
  %56 = sext i8 %55 to i32, !dbg !41
  %57 = icmp ne i32 %56, 66, !dbg !41
  br i1 %57, label %then16, label %else17, !dbg !41

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !42
  %58 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end18, !dbg !42

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !42

if.end18:                                         ; preds = %else17, %then16
  %59 = load ptr, ptr %pc, align 8, !dbg !43
  %60 = getelementptr i8, ptr %59, i64 -1, !dbg !43
  store ptr %60, ptr %pc, align 8, !dbg !43
  %61 = load ptr, ptr %pc, align 8, !dbg !44
  %62 = load i8, ptr %61, align 1, !dbg !44
  %63 = sext i8 %62 to i32, !dbg !44
  %64 = icmp ne i32 %63, 65, !dbg !44
  br i1 %64, label %then19, label %else20, !dbg !44

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !45
  %65 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end21, !dbg !45

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !45

if.end21:                                         ; preds = %else20, %then19
  %66 = load i32, ptr %err, align 4, !dbg !46
  %67 = icmp eq i32 %66, 0, !dbg !46
  br i1 %67, label %then22, label %else23, !dbg !46

then22:                                           ; preds = %if.end21
  %68 = call i32 (ptr, ...) @printf(ptr @0), !dbg !47
  br label %if.end24, !dbg !47

else23:                                           ; preds = %if.end21
  %69 = call i32 (ptr, ...) @printf(ptr @1), !dbg !49
  br label %if.end24, !dbg !49

if.end24:                                         ; preds = %else23, %then22
  %70 = load i32, ptr %err, align 4, !dbg !51
  ret i32 %70, !dbg !51
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "28.pointer_move.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "pc", scope: !4, file: !3, line: 14, type: !9)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!11 = !DILocation(line: 14, column: 3, scope: !4)
!12 = !DILocalVariable(name: "c", scope: !4, file: !3, line: 8, type: !13)
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 32, align: 8, elements: !14)
!14 = !{!15}
!15 = !DISubrange(count: 4, lowerBound: 0)
!16 = !DILocation(line: 8, column: 3, scope: !4)
!17 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 7, type: !7)
!18 = !DILocation(line: 7, column: 3, scope: !4)
!19 = !DILocation(line: 9, column: 3, scope: !4)
!20 = !DILocation(line: 10, column: 3, scope: !4)
!21 = !DILocation(line: 11, column: 3, scope: !4)
!22 = !DILocation(line: 12, column: 3, scope: !4)
!23 = !DILocation(line: 15, column: 3, scope: !4)
!24 = !DILocation(line: 15, column: 19, scope: !4)
!25 = !DILocation(line: 16, column: 3, scope: !4)
!26 = !DILocation(line: 17, column: 3, scope: !4)
!27 = !DILocation(line: 17, column: 19, scope: !4)
!28 = !DILocation(line: 18, column: 3, scope: !4)
!29 = !DILocation(line: 19, column: 3, scope: !4)
!30 = !DILocation(line: 19, column: 19, scope: !4)
!31 = !DILocation(line: 20, column: 3, scope: !4)
!32 = !DILocation(line: 21, column: 3, scope: !4)
!33 = !DILocation(line: 21, column: 19, scope: !4)
!34 = !DILocation(line: 23, column: 3, scope: !4)
!35 = !DILocation(line: 24, column: 3, scope: !4)
!36 = !DILocation(line: 24, column: 19, scope: !4)
!37 = !DILocation(line: 25, column: 3, scope: !4)
!38 = !DILocation(line: 26, column: 3, scope: !4)
!39 = !DILocation(line: 26, column: 19, scope: !4)
!40 = !DILocation(line: 27, column: 3, scope: !4)
!41 = !DILocation(line: 28, column: 3, scope: !4)
!42 = !DILocation(line: 28, column: 19, scope: !4)
!43 = !DILocation(line: 29, column: 3, scope: !4)
!44 = !DILocation(line: 30, column: 3, scope: !4)
!45 = !DILocation(line: 30, column: 19, scope: !4)
!46 = !DILocation(line: 32, column: 3, scope: !4)
!47 = !DILocation(line: 33, column: 5, scope: !48)
!48 = distinct !DILexicalBlock(scope: !4, file: !3, line: 32, column: 17)
!49 = !DILocation(line: 35, column: 5, scope: !50)
!50 = distinct !DILexicalBlock(scope: !4, file: !3, line: 34, column: 10)
!51 = !DILocation(line: 37, column: 3, scope: !4)
