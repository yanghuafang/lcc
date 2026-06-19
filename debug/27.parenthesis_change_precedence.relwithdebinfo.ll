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
  %r = alloca i32, align 4
  %z = alloca i32, align 4
  %y = alloca i32, align 4
  %x = alloca i32, align 4
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  store i32 2, i32* %a, align 4, !dbg !8
  store i32 4, i32* %b, align 4, !dbg !9
  store i32 5, i32* %c, align 4, !dbg !10
  %0 = load i32, i32* %a, align 4, !dbg !11
  %1 = load i32, i32* %b, align 4, !dbg !11
  %2 = load i32, i32* %c, align 4, !dbg !11
  %3 = mul i32 %1, %2, !dbg !11
  %4 = add i32 %0, %3, !dbg !11
  %5 = icmp ne i32 %4, 22, !dbg !11
  br i1 %5, label %then, label %if.end, !dbg !11

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !12
  %6 = load i32, i32* %err, align 4, !dbg !12
  br label %if.end, !dbg !12

if.end:                                           ; preds = %entry, %then
  %7 = load i32, i32* %a, align 4, !dbg !13
  %8 = load i32, i32* %b, align 4, !dbg !13
  %9 = add i32 %7, %8, !dbg !13
  %10 = load i32, i32* %c, align 4, !dbg !13
  %11 = mul i32 %9, %10, !dbg !13
  %12 = icmp ne i32 %11, 30, !dbg !13
  br i1 %12, label %then1, label %if.end3, !dbg !13

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !14
  %13 = load i32, i32* %err, align 4, !dbg !14
  br label %if.end3, !dbg !14

if.end3:                                          ; preds = %if.end, %then1
  %14 = load i32, i32* %c, align 4, !dbg !15
  %15 = load i32, i32* %a, align 4, !dbg !15
  %16 = load i32, i32* %b, align 4, !dbg !15
  %17 = sub i32 %15, %16, !dbg !15
  %18 = mul i32 %14, %17, !dbg !15
  %19 = icmp ne i32 %18, -10, !dbg !15
  br i1 %19, label %then4, label %if.end6, !dbg !15

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !16
  %20 = load i32, i32* %err, align 4, !dbg !16
  br label %if.end6, !dbg !16

if.end6:                                          ; preds = %if.end3, %then4
  %21 = load i32, i32* %a, align 4, !dbg !17
  %22 = load i32, i32* %b, align 4, !dbg !17
  %23 = load i32, i32* %c, align 4, !dbg !17
  %24 = srem i32 %22, %23, !dbg !17
  %25 = sub i32 %21, %24, !dbg !17
  %26 = icmp ne i32 %25, -2, !dbg !17
  br i1 %26, label %then7, label %if.end9, !dbg !17

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !18
  %27 = load i32, i32* %err, align 4, !dbg !18
  br label %if.end9, !dbg !18

if.end9:                                          ; preds = %if.end6, %then7
  %28 = load i32, i32* %a, align 4, !dbg !19
  %29 = load i32, i32* %b, align 4, !dbg !19
  %30 = add i32 %28, %29, !dbg !19
  %31 = load i32, i32* %c, align 4, !dbg !19
  %32 = sdiv i32 %30, %31, !dbg !19
  %33 = icmp ne i32 %32, 1, !dbg !19
  br i1 %33, label %then10, label %if.end12, !dbg !19

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !20
  %34 = load i32, i32* %err, align 4, !dbg !20
  br label %if.end12, !dbg !20

if.end12:                                         ; preds = %if.end9, %then10
  store i32 1, i32* %x, align 4, !dbg !21
  store i32 2, i32* %y, align 4, !dbg !22
  store i32 3, i32* %z, align 4, !dbg !23
  %35 = load i32, i32* %x, align 4, !dbg !24
  %36 = load i32, i32* %y, align 4, !dbg !24
  %37 = add i32 %35, %36, !dbg !24
  %38 = load i32, i32* %z, align 4, !dbg !24
  %39 = shl i32 %37, %38, !dbg !24
  store i32 %39, i32* %r, align 4, !dbg !24
  %40 = load i32, i32* %r, align 4, !dbg !25
  %41 = icmp ne i32 %40, 24, !dbg !25
  br i1 %41, label %then13, label %if.end15, !dbg !25

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !26
  %42 = load i32, i32* %err, align 4, !dbg !26
  br label %if.end15, !dbg !26

if.end15:                                         ; preds = %if.end12, %then13
  %43 = load i32, i32* %x, align 4, !dbg !27
  %44 = load i32, i32* %y, align 4, !dbg !27
  %45 = add i32 %43, %44, !dbg !27
  %46 = load i32, i32* %z, align 4, !dbg !27
  %47 = shl i32 %45, %46, !dbg !27
  store i32 %47, i32* %s, align 4, !dbg !27
  %48 = load i32, i32* %s, align 4, !dbg !28
  %49 = icmp ne i32 %48, 24, !dbg !28
  br i1 %49, label %then16, label %if.end18, !dbg !28

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !29
  %50 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end18, !dbg !29

if.end18:                                         ; preds = %if.end15, %then16
  %51 = load i32, i32* %err, align 4, !dbg !30
  %52 = icmp eq i32 %51, 0, !dbg !30
  %. = select i1 %52, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([41 x i8], [41 x i8]* @1, i32 0, i32 0), !dbg !31
  %53 = call i32 (i8*, ...) @printf(i8* %.), !dbg !31
  %54 = load i32, i32* %err, align 4, !dbg !32
  ret i32 %54, !dbg !32
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "27.parenthesis_change_precedence.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 4, column: 3, scope: !2)
!8 = !DILocation(line: 5, column: 3, scope: !2)
!9 = !DILocation(line: 6, column: 3, scope: !2)
!10 = !DILocation(line: 7, column: 3, scope: !2)
!11 = !DILocation(line: 9, column: 3, scope: !2)
!12 = !DILocation(line: 9, column: 24, scope: !2)
!13 = !DILocation(line: 10, column: 3, scope: !2)
!14 = !DILocation(line: 10, column: 26, scope: !2)
!15 = !DILocation(line: 11, column: 3, scope: !2)
!16 = !DILocation(line: 11, column: 27, scope: !2)
!17 = !DILocation(line: 12, column: 3, scope: !2)
!18 = !DILocation(line: 12, column: 24, scope: !2)
!19 = !DILocation(line: 13, column: 3, scope: !2)
!20 = !DILocation(line: 13, column: 25, scope: !2)
!21 = !DILocation(line: 15, column: 3, scope: !2)
!22 = !DILocation(line: 16, column: 3, scope: !2)
!23 = !DILocation(line: 17, column: 3, scope: !2)
!24 = !DILocation(line: 18, column: 3, scope: !2)
!25 = !DILocation(line: 19, column: 3, scope: !2)
!26 = !DILocation(line: 19, column: 16, scope: !2)
!27 = !DILocation(line: 21, column: 3, scope: !2)
!28 = !DILocation(line: 22, column: 3, scope: !2)
!29 = !DILocation(line: 22, column: 16, scope: !2)
!30 = !DILocation(line: 24, column: 3, scope: !2)
!31 = !DILocation(line: 0, scope: !2)
!32 = !DILocation(line: 29, column: 3, scope: !2)
