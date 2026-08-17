; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [19 x i8] c"8.function.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"8.function.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @sum(i32 %0, i32 %1) !dbg !4 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !8, !DIExpression(), !9)
  %l = alloca i32, align 4
    #dbg_declare(ptr %l, !10, !DIExpression(), !9)
  store i32 %0, ptr %l, align 4, !dbg !9
  store i32 %1, ptr %r, align 4, !dbg !9
  %2 = load i32, ptr %l, align 4, !dbg !11
  %3 = load i32, ptr %r, align 4, !dbg !11
  %4 = add i32 %2, %3, !dbg !11
  ret i32 %4, !dbg !11
}

define i32 @sum2(ptr %0, ptr %1) !dbg !12 {
entry:
  %r = alloca ptr, align 8
    #dbg_declare(ptr %r, !16, !DIExpression(), !17)
  %l = alloca ptr, align 8
    #dbg_declare(ptr %l, !18, !DIExpression(), !17)
  store ptr %0, ptr %l, align 8, !dbg !17
  store ptr %1, ptr %r, align 8, !dbg !17
  %2 = load ptr, ptr %l, align 8, !dbg !19
  %3 = load i32, ptr %2, align 4, !dbg !19
  %4 = load ptr, ptr %r, align 8, !dbg !19
  %5 = load i32, ptr %4, align 4, !dbg !19
  %6 = call i32 @sum(i32 %3, i32 %5), !dbg !19
  ret i32 %6, !dbg !19
}

define void @sum3(i32 %0, i32 %1, ptr %2) !dbg !20 {
entry:
  %result = alloca ptr, align 8
    #dbg_declare(ptr %result, !24, !DIExpression(), !25)
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !26, !DIExpression(), !25)
  %l = alloca i32, align 4
    #dbg_declare(ptr %l, !27, !DIExpression(), !25)
  store i32 %0, ptr %l, align 4, !dbg !25
  store i32 %1, ptr %r, align 4, !dbg !25
  store ptr %2, ptr %result, align 8, !dbg !25
  %3 = load ptr, ptr %result, align 8, !dbg !28
  %4 = load i32, ptr %l, align 4, !dbg !28
  %5 = load i32, ptr %r, align 4, !dbg !28
  %6 = add i32 %4, %5, !dbg !28
  store i32 %6, ptr %3, align 4, !dbg !28
  %7 = load i32, ptr %3, align 4, !dbg !28
  ret void, !dbg !28
}

define i32 @main() !dbg !29 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !32, !DIExpression(), !33)
  %l = alloca i32, align 4
    #dbg_declare(ptr %l, !34, !DIExpression(), !35)
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !36, !DIExpression(), !37)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !38, !DIExpression(), !39)
  store i32 0, ptr %err, align 4, !dbg !39
  store i32 3, ptr %l, align 4, !dbg !35
  store i32 4, ptr %r, align 4, !dbg !33
  %0 = call i32 @sum(i32 1, i32 2), !dbg !40
  %1 = icmp ne i32 %0, 3, !dbg !40
  br i1 %1, label %then, label %else, !dbg !40

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !41
  %2 = load i32, ptr %err, align 4, !dbg !41
  br label %if.end, !dbg !41

else:                                             ; preds = %entry
  br label %if.end, !dbg !41

if.end:                                           ; preds = %else, %then
  %3 = call i32 @sum(i32 3, i32 4), !dbg !42
  %4 = icmp ne i32 %3, 7, !dbg !42
  br i1 %4, label %then1, label %else2, !dbg !42

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !43
  %5 = load i32, ptr %err, align 4, !dbg !43
  br label %if.end3, !dbg !43

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !43

if.end3:                                          ; preds = %else2, %then1
  %6 = load i32, ptr %l, align 4, !dbg !44
  %7 = load i32, ptr %r, align 4, !dbg !44
  %8 = call i32 @sum(i32 %6, i32 %7), !dbg !44
  %9 = icmp ne i32 %8, 7, !dbg !44
  br i1 %9, label %then4, label %else5, !dbg !44

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !45
  %10 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end6, !dbg !45

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !45

if.end6:                                          ; preds = %else5, %then4
  %11 = call i32 @sum2(ptr %l, ptr %r), !dbg !46
  %12 = icmp ne i32 %11, 7, !dbg !46
  br i1 %12, label %then7, label %else8, !dbg !46

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !47
  %13 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end9, !dbg !47

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !47

if.end9:                                          ; preds = %else8, %then7
  call void @sum3(i32 3, i32 4, ptr %i), !dbg !48
  %14 = load i32, ptr %i, align 4, !dbg !49
  %15 = icmp ne i32 %14, 7, !dbg !49
  br i1 %15, label %then10, label %else11, !dbg !49

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !50
  %16 = load i32, ptr %err, align 4, !dbg !50
  br label %if.end12, !dbg !50

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !50

if.end12:                                         ; preds = %else11, %then10
  %17 = load i32, ptr %l, align 4, !dbg !51
  %18 = load i32, ptr %r, align 4, !dbg !51
  call void @sum3(i32 %17, i32 %18, ptr %i), !dbg !51
  %19 = load i32, ptr %i, align 4, !dbg !52
  %20 = icmp ne i32 %19, 7, !dbg !52
  br i1 %20, label %then13, label %else14, !dbg !52

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !53
  %21 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end15, !dbg !53

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !53

if.end15:                                         ; preds = %else14, %then13
  %22 = call i32 @sum(i32 1000000, i32 2000000), !dbg !54
  %23 = icmp ne i32 %22, 3000000, !dbg !54
  br i1 %23, label %then16, label %else17, !dbg !54

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !55
  %24 = load i32, ptr %err, align 4, !dbg !55
  br label %if.end18, !dbg !55

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !55

if.end18:                                         ; preds = %else17, %then16
  %25 = load i32, ptr %err, align 4, !dbg !56
  %26 = icmp eq i32 %25, 0, !dbg !56
  br i1 %26, label %then19, label %else20, !dbg !56

then19:                                           ; preds = %if.end18
  %27 = call i32 (ptr, ...) @printf(ptr @0), !dbg !57
  br label %if.end21, !dbg !57

else20:                                           ; preds = %if.end18
  %28 = call i32 (ptr, ...) @printf(ptr @1), !dbg !59
  br label %if.end21, !dbg !59

if.end21:                                         ; preds = %else20, %then19
  %29 = load i32, ptr %err, align 4, !dbg !61
  ret i32 %29, !dbg !61
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "8.function.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "sum", linkageName: "sum", scope: null, file: !3, line: 9, type: !5, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "r", arg: 2, scope: !4, file: !3, line: 9, type: !7)
!9 = !DILocation(line: 9, column: 5, scope: !4)
!10 = !DILocalVariable(name: "l", arg: 1, scope: !4, file: !3, line: 9, type: !7)
!11 = !DILocation(line: 9, column: 25, scope: !4)
!12 = distinct !DISubprogram(name: "sum2", linkageName: "sum2", scope: null, file: !3, line: 7, type: !13, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !2)
!13 = !DISubroutineType(types: !14)
!14 = !{!7, !15, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!16 = !DILocalVariable(name: "r", arg: 2, scope: !12, file: !3, line: 7, type: !15)
!17 = !DILocation(line: 7, column: 5, scope: !12)
!18 = !DILocalVariable(name: "l", arg: 1, scope: !12, file: !3, line: 7, type: !15)
!19 = !DILocation(line: 7, column: 28, scope: !12)
!20 = distinct !DISubprogram(name: "sum3", linkageName: "sum3", scope: null, file: !3, line: 8, type: !21, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{!23, !7, !7, !15}
!23 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!24 = !DILocalVariable(name: "result", arg: 3, scope: !20, file: !3, line: 8, type: !15)
!25 = !DILocation(line: 8, column: 6, scope: !20)
!26 = !DILocalVariable(name: "r", arg: 2, scope: !20, file: !3, line: 8, type: !7)
!27 = !DILocalVariable(name: "l", arg: 1, scope: !20, file: !3, line: 8, type: !7)
!28 = !DILocation(line: 8, column: 40, scope: !20)
!29 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 11, type: !30, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{!7}
!32 = !DILocalVariable(name: "r", scope: !29, file: !3, line: 15, type: !7)
!33 = !DILocation(line: 15, column: 3, scope: !29)
!34 = !DILocalVariable(name: "l", scope: !29, file: !3, line: 14, type: !7)
!35 = !DILocation(line: 14, column: 3, scope: !29)
!36 = !DILocalVariable(name: "i", scope: !29, file: !3, line: 13, type: !7)
!37 = !DILocation(line: 13, column: 3, scope: !29)
!38 = !DILocalVariable(name: "err", scope: !29, file: !3, line: 12, type: !7)
!39 = !DILocation(line: 12, column: 3, scope: !29)
!40 = !DILocation(line: 17, column: 3, scope: !29)
!41 = !DILocation(line: 17, column: 23, scope: !29)
!42 = !DILocation(line: 18, column: 3, scope: !29)
!43 = !DILocation(line: 18, column: 23, scope: !29)
!44 = !DILocation(line: 19, column: 3, scope: !29)
!45 = !DILocation(line: 19, column: 23, scope: !29)
!46 = !DILocation(line: 20, column: 3, scope: !29)
!47 = !DILocation(line: 20, column: 26, scope: !29)
!48 = !DILocation(line: 22, column: 3, scope: !29)
!49 = !DILocation(line: 23, column: 3, scope: !29)
!50 = !DILocation(line: 23, column: 15, scope: !29)
!51 = !DILocation(line: 24, column: 3, scope: !29)
!52 = !DILocation(line: 25, column: 3, scope: !29)
!53 = !DILocation(line: 25, column: 15, scope: !29)
!54 = !DILocation(line: 27, column: 3, scope: !29)
!55 = !DILocation(line: 27, column: 41, scope: !29)
!56 = !DILocation(line: 29, column: 3, scope: !29)
!57 = !DILocation(line: 30, column: 5, scope: !58)
!58 = distinct !DILexicalBlock(scope: !29, file: !3, line: 29, column: 17)
!59 = !DILocation(line: 32, column: 5, scope: !60)
!60 = distinct !DILexicalBlock(scope: !29, file: !3, line: 31, column: 10)
!61 = !DILocation(line: 34, column: 3, scope: !29)
