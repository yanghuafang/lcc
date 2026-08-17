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
    #dbg_declare(ptr %p, !11, !DIExpression(), !12)
  %step = alloca i32, align 4
    #dbg_declare(ptr %step, !13, !DIExpression(), !12)
  %nbytes = alloca i64, align 8
    #dbg_declare(ptr %nbytes, !14, !DIExpression(), !12)
  store i64 %0, ptr %nbytes, align 8, !dbg !12
  store i32 %1, ptr %step, align 4, !dbg !12
  store ptr %2, ptr %p, align 8, !dbg !12
  %3 = load ptr, ptr %p, align 8, !dbg !15
  %4 = load i64, ptr %nbytes, align 8, !dbg !15
  %5 = load i32, ptr %step, align 4, !dbg !15
  %6 = zext i32 %5 to i64, !dbg !15
  %7 = add i64 %4, %6, !dbg !15
  %8 = trunc i64 %7 to i32, !dbg !15
  store i32 %8, ptr %3, align 4, !dbg !15
  %9 = load i32, ptr %3, align 4, !dbg !15
  ret void, !dbg !15
}

define i32 @main() !dbg !16 {
entry:
  %result = alloca i32, align 4
    #dbg_declare(ptr %result, !19, !DIExpression(), !20)
  %p = alloca ptr, align 8
    #dbg_declare(ptr %p, !21, !DIExpression(), !22)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !23, !DIExpression(), !24)
  %c = alloca i32, align 4
    #dbg_declare(ptr %c, !25, !DIExpression(), !26)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !27, !DIExpression(), !28)
  store i32 0, ptr %err, align 4, !dbg !28
  store i32 7, ptr %c, align 4, !dbg !26
  store i32 10, ptr %x, align 4, !dbg !24
  store ptr %x, ptr %p, align 8, !dbg !22
  %0 = load i32, ptr %c, align 4, !dbg !29
  %1 = load ptr, ptr %p, align 8, !dbg !29
  call void @helper(i64 42, i32 %0, ptr %1), !dbg !29
  %2 = load i32, ptr %c, align 4, !dbg !30
  %3 = icmp ne i32 %2, 7, !dbg !30
  br i1 %3, label %then, label %else, !dbg !30

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !31
  %4 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end, !dbg !31

else:                                             ; preds = %entry
  br label %if.end, !dbg !31

if.end:                                           ; preds = %else, %then
  %5 = load i32, ptr %x, align 4, !dbg !32
  %6 = icmp ne i32 %5, 49, !dbg !32
  br i1 %6, label %then1, label %else2, !dbg !32

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !33
  %7 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end3, !dbg !33

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !33

if.end3:                                          ; preds = %else2, %then1
  %8 = load ptr, ptr %p, align 8, !dbg !20
  %9 = load i32, ptr %8, align 4, !dbg !20
  store i32 %9, ptr %result, align 4, !dbg !20
  %10 = load i32, ptr %result, align 4, !dbg !34
  %11 = icmp ne i32 %10, 49, !dbg !34
  br i1 %11, label %then4, label %else5, !dbg !34

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !35
  %12 = load i32, ptr %err, align 4, !dbg !35
  br label %if.end6, !dbg !35

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !35

if.end6:                                          ; preds = %else5, %then4
  %13 = load i32, ptr %err, align 4, !dbg !36
  %14 = icmp eq i32 %13, 0, !dbg !36
  br i1 %14, label %then7, label %else8, !dbg !36

then7:                                            ; preds = %if.end6
  %15 = call i32 (ptr, ...) @printf(ptr @0), !dbg !37
  br label %if.end9, !dbg !37

else8:                                            ; preds = %if.end6
  %16 = call i32 (ptr, ...) @printf(ptr @1), !dbg !39
  br label %if.end9, !dbg !39

if.end9:                                          ; preds = %else8, %then7
  %17 = load i32, ptr %err, align 4, !dbg !41
  ret i32 %17, !dbg !41
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "35.typedef_builtin.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "helper", linkageName: "helper", scope: null, file: !3, line: 10, type: !5, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !8, !9, !10}
!7 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!8 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!11 = !DILocalVariable(name: "p", arg: 3, scope: !4, file: !3, line: 10, type: !10)
!12 = !DILocation(line: 10, column: 6, scope: !4)
!13 = !DILocalVariable(name: "step", arg: 2, scope: !4, file: !3, line: 10, type: !9)
!14 = !DILocalVariable(name: "nbytes", arg: 1, scope: !4, file: !3, line: 10, type: !8)
!15 = !DILocation(line: 11, column: 3, scope: !4)
!16 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 14, type: !17, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !2)
!17 = !DISubroutineType(types: !18)
!18 = !{!9}
!19 = !DILocalVariable(name: "result", scope: !16, file: !3, line: 24, type: !9)
!20 = !DILocation(line: 24, column: 3, scope: !16)
!21 = !DILocalVariable(name: "p", scope: !16, file: !3, line: 18, type: !10)
!22 = !DILocation(line: 18, column: 3, scope: !16)
!23 = !DILocalVariable(name: "x", scope: !16, file: !3, line: 17, type: !9)
!24 = !DILocation(line: 17, column: 3, scope: !16)
!25 = !DILocalVariable(name: "c", scope: !16, file: !3, line: 16, type: !9)
!26 = !DILocation(line: 16, column: 3, scope: !16)
!27 = !DILocalVariable(name: "err", scope: !16, file: !3, line: 15, type: !9)
!28 = !DILocation(line: 15, column: 3, scope: !16)
!29 = !DILocation(line: 20, column: 3, scope: !16)
!30 = !DILocation(line: 22, column: 3, scope: !16)
!31 = !DILocation(line: 22, column: 15, scope: !16)
!32 = !DILocation(line: 23, column: 3, scope: !16)
!33 = !DILocation(line: 23, column: 16, scope: !16)
!34 = !DILocation(line: 25, column: 3, scope: !16)
!35 = !DILocation(line: 25, column: 21, scope: !16)
!36 = !DILocation(line: 27, column: 3, scope: !16)
!37 = !DILocation(line: 28, column: 5, scope: !38)
!38 = distinct !DILexicalBlock(scope: !16, file: !3, line: 27, column: 17)
!39 = !DILocation(line: 30, column: 5, scope: !40)
!40 = distinct !DILexicalBlock(scope: !16, file: !3, line: 29, column: 10)
!41 = !DILocation(line: 32, column: 3, scope: !16)
