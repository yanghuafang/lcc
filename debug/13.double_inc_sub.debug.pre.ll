; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [26 x i8] c"13.double_inc_sub.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [26 x i8] c"13.double_inc_sub.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %e = alloca i32, align 4
    #dbg_declare(ptr %e, !6, !DIExpression(), !7)
  %d = alloca i32, align 4
    #dbg_declare(ptr %d, !8, !DIExpression(), !9)
  %c = alloca i32, align 4
    #dbg_declare(ptr %c, !10, !DIExpression(), !11)
  %b = alloca i32, align 4
    #dbg_declare(ptr %b, !12, !DIExpression(), !13)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !14, !DIExpression(), !15)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !16, !DIExpression(), !17)
  store i32 0, ptr %err, align 4, !dbg !17
  store i32 13, ptr %a, align 4, !dbg !15
  %0 = load i32, ptr %a, align 4, !dbg !13
  %1 = add i32 %0, 1, !dbg !13
  store i32 %1, ptr %a, align 4, !dbg !13
  store i32 %0, ptr %b, align 4, !dbg !13
  %2 = load i32, ptr %a, align 4, !dbg !18
  %3 = icmp ne i32 %2, 14, !dbg !18
  br i1 %3, label %then, label %else, !dbg !18

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !19
  %4 = load i32, ptr %err, align 4, !dbg !19
  br label %if.end, !dbg !19

else:                                             ; preds = %entry
  br label %if.end, !dbg !19

if.end:                                           ; preds = %else, %then
  %5 = load i32, ptr %b, align 4, !dbg !20
  %6 = icmp ne i32 %5, 13, !dbg !20
  br i1 %6, label %then1, label %else2, !dbg !20

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !21
  %7 = load i32, ptr %err, align 4, !dbg !21
  br label %if.end3, !dbg !21

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !21

if.end3:                                          ; preds = %else2, %then1
  store i32 13, ptr %a, align 4, !dbg !22
  %8 = load i32, ptr %a, align 4, !dbg !22
  %9 = load i32, ptr %a, align 4, !dbg !11
  %10 = add i32 %9, 1, !dbg !11
  store i32 %10, ptr %a, align 4, !dbg !11
  %11 = load i32, ptr %a, align 4, !dbg !11
  store i32 %11, ptr %c, align 4, !dbg !11
  %12 = load i32, ptr %a, align 4, !dbg !23
  %13 = icmp ne i32 %12, 14, !dbg !23
  br i1 %13, label %then4, label %else5, !dbg !23

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !24
  %14 = load i32, ptr %err, align 4, !dbg !24
  br label %if.end6, !dbg !24

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !24

if.end6:                                          ; preds = %else5, %then4
  %15 = load i32, ptr %c, align 4, !dbg !25
  %16 = icmp ne i32 %15, 14, !dbg !25
  br i1 %16, label %then7, label %else8, !dbg !25

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !26
  %17 = load i32, ptr %err, align 4, !dbg !26
  br label %if.end9, !dbg !26

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !26

if.end9:                                          ; preds = %else8, %then7
  store i32 13, ptr %a, align 4, !dbg !27
  %18 = load i32, ptr %a, align 4, !dbg !27
  %19 = load i32, ptr %a, align 4, !dbg !9
  %20 = sub i32 %19, 1, !dbg !9
  store i32 %20, ptr %a, align 4, !dbg !9
  store i32 %19, ptr %d, align 4, !dbg !9
  %21 = load i32, ptr %a, align 4, !dbg !28
  %22 = icmp ne i32 %21, 12, !dbg !28
  br i1 %22, label %then10, label %else11, !dbg !28

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !29
  %23 = load i32, ptr %err, align 4, !dbg !29
  br label %if.end12, !dbg !29

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !29

if.end12:                                         ; preds = %else11, %then10
  %24 = load i32, ptr %d, align 4, !dbg !30
  %25 = icmp ne i32 %24, 13, !dbg !30
  br i1 %25, label %then13, label %else14, !dbg !30

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !31
  %26 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end15, !dbg !31

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !31

if.end15:                                         ; preds = %else14, %then13
  store i32 13, ptr %a, align 4, !dbg !32
  %27 = load i32, ptr %a, align 4, !dbg !32
  %28 = load i32, ptr %a, align 4, !dbg !7
  %29 = sub i32 %28, 1, !dbg !7
  store i32 %29, ptr %a, align 4, !dbg !7
  %30 = load i32, ptr %a, align 4, !dbg !7
  store i32 %30, ptr %e, align 4, !dbg !7
  %31 = load i32, ptr %a, align 4, !dbg !33
  %32 = icmp ne i32 %31, 12, !dbg !33
  br i1 %32, label %then16, label %else17, !dbg !33

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !34
  %33 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end18, !dbg !34

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !34

if.end18:                                         ; preds = %else17, %then16
  %34 = load i32, ptr %e, align 4, !dbg !35
  %35 = icmp ne i32 %34, 12, !dbg !35
  br i1 %35, label %then19, label %else20, !dbg !35

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !36
  %36 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end21, !dbg !36

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !36

if.end21:                                         ; preds = %else20, %then19
  store i32 0, ptr %a, align 4, !dbg !37
  %37 = load i32, ptr %a, align 4, !dbg !37
  %38 = load i32, ptr %a, align 4, !dbg !38
  %39 = add i32 %38, 1, !dbg !38
  store i32 %39, ptr %a, align 4, !dbg !38
  %40 = load i32, ptr %a, align 4, !dbg !39
  %41 = icmp ne i32 %40, 1, !dbg !39
  br i1 %41, label %then22, label %else23, !dbg !39

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !40
  %42 = load i32, ptr %err, align 4, !dbg !40
  br label %if.end24, !dbg !40

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !40

if.end24:                                         ; preds = %else23, %then22
  %43 = load i32, ptr %a, align 4, !dbg !41
  %44 = sub i32 %43, 1, !dbg !41
  store i32 %44, ptr %a, align 4, !dbg !41
  %45 = load i32, ptr %a, align 4, !dbg !42
  %46 = icmp ne i32 %45, 0, !dbg !42
  br i1 %46, label %then25, label %else26, !dbg !42

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !43
  %47 = load i32, ptr %err, align 4, !dbg !43
  br label %if.end27, !dbg !43

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !43

if.end27:                                         ; preds = %else26, %then25
  %48 = load i32, ptr %err, align 4, !dbg !44
  %49 = icmp eq i32 %48, 0, !dbg !44
  br i1 %49, label %then28, label %else29, !dbg !44

then28:                                           ; preds = %if.end27
  %50 = call i32 (ptr, ...) @printf(ptr @0), !dbg !45
  br label %if.end30, !dbg !45

else29:                                           ; preds = %if.end27
  %51 = call i32 (ptr, ...) @printf(ptr @1), !dbg !47
  br label %if.end30, !dbg !47

if.end30:                                         ; preds = %else29, %then28
  %52 = load i32, ptr %err, align 4, !dbg !49
  ret i32 %52, !dbg !49
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "13.double_inc_sub.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "e", scope: !2, file: !1, line: 22, type: !5)
!7 = !DILocation(line: 22, column: 3, scope: !2)
!8 = !DILocalVariable(name: "d", scope: !2, file: !1, line: 17, type: !5)
!9 = !DILocation(line: 17, column: 3, scope: !2)
!10 = !DILocalVariable(name: "c", scope: !2, file: !1, line: 12, type: !5)
!11 = !DILocation(line: 12, column: 3, scope: !2)
!12 = !DILocalVariable(name: "b", scope: !2, file: !1, line: 7, type: !5)
!13 = !DILocation(line: 7, column: 3, scope: !2)
!14 = !DILocalVariable(name: "a", scope: !2, file: !1, line: 5, type: !5)
!15 = !DILocation(line: 5, column: 3, scope: !2)
!16 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 4, type: !5)
!17 = !DILocation(line: 4, column: 3, scope: !2)
!18 = !DILocation(line: 8, column: 3, scope: !2)
!19 = !DILocation(line: 8, column: 16, scope: !2)
!20 = !DILocation(line: 9, column: 3, scope: !2)
!21 = !DILocation(line: 9, column: 16, scope: !2)
!22 = !DILocation(line: 11, column: 3, scope: !2)
!23 = !DILocation(line: 13, column: 3, scope: !2)
!24 = !DILocation(line: 13, column: 16, scope: !2)
!25 = !DILocation(line: 14, column: 3, scope: !2)
!26 = !DILocation(line: 14, column: 16, scope: !2)
!27 = !DILocation(line: 16, column: 3, scope: !2)
!28 = !DILocation(line: 18, column: 3, scope: !2)
!29 = !DILocation(line: 18, column: 16, scope: !2)
!30 = !DILocation(line: 19, column: 3, scope: !2)
!31 = !DILocation(line: 19, column: 16, scope: !2)
!32 = !DILocation(line: 21, column: 3, scope: !2)
!33 = !DILocation(line: 23, column: 3, scope: !2)
!34 = !DILocation(line: 23, column: 16, scope: !2)
!35 = !DILocation(line: 24, column: 3, scope: !2)
!36 = !DILocation(line: 24, column: 16, scope: !2)
!37 = !DILocation(line: 26, column: 3, scope: !2)
!38 = !DILocation(line: 27, column: 3, scope: !2)
!39 = !DILocation(line: 28, column: 3, scope: !2)
!40 = !DILocation(line: 28, column: 15, scope: !2)
!41 = !DILocation(line: 29, column: 3, scope: !2)
!42 = !DILocation(line: 30, column: 3, scope: !2)
!43 = !DILocation(line: 30, column: 15, scope: !2)
!44 = !DILocation(line: 32, column: 3, scope: !2)
!45 = !DILocation(line: 33, column: 5, scope: !46)
!46 = distinct !DILexicalBlock(scope: !2, file: !1, line: 32, column: 17)
!47 = !DILocation(line: 35, column: 5, scope: !48)
!48 = distinct !DILexicalBlock(scope: !2, file: !1, line: 34, column: 10)
!49 = !DILocation(line: 37, column: 3, scope: !2)
