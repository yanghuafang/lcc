; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@gs = global [16 x i8] zeroinitializer
@0 = private unnamed_addr constant [13 x i8] c"hello world!\00", align 1
@gps = global ptr @0
@gi = global [4 x i32] zeroinitializer
@1 = private unnamed_addr constant [21 x i8] c"6.array_type.c PASS\0A\00", align 1
@2 = private unnamed_addr constant [21 x i8] c"6.array_type.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %i = alloca [4 x i32], align 4
    #dbg_declare(ptr %i, !8, !DIExpression(), !12)
  %s = alloca [16 x i8], align 1
    #dbg_declare(ptr %s, !13, !DIExpression(), !18)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !19, !DIExpression(), !20)
  store i32 0, ptr %err, align 4, !dbg !20
  %0 = getelementptr i8, ptr %s, i32 0, !dbg !21
  store i8 103, ptr %0, align 1, !dbg !21
  %1 = load i8, ptr %0, align 1, !dbg !21
  %2 = getelementptr i8, ptr %s, i32 1, !dbg !22
  store i8 111, ptr %2, align 1, !dbg !22
  %3 = load i8, ptr %2, align 1, !dbg !22
  %4 = getelementptr i8, ptr %s, i32 2, !dbg !23
  store i8 111, ptr %4, align 1, !dbg !23
  %5 = load i8, ptr %4, align 1, !dbg !23
  %6 = getelementptr i8, ptr %s, i32 3, !dbg !24
  store i8 100, ptr %6, align 1, !dbg !24
  %7 = load i8, ptr %6, align 1, !dbg !24
  %8 = getelementptr i8, ptr %s, i32 4, !dbg !25
  store i8 0, ptr %8, align 1, !dbg !25
  %9 = load i8, ptr %8, align 1, !dbg !25
  store i8 108, ptr @gs, align 1, !dbg !26
  %10 = load i8, ptr @gs, align 1, !dbg !26
  store i8 117, ptr getelementptr (i8, ptr @gs, i32 1), align 1, !dbg !27
  %11 = load i8, ptr getelementptr (i8, ptr @gs, i32 1), align 1, !dbg !27
  store i8 99, ptr getelementptr (i8, ptr @gs, i32 2), align 1, !dbg !28
  %12 = load i8, ptr getelementptr (i8, ptr @gs, i32 2), align 1, !dbg !28
  store i8 107, ptr getelementptr (i8, ptr @gs, i32 3), align 1, !dbg !29
  %13 = load i8, ptr getelementptr (i8, ptr @gs, i32 3), align 1, !dbg !29
  store i8 121, ptr getelementptr (i8, ptr @gs, i32 4), align 1, !dbg !30
  %14 = load i8, ptr getelementptr (i8, ptr @gs, i32 4), align 1, !dbg !30
  store i8 0, ptr getelementptr (i8, ptr @gs, i32 5), align 1, !dbg !31
  %15 = load i8, ptr getelementptr (i8, ptr @gs, i32 5), align 1, !dbg !31
  %16 = getelementptr i32, ptr %i, i32 0, !dbg !32
  store i32 128, ptr %16, align 4, !dbg !32
  %17 = load i32, ptr %16, align 4, !dbg !32
  %18 = getelementptr i32, ptr %i, i32 1, !dbg !33
  store i32 256, ptr %18, align 4, !dbg !33
  %19 = load i32, ptr %18, align 4, !dbg !33
  store i32 1024, ptr @gi, align 4, !dbg !34
  %20 = load i32, ptr @gi, align 4, !dbg !34
  store i32 2048, ptr getelementptr (i32, ptr @gi, i32 1), align 4, !dbg !35
  %21 = load i32, ptr getelementptr (i32, ptr @gi, i32 1), align 4, !dbg !35
  %22 = getelementptr i32, ptr %i, i32 0, !dbg !36
  %23 = load i32, ptr %22, align 4, !dbg !36
  %24 = icmp ne i32 %23, 128, !dbg !36
  br i1 %24, label %then, label %else, !dbg !36

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !37
  %25 = load i32, ptr %err, align 4, !dbg !37
  br label %if.end, !dbg !37

else:                                             ; preds = %entry
  br label %if.end, !dbg !37

if.end:                                           ; preds = %else, %then
  %26 = getelementptr i32, ptr %i, i32 1, !dbg !38
  %27 = load i32, ptr %26, align 4, !dbg !38
  %28 = icmp ne i32 %27, 256, !dbg !38
  br i1 %28, label %then1, label %else2, !dbg !38

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !39
  %29 = load i32, ptr %err, align 4, !dbg !39
  br label %if.end3, !dbg !39

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !39

if.end3:                                          ; preds = %else2, %then1
  %30 = load i32, ptr @gi, align 4, !dbg !40
  %31 = icmp ne i32 %30, 1024, !dbg !40
  br i1 %31, label %then4, label %else5, !dbg !40

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !41
  %32 = load i32, ptr %err, align 4, !dbg !41
  br label %if.end6, !dbg !41

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !41

if.end6:                                          ; preds = %else5, %then4
  %33 = load i32, ptr getelementptr (i32, ptr @gi, i32 1), align 4, !dbg !42
  %34 = icmp ne i32 %33, 2048, !dbg !42
  br i1 %34, label %then7, label %else8, !dbg !42

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !43
  %35 = load i32, ptr %err, align 4, !dbg !43
  br label %if.end9, !dbg !43

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !43

if.end9:                                          ; preds = %else8, %then7
  %36 = getelementptr i8, ptr %s, i32 0, !dbg !44
  %37 = load i8, ptr %36, align 1, !dbg !44
  %38 = sext i8 %37 to i32, !dbg !44
  %39 = icmp ne i32 %38, 103, !dbg !44
  br i1 %39, label %then10, label %else11, !dbg !44

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !45
  %40 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end12, !dbg !45

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !45

if.end12:                                         ; preds = %else11, %then10
  %41 = load i8, ptr @gs, align 1, !dbg !46
  %42 = sext i8 %41 to i32, !dbg !46
  %43 = icmp ne i32 %42, 108, !dbg !46
  br i1 %43, label %then13, label %else14, !dbg !46

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !47
  %44 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end15, !dbg !47

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !47

if.end15:                                         ; preds = %else14, %then13
  %45 = getelementptr i32, ptr %i, i32 2, !dbg !48
  store i32 0, ptr %45, align 4, !dbg !48
  %46 = load i32, ptr %45, align 4, !dbg !48
  %47 = getelementptr i32, ptr %i, i32 3, !dbg !49
  store i32 -1, ptr %47, align 4, !dbg !49
  %48 = load i32, ptr %47, align 4, !dbg !49
  %49 = getelementptr i32, ptr %i, i32 2, !dbg !50
  %50 = load i32, ptr %49, align 4, !dbg !50
  %51 = icmp ne i32 %50, 0, !dbg !50
  br i1 %51, label %then16, label %else17, !dbg !50

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !51
  %52 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end18, !dbg !51

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !51

if.end18:                                         ; preds = %else17, %then16
  %53 = getelementptr i32, ptr %i, i32 3, !dbg !52
  %54 = load i32, ptr %53, align 4, !dbg !52
  %55 = icmp ne i32 %54, -1, !dbg !52
  br i1 %55, label %then19, label %else20, !dbg !52

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !53
  %56 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end21, !dbg !53

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !53

if.end21:                                         ; preds = %else20, %then19
  %57 = load i32, ptr %err, align 4, !dbg !54
  %58 = icmp eq i32 %57, 0, !dbg !54
  br i1 %58, label %then22, label %else23, !dbg !54

then22:                                           ; preds = %if.end21
  %59 = call i32 (ptr, ...) @printf(ptr @1), !dbg !55
  br label %if.end24, !dbg !55

else23:                                           ; preds = %if.end21
  %60 = call i32 (ptr, ...) @printf(ptr @2), !dbg !57
  br label %if.end24, !dbg !57

if.end24:                                         ; preds = %else23, %then22
  %61 = load i32, ptr %err, align 4, !dbg !59
  ret i32 %61, !dbg !59
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "6.array_type.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 10, type: !5, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "i", scope: !4, file: !3, line: 13, type: !9)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 128, align: 32, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 4, lowerBound: 0)
!12 = !DILocation(line: 13, column: 3, scope: !4)
!13 = !DILocalVariable(name: "s", scope: !4, file: !3, line: 12, type: !14)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 128, align: 8, elements: !16)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !{!17}
!17 = !DISubrange(count: 16, lowerBound: 0)
!18 = !DILocation(line: 12, column: 3, scope: !4)
!19 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 11, type: !7)
!20 = !DILocation(line: 11, column: 3, scope: !4)
!21 = !DILocation(line: 15, column: 3, scope: !4)
!22 = !DILocation(line: 16, column: 3, scope: !4)
!23 = !DILocation(line: 17, column: 3, scope: !4)
!24 = !DILocation(line: 18, column: 3, scope: !4)
!25 = !DILocation(line: 19, column: 3, scope: !4)
!26 = !DILocation(line: 21, column: 3, scope: !4)
!27 = !DILocation(line: 22, column: 3, scope: !4)
!28 = !DILocation(line: 23, column: 3, scope: !4)
!29 = !DILocation(line: 24, column: 3, scope: !4)
!30 = !DILocation(line: 25, column: 3, scope: !4)
!31 = !DILocation(line: 26, column: 3, scope: !4)
!32 = !DILocation(line: 28, column: 3, scope: !4)
!33 = !DILocation(line: 29, column: 3, scope: !4)
!34 = !DILocation(line: 30, column: 3, scope: !4)
!35 = !DILocation(line: 31, column: 3, scope: !4)
!36 = !DILocation(line: 33, column: 3, scope: !4)
!37 = !DILocation(line: 33, column: 20, scope: !4)
!38 = !DILocation(line: 34, column: 3, scope: !4)
!39 = !DILocation(line: 34, column: 20, scope: !4)
!40 = !DILocation(line: 35, column: 3, scope: !4)
!41 = !DILocation(line: 35, column: 22, scope: !4)
!42 = !DILocation(line: 36, column: 3, scope: !4)
!43 = !DILocation(line: 36, column: 22, scope: !4)
!44 = !DILocation(line: 37, column: 3, scope: !4)
!45 = !DILocation(line: 37, column: 20, scope: !4)
!46 = !DILocation(line: 38, column: 3, scope: !4)
!47 = !DILocation(line: 38, column: 21, scope: !4)
!48 = !DILocation(line: 40, column: 3, scope: !4)
!49 = !DILocation(line: 41, column: 3, scope: !4)
!50 = !DILocation(line: 42, column: 3, scope: !4)
!51 = !DILocation(line: 42, column: 18, scope: !4)
!52 = !DILocation(line: 43, column: 3, scope: !4)
!53 = !DILocation(line: 43, column: 19, scope: !4)
!54 = !DILocation(line: 45, column: 3, scope: !4)
!55 = !DILocation(line: 46, column: 5, scope: !56)
!56 = distinct !DILexicalBlock(scope: !4, file: !3, line: 45, column: 17)
!57 = !DILocation(line: 48, column: 5, scope: !58)
!58 = distinct !DILexicalBlock(scope: !4, file: !3, line: 47, column: 10)
!59 = !DILocation(line: 50, column: 3, scope: !4)
