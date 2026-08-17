; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@gc = global i8 97
@gi = global i32 1024
@0 = private unnamed_addr constant [23 x i8] c"5.pointer_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [23 x i8] c"5.pointer_type.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %pgi = alloca ptr, align 8
    #dbg_declare(ptr %pgi, !8, !DIExpression(), !10)
  %pgc = alloca ptr, align 8
    #dbg_declare(ptr %pgc, !11, !DIExpression(), !14)
  %pi = alloca ptr, align 8
    #dbg_declare(ptr %pi, !15, !DIExpression(), !16)
  %pc = alloca ptr, align 8
    #dbg_declare(ptr %pc, !17, !DIExpression(), !18)
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !19, !DIExpression(), !20)
  %c = alloca i8, align 1
    #dbg_declare(ptr %c, !21, !DIExpression(), !22)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !23, !DIExpression(), !24)
  store i32 0, ptr %err, align 4, !dbg !24
  store i8 65, ptr %c, align 1, !dbg !22
  store i32 128, ptr %i, align 4, !dbg !20
  store ptr %c, ptr %pc, align 8, !dbg !18
  store ptr %i, ptr %pi, align 8, !dbg !16
  %0 = load ptr, ptr %pc, align 8, !dbg !25
  store i8 66, ptr %0, align 1, !dbg !25
  %1 = load i8, ptr %0, align 1, !dbg !25
  %2 = load ptr, ptr %pi, align 8, !dbg !26
  store i32 256, ptr %2, align 4, !dbg !26
  %3 = load i32, ptr %2, align 4, !dbg !26
  store ptr @gc, ptr %pgc, align 8, !dbg !14
  store ptr @gi, ptr %pgi, align 8, !dbg !10
  %4 = load ptr, ptr %pgc, align 8, !dbg !27
  store i8 98, ptr %4, align 1, !dbg !27
  %5 = load i8, ptr %4, align 1, !dbg !27
  %6 = load ptr, ptr %pgi, align 8, !dbg !28
  store i32 2048, ptr %6, align 4, !dbg !28
  %7 = load i32, ptr %6, align 4, !dbg !28
  %8 = load i8, ptr %c, align 1, !dbg !29
  %9 = sext i8 %8 to i32, !dbg !29
  %10 = icmp ne i32 %9, 66, !dbg !29
  br i1 %10, label %then, label %else, !dbg !29

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !30
  %11 = load i32, ptr %err, align 4, !dbg !30
  br label %if.end, !dbg !30

else:                                             ; preds = %entry
  br label %if.end, !dbg !30

if.end:                                           ; preds = %else, %then
  %12 = load ptr, ptr %pc, align 8, !dbg !31
  %13 = load i8, ptr %12, align 1, !dbg !31
  %14 = sext i8 %13 to i32, !dbg !31
  %15 = icmp ne i32 %14, 66, !dbg !31
  br i1 %15, label %then1, label %else2, !dbg !31

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !32
  %16 = load i32, ptr %err, align 4, !dbg !32
  br label %if.end3, !dbg !32

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !32

if.end3:                                          ; preds = %else2, %then1
  %17 = load i32, ptr %i, align 4, !dbg !33
  %18 = icmp ne i32 %17, 256, !dbg !33
  br i1 %18, label %then4, label %else5, !dbg !33

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !34
  %19 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end6, !dbg !34

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !34

if.end6:                                          ; preds = %else5, %then4
  %20 = load ptr, ptr %pi, align 8, !dbg !35
  %21 = load i32, ptr %20, align 4, !dbg !35
  %22 = icmp ne i32 %21, 256, !dbg !35
  br i1 %22, label %then7, label %else8, !dbg !35

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !36
  %23 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end9, !dbg !36

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !36

if.end9:                                          ; preds = %else8, %then7
  %24 = load i8, ptr @gc, align 1, !dbg !37
  %25 = sext i8 %24 to i32, !dbg !37
  %26 = icmp ne i32 %25, 98, !dbg !37
  br i1 %26, label %then10, label %else11, !dbg !37

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !38
  %27 = load i32, ptr %err, align 4, !dbg !38
  br label %if.end12, !dbg !38

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !38

if.end12:                                         ; preds = %else11, %then10
  %28 = load i32, ptr @gi, align 4, !dbg !39
  %29 = icmp ne i32 %28, 2048, !dbg !39
  br i1 %29, label %then13, label %else14, !dbg !39

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !40
  %30 = load i32, ptr %err, align 4, !dbg !40
  br label %if.end15, !dbg !40

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !40

if.end15:                                         ; preds = %else14, %then13
  %31 = load ptr, ptr %pi, align 8, !dbg !41
  store i32 0, ptr %31, align 4, !dbg !41
  %32 = load i32, ptr %31, align 4, !dbg !41
  %33 = load i32, ptr %i, align 4, !dbg !42
  %34 = icmp ne i32 %33, 0, !dbg !42
  br i1 %34, label %then16, label %else17, !dbg !42

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !43
  %35 = load i32, ptr %err, align 4, !dbg !43
  br label %if.end18, !dbg !43

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !43

if.end18:                                         ; preds = %else17, %then16
  %36 = load i32, ptr %err, align 4, !dbg !44
  %37 = icmp eq i32 %36, 0, !dbg !44
  br i1 %37, label %then19, label %else20, !dbg !44

then19:                                           ; preds = %if.end18
  %38 = call i32 (ptr, ...) @printf(ptr @0), !dbg !45
  br label %if.end21, !dbg !45

else20:                                           ; preds = %if.end18
  %39 = call i32 (ptr, ...) @printf(ptr @1), !dbg !47
  br label %if.end21, !dbg !47

if.end21:                                         ; preds = %else20, %then19
  %40 = load i32, ptr %err, align 4, !dbg !49
  ret i32 %40, !dbg !49
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "5.pointer_type.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 8, type: !5, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "pgi", scope: !4, file: !3, line: 19, type: !9)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!10 = !DILocation(line: 19, column: 3, scope: !4)
!11 = !DILocalVariable(name: "pgc", scope: !4, file: !3, line: 18, type: !12)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocation(line: 18, column: 3, scope: !4)
!15 = !DILocalVariable(name: "pi", scope: !4, file: !3, line: 13, type: !9)
!16 = !DILocation(line: 13, column: 3, scope: !4)
!17 = !DILocalVariable(name: "pc", scope: !4, file: !3, line: 12, type: !12)
!18 = !DILocation(line: 12, column: 3, scope: !4)
!19 = !DILocalVariable(name: "i", scope: !4, file: !3, line: 11, type: !7)
!20 = !DILocation(line: 11, column: 3, scope: !4)
!21 = !DILocalVariable(name: "c", scope: !4, file: !3, line: 10, type: !13)
!22 = !DILocation(line: 10, column: 3, scope: !4)
!23 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 9, type: !7)
!24 = !DILocation(line: 9, column: 3, scope: !4)
!25 = !DILocation(line: 15, column: 3, scope: !4)
!26 = !DILocation(line: 16, column: 3, scope: !4)
!27 = !DILocation(line: 20, column: 3, scope: !4)
!28 = !DILocation(line: 21, column: 3, scope: !4)
!29 = !DILocation(line: 23, column: 3, scope: !4)
!30 = !DILocation(line: 23, column: 17, scope: !4)
!31 = !DILocation(line: 24, column: 3, scope: !4)
!32 = !DILocation(line: 24, column: 19, scope: !4)
!33 = !DILocation(line: 25, column: 3, scope: !4)
!34 = !DILocation(line: 25, column: 17, scope: !4)
!35 = !DILocation(line: 26, column: 3, scope: !4)
!36 = !DILocation(line: 26, column: 19, scope: !4)
!37 = !DILocation(line: 27, column: 3, scope: !4)
!38 = !DILocation(line: 27, column: 18, scope: !4)
!39 = !DILocation(line: 28, column: 3, scope: !4)
!40 = !DILocation(line: 28, column: 19, scope: !4)
!41 = !DILocation(line: 30, column: 3, scope: !4)
!42 = !DILocation(line: 31, column: 3, scope: !4)
!43 = !DILocation(line: 31, column: 15, scope: !4)
!44 = !DILocation(line: 33, column: 3, scope: !4)
!45 = !DILocation(line: 34, column: 5, scope: !46)
!46 = distinct !DILexicalBlock(scope: !4, file: !3, line: 33, column: 17)
!47 = !DILocation(line: 36, column: 5, scope: !48)
!48 = distinct !DILexicalBlock(scope: !4, file: !3, line: 35, column: 10)
!49 = !DILocation(line: 38, column: 3, scope: !4)
