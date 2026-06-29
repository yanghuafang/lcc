; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [24 x i8] c"1.builtin_types.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"1.builtin_types.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %bf = alloca i1, align 1
    #dbg_declare(ptr %bf, !7, !DIExpression(), !9)
  %bt = alloca i1, align 1
    #dbg_declare(ptr %bt, !10, !DIExpression(), !11)
  %db = alloca double, align 8
    #dbg_declare(ptr %db, !12, !DIExpression(), !14)
  %fl = alloca float, align 4
    #dbg_declare(ptr %fl, !15, !DIExpression(), !17)
  %uln = alloca i64, align 8
    #dbg_declare(ptr %uln, !18, !DIExpression(), !20)
  %uint = alloca i32, align 4
    #dbg_declare(ptr %uint, !21, !DIExpression(), !23)
  %uch = alloca i8, align 1
    #dbg_declare(ptr %uch, !24, !DIExpression(), !26)
  %ln = alloca i64, align 8
    #dbg_declare(ptr %ln, !27, !DIExpression(), !29)
  %in = alloca i32, align 4
    #dbg_declare(ptr %in, !30, !DIExpression(), !31)
  %sh = alloca i16, align 2
    #dbg_declare(ptr %sh, !32, !DIExpression(), !34)
  %ch = alloca i8, align 1
    #dbg_declare(ptr %ch, !35, !DIExpression(), !37)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !38, !DIExpression(), !39)
  store i32 0, ptr %err, align 4, !dbg !39
  store i8 65, ptr %ch, align 1, !dbg !37
  store i16 -1024, ptr %sh, align 2, !dbg !34
  store i32 -12345678, ptr %in, align 4, !dbg !31
  store i64 -1234567890, ptr %ln, align 4, !dbg !29
  store i8 -6, ptr %uch, align 1, !dbg !26
  store i32 180150000, ptr %uint, align 4, !dbg !23
  store i64 9876043210, ptr %uln, align 4, !dbg !20
  store float 0x400921FB40000000, ptr %fl, align 4, !dbg !17
  store double 0x400921FB54442D11, ptr %db, align 8, !dbg !14
  store i1 true, ptr %bt, align 1, !dbg !11
  store i1 false, ptr %bf, align 1, !dbg !9
  %0 = load i8, ptr %ch, align 1, !dbg !40
  %1 = sext i8 %0 to i32, !dbg !40
  %2 = icmp ne i32 %1, 65, !dbg !40
  br i1 %2, label %then, label %else, !dbg !40

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !41
  %3 = load i32, ptr %err, align 4, !dbg !41
  br label %if.end, !dbg !41

else:                                             ; preds = %entry
  br label %if.end, !dbg !41

if.end:                                           ; preds = %else, %then
  %4 = load i16, ptr %sh, align 2, !dbg !42
  %5 = sext i16 %4 to i32, !dbg !42
  %6 = icmp ne i32 %5, -1024, !dbg !42
  br i1 %6, label %then1, label %else2, !dbg !42

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !43
  %7 = load i32, ptr %err, align 4, !dbg !43
  br label %if.end3, !dbg !43

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !43

if.end3:                                          ; preds = %else2, %then1
  %8 = load i32, ptr %in, align 4, !dbg !44
  %9 = icmp ne i32 %8, -12345678, !dbg !44
  br i1 %9, label %then4, label %else5, !dbg !44

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !45
  %10 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end6, !dbg !45

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !45

if.end6:                                          ; preds = %else5, %then4
  %11 = load i64, ptr %ln, align 4, !dbg !46
  %12 = icmp ne i64 %11, -1234567890, !dbg !46
  br i1 %12, label %then7, label %else8, !dbg !46

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !47
  %13 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end9, !dbg !47

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !47

if.end9:                                          ; preds = %else8, %then7
  %14 = load i8, ptr %uch, align 1, !dbg !48
  %15 = zext i8 %14 to i32, !dbg !48
  %16 = icmp ne i32 %15, 250, !dbg !48
  br i1 %16, label %then10, label %else11, !dbg !48

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !49
  %17 = load i32, ptr %err, align 4, !dbg !49
  br label %if.end12, !dbg !49

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !49

if.end12:                                         ; preds = %else11, %then10
  %18 = load i32, ptr %uint, align 4, !dbg !50
  %19 = icmp ne i32 %18, 180150000, !dbg !50
  br i1 %19, label %then13, label %else14, !dbg !50

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !51
  %20 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end15, !dbg !51

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !51

if.end15:                                         ; preds = %else14, %then13
  %21 = load i64, ptr %uln, align 4, !dbg !52
  %22 = icmp ne i64 %21, 9876043210, !dbg !52
  br i1 %22, label %then16, label %else17, !dbg !52

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !53
  %23 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end18, !dbg !53

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !53

if.end18:                                         ; preds = %else17, %then16
  %24 = load i1, ptr %bt, align 1, !dbg !54
  %25 = zext i1 %24 to i32, !dbg !54
  %26 = icmp ne i32 %25, 1, !dbg !54
  br i1 %26, label %then19, label %else20, !dbg !54

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !55
  %27 = load i32, ptr %err, align 4, !dbg !55
  br label %if.end21, !dbg !55

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !55

if.end21:                                         ; preds = %else20, %then19
  %28 = load i1, ptr %bf, align 1, !dbg !56
  %29 = zext i1 %28 to i32, !dbg !56
  %30 = icmp ne i32 %29, 0, !dbg !56
  br i1 %30, label %then22, label %else23, !dbg !56

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !57
  %31 = load i32, ptr %err, align 4, !dbg !57
  br label %if.end24, !dbg !57

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !57

if.end24:                                         ; preds = %else23, %then22
  %32 = load i32, ptr %err, align 4, !dbg !58
  %33 = icmp eq i32 %32, 0, !dbg !58
  br i1 %33, label %then25, label %else26, !dbg !58

then25:                                           ; preds = %if.end24
  %34 = call i32 (ptr, ...) @printf(ptr @0), !dbg !59
  br label %if.end27, !dbg !59

else26:                                           ; preds = %if.end24
  %35 = call i32 (ptr, ...) @printf(ptr @1), !dbg !61
  br label %if.end27, !dbg !61

if.end27:                                         ; preds = %else26, %then25
  %36 = load i32, ptr %err, align 4, !dbg !63
  ret i32 %36, !dbg !63
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "1.builtin_types.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "bf", scope: !2, file: !1, line: 15, type: !8)
!8 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!9 = !DILocation(line: 15, column: 3, scope: !2)
!10 = !DILocalVariable(name: "bt", scope: !2, file: !1, line: 14, type: !8)
!11 = !DILocation(line: 14, column: 3, scope: !2)
!12 = !DILocalVariable(name: "db", scope: !2, file: !1, line: 13, type: !13)
!13 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!14 = !DILocation(line: 13, column: 3, scope: !2)
!15 = !DILocalVariable(name: "fl", scope: !2, file: !1, line: 12, type: !16)
!16 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!17 = !DILocation(line: 12, column: 3, scope: !2)
!18 = !DILocalVariable(name: "uln", scope: !2, file: !1, line: 11, type: !19)
!19 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!20 = !DILocation(line: 11, column: 3, scope: !2)
!21 = !DILocalVariable(name: "uint", scope: !2, file: !1, line: 10, type: !22)
!22 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!23 = !DILocation(line: 10, column: 3, scope: !2)
!24 = !DILocalVariable(name: "uch", scope: !2, file: !1, line: 9, type: !25)
!25 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!26 = !DILocation(line: 9, column: 3, scope: !2)
!27 = !DILocalVariable(name: "ln", scope: !2, file: !1, line: 8, type: !28)
!28 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!29 = !DILocation(line: 8, column: 3, scope: !2)
!30 = !DILocalVariable(name: "in", scope: !2, file: !1, line: 7, type: !5)
!31 = !DILocation(line: 7, column: 3, scope: !2)
!32 = !DILocalVariable(name: "sh", scope: !2, file: !1, line: 6, type: !33)
!33 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!34 = !DILocation(line: 6, column: 3, scope: !2)
!35 = !DILocalVariable(name: "ch", scope: !2, file: !1, line: 5, type: !36)
!36 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!37 = !DILocation(line: 5, column: 3, scope: !2)
!38 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 4, type: !5)
!39 = !DILocation(line: 4, column: 3, scope: !2)
!40 = !DILocation(line: 17, column: 3, scope: !2)
!41 = !DILocation(line: 17, column: 18, scope: !2)
!42 = !DILocation(line: 18, column: 3, scope: !2)
!43 = !DILocation(line: 18, column: 20, scope: !2)
!44 = !DILocation(line: 19, column: 3, scope: !2)
!45 = !DILocation(line: 19, column: 24, scope: !2)
!46 = !DILocation(line: 20, column: 3, scope: !2)
!47 = !DILocation(line: 20, column: 27, scope: !2)
!48 = !DILocation(line: 21, column: 3, scope: !2)
!49 = !DILocation(line: 21, column: 19, scope: !2)
!50 = !DILocation(line: 22, column: 3, scope: !2)
!51 = !DILocation(line: 22, column: 26, scope: !2)
!52 = !DILocation(line: 23, column: 3, scope: !2)
!53 = !DILocation(line: 23, column: 28, scope: !2)
!54 = !DILocation(line: 24, column: 3, scope: !2)
!55 = !DILocation(line: 24, column: 16, scope: !2)
!56 = !DILocation(line: 25, column: 3, scope: !2)
!57 = !DILocation(line: 25, column: 16, scope: !2)
!58 = !DILocation(line: 27, column: 3, scope: !2)
!59 = !DILocation(line: 28, column: 5, scope: !60)
!60 = distinct !DILexicalBlock(scope: !2, file: !1, line: 27, column: 17)
!61 = !DILocation(line: 30, column: 5, scope: !62)
!62 = distinct !DILexicalBlock(scope: !2, file: !1, line: 29, column: 10)
!63 = !DILocation(line: 32, column: 3, scope: !2)
