; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [24 x i8] c"1.builtin_types.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"1.builtin_types.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %const30 = bitcast i64 -1234567890 to i64
  %const29 = bitcast i64 9876043210 to i64
  %const28 = bitcast i32 -12345678 to i32
  %const = bitcast i32 180150000 to i32
  %bf = alloca i1, align 1
    #dbg_declare(ptr %bf, !9, !DIExpression(), !11)
  %bt = alloca i1, align 1
    #dbg_declare(ptr %bt, !12, !DIExpression(), !13)
  %db = alloca double, align 8
    #dbg_declare(ptr %db, !14, !DIExpression(), !16)
  %fl = alloca float, align 4
    #dbg_declare(ptr %fl, !17, !DIExpression(), !19)
  %uln = alloca i64, align 8
    #dbg_declare(ptr %uln, !20, !DIExpression(), !22)
  %uint = alloca i32, align 4
    #dbg_declare(ptr %uint, !23, !DIExpression(), !25)
  %uch = alloca i8, align 1
    #dbg_declare(ptr %uch, !26, !DIExpression(), !28)
  %ln = alloca i64, align 8
    #dbg_declare(ptr %ln, !29, !DIExpression(), !31)
  %in = alloca i32, align 4
    #dbg_declare(ptr %in, !32, !DIExpression(), !33)
  %sh = alloca i16, align 2
    #dbg_declare(ptr %sh, !34, !DIExpression(), !36)
  %ch = alloca i8, align 1
    #dbg_declare(ptr %ch, !37, !DIExpression(), !39)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !40, !DIExpression(), !41)
  store i32 0, ptr %err, align 4, !dbg !41
  store i8 65, ptr %ch, align 1, !dbg !39
  store i16 -1024, ptr %sh, align 2, !dbg !36
  store i32 %const28, ptr %in, align 4, !dbg !33
  store i64 %const30, ptr %ln, align 4, !dbg !31
  store i8 -6, ptr %uch, align 1, !dbg !28
  store i32 %const, ptr %uint, align 4, !dbg !25
  store i64 %const29, ptr %uln, align 4, !dbg !22
  store float 0x400921FB40000000, ptr %fl, align 4, !dbg !19
  store double 0x400921FB54442D11, ptr %db, align 8, !dbg !16
  store i1 true, ptr %bt, align 1, !dbg !13
  store i1 false, ptr %bf, align 1, !dbg !11
  %0 = load i8, ptr %ch, align 1, !dbg !42
  %1 = sext i8 %0 to i32, !dbg !42
  %2 = icmp ne i32 %1, 65, !dbg !42
  br i1 %2, label %then, label %if.end, !dbg !42

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !43
  %3 = load i32, ptr %err, align 4, !dbg !43
  br label %if.end, !dbg !43

if.end:                                           ; preds = %entry, %then
  %4 = load i16, ptr %sh, align 2, !dbg !44
  %5 = sext i16 %4 to i32, !dbg !44
  %6 = icmp ne i32 %5, -1024, !dbg !44
  br i1 %6, label %then1, label %if.end3, !dbg !44

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !45
  %7 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end3, !dbg !45

if.end3:                                          ; preds = %if.end, %then1
  %8 = load i32, ptr %in, align 4, !dbg !46
  %9 = icmp ne i32 %8, %const28, !dbg !46
  br i1 %9, label %then4, label %if.end6, !dbg !46

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !47
  %10 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end6, !dbg !47

if.end6:                                          ; preds = %if.end3, %then4
  %11 = load i64, ptr %ln, align 4, !dbg !48
  %12 = icmp ne i64 %11, %const30, !dbg !48
  br i1 %12, label %then7, label %if.end9, !dbg !48

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !49
  %13 = load i32, ptr %err, align 4, !dbg !49
  br label %if.end9, !dbg !49

if.end9:                                          ; preds = %if.end6, %then7
  %14 = load i8, ptr %uch, align 1, !dbg !50
  %15 = zext i8 %14 to i32, !dbg !50
  %16 = icmp ne i32 %15, 250, !dbg !50
  br i1 %16, label %then10, label %if.end12, !dbg !50

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !51
  %17 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end12, !dbg !51

if.end12:                                         ; preds = %if.end9, %then10
  %18 = load i32, ptr %uint, align 4, !dbg !52
  %19 = icmp ne i32 %18, %const, !dbg !52
  br i1 %19, label %then13, label %if.end15, !dbg !52

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !53
  %20 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end15, !dbg !53

if.end15:                                         ; preds = %if.end12, %then13
  %21 = load i64, ptr %uln, align 4, !dbg !54
  %22 = icmp ne i64 %21, %const29, !dbg !54
  br i1 %22, label %then16, label %if.end18, !dbg !54

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !55
  %23 = load i32, ptr %err, align 4, !dbg !55
  br label %if.end18, !dbg !55

if.end18:                                         ; preds = %if.end15, %then16
  %24 = load i1, ptr %bt, align 1, !dbg !56
  %25 = zext i1 %24 to i32, !dbg !56
  %26 = icmp ne i32 %25, 1, !dbg !56
  br i1 %26, label %then19, label %if.end21, !dbg !56

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !57
  %27 = load i32, ptr %err, align 4, !dbg !57
  br label %if.end21, !dbg !57

if.end21:                                         ; preds = %if.end18, %then19
  %28 = load i1, ptr %bf, align 1, !dbg !58
  %29 = zext i1 %28 to i32, !dbg !58
  %30 = icmp ne i32 %29, 0, !dbg !58
  br i1 %30, label %then22, label %if.end24, !dbg !58

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !59
  %31 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end24, !dbg !59

if.end24:                                         ; preds = %if.end21, %then22
  %32 = load i32, ptr %err, align 4, !dbg !60
  %33 = icmp eq i32 %32, 0, !dbg !60
  %. = select i1 %33, ptr @0, ptr @1, !dbg !61
  %34 = call i32 (ptr, ...) @printf(ptr %.), !dbg !61
  %35 = load i32, ptr %err, align 4, !dbg !62
  ret i32 %35, !dbg !62
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "1.builtin_types.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "bf", scope: !4, file: !1, line: 15, type: !10)
!10 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!11 = !DILocation(line: 15, column: 3, scope: !4)
!12 = !DILocalVariable(name: "bt", scope: !4, file: !1, line: 14, type: !10)
!13 = !DILocation(line: 14, column: 3, scope: !4)
!14 = !DILocalVariable(name: "db", scope: !4, file: !1, line: 13, type: !15)
!15 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!16 = !DILocation(line: 13, column: 3, scope: !4)
!17 = !DILocalVariable(name: "fl", scope: !4, file: !1, line: 12, type: !18)
!18 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!19 = !DILocation(line: 12, column: 3, scope: !4)
!20 = !DILocalVariable(name: "uln", scope: !4, file: !1, line: 11, type: !21)
!21 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!22 = !DILocation(line: 11, column: 3, scope: !4)
!23 = !DILocalVariable(name: "uint", scope: !4, file: !1, line: 10, type: !24)
!24 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!25 = !DILocation(line: 10, column: 3, scope: !4)
!26 = !DILocalVariable(name: "uch", scope: !4, file: !1, line: 9, type: !27)
!27 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!28 = !DILocation(line: 9, column: 3, scope: !4)
!29 = !DILocalVariable(name: "ln", scope: !4, file: !1, line: 8, type: !30)
!30 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!31 = !DILocation(line: 8, column: 3, scope: !4)
!32 = !DILocalVariable(name: "in", scope: !4, file: !1, line: 7, type: !7)
!33 = !DILocation(line: 7, column: 3, scope: !4)
!34 = !DILocalVariable(name: "sh", scope: !4, file: !1, line: 6, type: !35)
!35 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!36 = !DILocation(line: 6, column: 3, scope: !4)
!37 = !DILocalVariable(name: "ch", scope: !4, file: !1, line: 5, type: !38)
!38 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!39 = !DILocation(line: 5, column: 3, scope: !4)
!40 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 4, type: !7)
!41 = !DILocation(line: 4, column: 3, scope: !4)
!42 = !DILocation(line: 17, column: 3, scope: !4)
!43 = !DILocation(line: 17, column: 18, scope: !4)
!44 = !DILocation(line: 18, column: 3, scope: !4)
!45 = !DILocation(line: 18, column: 20, scope: !4)
!46 = !DILocation(line: 19, column: 3, scope: !4)
!47 = !DILocation(line: 19, column: 24, scope: !4)
!48 = !DILocation(line: 20, column: 3, scope: !4)
!49 = !DILocation(line: 20, column: 27, scope: !4)
!50 = !DILocation(line: 21, column: 3, scope: !4)
!51 = !DILocation(line: 21, column: 19, scope: !4)
!52 = !DILocation(line: 22, column: 3, scope: !4)
!53 = !DILocation(line: 22, column: 26, scope: !4)
!54 = !DILocation(line: 23, column: 3, scope: !4)
!55 = !DILocation(line: 23, column: 28, scope: !4)
!56 = !DILocation(line: 24, column: 3, scope: !4)
!57 = !DILocation(line: 24, column: 16, scope: !4)
!58 = !DILocation(line: 25, column: 3, scope: !4)
!59 = !DILocation(line: 25, column: 16, scope: !4)
!60 = !DILocation(line: 27, column: 3, scope: !4)
!61 = !DILocation(line: 0, scope: !4)
!62 = !DILocation(line: 32, column: 3, scope: !4)
