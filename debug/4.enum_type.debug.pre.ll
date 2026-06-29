; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [20 x i8] c"4.enum_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"4.enum_type.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %v = alloca i32, align 4
    #dbg_declare(ptr %v, !6, !DIExpression(), !7)
  %sex = alloca i32, align 4
    #dbg_declare(ptr %sex, !8, !DIExpression(), !9)
  %day = alloca i32, align 4
    #dbg_declare(ptr %day, !10, !DIExpression(), !11)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !12, !DIExpression(), !13)
  store i32 0, ptr %err, align 4, !dbg !13
  store i32 5, ptr %day, align 4, !dbg !11
  store i32 1, ptr %sex, align 4, !dbg !9
  store i32 0, ptr %v, align 4, !dbg !14
  %0 = load i32, ptr %v, align 4, !dbg !14
  %1 = load i32, ptr %v, align 4, !dbg !15
  %2 = icmp ne i32 %1, 0, !dbg !15
  br i1 %2, label %then, label %else, !dbg !15

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !16
  %3 = load i32, ptr %err, align 4, !dbg !16
  br label %if.end, !dbg !16

else:                                             ; preds = %entry
  br label %if.end, !dbg !16

if.end:                                           ; preds = %else, %then
  store i32 1, ptr %v, align 4, !dbg !17
  %4 = load i32, ptr %v, align 4, !dbg !17
  %5 = load i32, ptr %v, align 4, !dbg !18
  %6 = icmp ne i32 %5, 1, !dbg !18
  br i1 %6, label %then1, label %else2, !dbg !18

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !19
  %7 = load i32, ptr %err, align 4, !dbg !19
  br label %if.end3, !dbg !19

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !19

if.end3:                                          ; preds = %else2, %then1
  store i32 5, ptr %v, align 4, !dbg !20
  %8 = load i32, ptr %v, align 4, !dbg !20
  %9 = load i32, ptr %v, align 4, !dbg !21
  %10 = icmp ne i32 %9, 5, !dbg !21
  br i1 %10, label %then4, label %else5, !dbg !21

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !22
  %11 = load i32, ptr %err, align 4, !dbg !22
  br label %if.end6, !dbg !22

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !22

if.end6:                                          ; preds = %else5, %then4
  store i32 6, ptr %v, align 4, !dbg !23
  %12 = load i32, ptr %v, align 4, !dbg !23
  %13 = load i32, ptr %v, align 4, !dbg !24
  %14 = icmp ne i32 %13, 6, !dbg !24
  br i1 %14, label %then7, label %else8, !dbg !24

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !25
  %15 = load i32, ptr %err, align 4, !dbg !25
  br label %if.end9, !dbg !25

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !25

if.end9:                                          ; preds = %else8, %then7
  %16 = load i32, ptr %day, align 4, !dbg !26
  store i32 %16, ptr %v, align 4, !dbg !26
  %17 = load i32, ptr %v, align 4, !dbg !26
  %18 = load i32, ptr %v, align 4, !dbg !27
  %19 = icmp ne i32 %18, 5, !dbg !27
  br i1 %19, label %then10, label %else11, !dbg !27

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !28
  %20 = load i32, ptr %err, align 4, !dbg !28
  br label %if.end12, !dbg !28

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !28

if.end12:                                         ; preds = %else11, %then10
  store i32 0, ptr %v, align 4, !dbg !29
  %21 = load i32, ptr %v, align 4, !dbg !29
  %22 = load i32, ptr %v, align 4, !dbg !30
  %23 = icmp ne i32 %22, 0, !dbg !30
  br i1 %23, label %then13, label %else14, !dbg !30

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !31
  %24 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end15, !dbg !31

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !31

if.end15:                                         ; preds = %else14, %then13
  store i32 1, ptr %v, align 4, !dbg !32
  %25 = load i32, ptr %v, align 4, !dbg !32
  %26 = load i32, ptr %v, align 4, !dbg !33
  %27 = icmp ne i32 %26, 1, !dbg !33
  br i1 %27, label %then16, label %else17, !dbg !33

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !34
  %28 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end18, !dbg !34

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !34

if.end18:                                         ; preds = %else17, %then16
  %29 = load i32, ptr %sex, align 4, !dbg !35
  store i32 %29, ptr %v, align 4, !dbg !35
  %30 = load i32, ptr %v, align 4, !dbg !35
  %31 = load i32, ptr %v, align 4, !dbg !36
  %32 = icmp ne i32 %31, 1, !dbg !36
  br i1 %32, label %then19, label %else20, !dbg !36

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !37
  %33 = load i32, ptr %err, align 4, !dbg !37
  br label %if.end21, !dbg !37

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !37

if.end21:                                         ; preds = %else20, %then19
  %34 = load i32, ptr %err, align 4, !dbg !38
  %35 = icmp eq i32 %34, 0, !dbg !38
  br i1 %35, label %then22, label %else23, !dbg !38

then22:                                           ; preds = %if.end21
  %36 = call i32 (ptr, ...) @printf(ptr @0), !dbg !39
  br label %if.end24, !dbg !39

else23:                                           ; preds = %if.end21
  %37 = call i32 (ptr, ...) @printf(ptr @1), !dbg !41
  br label %if.end24, !dbg !41

if.end24:                                         ; preds = %else23, %then22
  %38 = load i32, ptr %err, align 4, !dbg !43
  ret i32 %38, !dbg !43
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "4.enum_type.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 15, type: !3, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "v", scope: !2, file: !1, line: 19, type: !5)
!7 = !DILocation(line: 19, column: 3, scope: !2)
!8 = !DILocalVariable(name: "sex", scope: !2, file: !1, line: 18, type: !5)
!9 = !DILocation(line: 18, column: 3, scope: !2)
!10 = !DILocalVariable(name: "day", scope: !2, file: !1, line: 17, type: !5)
!11 = !DILocation(line: 17, column: 3, scope: !2)
!12 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 16, type: !5)
!13 = !DILocation(line: 16, column: 3, scope: !2)
!14 = !DILocation(line: 21, column: 3, scope: !2)
!15 = !DILocation(line: 22, column: 3, scope: !2)
!16 = !DILocation(line: 22, column: 15, scope: !2)
!17 = !DILocation(line: 23, column: 3, scope: !2)
!18 = !DILocation(line: 24, column: 3, scope: !2)
!19 = !DILocation(line: 24, column: 15, scope: !2)
!20 = !DILocation(line: 25, column: 3, scope: !2)
!21 = !DILocation(line: 26, column: 3, scope: !2)
!22 = !DILocation(line: 26, column: 15, scope: !2)
!23 = !DILocation(line: 27, column: 3, scope: !2)
!24 = !DILocation(line: 28, column: 3, scope: !2)
!25 = !DILocation(line: 28, column: 15, scope: !2)
!26 = !DILocation(line: 29, column: 3, scope: !2)
!27 = !DILocation(line: 30, column: 3, scope: !2)
!28 = !DILocation(line: 30, column: 15, scope: !2)
!29 = !DILocation(line: 31, column: 3, scope: !2)
!30 = !DILocation(line: 32, column: 3, scope: !2)
!31 = !DILocation(line: 32, column: 15, scope: !2)
!32 = !DILocation(line: 33, column: 3, scope: !2)
!33 = !DILocation(line: 34, column: 3, scope: !2)
!34 = !DILocation(line: 34, column: 15, scope: !2)
!35 = !DILocation(line: 35, column: 3, scope: !2)
!36 = !DILocation(line: 36, column: 3, scope: !2)
!37 = !DILocation(line: 36, column: 15, scope: !2)
!38 = !DILocation(line: 38, column: 3, scope: !2)
!39 = !DILocation(line: 39, column: 5, scope: !40)
!40 = distinct !DILexicalBlock(scope: !2, file: !1, line: 38, column: 17)
!41 = !DILocation(line: 41, column: 5, scope: !42)
!42 = distinct !DILexicalBlock(scope: !2, file: !1, line: 40, column: 10)
!43 = !DILocation(line: 43, column: 3, scope: !2)
