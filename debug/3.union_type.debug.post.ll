; ModuleID = 'lcc'
source_filename = "lcc"

%union.IPv4 = type { i32 }

@0 = private unnamed_addr constant [21 x i8] c"3.union_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [21 x i8] c"3.union_type.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %byte = alloca i8, align 1
    #dbg_declare(ptr %byte, !7, !DIExpression(), !9)
  %ip = alloca i32, align 4
    #dbg_declare(ptr %ip, !10, !DIExpression(), !12)
  %ipv4 = alloca %union.IPv4, align 8
    #dbg_declare(ptr %ipv4, !13, !DIExpression(), !18)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !19, !DIExpression(), !20)
  store i32 0, ptr %err, align 4, !dbg !20
  store i32 313249076, ptr %ipv4, align 4, !dbg !21
  %0 = load i32, ptr %ipv4, align 4, !dbg !21
  %1 = load i32, ptr %ipv4, align 4, !dbg !22
  store i32 %1, ptr %ip, align 4, !dbg !22
  %2 = load i32, ptr %ip, align 4, !dbg !22
  %3 = load i8, ptr %ipv4, align 1, !dbg !23
  store i8 %3, ptr %byte, align 1, !dbg !23
  %4 = load i8, ptr %byte, align 1, !dbg !23
  %5 = load i32, ptr %ip, align 4, !dbg !24
  %6 = icmp ne i32 %5, 313249076, !dbg !24
  br i1 %6, label %then, label %else, !dbg !24

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !25
  %7 = load i32, ptr %err, align 4, !dbg !25
  br label %if.end, !dbg !25

else:                                             ; preds = %entry
  br label %if.end, !dbg !25

if.end:                                           ; preds = %else, %then
  %8 = load i8, ptr %byte, align 1, !dbg !26
  %9 = zext i8 %8 to i32, !dbg !26
  %10 = icmp ne i32 %9, 52, !dbg !26
  br i1 %10, label %then1, label %else2, !dbg !26

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !27
  %11 = load i32, ptr %err, align 4, !dbg !27
  br label %if.end3, !dbg !27

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !27

if.end3:                                          ; preds = %else2, %then1
  store i8 86, ptr %ipv4, align 1, !dbg !28
  %12 = load i8, ptr %ipv4, align 1, !dbg !28
  %13 = load i32, ptr %ipv4, align 4, !dbg !29
  store i32 %13, ptr %ip, align 4, !dbg !29
  %14 = load i32, ptr %ip, align 4, !dbg !29
  %15 = load i8, ptr %ipv4, align 1, !dbg !30
  store i8 %15, ptr %byte, align 1, !dbg !30
  %16 = load i8, ptr %byte, align 1, !dbg !30
  %17 = load i32, ptr %ip, align 4, !dbg !31
  %18 = icmp ne i32 %17, 313249110, !dbg !31
  br i1 %18, label %then4, label %else5, !dbg !31

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !32
  %19 = load i32, ptr %err, align 4, !dbg !32
  br label %if.end6, !dbg !32

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !32

if.end6:                                          ; preds = %else5, %then4
  %20 = load i8, ptr %byte, align 1, !dbg !33
  %21 = zext i8 %20 to i32, !dbg !33
  %22 = icmp ne i32 %21, 86, !dbg !33
  br i1 %22, label %then7, label %else8, !dbg !33

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !34
  %23 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end9, !dbg !34

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !34

if.end9:                                          ; preds = %else8, %then7
  store i32 -1, ptr %ipv4, align 4, !dbg !35
  %24 = load i32, ptr %ipv4, align 4, !dbg !35
  %25 = load i32, ptr %ipv4, align 4, !dbg !36
  store i32 %25, ptr %ip, align 4, !dbg !36
  %26 = load i32, ptr %ip, align 4, !dbg !36
  %27 = load i32, ptr %ip, align 4, !dbg !37
  %28 = icmp ne i32 %27, -1, !dbg !37
  br i1 %28, label %then10, label %else11, !dbg !37

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !38
  %29 = load i32, ptr %err, align 4, !dbg !38
  br label %if.end12, !dbg !38

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !38

if.end12:                                         ; preds = %else11, %then10
  store i8 0, ptr %ipv4, align 1, !dbg !39
  %30 = load i8, ptr %ipv4, align 1, !dbg !39
  %31 = load i32, ptr %ipv4, align 4, !dbg !40
  store i32 %31, ptr %ip, align 4, !dbg !40
  %32 = load i32, ptr %ip, align 4, !dbg !40
  %33 = load i32, ptr %ip, align 4, !dbg !41
  %34 = icmp ne i32 %33, -256, !dbg !41
  br i1 %34, label %then13, label %else14, !dbg !41

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !42
  %35 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end15, !dbg !42

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !42

if.end15:                                         ; preds = %else14, %then13
  %36 = load i32, ptr %err, align 4, !dbg !43
  %37 = icmp eq i32 %36, 0, !dbg !43
  br i1 %37, label %then16, label %else17, !dbg !43

then16:                                           ; preds = %if.end15
  %38 = call i32 (ptr, ...) @printf(ptr @0), !dbg !44
  br label %if.end18, !dbg !44

else17:                                           ; preds = %if.end15
  %39 = call i32 (ptr, ...) @printf(ptr @1), !dbg !46
  br label %if.end18, !dbg !46

if.end18:                                         ; preds = %else17, %then16
  %40 = load i32, ptr %err, align 4, !dbg !48
  ret i32 %40, !dbg !48
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "3.union_type.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 8, type: !3, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "byte", scope: !2, file: !1, line: 12, type: !8)
!8 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!9 = !DILocation(line: 12, column: 3, scope: !2)
!10 = !DILocalVariable(name: "ip", scope: !2, file: !1, line: 11, type: !11)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !DILocation(line: 11, column: 3, scope: !2)
!13 = !DILocalVariable(name: "ipv4", scope: !2, file: !1, line: 10, type: !14)
!14 = !DICompositeType(tag: DW_TAG_union_type, name: "IPv4", file: !1, size: 32, align: 32, elements: !15)
!15 = !{!16, !17}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "ip", file: !1, baseType: !11, size: 32, align: 32)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "c", file: !1, baseType: !8, size: 8, align: 8)
!18 = !DILocation(line: 10, column: 3, scope: !2)
!19 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 9, type: !5)
!20 = !DILocation(line: 9, column: 3, scope: !2)
!21 = !DILocation(line: 14, column: 3, scope: !2)
!22 = !DILocation(line: 15, column: 3, scope: !2)
!23 = !DILocation(line: 16, column: 3, scope: !2)
!24 = !DILocation(line: 17, column: 3, scope: !2)
!25 = !DILocation(line: 17, column: 25, scope: !2)
!26 = !DILocation(line: 18, column: 3, scope: !2)
!27 = !DILocation(line: 18, column: 21, scope: !2)
!28 = !DILocation(line: 20, column: 3, scope: !2)
!29 = !DILocation(line: 21, column: 3, scope: !2)
!30 = !DILocation(line: 22, column: 3, scope: !2)
!31 = !DILocation(line: 23, column: 3, scope: !2)
!32 = !DILocation(line: 23, column: 25, scope: !2)
!33 = !DILocation(line: 24, column: 3, scope: !2)
!34 = !DILocation(line: 24, column: 21, scope: !2)
!35 = !DILocation(line: 26, column: 3, scope: !2)
!36 = !DILocation(line: 27, column: 3, scope: !2)
!37 = !DILocation(line: 28, column: 3, scope: !2)
!38 = !DILocation(line: 28, column: 25, scope: !2)
!39 = !DILocation(line: 30, column: 3, scope: !2)
!40 = !DILocation(line: 31, column: 3, scope: !2)
!41 = !DILocation(line: 32, column: 3, scope: !2)
!42 = !DILocation(line: 32, column: 25, scope: !2)
!43 = !DILocation(line: 34, column: 3, scope: !2)
!44 = !DILocation(line: 35, column: 5, scope: !45)
!45 = distinct !DILexicalBlock(scope: !2, file: !1, line: 34, column: 17)
!46 = !DILocation(line: 37, column: 5, scope: !47)
!47 = distinct !DILexicalBlock(scope: !2, file: !1, line: 36, column: 10)
!48 = !DILocation(line: 39, column: 3, scope: !2)
