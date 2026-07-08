; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

%union.IPv4 = type { i32 }

@0 = private unnamed_addr constant [21 x i8] c"3.union_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [21 x i8] c"3.union_type.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %const = bitcast i32 313249076 to i32
  %byte = alloca i8, align 1
    #dbg_declare(ptr %byte, !9, !DIExpression(), !11)
  %ip = alloca i32, align 4
    #dbg_declare(ptr %ip, !12, !DIExpression(), !14)
  %ipv4 = alloca %union.IPv4, align 8
    #dbg_declare(ptr %ipv4, !15, !DIExpression(), !20)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !21, !DIExpression(), !22)
  store i32 0, ptr %err, align 4, !dbg !22
  store i32 %const, ptr %ipv4, align 4, !dbg !23
  %0 = load i32, ptr %ipv4, align 4, !dbg !23
  %1 = load i32, ptr %ipv4, align 4, !dbg !24
  store i32 %1, ptr %ip, align 4, !dbg !24
  %2 = load i32, ptr %ip, align 4, !dbg !24
  %3 = load i8, ptr %ipv4, align 1, !dbg !25
  store i8 %3, ptr %byte, align 1, !dbg !25
  %4 = load i8, ptr %byte, align 1, !dbg !25
  %5 = load i32, ptr %ip, align 4, !dbg !26
  %6 = icmp ne i32 %5, %const, !dbg !26
  br i1 %6, label %then, label %if.end, !dbg !26

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !27
  %7 = load i32, ptr %err, align 4, !dbg !27
  br label %if.end, !dbg !27

if.end:                                           ; preds = %entry, %then
  %8 = load i8, ptr %byte, align 1, !dbg !28
  %9 = zext i8 %8 to i32, !dbg !28
  %10 = icmp ne i32 %9, 52, !dbg !28
  br i1 %10, label %then1, label %if.end3, !dbg !28

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !29
  %11 = load i32, ptr %err, align 4, !dbg !29
  br label %if.end3, !dbg !29

if.end3:                                          ; preds = %if.end, %then1
  store i8 86, ptr %ipv4, align 1, !dbg !30
  %12 = load i8, ptr %ipv4, align 1, !dbg !30
  %13 = load i32, ptr %ipv4, align 4, !dbg !31
  store i32 %13, ptr %ip, align 4, !dbg !31
  %14 = load i32, ptr %ip, align 4, !dbg !31
  %15 = load i8, ptr %ipv4, align 1, !dbg !32
  store i8 %15, ptr %byte, align 1, !dbg !32
  %16 = load i8, ptr %byte, align 1, !dbg !32
  %17 = load i32, ptr %ip, align 4, !dbg !33
  %const_mat = add i32 %const, 34, !dbg !33
  %18 = icmp ne i32 %17, %const_mat, !dbg !33
  br i1 %18, label %then4, label %if.end6, !dbg !33

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !34
  %19 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end6, !dbg !34

if.end6:                                          ; preds = %if.end3, %then4
  %20 = load i8, ptr %byte, align 1, !dbg !35
  %21 = zext i8 %20 to i32, !dbg !35
  %22 = icmp ne i32 %21, 86, !dbg !35
  br i1 %22, label %then7, label %if.end9, !dbg !35

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !36
  %23 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end9, !dbg !36

if.end9:                                          ; preds = %if.end6, %then7
  store i32 -1, ptr %ipv4, align 4, !dbg !37
  %24 = load i32, ptr %ipv4, align 4, !dbg !37
  %25 = load i32, ptr %ipv4, align 4, !dbg !38
  store i32 %25, ptr %ip, align 4, !dbg !38
  %26 = load i32, ptr %ip, align 4, !dbg !38
  %27 = load i32, ptr %ip, align 4, !dbg !39
  %28 = icmp ne i32 %27, -1, !dbg !39
  br i1 %28, label %then10, label %if.end12, !dbg !39

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !40
  %29 = load i32, ptr %err, align 4, !dbg !40
  br label %if.end12, !dbg !40

if.end12:                                         ; preds = %if.end9, %then10
  store i8 0, ptr %ipv4, align 1, !dbg !41
  %30 = load i8, ptr %ipv4, align 1, !dbg !41
  %31 = load i32, ptr %ipv4, align 4, !dbg !42
  store i32 %31, ptr %ip, align 4, !dbg !42
  %32 = load i32, ptr %ip, align 4, !dbg !42
  %33 = load i32, ptr %ip, align 4, !dbg !43
  %34 = icmp ne i32 %33, -256, !dbg !43
  br i1 %34, label %then13, label %if.end15, !dbg !43

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !44
  %35 = load i32, ptr %err, align 4, !dbg !44
  br label %if.end15, !dbg !44

if.end15:                                         ; preds = %if.end12, %then13
  %36 = load i32, ptr %err, align 4, !dbg !45
  %37 = icmp eq i32 %36, 0, !dbg !45
  %. = select i1 %37, ptr @0, ptr @1, !dbg !46
  %38 = call i32 (ptr, ...) @printf(ptr %.), !dbg !46
  %39 = load i32, ptr %err, align 4, !dbg !47
  ret i32 %39, !dbg !47
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "3.union_type.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 8, type: !5, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "byte", scope: !4, file: !1, line: 12, type: !10)
!10 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!11 = !DILocation(line: 12, column: 3, scope: !4)
!12 = !DILocalVariable(name: "ip", scope: !4, file: !1, line: 11, type: !13)
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !DILocation(line: 11, column: 3, scope: !4)
!15 = !DILocalVariable(name: "ipv4", scope: !4, file: !1, line: 10, type: !16)
!16 = !DICompositeType(tag: DW_TAG_union_type, name: "IPv4", file: !1, size: 32, align: 32, elements: !17)
!17 = !{!18, !19}
!18 = !DIDerivedType(tag: DW_TAG_member, name: "ip", file: !1, baseType: !13, size: 32, align: 32)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "c", file: !1, baseType: !10, size: 8, align: 8)
!20 = !DILocation(line: 10, column: 3, scope: !4)
!21 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 9, type: !7)
!22 = !DILocation(line: 9, column: 3, scope: !4)
!23 = !DILocation(line: 14, column: 3, scope: !4)
!24 = !DILocation(line: 15, column: 3, scope: !4)
!25 = !DILocation(line: 16, column: 3, scope: !4)
!26 = !DILocation(line: 17, column: 3, scope: !4)
!27 = !DILocation(line: 17, column: 25, scope: !4)
!28 = !DILocation(line: 18, column: 3, scope: !4)
!29 = !DILocation(line: 18, column: 21, scope: !4)
!30 = !DILocation(line: 20, column: 3, scope: !4)
!31 = !DILocation(line: 21, column: 3, scope: !4)
!32 = !DILocation(line: 22, column: 3, scope: !4)
!33 = !DILocation(line: 23, column: 3, scope: !4)
!34 = !DILocation(line: 23, column: 25, scope: !4)
!35 = !DILocation(line: 24, column: 3, scope: !4)
!36 = !DILocation(line: 24, column: 21, scope: !4)
!37 = !DILocation(line: 26, column: 3, scope: !4)
!38 = !DILocation(line: 27, column: 3, scope: !4)
!39 = !DILocation(line: 28, column: 3, scope: !4)
!40 = !DILocation(line: 28, column: 25, scope: !4)
!41 = !DILocation(line: 30, column: 3, scope: !4)
!42 = !DILocation(line: 31, column: 3, scope: !4)
!43 = !DILocation(line: 32, column: 3, scope: !4)
!44 = !DILocation(line: 32, column: 25, scope: !4)
!45 = !DILocation(line: 34, column: 3, scope: !4)
!46 = !DILocation(line: 0, scope: !4)
!47 = !DILocation(line: 39, column: 3, scope: !4)
