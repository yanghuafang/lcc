; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [28 x i8] c"30.array_mixed_decl.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [28 x i8] c"30.array_mixed_decl.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %b = alloca i32, align 4
    #dbg_declare(ptr %b, !6, !DIExpression(), !7)
  %a = alloca [4 x i32], align 4
    #dbg_declare(ptr %a, !8, !DIExpression(), !7)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !12, !DIExpression(), !13)
  store i32 0, ptr %err, align 4, !dbg !13
  %0 = getelementptr i32, ptr %a, i32 0, !dbg !14
  store i32 10, ptr %0, align 4, !dbg !14
  %1 = load i32, ptr %0, align 4, !dbg !14
  %2 = getelementptr i32, ptr %a, i32 1, !dbg !15
  store i32 20, ptr %2, align 4, !dbg !15
  %3 = load i32, ptr %2, align 4, !dbg !15
  store i32 30, ptr %b, align 4, !dbg !16
  %4 = load i32, ptr %b, align 4, !dbg !16
  %5 = getelementptr i32, ptr %a, i32 0, !dbg !17
  %6 = load i32, ptr %5, align 4, !dbg !17
  %7 = icmp ne i32 %6, 10, !dbg !17
  br i1 %7, label %then, label %else, !dbg !17

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !18
  %8 = load i32, ptr %err, align 4, !dbg !18
  br label %if.end, !dbg !18

else:                                             ; preds = %entry
  br label %if.end, !dbg !18

if.end:                                           ; preds = %else, %then
  %9 = getelementptr i32, ptr %a, i32 1, !dbg !19
  %10 = load i32, ptr %9, align 4, !dbg !19
  %11 = icmp ne i32 %10, 20, !dbg !19
  br i1 %11, label %then1, label %else2, !dbg !19

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !20
  %12 = load i32, ptr %err, align 4, !dbg !20
  br label %if.end3, !dbg !20

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !20

if.end3:                                          ; preds = %else2, %then1
  %13 = load i32, ptr %b, align 4, !dbg !21
  %14 = icmp ne i32 %13, 30, !dbg !21
  br i1 %14, label %then4, label %else5, !dbg !21

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !22
  %15 = load i32, ptr %err, align 4, !dbg !22
  br label %if.end6, !dbg !22

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !22

if.end6:                                          ; preds = %else5, %then4
  %16 = load i32, ptr %err, align 4, !dbg !23
  %17 = icmp eq i32 %16, 0, !dbg !23
  br i1 %17, label %then7, label %else8, !dbg !23

then7:                                            ; preds = %if.end6
  %18 = call i32 (ptr, ...) @printf(ptr @0), !dbg !24
  br label %if.end9, !dbg !24

else8:                                            ; preds = %if.end6
  %19 = call i32 (ptr, ...) @printf(ptr @1), !dbg !26
  br label %if.end9, !dbg !26

if.end9:                                          ; preds = %else8, %then7
  %20 = load i32, ptr %err, align 4, !dbg !28
  ret i32 %20, !dbg !28
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "30.array_mixed_decl.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "b", scope: !2, file: !1, line: 5, type: !5)
!7 = !DILocation(line: 5, column: 3, scope: !2)
!8 = !DILocalVariable(name: "a", scope: !2, file: !1, line: 5, type: !9)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 128, align: 32, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 4, lowerBound: 0)
!12 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 4, type: !5)
!13 = !DILocation(line: 4, column: 3, scope: !2)
!14 = !DILocation(line: 6, column: 3, scope: !2)
!15 = !DILocation(line: 7, column: 3, scope: !2)
!16 = !DILocation(line: 8, column: 3, scope: !2)
!17 = !DILocation(line: 10, column: 3, scope: !2)
!18 = !DILocation(line: 10, column: 19, scope: !2)
!19 = !DILocation(line: 11, column: 3, scope: !2)
!20 = !DILocation(line: 11, column: 19, scope: !2)
!21 = !DILocation(line: 12, column: 3, scope: !2)
!22 = !DILocation(line: 12, column: 16, scope: !2)
!23 = !DILocation(line: 14, column: 3, scope: !2)
!24 = !DILocation(line: 15, column: 5, scope: !25)
!25 = distinct !DILexicalBlock(scope: !2, file: !1, line: 14, column: 17)
!26 = !DILocation(line: 17, column: 5, scope: !27)
!27 = distinct !DILexicalBlock(scope: !2, file: !1, line: 16, column: 10)
!28 = !DILocation(line: 19, column: 3, scope: !2)
