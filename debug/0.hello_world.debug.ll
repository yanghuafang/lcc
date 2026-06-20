; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [22 x i8] c"0.hello_world.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"0.hello_world.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !7, !DIExpression(), !8)
  store i32 0, ptr %err, align 4, !dbg !8
  %0 = load i32, ptr %err, align 4, !dbg !9
  %1 = icmp eq i32 %0, 0, !dbg !9
  %. = select i1 %1, ptr @0, ptr @1, !dbg !10
  %2 = call i32 (ptr, ...) @printf(ptr %.), !dbg !10
  %3 = load i32, ptr %err, align 4, !dbg !11
  ret i32 %3, !dbg !11
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "0.hello_world.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 4, type: !5)
!8 = !DILocation(line: 4, column: 3, scope: !2)
!9 = !DILocation(line: 6, column: 3, scope: !2)
!10 = !DILocation(line: 0, scope: !2)
!11 = !DILocation(line: 11, column: 3, scope: !2)
