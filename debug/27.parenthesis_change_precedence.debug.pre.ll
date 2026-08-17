; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [41 x i8] c"27.parenthesis_change_precedence.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [41 x i8] c"27.parenthesis_change_precedence.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %s = alloca i32, align 4
    #dbg_declare(ptr %s, !8, !DIExpression(), !9)
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !10, !DIExpression(), !11)
  %z = alloca i32, align 4
    #dbg_declare(ptr %z, !12, !DIExpression(), !13)
  %y = alloca i32, align 4
    #dbg_declare(ptr %y, !14, !DIExpression(), !15)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !16, !DIExpression(), !17)
  %c = alloca i32, align 4
    #dbg_declare(ptr %c, !18, !DIExpression(), !19)
  %b = alloca i32, align 4
    #dbg_declare(ptr %b, !20, !DIExpression(), !21)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !22, !DIExpression(), !23)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !24, !DIExpression(), !25)
  store i32 0, ptr %err, align 4, !dbg !25
  store i32 2, ptr %a, align 4, !dbg !23
  store i32 4, ptr %b, align 4, !dbg !21
  store i32 5, ptr %c, align 4, !dbg !19
  %0 = load i32, ptr %a, align 4, !dbg !26
  %1 = load i32, ptr %b, align 4, !dbg !26
  %2 = load i32, ptr %c, align 4, !dbg !26
  %3 = mul i32 %1, %2, !dbg !26
  %4 = add i32 %0, %3, !dbg !26
  %5 = icmp ne i32 %4, 22, !dbg !26
  br i1 %5, label %then, label %else, !dbg !26

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !27
  %6 = load i32, ptr %err, align 4, !dbg !27
  br label %if.end, !dbg !27

else:                                             ; preds = %entry
  br label %if.end, !dbg !27

if.end:                                           ; preds = %else, %then
  %7 = load i32, ptr %a, align 4, !dbg !28
  %8 = load i32, ptr %b, align 4, !dbg !28
  %9 = add i32 %7, %8, !dbg !28
  %10 = load i32, ptr %c, align 4, !dbg !28
  %11 = mul i32 %9, %10, !dbg !28
  %12 = icmp ne i32 %11, 30, !dbg !28
  br i1 %12, label %then1, label %else2, !dbg !28

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !29
  %13 = load i32, ptr %err, align 4, !dbg !29
  br label %if.end3, !dbg !29

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !29

if.end3:                                          ; preds = %else2, %then1
  %14 = load i32, ptr %c, align 4, !dbg !30
  %15 = load i32, ptr %a, align 4, !dbg !30
  %16 = load i32, ptr %b, align 4, !dbg !30
  %17 = sub i32 %15, %16, !dbg !30
  %18 = mul i32 %14, %17, !dbg !30
  %19 = icmp ne i32 %18, -10, !dbg !30
  br i1 %19, label %then4, label %else5, !dbg !30

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !31
  %20 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end6, !dbg !31

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !31

if.end6:                                          ; preds = %else5, %then4
  %21 = load i32, ptr %a, align 4, !dbg !32
  %22 = load i32, ptr %b, align 4, !dbg !32
  %23 = load i32, ptr %c, align 4, !dbg !32
  %24 = srem i32 %22, %23, !dbg !32
  %25 = sub i32 %21, %24, !dbg !32
  %26 = icmp ne i32 %25, -2, !dbg !32
  br i1 %26, label %then7, label %else8, !dbg !32

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !33
  %27 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end9, !dbg !33

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !33

if.end9:                                          ; preds = %else8, %then7
  %28 = load i32, ptr %a, align 4, !dbg !34
  %29 = load i32, ptr %b, align 4, !dbg !34
  %30 = add i32 %28, %29, !dbg !34
  %31 = load i32, ptr %c, align 4, !dbg !34
  %32 = sdiv i32 %30, %31, !dbg !34
  %33 = icmp ne i32 %32, 1, !dbg !34
  br i1 %33, label %then10, label %else11, !dbg !34

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !35
  %34 = load i32, ptr %err, align 4, !dbg !35
  br label %if.end12, !dbg !35

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !35

if.end12:                                         ; preds = %else11, %then10
  store i32 1, ptr %x, align 4, !dbg !17
  store i32 2, ptr %y, align 4, !dbg !15
  store i32 3, ptr %z, align 4, !dbg !13
  %35 = load i32, ptr %x, align 4, !dbg !11
  %36 = load i32, ptr %y, align 4, !dbg !11
  %37 = add i32 %35, %36, !dbg !11
  %38 = load i32, ptr %z, align 4, !dbg !11
  %39 = shl i32 %37, %38, !dbg !11
  store i32 %39, ptr %r, align 4, !dbg !11
  %40 = load i32, ptr %r, align 4, !dbg !36
  %41 = icmp ne i32 %40, 24, !dbg !36
  br i1 %41, label %then13, label %else14, !dbg !36

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !37
  %42 = load i32, ptr %err, align 4, !dbg !37
  br label %if.end15, !dbg !37

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !37

if.end15:                                         ; preds = %else14, %then13
  %43 = load i32, ptr %x, align 4, !dbg !9
  %44 = load i32, ptr %y, align 4, !dbg !9
  %45 = add i32 %43, %44, !dbg !9
  %46 = load i32, ptr %z, align 4, !dbg !9
  %47 = shl i32 %45, %46, !dbg !9
  store i32 %47, ptr %s, align 4, !dbg !9
  %48 = load i32, ptr %s, align 4, !dbg !38
  %49 = icmp ne i32 %48, 24, !dbg !38
  br i1 %49, label %then16, label %else17, !dbg !38

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !39
  %50 = load i32, ptr %err, align 4, !dbg !39
  br label %if.end18, !dbg !39

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !39

if.end18:                                         ; preds = %else17, %then16
  %51 = load i32, ptr %err, align 4, !dbg !40
  %52 = icmp eq i32 %51, 0, !dbg !40
  br i1 %52, label %then19, label %else20, !dbg !40

then19:                                           ; preds = %if.end18
  %53 = call i32 (ptr, ...) @printf(ptr @0), !dbg !41
  br label %if.end21, !dbg !41

else20:                                           ; preds = %if.end18
  %54 = call i32 (ptr, ...) @printf(ptr @1), !dbg !43
  br label %if.end21, !dbg !43

if.end21:                                         ; preds = %else20, %then19
  %55 = load i32, ptr %err, align 4, !dbg !45
  ret i32 %55, !dbg !45
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "27.parenthesis_change_precedence.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 5, type: !5, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "s", scope: !4, file: !3, line: 23, type: !7)
!9 = !DILocation(line: 23, column: 3, scope: !4)
!10 = !DILocalVariable(name: "r", scope: !4, file: !3, line: 20, type: !7)
!11 = !DILocation(line: 20, column: 3, scope: !4)
!12 = !DILocalVariable(name: "z", scope: !4, file: !3, line: 19, type: !7)
!13 = !DILocation(line: 19, column: 3, scope: !4)
!14 = !DILocalVariable(name: "y", scope: !4, file: !3, line: 18, type: !7)
!15 = !DILocation(line: 18, column: 3, scope: !4)
!16 = !DILocalVariable(name: "x", scope: !4, file: !3, line: 17, type: !7)
!17 = !DILocation(line: 17, column: 3, scope: !4)
!18 = !DILocalVariable(name: "c", scope: !4, file: !3, line: 9, type: !7)
!19 = !DILocation(line: 9, column: 3, scope: !4)
!20 = !DILocalVariable(name: "b", scope: !4, file: !3, line: 8, type: !7)
!21 = !DILocation(line: 8, column: 3, scope: !4)
!22 = !DILocalVariable(name: "a", scope: !4, file: !3, line: 7, type: !7)
!23 = !DILocation(line: 7, column: 3, scope: !4)
!24 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 6, type: !7)
!25 = !DILocation(line: 6, column: 3, scope: !4)
!26 = !DILocation(line: 11, column: 3, scope: !4)
!27 = !DILocation(line: 11, column: 24, scope: !4)
!28 = !DILocation(line: 12, column: 3, scope: !4)
!29 = !DILocation(line: 12, column: 26, scope: !4)
!30 = !DILocation(line: 13, column: 3, scope: !4)
!31 = !DILocation(line: 13, column: 27, scope: !4)
!32 = !DILocation(line: 14, column: 3, scope: !4)
!33 = !DILocation(line: 14, column: 24, scope: !4)
!34 = !DILocation(line: 15, column: 3, scope: !4)
!35 = !DILocation(line: 15, column: 25, scope: !4)
!36 = !DILocation(line: 21, column: 3, scope: !4)
!37 = !DILocation(line: 21, column: 16, scope: !4)
!38 = !DILocation(line: 24, column: 3, scope: !4)
!39 = !DILocation(line: 24, column: 16, scope: !4)
!40 = !DILocation(line: 26, column: 3, scope: !4)
!41 = !DILocation(line: 27, column: 5, scope: !42)
!42 = distinct !DILexicalBlock(scope: !4, file: !3, line: 26, column: 17)
!43 = !DILocation(line: 29, column: 5, scope: !44)
!44 = distinct !DILexicalBlock(scope: !4, file: !3, line: 28, column: 10)
!45 = !DILocation(line: 31, column: 3, scope: !4)
