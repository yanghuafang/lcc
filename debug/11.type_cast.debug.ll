; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [21 x i8] c"11.type_cast.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [21 x i8] c"11.type_cast.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %negToUint = alloca i32, align 4
    #dbg_declare(ptr %negToUint, !9, !DIExpression(), !11)
  %ucharFromInt = alloca i8, align 1
    #dbg_declare(ptr %ucharFromInt, !12, !DIExpression(), !14)
  %intFromUchar = alloca i32, align 4
    #dbg_declare(ptr %intFromUchar, !15, !DIExpression(), !16)
  %ucharBoundary = alloca i8, align 1
    #dbg_declare(ptr %ucharBoundary, !17, !DIExpression(), !18)
  %floatVal2 = alloca float, align 4
    #dbg_declare(ptr %floatVal2, !19, !DIExpression(), !21)
  %doubleVal2 = alloca double, align 8
    #dbg_declare(ptr %doubleVal2, !22, !DIExpression(), !24)
  %doubleVal = alloca double, align 8
    #dbg_declare(ptr %doubleVal, !25, !DIExpression(), !26)
  %floatVal = alloca float, align 4
    #dbg_declare(ptr %floatVal, !27, !DIExpression(), !28)
  %longVal2 = alloca i64, align 8
    #dbg_declare(ptr %longVal2, !29, !DIExpression(), !31)
  %ulongVal2 = alloca i64, align 8
    #dbg_declare(ptr %ulongVal2, !32, !DIExpression(), !34)
  %ulongVal = alloca i64, align 8
    #dbg_declare(ptr %ulongVal, !35, !DIExpression(), !36)
  %longVal = alloca i64, align 8
    #dbg_declare(ptr %longVal, !37, !DIExpression(), !38)
  %intVal2 = alloca i32, align 4
    #dbg_declare(ptr %intVal2, !39, !DIExpression(), !40)
  %uintVal2 = alloca i32, align 4
    #dbg_declare(ptr %uintVal2, !41, !DIExpression(), !42)
  %uintVal = alloca i32, align 4
    #dbg_declare(ptr %uintVal, !43, !DIExpression(), !44)
  %intVal = alloca i32, align 4
    #dbg_declare(ptr %intVal, !45, !DIExpression(), !46)
  %charVal2 = alloca i8, align 1
    #dbg_declare(ptr %charVal2, !47, !DIExpression(), !49)
  %ucharVal2 = alloca i8, align 1
    #dbg_declare(ptr %ucharVal2, !50, !DIExpression(), !51)
  %ucharVal = alloca i8, align 1
    #dbg_declare(ptr %ucharVal, !52, !DIExpression(), !53)
  %charVal = alloca i8, align 1
    #dbg_declare(ptr %charVal, !54, !DIExpression(), !55)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !56, !DIExpression(), !57)
  store i32 0, ptr %err, align 4, !dbg !57
  store i8 65, ptr %charVal, align 1, !dbg !55
  %0 = load i8, ptr %charVal, align 1, !dbg !53
  store i8 %0, ptr %ucharVal, align 1, !dbg !53
  %1 = load i8, ptr %charVal, align 1, !dbg !51
  store i8 %1, ptr %ucharVal2, align 1, !dbg !51
  %2 = load i8, ptr %ucharVal, align 1, !dbg !49
  store i8 %2, ptr %charVal2, align 1, !dbg !49
  %3 = load i8, ptr %charVal, align 1, !dbg !46
  %4 = sext i8 %3 to i32, !dbg !46
  store i32 %4, ptr %intVal, align 4, !dbg !46
  %5 = load i32, ptr %intVal, align 4, !dbg !44
  store i32 %5, ptr %uintVal, align 4, !dbg !44
  %6 = load i32, ptr %intVal, align 4, !dbg !42
  store i32 %6, ptr %uintVal2, align 4, !dbg !42
  %7 = load i32, ptr %uintVal, align 4, !dbg !40
  store i32 %7, ptr %intVal2, align 4, !dbg !40
  %8 = load i32, ptr %intVal, align 4, !dbg !38
  %9 = sext i32 %8 to i64, !dbg !38
  store i64 %9, ptr %longVal, align 4, !dbg !38
  %10 = load i64, ptr %longVal, align 4, !dbg !36
  store i64 %10, ptr %ulongVal, align 4, !dbg !36
  %11 = load i64, ptr %longVal, align 4, !dbg !34
  store i64 %11, ptr %ulongVal2, align 4, !dbg !34
  %12 = load i64, ptr %ulongVal2, align 4, !dbg !31
  store i64 %12, ptr %longVal2, align 4, !dbg !31
  store float 0x400921FB40000000, ptr %floatVal, align 4, !dbg !28
  %13 = load float, ptr %floatVal, align 4, !dbg !26
  %14 = fpext float %13 to double, !dbg !26
  store double %14, ptr %doubleVal, align 8, !dbg !26
  %15 = load float, ptr %floatVal, align 4, !dbg !24
  %16 = fpext float %15 to double, !dbg !24
  store double %16, ptr %doubleVal2, align 8, !dbg !24
  %17 = load double, ptr %doubleVal, align 8, !dbg !21
  %18 = fptrunc double %17 to float, !dbg !21
  store float %18, ptr %floatVal2, align 4, !dbg !21
  %19 = load i8, ptr %charVal2, align 1, !dbg !58
  %20 = sext i8 %19 to i32, !dbg !58
  %21 = icmp ne i32 %20, 65, !dbg !58
  br i1 %21, label %then, label %else, !dbg !58

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !59
  %22 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end, !dbg !59

else:                                             ; preds = %entry
  br label %if.end, !dbg !59

if.end:                                           ; preds = %else, %then
  %23 = load i8, ptr %ucharVal, align 1, !dbg !60
  %24 = zext i8 %23 to i32, !dbg !60
  %25 = icmp ne i32 %24, 65, !dbg !60
  br i1 %25, label %then1, label %else2, !dbg !60

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !61
  %26 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end3, !dbg !61

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !61

if.end3:                                          ; preds = %else2, %then1
  %27 = load i32, ptr %intVal, align 4, !dbg !62
  %28 = icmp ne i32 %27, 65, !dbg !62
  br i1 %28, label %then4, label %else5, !dbg !62

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !63
  %29 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end6, !dbg !63

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !63

if.end6:                                          ; preds = %else5, %then4
  %30 = load i32, ptr %uintVal, align 4, !dbg !64
  %31 = icmp ne i32 %30, 65, !dbg !64
  br i1 %31, label %then7, label %else8, !dbg !64

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !65
  %32 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end9, !dbg !65

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !65

if.end9:                                          ; preds = %else8, %then7
  %33 = load i32, ptr %intVal2, align 4, !dbg !66
  %34 = icmp ne i32 %33, 65, !dbg !66
  br i1 %34, label %then10, label %else11, !dbg !66

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !67
  %35 = load i32, ptr %err, align 4, !dbg !67
  br label %if.end12, !dbg !67

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !67

if.end12:                                         ; preds = %else11, %then10
  %36 = load i64, ptr %longVal, align 4, !dbg !68
  %37 = trunc i64 %36 to i32, !dbg !68
  %38 = icmp ne i32 %37, 65, !dbg !68
  br i1 %38, label %then13, label %else14, !dbg !68

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !69
  %39 = load i32, ptr %err, align 4, !dbg !69
  br label %if.end15, !dbg !69

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !69

if.end15:                                         ; preds = %else14, %then13
  %40 = load i64, ptr %ulongVal, align 4, !dbg !70
  %41 = trunc i64 %40 to i32, !dbg !70
  %42 = icmp ne i32 %41, 65, !dbg !70
  br i1 %42, label %then16, label %else17, !dbg !70

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !71
  %43 = load i32, ptr %err, align 4, !dbg !71
  br label %if.end18, !dbg !71

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !71

if.end18:                                         ; preds = %else17, %then16
  %44 = load i64, ptr %longVal2, align 4, !dbg !72
  %45 = trunc i64 %44 to i32, !dbg !72
  %46 = icmp ne i32 %45, 65, !dbg !72
  br i1 %46, label %then19, label %else20, !dbg !72

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !73
  %47 = load i32, ptr %err, align 4, !dbg !73
  br label %if.end21, !dbg !73

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !73

if.end21:                                         ; preds = %else20, %then19
  store i8 -6, ptr %ucharBoundary, align 1, !dbg !18
  %48 = load i8, ptr %ucharBoundary, align 1, !dbg !16
  %49 = zext i8 %48 to i32, !dbg !16
  store i32 %49, ptr %intFromUchar, align 4, !dbg !16
  %50 = load i32, ptr %intFromUchar, align 4, !dbg !74
  %51 = icmp ne i32 %50, 250, !dbg !74
  br i1 %51, label %then22, label %else23, !dbg !74

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !75
  %52 = load i32, ptr %err, align 4, !dbg !75
  br label %if.end24, !dbg !75

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !75

if.end24:                                         ; preds = %else23, %then22
  %53 = load i32, ptr %intFromUchar, align 4, !dbg !14
  %54 = trunc i32 %53 to i8, !dbg !14
  store i8 %54, ptr %ucharFromInt, align 1, !dbg !14
  %55 = load i8, ptr %ucharFromInt, align 1, !dbg !76
  %56 = zext i8 %55 to i32, !dbg !76
  %57 = icmp ne i32 %56, 250, !dbg !76
  br i1 %57, label %then25, label %else26, !dbg !76

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !77
  %58 = load i32, ptr %err, align 4, !dbg !77
  br label %if.end27, !dbg !77

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !77

if.end27:                                         ; preds = %else26, %then25
  store i32 -1, ptr %negToUint, align 4, !dbg !11
  %59 = load i32, ptr %negToUint, align 4, !dbg !78
  %60 = icmp ne i32 %59, -1, !dbg !78
  br i1 %60, label %then28, label %else29, !dbg !78

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !79
  %61 = load i32, ptr %err, align 4, !dbg !79
  br label %if.end30, !dbg !79

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !79

if.end30:                                         ; preds = %else29, %then28
  %62 = load i32, ptr %err, align 4, !dbg !80
  %63 = icmp eq i32 %62, 0, !dbg !80
  br i1 %63, label %then31, label %else32, !dbg !80

then31:                                           ; preds = %if.end30
  %64 = call i32 (ptr, ...) @printf(ptr @0), !dbg !81
  br label %if.end33, !dbg !81

else32:                                           ; preds = %if.end30
  %65 = call i32 (ptr, ...) @printf(ptr @1), !dbg !83
  br label %if.end33, !dbg !83

if.end33:                                         ; preds = %else32, %then31
  %66 = load i32, ptr %err, align 4, !dbg !85
  ret i32 %66, !dbg !85
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "11.type_cast.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "negToUint", scope: !4, file: !1, line: 41, type: !10)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !DILocation(line: 41, column: 3, scope: !4)
!12 = !DILocalVariable(name: "ucharFromInt", scope: !4, file: !1, line: 38, type: !13)
!13 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!14 = !DILocation(line: 38, column: 3, scope: !4)
!15 = !DILocalVariable(name: "intFromUchar", scope: !4, file: !1, line: 35, type: !7)
!16 = !DILocation(line: 35, column: 3, scope: !4)
!17 = !DILocalVariable(name: "ucharBoundary", scope: !4, file: !1, line: 34, type: !13)
!18 = !DILocation(line: 34, column: 3, scope: !4)
!19 = !DILocalVariable(name: "floatVal2", scope: !4, file: !1, line: 23, type: !20)
!20 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!21 = !DILocation(line: 23, column: 3, scope: !4)
!22 = !DILocalVariable(name: "doubleVal2", scope: !4, file: !1, line: 22, type: !23)
!23 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!24 = !DILocation(line: 22, column: 3, scope: !4)
!25 = !DILocalVariable(name: "doubleVal", scope: !4, file: !1, line: 21, type: !23)
!26 = !DILocation(line: 21, column: 3, scope: !4)
!27 = !DILocalVariable(name: "floatVal", scope: !4, file: !1, line: 20, type: !20)
!28 = !DILocation(line: 20, column: 3, scope: !4)
!29 = !DILocalVariable(name: "longVal2", scope: !4, file: !1, line: 18, type: !30)
!30 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!31 = !DILocation(line: 18, column: 3, scope: !4)
!32 = !DILocalVariable(name: "ulongVal2", scope: !4, file: !1, line: 17, type: !33)
!33 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 17, column: 3, scope: !4)
!35 = !DILocalVariable(name: "ulongVal", scope: !4, file: !1, line: 16, type: !33)
!36 = !DILocation(line: 16, column: 3, scope: !4)
!37 = !DILocalVariable(name: "longVal", scope: !4, file: !1, line: 15, type: !30)
!38 = !DILocation(line: 15, column: 3, scope: !4)
!39 = !DILocalVariable(name: "intVal2", scope: !4, file: !1, line: 13, type: !7)
!40 = !DILocation(line: 13, column: 3, scope: !4)
!41 = !DILocalVariable(name: "uintVal2", scope: !4, file: !1, line: 12, type: !10)
!42 = !DILocation(line: 12, column: 3, scope: !4)
!43 = !DILocalVariable(name: "uintVal", scope: !4, file: !1, line: 11, type: !10)
!44 = !DILocation(line: 11, column: 3, scope: !4)
!45 = !DILocalVariable(name: "intVal", scope: !4, file: !1, line: 10, type: !7)
!46 = !DILocation(line: 10, column: 3, scope: !4)
!47 = !DILocalVariable(name: "charVal2", scope: !4, file: !1, line: 8, type: !48)
!48 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!49 = !DILocation(line: 8, column: 3, scope: !4)
!50 = !DILocalVariable(name: "ucharVal2", scope: !4, file: !1, line: 7, type: !13)
!51 = !DILocation(line: 7, column: 3, scope: !4)
!52 = !DILocalVariable(name: "ucharVal", scope: !4, file: !1, line: 6, type: !13)
!53 = !DILocation(line: 6, column: 3, scope: !4)
!54 = !DILocalVariable(name: "charVal", scope: !4, file: !1, line: 5, type: !48)
!55 = !DILocation(line: 5, column: 3, scope: !4)
!56 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 4, type: !7)
!57 = !DILocation(line: 4, column: 3, scope: !4)
!58 = !DILocation(line: 25, column: 3, scope: !4)
!59 = !DILocation(line: 25, column: 24, scope: !4)
!60 = !DILocation(line: 26, column: 3, scope: !4)
!61 = !DILocation(line: 26, column: 23, scope: !4)
!62 = !DILocation(line: 27, column: 3, scope: !4)
!63 = !DILocation(line: 27, column: 21, scope: !4)
!64 = !DILocation(line: 28, column: 3, scope: !4)
!65 = !DILocation(line: 28, column: 22, scope: !4)
!66 = !DILocation(line: 29, column: 3, scope: !4)
!67 = !DILocation(line: 29, column: 22, scope: !4)
!68 = !DILocation(line: 30, column: 3, scope: !4)
!69 = !DILocation(line: 30, column: 27, scope: !4)
!70 = !DILocation(line: 31, column: 3, scope: !4)
!71 = !DILocation(line: 31, column: 28, scope: !4)
!72 = !DILocation(line: 32, column: 3, scope: !4)
!73 = !DILocation(line: 32, column: 28, scope: !4)
!74 = !DILocation(line: 36, column: 3, scope: !4)
!75 = !DILocation(line: 36, column: 28, scope: !4)
!76 = !DILocation(line: 39, column: 3, scope: !4)
!77 = !DILocation(line: 39, column: 28, scope: !4)
!78 = !DILocation(line: 42, column: 3, scope: !4)
!79 = !DILocation(line: 42, column: 32, scope: !4)
!80 = !DILocation(line: 44, column: 3, scope: !4)
!81 = !DILocation(line: 45, column: 5, scope: !82)
!82 = distinct !DILexicalBlock(scope: !4, file: !1, line: 44, column: 17)
!83 = !DILocation(line: 47, column: 5, scope: !84)
!84 = distinct !DILexicalBlock(scope: !4, file: !1, line: 46, column: 10)
!85 = !DILocation(line: 49, column: 3, scope: !4)
