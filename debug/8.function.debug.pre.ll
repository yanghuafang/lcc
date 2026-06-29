; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [19 x i8] c"8.function.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"8.function.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @sum(i32 %0, i32 %1) !dbg !2 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !6, !DIExpression(), !7)
  %l = alloca i32, align 4
    #dbg_declare(ptr %l, !8, !DIExpression(), !7)
  store i32 %0, ptr %l, align 4, !dbg !7
  store i32 %1, ptr %r, align 4, !dbg !7
  %2 = load i32, ptr %l, align 4, !dbg !9
  %3 = load i32, ptr %r, align 4, !dbg !9
  %4 = add i32 %2, %3, !dbg !9
  ret i32 %4, !dbg !9
}

define i32 @sum2(ptr %0, ptr %1) !dbg !10 {
entry:
  %r = alloca ptr, align 8
    #dbg_declare(ptr %r, !14, !DIExpression(), !15)
  %l = alloca ptr, align 8
    #dbg_declare(ptr %l, !16, !DIExpression(), !15)
  store ptr %0, ptr %l, align 8, !dbg !15
  store ptr %1, ptr %r, align 8, !dbg !15
  %2 = load ptr, ptr %l, align 8, !dbg !17
  %3 = load i32, ptr %2, align 4, !dbg !17
  %4 = load ptr, ptr %r, align 8, !dbg !17
  %5 = load i32, ptr %4, align 4, !dbg !17
  %6 = call i32 @sum(i32 %3, i32 %5), !dbg !17
  ret i32 %6, !dbg !17
}

define void @sum3(i32 %0, i32 %1, ptr %2) !dbg !18 {
entry:
  %result = alloca ptr, align 8
    #dbg_declare(ptr %result, !22, !DIExpression(), !23)
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !24, !DIExpression(), !23)
  %l = alloca i32, align 4
    #dbg_declare(ptr %l, !25, !DIExpression(), !23)
  store i32 %0, ptr %l, align 4, !dbg !23
  store i32 %1, ptr %r, align 4, !dbg !23
  store ptr %2, ptr %result, align 8, !dbg !23
  %3 = load ptr, ptr %result, align 8, !dbg !26
  %4 = load i32, ptr %l, align 4, !dbg !26
  %5 = load i32, ptr %r, align 4, !dbg !26
  %6 = add i32 %4, %5, !dbg !26
  store i32 %6, ptr %3, align 4, !dbg !26
  %7 = load i32, ptr %3, align 4, !dbg !26
  ret void, !dbg !26
}

define i32 @main() !dbg !27 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !30, !DIExpression(), !31)
  %l = alloca i32, align 4
    #dbg_declare(ptr %l, !32, !DIExpression(), !33)
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !34, !DIExpression(), !35)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !36, !DIExpression(), !37)
  store i32 0, ptr %err, align 4, !dbg !37
  store i32 3, ptr %l, align 4, !dbg !33
  store i32 4, ptr %r, align 4, !dbg !31
  %0 = call i32 @sum(i32 1, i32 2), !dbg !38
  %1 = icmp ne i32 %0, 3, !dbg !38
  br i1 %1, label %then, label %else, !dbg !38

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !39
  %2 = load i32, ptr %err, align 4, !dbg !39
  br label %if.end, !dbg !39

else:                                             ; preds = %entry
  br label %if.end, !dbg !39

if.end:                                           ; preds = %else, %then
  %3 = call i32 @sum(i32 3, i32 4), !dbg !40
  %4 = icmp ne i32 %3, 7, !dbg !40
  br i1 %4, label %then1, label %else2, !dbg !40

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !41
  %5 = load i32, ptr %err, align 4, !dbg !41
  br label %if.end3, !dbg !41

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !41

if.end3:                                          ; preds = %else2, %then1
  %6 = load i32, ptr %l, align 4, !dbg !42
  %7 = load i32, ptr %r, align 4, !dbg !42
  %8 = call i32 @sum(i32 %6, i32 %7), !dbg !42
  %9 = icmp ne i32 %8, 7, !dbg !42
  br i1 %9, label %then4, label %else5, !dbg !42

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !43
  %10 = load i32, ptr %err, align 4, !dbg !43
  br label %if.end6, !dbg !43

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !43

if.end6:                                          ; preds = %else5, %then4
  %11 = call i32 @sum2(ptr %l, ptr %r), !dbg !44
  %12 = icmp ne i32 %11, 7, !dbg !44
  br i1 %12, label %then7, label %else8, !dbg !44

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !45
  %13 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end9, !dbg !45

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !45

if.end9:                                          ; preds = %else8, %then7
  call void @sum3(i32 3, i32 4, ptr %i), !dbg !46
  %14 = load i32, ptr %i, align 4, !dbg !47
  %15 = icmp ne i32 %14, 7, !dbg !47
  br i1 %15, label %then10, label %else11, !dbg !47

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !48
  %16 = load i32, ptr %err, align 4, !dbg !48
  br label %if.end12, !dbg !48

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !48

if.end12:                                         ; preds = %else11, %then10
  %17 = load i32, ptr %l, align 4, !dbg !49
  %18 = load i32, ptr %r, align 4, !dbg !49
  call void @sum3(i32 %17, i32 %18, ptr %i), !dbg !49
  %19 = load i32, ptr %i, align 4, !dbg !50
  %20 = icmp ne i32 %19, 7, !dbg !50
  br i1 %20, label %then13, label %else14, !dbg !50

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !51
  %21 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end15, !dbg !51

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !51

if.end15:                                         ; preds = %else14, %then13
  %22 = call i32 @sum(i32 1000000, i32 2000000), !dbg !52
  %23 = icmp ne i32 %22, 3000000, !dbg !52
  br i1 %23, label %then16, label %else17, !dbg !52

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !53
  %24 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end18, !dbg !53

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !53

if.end18:                                         ; preds = %else17, %then16
  %25 = load i32, ptr %err, align 4, !dbg !54
  %26 = icmp eq i32 %25, 0, !dbg !54
  br i1 %26, label %then19, label %else20, !dbg !54

then19:                                           ; preds = %if.end18
  %27 = call i32 (ptr, ...) @printf(ptr @0), !dbg !55
  br label %if.end21, !dbg !55

else20:                                           ; preds = %if.end18
  %28 = call i32 (ptr, ...) @printf(ptr @1), !dbg !57
  br label %if.end21, !dbg !57

if.end21:                                         ; preds = %else20, %then19
  %29 = load i32, ptr %err, align 4, !dbg !59
  ret i32 %29, !dbg !59
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "8.function.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "sum", linkageName: "sum", scope: null, file: !1, line: 7, type: !3, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "r", arg: 2, scope: !2, file: !1, line: 7, type: !5)
!7 = !DILocation(line: 7, column: 5, scope: !2)
!8 = !DILocalVariable(name: "l", arg: 1, scope: !2, file: !1, line: 7, type: !5)
!9 = !DILocation(line: 7, column: 25, scope: !2)
!10 = distinct !DISubprogram(name: "sum2", linkageName: "sum2", scope: null, file: !1, line: 5, type: !11, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0)
!11 = !DISubroutineType(types: !12)
!12 = !{!5, !13, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!14 = !DILocalVariable(name: "r", arg: 2, scope: !10, file: !1, line: 5, type: !13)
!15 = !DILocation(line: 5, column: 5, scope: !10)
!16 = !DILocalVariable(name: "l", arg: 1, scope: !10, file: !1, line: 5, type: !13)
!17 = !DILocation(line: 5, column: 28, scope: !10)
!18 = distinct !DISubprogram(name: "sum3", linkageName: "sum3", scope: null, file: !1, line: 6, type: !19, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0)
!19 = !DISubroutineType(types: !20)
!20 = !{!21, !5, !5, !13}
!21 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!22 = !DILocalVariable(name: "result", arg: 3, scope: !18, file: !1, line: 6, type: !13)
!23 = !DILocation(line: 6, column: 6, scope: !18)
!24 = !DILocalVariable(name: "r", arg: 2, scope: !18, file: !1, line: 6, type: !5)
!25 = !DILocalVariable(name: "l", arg: 1, scope: !18, file: !1, line: 6, type: !5)
!26 = !DILocation(line: 6, column: 40, scope: !18)
!27 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 9, type: !28, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0)
!28 = !DISubroutineType(types: !29)
!29 = !{!5}
!30 = !DILocalVariable(name: "r", scope: !27, file: !1, line: 13, type: !5)
!31 = !DILocation(line: 13, column: 3, scope: !27)
!32 = !DILocalVariable(name: "l", scope: !27, file: !1, line: 12, type: !5)
!33 = !DILocation(line: 12, column: 3, scope: !27)
!34 = !DILocalVariable(name: "i", scope: !27, file: !1, line: 11, type: !5)
!35 = !DILocation(line: 11, column: 3, scope: !27)
!36 = !DILocalVariable(name: "err", scope: !27, file: !1, line: 10, type: !5)
!37 = !DILocation(line: 10, column: 3, scope: !27)
!38 = !DILocation(line: 15, column: 3, scope: !27)
!39 = !DILocation(line: 15, column: 23, scope: !27)
!40 = !DILocation(line: 16, column: 3, scope: !27)
!41 = !DILocation(line: 16, column: 23, scope: !27)
!42 = !DILocation(line: 17, column: 3, scope: !27)
!43 = !DILocation(line: 17, column: 23, scope: !27)
!44 = !DILocation(line: 18, column: 3, scope: !27)
!45 = !DILocation(line: 18, column: 26, scope: !27)
!46 = !DILocation(line: 20, column: 3, scope: !27)
!47 = !DILocation(line: 21, column: 3, scope: !27)
!48 = !DILocation(line: 21, column: 15, scope: !27)
!49 = !DILocation(line: 22, column: 3, scope: !27)
!50 = !DILocation(line: 23, column: 3, scope: !27)
!51 = !DILocation(line: 23, column: 15, scope: !27)
!52 = !DILocation(line: 25, column: 3, scope: !27)
!53 = !DILocation(line: 25, column: 41, scope: !27)
!54 = !DILocation(line: 27, column: 3, scope: !27)
!55 = !DILocation(line: 28, column: 5, scope: !56)
!56 = distinct !DILexicalBlock(scope: !27, file: !1, line: 27, column: 17)
!57 = !DILocation(line: 30, column: 5, scope: !58)
!58 = distinct !DILexicalBlock(scope: !27, file: !1, line: 29, column: 10)
!59 = !DILocation(line: 32, column: 3, scope: !27)
