; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [24 x i8] c"1.builtin_types.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"1.builtin_types.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %bf = alloca i1, align 1
    #dbg_declare(ptr %bf, !6, !DIExpression(), !8)
  %bt = alloca i1, align 1
    #dbg_declare(ptr %bt, !9, !DIExpression(), !10)
  %db = alloca double, align 8
    #dbg_declare(ptr %db, !11, !DIExpression(), !13)
  %fl = alloca float, align 4
    #dbg_declare(ptr %fl, !14, !DIExpression(), !16)
  %uln = alloca i64, align 8
    #dbg_declare(ptr %uln, !17, !DIExpression(), !19)
  %uint = alloca i32, align 4
    #dbg_declare(ptr %uint, !20, !DIExpression(), !22)
  %uch = alloca i8, align 1
    #dbg_declare(ptr %uch, !23, !DIExpression(), !25)
  %ln = alloca i64, align 8
    #dbg_declare(ptr %ln, !26, !DIExpression(), !28)
  %in = alloca i32, align 4
    #dbg_declare(ptr %in, !29, !DIExpression(), !30)
  %sh = alloca i16, align 2
    #dbg_declare(ptr %sh, !31, !DIExpression(), !33)
  %ch = alloca i8, align 1
    #dbg_declare(ptr %ch, !34, !DIExpression(), !36)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !37, !DIExpression(), !38)
  store i32 0, ptr %err, align 4, !dbg !38
  store i8 65, ptr %ch, align 1, !dbg !36
  store i16 -1024, ptr %sh, align 2, !dbg !33
  store i32 -12345678, ptr %in, align 4, !dbg !30
  store i64 -1234567890, ptr %ln, align 4, !dbg !28
  store i8 -6, ptr %uch, align 1, !dbg !25
  store i32 180150000, ptr %uint, align 4, !dbg !22
  store i64 9876043210, ptr %uln, align 4, !dbg !19
  store float 0x400921FB40000000, ptr %fl, align 4, !dbg !16
  store double 0x400921FB54442D11, ptr %db, align 8, !dbg !13
  store i1 true, ptr %bt, align 1, !dbg !10
  store i1 false, ptr %bf, align 1, !dbg !8
  %0 = load i8, ptr %ch, align 1, !dbg !39
  %1 = sext i8 %0 to i32, !dbg !39
  %2 = icmp ne i32 %1, 65, !dbg !39
  br i1 %2, label %then, label %else, !dbg !39

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !40
  %3 = load i32, ptr %err, align 4, !dbg !40
  br label %if.end, !dbg !40

else:                                             ; preds = %entry
  br label %if.end, !dbg !40

if.end:                                           ; preds = %else, %then
  %4 = load i16, ptr %sh, align 2, !dbg !41
  %5 = sext i16 %4 to i32, !dbg !41
  %6 = icmp ne i32 %5, -1024, !dbg !41
  br i1 %6, label %then1, label %else2, !dbg !41

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !42
  %7 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end3, !dbg !42

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !42

if.end3:                                          ; preds = %else2, %then1
  %8 = load i32, ptr %in, align 4, !dbg !43
  %9 = icmp ne i32 %8, -12345678, !dbg !43
  br i1 %9, label %then4, label %else5, !dbg !43

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !44
  %10 = load i32, ptr %err, align 4, !dbg !44
  br label %if.end6, !dbg !44

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !44

if.end6:                                          ; preds = %else5, %then4
  %11 = load i64, ptr %ln, align 4, !dbg !45
  %12 = icmp ne i64 %11, -1234567890, !dbg !45
  br i1 %12, label %then7, label %else8, !dbg !45

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !46
  %13 = load i32, ptr %err, align 4, !dbg !46
  br label %if.end9, !dbg !46

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !46

if.end9:                                          ; preds = %else8, %then7
  %14 = load i8, ptr %uch, align 1, !dbg !47
  %15 = zext i8 %14 to i32, !dbg !47
  %16 = icmp ne i32 %15, 250, !dbg !47
  br i1 %16, label %then10, label %else11, !dbg !47

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !48
  %17 = load i32, ptr %err, align 4, !dbg !48
  br label %if.end12, !dbg !48

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !48

if.end12:                                         ; preds = %else11, %then10
  %18 = load i32, ptr %uint, align 4, !dbg !49
  %19 = icmp ne i32 %18, 180150000, !dbg !49
  br i1 %19, label %then13, label %else14, !dbg !49

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !50
  %20 = load i32, ptr %err, align 4, !dbg !50
  br label %if.end15, !dbg !50

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !50

if.end15:                                         ; preds = %else14, %then13
  %21 = load i64, ptr %uln, align 4, !dbg !51
  %22 = icmp ne i64 %21, 9876043210, !dbg !51
  br i1 %22, label %then16, label %else17, !dbg !51

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !52
  %23 = load i32, ptr %err, align 4, !dbg !52
  br label %if.end18, !dbg !52

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !52

if.end18:                                         ; preds = %else17, %then16
  %24 = load i1, ptr %bt, align 1, !dbg !53
  %25 = zext i1 %24 to i32, !dbg !53
  %26 = icmp ne i32 %25, 1, !dbg !53
  br i1 %26, label %then19, label %else20, !dbg !53

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !54
  %27 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end21, !dbg !54

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !54

if.end21:                                         ; preds = %else20, %then19
  %28 = load i1, ptr %bf, align 1, !dbg !55
  %29 = zext i1 %28 to i32, !dbg !55
  %30 = icmp ne i32 %29, 0, !dbg !55
  br i1 %30, label %then22, label %else23, !dbg !55

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !56
  %31 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end24, !dbg !56

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !56

if.end24:                                         ; preds = %else23, %then22
  %32 = load i32, ptr %err, align 4, !dbg !57
  %33 = icmp eq i32 %32, 0, !dbg !57
  br i1 %33, label %then25, label %else26, !dbg !57

then25:                                           ; preds = %if.end24
  %34 = call i32 (ptr, ...) @printf(ptr @0), !dbg !58
  br label %if.end27, !dbg !58

else26:                                           ; preds = %if.end24
  %35 = call i32 (ptr, ...) @printf(ptr @1), !dbg !60
  br label %if.end27, !dbg !60

if.end27:                                         ; preds = %else26, %then25
  %36 = load i32, ptr %err, align 4, !dbg !62
  ret i32 %36, !dbg !62
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "1.builtin_types.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "bf", scope: !2, file: !1, line: 15, type: !7)
!7 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!8 = !DILocation(line: 15, column: 3, scope: !2)
!9 = !DILocalVariable(name: "bt", scope: !2, file: !1, line: 14, type: !7)
!10 = !DILocation(line: 14, column: 3, scope: !2)
!11 = !DILocalVariable(name: "db", scope: !2, file: !1, line: 13, type: !12)
!12 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!13 = !DILocation(line: 13, column: 3, scope: !2)
!14 = !DILocalVariable(name: "fl", scope: !2, file: !1, line: 12, type: !15)
!15 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!16 = !DILocation(line: 12, column: 3, scope: !2)
!17 = !DILocalVariable(name: "uln", scope: !2, file: !1, line: 11, type: !18)
!18 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!19 = !DILocation(line: 11, column: 3, scope: !2)
!20 = !DILocalVariable(name: "uint", scope: !2, file: !1, line: 10, type: !21)
!21 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!22 = !DILocation(line: 10, column: 3, scope: !2)
!23 = !DILocalVariable(name: "uch", scope: !2, file: !1, line: 9, type: !24)
!24 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!25 = !DILocation(line: 9, column: 3, scope: !2)
!26 = !DILocalVariable(name: "ln", scope: !2, file: !1, line: 8, type: !27)
!27 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!28 = !DILocation(line: 8, column: 3, scope: !2)
!29 = !DILocalVariable(name: "in", scope: !2, file: !1, line: 7, type: !5)
!30 = !DILocation(line: 7, column: 3, scope: !2)
!31 = !DILocalVariable(name: "sh", scope: !2, file: !1, line: 6, type: !32)
!32 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!33 = !DILocation(line: 6, column: 3, scope: !2)
!34 = !DILocalVariable(name: "ch", scope: !2, file: !1, line: 5, type: !35)
!35 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!36 = !DILocation(line: 5, column: 3, scope: !2)
!37 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 4, type: !5)
!38 = !DILocation(line: 4, column: 3, scope: !2)
!39 = !DILocation(line: 17, column: 3, scope: !2)
!40 = !DILocation(line: 17, column: 18, scope: !2)
!41 = !DILocation(line: 18, column: 3, scope: !2)
!42 = !DILocation(line: 18, column: 20, scope: !2)
!43 = !DILocation(line: 19, column: 3, scope: !2)
!44 = !DILocation(line: 19, column: 24, scope: !2)
!45 = !DILocation(line: 20, column: 3, scope: !2)
!46 = !DILocation(line: 20, column: 27, scope: !2)
!47 = !DILocation(line: 21, column: 3, scope: !2)
!48 = !DILocation(line: 21, column: 19, scope: !2)
!49 = !DILocation(line: 22, column: 3, scope: !2)
!50 = !DILocation(line: 22, column: 26, scope: !2)
!51 = !DILocation(line: 23, column: 3, scope: !2)
!52 = !DILocation(line: 23, column: 28, scope: !2)
!53 = !DILocation(line: 24, column: 3, scope: !2)
!54 = !DILocation(line: 24, column: 16, scope: !2)
!55 = !DILocation(line: 25, column: 3, scope: !2)
!56 = !DILocation(line: 25, column: 16, scope: !2)
!57 = !DILocation(line: 27, column: 3, scope: !2)
!58 = !DILocation(line: 28, column: 5, scope: !59)
!59 = distinct !DILexicalBlock(scope: !2, file: !1, line: 27, column: 17)
!60 = !DILocation(line: 30, column: 5, scope: !61)
!61 = distinct !DILexicalBlock(scope: !2, file: !1, line: 29, column: 10)
!62 = !DILocation(line: 32, column: 3, scope: !2)
