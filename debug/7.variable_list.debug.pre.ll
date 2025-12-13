; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [24 x i8] c"7.variable_list.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"7.variable_list.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %h = alloca i32, align 4
    #dbg_declare(ptr %h, !8, !DIExpression(), !9)
  %g = alloca i32, align 4
    #dbg_declare(ptr %g, !10, !DIExpression(), !9)
  %f = alloca i32, align 4
    #dbg_declare(ptr %f, !11, !DIExpression(), !12)
  %e = alloca i32, align 4
    #dbg_declare(ptr %e, !13, !DIExpression(), !14)
  %d = alloca i32, align 4
    #dbg_declare(ptr %d, !15, !DIExpression(), !14)
  %c = alloca i32, align 4
    #dbg_declare(ptr %c, !16, !DIExpression(), !17)
  %b = alloca i32, align 4
    #dbg_declare(ptr %b, !18, !DIExpression(), !17)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !19, !DIExpression(), !17)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !20, !DIExpression(), !21)
  store i32 0, ptr %err, align 4, !dbg !21
  store i32 1, ptr %b, align 4, !dbg !17
  store i32 2, ptr %c, align 4, !dbg !17
  store i32 3, ptr %d, align 4, !dbg !14
  store i32 0, ptr %a, align 4, !dbg !22
  %0 = load i32, ptr %a, align 4, !dbg !22
  store i32 4, ptr %e, align 4, !dbg !23
  %1 = load i32, ptr %e, align 4, !dbg !23
  store i32 5, ptr %f, align 4, !dbg !24
  %2 = load i32, ptr %f, align 4, !dbg !24
  store i32 6, ptr %g, align 4, !dbg !25
  %3 = load i32, ptr %g, align 4, !dbg !25
  store i32 7, ptr %h, align 4, !dbg !26
  %4 = load i32, ptr %h, align 4, !dbg !26
  %5 = load i32, ptr %a, align 4, !dbg !27
  %6 = icmp ne i32 %5, 0, !dbg !27
  br i1 %6, label %then, label %else, !dbg !27

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !28
  %7 = load i32, ptr %err, align 4, !dbg !28
  br label %if.end, !dbg !28

else:                                             ; preds = %entry
  br label %if.end, !dbg !28

if.end:                                           ; preds = %else, %then
  %8 = load i32, ptr %b, align 4, !dbg !29
  %9 = icmp ne i32 %8, 1, !dbg !29
  br i1 %9, label %then1, label %else2, !dbg !29

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !30
  %10 = load i32, ptr %err, align 4, !dbg !30
  br label %if.end3, !dbg !30

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !30

if.end3:                                          ; preds = %else2, %then1
  %11 = load i32, ptr %c, align 4, !dbg !31
  %12 = icmp ne i32 %11, 2, !dbg !31
  br i1 %12, label %then4, label %else5, !dbg !31

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !32
  %13 = load i32, ptr %err, align 4, !dbg !32
  br label %if.end6, !dbg !32

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !32

if.end6:                                          ; preds = %else5, %then4
  %14 = load i32, ptr %d, align 4, !dbg !33
  %15 = icmp ne i32 %14, 3, !dbg !33
  br i1 %15, label %then7, label %else8, !dbg !33

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !34
  %16 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end9, !dbg !34

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !34

if.end9:                                          ; preds = %else8, %then7
  %17 = load i32, ptr %e, align 4, !dbg !35
  %18 = icmp ne i32 %17, 4, !dbg !35
  br i1 %18, label %then10, label %else11, !dbg !35

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !36
  %19 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end12, !dbg !36

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !36

if.end12:                                         ; preds = %else11, %then10
  %20 = load i32, ptr %f, align 4, !dbg !37
  %21 = icmp ne i32 %20, 5, !dbg !37
  br i1 %21, label %then13, label %else14, !dbg !37

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !38
  %22 = load i32, ptr %err, align 4, !dbg !38
  br label %if.end15, !dbg !38

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !38

if.end15:                                         ; preds = %else14, %then13
  %23 = load i32, ptr %g, align 4, !dbg !39
  %24 = icmp ne i32 %23, 6, !dbg !39
  br i1 %24, label %then16, label %else17, !dbg !39

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !40
  %25 = load i32, ptr %err, align 4, !dbg !40
  br label %if.end18, !dbg !40

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !40

if.end18:                                         ; preds = %else17, %then16
  %26 = load i32, ptr %h, align 4, !dbg !41
  %27 = icmp ne i32 %26, 7, !dbg !41
  br i1 %27, label %then19, label %else20, !dbg !41

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !42
  %28 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end21, !dbg !42

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !42

if.end21:                                         ; preds = %else20, %then19
  %29 = load i32, ptr %err, align 4, !dbg !43
  %30 = icmp eq i32 %29, 0, !dbg !43
  br i1 %30, label %then22, label %else23, !dbg !43

then22:                                           ; preds = %if.end21
  %31 = call i32 (ptr, ...) @printf(ptr @0), !dbg !44
  br label %if.end24, !dbg !44

else23:                                           ; preds = %if.end21
  %32 = call i32 (ptr, ...) @printf(ptr @1), !dbg !46
  br label %if.end24, !dbg !46

if.end24:                                         ; preds = %else23, %then22
  %33 = load i32, ptr %err, align 4, !dbg !48
  ret i32 %33, !dbg !48
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "7.variable_list.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "h", scope: !4, file: !3, line: 14, type: !7)
!9 = !DILocation(line: 14, column: 3, scope: !4)
!10 = !DILocalVariable(name: "g", scope: !4, file: !3, line: 14, type: !7)
!11 = !DILocalVariable(name: "f", scope: !4, file: !3, line: 10, type: !7)
!12 = !DILocation(line: 10, column: 3, scope: !4)
!13 = !DILocalVariable(name: "e", scope: !4, file: !3, line: 9, type: !7)
!14 = !DILocation(line: 9, column: 3, scope: !4)
!15 = !DILocalVariable(name: "d", scope: !4, file: !3, line: 9, type: !7)
!16 = !DILocalVariable(name: "c", scope: !4, file: !3, line: 8, type: !7)
!17 = !DILocation(line: 8, column: 3, scope: !4)
!18 = !DILocalVariable(name: "b", scope: !4, file: !3, line: 8, type: !7)
!19 = !DILocalVariable(name: "a", scope: !4, file: !3, line: 8, type: !7)
!20 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 7, type: !7)
!21 = !DILocation(line: 7, column: 3, scope: !4)
!22 = !DILocation(line: 11, column: 3, scope: !4)
!23 = !DILocation(line: 12, column: 3, scope: !4)
!24 = !DILocation(line: 13, column: 3, scope: !4)
!25 = !DILocation(line: 15, column: 3, scope: !4)
!26 = !DILocation(line: 16, column: 3, scope: !4)
!27 = !DILocation(line: 18, column: 3, scope: !4)
!28 = !DILocation(line: 18, column: 15, scope: !4)
!29 = !DILocation(line: 19, column: 3, scope: !4)
!30 = !DILocation(line: 19, column: 15, scope: !4)
!31 = !DILocation(line: 20, column: 3, scope: !4)
!32 = !DILocation(line: 20, column: 15, scope: !4)
!33 = !DILocation(line: 21, column: 3, scope: !4)
!34 = !DILocation(line: 21, column: 15, scope: !4)
!35 = !DILocation(line: 22, column: 3, scope: !4)
!36 = !DILocation(line: 22, column: 15, scope: !4)
!37 = !DILocation(line: 23, column: 3, scope: !4)
!38 = !DILocation(line: 23, column: 15, scope: !4)
!39 = !DILocation(line: 24, column: 3, scope: !4)
!40 = !DILocation(line: 24, column: 15, scope: !4)
!41 = !DILocation(line: 25, column: 3, scope: !4)
!42 = !DILocation(line: 25, column: 15, scope: !4)
!43 = !DILocation(line: 27, column: 3, scope: !4)
!44 = !DILocation(line: 28, column: 5, scope: !45)
!45 = distinct !DILexicalBlock(scope: !4, file: !3, line: 27, column: 17)
!46 = !DILocation(line: 30, column: 5, scope: !47)
!47 = distinct !DILexicalBlock(scope: !4, file: !3, line: 29, column: 10)
!48 = !DILocation(line: 32, column: 3, scope: !4)
