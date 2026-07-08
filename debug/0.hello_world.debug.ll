; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [22 x i8] c"0.hello_world.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"0.hello_world.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !9, !DIExpression(), !10)
  store i32 0, ptr %err, align 4, !dbg !10
  br i1 false, label %then, label %else, !dbg !11

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !12
  %0 = load i32, ptr %err, align 4, !dbg !12
  br label %if.end, !dbg !12

else:                                             ; preds = %entry
  br label %if.end, !dbg !12

if.end:                                           ; preds = %else, %then
  %1 = load i32, ptr %err, align 4, !dbg !13
  %2 = icmp eq i32 %1, 0, !dbg !13
  br i1 %2, label %then1, label %else2, !dbg !13

then1:                                            ; preds = %if.end
  %3 = call i32 (ptr, ...) @printf(ptr @0), !dbg !14
  br label %if.end3, !dbg !14

else2:                                            ; preds = %if.end
  %4 = call i32 (ptr, ...) @printf(ptr @1), !dbg !16
  br label %if.end3, !dbg !16

if.end3:                                          ; preds = %else2, %then1
  %5 = load i32, ptr %err, align 4, !dbg !18
  ret i32 %5, !dbg !18
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "0.hello_world.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 4, type: !7)
!10 = !DILocation(line: 4, column: 3, scope: !4)
!11 = !DILocation(line: 5, column: 3, scope: !4)
!12 = !DILocation(line: 5, column: 15, scope: !4)
!13 = !DILocation(line: 6, column: 3, scope: !4)
!14 = !DILocation(line: 7, column: 5, scope: !15)
!15 = distinct !DILexicalBlock(scope: !4, file: !1, line: 6, column: 17)
!16 = !DILocation(line: 9, column: 5, scope: !17)
!17 = distinct !DILexicalBlock(scope: !4, file: !1, line: 8, column: 10)
!18 = !DILocation(line: 11, column: 3, scope: !4)
