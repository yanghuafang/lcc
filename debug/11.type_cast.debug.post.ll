; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [21 x i8] c"11.type_cast.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [21 x i8] c"11.type_cast.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %negToUint = alloca i32, align 4
    #dbg_declare(ptr %negToUint, !7, !DIExpression(), !9)
  %ucharFromInt = alloca i8, align 1
    #dbg_declare(ptr %ucharFromInt, !10, !DIExpression(), !12)
  %intFromUchar = alloca i32, align 4
    #dbg_declare(ptr %intFromUchar, !13, !DIExpression(), !14)
  %ucharBoundary = alloca i8, align 1
    #dbg_declare(ptr %ucharBoundary, !15, !DIExpression(), !16)
  %floatVal2 = alloca float, align 4
    #dbg_declare(ptr %floatVal2, !17, !DIExpression(), !19)
  %doubleVal2 = alloca double, align 8
    #dbg_declare(ptr %doubleVal2, !20, !DIExpression(), !22)
  %doubleVal = alloca double, align 8
    #dbg_declare(ptr %doubleVal, !23, !DIExpression(), !24)
  %floatVal = alloca float, align 4
    #dbg_declare(ptr %floatVal, !25, !DIExpression(), !26)
  %longVal2 = alloca i64, align 8
    #dbg_declare(ptr %longVal2, !27, !DIExpression(), !29)
  %ulongVal2 = alloca i64, align 8
    #dbg_declare(ptr %ulongVal2, !30, !DIExpression(), !32)
  %ulongVal = alloca i64, align 8
    #dbg_declare(ptr %ulongVal, !33, !DIExpression(), !34)
  %longVal = alloca i64, align 8
    #dbg_declare(ptr %longVal, !35, !DIExpression(), !36)
  %intVal2 = alloca i32, align 4
    #dbg_declare(ptr %intVal2, !37, !DIExpression(), !38)
  %uintVal2 = alloca i32, align 4
    #dbg_declare(ptr %uintVal2, !39, !DIExpression(), !40)
  %uintVal = alloca i32, align 4
    #dbg_declare(ptr %uintVal, !41, !DIExpression(), !42)
  %intVal = alloca i32, align 4
    #dbg_declare(ptr %intVal, !43, !DIExpression(), !44)
  %charVal2 = alloca i8, align 1
    #dbg_declare(ptr %charVal2, !45, !DIExpression(), !47)
  %ucharVal2 = alloca i8, align 1
    #dbg_declare(ptr %ucharVal2, !48, !DIExpression(), !49)
  %ucharVal = alloca i8, align 1
    #dbg_declare(ptr %ucharVal, !50, !DIExpression(), !51)
  %charVal = alloca i8, align 1
    #dbg_declare(ptr %charVal, !52, !DIExpression(), !53)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !54, !DIExpression(), !55)
  store i32 0, ptr %err, align 4, !dbg !55
  store i8 65, ptr %charVal, align 1, !dbg !53
  %0 = load i8, ptr %charVal, align 1, !dbg !51
  store i8 %0, ptr %ucharVal, align 1, !dbg !51
  %1 = load i8, ptr %charVal, align 1, !dbg !49
  store i8 %1, ptr %ucharVal2, align 1, !dbg !49
  %2 = load i8, ptr %ucharVal, align 1, !dbg !47
  store i8 %2, ptr %charVal2, align 1, !dbg !47
  %3 = load i8, ptr %charVal, align 1, !dbg !44
  %4 = sext i8 %3 to i32, !dbg !44
  store i32 %4, ptr %intVal, align 4, !dbg !44
  %5 = load i32, ptr %intVal, align 4, !dbg !42
  store i32 %5, ptr %uintVal, align 4, !dbg !42
  %6 = load i32, ptr %intVal, align 4, !dbg !40
  store i32 %6, ptr %uintVal2, align 4, !dbg !40
  %7 = load i32, ptr %uintVal, align 4, !dbg !38
  store i32 %7, ptr %intVal2, align 4, !dbg !38
  %8 = load i32, ptr %intVal, align 4, !dbg !36
  %9 = sext i32 %8 to i64, !dbg !36
  store i64 %9, ptr %longVal, align 4, !dbg !36
  %10 = load i64, ptr %longVal, align 4, !dbg !34
  store i64 %10, ptr %ulongVal, align 4, !dbg !34
  %11 = load i64, ptr %longVal, align 4, !dbg !32
  store i64 %11, ptr %ulongVal2, align 4, !dbg !32
  %12 = load i64, ptr %ulongVal2, align 4, !dbg !29
  store i64 %12, ptr %longVal2, align 4, !dbg !29
  store float 0x400921FB40000000, ptr %floatVal, align 4, !dbg !26
  %13 = load float, ptr %floatVal, align 4, !dbg !24
  %14 = fpext float %13 to double, !dbg !24
  store double %14, ptr %doubleVal, align 8, !dbg !24
  %15 = load float, ptr %floatVal, align 4, !dbg !22
  %16 = fpext float %15 to double, !dbg !22
  store double %16, ptr %doubleVal2, align 8, !dbg !22
  %17 = load double, ptr %doubleVal, align 8, !dbg !19
  %18 = fptrunc double %17 to float, !dbg !19
  store float %18, ptr %floatVal2, align 4, !dbg !19
  %19 = load i8, ptr %charVal2, align 1, !dbg !56
  %20 = sext i8 %19 to i32, !dbg !56
  %21 = icmp ne i32 %20, 65, !dbg !56
  br i1 %21, label %then, label %else, !dbg !56

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !57
  %22 = load i32, ptr %err, align 4, !dbg !57
  br label %if.end, !dbg !57

else:                                             ; preds = %entry
  br label %if.end, !dbg !57

if.end:                                           ; preds = %else, %then
  %23 = load i8, ptr %ucharVal, align 1, !dbg !58
  %24 = zext i8 %23 to i32, !dbg !58
  %25 = icmp ne i32 %24, 65, !dbg !58
  br i1 %25, label %then1, label %else2, !dbg !58

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !59
  %26 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end3, !dbg !59

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !59

if.end3:                                          ; preds = %else2, %then1
  %27 = load i32, ptr %intVal, align 4, !dbg !60
  %28 = icmp ne i32 %27, 65, !dbg !60
  br i1 %28, label %then4, label %else5, !dbg !60

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !61
  %29 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end6, !dbg !61

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !61

if.end6:                                          ; preds = %else5, %then4
  %30 = load i32, ptr %uintVal, align 4, !dbg !62
  %31 = icmp ne i32 %30, 65, !dbg !62
  br i1 %31, label %then7, label %else8, !dbg !62

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !63
  %32 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end9, !dbg !63

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !63

if.end9:                                          ; preds = %else8, %then7
  %33 = load i32, ptr %intVal2, align 4, !dbg !64
  %34 = icmp ne i32 %33, 65, !dbg !64
  br i1 %34, label %then10, label %else11, !dbg !64

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !65
  %35 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end12, !dbg !65

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !65

if.end12:                                         ; preds = %else11, %then10
  %36 = load i64, ptr %longVal, align 4, !dbg !66
  %37 = trunc i64 %36 to i32, !dbg !66
  %38 = icmp ne i32 %37, 65, !dbg !66
  br i1 %38, label %then13, label %else14, !dbg !66

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !67
  %39 = load i32, ptr %err, align 4, !dbg !67
  br label %if.end15, !dbg !67

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !67

if.end15:                                         ; preds = %else14, %then13
  %40 = load i64, ptr %ulongVal, align 4, !dbg !68
  %41 = trunc i64 %40 to i32, !dbg !68
  %42 = icmp ne i32 %41, 65, !dbg !68
  br i1 %42, label %then16, label %else17, !dbg !68

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !69
  %43 = load i32, ptr %err, align 4, !dbg !69
  br label %if.end18, !dbg !69

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !69

if.end18:                                         ; preds = %else17, %then16
  %44 = load i64, ptr %longVal2, align 4, !dbg !70
  %45 = trunc i64 %44 to i32, !dbg !70
  %46 = icmp ne i32 %45, 65, !dbg !70
  br i1 %46, label %then19, label %else20, !dbg !70

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !71
  %47 = load i32, ptr %err, align 4, !dbg !71
  br label %if.end21, !dbg !71

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !71

if.end21:                                         ; preds = %else20, %then19
  store i8 -6, ptr %ucharBoundary, align 1, !dbg !16
  %48 = load i8, ptr %ucharBoundary, align 1, !dbg !14
  %49 = zext i8 %48 to i32, !dbg !14
  store i32 %49, ptr %intFromUchar, align 4, !dbg !14
  %50 = load i32, ptr %intFromUchar, align 4, !dbg !72
  %51 = icmp ne i32 %50, 250, !dbg !72
  br i1 %51, label %then22, label %else23, !dbg !72

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !73
  %52 = load i32, ptr %err, align 4, !dbg !73
  br label %if.end24, !dbg !73

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !73

if.end24:                                         ; preds = %else23, %then22
  %53 = load i32, ptr %intFromUchar, align 4, !dbg !12
  %54 = trunc i32 %53 to i8, !dbg !12
  store i8 %54, ptr %ucharFromInt, align 1, !dbg !12
  %55 = load i8, ptr %ucharFromInt, align 1, !dbg !74
  %56 = zext i8 %55 to i32, !dbg !74
  %57 = icmp ne i32 %56, 250, !dbg !74
  br i1 %57, label %then25, label %else26, !dbg !74

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !75
  %58 = load i32, ptr %err, align 4, !dbg !75
  br label %if.end27, !dbg !75

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !75

if.end27:                                         ; preds = %else26, %then25
  store i32 -1, ptr %negToUint, align 4, !dbg !9
  %59 = load i32, ptr %negToUint, align 4, !dbg !76
  %60 = icmp ne i32 %59, -1, !dbg !76
  br i1 %60, label %then28, label %else29, !dbg !76

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !77
  %61 = load i32, ptr %err, align 4, !dbg !77
  br label %if.end30, !dbg !77

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !77

if.end30:                                         ; preds = %else29, %then28
  %62 = load i32, ptr %err, align 4, !dbg !78
  %63 = icmp eq i32 %62, 0, !dbg !78
  br i1 %63, label %then31, label %else32, !dbg !78

then31:                                           ; preds = %if.end30
  %64 = call i32 (ptr, ...) @printf(ptr @0), !dbg !79
  br label %if.end33, !dbg !79

else32:                                           ; preds = %if.end30
  %65 = call i32 (ptr, ...) @printf(ptr @1), !dbg !81
  br label %if.end33, !dbg !81

if.end33:                                         ; preds = %else32, %then31
  %66 = load i32, ptr %err, align 4, !dbg !83
  ret i32 %66, !dbg !83
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "11.type_cast.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "negToUint", scope: !2, file: !1, line: 41, type: !8)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !DILocation(line: 41, column: 3, scope: !2)
!10 = !DILocalVariable(name: "ucharFromInt", scope: !2, file: !1, line: 38, type: !11)
!11 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!12 = !DILocation(line: 38, column: 3, scope: !2)
!13 = !DILocalVariable(name: "intFromUchar", scope: !2, file: !1, line: 35, type: !5)
!14 = !DILocation(line: 35, column: 3, scope: !2)
!15 = !DILocalVariable(name: "ucharBoundary", scope: !2, file: !1, line: 34, type: !11)
!16 = !DILocation(line: 34, column: 3, scope: !2)
!17 = !DILocalVariable(name: "floatVal2", scope: !2, file: !1, line: 23, type: !18)
!18 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!19 = !DILocation(line: 23, column: 3, scope: !2)
!20 = !DILocalVariable(name: "doubleVal2", scope: !2, file: !1, line: 22, type: !21)
!21 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!22 = !DILocation(line: 22, column: 3, scope: !2)
!23 = !DILocalVariable(name: "doubleVal", scope: !2, file: !1, line: 21, type: !21)
!24 = !DILocation(line: 21, column: 3, scope: !2)
!25 = !DILocalVariable(name: "floatVal", scope: !2, file: !1, line: 20, type: !18)
!26 = !DILocation(line: 20, column: 3, scope: !2)
!27 = !DILocalVariable(name: "longVal2", scope: !2, file: !1, line: 18, type: !28)
!28 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!29 = !DILocation(line: 18, column: 3, scope: !2)
!30 = !DILocalVariable(name: "ulongVal2", scope: !2, file: !1, line: 17, type: !31)
!31 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!32 = !DILocation(line: 17, column: 3, scope: !2)
!33 = !DILocalVariable(name: "ulongVal", scope: !2, file: !1, line: 16, type: !31)
!34 = !DILocation(line: 16, column: 3, scope: !2)
!35 = !DILocalVariable(name: "longVal", scope: !2, file: !1, line: 15, type: !28)
!36 = !DILocation(line: 15, column: 3, scope: !2)
!37 = !DILocalVariable(name: "intVal2", scope: !2, file: !1, line: 13, type: !5)
!38 = !DILocation(line: 13, column: 3, scope: !2)
!39 = !DILocalVariable(name: "uintVal2", scope: !2, file: !1, line: 12, type: !8)
!40 = !DILocation(line: 12, column: 3, scope: !2)
!41 = !DILocalVariable(name: "uintVal", scope: !2, file: !1, line: 11, type: !8)
!42 = !DILocation(line: 11, column: 3, scope: !2)
!43 = !DILocalVariable(name: "intVal", scope: !2, file: !1, line: 10, type: !5)
!44 = !DILocation(line: 10, column: 3, scope: !2)
!45 = !DILocalVariable(name: "charVal2", scope: !2, file: !1, line: 8, type: !46)
!46 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!47 = !DILocation(line: 8, column: 3, scope: !2)
!48 = !DILocalVariable(name: "ucharVal2", scope: !2, file: !1, line: 7, type: !11)
!49 = !DILocation(line: 7, column: 3, scope: !2)
!50 = !DILocalVariable(name: "ucharVal", scope: !2, file: !1, line: 6, type: !11)
!51 = !DILocation(line: 6, column: 3, scope: !2)
!52 = !DILocalVariable(name: "charVal", scope: !2, file: !1, line: 5, type: !46)
!53 = !DILocation(line: 5, column: 3, scope: !2)
!54 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 4, type: !5)
!55 = !DILocation(line: 4, column: 3, scope: !2)
!56 = !DILocation(line: 25, column: 3, scope: !2)
!57 = !DILocation(line: 25, column: 24, scope: !2)
!58 = !DILocation(line: 26, column: 3, scope: !2)
!59 = !DILocation(line: 26, column: 23, scope: !2)
!60 = !DILocation(line: 27, column: 3, scope: !2)
!61 = !DILocation(line: 27, column: 21, scope: !2)
!62 = !DILocation(line: 28, column: 3, scope: !2)
!63 = !DILocation(line: 28, column: 22, scope: !2)
!64 = !DILocation(line: 29, column: 3, scope: !2)
!65 = !DILocation(line: 29, column: 22, scope: !2)
!66 = !DILocation(line: 30, column: 3, scope: !2)
!67 = !DILocation(line: 30, column: 27, scope: !2)
!68 = !DILocation(line: 31, column: 3, scope: !2)
!69 = !DILocation(line: 31, column: 28, scope: !2)
!70 = !DILocation(line: 32, column: 3, scope: !2)
!71 = !DILocation(line: 32, column: 28, scope: !2)
!72 = !DILocation(line: 36, column: 3, scope: !2)
!73 = !DILocation(line: 36, column: 28, scope: !2)
!74 = !DILocation(line: 39, column: 3, scope: !2)
!75 = !DILocation(line: 39, column: 28, scope: !2)
!76 = !DILocation(line: 42, column: 3, scope: !2)
!77 = !DILocation(line: 42, column: 32, scope: !2)
!78 = !DILocation(line: 44, column: 3, scope: !2)
!79 = !DILocation(line: 45, column: 5, scope: !80)
!80 = distinct !DILexicalBlock(scope: !2, file: !1, line: 44, column: 17)
!81 = !DILocation(line: 47, column: 5, scope: !82)
!82 = distinct !DILexicalBlock(scope: !2, file: !1, line: 46, column: 10)
!83 = !DILocation(line: 49, column: 3, scope: !2)
