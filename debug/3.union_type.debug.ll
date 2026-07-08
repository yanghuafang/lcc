; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%union.IPv4 = type { i32 }

@0 = private unnamed_addr constant [21 x i8] c"3.union_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [21 x i8] c"3.union_type.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !4 {
entry:
  %const = bitcast i32 313249076 to i32
  %byte = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %byte, metadata !9, metadata !DIExpression()), !dbg !11
  %ip = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %ip, metadata !12, metadata !DIExpression()), !dbg !14
  %ipv4 = alloca %union.IPv4, align 8
  call void @llvm.dbg.declare(metadata %union.IPv4* %ipv4, metadata !15, metadata !DIExpression()), !dbg !20
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 0, i32* %err, align 4, !dbg !22
  %0 = bitcast %union.IPv4* %ipv4 to i32*, !dbg !23
  store i32 %const, i32* %0, align 4, !dbg !23
  %1 = load i32, i32* %0, align 4, !dbg !23
  %2 = bitcast %union.IPv4* %ipv4 to i32*, !dbg !24
  %3 = load i32, i32* %2, align 4, !dbg !24
  store i32 %3, i32* %ip, align 4, !dbg !24
  %4 = load i32, i32* %ip, align 4, !dbg !24
  %5 = bitcast %union.IPv4* %ipv4 to i8*, !dbg !25
  %6 = load i8, i8* %5, align 1, !dbg !25
  store i8 %6, i8* %byte, align 1, !dbg !25
  %7 = load i8, i8* %byte, align 1, !dbg !25
  %8 = load i32, i32* %ip, align 4, !dbg !26
  %9 = icmp ne i32 %8, %const, !dbg !26
  br i1 %9, label %then, label %if.end, !dbg !26

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !27
  %10 = load i32, i32* %err, align 4, !dbg !27
  br label %if.end, !dbg !27

if.end:                                           ; preds = %entry, %then
  %11 = load i8, i8* %byte, align 1, !dbg !28
  %12 = zext i8 %11 to i32, !dbg !28
  %13 = icmp ne i32 %12, 52, !dbg !28
  br i1 %13, label %then1, label %if.end3, !dbg !28

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !29
  %14 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end3, !dbg !29

if.end3:                                          ; preds = %if.end, %then1
  %15 = bitcast %union.IPv4* %ipv4 to i8*, !dbg !30
  store i8 86, i8* %15, align 1, !dbg !30
  %16 = load i8, i8* %15, align 1, !dbg !30
  %17 = bitcast %union.IPv4* %ipv4 to i32*, !dbg !31
  %18 = load i32, i32* %17, align 4, !dbg !31
  store i32 %18, i32* %ip, align 4, !dbg !31
  %19 = load i32, i32* %ip, align 4, !dbg !31
  %20 = bitcast %union.IPv4* %ipv4 to i8*, !dbg !32
  %21 = load i8, i8* %20, align 1, !dbg !32
  store i8 %21, i8* %byte, align 1, !dbg !32
  %22 = load i8, i8* %byte, align 1, !dbg !32
  %23 = load i32, i32* %ip, align 4, !dbg !33
  %const_mat = add i32 %const, 34, !dbg !33
  %24 = icmp ne i32 %23, %const_mat, !dbg !33
  br i1 %24, label %then4, label %if.end6, !dbg !33

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !34
  %25 = load i32, i32* %err, align 4, !dbg !34
  br label %if.end6, !dbg !34

if.end6:                                          ; preds = %if.end3, %then4
  %26 = load i8, i8* %byte, align 1, !dbg !35
  %27 = zext i8 %26 to i32, !dbg !35
  %28 = icmp ne i32 %27, 86, !dbg !35
  br i1 %28, label %then7, label %if.end9, !dbg !35

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !36
  %29 = load i32, i32* %err, align 4, !dbg !36
  br label %if.end9, !dbg !36

if.end9:                                          ; preds = %if.end6, %then7
  %30 = bitcast %union.IPv4* %ipv4 to i32*, !dbg !37
  store i32 -1, i32* %30, align 4, !dbg !37
  %31 = load i32, i32* %30, align 4, !dbg !37
  %32 = bitcast %union.IPv4* %ipv4 to i32*, !dbg !38
  %33 = load i32, i32* %32, align 4, !dbg !38
  store i32 %33, i32* %ip, align 4, !dbg !38
  %34 = load i32, i32* %ip, align 4, !dbg !38
  %35 = load i32, i32* %ip, align 4, !dbg !39
  %36 = icmp ne i32 %35, -1, !dbg !39
  br i1 %36, label %then10, label %if.end12, !dbg !39

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !40
  %37 = load i32, i32* %err, align 4, !dbg !40
  br label %if.end12, !dbg !40

if.end12:                                         ; preds = %if.end9, %then10
  %38 = bitcast %union.IPv4* %ipv4 to i8*, !dbg !41
  store i8 0, i8* %38, align 1, !dbg !41
  %39 = load i8, i8* %38, align 1, !dbg !41
  %40 = bitcast %union.IPv4* %ipv4 to i32*, !dbg !42
  %41 = load i32, i32* %40, align 4, !dbg !42
  store i32 %41, i32* %ip, align 4, !dbg !42
  %42 = load i32, i32* %ip, align 4, !dbg !42
  %43 = load i32, i32* %ip, align 4, !dbg !43
  %44 = icmp ne i32 %43, -256, !dbg !43
  br i1 %44, label %then13, label %if.end15, !dbg !43

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !44
  %45 = load i32, i32* %err, align 4, !dbg !44
  br label %if.end15, !dbg !44

if.end15:                                         ; preds = %if.end12, %then13
  %46 = load i32, i32* %err, align 4, !dbg !45
  %47 = icmp eq i32 %46, 0, !dbg !45
  %. = select i1 %47, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @1, i32 0, i32 0), !dbg !46
  %48 = call i32 (i8*, ...) @printf(i8* %.), !dbg !46
  %49 = load i32, i32* %err, align 4, !dbg !47
  ret i32 %49, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "3.union_type.c", directory: "../tests")
!2 = !{i32 7, !"PIC Level", i32 2}
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
