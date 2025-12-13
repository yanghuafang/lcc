; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [26 x i8] c"13.double_inc_sub.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [26 x i8] c"13.double_inc_sub.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %e = alloca i32, align 4
    #dbg_declare(ptr %e, !8, !DIExpression(), !9)
  %d = alloca i32, align 4
    #dbg_declare(ptr %d, !10, !DIExpression(), !11)
  %c = alloca i32, align 4
    #dbg_declare(ptr %c, !12, !DIExpression(), !13)
  %b = alloca i32, align 4
    #dbg_declare(ptr %b, !14, !DIExpression(), !15)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !16, !DIExpression(), !17)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !18, !DIExpression(), !19)
  store i32 0, ptr %err, align 4, !dbg !19
  store i32 13, ptr %a, align 4, !dbg !17
  %0 = load i32, ptr %a, align 4, !dbg !15
  %1 = add i32 %0, 1, !dbg !15
  store i32 %1, ptr %a, align 4, !dbg !15
  store i32 %0, ptr %b, align 4, !dbg !15
  %2 = load i32, ptr %a, align 4, !dbg !20
  %3 = icmp ne i32 %2, 14, !dbg !20
  br i1 %3, label %then, label %else, !dbg !20

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !21
  %4 = load i32, ptr %err, align 4, !dbg !21
  br label %if.end, !dbg !21

else:                                             ; preds = %entry
  br label %if.end, !dbg !21

if.end:                                           ; preds = %else, %then
  %5 = load i32, ptr %b, align 4, !dbg !22
  %6 = icmp ne i32 %5, 13, !dbg !22
  br i1 %6, label %then1, label %else2, !dbg !22

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !23
  %7 = load i32, ptr %err, align 4, !dbg !23
  br label %if.end3, !dbg !23

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !23

if.end3:                                          ; preds = %else2, %then1
  store i32 13, ptr %a, align 4, !dbg !24
  %8 = load i32, ptr %a, align 4, !dbg !24
  %9 = load i32, ptr %a, align 4, !dbg !13
  %10 = add i32 %9, 1, !dbg !13
  store i32 %10, ptr %a, align 4, !dbg !13
  %11 = load i32, ptr %a, align 4, !dbg !13
  store i32 %11, ptr %c, align 4, !dbg !13
  %12 = load i32, ptr %a, align 4, !dbg !25
  %13 = icmp ne i32 %12, 14, !dbg !25
  br i1 %13, label %then4, label %else5, !dbg !25

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !26
  %14 = load i32, ptr %err, align 4, !dbg !26
  br label %if.end6, !dbg !26

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !26

if.end6:                                          ; preds = %else5, %then4
  %15 = load i32, ptr %c, align 4, !dbg !27
  %16 = icmp ne i32 %15, 14, !dbg !27
  br i1 %16, label %then7, label %else8, !dbg !27

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !28
  %17 = load i32, ptr %err, align 4, !dbg !28
  br label %if.end9, !dbg !28

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !28

if.end9:                                          ; preds = %else8, %then7
  store i32 13, ptr %a, align 4, !dbg !29
  %18 = load i32, ptr %a, align 4, !dbg !29
  %19 = load i32, ptr %a, align 4, !dbg !11
  %20 = sub i32 %19, 1, !dbg !11
  store i32 %20, ptr %a, align 4, !dbg !11
  store i32 %19, ptr %d, align 4, !dbg !11
  %21 = load i32, ptr %a, align 4, !dbg !30
  %22 = icmp ne i32 %21, 12, !dbg !30
  br i1 %22, label %then10, label %else11, !dbg !30

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !31
  %23 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end12, !dbg !31

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !31

if.end12:                                         ; preds = %else11, %then10
  %24 = load i32, ptr %d, align 4, !dbg !32
  %25 = icmp ne i32 %24, 13, !dbg !32
  br i1 %25, label %then13, label %else14, !dbg !32

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !33
  %26 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end15, !dbg !33

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !33

if.end15:                                         ; preds = %else14, %then13
  store i32 13, ptr %a, align 4, !dbg !34
  %27 = load i32, ptr %a, align 4, !dbg !34
  %28 = load i32, ptr %a, align 4, !dbg !9
  %29 = sub i32 %28, 1, !dbg !9
  store i32 %29, ptr %a, align 4, !dbg !9
  %30 = load i32, ptr %a, align 4, !dbg !9
  store i32 %30, ptr %e, align 4, !dbg !9
  %31 = load i32, ptr %a, align 4, !dbg !35
  %32 = icmp ne i32 %31, 12, !dbg !35
  br i1 %32, label %then16, label %else17, !dbg !35

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !36
  %33 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end18, !dbg !36

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !36

if.end18:                                         ; preds = %else17, %then16
  %34 = load i32, ptr %e, align 4, !dbg !37
  %35 = icmp ne i32 %34, 12, !dbg !37
  br i1 %35, label %then19, label %else20, !dbg !37

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !38
  %36 = load i32, ptr %err, align 4, !dbg !38
  br label %if.end21, !dbg !38

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !38

if.end21:                                         ; preds = %else20, %then19
  store i32 0, ptr %a, align 4, !dbg !39
  %37 = load i32, ptr %a, align 4, !dbg !39
  %38 = load i32, ptr %a, align 4, !dbg !40
  %39 = add i32 %38, 1, !dbg !40
  store i32 %39, ptr %a, align 4, !dbg !40
  %40 = load i32, ptr %a, align 4, !dbg !41
  %41 = icmp ne i32 %40, 1, !dbg !41
  br i1 %41, label %then22, label %else23, !dbg !41

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !42
  %42 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end24, !dbg !42

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !42

if.end24:                                         ; preds = %else23, %then22
  %43 = load i32, ptr %a, align 4, !dbg !43
  %44 = sub i32 %43, 1, !dbg !43
  store i32 %44, ptr %a, align 4, !dbg !43
  %45 = load i32, ptr %a, align 4, !dbg !44
  %46 = icmp ne i32 %45, 0, !dbg !44
  br i1 %46, label %then25, label %else26, !dbg !44

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !45
  %47 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end27, !dbg !45

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !45

if.end27:                                         ; preds = %else26, %then25
  %48 = load i32, ptr %err, align 4, !dbg !46
  %49 = icmp eq i32 %48, 0, !dbg !46
  br i1 %49, label %then28, label %else29, !dbg !46

then28:                                           ; preds = %if.end27
  %50 = call i32 (ptr, ...) @printf(ptr @0), !dbg !47
  br label %if.end30, !dbg !47

else29:                                           ; preds = %if.end27
  %51 = call i32 (ptr, ...) @printf(ptr @1), !dbg !49
  br label %if.end30, !dbg !49

if.end30:                                         ; preds = %else29, %then28
  %52 = load i32, ptr %err, align 4, !dbg !51
  ret i32 %52, !dbg !51
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "13.double_inc_sub.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "e", scope: !4, file: !3, line: 25, type: !7)
!9 = !DILocation(line: 25, column: 3, scope: !4)
!10 = !DILocalVariable(name: "d", scope: !4, file: !3, line: 20, type: !7)
!11 = !DILocation(line: 20, column: 3, scope: !4)
!12 = !DILocalVariable(name: "c", scope: !4, file: !3, line: 15, type: !7)
!13 = !DILocation(line: 15, column: 3, scope: !4)
!14 = !DILocalVariable(name: "b", scope: !4, file: !3, line: 10, type: !7)
!15 = !DILocation(line: 10, column: 3, scope: !4)
!16 = !DILocalVariable(name: "a", scope: !4, file: !3, line: 8, type: !7)
!17 = !DILocation(line: 8, column: 3, scope: !4)
!18 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 7, type: !7)
!19 = !DILocation(line: 7, column: 3, scope: !4)
!20 = !DILocation(line: 11, column: 3, scope: !4)
!21 = !DILocation(line: 11, column: 16, scope: !4)
!22 = !DILocation(line: 12, column: 3, scope: !4)
!23 = !DILocation(line: 12, column: 16, scope: !4)
!24 = !DILocation(line: 14, column: 3, scope: !4)
!25 = !DILocation(line: 16, column: 3, scope: !4)
!26 = !DILocation(line: 16, column: 16, scope: !4)
!27 = !DILocation(line: 17, column: 3, scope: !4)
!28 = !DILocation(line: 17, column: 16, scope: !4)
!29 = !DILocation(line: 19, column: 3, scope: !4)
!30 = !DILocation(line: 21, column: 3, scope: !4)
!31 = !DILocation(line: 21, column: 16, scope: !4)
!32 = !DILocation(line: 22, column: 3, scope: !4)
!33 = !DILocation(line: 22, column: 16, scope: !4)
!34 = !DILocation(line: 24, column: 3, scope: !4)
!35 = !DILocation(line: 26, column: 3, scope: !4)
!36 = !DILocation(line: 26, column: 16, scope: !4)
!37 = !DILocation(line: 27, column: 3, scope: !4)
!38 = !DILocation(line: 27, column: 16, scope: !4)
!39 = !DILocation(line: 29, column: 3, scope: !4)
!40 = !DILocation(line: 30, column: 3, scope: !4)
!41 = !DILocation(line: 31, column: 3, scope: !4)
!42 = !DILocation(line: 31, column: 15, scope: !4)
!43 = !DILocation(line: 32, column: 3, scope: !4)
!44 = !DILocation(line: 33, column: 3, scope: !4)
!45 = !DILocation(line: 33, column: 15, scope: !4)
!46 = !DILocation(line: 35, column: 3, scope: !4)
!47 = !DILocation(line: 36, column: 5, scope: !48)
!48 = distinct !DILexicalBlock(scope: !4, file: !3, line: 35, column: 17)
!49 = !DILocation(line: 38, column: 5, scope: !50)
!50 = distinct !DILexicalBlock(scope: !4, file: !3, line: 37, column: 10)
!51 = !DILocation(line: 40, column: 3, scope: !4)
