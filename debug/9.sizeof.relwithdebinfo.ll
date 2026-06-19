; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%union.ID = type { i8* }
%struct.Student = type { i32, i8*, i8, float }

@0 = private unnamed_addr constant [17 x i8] c"9.sizeof.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"9.sizeof.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %sex = alloca i32, align 4
  %id = alloca %union.ID, align 8
  %student = alloca %struct.Student, align 8
  %pc = alloca i8*, align 8
  %d = alloca double, align 8
  %f = alloca float, align 4
  %l = alloca i64, align 8
  %i = alloca i32, align 4
  %c = alloca i8, align 1
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  %0 = load i32, i32* %err, align 4, !dbg !7
  %1 = icmp eq i32 %0, 0, !dbg !7
  %. = select i1 %1, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @1, i32 0, i32 0), !dbg !7
  %2 = call i32 (i8*, ...) @printf(i8* %.), !dbg !7
  %3 = load i32, i32* %err, align 4, !dbg !7
  ret i32 %3, !dbg !7
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "9.sizeof.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
