; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [22 x i8] c"0.hello_world.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"0.hello_world.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !6, !DIExpression(), !7)
  store i32 0, ptr %err, align 4, !dbg !7
  br i1 false, label %then, label %else, !dbg !8

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !9
  %0 = load i32, ptr %err, align 4, !dbg !9
  br label %if.end, !dbg !9

else:                                             ; preds = %entry
  br label %if.end, !dbg !9

if.end:                                           ; preds = %else, %then
  %1 = load i32, ptr %err, align 4, !dbg !10
  %2 = icmp eq i32 %1, 0, !dbg !10
  br i1 %2, label %then1, label %else2, !dbg !10

then1:                                            ; preds = %if.end
  %3 = call i32 (ptr, ...) @printf(ptr @0), !dbg !11
  br label %if.end3, !dbg !11

else2:                                            ; preds = %if.end
  %4 = call i32 (ptr, ...) @printf(ptr @1), !dbg !13
  br label %if.end3, !dbg !13

if.end3:                                          ; preds = %else2, %then1
  %5 = load i32, ptr %err, align 4, !dbg !15
  ret i32 %5, !dbg !15
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "0.hello_world.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 4, type: !5)
!7 = !DILocation(line: 4, column: 3, scope: !2)
!8 = !DILocation(line: 5, column: 3, scope: !2)
!9 = !DILocation(line: 5, column: 15, scope: !2)
!10 = !DILocation(line: 6, column: 3, scope: !2)
!11 = !DILocation(line: 7, column: 5, scope: !12)
!12 = distinct !DILexicalBlock(scope: !2, file: !1, line: 6, column: 17)
!13 = !DILocation(line: 9, column: 5, scope: !14)
!14 = distinct !DILexicalBlock(scope: !2, file: !1, line: 8, column: 10)
!15 = !DILocation(line: 11, column: 3, scope: !2)
