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
    #dbg_declare(ptr %i, !9, !DIExpression(), !10)
  store i32 %0, ptr %i, align 4, !dbg !10
  ret void, !dbg !10
}

define i32 @main() !dbg !11 {
entry:
  %decB = alloca i32, align 4
    #dbg_declare(ptr %decB, !14, !DIExpression(), !15)
  %decA = alloca i32, align 4
    #dbg_declare(ptr %decA, !16, !DIExpression(), !17)
  %incB = alloca i32, align 4
    #dbg_declare(ptr %incB, !18, !DIExpression(), !19)
  %incA = alloca i32, align 4
    #dbg_declare(ptr %incA, !20, !DIExpression(), !21)
  %callI = alloca i64, align 8
    #dbg_declare(ptr %callI, !22, !DIExpression(), !24)
  %mulC = alloca ptr, align 8
    #dbg_declare(ptr %mulC, !25, !DIExpression(), !27)
  %mulB = alloca i32, align 4
    #dbg_declare(ptr %mulB, !28, !DIExpression(), !29)
  %mulA = alloca i32, align 4
    #dbg_declare(ptr %mulA, !30, !DIExpression(), !31)
  %minusA = alloca i32, align 4
    #dbg_declare(ptr %minusA, !32, !DIExpression(), !33)
  %plusA = alloca i32, align 4
    #dbg_declare(ptr %plusA, !34, !DIExpression(), !35)
  %d = alloca i64, align 8
    #dbg_declare(ptr %d, !36, !DIExpression(), !38)
  %c = alloca i64, align 8
    #dbg_declare(ptr %c, !39, !DIExpression(), !40)
  %b = alloca i64, align 8
    #dbg_declare(ptr %b, !41, !DIExpression(), !42)
  %a = alloca i64, align 8
    #dbg_declare(ptr %a, !43, !DIExpression(), !44)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !45, !DIExpression(), !46)
  store i32 0, ptr %err, align 4, !dbg !46
  store i64 1311768465173141112, ptr %a, align 8, !dbg !44
  store i64 -7296712171277459728, ptr %b, align 8, !dbg !42
  %0 = ptrtoint ptr %a to i64, !dbg !40
  store i64 %0, ptr %c, align 8, !dbg !40
  %1 = ptrtoint ptr %c to i64, !dbg !38
  %2 = load i64, ptr %a, align 8, !dbg !38
  %3 = and i64 %1, %2, !dbg !38
  %4 = load i64, ptr %b, align 8, !dbg !38
  %5 = and i64 %3, %4, !dbg !38
  store i64 %5, ptr %d, align 8, !dbg !38
  %6 = load i64, ptr %a, align 8, !dbg !47
  %7 = icmp ne i64 %6, 1311768465173141112, !dbg !47
  br i1 %7, label %then, label %else, !dbg !47

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !48
  %8 = load i32, ptr %err, align 4, !dbg !48
  br label %if.end, !dbg !48

else:                                             ; preds = %entry
  br label %if.end, !dbg !48

if.end:                                           ; preds = %else, %then
  %9 = load i64, ptr %b, align 8, !dbg !49
  %10 = icmp ne i64 %9, -7296712171277459728, !dbg !49
  br i1 %10, label %then1, label %else2, !dbg !49

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !50
  %11 = load i32, ptr %err, align 4, !dbg !50
  br label %if.end3, !dbg !50

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !50

if.end3:                                          ; preds = %else2, %then1
  store i32 13, ptr %plusA, align 4, !dbg !35
  %12 = load i32, ptr %plusA, align 4, !dbg !51
  %13 = add i32 3, %12, !dbg !51
  %14 = icmp ne i32 %13, 16, !dbg !51
  br i1 %14, label %then4, label %else5, !dbg !51

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !52
  %15 = load i32, ptr %err, align 4, !dbg !52
  br label %if.end6, !dbg !52

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !52

if.end6:                                          ; preds = %else5, %then4
  %16 = load i32, ptr %plusA, align 4, !dbg !53
  %17 = sub i32 3, %16, !dbg !53
  %18 = icmp ne i32 %17, -10, !dbg !53
  br i1 %18, label %then7, label %else8, !dbg !53

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !54
  %19 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end9, !dbg !54

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !54

if.end9:                                          ; preds = %else8, %then7
  br i1 false, label %then10, label %else11, !dbg !55

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !56
  %20 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end12, !dbg !56

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !56

if.end12:                                         ; preds = %else11, %then10
  br i1 false, label %then13, label %else14, !dbg !57

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !58
  %21 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end15, !dbg !58

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !58

if.end15:                                         ; preds = %else14, %then13
  store i32 13, ptr %minusA, align 4, !dbg !33
  %22 = load i32, ptr %minusA, align 4, !dbg !59
  %23 = sub i32 0, %22, !dbg !59
  %24 = sub i32 3, %23, !dbg !59
  %25 = icmp ne i32 %24, 16, !dbg !59
  br i1 %25, label %then16, label %else17, !dbg !59

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !60
  %26 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end18, !dbg !60

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !60

if.end18:                                         ; preds = %else17, %then16
  br i1 false, label %then19, label %else20, !dbg !61

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !62
  %27 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end21, !dbg !62

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !62

if.end21:                                         ; preds = %else20, %then19
  store i32 3, ptr %mulA, align 4, !dbg !31
  store i32 4, ptr %mulB, align 4, !dbg !29
  store ptr %mulB, ptr %mulC, align 8, !dbg !27
  %28 = load i32, ptr %mulA, align 4, !dbg !63
  %29 = load i32, ptr %mulB, align 4, !dbg !63
  %30 = mul i32 %28, %29, !dbg !63
  %31 = load ptr, ptr %mulC, align 8, !dbg !63
  %32 = load i32, ptr %31, align 4, !dbg !63
  %33 = mul i32 %30, %32, !dbg !63
  %34 = icmp ne i32 %33, 48, !dbg !63
  br i1 %34, label %then22, label %else23, !dbg !63

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !64
  %35 = load i32, ptr %err, align 4, !dbg !64
  br label %if.end24, !dbg !64

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !64

if.end24:                                         ; preds = %else23, %then22
  store i64 1234, ptr %callI, align 8, !dbg !24
  %36 = load i64, ptr %callI, align 8, !dbg !65
  %37 = trunc i64 %36 to i32, !dbg !65
  call void @subFunc(i32 %37), !dbg !65
  %38 = load i64, ptr %callI, align 8, !dbg !66
  %39 = trunc i64 %38 to i32, !dbg !66
  %40 = icmp ne i32 %39, 1234, !dbg !66
  br i1 %40, label %then25, label %else26, !dbg !66

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !67
  %41 = load i32, ptr %err, align 4, !dbg !67
  br label %if.end27, !dbg !67

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !67

if.end27:                                         ; preds = %else26, %then25
  store i32 10, ptr %incA, align 4, !dbg !21
  %42 = load i32, ptr %incA, align 4, !dbg !19
  %43 = add i32 %42, 1, !dbg !19
  store i32 %43, ptr %incA, align 4, !dbg !19
  %44 = load i32, ptr %incA, align 4, !dbg !19
  %45 = add i32 %44, 1, !dbg !19
  store i32 %45, ptr %incA, align 4, !dbg !19
  store i32 %44, ptr %incB, align 4, !dbg !19
  %46 = load i32, ptr %incA, align 4, !dbg !68
  %47 = icmp ne i32 %46, 12, !dbg !68
  br i1 %47, label %then28, label %else29, !dbg !68

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !69
  %48 = load i32, ptr %err, align 4, !dbg !69
  br label %if.end30, !dbg !69

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !69

if.end30:                                         ; preds = %else29, %then28
  %49 = load i32, ptr %incB, align 4, !dbg !70
  %50 = icmp ne i32 %49, 11, !dbg !70
  br i1 %50, label %then31, label %else32, !dbg !70

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !71
  %51 = load i32, ptr %err, align 4, !dbg !71
  br label %if.end33, !dbg !71

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !71

if.end33:                                         ; preds = %else32, %then31
  store i32 10, ptr %decA, align 4, !dbg !17
  %52 = load i32, ptr %decA, align 4, !dbg !15
  %53 = sub i32 %52, 1, !dbg !15
  store i32 %53, ptr %decA, align 4, !dbg !15
  %54 = load i32, ptr %decA, align 4, !dbg !15
  %55 = sub i32 %54, 1, !dbg !15
  store i32 %55, ptr %decA, align 4, !dbg !15
  store i32 %54, ptr %decB, align 4, !dbg !15
  %56 = load i32, ptr %decA, align 4, !dbg !72
  %57 = icmp ne i32 %56, 8, !dbg !72
  br i1 %57, label %then34, label %else35, !dbg !72

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !73
  %58 = load i32, ptr %err, align 4, !dbg !73
  br label %if.end36, !dbg !73

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !73

if.end36:                                         ; preds = %else35, %then34
  %59 = load i32, ptr %decB, align 4, !dbg !74
  %60 = icmp ne i32 %59, 9, !dbg !74
  br i1 %60, label %then37, label %else38, !dbg !74

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !75
  %61 = load i32, ptr %err, align 4, !dbg !75
  br label %if.end39, !dbg !75

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !75

if.end39:                                         ; preds = %else38, %then37
  %62 = load i32, ptr %err, align 4, !dbg !76
  %63 = icmp eq i32 %62, 0, !dbg !76
  br i1 %63, label %then40, label %else41, !dbg !76

then40:                                           ; preds = %if.end39
  %64 = call i32 (ptr, ...) @printf(ptr @0), !dbg !77
  br label %if.end42, !dbg !77

else41:                                           ; preds = %if.end39
  %65 = call i32 (ptr, ...) @printf(ptr @1), !dbg !79
  br label %if.end42, !dbg !79

if.end42:                                         ; preds = %else41, %then40
  %66 = load i32, ptr %err, align 4, !dbg !81
  ret i32 %66, !dbg !81
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "26.operator_precedence.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "subFunc", linkageName: "subFunc", scope: null, file: !3, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !8}
!7 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DILocalVariable(name: "i", arg: 1, scope: !4, file: !3, line: 6, type: !8)
!10 = !DILocation(line: 6, column: 6, scope: !4)
!11 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 8, type: !12, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !2)
!12 = !DISubroutineType(types: !13)
!13 = !{!8}
!14 = !DILocalVariable(name: "decB", scope: !11, file: !3, line: 43, type: !8)
!15 = !DILocation(line: 43, column: 3, scope: !11)
!16 = !DILocalVariable(name: "decA", scope: !11, file: !3, line: 42, type: !8)
!17 = !DILocation(line: 42, column: 3, scope: !11)
!18 = !DILocalVariable(name: "incB", scope: !11, file: !3, line: 38, type: !8)
!19 = !DILocation(line: 38, column: 3, scope: !11)
!20 = !DILocalVariable(name: "incA", scope: !11, file: !3, line: 37, type: !8)
!21 = !DILocation(line: 37, column: 3, scope: !11)
!22 = !DILocalVariable(name: "callI", scope: !11, file: !3, line: 33, type: !23)
!23 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!24 = !DILocation(line: 33, column: 3, scope: !11)
!25 = !DILocalVariable(name: "mulC", scope: !11, file: !3, line: 30, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!27 = !DILocation(line: 30, column: 3, scope: !11)
!28 = !DILocalVariable(name: "mulB", scope: !11, file: !3, line: 29, type: !8)
!29 = !DILocation(line: 29, column: 3, scope: !11)
!30 = !DILocalVariable(name: "mulA", scope: !11, file: !3, line: 28, type: !8)
!31 = !DILocation(line: 28, column: 3, scope: !11)
!32 = !DILocalVariable(name: "minusA", scope: !11, file: !3, line: 24, type: !8)
!33 = !DILocation(line: 24, column: 3, scope: !11)
!34 = !DILocalVariable(name: "plusA", scope: !11, file: !3, line: 18, type: !8)
!35 = !DILocation(line: 18, column: 3, scope: !11)
!36 = !DILocalVariable(name: "d", scope: !11, file: !3, line: 14, type: !37)
!37 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 14, column: 3, scope: !11)
!39 = !DILocalVariable(name: "c", scope: !11, file: !3, line: 13, type: !37)
!40 = !DILocation(line: 13, column: 3, scope: !11)
!41 = !DILocalVariable(name: "b", scope: !11, file: !3, line: 12, type: !37)
!42 = !DILocation(line: 12, column: 3, scope: !11)
!43 = !DILocalVariable(name: "a", scope: !11, file: !3, line: 11, type: !37)
!44 = !DILocation(line: 11, column: 3, scope: !11)
!45 = !DILocalVariable(name: "err", scope: !11, file: !3, line: 9, type: !8)
!46 = !DILocation(line: 9, column: 3, scope: !11)
!47 = !DILocation(line: 15, column: 3, scope: !11)
!48 = !DILocation(line: 15, column: 32, scope: !11)
!49 = !DILocation(line: 16, column: 3, scope: !11)
!50 = !DILocation(line: 16, column: 32, scope: !11)
!51 = !DILocation(line: 19, column: 3, scope: !11)
!52 = !DILocation(line: 19, column: 25, scope: !11)
!53 = !DILocation(line: 20, column: 3, scope: !11)
!54 = !DILocation(line: 20, column: 26, scope: !11)
!55 = !DILocation(line: 21, column: 3, scope: !11)
!56 = !DILocation(line: 21, column: 22, scope: !11)
!57 = !DILocation(line: 22, column: 3, scope: !11)
!58 = !DILocation(line: 22, column: 23, scope: !11)
!59 = !DILocation(line: 25, column: 3, scope: !11)
!60 = !DILocation(line: 25, column: 26, scope: !11)
!61 = !DILocation(line: 26, column: 3, scope: !11)
!62 = !DILocation(line: 26, column: 22, scope: !11)
!63 = !DILocation(line: 31, column: 3, scope: !11)
!64 = !DILocation(line: 31, column: 34, scope: !11)
!65 = !DILocation(line: 34, column: 3, scope: !11)
!66 = !DILocation(line: 35, column: 3, scope: !11)
!67 = !DILocation(line: 35, column: 27, scope: !11)
!68 = !DILocation(line: 39, column: 3, scope: !11)
!69 = !DILocation(line: 39, column: 19, scope: !11)
!70 = !DILocation(line: 40, column: 3, scope: !11)
!71 = !DILocation(line: 40, column: 19, scope: !11)
!72 = !DILocation(line: 44, column: 3, scope: !11)
!73 = !DILocation(line: 44, column: 18, scope: !11)
!74 = !DILocation(line: 45, column: 3, scope: !11)
!75 = !DILocation(line: 45, column: 18, scope: !11)
!76 = !DILocation(line: 47, column: 3, scope: !11)
!77 = !DILocation(line: 48, column: 5, scope: !78)
!78 = distinct !DILexicalBlock(scope: !11, file: !3, line: 47, column: 17)
!79 = !DILocation(line: 50, column: 5, scope: !80)
!80 = distinct !DILexicalBlock(scope: !11, file: !3, line: 49, column: 10)
!81 = !DILocation(line: 52, column: 3, scope: !11)
