; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [27 x i8] c"35.typedef_builtin.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [27 x i8] c"35.typedef_builtin.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define void @helper(i64 %0, i32 %1, i32* %2) !dbg !2 {
entry:
  %p = alloca i32*, align 8
  %step = alloca i32, align 4
  %nbytes = alloca i64, align 8
  store i64 %0, i64* %nbytes, align 4
  store i32 %1, i32* %step, align 4
  store i32* %2, i32** %p, align 8
  %3 = load i32*, i32** %p, align 8, !dbg !10
  %4 = load i64, i64* %nbytes, align 4, !dbg !10
  %5 = load i32, i32* %step, align 4, !dbg !10
  %6 = zext i32 %5 to i64, !dbg !10
  %7 = add i64 %4, %6, !dbg !10
  %8 = trunc i64 %7 to i32, !dbg !10
  store i32 %8, i32* %3, align 4, !dbg !10
  %9 = load i32, i32* %3, align 4, !dbg !10
  ret void, !dbg !10
}

define i32 @main() !dbg !11 {
entry:
  %result = alloca i32, align 4
  %p = alloca i32*, align 8
  %x = alloca i32, align 4
  %c = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !14
  store i32 7, i32* %c, align 4, !dbg !15
  store i32 10, i32* %x, align 4, !dbg !16
  store i32* %x, i32** %p, align 8, !dbg !17
  %0 = load i32, i32* %c, align 4, !dbg !18
  %1 = load i32*, i32** %p, align 8, !dbg !18
  call void @helper(i64 42, i32 %0, i32* %1), !dbg !18
  %2 = load i32, i32* %c, align 4, !dbg !19
  %3 = icmp ne i32 %2, 7, !dbg !19
  br i1 %3, label %then, label %if.end, !dbg !19

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !20
  %4 = load i32, i32* %err, align 4, !dbg !20
  br label %if.end, !dbg !20

if.end:                                           ; preds = %entry, %then
  %5 = load i32, i32* %x, align 4, !dbg !21
  %6 = icmp ne i32 %5, 49, !dbg !21
  br i1 %6, label %then1, label %if.end3, !dbg !21

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !22
  %7 = load i32, i32* %err, align 4, !dbg !22
  br label %if.end3, !dbg !22

if.end3:                                          ; preds = %if.end, %then1
  %8 = load i32*, i32** %p, align 8, !dbg !23
  %9 = load i32, i32* %8, align 4, !dbg !23
  store i32 %9, i32* %result, align 4, !dbg !23
  %10 = load i32, i32* %result, align 4, !dbg !24
  %11 = icmp ne i32 %10, 49, !dbg !24
  br i1 %11, label %then4, label %if.end6, !dbg !24

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !25
  %12 = load i32, i32* %err, align 4, !dbg !25
  br label %if.end6, !dbg !25

if.end6:                                          ; preds = %if.end3, %then4
  %13 = load i32, i32* %err, align 4, !dbg !26
  %14 = icmp eq i32 %13, 0, !dbg !26
  %. = select i1 %14, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), !dbg !27
  %15 = call i32 (i8*, ...) @printf(i8* %.), !dbg !27
  %16 = load i32, i32* %err, align 4, !dbg !28
  ret i32 %16, !dbg !28
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "35.typedef_builtin.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "helper", linkageName: "helper", scope: null, file: !1, line: 7, type: !3, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !9)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6, !7, !8}
!5 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!6 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!9 = !{}
!10 = !DILocation(line: 8, column: 3, scope: !2)
!11 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 11, type: !12, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !9)
!12 = !DISubroutineType(types: !13)
!13 = !{!7}
!14 = !DILocation(line: 12, column: 3, scope: !11)
!15 = !DILocation(line: 13, column: 3, scope: !11)
!16 = !DILocation(line: 14, column: 3, scope: !11)
!17 = !DILocation(line: 15, column: 3, scope: !11)
!18 = !DILocation(line: 17, column: 3, scope: !11)
!19 = !DILocation(line: 19, column: 3, scope: !11)
!20 = !DILocation(line: 19, column: 15, scope: !11)
!21 = !DILocation(line: 20, column: 3, scope: !11)
!22 = !DILocation(line: 20, column: 16, scope: !11)
!23 = !DILocation(line: 21, column: 3, scope: !11)
!24 = !DILocation(line: 22, column: 3, scope: !11)
!25 = !DILocation(line: 22, column: 21, scope: !11)
!26 = !DILocation(line: 24, column: 3, scope: !11)
!27 = !DILocation(line: 0, scope: !11)
!28 = !DILocation(line: 29, column: 3, scope: !11)
