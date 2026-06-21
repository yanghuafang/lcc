; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [31 x i8] c"26.operator_precedence.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"26.operator_precedence.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define void @subFunc(i32 %0) !dbg !2 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !8, metadata !DIExpression()), !dbg !9
  store i32 %0, i32* %i, align 4, !dbg !9
  ret void, !dbg !9
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @main() !dbg !10 {
entry:
  %const43 = bitcast i64 -7296712171277459728 to i64
  %const = bitcast i64 1311768465173141112 to i64
  %decB = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %decB, metadata !13, metadata !DIExpression()), !dbg !14
  %decA = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %decA, metadata !15, metadata !DIExpression()), !dbg !16
  %incB = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %incB, metadata !17, metadata !DIExpression()), !dbg !18
  %incA = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %incA, metadata !19, metadata !DIExpression()), !dbg !20
  %callI = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %callI, metadata !21, metadata !DIExpression()), !dbg !23
  %mulC = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %mulC, metadata !24, metadata !DIExpression()), !dbg !26
  %mulB = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %mulB, metadata !27, metadata !DIExpression()), !dbg !28
  %mulA = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %mulA, metadata !29, metadata !DIExpression()), !dbg !30
  %minusA = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %minusA, metadata !31, metadata !DIExpression()), !dbg !32
  %plusA = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %plusA, metadata !33, metadata !DIExpression()), !dbg !34
  %d = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %d, metadata !35, metadata !DIExpression()), !dbg !37
  %c = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %c, metadata !38, metadata !DIExpression()), !dbg !39
  %b = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %b, metadata !40, metadata !DIExpression()), !dbg !41
  %a = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %a, metadata !42, metadata !DIExpression()), !dbg !43
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !44, metadata !DIExpression()), !dbg !45
  store i32 0, i32* %err, align 4, !dbg !45
  store i64 %const, i64* %a, align 4, !dbg !43
  store i64 %const43, i64* %b, align 4, !dbg !41
  %0 = ptrtoint i64* %a to i64, !dbg !39
  store i64 %0, i64* %c, align 4, !dbg !39
  %1 = ptrtoint i64* %c to i64, !dbg !37
  %2 = load i64, i64* %a, align 4, !dbg !37
  %3 = and i64 %1, %2, !dbg !37
  %4 = load i64, i64* %b, align 4, !dbg !37
  %5 = and i64 %3, %4, !dbg !37
  store i64 %5, i64* %d, align 4, !dbg !37
  %6 = load i64, i64* %a, align 4, !dbg !46
  %7 = icmp ne i64 %6, %const, !dbg !46
  br i1 %7, label %then, label %if.end, !dbg !46

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !47
  %8 = load i32, i32* %err, align 4, !dbg !47
  br label %if.end, !dbg !47

if.end:                                           ; preds = %entry, %then
  %9 = load i64, i64* %b, align 4, !dbg !48
  %10 = icmp ne i64 %9, %const43, !dbg !48
  br i1 %10, label %then1, label %if.end3, !dbg !48

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !49
  %11 = load i32, i32* %err, align 4, !dbg !49
  br label %if.end3, !dbg !49

if.end3:                                          ; preds = %if.end, %then1
  store i32 13, i32* %plusA, align 4, !dbg !34
  %12 = load i32, i32* %plusA, align 4, !dbg !50
  %13 = add i32 3, %12, !dbg !50
  %14 = icmp ne i32 %13, 16, !dbg !50
  br i1 %14, label %then4, label %if.end6, !dbg !50

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !51
  %15 = load i32, i32* %err, align 4, !dbg !51
  br label %if.end6, !dbg !51

if.end6:                                          ; preds = %if.end3, %then4
  %16 = load i32, i32* %plusA, align 4, !dbg !52
  %17 = sub i32 3, %16, !dbg !52
  %18 = icmp ne i32 %17, -10, !dbg !52
  br i1 %18, label %then7, label %if.end15, !dbg !52

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !53
  %19 = load i32, i32* %err, align 4, !dbg !53
  br label %if.end15, !dbg !53

if.end15:                                         ; preds = %if.end6, %then7
  store i32 13, i32* %minusA, align 4, !dbg !32
  %20 = load i32, i32* %minusA, align 4, !dbg !54
  %21 = sub i32 0, %20, !dbg !54
  %22 = sub i32 3, %21, !dbg !54
  %23 = icmp ne i32 %22, 16, !dbg !54
  br i1 %23, label %then16, label %if.end21, !dbg !54

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !55
  %24 = load i32, i32* %err, align 4, !dbg !55
  br label %if.end21, !dbg !55

if.end21:                                         ; preds = %if.end15, %then16
  store i32 3, i32* %mulA, align 4, !dbg !30
  store i32 4, i32* %mulB, align 4, !dbg !28
  store i32* %mulB, i32** %mulC, align 8, !dbg !26
  %25 = load i32, i32* %mulA, align 4, !dbg !56
  %26 = load i32, i32* %mulB, align 4, !dbg !56
  %27 = mul i32 %25, %26, !dbg !56
  %28 = load i32*, i32** %mulC, align 8, !dbg !56
  %29 = load i32, i32* %28, align 4, !dbg !56
  %30 = mul i32 %27, %29, !dbg !56
  %31 = icmp ne i32 %30, 48, !dbg !56
  br i1 %31, label %then22, label %if.end24, !dbg !56

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !57
  %32 = load i32, i32* %err, align 4, !dbg !57
  br label %if.end24, !dbg !57

if.end24:                                         ; preds = %if.end21, %then22
  store i64 1234, i64* %callI, align 4, !dbg !23
  %33 = load i64, i64* %callI, align 4, !dbg !58
  %34 = trunc i64 %33 to i32, !dbg !58
  call void @subFunc(i32 %34), !dbg !58
  %35 = load i64, i64* %callI, align 4, !dbg !59
  %36 = trunc i64 %35 to i32, !dbg !59
  %37 = icmp ne i32 %36, 1234, !dbg !59
  br i1 %37, label %then25, label %if.end27, !dbg !59

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !60
  %38 = load i32, i32* %err, align 4, !dbg !60
  br label %if.end27, !dbg !60

if.end27:                                         ; preds = %if.end24, %then25
  store i32 10, i32* %incA, align 4, !dbg !20
  %39 = load i32, i32* %incA, align 4, !dbg !18
  %40 = add i32 %39, 1, !dbg !18
  store i32 %40, i32* %incA, align 4, !dbg !18
  %41 = load i32, i32* %incA, align 4, !dbg !18
  %42 = add i32 %41, 1, !dbg !18
  store i32 %42, i32* %incA, align 4, !dbg !18
  store i32 %41, i32* %incB, align 4, !dbg !18
  %43 = load i32, i32* %incA, align 4, !dbg !61
  %44 = icmp ne i32 %43, 12, !dbg !61
  br i1 %44, label %then28, label %if.end30, !dbg !61

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !62
  %45 = load i32, i32* %err, align 4, !dbg !62
  br label %if.end30, !dbg !62

if.end30:                                         ; preds = %if.end27, %then28
  %46 = load i32, i32* %incB, align 4, !dbg !63
  %47 = icmp ne i32 %46, 11, !dbg !63
  br i1 %47, label %then31, label %if.end33, !dbg !63

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !64
  %48 = load i32, i32* %err, align 4, !dbg !64
  br label %if.end33, !dbg !64

if.end33:                                         ; preds = %if.end30, %then31
  store i32 10, i32* %decA, align 4, !dbg !16
  %49 = load i32, i32* %decA, align 4, !dbg !14
  %50 = sub i32 %49, 1, !dbg !14
  store i32 %50, i32* %decA, align 4, !dbg !14
  %51 = load i32, i32* %decA, align 4, !dbg !14
  %52 = sub i32 %51, 1, !dbg !14
  store i32 %52, i32* %decA, align 4, !dbg !14
  store i32 %51, i32* %decB, align 4, !dbg !14
  %53 = load i32, i32* %decA, align 4, !dbg !65
  %54 = icmp ne i32 %53, 8, !dbg !65
  br i1 %54, label %then34, label %if.end36, !dbg !65

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4, !dbg !66
  %55 = load i32, i32* %err, align 4, !dbg !66
  br label %if.end36, !dbg !66

if.end36:                                         ; preds = %if.end33, %then34
  %56 = load i32, i32* %decB, align 4, !dbg !67
  %57 = icmp ne i32 %56, 9, !dbg !67
  br i1 %57, label %then37, label %if.end39, !dbg !67

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4, !dbg !68
  %58 = load i32, i32* %err, align 4, !dbg !68
  br label %if.end39, !dbg !68

if.end39:                                         ; preds = %if.end36, %then37
  %59 = load i32, i32* %err, align 4, !dbg !69
  %60 = icmp eq i32 %59, 0, !dbg !69
  %. = select i1 %60, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @1, i32 0, i32 0), !dbg !70
  %61 = call i32 (i8*, ...) @printf(i8* %.), !dbg !70
  %62 = load i32, i32* %err, align 4, !dbg !71
  ret i32 %62, !dbg !71
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

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
!54 = !DILocation(line: 22, column: 3, scope: !10)
!55 = !DILocation(line: 22, column: 26, scope: !10)
!56 = !DILocation(line: 28, column: 3, scope: !10)
!57 = !DILocation(line: 28, column: 34, scope: !10)
!58 = !DILocation(line: 31, column: 3, scope: !10)
!59 = !DILocation(line: 32, column: 3, scope: !10)
!60 = !DILocation(line: 32, column: 27, scope: !10)
!61 = !DILocation(line: 36, column: 3, scope: !10)
!62 = !DILocation(line: 36, column: 19, scope: !10)
!63 = !DILocation(line: 37, column: 3, scope: !10)
!64 = !DILocation(line: 37, column: 19, scope: !10)
!65 = !DILocation(line: 41, column: 3, scope: !10)
!66 = !DILocation(line: 41, column: 18, scope: !10)
!67 = !DILocation(line: 42, column: 3, scope: !10)
!68 = !DILocation(line: 42, column: 18, scope: !10)
!69 = !DILocation(line: 44, column: 3, scope: !10)
!70 = !DILocation(line: 0, scope: !10)
!71 = !DILocation(line: 49, column: 3, scope: !10)
