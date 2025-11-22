; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [27 x i8] c"35.typedef_builtin.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [27 x i8] c"35.typedef_builtin.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define void @helper(i64 %0, i32 %1, ptr %2) !dbg !4 {
entry:
  %p = alloca ptr, align 8
    #dbg_declare(ptr %p, !12, !DIExpression(), !13)
  %step = alloca i32, align 4
    #dbg_declare(ptr %step, !14, !DIExpression(), !13)
  %nbytes = alloca i64, align 8
    #dbg_declare(ptr %nbytes, !15, !DIExpression(), !13)
  store i64 %0, ptr %nbytes, align 4, !dbg !13
  store i32 %1, ptr %step, align 4, !dbg !13
  store ptr %2, ptr %p, align 8, !dbg !13
  %3 = load ptr, ptr %p, align 8, !dbg !16
  %4 = load i64, ptr %nbytes, align 4, !dbg !16
  %5 = load i32, ptr %step, align 4, !dbg !16
  %6 = zext i32 %5 to i64, !dbg !16
  %7 = add i64 %4, %6, !dbg !16
  %8 = trunc i64 %7 to i32, !dbg !16
  store i32 %8, ptr %3, align 4, !dbg !16
  %9 = load i32, ptr %3, align 4, !dbg !16
  ret void, !dbg !16
}

define i32 @main() !dbg !17 {
entry:
  %result = alloca i32, align 4
    #dbg_declare(ptr %result, !20, !DIExpression(), !21)
  %p = alloca ptr, align 8
    #dbg_declare(ptr %p, !22, !DIExpression(), !23)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !24, !DIExpression(), !25)
  %c = alloca i32, align 4
    #dbg_declare(ptr %c, !26, !DIExpression(), !27)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !28, !DIExpression(), !29)
  store i32 0, ptr %err, align 4, !dbg !29
  store i32 7, ptr %c, align 4, !dbg !27
  store i32 10, ptr %x, align 4, !dbg !25
  store ptr %x, ptr %p, align 8, !dbg !23
  %0 = load i32, ptr %c, align 4, !dbg !30
  %1 = load ptr, ptr %p, align 8, !dbg !30
  call void @helper(i64 42, i32 %0, ptr %1), !dbg !30
  %2 = load i32, ptr %c, align 4, !dbg !31
  %3 = icmp ne i32 %2, 7, !dbg !31
  br i1 %3, label %then, label %else, !dbg !31

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !32
  %4 = load i32, ptr %err, align 4, !dbg !32
  br label %if.end, !dbg !32

else:                                             ; preds = %entry
  br label %if.end, !dbg !32

if.end:                                           ; preds = %else, %then
  %5 = load i32, ptr %x, align 4, !dbg !33
  %6 = icmp ne i32 %5, 49, !dbg !33
  br i1 %6, label %then1, label %else2, !dbg !33

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !34
  %7 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end3, !dbg !34

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !34

if.end3:                                          ; preds = %else2, %then1
  %8 = load ptr, ptr %p, align 8, !dbg !21
  %9 = load i32, ptr %8, align 4, !dbg !21
  store i32 %9, ptr %result, align 4, !dbg !21
  %10 = load i32, ptr %result, align 4, !dbg !35
  %11 = icmp ne i32 %10, 49, !dbg !35
  br i1 %11, label %then4, label %else5, !dbg !35

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !36
  %12 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end6, !dbg !36

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !36

if.end6:                                          ; preds = %else5, %then4
  %13 = load i32, ptr %err, align 4, !dbg !37
  %14 = icmp eq i32 %13, 0, !dbg !37
  br i1 %14, label %then7, label %else8, !dbg !37

then7:                                            ; preds = %if.end6
  %15 = call i32 (ptr, ...) @printf(ptr @0), !dbg !38
  br label %if.end9, !dbg !38

else8:                                            ; preds = %if.end6
  %16 = call i32 (ptr, ...) @printf(ptr @1), !dbg !40
  br label %if.end9, !dbg !40

if.end9:                                          ; preds = %else8, %then7
  %17 = load i32, ptr %err, align 4, !dbg !42
  ret i32 %17, !dbg !42
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "35.typedef_builtin.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "helper", linkageName: "helper", scope: null, file: !1, line: 10, type: !5, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !11)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !8, !9, !10}
!7 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!8 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!11 = !{}
!12 = !DILocalVariable(name: "p", arg: 3, scope: !4, file: !1, line: 10, type: !10)
!13 = !DILocation(line: 10, column: 6, scope: !4)
!14 = !DILocalVariable(name: "step", arg: 2, scope: !4, file: !1, line: 10, type: !9)
!15 = !DILocalVariable(name: "nbytes", arg: 1, scope: !4, file: !1, line: 10, type: !8)
!16 = !DILocation(line: 11, column: 3, scope: !4)
!17 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 14, type: !18, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !11)
!18 = !DISubroutineType(types: !19)
!19 = !{!9}
!20 = !DILocalVariable(name: "result", scope: !17, file: !1, line: 24, type: !9)
!21 = !DILocation(line: 24, column: 3, scope: !17)
!22 = !DILocalVariable(name: "p", scope: !17, file: !1, line: 18, type: !10)
!23 = !DILocation(line: 18, column: 3, scope: !17)
!24 = !DILocalVariable(name: "x", scope: !17, file: !1, line: 17, type: !9)
!25 = !DILocation(line: 17, column: 3, scope: !17)
!26 = !DILocalVariable(name: "c", scope: !17, file: !1, line: 16, type: !9)
!27 = !DILocation(line: 16, column: 3, scope: !17)
!28 = !DILocalVariable(name: "err", scope: !17, file: !1, line: 15, type: !9)
!29 = !DILocation(line: 15, column: 3, scope: !17)
!30 = !DILocation(line: 20, column: 3, scope: !17)
!31 = !DILocation(line: 22, column: 3, scope: !17)
!32 = !DILocation(line: 22, column: 15, scope: !17)
!33 = !DILocation(line: 23, column: 3, scope: !17)
!34 = !DILocation(line: 23, column: 16, scope: !17)
!35 = !DILocation(line: 25, column: 3, scope: !17)
!36 = !DILocation(line: 25, column: 21, scope: !17)
!37 = !DILocation(line: 27, column: 3, scope: !17)
!38 = !DILocation(line: 28, column: 5, scope: !39)
!39 = distinct !DILexicalBlock(scope: !17, file: !1, line: 27, column: 17)
!40 = !DILocation(line: 30, column: 5, scope: !41)
!41 = distinct !DILexicalBlock(scope: !17, file: !1, line: 29, column: 10)
!42 = !DILocation(line: 32, column: 3, scope: !17)
