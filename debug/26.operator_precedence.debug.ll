; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [31 x i8] c"26.operator_precedence.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"26.operator_precedence.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define void @subFunc(i32 %0) !dbg !4 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !10, !DIExpression(), !11)
  store i32 %0, ptr %i, align 4, !dbg !11
  ret void, !dbg !11
}

define i32 @main() !dbg !12 {
entry:
  %decB = alloca i32, align 4
    #dbg_declare(ptr %decB, !15, !DIExpression(), !16)
  %decA = alloca i32, align 4
    #dbg_declare(ptr %decA, !17, !DIExpression(), !18)
  %incB = alloca i32, align 4
    #dbg_declare(ptr %incB, !19, !DIExpression(), !20)
  %incA = alloca i32, align 4
    #dbg_declare(ptr %incA, !21, !DIExpression(), !22)
  %callI = alloca i64, align 8
    #dbg_declare(ptr %callI, !23, !DIExpression(), !25)
  %mulC = alloca ptr, align 8
    #dbg_declare(ptr %mulC, !26, !DIExpression(), !28)
  %mulB = alloca i32, align 4
    #dbg_declare(ptr %mulB, !29, !DIExpression(), !30)
  %mulA = alloca i32, align 4
    #dbg_declare(ptr %mulA, !31, !DIExpression(), !32)
  %minusA = alloca i32, align 4
    #dbg_declare(ptr %minusA, !33, !DIExpression(), !34)
  %plusA = alloca i32, align 4
    #dbg_declare(ptr %plusA, !35, !DIExpression(), !36)
  %d = alloca i64, align 8
    #dbg_declare(ptr %d, !37, !DIExpression(), !39)
  %c = alloca i64, align 8
    #dbg_declare(ptr %c, !40, !DIExpression(), !41)
  %b = alloca i64, align 8
    #dbg_declare(ptr %b, !42, !DIExpression(), !43)
  %a = alloca i64, align 8
    #dbg_declare(ptr %a, !44, !DIExpression(), !45)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !46, !DIExpression(), !47)
  store i32 0, ptr %err, align 4, !dbg !47
  store i64 1311768465173141112, ptr %a, align 4, !dbg !45
  store i64 -7296712171277459728, ptr %b, align 4, !dbg !43
  %0 = ptrtoint ptr %a to i64, !dbg !41
  store i64 %0, ptr %c, align 4, !dbg !41
  %1 = ptrtoint ptr %c to i64, !dbg !39
  %2 = load i64, ptr %a, align 4, !dbg !39
  %3 = and i64 %1, %2, !dbg !39
  %4 = load i64, ptr %b, align 4, !dbg !39
  %5 = and i64 %3, %4, !dbg !39
  store i64 %5, ptr %d, align 4, !dbg !39
  %6 = load i64, ptr %a, align 4, !dbg !48
  %7 = icmp ne i64 %6, 1311768465173141112, !dbg !48
  br i1 %7, label %then, label %else, !dbg !48

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !49
  %8 = load i32, ptr %err, align 4, !dbg !49
  br label %if.end, !dbg !49

else:                                             ; preds = %entry
  br label %if.end, !dbg !49

if.end:                                           ; preds = %else, %then
  %9 = load i64, ptr %b, align 4, !dbg !50
  %10 = icmp ne i64 %9, -7296712171277459728, !dbg !50
  br i1 %10, label %then1, label %else2, !dbg !50

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !51
  %11 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end3, !dbg !51

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !51

if.end3:                                          ; preds = %else2, %then1
  store i32 13, ptr %plusA, align 4, !dbg !36
  %12 = load i32, ptr %plusA, align 4, !dbg !52
  %13 = add i32 3, %12, !dbg !52
  %14 = icmp ne i32 %13, 16, !dbg !52
  br i1 %14, label %then4, label %else5, !dbg !52

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !53
  %15 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end6, !dbg !53

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !53

if.end6:                                          ; preds = %else5, %then4
  %16 = load i32, ptr %plusA, align 4, !dbg !54
  %17 = sub i32 3, %16, !dbg !54
  %18 = icmp ne i32 %17, -10, !dbg !54
  br i1 %18, label %then7, label %else8, !dbg !54

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !55
  %19 = load i32, ptr %err, align 4, !dbg !55
  br label %if.end9, !dbg !55

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !55

if.end9:                                          ; preds = %else8, %then7
  br i1 false, label %then10, label %else11, !dbg !56

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !57
  %20 = load i32, ptr %err, align 4, !dbg !57
  br label %if.end12, !dbg !57

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !57

if.end12:                                         ; preds = %else11, %then10
  br i1 false, label %then13, label %else14, !dbg !58

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !59
  %21 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end15, !dbg !59

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !59

if.end15:                                         ; preds = %else14, %then13
  store i32 13, ptr %minusA, align 4, !dbg !34
  %22 = load i32, ptr %minusA, align 4, !dbg !60
  %23 = sub i32 0, %22, !dbg !60
  %24 = sub i32 3, %23, !dbg !60
  %25 = icmp ne i32 %24, 16, !dbg !60
  br i1 %25, label %then16, label %else17, !dbg !60

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !61
  %26 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end18, !dbg !61

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !61

if.end18:                                         ; preds = %else17, %then16
  br i1 false, label %then19, label %else20, !dbg !62

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !63
  %27 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end21, !dbg !63

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !63

if.end21:                                         ; preds = %else20, %then19
  store i32 3, ptr %mulA, align 4, !dbg !32
  store i32 4, ptr %mulB, align 4, !dbg !30
  store ptr %mulB, ptr %mulC, align 8, !dbg !28
  %28 = load i32, ptr %mulA, align 4, !dbg !64
  %29 = load i32, ptr %mulB, align 4, !dbg !64
  %30 = mul i32 %28, %29, !dbg !64
  %31 = load ptr, ptr %mulC, align 8, !dbg !64
  %32 = load i32, ptr %31, align 4, !dbg !64
  %33 = mul i32 %30, %32, !dbg !64
  %34 = icmp ne i32 %33, 48, !dbg !64
  br i1 %34, label %then22, label %else23, !dbg !64

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !65
  %35 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end24, !dbg !65

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !65

if.end24:                                         ; preds = %else23, %then22
  store i64 1234, ptr %callI, align 4, !dbg !25
  %36 = load i64, ptr %callI, align 4, !dbg !66
  %37 = trunc i64 %36 to i32, !dbg !66
  call void @subFunc(i32 %37), !dbg !66
  %38 = load i64, ptr %callI, align 4, !dbg !67
  %39 = trunc i64 %38 to i32, !dbg !67
  %40 = icmp ne i32 %39, 1234, !dbg !67
  br i1 %40, label %then25, label %else26, !dbg !67

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !68
  %41 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end27, !dbg !68

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !68

if.end27:                                         ; preds = %else26, %then25
  store i32 10, ptr %incA, align 4, !dbg !22
  %42 = load i32, ptr %incA, align 4, !dbg !20
  %43 = add i32 %42, 1, !dbg !20
  store i32 %43, ptr %incA, align 4, !dbg !20
  %44 = load i32, ptr %incA, align 4, !dbg !20
  %45 = add i32 %44, 1, !dbg !20
  store i32 %45, ptr %incA, align 4, !dbg !20
  store i32 %44, ptr %incB, align 4, !dbg !20
  %46 = load i32, ptr %incA, align 4, !dbg !69
  %47 = icmp ne i32 %46, 12, !dbg !69
  br i1 %47, label %then28, label %else29, !dbg !69

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !70
  %48 = load i32, ptr %err, align 4, !dbg !70
  br label %if.end30, !dbg !70

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !70

if.end30:                                         ; preds = %else29, %then28
  %49 = load i32, ptr %incB, align 4, !dbg !71
  %50 = icmp ne i32 %49, 11, !dbg !71
  br i1 %50, label %then31, label %else32, !dbg !71

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !72
  %51 = load i32, ptr %err, align 4, !dbg !72
  br label %if.end33, !dbg !72

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !72

if.end33:                                         ; preds = %else32, %then31
  store i32 10, ptr %decA, align 4, !dbg !18
  %52 = load i32, ptr %decA, align 4, !dbg !16
  %53 = sub i32 %52, 1, !dbg !16
  store i32 %53, ptr %decA, align 4, !dbg !16
  %54 = load i32, ptr %decA, align 4, !dbg !16
  %55 = sub i32 %54, 1, !dbg !16
  store i32 %55, ptr %decA, align 4, !dbg !16
  store i32 %54, ptr %decB, align 4, !dbg !16
  %56 = load i32, ptr %decA, align 4, !dbg !73
  %57 = icmp ne i32 %56, 8, !dbg !73
  br i1 %57, label %then34, label %else35, !dbg !73

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !74
  %58 = load i32, ptr %err, align 4, !dbg !74
  br label %if.end36, !dbg !74

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !74

if.end36:                                         ; preds = %else35, %then34
  %59 = load i32, ptr %decB, align 4, !dbg !75
  %60 = icmp ne i32 %59, 9, !dbg !75
  br i1 %60, label %then37, label %else38, !dbg !75

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !76
  %61 = load i32, ptr %err, align 4, !dbg !76
  br label %if.end39, !dbg !76

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !76

if.end39:                                         ; preds = %else38, %then37
  %62 = load i32, ptr %err, align 4, !dbg !77
  %63 = icmp eq i32 %62, 0, !dbg !77
  br i1 %63, label %then40, label %else41, !dbg !77

then40:                                           ; preds = %if.end39
  %64 = call i32 (ptr, ...) @printf(ptr @0), !dbg !78
  br label %if.end42, !dbg !78

else41:                                           ; preds = %if.end39
  %65 = call i32 (ptr, ...) @printf(ptr @1), !dbg !80
  br label %if.end42, !dbg !80

if.end42:                                         ; preds = %else41, %then40
  %66 = load i32, ptr %err, align 4, !dbg !82
  ret i32 %66, !dbg !82
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "26.operator_precedence.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "subFunc", linkageName: "subFunc", scope: null, file: !1, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !9)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !8}
!7 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{}
!10 = !DILocalVariable(name: "i", arg: 1, scope: !4, file: !1, line: 6, type: !8)
!11 = !DILocation(line: 6, column: 6, scope: !4)
!12 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 8, type: !13, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !9)
!13 = !DISubroutineType(types: !14)
!14 = !{!8}
!15 = !DILocalVariable(name: "decB", scope: !12, file: !1, line: 43, type: !8)
!16 = !DILocation(line: 43, column: 3, scope: !12)
!17 = !DILocalVariable(name: "decA", scope: !12, file: !1, line: 42, type: !8)
!18 = !DILocation(line: 42, column: 3, scope: !12)
!19 = !DILocalVariable(name: "incB", scope: !12, file: !1, line: 38, type: !8)
!20 = !DILocation(line: 38, column: 3, scope: !12)
!21 = !DILocalVariable(name: "incA", scope: !12, file: !1, line: 37, type: !8)
!22 = !DILocation(line: 37, column: 3, scope: !12)
!23 = !DILocalVariable(name: "callI", scope: !12, file: !1, line: 33, type: !24)
!24 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!25 = !DILocation(line: 33, column: 3, scope: !12)
!26 = !DILocalVariable(name: "mulC", scope: !12, file: !1, line: 30, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!28 = !DILocation(line: 30, column: 3, scope: !12)
!29 = !DILocalVariable(name: "mulB", scope: !12, file: !1, line: 29, type: !8)
!30 = !DILocation(line: 29, column: 3, scope: !12)
!31 = !DILocalVariable(name: "mulA", scope: !12, file: !1, line: 28, type: !8)
!32 = !DILocation(line: 28, column: 3, scope: !12)
!33 = !DILocalVariable(name: "minusA", scope: !12, file: !1, line: 24, type: !8)
!34 = !DILocation(line: 24, column: 3, scope: !12)
!35 = !DILocalVariable(name: "plusA", scope: !12, file: !1, line: 18, type: !8)
!36 = !DILocation(line: 18, column: 3, scope: !12)
!37 = !DILocalVariable(name: "d", scope: !12, file: !1, line: 14, type: !38)
!38 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 14, column: 3, scope: !12)
!40 = !DILocalVariable(name: "c", scope: !12, file: !1, line: 13, type: !38)
!41 = !DILocation(line: 13, column: 3, scope: !12)
!42 = !DILocalVariable(name: "b", scope: !12, file: !1, line: 12, type: !38)
!43 = !DILocation(line: 12, column: 3, scope: !12)
!44 = !DILocalVariable(name: "a", scope: !12, file: !1, line: 11, type: !38)
!45 = !DILocation(line: 11, column: 3, scope: !12)
!46 = !DILocalVariable(name: "err", scope: !12, file: !1, line: 9, type: !8)
!47 = !DILocation(line: 9, column: 3, scope: !12)
!48 = !DILocation(line: 15, column: 3, scope: !12)
!49 = !DILocation(line: 15, column: 32, scope: !12)
!50 = !DILocation(line: 16, column: 3, scope: !12)
!51 = !DILocation(line: 16, column: 32, scope: !12)
!52 = !DILocation(line: 19, column: 3, scope: !12)
!53 = !DILocation(line: 19, column: 25, scope: !12)
!54 = !DILocation(line: 20, column: 3, scope: !12)
!55 = !DILocation(line: 20, column: 26, scope: !12)
!56 = !DILocation(line: 21, column: 3, scope: !12)
!57 = !DILocation(line: 21, column: 22, scope: !12)
!58 = !DILocation(line: 22, column: 3, scope: !12)
!59 = !DILocation(line: 22, column: 23, scope: !12)
!60 = !DILocation(line: 25, column: 3, scope: !12)
!61 = !DILocation(line: 25, column: 26, scope: !12)
!62 = !DILocation(line: 26, column: 3, scope: !12)
!63 = !DILocation(line: 26, column: 22, scope: !12)
!64 = !DILocation(line: 31, column: 3, scope: !12)
!65 = !DILocation(line: 31, column: 34, scope: !12)
!66 = !DILocation(line: 34, column: 3, scope: !12)
!67 = !DILocation(line: 35, column: 3, scope: !12)
!68 = !DILocation(line: 35, column: 27, scope: !12)
!69 = !DILocation(line: 39, column: 3, scope: !12)
!70 = !DILocation(line: 39, column: 19, scope: !12)
!71 = !DILocation(line: 40, column: 3, scope: !12)
!72 = !DILocation(line: 40, column: 19, scope: !12)
!73 = !DILocation(line: 44, column: 3, scope: !12)
!74 = !DILocation(line: 44, column: 18, scope: !12)
!75 = !DILocation(line: 45, column: 3, scope: !12)
!76 = !DILocation(line: 45, column: 18, scope: !12)
!77 = !DILocation(line: 47, column: 3, scope: !12)
!78 = !DILocation(line: 48, column: 5, scope: !79)
!79 = distinct !DILexicalBlock(scope: !12, file: !1, line: 47, column: 17)
!80 = !DILocation(line: 50, column: 5, scope: !81)
!81 = distinct !DILexicalBlock(scope: !12, file: !1, line: 49, column: 10)
!82 = !DILocation(line: 52, column: 3, scope: !12)
