; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [21 x i8] c"11.type_cast.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [21 x i8] c"11.type_cast.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %negToUint = alloca i32, align 4
    #dbg_declare(ptr %negToUint, !8, !DIExpression(), !10)
  %ucharFromInt = alloca i8, align 1
    #dbg_declare(ptr %ucharFromInt, !11, !DIExpression(), !13)
  %intFromUchar = alloca i32, align 4
    #dbg_declare(ptr %intFromUchar, !14, !DIExpression(), !15)
  %ucharBoundary = alloca i8, align 1
    #dbg_declare(ptr %ucharBoundary, !16, !DIExpression(), !17)
  %floatVal2 = alloca float, align 4
    #dbg_declare(ptr %floatVal2, !18, !DIExpression(), !20)
  %doubleVal2 = alloca double, align 8
    #dbg_declare(ptr %doubleVal2, !21, !DIExpression(), !23)
  %doubleVal = alloca double, align 8
    #dbg_declare(ptr %doubleVal, !24, !DIExpression(), !25)
  %floatVal = alloca float, align 4
    #dbg_declare(ptr %floatVal, !26, !DIExpression(), !27)
  %longVal2 = alloca i64, align 8
    #dbg_declare(ptr %longVal2, !28, !DIExpression(), !30)
  %ulongVal2 = alloca i64, align 8
    #dbg_declare(ptr %ulongVal2, !31, !DIExpression(), !33)
  %ulongVal = alloca i64, align 8
    #dbg_declare(ptr %ulongVal, !34, !DIExpression(), !35)
  %longVal = alloca i64, align 8
    #dbg_declare(ptr %longVal, !36, !DIExpression(), !37)
  %intVal2 = alloca i32, align 4
    #dbg_declare(ptr %intVal2, !38, !DIExpression(), !39)
  %uintVal2 = alloca i32, align 4
    #dbg_declare(ptr %uintVal2, !40, !DIExpression(), !41)
  %uintVal = alloca i32, align 4
    #dbg_declare(ptr %uintVal, !42, !DIExpression(), !43)
  %intVal = alloca i32, align 4
    #dbg_declare(ptr %intVal, !44, !DIExpression(), !45)
  %charVal2 = alloca i8, align 1
    #dbg_declare(ptr %charVal2, !46, !DIExpression(), !48)
  %ucharVal2 = alloca i8, align 1
    #dbg_declare(ptr %ucharVal2, !49, !DIExpression(), !50)
  %ucharVal = alloca i8, align 1
    #dbg_declare(ptr %ucharVal, !51, !DIExpression(), !52)
  %charVal = alloca i8, align 1
    #dbg_declare(ptr %charVal, !53, !DIExpression(), !54)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !55, !DIExpression(), !56)
  store i32 0, ptr %err, align 4, !dbg !56
  store i8 65, ptr %charVal, align 1, !dbg !54
  %0 = load i8, ptr %charVal, align 1, !dbg !52
  store i8 %0, ptr %ucharVal, align 1, !dbg !52
  %1 = load i8, ptr %charVal, align 1, !dbg !50
  store i8 %1, ptr %ucharVal2, align 1, !dbg !50
  %2 = load i8, ptr %ucharVal, align 1, !dbg !48
  store i8 %2, ptr %charVal2, align 1, !dbg !48
  %3 = load i8, ptr %charVal, align 1, !dbg !45
  %4 = sext i8 %3 to i32, !dbg !45
  store i32 %4, ptr %intVal, align 4, !dbg !45
  %5 = load i32, ptr %intVal, align 4, !dbg !43
  store i32 %5, ptr %uintVal, align 4, !dbg !43
  %6 = load i32, ptr %intVal, align 4, !dbg !41
  store i32 %6, ptr %uintVal2, align 4, !dbg !41
  %7 = load i32, ptr %uintVal, align 4, !dbg !39
  store i32 %7, ptr %intVal2, align 4, !dbg !39
  %8 = load i32, ptr %intVal, align 4, !dbg !37
  %9 = sext i32 %8 to i64, !dbg !37
  store i64 %9, ptr %longVal, align 8, !dbg !37
  %10 = load i64, ptr %longVal, align 8, !dbg !35
  store i64 %10, ptr %ulongVal, align 8, !dbg !35
  %11 = load i64, ptr %longVal, align 8, !dbg !33
  store i64 %11, ptr %ulongVal2, align 8, !dbg !33
  %12 = load i64, ptr %ulongVal2, align 8, !dbg !30
  store i64 %12, ptr %longVal2, align 8, !dbg !30
  store float 0x400921FB40000000, ptr %floatVal, align 4, !dbg !27
  %13 = load float, ptr %floatVal, align 4, !dbg !25
  %14 = fpext float %13 to double, !dbg !25
  store double %14, ptr %doubleVal, align 8, !dbg !25
  %15 = load float, ptr %floatVal, align 4, !dbg !23
  %16 = fpext float %15 to double, !dbg !23
  store double %16, ptr %doubleVal2, align 8, !dbg !23
  %17 = load double, ptr %doubleVal, align 8, !dbg !20
  %18 = fptrunc double %17 to float, !dbg !20
  store float %18, ptr %floatVal2, align 4, !dbg !20
  %19 = load i8, ptr %charVal2, align 1, !dbg !57
  %20 = sext i8 %19 to i32, !dbg !57
  %21 = icmp ne i32 %20, 65, !dbg !57
  br i1 %21, label %then, label %else, !dbg !57

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !58
  %22 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end, !dbg !58

else:                                             ; preds = %entry
  br label %if.end, !dbg !58

if.end:                                           ; preds = %else, %then
  %23 = load i8, ptr %ucharVal, align 1, !dbg !59
  %24 = zext i8 %23 to i32, !dbg !59
  %25 = icmp ne i32 %24, 65, !dbg !59
  br i1 %25, label %then1, label %else2, !dbg !59

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !60
  %26 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end3, !dbg !60

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !60

if.end3:                                          ; preds = %else2, %then1
  %27 = load i32, ptr %intVal, align 4, !dbg !61
  %28 = icmp ne i32 %27, 65, !dbg !61
  br i1 %28, label %then4, label %else5, !dbg !61

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !62
  %29 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end6, !dbg !62

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !62

if.end6:                                          ; preds = %else5, %then4
  %30 = load i32, ptr %uintVal, align 4, !dbg !63
  %31 = icmp ne i32 %30, 65, !dbg !63
  br i1 %31, label %then7, label %else8, !dbg !63

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !64
  %32 = load i32, ptr %err, align 4, !dbg !64
  br label %if.end9, !dbg !64

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !64

if.end9:                                          ; preds = %else8, %then7
  %33 = load i32, ptr %intVal2, align 4, !dbg !65
  %34 = icmp ne i32 %33, 65, !dbg !65
  br i1 %34, label %then10, label %else11, !dbg !65

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !66
  %35 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end12, !dbg !66

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !66

if.end12:                                         ; preds = %else11, %then10
  %36 = load i64, ptr %longVal, align 8, !dbg !67
  %37 = trunc i64 %36 to i32, !dbg !67
  %38 = icmp ne i32 %37, 65, !dbg !67
  br i1 %38, label %then13, label %else14, !dbg !67

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !68
  %39 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end15, !dbg !68

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !68

if.end15:                                         ; preds = %else14, %then13
  %40 = load i64, ptr %ulongVal, align 8, !dbg !69
  %41 = trunc i64 %40 to i32, !dbg !69
  %42 = icmp ne i32 %41, 65, !dbg !69
  br i1 %42, label %then16, label %else17, !dbg !69

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !70
  %43 = load i32, ptr %err, align 4, !dbg !70
  br label %if.end18, !dbg !70

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !70

if.end18:                                         ; preds = %else17, %then16
  %44 = load i64, ptr %longVal2, align 8, !dbg !71
  %45 = trunc i64 %44 to i32, !dbg !71
  %46 = icmp ne i32 %45, 65, !dbg !71
  br i1 %46, label %then19, label %else20, !dbg !71

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !72
  %47 = load i32, ptr %err, align 4, !dbg !72
  br label %if.end21, !dbg !72

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !72

if.end21:                                         ; preds = %else20, %then19
  store i8 -6, ptr %ucharBoundary, align 1, !dbg !17
  %48 = load i8, ptr %ucharBoundary, align 1, !dbg !15
  %49 = zext i8 %48 to i32, !dbg !15
  store i32 %49, ptr %intFromUchar, align 4, !dbg !15
  %50 = load i32, ptr %intFromUchar, align 4, !dbg !73
  %51 = icmp ne i32 %50, 250, !dbg !73
  br i1 %51, label %then22, label %else23, !dbg !73

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !74
  %52 = load i32, ptr %err, align 4, !dbg !74
  br label %if.end24, !dbg !74

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !74

if.end24:                                         ; preds = %else23, %then22
  %53 = load i32, ptr %intFromUchar, align 4, !dbg !13
  %54 = trunc i32 %53 to i8, !dbg !13
  store i8 %54, ptr %ucharFromInt, align 1, !dbg !13
  %55 = load i8, ptr %ucharFromInt, align 1, !dbg !75
  %56 = zext i8 %55 to i32, !dbg !75
  %57 = icmp ne i32 %56, 250, !dbg !75
  br i1 %57, label %then25, label %else26, !dbg !75

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !76
  %58 = load i32, ptr %err, align 4, !dbg !76
  br label %if.end27, !dbg !76

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !76

if.end27:                                         ; preds = %else26, %then25
  store i32 -1, ptr %negToUint, align 4, !dbg !10
  %59 = load i32, ptr %negToUint, align 4, !dbg !77
  %60 = icmp ne i32 %59, -1, !dbg !77
  br i1 %60, label %then28, label %else29, !dbg !77

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !78
  %61 = load i32, ptr %err, align 4, !dbg !78
  br label %if.end30, !dbg !78

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !78

if.end30:                                         ; preds = %else29, %then28
  %62 = load i32, ptr %err, align 4, !dbg !79
  %63 = icmp eq i32 %62, 0, !dbg !79
  br i1 %63, label %then31, label %else32, !dbg !79

then31:                                           ; preds = %if.end30
  %64 = call i32 (ptr, ...) @printf(ptr @0), !dbg !80
  br label %if.end33, !dbg !80

else32:                                           ; preds = %if.end30
  %65 = call i32 (ptr, ...) @printf(ptr @1), !dbg !82
  br label %if.end33, !dbg !82

if.end33:                                         ; preds = %else32, %then31
  %66 = load i32, ptr %err, align 4, !dbg !84
  ret i32 %66, !dbg !84
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "11.type_cast.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "negToUint", scope: !4, file: !3, line: 44, type: !9)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !DILocation(line: 44, column: 3, scope: !4)
!11 = !DILocalVariable(name: "ucharFromInt", scope: !4, file: !3, line: 41, type: !12)
!12 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!13 = !DILocation(line: 41, column: 3, scope: !4)
!14 = !DILocalVariable(name: "intFromUchar", scope: !4, file: !3, line: 38, type: !7)
!15 = !DILocation(line: 38, column: 3, scope: !4)
!16 = !DILocalVariable(name: "ucharBoundary", scope: !4, file: !3, line: 37, type: !12)
!17 = !DILocation(line: 37, column: 3, scope: !4)
!18 = !DILocalVariable(name: "floatVal2", scope: !4, file: !3, line: 26, type: !19)
!19 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!20 = !DILocation(line: 26, column: 3, scope: !4)
!21 = !DILocalVariable(name: "doubleVal2", scope: !4, file: !3, line: 25, type: !22)
!22 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!23 = !DILocation(line: 25, column: 3, scope: !4)
!24 = !DILocalVariable(name: "doubleVal", scope: !4, file: !3, line: 24, type: !22)
!25 = !DILocation(line: 24, column: 3, scope: !4)
!26 = !DILocalVariable(name: "floatVal", scope: !4, file: !3, line: 23, type: !19)
!27 = !DILocation(line: 23, column: 3, scope: !4)
!28 = !DILocalVariable(name: "longVal2", scope: !4, file: !3, line: 21, type: !29)
!29 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!30 = !DILocation(line: 21, column: 3, scope: !4)
!31 = !DILocalVariable(name: "ulongVal2", scope: !4, file: !3, line: 20, type: !32)
!32 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!33 = !DILocation(line: 20, column: 3, scope: !4)
!34 = !DILocalVariable(name: "ulongVal", scope: !4, file: !3, line: 19, type: !32)
!35 = !DILocation(line: 19, column: 3, scope: !4)
!36 = !DILocalVariable(name: "longVal", scope: !4, file: !3, line: 18, type: !29)
!37 = !DILocation(line: 18, column: 3, scope: !4)
!38 = !DILocalVariable(name: "intVal2", scope: !4, file: !3, line: 16, type: !7)
!39 = !DILocation(line: 16, column: 3, scope: !4)
!40 = !DILocalVariable(name: "uintVal2", scope: !4, file: !3, line: 15, type: !9)
!41 = !DILocation(line: 15, column: 3, scope: !4)
!42 = !DILocalVariable(name: "uintVal", scope: !4, file: !3, line: 14, type: !9)
!43 = !DILocation(line: 14, column: 3, scope: !4)
!44 = !DILocalVariable(name: "intVal", scope: !4, file: !3, line: 13, type: !7)
!45 = !DILocation(line: 13, column: 3, scope: !4)
!46 = !DILocalVariable(name: "charVal2", scope: !4, file: !3, line: 11, type: !47)
!47 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!48 = !DILocation(line: 11, column: 3, scope: !4)
!49 = !DILocalVariable(name: "ucharVal2", scope: !4, file: !3, line: 10, type: !12)
!50 = !DILocation(line: 10, column: 3, scope: !4)
!51 = !DILocalVariable(name: "ucharVal", scope: !4, file: !3, line: 9, type: !12)
!52 = !DILocation(line: 9, column: 3, scope: !4)
!53 = !DILocalVariable(name: "charVal", scope: !4, file: !3, line: 8, type: !47)
!54 = !DILocation(line: 8, column: 3, scope: !4)
!55 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 7, type: !7)
!56 = !DILocation(line: 7, column: 3, scope: !4)
!57 = !DILocation(line: 28, column: 3, scope: !4)
!58 = !DILocation(line: 28, column: 24, scope: !4)
!59 = !DILocation(line: 29, column: 3, scope: !4)
!60 = !DILocation(line: 29, column: 23, scope: !4)
!61 = !DILocation(line: 30, column: 3, scope: !4)
!62 = !DILocation(line: 30, column: 21, scope: !4)
!63 = !DILocation(line: 31, column: 3, scope: !4)
!64 = !DILocation(line: 31, column: 22, scope: !4)
!65 = !DILocation(line: 32, column: 3, scope: !4)
!66 = !DILocation(line: 32, column: 22, scope: !4)
!67 = !DILocation(line: 33, column: 3, scope: !4)
!68 = !DILocation(line: 33, column: 27, scope: !4)
!69 = !DILocation(line: 34, column: 3, scope: !4)
!70 = !DILocation(line: 34, column: 28, scope: !4)
!71 = !DILocation(line: 35, column: 3, scope: !4)
!72 = !DILocation(line: 35, column: 28, scope: !4)
!73 = !DILocation(line: 39, column: 3, scope: !4)
!74 = !DILocation(line: 39, column: 28, scope: !4)
!75 = !DILocation(line: 42, column: 3, scope: !4)
!76 = !DILocation(line: 42, column: 28, scope: !4)
!77 = !DILocation(line: 45, column: 3, scope: !4)
!78 = !DILocation(line: 45, column: 32, scope: !4)
!79 = !DILocation(line: 47, column: 3, scope: !4)
!80 = !DILocation(line: 48, column: 5, scope: !81)
!81 = distinct !DILexicalBlock(scope: !4, file: !3, line: 47, column: 17)
!82 = !DILocation(line: 50, column: 5, scope: !83)
!83 = distinct !DILexicalBlock(scope: !4, file: !3, line: 49, column: 10)
!84 = !DILocation(line: 52, column: 3, scope: !4)
