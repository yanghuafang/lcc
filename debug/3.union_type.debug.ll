; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%union.IPv4 = type { i32 }

@0 = private unnamed_addr constant [21 x i8] c"3.union_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [21 x i8] c"3.union_type.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %const = bitcast i32 313249076 to i32
  %byte = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %byte, metadata !7, metadata !DIExpression()), !dbg !9
  %ip = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %ip, metadata !10, metadata !DIExpression()), !dbg !12
  %ipv4 = alloca %union.IPv4, align 8
  call void @llvm.dbg.declare(metadata %union.IPv4* %ipv4, metadata !13, metadata !DIExpression()), !dbg !15
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 0, i32* %err, align 4, !dbg !17
  %0 = bitcast %union.IPv4* %ipv4 to i32*, !dbg !18
  store i32 %const, i32* %0, align 4, !dbg !18
  %1 = load i32, i32* %0, align 4, !dbg !18
  %2 = bitcast %union.IPv4* %ipv4 to i32*, !dbg !19
  %3 = load i32, i32* %2, align 4, !dbg !19
  store i32 %3, i32* %ip, align 4, !dbg !19
  %4 = load i32, i32* %ip, align 4, !dbg !19
  %5 = bitcast %union.IPv4* %ipv4 to i8*, !dbg !20
  %6 = load i8, i8* %5, align 1, !dbg !20
  store i8 %6, i8* %byte, align 1, !dbg !20
  %7 = load i8, i8* %byte, align 1, !dbg !20
  %8 = load i32, i32* %ip, align 4, !dbg !21
  %9 = icmp ne i32 %8, %const, !dbg !21
  br i1 %9, label %then, label %if.end, !dbg !21

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !22
  %10 = load i32, i32* %err, align 4, !dbg !22
  br label %if.end, !dbg !22

if.end:                                           ; preds = %entry, %then
  %11 = load i8, i8* %byte, align 1, !dbg !23
  %12 = zext i8 %11 to i32, !dbg !23
  %13 = icmp ne i32 %12, 52, !dbg !23
  br i1 %13, label %then1, label %if.end3, !dbg !23

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !24
  %14 = load i32, i32* %err, align 4, !dbg !24
  br label %if.end3, !dbg !24

if.end3:                                          ; preds = %if.end, %then1
  %15 = bitcast %union.IPv4* %ipv4 to i8*, !dbg !25
  store i8 86, i8* %15, align 1, !dbg !25
  %16 = load i8, i8* %15, align 1, !dbg !25
  %17 = bitcast %union.IPv4* %ipv4 to i32*, !dbg !26
  %18 = load i32, i32* %17, align 4, !dbg !26
  store i32 %18, i32* %ip, align 4, !dbg !26
  %19 = load i32, i32* %ip, align 4, !dbg !26
  %20 = bitcast %union.IPv4* %ipv4 to i8*, !dbg !27
  %21 = load i8, i8* %20, align 1, !dbg !27
  store i8 %21, i8* %byte, align 1, !dbg !27
  %22 = load i8, i8* %byte, align 1, !dbg !27
  %23 = load i32, i32* %ip, align 4, !dbg !28
  %const_mat = add i32 %const, 34, !dbg !28
  %24 = icmp ne i32 %23, %const_mat, !dbg !28
  br i1 %24, label %then4, label %if.end6, !dbg !28

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !29
  %25 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end6, !dbg !29

if.end6:                                          ; preds = %if.end3, %then4
  %26 = load i8, i8* %byte, align 1, !dbg !30
  %27 = zext i8 %26 to i32, !dbg !30
  %28 = icmp ne i32 %27, 86, !dbg !30
  br i1 %28, label %then7, label %if.end9, !dbg !30

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !31
  %29 = load i32, i32* %err, align 4, !dbg !31
  br label %if.end9, !dbg !31

if.end9:                                          ; preds = %if.end6, %then7
  %30 = bitcast %union.IPv4* %ipv4 to i32*, !dbg !32
  store i32 -1, i32* %30, align 4, !dbg !32
  %31 = load i32, i32* %30, align 4, !dbg !32
  %32 = bitcast %union.IPv4* %ipv4 to i32*, !dbg !33
  %33 = load i32, i32* %32, align 4, !dbg !33
  store i32 %33, i32* %ip, align 4, !dbg !33
  %34 = load i32, i32* %ip, align 4, !dbg !33
  %35 = load i32, i32* %ip, align 4, !dbg !34
  %36 = icmp ne i32 %35, -1, !dbg !34
  br i1 %36, label %then10, label %if.end12, !dbg !34

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !35
  %37 = load i32, i32* %err, align 4, !dbg !35
  br label %if.end12, !dbg !35

if.end12:                                         ; preds = %if.end9, %then10
  %38 = bitcast %union.IPv4* %ipv4 to i8*, !dbg !36
  store i8 0, i8* %38, align 1, !dbg !36
  %39 = load i8, i8* %38, align 1, !dbg !36
  %40 = bitcast %union.IPv4* %ipv4 to i32*, !dbg !37
  %41 = load i32, i32* %40, align 4, !dbg !37
  store i32 %41, i32* %ip, align 4, !dbg !37
  %42 = load i32, i32* %ip, align 4, !dbg !37
  %43 = load i32, i32* %ip, align 4, !dbg !38
  %44 = icmp ne i32 %43, -256, !dbg !38
  br i1 %44, label %then13, label %if.end15, !dbg !38

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !39
  %45 = load i32, i32* %err, align 4, !dbg !39
  br label %if.end15, !dbg !39

if.end15:                                         ; preds = %if.end12, %then13
  %46 = load i32, i32* %err, align 4, !dbg !40
  %47 = icmp eq i32 %46, 0, !dbg !40
  %. = select i1 %47, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @1, i32 0, i32 0), !dbg !41
  %48 = call i32 (i8*, ...) @printf(i8* %.), !dbg !41
  %49 = load i32, i32* %err, align 4, !dbg !42
  ret i32 %49, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

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
!14 = !DIBasicType(name: "union.IPv4", size: 32, encoding: DW_ATE_unsigned)
!15 = !DILocation(line: 10, column: 3, scope: !2)
!16 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 9, type: !5)
!17 = !DILocation(line: 9, column: 3, scope: !2)
!18 = !DILocation(line: 14, column: 3, scope: !2)
!19 = !DILocation(line: 15, column: 3, scope: !2)
!20 = !DILocation(line: 16, column: 3, scope: !2)
!21 = !DILocation(line: 17, column: 3, scope: !2)
!22 = !DILocation(line: 17, column: 25, scope: !2)
!23 = !DILocation(line: 18, column: 3, scope: !2)
!24 = !DILocation(line: 18, column: 21, scope: !2)
!25 = !DILocation(line: 20, column: 3, scope: !2)
!26 = !DILocation(line: 21, column: 3, scope: !2)
!27 = !DILocation(line: 22, column: 3, scope: !2)
!28 = !DILocation(line: 23, column: 3, scope: !2)
!29 = !DILocation(line: 23, column: 25, scope: !2)
!30 = !DILocation(line: 24, column: 3, scope: !2)
!31 = !DILocation(line: 24, column: 21, scope: !2)
!32 = !DILocation(line: 26, column: 3, scope: !2)
!33 = !DILocation(line: 27, column: 3, scope: !2)
!34 = !DILocation(line: 28, column: 3, scope: !2)
!35 = !DILocation(line: 28, column: 25, scope: !2)
!36 = !DILocation(line: 30, column: 3, scope: !2)
!37 = !DILocation(line: 31, column: 3, scope: !2)
!38 = !DILocation(line: 32, column: 3, scope: !2)
!39 = !DILocation(line: 32, column: 25, scope: !2)
!40 = !DILocation(line: 34, column: 3, scope: !2)
!41 = !DILocation(line: 0, scope: !2)
!42 = !DILocation(line: 39, column: 3, scope: !2)
