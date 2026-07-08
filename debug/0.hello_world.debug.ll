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
  %0 = load i32, ptr %err, align 4, !dbg !11
  %1 = icmp eq i32 %0, 0, !dbg !11
  %. = select i1 %1, ptr @0, ptr @1, !dbg !12
  %2 = call i32 (ptr, ...) @printf(ptr %.), !dbg !12
  %3 = load i32, ptr %err, align 4, !dbg !13
  ret i32 %3, !dbg !13
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
!11 = !DILocation(line: 6, column: 3, scope: !4)
!12 = !DILocation(line: 0, scope: !4)
!13 = !DILocation(line: 11, column: 3, scope: !4)
