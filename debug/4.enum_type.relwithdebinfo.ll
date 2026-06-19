; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [20 x i8] c"4.enum_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"4.enum_type.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %v = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %v, metadata !7, metadata !DIExpression()), !dbg !8
  %sex = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sex, metadata !9, metadata !DIExpression()), !dbg !10
  %day = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %day, metadata !11, metadata !DIExpression()), !dbg !12
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 0, i32* %err, align 4, !dbg !14
  store i32 5, i32* %day, align 4, !dbg !12
  store i32 1, i32* %sex, align 4, !dbg !10
  store i32 0, i32* %v, align 4, !dbg !15
  %0 = load i32, i32* %v, align 4, !dbg !15
  %1 = load i32, i32* %v, align 4, !dbg !16
  %2 = icmp ne i32 %1, 0, !dbg !16
  br i1 %2, label %then, label %if.end, !dbg !16

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !17
  %3 = load i32, i32* %err, align 4, !dbg !17
  br label %if.end, !dbg !17

if.end:                                           ; preds = %entry, %then
  store i32 1, i32* %v, align 4, !dbg !18
  %4 = load i32, i32* %v, align 4, !dbg !18
  %5 = load i32, i32* %v, align 4, !dbg !19
  %6 = icmp ne i32 %5, 1, !dbg !19
  br i1 %6, label %then1, label %if.end3, !dbg !19

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !20
  %7 = load i32, i32* %err, align 4, !dbg !20
  br label %if.end3, !dbg !20

if.end3:                                          ; preds = %if.end, %then1
  store i32 5, i32* %v, align 4, !dbg !21
  %8 = load i32, i32* %v, align 4, !dbg !21
  %9 = load i32, i32* %v, align 4, !dbg !22
  %10 = icmp ne i32 %9, 5, !dbg !22
  br i1 %10, label %then4, label %if.end6, !dbg !22

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !23
  %11 = load i32, i32* %err, align 4, !dbg !23
  br label %if.end6, !dbg !23

if.end6:                                          ; preds = %if.end3, %then4
  store i32 6, i32* %v, align 4, !dbg !24
  %12 = load i32, i32* %v, align 4, !dbg !24
  %13 = load i32, i32* %v, align 4, !dbg !25
  %14 = icmp ne i32 %13, 6, !dbg !25
  br i1 %14, label %then7, label %if.end9, !dbg !25

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !26
  %15 = load i32, i32* %err, align 4, !dbg !26
  br label %if.end9, !dbg !26

if.end9:                                          ; preds = %if.end6, %then7
  %16 = load i32, i32* %day, align 4, !dbg !27
  store i32 %16, i32* %v, align 4, !dbg !27
  %17 = load i32, i32* %v, align 4, !dbg !27
  %18 = load i32, i32* %v, align 4, !dbg !28
  %19 = icmp ne i32 %18, 5, !dbg !28
  br i1 %19, label %then10, label %if.end12, !dbg !28

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !29
  %20 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end12, !dbg !29

if.end12:                                         ; preds = %if.end9, %then10
  store i32 0, i32* %v, align 4, !dbg !30
  %21 = load i32, i32* %v, align 4, !dbg !30
  %22 = load i32, i32* %v, align 4, !dbg !31
  %23 = icmp ne i32 %22, 0, !dbg !31
  br i1 %23, label %then13, label %if.end15, !dbg !31

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !32
  %24 = load i32, i32* %err, align 4, !dbg !32
  br label %if.end15, !dbg !32

if.end15:                                         ; preds = %if.end12, %then13
  store i32 1, i32* %v, align 4, !dbg !33
  %25 = load i32, i32* %v, align 4, !dbg !33
  %26 = load i32, i32* %v, align 4, !dbg !34
  %27 = icmp ne i32 %26, 1, !dbg !34
  br i1 %27, label %then16, label %if.end18, !dbg !34

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !35
  %28 = load i32, i32* %err, align 4, !dbg !35
  br label %if.end18, !dbg !35

if.end18:                                         ; preds = %if.end15, %then16
  %29 = load i32, i32* %sex, align 4, !dbg !36
  store i32 %29, i32* %v, align 4, !dbg !36
  %30 = load i32, i32* %v, align 4, !dbg !36
  %31 = load i32, i32* %v, align 4, !dbg !37
  %32 = icmp ne i32 %31, 1, !dbg !37
  br i1 %32, label %then19, label %if.end21, !dbg !37

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !38
  %33 = load i32, i32* %err, align 4, !dbg !38
  br label %if.end21, !dbg !38

if.end21:                                         ; preds = %if.end18, %then19
  %34 = load i32, i32* %err, align 4, !dbg !39
  %35 = icmp eq i32 %34, 0, !dbg !39
  %. = select i1 %35, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @1, i32 0, i32 0), !dbg !40
  %36 = call i32 (i8*, ...) @printf(i8* %.), !dbg !40
  %37 = load i32, i32* %err, align 4, !dbg !41
  ret i32 %37, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "4.enum_type.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 15, type: !3, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "v", scope: !2, file: !1, line: 19, type: !5)
!8 = !DILocation(line: 19, column: 3, scope: !2)
!9 = !DILocalVariable(name: "sex", scope: !2, file: !1, line: 18, type: !5)
!10 = !DILocation(line: 18, column: 3, scope: !2)
!11 = !DILocalVariable(name: "day", scope: !2, file: !1, line: 17, type: !5)
!12 = !DILocation(line: 17, column: 3, scope: !2)
!13 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 16, type: !5)
!14 = !DILocation(line: 16, column: 3, scope: !2)
!15 = !DILocation(line: 21, column: 3, scope: !2)
!16 = !DILocation(line: 22, column: 3, scope: !2)
!17 = !DILocation(line: 22, column: 15, scope: !2)
!18 = !DILocation(line: 23, column: 3, scope: !2)
!19 = !DILocation(line: 24, column: 3, scope: !2)
!20 = !DILocation(line: 24, column: 15, scope: !2)
!21 = !DILocation(line: 25, column: 3, scope: !2)
!22 = !DILocation(line: 26, column: 3, scope: !2)
!23 = !DILocation(line: 26, column: 15, scope: !2)
!24 = !DILocation(line: 27, column: 3, scope: !2)
!25 = !DILocation(line: 28, column: 3, scope: !2)
!26 = !DILocation(line: 28, column: 15, scope: !2)
!27 = !DILocation(line: 29, column: 3, scope: !2)
!28 = !DILocation(line: 30, column: 3, scope: !2)
!29 = !DILocation(line: 30, column: 15, scope: !2)
!30 = !DILocation(line: 31, column: 3, scope: !2)
!31 = !DILocation(line: 32, column: 3, scope: !2)
!32 = !DILocation(line: 32, column: 15, scope: !2)
!33 = !DILocation(line: 33, column: 3, scope: !2)
!34 = !DILocation(line: 34, column: 3, scope: !2)
!35 = !DILocation(line: 34, column: 15, scope: !2)
!36 = !DILocation(line: 35, column: 3, scope: !2)
!37 = !DILocation(line: 36, column: 3, scope: !2)
!38 = !DILocation(line: 36, column: 15, scope: !2)
!39 = !DILocation(line: 38, column: 3, scope: !2)
!40 = !DILocation(line: 0, scope: !2)
!41 = !DILocation(line: 43, column: 3, scope: !2)
