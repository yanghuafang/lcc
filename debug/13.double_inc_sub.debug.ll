; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [26 x i8] c"13.double_inc_sub.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [26 x i8] c"13.double_inc_sub.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %e = alloca i32, align 4
    #dbg_declare(ptr %e, !9, !DIExpression(), !10)
  %d = alloca i32, align 4
    #dbg_declare(ptr %d, !11, !DIExpression(), !12)
  %c = alloca i32, align 4
    #dbg_declare(ptr %c, !13, !DIExpression(), !14)
  %b = alloca i32, align 4
    #dbg_declare(ptr %b, !15, !DIExpression(), !16)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !17, !DIExpression(), !18)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !19, !DIExpression(), !20)
  store i32 0, ptr %err, align 4, !dbg !20
  store i32 13, ptr %a, align 4, !dbg !18
  %0 = load i32, ptr %a, align 4, !dbg !16
  %1 = add i32 %0, 1, !dbg !16
  store i32 %1, ptr %a, align 4, !dbg !16
  store i32 %0, ptr %b, align 4, !dbg !16
  %2 = load i32, ptr %a, align 4, !dbg !21
  %3 = icmp ne i32 %2, 14, !dbg !21
  br i1 %3, label %then, label %else, !dbg !21

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !22
  %4 = load i32, ptr %err, align 4, !dbg !22
  br label %if.end, !dbg !22

else:                                             ; preds = %entry
  br label %if.end, !dbg !22

if.end:                                           ; preds = %else, %then
  %5 = load i32, ptr %b, align 4, !dbg !23
  %6 = icmp ne i32 %5, 13, !dbg !23
  br i1 %6, label %then1, label %else2, !dbg !23

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !24
  %7 = load i32, ptr %err, align 4, !dbg !24
  br label %if.end3, !dbg !24

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !24

if.end3:                                          ; preds = %else2, %then1
  store i32 13, ptr %a, align 4, !dbg !25
  %8 = load i32, ptr %a, align 4, !dbg !25
  %9 = load i32, ptr %a, align 4, !dbg !14
  %10 = add i32 %9, 1, !dbg !14
  store i32 %10, ptr %a, align 4, !dbg !14
  %11 = load i32, ptr %a, align 4, !dbg !14
  store i32 %11, ptr %c, align 4, !dbg !14
  %12 = load i32, ptr %a, align 4, !dbg !26
  %13 = icmp ne i32 %12, 14, !dbg !26
  br i1 %13, label %then4, label %else5, !dbg !26

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !27
  %14 = load i32, ptr %err, align 4, !dbg !27
  br label %if.end6, !dbg !27

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !27

if.end6:                                          ; preds = %else5, %then4
  %15 = load i32, ptr %c, align 4, !dbg !28
  %16 = icmp ne i32 %15, 14, !dbg !28
  br i1 %16, label %then7, label %else8, !dbg !28

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !29
  %17 = load i32, ptr %err, align 4, !dbg !29
  br label %if.end9, !dbg !29

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !29

if.end9:                                          ; preds = %else8, %then7
  store i32 13, ptr %a, align 4, !dbg !30
  %18 = load i32, ptr %a, align 4, !dbg !30
  %19 = load i32, ptr %a, align 4, !dbg !12
  %20 = sub i32 %19, 1, !dbg !12
  store i32 %20, ptr %a, align 4, !dbg !12
  store i32 %19, ptr %d, align 4, !dbg !12
  %21 = load i32, ptr %a, align 4, !dbg !31
  %22 = icmp ne i32 %21, 12, !dbg !31
  br i1 %22, label %then10, label %else11, !dbg !31

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !32
  %23 = load i32, ptr %err, align 4, !dbg !32
  br label %if.end12, !dbg !32

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !32

if.end12:                                         ; preds = %else11, %then10
  %24 = load i32, ptr %d, align 4, !dbg !33
  %25 = icmp ne i32 %24, 13, !dbg !33
  br i1 %25, label %then13, label %else14, !dbg !33

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !34
  %26 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end15, !dbg !34

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !34

if.end15:                                         ; preds = %else14, %then13
  store i32 13, ptr %a, align 4, !dbg !35
  %27 = load i32, ptr %a, align 4, !dbg !35
  %28 = load i32, ptr %a, align 4, !dbg !10
  %29 = sub i32 %28, 1, !dbg !10
  store i32 %29, ptr %a, align 4, !dbg !10
  %30 = load i32, ptr %a, align 4, !dbg !10
  store i32 %30, ptr %e, align 4, !dbg !10
  %31 = load i32, ptr %a, align 4, !dbg !36
  %32 = icmp ne i32 %31, 12, !dbg !36
  br i1 %32, label %then16, label %else17, !dbg !36

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !37
  %33 = load i32, ptr %err, align 4, !dbg !37
  br label %if.end18, !dbg !37

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !37

if.end18:                                         ; preds = %else17, %then16
  %34 = load i32, ptr %e, align 4, !dbg !38
  %35 = icmp ne i32 %34, 12, !dbg !38
  br i1 %35, label %then19, label %else20, !dbg !38

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !39
  %36 = load i32, ptr %err, align 4, !dbg !39
  br label %if.end21, !dbg !39

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !39

if.end21:                                         ; preds = %else20, %then19
  store i32 0, ptr %a, align 4, !dbg !40
  %37 = load i32, ptr %a, align 4, !dbg !40
  %38 = load i32, ptr %a, align 4, !dbg !41
  %39 = add i32 %38, 1, !dbg !41
  store i32 %39, ptr %a, align 4, !dbg !41
  %40 = load i32, ptr %a, align 4, !dbg !42
  %41 = icmp ne i32 %40, 1, !dbg !42
  br i1 %41, label %then22, label %else23, !dbg !42

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !43
  %42 = load i32, ptr %err, align 4, !dbg !43
  br label %if.end24, !dbg !43

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !43

if.end24:                                         ; preds = %else23, %then22
  %43 = load i32, ptr %a, align 4, !dbg !44
  %44 = sub i32 %43, 1, !dbg !44
  store i32 %44, ptr %a, align 4, !dbg !44
  %45 = load i32, ptr %a, align 4, !dbg !45
  %46 = icmp ne i32 %45, 0, !dbg !45
  br i1 %46, label %then25, label %else26, !dbg !45

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !46
  %47 = load i32, ptr %err, align 4, !dbg !46
  br label %if.end27, !dbg !46

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !46

if.end27:                                         ; preds = %else26, %then25
  %48 = load i32, ptr %err, align 4, !dbg !47
  %49 = icmp eq i32 %48, 0, !dbg !47
  br i1 %49, label %then28, label %else29, !dbg !47

then28:                                           ; preds = %if.end27
  %50 = call i32 (ptr, ...) @printf(ptr @0), !dbg !48
  br label %if.end30, !dbg !48

else29:                                           ; preds = %if.end27
  %51 = call i32 (ptr, ...) @printf(ptr @1), !dbg !50
  br label %if.end30, !dbg !50

if.end30:                                         ; preds = %else29, %then28
  %52 = load i32, ptr %err, align 4, !dbg !52
  ret i32 %52, !dbg !52
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "13.double_inc_sub.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "e", scope: !4, file: !1, line: 22, type: !7)
!10 = !DILocation(line: 22, column: 3, scope: !4)
!11 = !DILocalVariable(name: "d", scope: !4, file: !1, line: 17, type: !7)
!12 = !DILocation(line: 17, column: 3, scope: !4)
!13 = !DILocalVariable(name: "c", scope: !4, file: !1, line: 12, type: !7)
!14 = !DILocation(line: 12, column: 3, scope: !4)
!15 = !DILocalVariable(name: "b", scope: !4, file: !1, line: 7, type: !7)
!16 = !DILocation(line: 7, column: 3, scope: !4)
!17 = !DILocalVariable(name: "a", scope: !4, file: !1, line: 5, type: !7)
!18 = !DILocation(line: 5, column: 3, scope: !4)
!19 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 4, type: !7)
!20 = !DILocation(line: 4, column: 3, scope: !4)
!21 = !DILocation(line: 8, column: 3, scope: !4)
!22 = !DILocation(line: 8, column: 16, scope: !4)
!23 = !DILocation(line: 9, column: 3, scope: !4)
!24 = !DILocation(line: 9, column: 16, scope: !4)
!25 = !DILocation(line: 11, column: 3, scope: !4)
!26 = !DILocation(line: 13, column: 3, scope: !4)
!27 = !DILocation(line: 13, column: 16, scope: !4)
!28 = !DILocation(line: 14, column: 3, scope: !4)
!29 = !DILocation(line: 14, column: 16, scope: !4)
!30 = !DILocation(line: 16, column: 3, scope: !4)
!31 = !DILocation(line: 18, column: 3, scope: !4)
!32 = !DILocation(line: 18, column: 16, scope: !4)
!33 = !DILocation(line: 19, column: 3, scope: !4)
!34 = !DILocation(line: 19, column: 16, scope: !4)
!35 = !DILocation(line: 21, column: 3, scope: !4)
!36 = !DILocation(line: 23, column: 3, scope: !4)
!37 = !DILocation(line: 23, column: 16, scope: !4)
!38 = !DILocation(line: 24, column: 3, scope: !4)
!39 = !DILocation(line: 24, column: 16, scope: !4)
!40 = !DILocation(line: 26, column: 3, scope: !4)
!41 = !DILocation(line: 27, column: 3, scope: !4)
!42 = !DILocation(line: 28, column: 3, scope: !4)
!43 = !DILocation(line: 28, column: 15, scope: !4)
!44 = !DILocation(line: 29, column: 3, scope: !4)
!45 = !DILocation(line: 30, column: 3, scope: !4)
!46 = !DILocation(line: 30, column: 15, scope: !4)
!47 = !DILocation(line: 32, column: 3, scope: !4)
!48 = !DILocation(line: 33, column: 5, scope: !49)
!49 = distinct !DILexicalBlock(scope: !4, file: !1, line: 32, column: 17)
!50 = !DILocation(line: 35, column: 5, scope: !51)
!51 = distinct !DILexicalBlock(scope: !4, file: !1, line: 34, column: 10)
!52 = !DILocation(line: 37, column: 3, scope: !4)
