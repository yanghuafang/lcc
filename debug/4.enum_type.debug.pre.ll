; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [20 x i8] c"4.enum_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"4.enum_type.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %v = alloca i32, align 4
    #dbg_declare(ptr %v, !8, !DIExpression(), !9)
  %sex = alloca i32, align 4
    #dbg_declare(ptr %sex, !10, !DIExpression(), !11)
  %day = alloca i32, align 4
    #dbg_declare(ptr %day, !12, !DIExpression(), !13)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !14, !DIExpression(), !15)
  store i32 0, ptr %err, align 4, !dbg !15
  store i32 5, ptr %day, align 4, !dbg !13
  store i32 1, ptr %sex, align 4, !dbg !11
  store i32 0, ptr %v, align 4, !dbg !16
  %0 = load i32, ptr %v, align 4, !dbg !16
  %1 = load i32, ptr %v, align 4, !dbg !17
  %2 = icmp ne i32 %1, 0, !dbg !17
  br i1 %2, label %then, label %else, !dbg !17

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !18
  %3 = load i32, ptr %err, align 4, !dbg !18
  br label %if.end, !dbg !18

else:                                             ; preds = %entry
  br label %if.end, !dbg !18

if.end:                                           ; preds = %else, %then
  store i32 1, ptr %v, align 4, !dbg !19
  %4 = load i32, ptr %v, align 4, !dbg !19
  %5 = load i32, ptr %v, align 4, !dbg !20
  %6 = icmp ne i32 %5, 1, !dbg !20
  br i1 %6, label %then1, label %else2, !dbg !20

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !21
  %7 = load i32, ptr %err, align 4, !dbg !21
  br label %if.end3, !dbg !21

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !21

if.end3:                                          ; preds = %else2, %then1
  store i32 5, ptr %v, align 4, !dbg !22
  %8 = load i32, ptr %v, align 4, !dbg !22
  %9 = load i32, ptr %v, align 4, !dbg !23
  %10 = icmp ne i32 %9, 5, !dbg !23
  br i1 %10, label %then4, label %else5, !dbg !23

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !24
  %11 = load i32, ptr %err, align 4, !dbg !24
  br label %if.end6, !dbg !24

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !24

if.end6:                                          ; preds = %else5, %then4
  store i32 6, ptr %v, align 4, !dbg !25
  %12 = load i32, ptr %v, align 4, !dbg !25
  %13 = load i32, ptr %v, align 4, !dbg !26
  %14 = icmp ne i32 %13, 6, !dbg !26
  br i1 %14, label %then7, label %else8, !dbg !26

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !27
  %15 = load i32, ptr %err, align 4, !dbg !27
  br label %if.end9, !dbg !27

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !27

if.end9:                                          ; preds = %else8, %then7
  %16 = load i32, ptr %day, align 4, !dbg !28
  store i32 %16, ptr %v, align 4, !dbg !28
  %17 = load i32, ptr %v, align 4, !dbg !28
  %18 = load i32, ptr %v, align 4, !dbg !29
  %19 = icmp ne i32 %18, 5, !dbg !29
  br i1 %19, label %then10, label %else11, !dbg !29

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !30
  %20 = load i32, ptr %err, align 4, !dbg !30
  br label %if.end12, !dbg !30

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !30

if.end12:                                         ; preds = %else11, %then10
  store i32 0, ptr %v, align 4, !dbg !31
  %21 = load i32, ptr %v, align 4, !dbg !31
  %22 = load i32, ptr %v, align 4, !dbg !32
  %23 = icmp ne i32 %22, 0, !dbg !32
  br i1 %23, label %then13, label %else14, !dbg !32

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !33
  %24 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end15, !dbg !33

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !33

if.end15:                                         ; preds = %else14, %then13
  store i32 1, ptr %v, align 4, !dbg !34
  %25 = load i32, ptr %v, align 4, !dbg !34
  %26 = load i32, ptr %v, align 4, !dbg !35
  %27 = icmp ne i32 %26, 1, !dbg !35
  br i1 %27, label %then16, label %else17, !dbg !35

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !36
  %28 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end18, !dbg !36

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !36

if.end18:                                         ; preds = %else17, %then16
  %29 = load i32, ptr %sex, align 4, !dbg !37
  store i32 %29, ptr %v, align 4, !dbg !37
  %30 = load i32, ptr %v, align 4, !dbg !37
  %31 = load i32, ptr %v, align 4, !dbg !38
  %32 = icmp ne i32 %31, 1, !dbg !38
  br i1 %32, label %then19, label %else20, !dbg !38

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !39
  %33 = load i32, ptr %err, align 4, !dbg !39
  br label %if.end21, !dbg !39

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !39

if.end21:                                         ; preds = %else20, %then19
  %34 = load i32, ptr %err, align 4, !dbg !40
  %35 = icmp eq i32 %34, 0, !dbg !40
  br i1 %35, label %then22, label %else23, !dbg !40

then22:                                           ; preds = %if.end21
  %36 = call i32 (ptr, ...) @printf(ptr @0), !dbg !41
  br label %if.end24, !dbg !41

else23:                                           ; preds = %if.end21
  %37 = call i32 (ptr, ...) @printf(ptr @1), !dbg !43
  br label %if.end24, !dbg !43

if.end24:                                         ; preds = %else23, %then22
  %38 = load i32, ptr %err, align 4, !dbg !45
  ret i32 %38, !dbg !45
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "4.enum_type.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 18, type: !5, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "v", scope: !4, file: !3, line: 22, type: !7)
!9 = !DILocation(line: 22, column: 3, scope: !4)
!10 = !DILocalVariable(name: "sex", scope: !4, file: !3, line: 21, type: !7)
!11 = !DILocation(line: 21, column: 3, scope: !4)
!12 = !DILocalVariable(name: "day", scope: !4, file: !3, line: 20, type: !7)
!13 = !DILocation(line: 20, column: 3, scope: !4)
!14 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 19, type: !7)
!15 = !DILocation(line: 19, column: 3, scope: !4)
!16 = !DILocation(line: 24, column: 3, scope: !4)
!17 = !DILocation(line: 25, column: 3, scope: !4)
!18 = !DILocation(line: 25, column: 15, scope: !4)
!19 = !DILocation(line: 26, column: 3, scope: !4)
!20 = !DILocation(line: 27, column: 3, scope: !4)
!21 = !DILocation(line: 27, column: 15, scope: !4)
!22 = !DILocation(line: 28, column: 3, scope: !4)
!23 = !DILocation(line: 29, column: 3, scope: !4)
!24 = !DILocation(line: 29, column: 15, scope: !4)
!25 = !DILocation(line: 30, column: 3, scope: !4)
!26 = !DILocation(line: 31, column: 3, scope: !4)
!27 = !DILocation(line: 31, column: 15, scope: !4)
!28 = !DILocation(line: 32, column: 3, scope: !4)
!29 = !DILocation(line: 33, column: 3, scope: !4)
!30 = !DILocation(line: 33, column: 15, scope: !4)
!31 = !DILocation(line: 34, column: 3, scope: !4)
!32 = !DILocation(line: 35, column: 3, scope: !4)
!33 = !DILocation(line: 35, column: 15, scope: !4)
!34 = !DILocation(line: 36, column: 3, scope: !4)
!35 = !DILocation(line: 37, column: 3, scope: !4)
!36 = !DILocation(line: 37, column: 15, scope: !4)
!37 = !DILocation(line: 38, column: 3, scope: !4)
!38 = !DILocation(line: 39, column: 3, scope: !4)
!39 = !DILocation(line: 39, column: 15, scope: !4)
!40 = !DILocation(line: 41, column: 3, scope: !4)
!41 = !DILocation(line: 42, column: 5, scope: !42)
!42 = distinct !DILexicalBlock(scope: !4, file: !3, line: 41, column: 17)
!43 = !DILocation(line: 44, column: 5, scope: !44)
!44 = distinct !DILexicalBlock(scope: !4, file: !3, line: 43, column: 10)
!45 = !DILocation(line: 46, column: 3, scope: !4)
