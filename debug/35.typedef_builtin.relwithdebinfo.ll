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
  store i64 %0, i64* %nbytes, align 4, !dbg !10
  store i32 %1, i32* %step, align 4, !dbg !10
  store i32* %2, i32** %p, align 8, !dbg !10
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
  store i32 7, i32* %c, align 4, !dbg !14
  store i32 10, i32* %x, align 4, !dbg !14
  store i32* %x, i32** %p, align 8, !dbg !14
  %0 = load i32, i32* %c, align 4, !dbg !14
  %1 = load i32*, i32** %p, align 8, !dbg !14
  call void @helper(i64 42, i32 %0, i32* %1), !dbg !14
  %2 = load i32, i32* %c, align 4, !dbg !14
  %3 = icmp ne i32 %2, 7, !dbg !14
  br i1 %3, label %then, label %if.end, !dbg !14

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !14
  %4 = load i32, i32* %err, align 4, !dbg !14
  br label %if.end, !dbg !14

if.end:                                           ; preds = %entry, %then
  %5 = load i32, i32* %x, align 4, !dbg !14
  %6 = icmp ne i32 %5, 49, !dbg !14
  br i1 %6, label %then1, label %if.end3, !dbg !14

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !14
  %7 = load i32, i32* %err, align 4, !dbg !14
  br label %if.end3, !dbg !14

if.end3:                                          ; preds = %if.end, %then1
  %8 = load i32*, i32** %p, align 8, !dbg !14
  %9 = load i32, i32* %8, align 4, !dbg !14
  store i32 %9, i32* %result, align 4, !dbg !14
  %10 = load i32, i32* %result, align 4, !dbg !14
  %11 = icmp ne i32 %10, 49, !dbg !14
  br i1 %11, label %then4, label %if.end6, !dbg !14

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !14
  %12 = load i32, i32* %err, align 4, !dbg !14
  br label %if.end6, !dbg !14

if.end6:                                          ; preds = %if.end3, %then4
  %13 = load i32, i32* %err, align 4, !dbg !14
  %14 = icmp eq i32 %13, 0, !dbg !14
  %. = select i1 %14, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), !dbg !14
  %15 = call i32 (i8*, ...) @printf(i8* %.), !dbg !14
  %16 = load i32, i32* %err, align 4, !dbg !14
  ret i32 %16, !dbg !14
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "35.typedef_builtin.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "helper", linkageName: "helper", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !9)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6, !7, !8}
!5 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!6 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!9 = !{}
!10 = !DILocation(line: 1, column: 1, scope: !2)
!11 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !12, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !9)
!12 = !DISubroutineType(types: !13)
!13 = !{!7}
!14 = !DILocation(line: 1, column: 1, scope: !11)
