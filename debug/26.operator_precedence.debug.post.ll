; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [31 x i8] c"26.operator_precedence.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"26.operator_precedence.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define void @subFunc(i32 %0) !dbg !2 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !8, !DIExpression(), !9)
  store i32 %0, ptr %i, align 4, !dbg !9
  ret void, !dbg !9
}

define i32 @main() !dbg !10 {
entry:
  %decB = alloca i32, align 4
    #dbg_declare(ptr %decB, !13, !DIExpression(), !14)
  %decA = alloca i32, align 4
    #dbg_declare(ptr %decA, !15, !DIExpression(), !16)
  %incB = alloca i32, align 4
    #dbg_declare(ptr %incB, !17, !DIExpression(), !18)
  %incA = alloca i32, align 4
    #dbg_declare(ptr %incA, !19, !DIExpression(), !20)
  %callI = alloca i64, align 8
    #dbg_declare(ptr %callI, !21, !DIExpression(), !23)
  %mulC = alloca ptr, align 8
    #dbg_declare(ptr %mulC, !24, !DIExpression(), !26)
  %mulB = alloca i32, align 4
    #dbg_declare(ptr %mulB, !27, !DIExpression(), !28)
  %mulA = alloca i32, align 4
    #dbg_declare(ptr %mulA, !29, !DIExpression(), !30)
  %minusA = alloca i32, align 4
    #dbg_declare(ptr %minusA, !31, !DIExpression(), !32)
  %plusA = alloca i32, align 4
    #dbg_declare(ptr %plusA, !33, !DIExpression(), !34)
  %d = alloca i64, align 8
    #dbg_declare(ptr %d, !35, !DIExpression(), !37)
  %c = alloca i64, align 8
    #dbg_declare(ptr %c, !38, !DIExpression(), !39)
  %b = alloca i64, align 8
    #dbg_declare(ptr %b, !40, !DIExpression(), !41)
  %a = alloca i64, align 8
    #dbg_declare(ptr %a, !42, !DIExpression(), !43)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !44, !DIExpression(), !45)
  store i32 0, ptr %err, align 4, !dbg !45
  store i64 1311768465173141112, ptr %a, align 4, !dbg !43
  store i64 -7296712171277459728, ptr %b, align 4, !dbg !41
  %0 = ptrtoint ptr %a to i64, !dbg !39
  store i64 %0, ptr %c, align 4, !dbg !39
  %1 = ptrtoint ptr %c to i64, !dbg !37
  %2 = load i64, ptr %a, align 4, !dbg !37
  %3 = and i64 %1, %2, !dbg !37
  %4 = load i64, ptr %b, align 4, !dbg !37
  %5 = and i64 %3, %4, !dbg !37
  store i64 %5, ptr %d, align 4, !dbg !37
  %6 = load i64, ptr %a, align 4, !dbg !46
  %7 = icmp ne i64 %6, 1311768465173141112, !dbg !46
  br i1 %7, label %then, label %else, !dbg !46

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !47
  %8 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end, !dbg !47

else:                                             ; preds = %entry
  br label %if.end, !dbg !47

if.end:                                           ; preds = %else, %then
  %9 = load i64, ptr %b, align 4, !dbg !48
  %10 = icmp ne i64 %9, -7296712171277459728, !dbg !48
  br i1 %10, label %then1, label %else2, !dbg !48

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !49
  %11 = load i32, ptr %err, align 4, !dbg !49
  br label %if.end3, !dbg !49

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !49

if.end3:                                          ; preds = %else2, %then1
  store i32 13, ptr %plusA, align 4, !dbg !34
  %12 = load i32, ptr %plusA, align 4, !dbg !50
  %13 = add i32 3, %12, !dbg !50
  %14 = icmp ne i32 %13, 16, !dbg !50
  br i1 %14, label %then4, label %else5, !dbg !50

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !51
  %15 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end6, !dbg !51

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !51

if.end6:                                          ; preds = %else5, %then4
  %16 = load i32, ptr %plusA, align 4, !dbg !52
  %17 = sub i32 3, %16, !dbg !52
  %18 = icmp ne i32 %17, -10, !dbg !52
  br i1 %18, label %then7, label %else8, !dbg !52

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !53
  %19 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end9, !dbg !53

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !53

if.end9:                                          ; preds = %else8, %then7
  br i1 false, label %then10, label %else11, !dbg !54

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !55
  %20 = load i32, ptr %err, align 4, !dbg !55
  br label %if.end12, !dbg !55

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !55

if.end12:                                         ; preds = %else11, %then10
  br i1 false, label %then13, label %else14, !dbg !56

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !57
  %21 = load i32, ptr %err, align 4, !dbg !57
  br label %if.end15, !dbg !57

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !57

if.end15:                                         ; preds = %else14, %then13
  store i32 13, ptr %minusA, align 4, !dbg !32
  %22 = load i32, ptr %minusA, align 4, !dbg !58
  %23 = sub i32 0, %22, !dbg !58
  %24 = sub i32 3, %23, !dbg !58
  %25 = icmp ne i32 %24, 16, !dbg !58
  br i1 %25, label %then16, label %else17, !dbg !58

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !59
  %26 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end18, !dbg !59

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !59

if.end18:                                         ; preds = %else17, %then16
  br i1 false, label %then19, label %else20, !dbg !60

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !61
  %27 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end21, !dbg !61

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !61

if.end21:                                         ; preds = %else20, %then19
  store i32 3, ptr %mulA, align 4, !dbg !30
  store i32 4, ptr %mulB, align 4, !dbg !28
  store ptr %mulB, ptr %mulC, align 8, !dbg !26
  %28 = load i32, ptr %mulA, align 4, !dbg !62
  %29 = load i32, ptr %mulB, align 4, !dbg !62
  %30 = mul i32 %28, %29, !dbg !62
  %31 = load ptr, ptr %mulC, align 8, !dbg !62
  %32 = load i32, ptr %31, align 4, !dbg !62
  %33 = mul i32 %30, %32, !dbg !62
  %34 = icmp ne i32 %33, 48, !dbg !62
  br i1 %34, label %then22, label %else23, !dbg !62

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !63
  %35 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end24, !dbg !63

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !63

if.end24:                                         ; preds = %else23, %then22
  store i64 1234, ptr %callI, align 4, !dbg !23
  %36 = load i64, ptr %callI, align 4, !dbg !64
  %37 = trunc i64 %36 to i32, !dbg !64
  call void @subFunc(i32 %37), !dbg !64
  %38 = load i64, ptr %callI, align 4, !dbg !65
  %39 = trunc i64 %38 to i32, !dbg !65
  %40 = icmp ne i32 %39, 1234, !dbg !65
  br i1 %40, label %then25, label %else26, !dbg !65

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !66
  %41 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end27, !dbg !66

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !66

if.end27:                                         ; preds = %else26, %then25
  store i32 10, ptr %incA, align 4, !dbg !20
  %42 = load i32, ptr %incA, align 4, !dbg !18
  %43 = add i32 %42, 1, !dbg !18
  store i32 %43, ptr %incA, align 4, !dbg !18
  %44 = load i32, ptr %incA, align 4, !dbg !18
  %45 = add i32 %44, 1, !dbg !18
  store i32 %45, ptr %incA, align 4, !dbg !18
  store i32 %44, ptr %incB, align 4, !dbg !18
  %46 = load i32, ptr %incA, align 4, !dbg !67
  %47 = icmp ne i32 %46, 12, !dbg !67
  br i1 %47, label %then28, label %else29, !dbg !67

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !68
  %48 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end30, !dbg !68

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !68

if.end30:                                         ; preds = %else29, %then28
  %49 = load i32, ptr %incB, align 4, !dbg !69
  %50 = icmp ne i32 %49, 11, !dbg !69
  br i1 %50, label %then31, label %else32, !dbg !69

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !70
  %51 = load i32, ptr %err, align 4, !dbg !70
  br label %if.end33, !dbg !70

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !70

if.end33:                                         ; preds = %else32, %then31
  store i32 10, ptr %decA, align 4, !dbg !16
  %52 = load i32, ptr %decA, align 4, !dbg !14
  %53 = sub i32 %52, 1, !dbg !14
  store i32 %53, ptr %decA, align 4, !dbg !14
  %54 = load i32, ptr %decA, align 4, !dbg !14
  %55 = sub i32 %54, 1, !dbg !14
  store i32 %55, ptr %decA, align 4, !dbg !14
  store i32 %54, ptr %decB, align 4, !dbg !14
  %56 = load i32, ptr %decA, align 4, !dbg !71
  %57 = icmp ne i32 %56, 8, !dbg !71
  br i1 %57, label %then34, label %else35, !dbg !71

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !72
  %58 = load i32, ptr %err, align 4, !dbg !72
  br label %if.end36, !dbg !72

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !72

if.end36:                                         ; preds = %else35, %then34
  %59 = load i32, ptr %decB, align 4, !dbg !73
  %60 = icmp ne i32 %59, 9, !dbg !73
  br i1 %60, label %then37, label %else38, !dbg !73

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !74
  %61 = load i32, ptr %err, align 4, !dbg !74
  br label %if.end39, !dbg !74

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !74

if.end39:                                         ; preds = %else38, %then37
  %62 = load i32, ptr %err, align 4, !dbg !75
  %63 = icmp eq i32 %62, 0, !dbg !75
  br i1 %63, label %then40, label %else41, !dbg !75

then40:                                           ; preds = %if.end39
  %64 = call i32 (ptr, ...) @printf(ptr @0), !dbg !76
  br label %if.end42, !dbg !76

else41:                                           ; preds = %if.end39
  %65 = call i32 (ptr, ...) @printf(ptr @1), !dbg !78
  br label %if.end42, !dbg !78

if.end42:                                         ; preds = %else41, %then40
  %66 = load i32, ptr %err, align 4, !dbg !80
  ret i32 %66, !dbg !80
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "26.operator_precedence.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "subFunc", linkageName: "subFunc", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !7)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6}
!5 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{}
!8 = !DILocalVariable(name: "i", arg: 1, scope: !2, file: !1, line: 3, type: !6)
!9 = !DILocation(line: 3, column: 6, scope: !2)
!10 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 5, type: !11, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !7)
!11 = !DISubroutineType(types: !12)
!12 = !{!6}
!13 = !DILocalVariable(name: "decB", scope: !10, file: !1, line: 40, type: !6)
!14 = !DILocation(line: 40, column: 3, scope: !10)
!15 = !DILocalVariable(name: "decA", scope: !10, file: !1, line: 39, type: !6)
!16 = !DILocation(line: 39, column: 3, scope: !10)
!17 = !DILocalVariable(name: "incB", scope: !10, file: !1, line: 35, type: !6)
!18 = !DILocation(line: 35, column: 3, scope: !10)
!19 = !DILocalVariable(name: "incA", scope: !10, file: !1, line: 34, type: !6)
!20 = !DILocation(line: 34, column: 3, scope: !10)
!21 = !DILocalVariable(name: "callI", scope: !10, file: !1, line: 30, type: !22)
!22 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!23 = !DILocation(line: 30, column: 3, scope: !10)
!24 = !DILocalVariable(name: "mulC", scope: !10, file: !1, line: 27, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!26 = !DILocation(line: 27, column: 3, scope: !10)
!27 = !DILocalVariable(name: "mulB", scope: !10, file: !1, line: 26, type: !6)
!28 = !DILocation(line: 26, column: 3, scope: !10)
!29 = !DILocalVariable(name: "mulA", scope: !10, file: !1, line: 25, type: !6)
!30 = !DILocation(line: 25, column: 3, scope: !10)
!31 = !DILocalVariable(name: "minusA", scope: !10, file: !1, line: 21, type: !6)
!32 = !DILocation(line: 21, column: 3, scope: !10)
!33 = !DILocalVariable(name: "plusA", scope: !10, file: !1, line: 15, type: !6)
!34 = !DILocation(line: 15, column: 3, scope: !10)
!35 = !DILocalVariable(name: "d", scope: !10, file: !1, line: 11, type: !36)
!36 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 11, column: 3, scope: !10)
!38 = !DILocalVariable(name: "c", scope: !10, file: !1, line: 10, type: !36)
!39 = !DILocation(line: 10, column: 3, scope: !10)
!40 = !DILocalVariable(name: "b", scope: !10, file: !1, line: 9, type: !36)
!41 = !DILocation(line: 9, column: 3, scope: !10)
!42 = !DILocalVariable(name: "a", scope: !10, file: !1, line: 8, type: !36)
!43 = !DILocation(line: 8, column: 3, scope: !10)
!44 = !DILocalVariable(name: "err", scope: !10, file: !1, line: 6, type: !6)
!45 = !DILocation(line: 6, column: 3, scope: !10)
!46 = !DILocation(line: 12, column: 3, scope: !10)
!47 = !DILocation(line: 12, column: 32, scope: !10)
!48 = !DILocation(line: 13, column: 3, scope: !10)
!49 = !DILocation(line: 13, column: 32, scope: !10)
!50 = !DILocation(line: 16, column: 3, scope: !10)
!51 = !DILocation(line: 16, column: 25, scope: !10)
!52 = !DILocation(line: 17, column: 3, scope: !10)
!53 = !DILocation(line: 17, column: 26, scope: !10)
!54 = !DILocation(line: 18, column: 3, scope: !10)
!55 = !DILocation(line: 18, column: 22, scope: !10)
!56 = !DILocation(line: 19, column: 3, scope: !10)
!57 = !DILocation(line: 19, column: 23, scope: !10)
!58 = !DILocation(line: 22, column: 3, scope: !10)
!59 = !DILocation(line: 22, column: 26, scope: !10)
!60 = !DILocation(line: 23, column: 3, scope: !10)
!61 = !DILocation(line: 23, column: 22, scope: !10)
!62 = !DILocation(line: 28, column: 3, scope: !10)
!63 = !DILocation(line: 28, column: 34, scope: !10)
!64 = !DILocation(line: 31, column: 3, scope: !10)
!65 = !DILocation(line: 32, column: 3, scope: !10)
!66 = !DILocation(line: 32, column: 27, scope: !10)
!67 = !DILocation(line: 36, column: 3, scope: !10)
!68 = !DILocation(line: 36, column: 19, scope: !10)
!69 = !DILocation(line: 37, column: 3, scope: !10)
!70 = !DILocation(line: 37, column: 19, scope: !10)
!71 = !DILocation(line: 41, column: 3, scope: !10)
!72 = !DILocation(line: 41, column: 18, scope: !10)
!73 = !DILocation(line: 42, column: 3, scope: !10)
!74 = !DILocation(line: 42, column: 18, scope: !10)
!75 = !DILocation(line: 44, column: 3, scope: !10)
!76 = !DILocation(line: 45, column: 5, scope: !77)
!77 = distinct !DILexicalBlock(scope: !10, file: !1, line: 44, column: 17)
!78 = !DILocation(line: 47, column: 5, scope: !79)
!79 = distinct !DILexicalBlock(scope: !10, file: !1, line: 46, column: 10)
!80 = !DILocation(line: 49, column: 3, scope: !10)
