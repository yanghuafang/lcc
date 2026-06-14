; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

%struct.Point = type { i32, i32 }

@0 = private unnamed_addr constant [25 x i8] c"48.block_typedef.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [25 x i8] c"48.block_typedef.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @outerSize() !dbg !4 {
entry:
  ret i32 4, !dbg !8
}

define i32 @main() !dbg !9 {
entry:
  %w = alloca i64, align 8
    #dbg_declare(ptr %w, !11, !DIExpression(), !15)
  %pt = alloca %struct.Point, align 8
    #dbg_declare(ptr %pt, !16, !DIExpression(), !22)
  %p = alloca ptr, align 8
    #dbg_declare(ptr %p, !23, !DIExpression(), !27)
  %v = alloca i32, align 4
    #dbg_declare(ptr %v, !28, !DIExpression(), !29)
  %narrow = alloca i8, align 1
    #dbg_declare(ptr %narrow, !30, !DIExpression(), !33)
  %outer = alloca i32, align 4
    #dbg_declare(ptr %outer, !34, !DIExpression(), !35)
  %failed = alloca i32, align 4
    #dbg_declare(ptr %failed, !36, !DIExpression(), !37)
  store i32 0, ptr %failed, align 4, !dbg !37
  store i32 1000, ptr %outer, align 4, !dbg !35
  %0 = load i32, ptr %outer, align 4, !dbg !38
  %1 = icmp ne i32 %0, 1000, !dbg !38
  br i1 %1, label %then, label %else, !dbg !38

then:                                             ; preds = %entry
  store i32 1, ptr %failed, align 4, !dbg !39
  %2 = load i32, ptr %failed, align 4, !dbg !39
  br label %if.end, !dbg !39

else:                                             ; preds = %entry
  br label %if.end, !dbg !39

if.end:                                           ; preds = %else, %then
  br i1 false, label %then1, label %else2, !dbg !41

then1:                                            ; preds = %if.end
  store i32 1, ptr %failed, align 4, !dbg !42
  %3 = load i32, ptr %failed, align 4, !dbg !42
  br label %if.end3, !dbg !42

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !42

if.end3:                                          ; preds = %else2, %then1
  store i8 44, ptr %narrow, align 1, !dbg !33
  %4 = load i8, ptr %narrow, align 1, !dbg !44
  %5 = sext i8 %4 to i32, !dbg !44
  %6 = icmp ne i32 %5, 44, !dbg !44
  br i1 %6, label %then4, label %else5, !dbg !44

then4:                                            ; preds = %if.end3
  store i32 1, ptr %failed, align 4, !dbg !45
  %7 = load i32, ptr %failed, align 4, !dbg !45
  br label %if.end6, !dbg !45

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !45

if.end6:                                          ; preds = %else5, %then4
  br i1 false, label %then7, label %else8, !dbg !47

then7:                                            ; preds = %if.end6
  store i32 1, ptr %failed, align 4, !dbg !48
  %8 = load i32, ptr %failed, align 4, !dbg !48
  br label %if.end9, !dbg !48

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !48

if.end9:                                          ; preds = %else8, %then7
  br i1 false, label %then10, label %else11, !dbg !50

then10:                                           ; preds = %if.end9
  store i32 1, ptr %failed, align 4, !dbg !51
  %9 = load i32, ptr %failed, align 4, !dbg !51
  br label %if.end12, !dbg !51

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !51

if.end12:                                         ; preds = %else11, %then10
  %10 = call i32 @outerSize(), !dbg !53
  %11 = icmp ne i32 %10, 4, !dbg !53
  br i1 %11, label %then13, label %else14, !dbg !53

then13:                                           ; preds = %if.end12
  store i32 1, ptr %failed, align 4, !dbg !54
  %12 = load i32, ptr %failed, align 4, !dbg !54
  br label %if.end15, !dbg !54

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !54

if.end15:                                         ; preds = %else14, %then13
  store i32 7, ptr %v, align 4, !dbg !29
  store ptr %v, ptr %p, align 8, !dbg !27
  %13 = load ptr, ptr %p, align 8, !dbg !56
  %14 = load i32, ptr %13, align 4, !dbg !56
  %15 = icmp ne i32 %14, 7, !dbg !56
  br i1 %15, label %then16, label %else17, !dbg !56

then16:                                           ; preds = %if.end15
  store i32 1, ptr %failed, align 4, !dbg !57
  %16 = load i32, ptr %failed, align 4, !dbg !57
  br label %if.end18, !dbg !57

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !57

if.end18:                                         ; preds = %else17, %then16
  br i1 false, label %then19, label %else20, !dbg !59

then19:                                           ; preds = %if.end18
  store i32 1, ptr %failed, align 4, !dbg !60
  %17 = load i32, ptr %failed, align 4, !dbg !60
  br label %if.end21, !dbg !60

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !60

if.end21:                                         ; preds = %else20, %then19
  %18 = getelementptr %struct.Point, ptr %pt, i32 0, i32 0, !dbg !62
  store i32 3, ptr %18, align 4, !dbg !62
  %19 = load i32, ptr %18, align 4, !dbg !62
  %20 = getelementptr %struct.Point, ptr %pt, i32 0, i32 1, !dbg !63
  store i32 4, ptr %20, align 4, !dbg !63
  %21 = load i32, ptr %20, align 4, !dbg !63
  %22 = getelementptr %struct.Point, ptr %pt, i32 0, i32 0, !dbg !64
  %23 = load i32, ptr %22, align 4, !dbg !64
  %24 = getelementptr %struct.Point, ptr %pt, i32 0, i32 1, !dbg !64
  %25 = load i32, ptr %24, align 4, !dbg !64
  %26 = add i32 %23, %25, !dbg !64
  %27 = icmp ne i32 %26, 7, !dbg !64
  br i1 %27, label %then22, label %else23, !dbg !64

then22:                                           ; preds = %if.end21
  store i32 1, ptr %failed, align 4, !dbg !65
  %28 = load i32, ptr %failed, align 4, !dbg !65
  br label %if.end24, !dbg !65

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !65

if.end24:                                         ; preds = %else23, %then22
  br i1 false, label %then25, label %else26, !dbg !67

then25:                                           ; preds = %if.end24
  store i32 1, ptr %failed, align 4, !dbg !68
  %29 = load i32, ptr %failed, align 4, !dbg !68
  br label %if.end27, !dbg !68

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !68

if.end27:                                         ; preds = %else26, %then25
  store i64 5, ptr %w, align 8, !dbg !15
  %30 = load i64, ptr %w, align 8, !dbg !70
  %31 = icmp ne i64 %30, 5, !dbg !70
  br i1 %31, label %then28, label %else29, !dbg !70

then28:                                           ; preds = %if.end27
  store i32 1, ptr %failed, align 4, !dbg !71
  %32 = load i32, ptr %failed, align 4, !dbg !71
  br label %if.end30, !dbg !71

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !71

if.end30:                                         ; preds = %else29, %then28
  br i1 false, label %then31, label %else32, !dbg !73

then31:                                           ; preds = %if.end30
  store i32 1, ptr %failed, align 4, !dbg !74
  %33 = load i32, ptr %failed, align 4, !dbg !74
  br label %if.end33, !dbg !74

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !74

if.end33:                                         ; preds = %else32, %then31
  %34 = load i32, ptr %failed, align 4, !dbg !76
  %35 = icmp eq i32 %34, 0, !dbg !76
  br i1 %35, label %then34, label %else35, !dbg !76

then34:                                           ; preds = %if.end33
  %36 = call i32 (ptr, ...) @printf(ptr @0), !dbg !77
  ret i32 0, !dbg !79

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !79

if.end36:                                         ; preds = %else35
  %37 = call i32 (ptr, ...) @printf(ptr @1), !dbg !80
  ret i32 1, !dbg !81
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "48.block_typedef.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "outerSize", linkageName: "outerSize", scope: null, file: !3, line: 20, type: !5, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocation(line: 20, column: 19, scope: !4)
!9 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 22, type: !5, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !10)
!10 = !{}
!11 = !DILocalVariable(name: "w", scope: !12, file: !3, line: 89, type: !14)
!12 = distinct !DILexicalBlock(scope: !13, file: !3, line: 86, column: 5)
!13 = distinct !DILexicalBlock(scope: !9, file: !3, line: 84, column: 3)
!14 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!15 = !DILocation(line: 89, column: 7, scope: !12)
!16 = !DILocalVariable(name: "pt", scope: !17, file: !3, line: 72, type: !18)
!17 = distinct !DILexicalBlock(scope: !9, file: !3, line: 67, column: 3)
!18 = !DICompositeType(tag: DW_TAG_structure_type, name: "Point", file: !3, size: 64, align: 32, elements: !19)
!19 = !{!20, !21}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "x", file: !3, baseType: !7, size: 32, align: 32)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "y", file: !3, baseType: !7, size: 32, align: 32, offset: 32)
!22 = !DILocation(line: 72, column: 5, scope: !17)
!23 = !DILocalVariable(name: "p", scope: !24, file: !3, line: 57, type: !25)
!24 = distinct !DILexicalBlock(scope: !9, file: !3, line: 54, column: 3)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!27 = !DILocation(line: 57, column: 5, scope: !24)
!28 = !DILocalVariable(name: "v", scope: !24, file: !3, line: 56, type: !7)
!29 = !DILocation(line: 56, column: 5, scope: !24)
!30 = !DILocalVariable(name: "narrow", scope: !31, file: !3, line: 36, type: !32)
!31 = distinct !DILexicalBlock(scope: !9, file: !3, line: 33, column: 3)
!32 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!33 = !DILocation(line: 36, column: 5, scope: !31)
!34 = !DILocalVariable(name: "outer", scope: !9, file: !3, line: 24, type: !7)
!35 = !DILocation(line: 24, column: 3, scope: !9)
!36 = !DILocalVariable(name: "failed", scope: !9, file: !3, line: 23, type: !7)
!37 = !DILocation(line: 23, column: 3, scope: !9)
!38 = !DILocation(line: 26, column: 3, scope: !9)
!39 = !DILocation(line: 27, column: 5, scope: !40)
!40 = distinct !DILexicalBlock(scope: !9, file: !3, line: 26, column: 22)
!41 = !DILocation(line: 29, column: 3, scope: !9)
!42 = !DILocation(line: 30, column: 5, scope: !43)
!43 = distinct !DILexicalBlock(scope: !9, file: !3, line: 29, column: 27)
!44 = !DILocation(line: 38, column: 5, scope: !31)
!45 = !DILocation(line: 39, column: 7, scope: !46)
!46 = distinct !DILexicalBlock(scope: !31, file: !3, line: 38, column: 23)
!47 = !DILocation(line: 41, column: 5, scope: !31)
!48 = !DILocation(line: 42, column: 7, scope: !49)
!49 = distinct !DILexicalBlock(scope: !31, file: !3, line: 41, column: 29)
!50 = !DILocation(line: 47, column: 3, scope: !9)
!51 = !DILocation(line: 48, column: 5, scope: !52)
!52 = distinct !DILexicalBlock(scope: !9, file: !3, line: 47, column: 27)
!53 = !DILocation(line: 50, column: 3, scope: !9)
!54 = !DILocation(line: 51, column: 5, scope: !55)
!55 = distinct !DILexicalBlock(scope: !9, file: !3, line: 50, column: 25)
!56 = !DILocation(line: 59, column: 5, scope: !24)
!57 = !DILocation(line: 60, column: 7, scope: !58)
!58 = distinct !DILexicalBlock(scope: !24, file: !3, line: 59, column: 18)
!59 = !DILocation(line: 62, column: 5, scope: !24)
!60 = !DILocation(line: 63, column: 7, scope: !61)
!61 = distinct !DILexicalBlock(scope: !24, file: !3, line: 62, column: 30)
!62 = !DILocation(line: 74, column: 5, scope: !17)
!63 = !DILocation(line: 75, column: 5, scope: !17)
!64 = !DILocation(line: 76, column: 5, scope: !17)
!65 = !DILocation(line: 77, column: 7, scope: !66)
!66 = distinct !DILexicalBlock(scope: !17, file: !3, line: 76, column: 27)
!67 = !DILocation(line: 79, column: 5, scope: !17)
!68 = !DILocation(line: 80, column: 7, scope: !69)
!69 = distinct !DILexicalBlock(scope: !17, file: !3, line: 79, column: 29)
!70 = !DILocation(line: 91, column: 7, scope: !12)
!71 = !DILocation(line: 92, column: 9, scope: !72)
!72 = distinct !DILexicalBlock(scope: !12, file: !3, line: 91, column: 19)
!73 = !DILocation(line: 94, column: 7, scope: !12)
!74 = !DILocation(line: 95, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !12, file: !3, line: 94, column: 32)
!76 = !DILocation(line: 100, column: 3, scope: !9)
!77 = !DILocation(line: 101, column: 5, scope: !78)
!78 = distinct !DILexicalBlock(scope: !9, file: !3, line: 100, column: 20)
!79 = !DILocation(line: 102, column: 5, scope: !78)
!80 = !DILocation(line: 104, column: 3, scope: !9)
!81 = !DILocation(line: 105, column: 3, scope: !9)
