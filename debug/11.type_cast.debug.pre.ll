; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [21 x i8] c"11.type_cast.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [21 x i8] c"11.type_cast.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %negToUint = alloca i32, align 4
    #dbg_declare(ptr %negToUint, !6, !DIExpression(), !8)
  %ucharFromInt = alloca i8, align 1
    #dbg_declare(ptr %ucharFromInt, !9, !DIExpression(), !11)
  %intFromUchar = alloca i32, align 4
    #dbg_declare(ptr %intFromUchar, !12, !DIExpression(), !13)
  %ucharBoundary = alloca i8, align 1
    #dbg_declare(ptr %ucharBoundary, !14, !DIExpression(), !15)
  %floatVal2 = alloca float, align 4
    #dbg_declare(ptr %floatVal2, !16, !DIExpression(), !18)
  %doubleVal2 = alloca double, align 8
    #dbg_declare(ptr %doubleVal2, !19, !DIExpression(), !21)
  %doubleVal = alloca double, align 8
    #dbg_declare(ptr %doubleVal, !22, !DIExpression(), !23)
  %floatVal = alloca float, align 4
    #dbg_declare(ptr %floatVal, !24, !DIExpression(), !25)
  %longVal2 = alloca i64, align 8
    #dbg_declare(ptr %longVal2, !26, !DIExpression(), !28)
  %ulongVal2 = alloca i64, align 8
    #dbg_declare(ptr %ulongVal2, !29, !DIExpression(), !31)
  %ulongVal = alloca i64, align 8
    #dbg_declare(ptr %ulongVal, !32, !DIExpression(), !33)
  %longVal = alloca i64, align 8
    #dbg_declare(ptr %longVal, !34, !DIExpression(), !35)
  %intVal2 = alloca i32, align 4
    #dbg_declare(ptr %intVal2, !36, !DIExpression(), !37)
  %uintVal2 = alloca i32, align 4
    #dbg_declare(ptr %uintVal2, !38, !DIExpression(), !39)
  %uintVal = alloca i32, align 4
    #dbg_declare(ptr %uintVal, !40, !DIExpression(), !41)
  %intVal = alloca i32, align 4
    #dbg_declare(ptr %intVal, !42, !DIExpression(), !43)
  %charVal2 = alloca i8, align 1
    #dbg_declare(ptr %charVal2, !44, !DIExpression(), !46)
  %ucharVal2 = alloca i8, align 1
    #dbg_declare(ptr %ucharVal2, !47, !DIExpression(), !48)
  %ucharVal = alloca i8, align 1
    #dbg_declare(ptr %ucharVal, !49, !DIExpression(), !50)
  %charVal = alloca i8, align 1
    #dbg_declare(ptr %charVal, !51, !DIExpression(), !52)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !53, !DIExpression(), !54)
  store i32 0, ptr %err, align 4, !dbg !54
  store i8 65, ptr %charVal, align 1, !dbg !52
  %0 = load i8, ptr %charVal, align 1, !dbg !50
  store i8 %0, ptr %ucharVal, align 1, !dbg !50
  %1 = load i8, ptr %charVal, align 1, !dbg !48
  store i8 %1, ptr %ucharVal2, align 1, !dbg !48
  %2 = load i8, ptr %ucharVal, align 1, !dbg !46
  store i8 %2, ptr %charVal2, align 1, !dbg !46
  %3 = load i8, ptr %charVal, align 1, !dbg !43
  %4 = sext i8 %3 to i32, !dbg !43
  store i32 %4, ptr %intVal, align 4, !dbg !43
  %5 = load i32, ptr %intVal, align 4, !dbg !41
  store i32 %5, ptr %uintVal, align 4, !dbg !41
  %6 = load i32, ptr %intVal, align 4, !dbg !39
  store i32 %6, ptr %uintVal2, align 4, !dbg !39
  %7 = load i32, ptr %uintVal, align 4, !dbg !37
  store i32 %7, ptr %intVal2, align 4, !dbg !37
  %8 = load i32, ptr %intVal, align 4, !dbg !35
  %9 = sext i32 %8 to i64, !dbg !35
  store i64 %9, ptr %longVal, align 4, !dbg !35
  %10 = load i64, ptr %longVal, align 4, !dbg !33
  store i64 %10, ptr %ulongVal, align 4, !dbg !33
  %11 = load i64, ptr %longVal, align 4, !dbg !31
  store i64 %11, ptr %ulongVal2, align 4, !dbg !31
  %12 = load i64, ptr %ulongVal2, align 4, !dbg !28
  store i64 %12, ptr %longVal2, align 4, !dbg !28
  store float 0x400921FB40000000, ptr %floatVal, align 4, !dbg !25
  %13 = load float, ptr %floatVal, align 4, !dbg !23
  %14 = fpext float %13 to double, !dbg !23
  store double %14, ptr %doubleVal, align 8, !dbg !23
  %15 = load float, ptr %floatVal, align 4, !dbg !21
  %16 = fpext float %15 to double, !dbg !21
  store double %16, ptr %doubleVal2, align 8, !dbg !21
  %17 = load double, ptr %doubleVal, align 8, !dbg !18
  %18 = fptrunc double %17 to float, !dbg !18
  store float %18, ptr %floatVal2, align 4, !dbg !18
  %19 = load i8, ptr %charVal2, align 1, !dbg !55
  %20 = sext i8 %19 to i32, !dbg !55
  %21 = icmp ne i32 %20, 65, !dbg !55
  br i1 %21, label %then, label %else, !dbg !55

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !56
  %22 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end, !dbg !56

else:                                             ; preds = %entry
  br label %if.end, !dbg !56

if.end:                                           ; preds = %else, %then
  %23 = load i8, ptr %ucharVal, align 1, !dbg !57
  %24 = zext i8 %23 to i32, !dbg !57
  %25 = icmp ne i32 %24, 65, !dbg !57
  br i1 %25, label %then1, label %else2, !dbg !57

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !58
  %26 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end3, !dbg !58

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !58

if.end3:                                          ; preds = %else2, %then1
  %27 = load i32, ptr %intVal, align 4, !dbg !59
  %28 = icmp ne i32 %27, 65, !dbg !59
  br i1 %28, label %then4, label %else5, !dbg !59

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !60
  %29 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end6, !dbg !60

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !60

if.end6:                                          ; preds = %else5, %then4
  %30 = load i32, ptr %uintVal, align 4, !dbg !61
  %31 = icmp ne i32 %30, 65, !dbg !61
  br i1 %31, label %then7, label %else8, !dbg !61

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !62
  %32 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end9, !dbg !62

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !62

if.end9:                                          ; preds = %else8, %then7
  %33 = load i32, ptr %intVal2, align 4, !dbg !63
  %34 = icmp ne i32 %33, 65, !dbg !63
  br i1 %34, label %then10, label %else11, !dbg !63

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !64
  %35 = load i32, ptr %err, align 4, !dbg !64
  br label %if.end12, !dbg !64

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !64

if.end12:                                         ; preds = %else11, %then10
  %36 = load i64, ptr %longVal, align 4, !dbg !65
  %37 = trunc i64 %36 to i32, !dbg !65
  %38 = icmp ne i32 %37, 65, !dbg !65
  br i1 %38, label %then13, label %else14, !dbg !65

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !66
  %39 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end15, !dbg !66

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !66

if.end15:                                         ; preds = %else14, %then13
  %40 = load i64, ptr %ulongVal, align 4, !dbg !67
  %41 = trunc i64 %40 to i32, !dbg !67
  %42 = icmp ne i32 %41, 65, !dbg !67
  br i1 %42, label %then16, label %else17, !dbg !67

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !68
  %43 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end18, !dbg !68

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !68

if.end18:                                         ; preds = %else17, %then16
  %44 = load i64, ptr %longVal2, align 4, !dbg !69
  %45 = trunc i64 %44 to i32, !dbg !69
  %46 = icmp ne i32 %45, 65, !dbg !69
  br i1 %46, label %then19, label %else20, !dbg !69

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !70
  %47 = load i32, ptr %err, align 4, !dbg !70
  br label %if.end21, !dbg !70

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !70

if.end21:                                         ; preds = %else20, %then19
  store i8 -6, ptr %ucharBoundary, align 1, !dbg !15
  %48 = load i8, ptr %ucharBoundary, align 1, !dbg !13
  %49 = zext i8 %48 to i32, !dbg !13
  store i32 %49, ptr %intFromUchar, align 4, !dbg !13
  %50 = load i32, ptr %intFromUchar, align 4, !dbg !71
  %51 = icmp ne i32 %50, 250, !dbg !71
  br i1 %51, label %then22, label %else23, !dbg !71

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !72
  %52 = load i32, ptr %err, align 4, !dbg !72
  br label %if.end24, !dbg !72

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !72

if.end24:                                         ; preds = %else23, %then22
  %53 = load i32, ptr %intFromUchar, align 4, !dbg !11
  %54 = trunc i32 %53 to i8, !dbg !11
  store i8 %54, ptr %ucharFromInt, align 1, !dbg !11
  %55 = load i8, ptr %ucharFromInt, align 1, !dbg !73
  %56 = zext i8 %55 to i32, !dbg !73
  %57 = icmp ne i32 %56, 250, !dbg !73
  br i1 %57, label %then25, label %else26, !dbg !73

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !74
  %58 = load i32, ptr %err, align 4, !dbg !74
  br label %if.end27, !dbg !74

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !74

if.end27:                                         ; preds = %else26, %then25
  store i32 -1, ptr %negToUint, align 4, !dbg !8
  %59 = load i32, ptr %negToUint, align 4, !dbg !75
  %60 = icmp ne i32 %59, -1, !dbg !75
  br i1 %60, label %then28, label %else29, !dbg !75

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !76
  %61 = load i32, ptr %err, align 4, !dbg !76
  br label %if.end30, !dbg !76

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !76

if.end30:                                         ; preds = %else29, %then28
  %62 = load i32, ptr %err, align 4, !dbg !77
  %63 = icmp eq i32 %62, 0, !dbg !77
  br i1 %63, label %then31, label %else32, !dbg !77

then31:                                           ; preds = %if.end30
  %64 = call i32 (ptr, ...) @printf(ptr @0), !dbg !78
  br label %if.end33, !dbg !78

else32:                                           ; preds = %if.end30
  %65 = call i32 (ptr, ...) @printf(ptr @1), !dbg !80
  br label %if.end33, !dbg !80

if.end33:                                         ; preds = %else32, %then31
  %66 = load i32, ptr %err, align 4, !dbg !82
  ret i32 %66, !dbg !82
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "11.type_cast.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "negToUint", scope: !2, file: !1, line: 41, type: !7)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !DILocation(line: 41, column: 3, scope: !2)
!9 = !DILocalVariable(name: "ucharFromInt", scope: !2, file: !1, line: 38, type: !10)
!10 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!11 = !DILocation(line: 38, column: 3, scope: !2)
!12 = !DILocalVariable(name: "intFromUchar", scope: !2, file: !1, line: 35, type: !5)
!13 = !DILocation(line: 35, column: 3, scope: !2)
!14 = !DILocalVariable(name: "ucharBoundary", scope: !2, file: !1, line: 34, type: !10)
!15 = !DILocation(line: 34, column: 3, scope: !2)
!16 = !DILocalVariable(name: "floatVal2", scope: !2, file: !1, line: 23, type: !17)
!17 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!18 = !DILocation(line: 23, column: 3, scope: !2)
!19 = !DILocalVariable(name: "doubleVal2", scope: !2, file: !1, line: 22, type: !20)
!20 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!21 = !DILocation(line: 22, column: 3, scope: !2)
!22 = !DILocalVariable(name: "doubleVal", scope: !2, file: !1, line: 21, type: !20)
!23 = !DILocation(line: 21, column: 3, scope: !2)
!24 = !DILocalVariable(name: "floatVal", scope: !2, file: !1, line: 20, type: !17)
!25 = !DILocation(line: 20, column: 3, scope: !2)
!26 = !DILocalVariable(name: "longVal2", scope: !2, file: !1, line: 18, type: !27)
!27 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!28 = !DILocation(line: 18, column: 3, scope: !2)
!29 = !DILocalVariable(name: "ulongVal2", scope: !2, file: !1, line: 17, type: !30)
!30 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!31 = !DILocation(line: 17, column: 3, scope: !2)
!32 = !DILocalVariable(name: "ulongVal", scope: !2, file: !1, line: 16, type: !30)
!33 = !DILocation(line: 16, column: 3, scope: !2)
!34 = !DILocalVariable(name: "longVal", scope: !2, file: !1, line: 15, type: !27)
!35 = !DILocation(line: 15, column: 3, scope: !2)
!36 = !DILocalVariable(name: "intVal2", scope: !2, file: !1, line: 13, type: !5)
!37 = !DILocation(line: 13, column: 3, scope: !2)
!38 = !DILocalVariable(name: "uintVal2", scope: !2, file: !1, line: 12, type: !7)
!39 = !DILocation(line: 12, column: 3, scope: !2)
!40 = !DILocalVariable(name: "uintVal", scope: !2, file: !1, line: 11, type: !7)
!41 = !DILocation(line: 11, column: 3, scope: !2)
!42 = !DILocalVariable(name: "intVal", scope: !2, file: !1, line: 10, type: !5)
!43 = !DILocation(line: 10, column: 3, scope: !2)
!44 = !DILocalVariable(name: "charVal2", scope: !2, file: !1, line: 8, type: !45)
!45 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!46 = !DILocation(line: 8, column: 3, scope: !2)
!47 = !DILocalVariable(name: "ucharVal2", scope: !2, file: !1, line: 7, type: !10)
!48 = !DILocation(line: 7, column: 3, scope: !2)
!49 = !DILocalVariable(name: "ucharVal", scope: !2, file: !1, line: 6, type: !10)
!50 = !DILocation(line: 6, column: 3, scope: !2)
!51 = !DILocalVariable(name: "charVal", scope: !2, file: !1, line: 5, type: !45)
!52 = !DILocation(line: 5, column: 3, scope: !2)
!53 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 4, type: !5)
!54 = !DILocation(line: 4, column: 3, scope: !2)
!55 = !DILocation(line: 25, column: 3, scope: !2)
!56 = !DILocation(line: 25, column: 24, scope: !2)
!57 = !DILocation(line: 26, column: 3, scope: !2)
!58 = !DILocation(line: 26, column: 23, scope: !2)
!59 = !DILocation(line: 27, column: 3, scope: !2)
!60 = !DILocation(line: 27, column: 21, scope: !2)
!61 = !DILocation(line: 28, column: 3, scope: !2)
!62 = !DILocation(line: 28, column: 22, scope: !2)
!63 = !DILocation(line: 29, column: 3, scope: !2)
!64 = !DILocation(line: 29, column: 22, scope: !2)
!65 = !DILocation(line: 30, column: 3, scope: !2)
!66 = !DILocation(line: 30, column: 27, scope: !2)
!67 = !DILocation(line: 31, column: 3, scope: !2)
!68 = !DILocation(line: 31, column: 28, scope: !2)
!69 = !DILocation(line: 32, column: 3, scope: !2)
!70 = !DILocation(line: 32, column: 28, scope: !2)
!71 = !DILocation(line: 36, column: 3, scope: !2)
!72 = !DILocation(line: 36, column: 28, scope: !2)
!73 = !DILocation(line: 39, column: 3, scope: !2)
!74 = !DILocation(line: 39, column: 28, scope: !2)
!75 = !DILocation(line: 42, column: 3, scope: !2)
!76 = !DILocation(line: 42, column: 32, scope: !2)
!77 = !DILocation(line: 44, column: 3, scope: !2)
!78 = !DILocation(line: 45, column: 5, scope: !79)
!79 = distinct !DILexicalBlock(scope: !2, file: !1, line: 44, column: 17)
!80 = !DILocation(line: 47, column: 5, scope: !81)
!81 = distinct !DILexicalBlock(scope: !2, file: !1, line: 46, column: 10)
!82 = !DILocation(line: 49, column: 3, scope: !2)
