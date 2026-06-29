; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [24 x i8] c"7.variable_list.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"7.variable_list.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %h = alloca i32, align 4
    #dbg_declare(ptr %h, !6, !DIExpression(), !7)
  %g = alloca i32, align 4
    #dbg_declare(ptr %g, !8, !DIExpression(), !7)
  %f = alloca i32, align 4
    #dbg_declare(ptr %f, !9, !DIExpression(), !10)
  %e = alloca i32, align 4
    #dbg_declare(ptr %e, !11, !DIExpression(), !12)
  %d = alloca i32, align 4
    #dbg_declare(ptr %d, !13, !DIExpression(), !12)
  %c = alloca i32, align 4
    #dbg_declare(ptr %c, !14, !DIExpression(), !15)
  %b = alloca i32, align 4
    #dbg_declare(ptr %b, !16, !DIExpression(), !15)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !17, !DIExpression(), !15)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !18, !DIExpression(), !19)
  store i32 0, ptr %err, align 4, !dbg !19
  store i32 1, ptr %b, align 4, !dbg !15
  store i32 2, ptr %c, align 4, !dbg !15
  store i32 3, ptr %d, align 4, !dbg !12
  store i32 0, ptr %a, align 4, !dbg !20
  %0 = load i32, ptr %a, align 4, !dbg !20
  store i32 4, ptr %e, align 4, !dbg !21
  %1 = load i32, ptr %e, align 4, !dbg !21
  store i32 5, ptr %f, align 4, !dbg !22
  %2 = load i32, ptr %f, align 4, !dbg !22
  store i32 6, ptr %g, align 4, !dbg !23
  %3 = load i32, ptr %g, align 4, !dbg !23
  store i32 7, ptr %h, align 4, !dbg !24
  %4 = load i32, ptr %h, align 4, !dbg !24
  %5 = load i32, ptr %a, align 4, !dbg !25
  %6 = icmp ne i32 %5, 0, !dbg !25
  br i1 %6, label %then, label %else, !dbg !25

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !26
  %7 = load i32, ptr %err, align 4, !dbg !26
  br label %if.end, !dbg !26

else:                                             ; preds = %entry
  br label %if.end, !dbg !26

if.end:                                           ; preds = %else, %then
  %8 = load i32, ptr %b, align 4, !dbg !27
  %9 = icmp ne i32 %8, 1, !dbg !27
  br i1 %9, label %then1, label %else2, !dbg !27

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !28
  %10 = load i32, ptr %err, align 4, !dbg !28
  br label %if.end3, !dbg !28

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !28

if.end3:                                          ; preds = %else2, %then1
  %11 = load i32, ptr %c, align 4, !dbg !29
  %12 = icmp ne i32 %11, 2, !dbg !29
  br i1 %12, label %then4, label %else5, !dbg !29

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !30
  %13 = load i32, ptr %err, align 4, !dbg !30
  br label %if.end6, !dbg !30

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !30

if.end6:                                          ; preds = %else5, %then4
  %14 = load i32, ptr %d, align 4, !dbg !31
  %15 = icmp ne i32 %14, 3, !dbg !31
  br i1 %15, label %then7, label %else8, !dbg !31

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !32
  %16 = load i32, ptr %err, align 4, !dbg !32
  br label %if.end9, !dbg !32

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !32

if.end9:                                          ; preds = %else8, %then7
  %17 = load i32, ptr %e, align 4, !dbg !33
  %18 = icmp ne i32 %17, 4, !dbg !33
  br i1 %18, label %then10, label %else11, !dbg !33

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !34
  %19 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end12, !dbg !34

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !34

if.end12:                                         ; preds = %else11, %then10
  %20 = load i32, ptr %f, align 4, !dbg !35
  %21 = icmp ne i32 %20, 5, !dbg !35
  br i1 %21, label %then13, label %else14, !dbg !35

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !36
  %22 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end15, !dbg !36

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !36

if.end15:                                         ; preds = %else14, %then13
  %23 = load i32, ptr %g, align 4, !dbg !37
  %24 = icmp ne i32 %23, 6, !dbg !37
  br i1 %24, label %then16, label %else17, !dbg !37

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !38
  %25 = load i32, ptr %err, align 4, !dbg !38
  br label %if.end18, !dbg !38

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !38

if.end18:                                         ; preds = %else17, %then16
  %26 = load i32, ptr %h, align 4, !dbg !39
  %27 = icmp ne i32 %26, 7, !dbg !39
  br i1 %27, label %then19, label %else20, !dbg !39

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !40
  %28 = load i32, ptr %err, align 4, !dbg !40
  br label %if.end21, !dbg !40

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !40

if.end21:                                         ; preds = %else20, %then19
  %29 = load i32, ptr %err, align 4, !dbg !41
  %30 = icmp eq i32 %29, 0, !dbg !41
  br i1 %30, label %then22, label %else23, !dbg !41

then22:                                           ; preds = %if.end21
  %31 = call i32 (ptr, ...) @printf(ptr @0), !dbg !42
  br label %if.end24, !dbg !42

else23:                                           ; preds = %if.end21
  %32 = call i32 (ptr, ...) @printf(ptr @1), !dbg !44
  br label %if.end24, !dbg !44

if.end24:                                         ; preds = %else23, %then22
  %33 = load i32, ptr %err, align 4, !dbg !46
  ret i32 %33, !dbg !46
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "7.variable_list.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "h", scope: !2, file: !1, line: 11, type: !5)
!7 = !DILocation(line: 11, column: 3, scope: !2)
!8 = !DILocalVariable(name: "g", scope: !2, file: !1, line: 11, type: !5)
!9 = !DILocalVariable(name: "f", scope: !2, file: !1, line: 7, type: !5)
!10 = !DILocation(line: 7, column: 3, scope: !2)
!11 = !DILocalVariable(name: "e", scope: !2, file: !1, line: 6, type: !5)
!12 = !DILocation(line: 6, column: 3, scope: !2)
!13 = !DILocalVariable(name: "d", scope: !2, file: !1, line: 6, type: !5)
!14 = !DILocalVariable(name: "c", scope: !2, file: !1, line: 5, type: !5)
!15 = !DILocation(line: 5, column: 3, scope: !2)
!16 = !DILocalVariable(name: "b", scope: !2, file: !1, line: 5, type: !5)
!17 = !DILocalVariable(name: "a", scope: !2, file: !1, line: 5, type: !5)
!18 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 4, type: !5)
!19 = !DILocation(line: 4, column: 3, scope: !2)
!20 = !DILocation(line: 8, column: 3, scope: !2)
!21 = !DILocation(line: 9, column: 3, scope: !2)
!22 = !DILocation(line: 10, column: 3, scope: !2)
!23 = !DILocation(line: 12, column: 3, scope: !2)
!24 = !DILocation(line: 13, column: 3, scope: !2)
!25 = !DILocation(line: 15, column: 3, scope: !2)
!26 = !DILocation(line: 15, column: 15, scope: !2)
!27 = !DILocation(line: 16, column: 3, scope: !2)
!28 = !DILocation(line: 16, column: 15, scope: !2)
!29 = !DILocation(line: 17, column: 3, scope: !2)
!30 = !DILocation(line: 17, column: 15, scope: !2)
!31 = !DILocation(line: 18, column: 3, scope: !2)
!32 = !DILocation(line: 18, column: 15, scope: !2)
!33 = !DILocation(line: 19, column: 3, scope: !2)
!34 = !DILocation(line: 19, column: 15, scope: !2)
!35 = !DILocation(line: 20, column: 3, scope: !2)
!36 = !DILocation(line: 20, column: 15, scope: !2)
!37 = !DILocation(line: 21, column: 3, scope: !2)
!38 = !DILocation(line: 21, column: 15, scope: !2)
!39 = !DILocation(line: 22, column: 3, scope: !2)
!40 = !DILocation(line: 22, column: 15, scope: !2)
!41 = !DILocation(line: 24, column: 3, scope: !2)
!42 = !DILocation(line: 25, column: 5, scope: !43)
!43 = distinct !DILexicalBlock(scope: !2, file: !1, line: 24, column: 17)
!44 = !DILocation(line: 27, column: 5, scope: !45)
!45 = distinct !DILexicalBlock(scope: !2, file: !1, line: 26, column: 10)
!46 = !DILocation(line: 29, column: 3, scope: !2)
