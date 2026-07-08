; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [19 x i8] c"8.function.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"8.function.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @sum(i32 %0, i32 %1) !dbg !4 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !9, !DIExpression(), !10)
  %l = alloca i32, align 4
    #dbg_declare(ptr %l, !11, !DIExpression(), !10)
  store i32 %0, ptr %l, align 4, !dbg !10
  store i32 %1, ptr %r, align 4, !dbg !10
  %2 = load i32, ptr %l, align 4, !dbg !12
  %3 = load i32, ptr %r, align 4, !dbg !12
  %4 = add i32 %2, %3, !dbg !12
  ret i32 %4, !dbg !12
}

define i32 @sum2(ptr %0, ptr %1) !dbg !13 {
entry:
  %r = alloca ptr, align 8
    #dbg_declare(ptr %r, !17, !DIExpression(), !18)
  %l = alloca ptr, align 8
    #dbg_declare(ptr %l, !19, !DIExpression(), !18)
  store ptr %0, ptr %l, align 8, !dbg !18
  store ptr %1, ptr %r, align 8, !dbg !18
  %2 = load ptr, ptr %l, align 8, !dbg !20
  %3 = load i32, ptr %2, align 4, !dbg !20
  %4 = load ptr, ptr %r, align 8, !dbg !20
  %5 = load i32, ptr %4, align 4, !dbg !20
  %6 = call i32 @sum(i32 %3, i32 %5), !dbg !20
  ret i32 %6, !dbg !20
}

define void @sum3(i32 %0, i32 %1, ptr %2) !dbg !21 {
entry:
  %result = alloca ptr, align 8
    #dbg_declare(ptr %result, !25, !DIExpression(), !26)
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !27, !DIExpression(), !26)
  %l = alloca i32, align 4
    #dbg_declare(ptr %l, !28, !DIExpression(), !26)
  store i32 %0, ptr %l, align 4, !dbg !26
  store i32 %1, ptr %r, align 4, !dbg !26
  store ptr %2, ptr %result, align 8, !dbg !26
  %3 = load ptr, ptr %result, align 8, !dbg !29
  %4 = load i32, ptr %l, align 4, !dbg !29
  %5 = load i32, ptr %r, align 4, !dbg !29
  %6 = add i32 %4, %5, !dbg !29
  store i32 %6, ptr %3, align 4, !dbg !29
  %7 = load i32, ptr %3, align 4, !dbg !29
  ret void, !dbg !29
}

define i32 @main() !dbg !30 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !33, !DIExpression(), !34)
  %l = alloca i32, align 4
    #dbg_declare(ptr %l, !35, !DIExpression(), !36)
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !37, !DIExpression(), !38)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !39, !DIExpression(), !40)
  store i32 0, ptr %err, align 4, !dbg !40
  store i32 3, ptr %l, align 4, !dbg !36
  store i32 4, ptr %r, align 4, !dbg !34
  %0 = call i32 @sum(i32 1, i32 2), !dbg !41
  %1 = icmp ne i32 %0, 3, !dbg !41
  br i1 %1, label %then, label %if.end, !dbg !41

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !42
  %2 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end, !dbg !42

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @sum(i32 3, i32 4), !dbg !43
  %4 = icmp ne i32 %3, 7, !dbg !43
  br i1 %4, label %then1, label %if.end3, !dbg !43

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !44
  %5 = load i32, ptr %err, align 4, !dbg !44
  br label %if.end3, !dbg !44

if.end3:                                          ; preds = %if.end, %then1
  %6 = load i32, ptr %l, align 4, !dbg !45
  %7 = load i32, ptr %r, align 4, !dbg !45
  %8 = call i32 @sum(i32 %6, i32 %7), !dbg !45
  %9 = icmp ne i32 %8, 7, !dbg !45
  br i1 %9, label %then4, label %if.end6, !dbg !45

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !46
  %10 = load i32, ptr %err, align 4, !dbg !46
  br label %if.end6, !dbg !46

if.end6:                                          ; preds = %if.end3, %then4
  %11 = call i32 @sum2(ptr %l, ptr %r), !dbg !47
  %12 = icmp ne i32 %11, 7, !dbg !47
  br i1 %12, label %then7, label %if.end9, !dbg !47

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !48
  %13 = load i32, ptr %err, align 4, !dbg !48
  br label %if.end9, !dbg !48

if.end9:                                          ; preds = %if.end6, %then7
  call void @sum3(i32 3, i32 4, ptr %i), !dbg !49
  %14 = load i32, ptr %i, align 4, !dbg !50
  %15 = icmp ne i32 %14, 7, !dbg !50
  br i1 %15, label %then10, label %if.end12, !dbg !50

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !51
  %16 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end12, !dbg !51

if.end12:                                         ; preds = %if.end9, %then10
  %17 = load i32, ptr %l, align 4, !dbg !52
  %18 = load i32, ptr %r, align 4, !dbg !52
  call void @sum3(i32 %17, i32 %18, ptr %i), !dbg !52
  %19 = load i32, ptr %i, align 4, !dbg !53
  %20 = icmp ne i32 %19, 7, !dbg !53
  br i1 %20, label %then13, label %if.end15, !dbg !53

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !54
  %21 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end15, !dbg !54

if.end15:                                         ; preds = %if.end12, %then13
  %22 = call i32 @sum(i32 1000000, i32 2000000), !dbg !55
  %23 = icmp ne i32 %22, 3000000, !dbg !55
  br i1 %23, label %then16, label %if.end18, !dbg !55

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !56
  %24 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end18, !dbg !56

if.end18:                                         ; preds = %if.end15, %then16
  %25 = load i32, ptr %err, align 4, !dbg !57
  %26 = icmp eq i32 %25, 0, !dbg !57
  %. = select i1 %26, ptr @0, ptr @1, !dbg !58
  %27 = call i32 (ptr, ...) @printf(ptr %.), !dbg !58
  %28 = load i32, ptr %err, align 4, !dbg !59
  ret i32 %28, !dbg !59
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "8.function.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "sum", linkageName: "sum", scope: null, file: !1, line: 7, type: !5, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "r", arg: 2, scope: !4, file: !1, line: 7, type: !7)
!10 = !DILocation(line: 7, column: 5, scope: !4)
!11 = !DILocalVariable(name: "l", arg: 1, scope: !4, file: !1, line: 7, type: !7)
!12 = !DILocation(line: 7, column: 25, scope: !4)
!13 = distinct !DISubprogram(name: "sum2", linkageName: "sum2", scope: null, file: !1, line: 5, type: !14, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!14 = !DISubroutineType(types: !15)
!15 = !{!7, !16, !16}
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!17 = !DILocalVariable(name: "r", arg: 2, scope: !13, file: !1, line: 5, type: !16)
!18 = !DILocation(line: 5, column: 5, scope: !13)
!19 = !DILocalVariable(name: "l", arg: 1, scope: !13, file: !1, line: 5, type: !16)
!20 = !DILocation(line: 5, column: 28, scope: !13)
!21 = distinct !DISubprogram(name: "sum3", linkageName: "sum3", scope: null, file: !1, line: 6, type: !22, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!22 = !DISubroutineType(types: !23)
!23 = !{!24, !7, !7, !16}
!24 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!25 = !DILocalVariable(name: "result", arg: 3, scope: !21, file: !1, line: 6, type: !16)
!26 = !DILocation(line: 6, column: 6, scope: !21)
!27 = !DILocalVariable(name: "r", arg: 2, scope: !21, file: !1, line: 6, type: !7)
!28 = !DILocalVariable(name: "l", arg: 1, scope: !21, file: !1, line: 6, type: !7)
!29 = !DILocation(line: 6, column: 40, scope: !21)
!30 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 9, type: !31, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!31 = !DISubroutineType(types: !32)
!32 = !{!7}
!33 = !DILocalVariable(name: "r", scope: !30, file: !1, line: 13, type: !7)
!34 = !DILocation(line: 13, column: 3, scope: !30)
!35 = !DILocalVariable(name: "l", scope: !30, file: !1, line: 12, type: !7)
!36 = !DILocation(line: 12, column: 3, scope: !30)
!37 = !DILocalVariable(name: "i", scope: !30, file: !1, line: 11, type: !7)
!38 = !DILocation(line: 11, column: 3, scope: !30)
!39 = !DILocalVariable(name: "err", scope: !30, file: !1, line: 10, type: !7)
!40 = !DILocation(line: 10, column: 3, scope: !30)
!41 = !DILocation(line: 15, column: 3, scope: !30)
!42 = !DILocation(line: 15, column: 23, scope: !30)
!43 = !DILocation(line: 16, column: 3, scope: !30)
!44 = !DILocation(line: 16, column: 23, scope: !30)
!45 = !DILocation(line: 17, column: 3, scope: !30)
!46 = !DILocation(line: 17, column: 23, scope: !30)
!47 = !DILocation(line: 18, column: 3, scope: !30)
!48 = !DILocation(line: 18, column: 26, scope: !30)
!49 = !DILocation(line: 20, column: 3, scope: !30)
!50 = !DILocation(line: 21, column: 3, scope: !30)
!51 = !DILocation(line: 21, column: 15, scope: !30)
!52 = !DILocation(line: 22, column: 3, scope: !30)
!53 = !DILocation(line: 23, column: 3, scope: !30)
!54 = !DILocation(line: 23, column: 15, scope: !30)
!55 = !DILocation(line: 25, column: 3, scope: !30)
!56 = !DILocation(line: 25, column: 41, scope: !30)
!57 = !DILocation(line: 27, column: 3, scope: !30)
!58 = !DILocation(line: 0, scope: !30)
!59 = !DILocation(line: 32, column: 3, scope: !30)
