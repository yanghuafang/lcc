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
    #dbg_declare(ptr %w, !10, !DIExpression(), !14)
  %pt = alloca %struct.Point, align 8
    #dbg_declare(ptr %pt, !15, !DIExpression(), !21)
  %p = alloca ptr, align 8
    #dbg_declare(ptr %p, !22, !DIExpression(), !26)
  %v = alloca i32, align 4
    #dbg_declare(ptr %v, !27, !DIExpression(), !28)
  %narrow = alloca i8, align 1
    #dbg_declare(ptr %narrow, !29, !DIExpression(), !32)
  %outer = alloca i32, align 4
    #dbg_declare(ptr %outer, !33, !DIExpression(), !34)
  %failed = alloca i32, align 4
    #dbg_declare(ptr %failed, !35, !DIExpression(), !36)
  store i32 0, ptr %failed, align 4, !dbg !36
  store i32 1000, ptr %outer, align 4, !dbg !34
  %0 = load i32, ptr %outer, align 4, !dbg !37
  %1 = icmp ne i32 %0, 1000, !dbg !37
  br i1 %1, label %then, label %else, !dbg !37

then:                                             ; preds = %entry
  store i32 1, ptr %failed, align 4, !dbg !38
  %2 = load i32, ptr %failed, align 4, !dbg !38
  br label %if.end, !dbg !38

else:                                             ; preds = %entry
  br label %if.end, !dbg !38

if.end:                                           ; preds = %else, %then
  br i1 false, label %then1, label %else2, !dbg !40

then1:                                            ; preds = %if.end
  store i32 1, ptr %failed, align 4, !dbg !41
  %3 = load i32, ptr %failed, align 4, !dbg !41
  br label %if.end3, !dbg !41

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !41

if.end3:                                          ; preds = %else2, %then1
  store i8 44, ptr %narrow, align 1, !dbg !32
  %4 = load i8, ptr %narrow, align 1, !dbg !43
  %5 = sext i8 %4 to i32, !dbg !43
  %6 = icmp ne i32 %5, 44, !dbg !43
  br i1 %6, label %then4, label %else5, !dbg !43

then4:                                            ; preds = %if.end3
  store i32 1, ptr %failed, align 4, !dbg !44
  %7 = load i32, ptr %failed, align 4, !dbg !44
  br label %if.end6, !dbg !44

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !44

if.end6:                                          ; preds = %else5, %then4
  br i1 false, label %then7, label %else8, !dbg !46

then7:                                            ; preds = %if.end6
  store i32 1, ptr %failed, align 4, !dbg !47
  %8 = load i32, ptr %failed, align 4, !dbg !47
  br label %if.end9, !dbg !47

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !47

if.end9:                                          ; preds = %else8, %then7
  br i1 false, label %then10, label %else11, !dbg !49

then10:                                           ; preds = %if.end9
  store i32 1, ptr %failed, align 4, !dbg !50
  %9 = load i32, ptr %failed, align 4, !dbg !50
  br label %if.end12, !dbg !50

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !50

if.end12:                                         ; preds = %else11, %then10
  %10 = call i32 @outerSize(), !dbg !52
  %11 = icmp ne i32 %10, 4, !dbg !52
  br i1 %11, label %then13, label %else14, !dbg !52

then13:                                           ; preds = %if.end12
  store i32 1, ptr %failed, align 4, !dbg !53
  %12 = load i32, ptr %failed, align 4, !dbg !53
  br label %if.end15, !dbg !53

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !53

if.end15:                                         ; preds = %else14, %then13
  store i32 7, ptr %v, align 4, !dbg !28
  store ptr %v, ptr %p, align 8, !dbg !26
  %13 = load ptr, ptr %p, align 8, !dbg !55
  %14 = load i32, ptr %13, align 4, !dbg !55
  %15 = icmp ne i32 %14, 7, !dbg !55
  br i1 %15, label %then16, label %else17, !dbg !55

then16:                                           ; preds = %if.end15
  store i32 1, ptr %failed, align 4, !dbg !56
  %16 = load i32, ptr %failed, align 4, !dbg !56
  br label %if.end18, !dbg !56

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !56

if.end18:                                         ; preds = %else17, %then16
  br i1 false, label %then19, label %else20, !dbg !58

then19:                                           ; preds = %if.end18
  store i32 1, ptr %failed, align 4, !dbg !59
  %17 = load i32, ptr %failed, align 4, !dbg !59
  br label %if.end21, !dbg !59

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !59

if.end21:                                         ; preds = %else20, %then19
  %18 = getelementptr %struct.Point, ptr %pt, i32 0, i32 0, !dbg !61
  store i32 3, ptr %18, align 4, !dbg !61
  %19 = load i32, ptr %18, align 4, !dbg !61
  %20 = getelementptr %struct.Point, ptr %pt, i32 0, i32 1, !dbg !62
  store i32 4, ptr %20, align 4, !dbg !62
  %21 = load i32, ptr %20, align 4, !dbg !62
  %22 = getelementptr %struct.Point, ptr %pt, i32 0, i32 0, !dbg !63
  %23 = load i32, ptr %22, align 4, !dbg !63
  %24 = getelementptr %struct.Point, ptr %pt, i32 0, i32 1, !dbg !63
  %25 = load i32, ptr %24, align 4, !dbg !63
  %26 = add i32 %23, %25, !dbg !63
  %27 = icmp ne i32 %26, 7, !dbg !63
  br i1 %27, label %then22, label %else23, !dbg !63

then22:                                           ; preds = %if.end21
  store i32 1, ptr %failed, align 4, !dbg !64
  %28 = load i32, ptr %failed, align 4, !dbg !64
  br label %if.end24, !dbg !64

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !64

if.end24:                                         ; preds = %else23, %then22
  br i1 false, label %then25, label %else26, !dbg !66

then25:                                           ; preds = %if.end24
  store i32 1, ptr %failed, align 4, !dbg !67
  %29 = load i32, ptr %failed, align 4, !dbg !67
  br label %if.end27, !dbg !67

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !67

if.end27:                                         ; preds = %else26, %then25
  store i64 5, ptr %w, align 8, !dbg !14
  %30 = load i64, ptr %w, align 8, !dbg !69
  %31 = icmp ne i64 %30, 5, !dbg !69
  br i1 %31, label %then28, label %else29, !dbg !69

then28:                                           ; preds = %if.end27
  store i32 1, ptr %failed, align 4, !dbg !70
  %32 = load i32, ptr %failed, align 4, !dbg !70
  br label %if.end30, !dbg !70

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !70

if.end30:                                         ; preds = %else29, %then28
  br i1 false, label %then31, label %else32, !dbg !72

then31:                                           ; preds = %if.end30
  store i32 1, ptr %failed, align 4, !dbg !73
  %33 = load i32, ptr %failed, align 4, !dbg !73
  br label %if.end33, !dbg !73

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !73

if.end33:                                         ; preds = %else32, %then31
  %34 = load i32, ptr %failed, align 4, !dbg !75
  %35 = icmp eq i32 %34, 0, !dbg !75
  br i1 %35, label %then34, label %else35, !dbg !75

then34:                                           ; preds = %if.end33
  %36 = call i32 (ptr, ...) @printf(ptr @0), !dbg !76
  ret i32 0, !dbg !78

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !78

if.end36:                                         ; preds = %else35
  %37 = call i32 (ptr, ...) @printf(ptr @1), !dbg !79
  ret i32 1, !dbg !80
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
!9 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 22, type: !5, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !2)
!10 = !DILocalVariable(name: "w", scope: !11, file: !3, line: 89, type: !13)
!11 = distinct !DILexicalBlock(scope: !12, file: !3, line: 86, column: 5)
!12 = distinct !DILexicalBlock(scope: !9, file: !3, line: 84, column: 3)
!13 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!14 = !DILocation(line: 89, column: 7, scope: !11)
!15 = !DILocalVariable(name: "pt", scope: !16, file: !3, line: 72, type: !17)
!16 = distinct !DILexicalBlock(scope: !9, file: !3, line: 67, column: 3)
!17 = !DICompositeType(tag: DW_TAG_structure_type, name: "Point", file: !3, size: 64, align: 32, elements: !18)
!18 = !{!19, !20}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "x", file: !3, baseType: !7, size: 32, align: 32)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "y", file: !3, baseType: !7, size: 32, align: 32, offset: 32)
!21 = !DILocation(line: 72, column: 5, scope: !16)
!22 = !DILocalVariable(name: "p", scope: !23, file: !3, line: 57, type: !24)
!23 = distinct !DILexicalBlock(scope: !9, file: !3, line: 54, column: 3)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!26 = !DILocation(line: 57, column: 5, scope: !23)
!27 = !DILocalVariable(name: "v", scope: !23, file: !3, line: 56, type: !7)
!28 = !DILocation(line: 56, column: 5, scope: !23)
!29 = !DILocalVariable(name: "narrow", scope: !30, file: !3, line: 36, type: !31)
!30 = distinct !DILexicalBlock(scope: !9, file: !3, line: 33, column: 3)
!31 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!32 = !DILocation(line: 36, column: 5, scope: !30)
!33 = !DILocalVariable(name: "outer", scope: !9, file: !3, line: 24, type: !7)
!34 = !DILocation(line: 24, column: 3, scope: !9)
!35 = !DILocalVariable(name: "failed", scope: !9, file: !3, line: 23, type: !7)
!36 = !DILocation(line: 23, column: 3, scope: !9)
!37 = !DILocation(line: 26, column: 3, scope: !9)
!38 = !DILocation(line: 27, column: 5, scope: !39)
!39 = distinct !DILexicalBlock(scope: !9, file: !3, line: 26, column: 22)
!40 = !DILocation(line: 29, column: 3, scope: !9)
!41 = !DILocation(line: 30, column: 5, scope: !42)
!42 = distinct !DILexicalBlock(scope: !9, file: !3, line: 29, column: 27)
!43 = !DILocation(line: 38, column: 5, scope: !30)
!44 = !DILocation(line: 39, column: 7, scope: !45)
!45 = distinct !DILexicalBlock(scope: !30, file: !3, line: 38, column: 23)
!46 = !DILocation(line: 41, column: 5, scope: !30)
!47 = !DILocation(line: 42, column: 7, scope: !48)
!48 = distinct !DILexicalBlock(scope: !30, file: !3, line: 41, column: 29)
!49 = !DILocation(line: 47, column: 3, scope: !9)
!50 = !DILocation(line: 48, column: 5, scope: !51)
!51 = distinct !DILexicalBlock(scope: !9, file: !3, line: 47, column: 27)
!52 = !DILocation(line: 50, column: 3, scope: !9)
!53 = !DILocation(line: 51, column: 5, scope: !54)
!54 = distinct !DILexicalBlock(scope: !9, file: !3, line: 50, column: 25)
!55 = !DILocation(line: 59, column: 5, scope: !23)
!56 = !DILocation(line: 60, column: 7, scope: !57)
!57 = distinct !DILexicalBlock(scope: !23, file: !3, line: 59, column: 18)
!58 = !DILocation(line: 62, column: 5, scope: !23)
!59 = !DILocation(line: 63, column: 7, scope: !60)
!60 = distinct !DILexicalBlock(scope: !23, file: !3, line: 62, column: 30)
!61 = !DILocation(line: 74, column: 5, scope: !16)
!62 = !DILocation(line: 75, column: 5, scope: !16)
!63 = !DILocation(line: 76, column: 5, scope: !16)
!64 = !DILocation(line: 77, column: 7, scope: !65)
!65 = distinct !DILexicalBlock(scope: !16, file: !3, line: 76, column: 27)
!66 = !DILocation(line: 79, column: 5, scope: !16)
!67 = !DILocation(line: 80, column: 7, scope: !68)
!68 = distinct !DILexicalBlock(scope: !16, file: !3, line: 79, column: 29)
!69 = !DILocation(line: 91, column: 7, scope: !11)
!70 = !DILocation(line: 92, column: 9, scope: !71)
!71 = distinct !DILexicalBlock(scope: !11, file: !3, line: 91, column: 19)
!72 = !DILocation(line: 94, column: 7, scope: !11)
!73 = !DILocation(line: 95, column: 9, scope: !74)
!74 = distinct !DILexicalBlock(scope: !11, file: !3, line: 94, column: 32)
!75 = !DILocation(line: 100, column: 3, scope: !9)
!76 = !DILocation(line: 101, column: 5, scope: !77)
!77 = distinct !DILexicalBlock(scope: !9, file: !3, line: 100, column: 20)
!78 = !DILocation(line: 102, column: 5, scope: !77)
!79 = !DILocation(line: 104, column: 3, scope: !9)
!80 = !DILocation(line: 105, column: 3, scope: !9)
