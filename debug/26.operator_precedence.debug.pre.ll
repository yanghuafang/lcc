; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [31 x i8] c"26.operator_precedence.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"26.operator_precedence.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define void @subFunc(i32 %0) !dbg !2 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !7, !DIExpression(), !8)
  store i32 %0, ptr %i, align 4, !dbg !8
  ret void, !dbg !8
}

define i32 @main() !dbg !9 {
entry:
  %decB = alloca i32, align 4
    #dbg_declare(ptr %decB, !12, !DIExpression(), !13)
  %decA = alloca i32, align 4
    #dbg_declare(ptr %decA, !14, !DIExpression(), !15)
  %incB = alloca i32, align 4
    #dbg_declare(ptr %incB, !16, !DIExpression(), !17)
  %incA = alloca i32, align 4
    #dbg_declare(ptr %incA, !18, !DIExpression(), !19)
  %callI = alloca i64, align 8
    #dbg_declare(ptr %callI, !20, !DIExpression(), !22)
  %mulC = alloca ptr, align 8
    #dbg_declare(ptr %mulC, !23, !DIExpression(), !25)
  %mulB = alloca i32, align 4
    #dbg_declare(ptr %mulB, !26, !DIExpression(), !27)
  %mulA = alloca i32, align 4
    #dbg_declare(ptr %mulA, !28, !DIExpression(), !29)
  %minusA = alloca i32, align 4
    #dbg_declare(ptr %minusA, !30, !DIExpression(), !31)
  %plusA = alloca i32, align 4
    #dbg_declare(ptr %plusA, !32, !DIExpression(), !33)
  %d = alloca i64, align 8
    #dbg_declare(ptr %d, !34, !DIExpression(), !36)
  %c = alloca i64, align 8
    #dbg_declare(ptr %c, !37, !DIExpression(), !38)
  %b = alloca i64, align 8
    #dbg_declare(ptr %b, !39, !DIExpression(), !40)
  %a = alloca i64, align 8
    #dbg_declare(ptr %a, !41, !DIExpression(), !42)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !43, !DIExpression(), !44)
  store i32 0, ptr %err, align 4, !dbg !44
  store i64 1311768465173141112, ptr %a, align 4, !dbg !42
  store i64 -7296712171277459728, ptr %b, align 4, !dbg !40
  %0 = ptrtoint ptr %a to i64, !dbg !38
  store i64 %0, ptr %c, align 4, !dbg !38
  %1 = ptrtoint ptr %c to i64, !dbg !36
  %2 = load i64, ptr %a, align 4, !dbg !36
  %3 = and i64 %1, %2, !dbg !36
  %4 = load i64, ptr %b, align 4, !dbg !36
  %5 = and i64 %3, %4, !dbg !36
  store i64 %5, ptr %d, align 4, !dbg !36
  %6 = load i64, ptr %a, align 4, !dbg !45
  %7 = icmp ne i64 %6, 1311768465173141112, !dbg !45
  br i1 %7, label %then, label %else, !dbg !45

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !46
  %8 = load i32, ptr %err, align 4, !dbg !46
  br label %if.end, !dbg !46

else:                                             ; preds = %entry
  br label %if.end, !dbg !46

if.end:                                           ; preds = %else, %then
  %9 = load i64, ptr %b, align 4, !dbg !47
  %10 = icmp ne i64 %9, -7296712171277459728, !dbg !47
  br i1 %10, label %then1, label %else2, !dbg !47

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !48
  %11 = load i32, ptr %err, align 4, !dbg !48
  br label %if.end3, !dbg !48

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !48

if.end3:                                          ; preds = %else2, %then1
  store i32 13, ptr %plusA, align 4, !dbg !33
  %12 = load i32, ptr %plusA, align 4, !dbg !49
  %13 = add i32 3, %12, !dbg !49
  %14 = icmp ne i32 %13, 16, !dbg !49
  br i1 %14, label %then4, label %else5, !dbg !49

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !50
  %15 = load i32, ptr %err, align 4, !dbg !50
  br label %if.end6, !dbg !50

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !50

if.end6:                                          ; preds = %else5, %then4
  %16 = load i32, ptr %plusA, align 4, !dbg !51
  %17 = sub i32 3, %16, !dbg !51
  %18 = icmp ne i32 %17, -10, !dbg !51
  br i1 %18, label %then7, label %else8, !dbg !51

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !52
  %19 = load i32, ptr %err, align 4, !dbg !52
  br label %if.end9, !dbg !52

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !52

if.end9:                                          ; preds = %else8, %then7
  br i1 false, label %then10, label %else11, !dbg !53

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !54
  %20 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end12, !dbg !54

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !54

if.end12:                                         ; preds = %else11, %then10
  br i1 false, label %then13, label %else14, !dbg !55

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !56
  %21 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end15, !dbg !56

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !56

if.end15:                                         ; preds = %else14, %then13
  store i32 13, ptr %minusA, align 4, !dbg !31
  %22 = load i32, ptr %minusA, align 4, !dbg !57
  %23 = sub i32 0, %22, !dbg !57
  %24 = sub i32 3, %23, !dbg !57
  %25 = icmp ne i32 %24, 16, !dbg !57
  br i1 %25, label %then16, label %else17, !dbg !57

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !58
  %26 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end18, !dbg !58

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !58

if.end18:                                         ; preds = %else17, %then16
  br i1 false, label %then19, label %else20, !dbg !59

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !60
  %27 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end21, !dbg !60

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !60

if.end21:                                         ; preds = %else20, %then19
  store i32 3, ptr %mulA, align 4, !dbg !29
  store i32 4, ptr %mulB, align 4, !dbg !27
  store ptr %mulB, ptr %mulC, align 8, !dbg !25
  %28 = load i32, ptr %mulA, align 4, !dbg !61
  %29 = load i32, ptr %mulB, align 4, !dbg !61
  %30 = mul i32 %28, %29, !dbg !61
  %31 = load ptr, ptr %mulC, align 8, !dbg !61
  %32 = load i32, ptr %31, align 4, !dbg !61
  %33 = mul i32 %30, %32, !dbg !61
  %34 = icmp ne i32 %33, 48, !dbg !61
  br i1 %34, label %then22, label %else23, !dbg !61

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !62
  %35 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end24, !dbg !62

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !62

if.end24:                                         ; preds = %else23, %then22
  store i64 1234, ptr %callI, align 4, !dbg !22
  %36 = load i64, ptr %callI, align 4, !dbg !63
  %37 = trunc i64 %36 to i32, !dbg !63
  call void @subFunc(i32 %37), !dbg !63
  %38 = load i64, ptr %callI, align 4, !dbg !64
  %39 = trunc i64 %38 to i32, !dbg !64
  %40 = icmp ne i32 %39, 1234, !dbg !64
  br i1 %40, label %then25, label %else26, !dbg !64

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !65
  %41 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end27, !dbg !65

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !65

if.end27:                                         ; preds = %else26, %then25
  store i32 10, ptr %incA, align 4, !dbg !19
  %42 = load i32, ptr %incA, align 4, !dbg !17
  %43 = add i32 %42, 1, !dbg !17
  store i32 %43, ptr %incA, align 4, !dbg !17
  %44 = load i32, ptr %incA, align 4, !dbg !17
  %45 = add i32 %44, 1, !dbg !17
  store i32 %45, ptr %incA, align 4, !dbg !17
  store i32 %44, ptr %incB, align 4, !dbg !17
  %46 = load i32, ptr %incA, align 4, !dbg !66
  %47 = icmp ne i32 %46, 12, !dbg !66
  br i1 %47, label %then28, label %else29, !dbg !66

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !67
  %48 = load i32, ptr %err, align 4, !dbg !67
  br label %if.end30, !dbg !67

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !67

if.end30:                                         ; preds = %else29, %then28
  %49 = load i32, ptr %incB, align 4, !dbg !68
  %50 = icmp ne i32 %49, 11, !dbg !68
  br i1 %50, label %then31, label %else32, !dbg !68

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !69
  %51 = load i32, ptr %err, align 4, !dbg !69
  br label %if.end33, !dbg !69

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !69

if.end33:                                         ; preds = %else32, %then31
  store i32 10, ptr %decA, align 4, !dbg !15
  %52 = load i32, ptr %decA, align 4, !dbg !13
  %53 = sub i32 %52, 1, !dbg !13
  store i32 %53, ptr %decA, align 4, !dbg !13
  %54 = load i32, ptr %decA, align 4, !dbg !13
  %55 = sub i32 %54, 1, !dbg !13
  store i32 %55, ptr %decA, align 4, !dbg !13
  store i32 %54, ptr %decB, align 4, !dbg !13
  %56 = load i32, ptr %decA, align 4, !dbg !70
  %57 = icmp ne i32 %56, 8, !dbg !70
  br i1 %57, label %then34, label %else35, !dbg !70

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !71
  %58 = load i32, ptr %err, align 4, !dbg !71
  br label %if.end36, !dbg !71

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !71

if.end36:                                         ; preds = %else35, %then34
  %59 = load i32, ptr %decB, align 4, !dbg !72
  %60 = icmp ne i32 %59, 9, !dbg !72
  br i1 %60, label %then37, label %else38, !dbg !72

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !73
  %61 = load i32, ptr %err, align 4, !dbg !73
  br label %if.end39, !dbg !73

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !73

if.end39:                                         ; preds = %else38, %then37
  %62 = load i32, ptr %err, align 4, !dbg !74
  %63 = icmp eq i32 %62, 0, !dbg !74
  br i1 %63, label %then40, label %else41, !dbg !74

then40:                                           ; preds = %if.end39
  %64 = call i32 (ptr, ...) @printf(ptr @0), !dbg !75
  br label %if.end42, !dbg !75

else41:                                           ; preds = %if.end39
  %65 = call i32 (ptr, ...) @printf(ptr @1), !dbg !77
  br label %if.end42, !dbg !77

if.end42:                                         ; preds = %else41, %then40
  %66 = load i32, ptr %err, align 4, !dbg !79
  ret i32 %66, !dbg !79
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "26.operator_precedence.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "subFunc", linkageName: "subFunc", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6}
!5 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DILocalVariable(name: "i", arg: 1, scope: !2, file: !1, line: 3, type: !6)
!8 = !DILocation(line: 3, column: 6, scope: !2)
!9 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 5, type: !10, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DISubroutineType(types: !11)
!11 = !{!6}
!12 = !DILocalVariable(name: "decB", scope: !9, file: !1, line: 40, type: !6)
!13 = !DILocation(line: 40, column: 3, scope: !9)
!14 = !DILocalVariable(name: "decA", scope: !9, file: !1, line: 39, type: !6)
!15 = !DILocation(line: 39, column: 3, scope: !9)
!16 = !DILocalVariable(name: "incB", scope: !9, file: !1, line: 35, type: !6)
!17 = !DILocation(line: 35, column: 3, scope: !9)
!18 = !DILocalVariable(name: "incA", scope: !9, file: !1, line: 34, type: !6)
!19 = !DILocation(line: 34, column: 3, scope: !9)
!20 = !DILocalVariable(name: "callI", scope: !9, file: !1, line: 30, type: !21)
!21 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!22 = !DILocation(line: 30, column: 3, scope: !9)
!23 = !DILocalVariable(name: "mulC", scope: !9, file: !1, line: 27, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!25 = !DILocation(line: 27, column: 3, scope: !9)
!26 = !DILocalVariable(name: "mulB", scope: !9, file: !1, line: 26, type: !6)
!27 = !DILocation(line: 26, column: 3, scope: !9)
!28 = !DILocalVariable(name: "mulA", scope: !9, file: !1, line: 25, type: !6)
!29 = !DILocation(line: 25, column: 3, scope: !9)
!30 = !DILocalVariable(name: "minusA", scope: !9, file: !1, line: 21, type: !6)
!31 = !DILocation(line: 21, column: 3, scope: !9)
!32 = !DILocalVariable(name: "plusA", scope: !9, file: !1, line: 15, type: !6)
!33 = !DILocation(line: 15, column: 3, scope: !9)
!34 = !DILocalVariable(name: "d", scope: !9, file: !1, line: 11, type: !35)
!35 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 11, column: 3, scope: !9)
!37 = !DILocalVariable(name: "c", scope: !9, file: !1, line: 10, type: !35)
!38 = !DILocation(line: 10, column: 3, scope: !9)
!39 = !DILocalVariable(name: "b", scope: !9, file: !1, line: 9, type: !35)
!40 = !DILocation(line: 9, column: 3, scope: !9)
!41 = !DILocalVariable(name: "a", scope: !9, file: !1, line: 8, type: !35)
!42 = !DILocation(line: 8, column: 3, scope: !9)
!43 = !DILocalVariable(name: "err", scope: !9, file: !1, line: 6, type: !6)
!44 = !DILocation(line: 6, column: 3, scope: !9)
!45 = !DILocation(line: 12, column: 3, scope: !9)
!46 = !DILocation(line: 12, column: 32, scope: !9)
!47 = !DILocation(line: 13, column: 3, scope: !9)
!48 = !DILocation(line: 13, column: 32, scope: !9)
!49 = !DILocation(line: 16, column: 3, scope: !9)
!50 = !DILocation(line: 16, column: 25, scope: !9)
!51 = !DILocation(line: 17, column: 3, scope: !9)
!52 = !DILocation(line: 17, column: 26, scope: !9)
!53 = !DILocation(line: 18, column: 3, scope: !9)
!54 = !DILocation(line: 18, column: 22, scope: !9)
!55 = !DILocation(line: 19, column: 3, scope: !9)
!56 = !DILocation(line: 19, column: 23, scope: !9)
!57 = !DILocation(line: 22, column: 3, scope: !9)
!58 = !DILocation(line: 22, column: 26, scope: !9)
!59 = !DILocation(line: 23, column: 3, scope: !9)
!60 = !DILocation(line: 23, column: 22, scope: !9)
!61 = !DILocation(line: 28, column: 3, scope: !9)
!62 = !DILocation(line: 28, column: 34, scope: !9)
!63 = !DILocation(line: 31, column: 3, scope: !9)
!64 = !DILocation(line: 32, column: 3, scope: !9)
!65 = !DILocation(line: 32, column: 27, scope: !9)
!66 = !DILocation(line: 36, column: 3, scope: !9)
!67 = !DILocation(line: 36, column: 19, scope: !9)
!68 = !DILocation(line: 37, column: 3, scope: !9)
!69 = !DILocation(line: 37, column: 19, scope: !9)
!70 = !DILocation(line: 41, column: 3, scope: !9)
!71 = !DILocation(line: 41, column: 18, scope: !9)
!72 = !DILocation(line: 42, column: 3, scope: !9)
!73 = !DILocation(line: 42, column: 18, scope: !9)
!74 = !DILocation(line: 44, column: 3, scope: !9)
!75 = !DILocation(line: 45, column: 5, scope: !76)
!76 = distinct !DILexicalBlock(scope: !9, file: !1, line: 44, column: 17)
!77 = !DILocation(line: 47, column: 5, scope: !78)
!78 = distinct !DILexicalBlock(scope: !9, file: !1, line: 46, column: 10)
!79 = !DILocation(line: 49, column: 3, scope: !9)
