; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [19 x i8] c"14.bitwise.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"14.bitwise.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %signedVal = alloca i32, align 4
    #dbg_declare(ptr %signedVal, !8, !DIExpression(), !9)
  %msbSet = alloca i32, align 4
    #dbg_declare(ptr %msbSet, !10, !DIExpression(), !12)
  %rightShiftVal = alloca i32, align 4
    #dbg_declare(ptr %rightShiftVal, !13, !DIExpression(), !14)
  %leftShiftVal = alloca i32, align 4
    #dbg_declare(ptr %leftShiftVal, !15, !DIExpression(), !16)
  %xoreqVal = alloca i32, align 4
    #dbg_declare(ptr %xoreqVal, !17, !DIExpression(), !18)
  %oreqVal = alloca i32, align 4
    #dbg_declare(ptr %oreqVal, !19, !DIExpression(), !20)
  %andeqVal = alloca i32, align 4
    #dbg_declare(ptr %andeqVal, !21, !DIExpression(), !22)
  %notVal2 = alloca i32, align 4
    #dbg_declare(ptr %notVal2, !23, !DIExpression(), !24)
  %notVal1 = alloca i32, align 4
    #dbg_declare(ptr %notVal1, !25, !DIExpression(), !26)
  %xorVal = alloca i32, align 4
    #dbg_declare(ptr %xorVal, !27, !DIExpression(), !28)
  %orVal = alloca i32, align 4
    #dbg_declare(ptr %orVal, !29, !DIExpression(), !30)
  %andVal = alloca i32, align 4
    #dbg_declare(ptr %andVal, !31, !DIExpression(), !32)
  %b = alloca i32, align 4
    #dbg_declare(ptr %b, !33, !DIExpression(), !34)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !35, !DIExpression(), !36)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !37, !DIExpression(), !38)
  store i32 0, ptr %err, align 4, !dbg !38
  store i32 305419896, ptr %a, align 4, !dbg !36
  store i32 -2023406815, ptr %b, align 4, !dbg !34
  %0 = load i32, ptr %a, align 4, !dbg !32
  %1 = load i32, ptr %b, align 4, !dbg !32
  %2 = and i32 %0, %1, !dbg !32
  store i32 %2, ptr %andVal, align 4, !dbg !32
  %3 = load i32, ptr %a, align 4, !dbg !30
  %4 = load i32, ptr %b, align 4, !dbg !30
  %5 = or i32 %3, %4, !dbg !30
  store i32 %5, ptr %orVal, align 4, !dbg !30
  %6 = load i32, ptr %a, align 4, !dbg !28
  %7 = load i32, ptr %b, align 4, !dbg !28
  %8 = xor i32 %6, %7, !dbg !28
  store i32 %8, ptr %xorVal, align 4, !dbg !28
  %9 = load i32, ptr %a, align 4, !dbg !26
  %10 = xor i32 %9, -1, !dbg !26
  store i32 %10, ptr %notVal1, align 4, !dbg !26
  %11 = load i32, ptr %b, align 4, !dbg !24
  %12 = xor i32 %11, -1, !dbg !24
  store i32 %12, ptr %notVal2, align 4, !dbg !24
  %13 = load i32, ptr %andVal, align 4, !dbg !22
  store i32 %13, ptr %andeqVal, align 4, !dbg !22
  %14 = load i32, ptr %a, align 4, !dbg !39
  %15 = load i32, ptr %andeqVal, align 4, !dbg !39
  %16 = and i32 %15, %14, !dbg !39
  store i32 %16, ptr %andeqVal, align 4, !dbg !39
  %17 = load i32, ptr %andeqVal, align 4, !dbg !39
  %18 = load i32, ptr %orVal, align 4, !dbg !20
  store i32 %18, ptr %oreqVal, align 4, !dbg !20
  %19 = load i32, ptr %a, align 4, !dbg !40
  %20 = load i32, ptr %oreqVal, align 4, !dbg !40
  %21 = or i32 %20, %19, !dbg !40
  store i32 %21, ptr %oreqVal, align 4, !dbg !40
  %22 = load i32, ptr %oreqVal, align 4, !dbg !40
  %23 = load i32, ptr %xorVal, align 4, !dbg !18
  store i32 %23, ptr %xoreqVal, align 4, !dbg !18
  %24 = load i32, ptr %a, align 4, !dbg !41
  %25 = load i32, ptr %xoreqVal, align 4, !dbg !41
  %26 = xor i32 %25, %24, !dbg !41
  store i32 %26, ptr %xoreqVal, align 4, !dbg !41
  %27 = load i32, ptr %xoreqVal, align 4, !dbg !41
  %28 = load i32, ptr %a, align 4, !dbg !16
  %29 = shl i32 %28, 8, !dbg !16
  store i32 %29, ptr %leftShiftVal, align 4, !dbg !16
  %30 = load i32, ptr %b, align 4, !dbg !14
  %31 = lshr i32 %30, 8, !dbg !14
  store i32 %31, ptr %rightShiftVal, align 4, !dbg !14
  %32 = load i32, ptr %leftShiftVal, align 4, !dbg !42
  %33 = shl i32 %32, 8, !dbg !42
  store i32 %33, ptr %leftShiftVal, align 4, !dbg !42
  %34 = load i32, ptr %leftShiftVal, align 4, !dbg !42
  %35 = load i32, ptr %rightShiftVal, align 4, !dbg !43
  %36 = lshr i32 %35, 8, !dbg !43
  store i32 %36, ptr %rightShiftVal, align 4, !dbg !43
  %37 = load i32, ptr %rightShiftVal, align 4, !dbg !43
  %38 = load i32, ptr %andVal, align 4, !dbg !44
  %39 = icmp ne i32 %38, 35930656, !dbg !44
  br i1 %39, label %then, label %else, !dbg !44

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !45
  %40 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end, !dbg !45

else:                                             ; preds = %entry
  br label %if.end, !dbg !45

if.end:                                           ; preds = %else, %then
  %41 = load i32, ptr %orVal, align 4, !dbg !46
  %42 = icmp ne i32 %41, -1753917575, !dbg !46
  br i1 %42, label %then1, label %else2, !dbg !46

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !47
  %43 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end3, !dbg !47

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !47

if.end3:                                          ; preds = %else2, %then1
  %44 = load i32, ptr %xorVal, align 4, !dbg !48
  %45 = icmp ne i32 %44, -1789848231, !dbg !48
  br i1 %45, label %then4, label %else5, !dbg !48

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !49
  %46 = load i32, ptr %err, align 4, !dbg !49
  br label %if.end6, !dbg !49

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !49

if.end6:                                          ; preds = %else5, %then4
  %47 = load i32, ptr %notVal1, align 4, !dbg !50
  %48 = icmp ne i32 %47, -305419897, !dbg !50
  br i1 %48, label %then7, label %else8, !dbg !50

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !51
  %49 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end9, !dbg !51

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !51

if.end9:                                          ; preds = %else8, %then7
  %50 = load i32, ptr %notVal2, align 4, !dbg !52
  %51 = icmp ne i32 %50, 2023406814, !dbg !52
  br i1 %51, label %then10, label %else11, !dbg !52

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !53
  %52 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end12, !dbg !53

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !53

if.end12:                                         ; preds = %else11, %then10
  %53 = load i32, ptr %andeqVal, align 4, !dbg !54
  %54 = icmp ne i32 %53, 35930656, !dbg !54
  br i1 %54, label %then13, label %else14, !dbg !54

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !55
  %55 = load i32, ptr %err, align 4, !dbg !55
  br label %if.end15, !dbg !55

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !55

if.end15:                                         ; preds = %else14, %then13
  %56 = load i32, ptr %oreqVal, align 4, !dbg !56
  %57 = icmp ne i32 %56, -1753917575, !dbg !56
  br i1 %57, label %then16, label %else17, !dbg !56

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !57
  %58 = load i32, ptr %err, align 4, !dbg !57
  br label %if.end18, !dbg !57

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !57

if.end18:                                         ; preds = %else17, %then16
  %59 = load i32, ptr %xoreqVal, align 4, !dbg !58
  %60 = icmp ne i32 %59, -2023406815, !dbg !58
  br i1 %60, label %then19, label %else20, !dbg !58

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !59
  %61 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end21, !dbg !59

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !59

if.end21:                                         ; preds = %else20, %then19
  %62 = load i32, ptr %leftShiftVal, align 4, !dbg !60
  %63 = icmp ne i32 %62, 1450704896, !dbg !60
  br i1 %63, label %then22, label %else23, !dbg !60

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !61
  %64 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end24, !dbg !61

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !61

if.end24:                                         ; preds = %else23, %then22
  %65 = load i32, ptr %rightShiftVal, align 4, !dbg !62
  %66 = icmp ne i32 %65, 34661, !dbg !62
  br i1 %66, label %then25, label %else26, !dbg !62

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !63
  %67 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end27, !dbg !63

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !63

if.end27:                                         ; preds = %else26, %then25
  store i32 -2147483648, ptr %msbSet, align 4, !dbg !12
  %68 = load i32, ptr %msbSet, align 4, !dbg !64
  %69 = lshr i32 %68, 1, !dbg !64
  %70 = icmp ne i32 %69, 1073741824, !dbg !64
  br i1 %70, label %then28, label %else29, !dbg !64

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !65
  %71 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end30, !dbg !65

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !65

if.end30:                                         ; preds = %else29, %then28
  store i32 -8, ptr %signedVal, align 4, !dbg !9
  %72 = load i32, ptr %signedVal, align 4, !dbg !66
  %73 = ashr i32 %72, 1, !dbg !66
  %74 = icmp ne i32 %73, -4, !dbg !66
  br i1 %74, label %then31, label %else32, !dbg !66

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !67
  %75 = load i32, ptr %err, align 4, !dbg !67
  br label %if.end33, !dbg !67

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !67

if.end33:                                         ; preds = %else32, %then31
  %76 = load i32, ptr %err, align 4, !dbg !68
  %77 = icmp eq i32 %76, 0, !dbg !68
  br i1 %77, label %then34, label %else35, !dbg !68

then34:                                           ; preds = %if.end33
  %78 = call i32 (ptr, ...) @printf(ptr @0), !dbg !69
  br label %if.end36, !dbg !69

else35:                                           ; preds = %if.end33
  %79 = call i32 (ptr, ...) @printf(ptr @1), !dbg !71
  br label %if.end36, !dbg !71

if.end36:                                         ; preds = %else35, %then34
  %80 = load i32, ptr %err, align 4, !dbg !73
  ret i32 %80, !dbg !73
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "14.bitwise.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "signedVal", scope: !4, file: !3, line: 43, type: !7)
!9 = !DILocation(line: 43, column: 3, scope: !4)
!10 = !DILocalVariable(name: "msbSet", scope: !4, file: !3, line: 40, type: !11)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !DILocation(line: 40, column: 3, scope: !4)
!13 = !DILocalVariable(name: "rightShiftVal", scope: !4, file: !3, line: 25, type: !11)
!14 = !DILocation(line: 25, column: 3, scope: !4)
!15 = !DILocalVariable(name: "leftShiftVal", scope: !4, file: !3, line: 24, type: !11)
!16 = !DILocation(line: 24, column: 3, scope: !4)
!17 = !DILocalVariable(name: "xoreqVal", scope: !4, file: !3, line: 21, type: !11)
!18 = !DILocation(line: 21, column: 3, scope: !4)
!19 = !DILocalVariable(name: "oreqVal", scope: !4, file: !3, line: 19, type: !11)
!20 = !DILocation(line: 19, column: 3, scope: !4)
!21 = !DILocalVariable(name: "andeqVal", scope: !4, file: !3, line: 17, type: !11)
!22 = !DILocation(line: 17, column: 3, scope: !4)
!23 = !DILocalVariable(name: "notVal2", scope: !4, file: !3, line: 15, type: !11)
!24 = !DILocation(line: 15, column: 3, scope: !4)
!25 = !DILocalVariable(name: "notVal1", scope: !4, file: !3, line: 14, type: !11)
!26 = !DILocation(line: 14, column: 3, scope: !4)
!27 = !DILocalVariable(name: "xorVal", scope: !4, file: !3, line: 13, type: !11)
!28 = !DILocation(line: 13, column: 3, scope: !4)
!29 = !DILocalVariable(name: "orVal", scope: !4, file: !3, line: 12, type: !11)
!30 = !DILocation(line: 12, column: 3, scope: !4)
!31 = !DILocalVariable(name: "andVal", scope: !4, file: !3, line: 11, type: !11)
!32 = !DILocation(line: 11, column: 3, scope: !4)
!33 = !DILocalVariable(name: "b", scope: !4, file: !3, line: 9, type: !11)
!34 = !DILocation(line: 9, column: 3, scope: !4)
!35 = !DILocalVariable(name: "a", scope: !4, file: !3, line: 8, type: !11)
!36 = !DILocation(line: 8, column: 3, scope: !4)
!37 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 7, type: !7)
!38 = !DILocation(line: 7, column: 3, scope: !4)
!39 = !DILocation(line: 18, column: 3, scope: !4)
!40 = !DILocation(line: 20, column: 3, scope: !4)
!41 = !DILocation(line: 22, column: 3, scope: !4)
!42 = !DILocation(line: 26, column: 3, scope: !4)
!43 = !DILocation(line: 27, column: 3, scope: !4)
!44 = !DILocation(line: 29, column: 3, scope: !4)
!45 = !DILocation(line: 29, column: 29, scope: !4)
!46 = !DILocation(line: 30, column: 3, scope: !4)
!47 = !DILocation(line: 30, column: 28, scope: !4)
!48 = !DILocation(line: 31, column: 3, scope: !4)
!49 = !DILocation(line: 31, column: 29, scope: !4)
!50 = !DILocation(line: 32, column: 3, scope: !4)
!51 = !DILocation(line: 32, column: 30, scope: !4)
!52 = !DILocation(line: 33, column: 3, scope: !4)
!53 = !DILocation(line: 33, column: 30, scope: !4)
!54 = !DILocation(line: 34, column: 3, scope: !4)
!55 = !DILocation(line: 34, column: 31, scope: !4)
!56 = !DILocation(line: 35, column: 3, scope: !4)
!57 = !DILocation(line: 35, column: 30, scope: !4)
!58 = !DILocation(line: 36, column: 3, scope: !4)
!59 = !DILocation(line: 36, column: 31, scope: !4)
!60 = !DILocation(line: 37, column: 3, scope: !4)
!61 = !DILocation(line: 37, column: 35, scope: !4)
!62 = !DILocation(line: 38, column: 3, scope: !4)
!63 = !DILocation(line: 38, column: 32, scope: !4)
!64 = !DILocation(line: 41, column: 3, scope: !4)
!65 = !DILocation(line: 41, column: 36, scope: !4)
!66 = !DILocation(line: 44, column: 3, scope: !4)
!67 = !DILocation(line: 44, column: 31, scope: !4)
!68 = !DILocation(line: 46, column: 3, scope: !4)
!69 = !DILocation(line: 47, column: 5, scope: !70)
!70 = distinct !DILexicalBlock(scope: !4, file: !3, line: 46, column: 17)
!71 = !DILocation(line: 49, column: 5, scope: !72)
!72 = distinct !DILexicalBlock(scope: !4, file: !3, line: 48, column: 10)
!73 = !DILocation(line: 51, column: 3, scope: !4)
