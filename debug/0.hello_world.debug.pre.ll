; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [22 x i8] c"0.hello_world.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"0.hello_world.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !8, !DIExpression(), !9)
  store i32 0, ptr %err, align 4, !dbg !9
  br i1 false, label %then, label %else, !dbg !10

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !11
  %0 = load i32, ptr %err, align 4, !dbg !11
  br label %if.end, !dbg !11

else:                                             ; preds = %entry
  br label %if.end, !dbg !11

if.end:                                           ; preds = %else, %then
  %1 = load i32, ptr %err, align 4, !dbg !12
  %2 = icmp eq i32 %1, 0, !dbg !12
  br i1 %2, label %then1, label %else2, !dbg !12

then1:                                            ; preds = %if.end
  %3 = call i32 (ptr, ...) @printf(ptr @0), !dbg !13
  br label %if.end3, !dbg !13

else2:                                            ; preds = %if.end
  %4 = call i32 (ptr, ...) @printf(ptr @1), !dbg !15
  br label %if.end3, !dbg !15

if.end3:                                          ; preds = %else2, %then1
  %5 = load i32, ptr %err, align 4, !dbg !17
  ret i32 %5, !dbg !17
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "0.hello_world.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 7, type: !5, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 8, type: !7)
!9 = !DILocation(line: 8, column: 3, scope: !4)
!10 = !DILocation(line: 9, column: 3, scope: !4)
!11 = !DILocation(line: 9, column: 15, scope: !4)
!12 = !DILocation(line: 10, column: 3, scope: !4)
!13 = !DILocation(line: 11, column: 5, scope: !14)
!14 = distinct !DILexicalBlock(scope: !4, file: !3, line: 10, column: 17)
!15 = !DILocation(line: 13, column: 5, scope: !16)
!16 = distinct !DILexicalBlock(scope: !4, file: !3, line: 12, column: 10)
!17 = !DILocation(line: 15, column: 3, scope: !4)
