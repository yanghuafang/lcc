; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@g_data = global i32 0
@0 = private unnamed_addr constant [31 x i8] c"10.double_pointer_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"10.double_pointer_type.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define void @getAddress(ptr %0) !dbg !4 {
entry:
  %p = alloca ptr, align 8
    #dbg_declare(ptr %p, !11, !DIExpression(), !12)
  store ptr %0, ptr %p, align 8, !dbg !12
  %1 = load ptr, ptr %p, align 8, !dbg !13
  store ptr @g_data, ptr %1, align 8, !dbg !13
  %2 = load ptr, ptr %1, align 8, !dbg !13
  ret void, !dbg !13
}

define i32 @main() !dbg !14 {
entry:
  %p2 = alloca ptr, align 8
    #dbg_declare(ptr %p2, !17, !DIExpression(), !18)
  %p = alloca ptr, align 8
    #dbg_declare(ptr %p, !19, !DIExpression(), !20)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !21, !DIExpression(), !22)
  store i32 0, ptr %err, align 4, !dbg !22
  store ptr @g_data, ptr %p, align 8, !dbg !20
  %0 = load ptr, ptr %p, align 8, !dbg !23
  store i32 1234, ptr %0, align 4, !dbg !23
  %1 = load i32, ptr %0, align 4, !dbg !23
  call void @getAddress(ptr %p2), !dbg !24
  %2 = load ptr, ptr %p2, align 8, !dbg !25
  store i32 5678, ptr %2, align 4, !dbg !25
  %3 = load i32, ptr %2, align 4, !dbg !25
  %4 = load i32, ptr @g_data, align 4, !dbg !26
  %5 = icmp ne i32 %4, 5678, !dbg !26
  br i1 %5, label %then, label %else, !dbg !26

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !27
  %6 = load i32, ptr %err, align 4, !dbg !27
  br label %if.end, !dbg !27

else:                                             ; preds = %entry
  br label %if.end, !dbg !27

if.end:                                           ; preds = %else, %then
  %7 = load ptr, ptr %p2, align 8, !dbg !28
  %8 = load i32, ptr %7, align 4, !dbg !28
  %9 = icmp ne i32 %8, 5678, !dbg !28
  br i1 %9, label %then1, label %else2, !dbg !28

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !29
  %10 = load i32, ptr %err, align 4, !dbg !29
  br label %if.end3, !dbg !29

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !29

if.end3:                                          ; preds = %else2, %then1
  %11 = load ptr, ptr %p, align 8, !dbg !30
  %12 = load i32, ptr %11, align 4, !dbg !30
  %13 = icmp ne i32 %12, 5678, !dbg !30
  br i1 %13, label %then4, label %else5, !dbg !30

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !31
  %14 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end6, !dbg !31

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !31

if.end6:                                          ; preds = %else5, %then4
  %15 = load ptr, ptr %p, align 8, !dbg !32
  store i32 0, ptr %15, align 4, !dbg !32
  %16 = load i32, ptr %15, align 4, !dbg !32
  %17 = load i32, ptr @g_data, align 4, !dbg !33
  %18 = icmp ne i32 %17, 0, !dbg !33
  br i1 %18, label %then7, label %else8, !dbg !33

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !34
  %19 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end9, !dbg !34

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !34

if.end9:                                          ; preds = %else8, %then7
  %20 = load ptr, ptr %p2, align 8, !dbg !35
  store i32 -42, ptr %20, align 4, !dbg !35
  %21 = load i32, ptr %20, align 4, !dbg !35
  %22 = load i32, ptr @g_data, align 4, !dbg !36
  %23 = icmp ne i32 %22, -42, !dbg !36
  br i1 %23, label %then10, label %else11, !dbg !36

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !37
  %24 = load i32, ptr %err, align 4, !dbg !37
  br label %if.end12, !dbg !37

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !37

if.end12:                                         ; preds = %else11, %then10
  %25 = load i32, ptr %err, align 4, !dbg !38
  %26 = icmp eq i32 %25, 0, !dbg !38
  br i1 %26, label %then13, label %else14, !dbg !38

then13:                                           ; preds = %if.end12
  %27 = call i32 (ptr, ...) @printf(ptr @0), !dbg !39
  br label %if.end15, !dbg !39

else14:                                           ; preds = %if.end12
  %28 = call i32 (ptr, ...) @printf(ptr @1), !dbg !41
  br label %if.end15, !dbg !41

if.end15:                                         ; preds = %else14, %then13
  %29 = load i32, ptr %err, align 4, !dbg !43
  ret i32 %29, !dbg !43
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "10.double_pointer_type.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "getAddress", linkageName: "getAddress", scope: null, file: !3, line: 8, type: !5, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !8}
!7 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "p", arg: 1, scope: !4, file: !3, line: 8, type: !8)
!12 = !DILocation(line: 8, column: 6, scope: !4)
!13 = !DILocation(line: 8, column: 28, scope: !4)
!14 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 10, type: !15, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !2)
!15 = !DISubroutineType(types: !16)
!16 = !{!10}
!17 = !DILocalVariable(name: "p2", scope: !14, file: !3, line: 15, type: !9)
!18 = !DILocation(line: 15, column: 3, scope: !14)
!19 = !DILocalVariable(name: "p", scope: !14, file: !3, line: 12, type: !9)
!20 = !DILocation(line: 12, column: 3, scope: !14)
!21 = !DILocalVariable(name: "err", scope: !14, file: !3, line: 11, type: !10)
!22 = !DILocation(line: 11, column: 3, scope: !14)
!23 = !DILocation(line: 13, column: 3, scope: !14)
!24 = !DILocation(line: 16, column: 3, scope: !14)
!25 = !DILocation(line: 17, column: 3, scope: !14)
!26 = !DILocation(line: 19, column: 3, scope: !14)
!27 = !DILocation(line: 19, column: 23, scope: !14)
!28 = !DILocation(line: 20, column: 3, scope: !14)
!29 = !DILocation(line: 20, column: 20, scope: !14)
!30 = !DILocation(line: 21, column: 3, scope: !14)
!31 = !DILocation(line: 21, column: 19, scope: !14)
!32 = !DILocation(line: 23, column: 3, scope: !14)
!33 = !DILocation(line: 24, column: 3, scope: !14)
!34 = !DILocation(line: 24, column: 20, scope: !14)
!35 = !DILocation(line: 26, column: 3, scope: !14)
!36 = !DILocation(line: 27, column: 3, scope: !14)
!37 = !DILocation(line: 27, column: 22, scope: !14)
!38 = !DILocation(line: 29, column: 3, scope: !14)
!39 = !DILocation(line: 30, column: 5, scope: !40)
!40 = distinct !DILexicalBlock(scope: !14, file: !3, line: 29, column: 17)
!41 = !DILocation(line: 32, column: 5, scope: !42)
!42 = distinct !DILexicalBlock(scope: !14, file: !3, line: 31, column: 10)
!43 = !DILocation(line: 34, column: 3, scope: !14)
