; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [24 x i8] c"1.builtin_types.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"1.builtin_types.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %bf = alloca i1, align 1
    #dbg_declare(ptr %bf, !8, !DIExpression(), !10)
  %bt = alloca i1, align 1
    #dbg_declare(ptr %bt, !11, !DIExpression(), !12)
  %db = alloca double, align 8
    #dbg_declare(ptr %db, !13, !DIExpression(), !15)
  %fl = alloca float, align 4
    #dbg_declare(ptr %fl, !16, !DIExpression(), !18)
  %uln = alloca i64, align 8
    #dbg_declare(ptr %uln, !19, !DIExpression(), !21)
  %uint = alloca i32, align 4
    #dbg_declare(ptr %uint, !22, !DIExpression(), !24)
  %uch = alloca i8, align 1
    #dbg_declare(ptr %uch, !25, !DIExpression(), !27)
  %ln = alloca i64, align 8
    #dbg_declare(ptr %ln, !28, !DIExpression(), !30)
  %in = alloca i32, align 4
    #dbg_declare(ptr %in, !31, !DIExpression(), !32)
  %sh = alloca i16, align 2
    #dbg_declare(ptr %sh, !33, !DIExpression(), !35)
  %ch = alloca i8, align 1
    #dbg_declare(ptr %ch, !36, !DIExpression(), !38)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !39, !DIExpression(), !40)
  store i32 0, ptr %err, align 4, !dbg !40
  store i8 65, ptr %ch, align 1, !dbg !38
  store i16 -1024, ptr %sh, align 2, !dbg !35
  store i32 -12345678, ptr %in, align 4, !dbg !32
  store i64 -1234567890, ptr %ln, align 8, !dbg !30
  store i8 -6, ptr %uch, align 1, !dbg !27
  store i32 180150000, ptr %uint, align 4, !dbg !24
  store i64 9876043210, ptr %uln, align 8, !dbg !21
  store float 0x400921FB40000000, ptr %fl, align 4, !dbg !18
  store double 0x400921FB54442D11, ptr %db, align 8, !dbg !15
  store i1 true, ptr %bt, align 1, !dbg !12
  store i1 false, ptr %bf, align 1, !dbg !10
  %0 = load i8, ptr %ch, align 1, !dbg !41
  %1 = sext i8 %0 to i32, !dbg !41
  %2 = icmp ne i32 %1, 65, !dbg !41
  br i1 %2, label %then, label %else, !dbg !41

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !42
  %3 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end, !dbg !42

else:                                             ; preds = %entry
  br label %if.end, !dbg !42

if.end:                                           ; preds = %else, %then
  %4 = load i16, ptr %sh, align 2, !dbg !43
  %5 = sext i16 %4 to i32, !dbg !43
  %6 = icmp ne i32 %5, -1024, !dbg !43
  br i1 %6, label %then1, label %else2, !dbg !43

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !44
  %7 = load i32, ptr %err, align 4, !dbg !44
  br label %if.end3, !dbg !44

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !44

if.end3:                                          ; preds = %else2, %then1
  %8 = load i32, ptr %in, align 4, !dbg !45
  %9 = icmp ne i32 %8, -12345678, !dbg !45
  br i1 %9, label %then4, label %else5, !dbg !45

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !46
  %10 = load i32, ptr %err, align 4, !dbg !46
  br label %if.end6, !dbg !46

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !46

if.end6:                                          ; preds = %else5, %then4
  %11 = load i64, ptr %ln, align 8, !dbg !47
  %12 = icmp ne i64 %11, -1234567890, !dbg !47
  br i1 %12, label %then7, label %else8, !dbg !47

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !48
  %13 = load i32, ptr %err, align 4, !dbg !48
  br label %if.end9, !dbg !48

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !48

if.end9:                                          ; preds = %else8, %then7
  %14 = load i8, ptr %uch, align 1, !dbg !49
  %15 = zext i8 %14 to i32, !dbg !49
  %16 = icmp ne i32 %15, 250, !dbg !49
  br i1 %16, label %then10, label %else11, !dbg !49

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !50
  %17 = load i32, ptr %err, align 4, !dbg !50
  br label %if.end12, !dbg !50

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !50

if.end12:                                         ; preds = %else11, %then10
  %18 = load i32, ptr %uint, align 4, !dbg !51
  %19 = icmp ne i32 %18, 180150000, !dbg !51
  br i1 %19, label %then13, label %else14, !dbg !51

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !52
  %20 = load i32, ptr %err, align 4, !dbg !52
  br label %if.end15, !dbg !52

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !52

if.end15:                                         ; preds = %else14, %then13
  %21 = load i64, ptr %uln, align 8, !dbg !53
  %22 = icmp ne i64 %21, 9876043210, !dbg !53
  br i1 %22, label %then16, label %else17, !dbg !53

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !54
  %23 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end18, !dbg !54

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !54

if.end18:                                         ; preds = %else17, %then16
  %24 = load i1, ptr %bt, align 1, !dbg !55
  %25 = zext i1 %24 to i32, !dbg !55
  %26 = icmp ne i32 %25, 1, !dbg !55
  br i1 %26, label %then19, label %else20, !dbg !55

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !56
  %27 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end21, !dbg !56

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !56

if.end21:                                         ; preds = %else20, %then19
  %28 = load i1, ptr %bf, align 1, !dbg !57
  %29 = zext i1 %28 to i32, !dbg !57
  %30 = icmp ne i32 %29, 0, !dbg !57
  br i1 %30, label %then22, label %else23, !dbg !57

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !58
  %31 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end24, !dbg !58

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !58

if.end24:                                         ; preds = %else23, %then22
  %32 = load i32, ptr %err, align 4, !dbg !59
  %33 = icmp eq i32 %32, 0, !dbg !59
  br i1 %33, label %then25, label %else26, !dbg !59

then25:                                           ; preds = %if.end24
  %34 = call i32 (ptr, ...) @printf(ptr @0), !dbg !60
  br label %if.end27, !dbg !60

else26:                                           ; preds = %if.end24
  %35 = call i32 (ptr, ...) @printf(ptr @1), !dbg !62
  br label %if.end27, !dbg !62

if.end27:                                         ; preds = %else26, %then25
  %36 = load i32, ptr %err, align 4, !dbg !64
  ret i32 %36, !dbg !64
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "1.builtin_types.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "bf", scope: !4, file: !3, line: 18, type: !9)
!9 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!10 = !DILocation(line: 18, column: 3, scope: !4)
!11 = !DILocalVariable(name: "bt", scope: !4, file: !3, line: 17, type: !9)
!12 = !DILocation(line: 17, column: 3, scope: !4)
!13 = !DILocalVariable(name: "db", scope: !4, file: !3, line: 16, type: !14)
!14 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!15 = !DILocation(line: 16, column: 3, scope: !4)
!16 = !DILocalVariable(name: "fl", scope: !4, file: !3, line: 15, type: !17)
!17 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!18 = !DILocation(line: 15, column: 3, scope: !4)
!19 = !DILocalVariable(name: "uln", scope: !4, file: !3, line: 14, type: !20)
!20 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!21 = !DILocation(line: 14, column: 3, scope: !4)
!22 = !DILocalVariable(name: "uint", scope: !4, file: !3, line: 13, type: !23)
!23 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!24 = !DILocation(line: 13, column: 3, scope: !4)
!25 = !DILocalVariable(name: "uch", scope: !4, file: !3, line: 12, type: !26)
!26 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!27 = !DILocation(line: 12, column: 3, scope: !4)
!28 = !DILocalVariable(name: "ln", scope: !4, file: !3, line: 11, type: !29)
!29 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!30 = !DILocation(line: 11, column: 3, scope: !4)
!31 = !DILocalVariable(name: "in", scope: !4, file: !3, line: 10, type: !7)
!32 = !DILocation(line: 10, column: 3, scope: !4)
!33 = !DILocalVariable(name: "sh", scope: !4, file: !3, line: 9, type: !34)
!34 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!35 = !DILocation(line: 9, column: 3, scope: !4)
!36 = !DILocalVariable(name: "ch", scope: !4, file: !3, line: 8, type: !37)
!37 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!38 = !DILocation(line: 8, column: 3, scope: !4)
!39 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 7, type: !7)
!40 = !DILocation(line: 7, column: 3, scope: !4)
!41 = !DILocation(line: 20, column: 3, scope: !4)
!42 = !DILocation(line: 20, column: 18, scope: !4)
!43 = !DILocation(line: 21, column: 3, scope: !4)
!44 = !DILocation(line: 21, column: 20, scope: !4)
!45 = !DILocation(line: 22, column: 3, scope: !4)
!46 = !DILocation(line: 22, column: 24, scope: !4)
!47 = !DILocation(line: 23, column: 3, scope: !4)
!48 = !DILocation(line: 23, column: 27, scope: !4)
!49 = !DILocation(line: 24, column: 3, scope: !4)
!50 = !DILocation(line: 24, column: 19, scope: !4)
!51 = !DILocation(line: 25, column: 3, scope: !4)
!52 = !DILocation(line: 25, column: 26, scope: !4)
!53 = !DILocation(line: 26, column: 3, scope: !4)
!54 = !DILocation(line: 26, column: 28, scope: !4)
!55 = !DILocation(line: 27, column: 3, scope: !4)
!56 = !DILocation(line: 27, column: 16, scope: !4)
!57 = !DILocation(line: 28, column: 3, scope: !4)
!58 = !DILocation(line: 28, column: 16, scope: !4)
!59 = !DILocation(line: 30, column: 3, scope: !4)
!60 = !DILocation(line: 31, column: 5, scope: !61)
!61 = distinct !DILexicalBlock(scope: !4, file: !3, line: 30, column: 17)
!62 = !DILocation(line: 33, column: 5, scope: !63)
!63 = distinct !DILexicalBlock(scope: !4, file: !3, line: 32, column: 10)
!64 = !DILocation(line: 35, column: 3, scope: !4)
