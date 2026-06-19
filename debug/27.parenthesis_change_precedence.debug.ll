; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [41 x i8] c"27.parenthesis_change_precedence.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [41 x i8] c"27.parenthesis_change_precedence.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %s = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %s, metadata !7, metadata !DIExpression()), !dbg !8
  %r = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %r, metadata !9, metadata !DIExpression()), !dbg !10
  %z = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %z, metadata !11, metadata !DIExpression()), !dbg !12
  %y = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %y, metadata !13, metadata !DIExpression()), !dbg !14
  %x = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !15, metadata !DIExpression()), !dbg !16
  %c = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %c, metadata !17, metadata !DIExpression()), !dbg !18
  %b = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %b, metadata !19, metadata !DIExpression()), !dbg !20
  %a = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !21, metadata !DIExpression()), !dbg !22
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 0, i32* %err, align 4, !dbg !24
  store i32 2, i32* %a, align 4, !dbg !22
  store i32 4, i32* %b, align 4, !dbg !20
  store i32 5, i32* %c, align 4, !dbg !18
  %0 = load i32, i32* %a, align 4, !dbg !25
  %1 = load i32, i32* %b, align 4, !dbg !25
  %2 = load i32, i32* %c, align 4, !dbg !25
  %3 = mul i32 %1, %2, !dbg !25
  %4 = add i32 %0, %3, !dbg !25
  %5 = icmp ne i32 %4, 22, !dbg !25
  br i1 %5, label %then, label %if.end, !dbg !25

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !26
  %6 = load i32, i32* %err, align 4, !dbg !26
  br label %if.end, !dbg !26

if.end:                                           ; preds = %entry, %then
  %7 = load i32, i32* %a, align 4, !dbg !27
  %8 = load i32, i32* %b, align 4, !dbg !27
  %9 = add i32 %7, %8, !dbg !27
  %10 = load i32, i32* %c, align 4, !dbg !27
  %11 = mul i32 %9, %10, !dbg !27
  %12 = icmp ne i32 %11, 30, !dbg !27
  br i1 %12, label %then1, label %if.end3, !dbg !27

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !28
  %13 = load i32, i32* %err, align 4, !dbg !28
  br label %if.end3, !dbg !28

if.end3:                                          ; preds = %if.end, %then1
  %14 = load i32, i32* %c, align 4, !dbg !29
  %15 = load i32, i32* %a, align 4, !dbg !29
  %16 = load i32, i32* %b, align 4, !dbg !29
  %17 = sub i32 %15, %16, !dbg !29
  %18 = mul i32 %14, %17, !dbg !29
  %19 = icmp ne i32 %18, -10, !dbg !29
  br i1 %19, label %then4, label %if.end6, !dbg !29

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !30
  %20 = load i32, i32* %err, align 4, !dbg !30
  br label %if.end6, !dbg !30

if.end6:                                          ; preds = %if.end3, %then4
  %21 = load i32, i32* %a, align 4, !dbg !31
  %22 = load i32, i32* %b, align 4, !dbg !31
  %23 = load i32, i32* %c, align 4, !dbg !31
  %24 = srem i32 %22, %23, !dbg !31
  %25 = sub i32 %21, %24, !dbg !31
  %26 = icmp ne i32 %25, -2, !dbg !31
  br i1 %26, label %then7, label %if.end9, !dbg !31

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !32
  %27 = load i32, i32* %err, align 4, !dbg !32
  br label %if.end9, !dbg !32

if.end9:                                          ; preds = %if.end6, %then7
  %28 = load i32, i32* %a, align 4, !dbg !33
  %29 = load i32, i32* %b, align 4, !dbg !33
  %30 = add i32 %28, %29, !dbg !33
  %31 = load i32, i32* %c, align 4, !dbg !33
  %32 = sdiv i32 %30, %31, !dbg !33
  %33 = icmp ne i32 %32, 1, !dbg !33
  br i1 %33, label %then10, label %if.end12, !dbg !33

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !34
  %34 = load i32, i32* %err, align 4, !dbg !34
  br label %if.end12, !dbg !34

if.end12:                                         ; preds = %if.end9, %then10
  store i32 1, i32* %x, align 4, !dbg !16
  store i32 2, i32* %y, align 4, !dbg !14
  store i32 3, i32* %z, align 4, !dbg !12
  %35 = load i32, i32* %x, align 4, !dbg !10
  %36 = load i32, i32* %y, align 4, !dbg !10
  %37 = add i32 %35, %36, !dbg !10
  %38 = load i32, i32* %z, align 4, !dbg !10
  %39 = shl i32 %37, %38, !dbg !10
  store i32 %39, i32* %r, align 4, !dbg !10
  %40 = load i32, i32* %r, align 4, !dbg !35
  %41 = icmp ne i32 %40, 24, !dbg !35
  br i1 %41, label %then13, label %if.end15, !dbg !35

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !36
  %42 = load i32, i32* %err, align 4, !dbg !36
  br label %if.end15, !dbg !36

if.end15:                                         ; preds = %if.end12, %then13
  %43 = load i32, i32* %x, align 4, !dbg !8
  %44 = load i32, i32* %y, align 4, !dbg !8
  %45 = add i32 %43, %44, !dbg !8
  %46 = load i32, i32* %z, align 4, !dbg !8
  %47 = shl i32 %45, %46, !dbg !8
  store i32 %47, i32* %s, align 4, !dbg !8
  %48 = load i32, i32* %s, align 4, !dbg !37
  %49 = icmp ne i32 %48, 24, !dbg !37
  br i1 %49, label %then16, label %if.end18, !dbg !37

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !38
  %50 = load i32, i32* %err, align 4, !dbg !38
  br label %if.end18, !dbg !38

if.end18:                                         ; preds = %if.end15, %then16
  %51 = load i32, i32* %err, align 4, !dbg !39
  %52 = icmp eq i32 %51, 0, !dbg !39
  %. = select i1 %52, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([41 x i8], [41 x i8]* @1, i32 0, i32 0), !dbg !40
  %53 = call i32 (i8*, ...) @printf(i8* %.), !dbg !40
  %54 = load i32, i32* %err, align 4, !dbg !41
  ret i32 %54, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "27.parenthesis_change_precedence.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "s", scope: !2, file: !1, line: 21, type: !5)
!8 = !DILocation(line: 21, column: 3, scope: !2)
!9 = !DILocalVariable(name: "r", scope: !2, file: !1, line: 18, type: !5)
!10 = !DILocation(line: 18, column: 3, scope: !2)
!11 = !DILocalVariable(name: "z", scope: !2, file: !1, line: 17, type: !5)
!12 = !DILocation(line: 17, column: 3, scope: !2)
!13 = !DILocalVariable(name: "y", scope: !2, file: !1, line: 16, type: !5)
!14 = !DILocation(line: 16, column: 3, scope: !2)
!15 = !DILocalVariable(name: "x", scope: !2, file: !1, line: 15, type: !5)
!16 = !DILocation(line: 15, column: 3, scope: !2)
!17 = !DILocalVariable(name: "c", scope: !2, file: !1, line: 7, type: !5)
!18 = !DILocation(line: 7, column: 3, scope: !2)
!19 = !DILocalVariable(name: "b", scope: !2, file: !1, line: 6, type: !5)
!20 = !DILocation(line: 6, column: 3, scope: !2)
!21 = !DILocalVariable(name: "a", scope: !2, file: !1, line: 5, type: !5)
!22 = !DILocation(line: 5, column: 3, scope: !2)
!23 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 4, type: !5)
!24 = !DILocation(line: 4, column: 3, scope: !2)
!25 = !DILocation(line: 9, column: 3, scope: !2)
!26 = !DILocation(line: 9, column: 24, scope: !2)
!27 = !DILocation(line: 10, column: 3, scope: !2)
!28 = !DILocation(line: 10, column: 26, scope: !2)
!29 = !DILocation(line: 11, column: 3, scope: !2)
!30 = !DILocation(line: 11, column: 27, scope: !2)
!31 = !DILocation(line: 12, column: 3, scope: !2)
!32 = !DILocation(line: 12, column: 24, scope: !2)
!33 = !DILocation(line: 13, column: 3, scope: !2)
!34 = !DILocation(line: 13, column: 25, scope: !2)
!35 = !DILocation(line: 19, column: 3, scope: !2)
!36 = !DILocation(line: 19, column: 16, scope: !2)
!37 = !DILocation(line: 22, column: 3, scope: !2)
!38 = !DILocation(line: 22, column: 16, scope: !2)
!39 = !DILocation(line: 24, column: 3, scope: !2)
!40 = !DILocation(line: 0, scope: !2)
!41 = !DILocation(line: 29, column: 3, scope: !2)
