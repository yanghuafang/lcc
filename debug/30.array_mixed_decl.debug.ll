; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [28 x i8] c"30.array_mixed_decl.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [28 x i8] c"30.array_mixed_decl.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %b = alloca i32, align 4
    #dbg_declare(ptr %b, !9, !DIExpression(), !10)
  %a = alloca [4 x i32], align 4
    #dbg_declare(ptr %a, !11, !DIExpression(), !10)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !15, !DIExpression(), !16)
  store i32 0, ptr %err, align 4, !dbg !16
  %0 = getelementptr i32, ptr %a, i32 0, !dbg !17
  store i32 10, ptr %0, align 4, !dbg !17
  %1 = load i32, ptr %0, align 4, !dbg !17
  %2 = getelementptr i32, ptr %a, i32 1, !dbg !18
  store i32 20, ptr %2, align 4, !dbg !18
  %3 = load i32, ptr %2, align 4, !dbg !18
  store i32 30, ptr %b, align 4, !dbg !19
  %4 = load i32, ptr %b, align 4, !dbg !19
  %5 = getelementptr i32, ptr %a, i32 0, !dbg !20
  %6 = load i32, ptr %5, align 4, !dbg !20
  %7 = icmp ne i32 %6, 10, !dbg !20
  br i1 %7, label %then, label %else, !dbg !20

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !21
  %8 = load i32, ptr %err, align 4, !dbg !21
  br label %if.end, !dbg !21

else:                                             ; preds = %entry
  br label %if.end, !dbg !21

if.end:                                           ; preds = %else, %then
  %9 = getelementptr i32, ptr %a, i32 1, !dbg !22
  %10 = load i32, ptr %9, align 4, !dbg !22
  %11 = icmp ne i32 %10, 20, !dbg !22
  br i1 %11, label %then1, label %else2, !dbg !22

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !23
  %12 = load i32, ptr %err, align 4, !dbg !23
  br label %if.end3, !dbg !23

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !23

if.end3:                                          ; preds = %else2, %then1
  %13 = load i32, ptr %b, align 4, !dbg !24
  %14 = icmp ne i32 %13, 30, !dbg !24
  br i1 %14, label %then4, label %else5, !dbg !24

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !25
  %15 = load i32, ptr %err, align 4, !dbg !25
  br label %if.end6, !dbg !25

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !25

if.end6:                                          ; preds = %else5, %then4
  %16 = load i32, ptr %err, align 4, !dbg !26
  %17 = icmp eq i32 %16, 0, !dbg !26
  br i1 %17, label %then7, label %else8, !dbg !26

then7:                                            ; preds = %if.end6
  %18 = call i32 (ptr, ...) @printf(ptr @0), !dbg !27
  br label %if.end9, !dbg !27

else8:                                            ; preds = %if.end6
  %19 = call i32 (ptr, ...) @printf(ptr @1), !dbg !29
  br label %if.end9, !dbg !29

if.end9:                                          ; preds = %else8, %then7
  %20 = load i32, ptr %err, align 4, !dbg !31
  ret i32 %20, !dbg !31
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "30.array_mixed_decl.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "b", scope: !4, file: !1, line: 8, type: !7)
!10 = !DILocation(line: 8, column: 3, scope: !4)
!11 = !DILocalVariable(name: "a", scope: !4, file: !1, line: 8, type: !12)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 128, align: 32, elements: !13)
!13 = !{!14}
!14 = !DISubrange(count: 4, lowerBound: 0)
!15 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 7, type: !7)
!16 = !DILocation(line: 7, column: 3, scope: !4)
!17 = !DILocation(line: 9, column: 3, scope: !4)
!18 = !DILocation(line: 10, column: 3, scope: !4)
!19 = !DILocation(line: 11, column: 3, scope: !4)
!20 = !DILocation(line: 13, column: 3, scope: !4)
!21 = !DILocation(line: 13, column: 19, scope: !4)
!22 = !DILocation(line: 14, column: 3, scope: !4)
!23 = !DILocation(line: 14, column: 19, scope: !4)
!24 = !DILocation(line: 15, column: 3, scope: !4)
!25 = !DILocation(line: 15, column: 16, scope: !4)
!26 = !DILocation(line: 17, column: 3, scope: !4)
!27 = !DILocation(line: 18, column: 5, scope: !28)
!28 = distinct !DILexicalBlock(scope: !4, file: !1, line: 17, column: 17)
!29 = !DILocation(line: 20, column: 5, scope: !30)
!30 = distinct !DILexicalBlock(scope: !4, file: !1, line: 19, column: 10)
!31 = !DILocation(line: 22, column: 3, scope: !4)
