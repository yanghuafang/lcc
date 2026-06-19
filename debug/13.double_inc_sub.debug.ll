; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [26 x i8] c"13.double_inc_sub.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [26 x i8] c"13.double_inc_sub.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %e = alloca i32, align 4
  %d = alloca i32, align 4
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  store i32 13, i32* %a, align 4, !dbg !7
  %0 = load i32, i32* %a, align 4, !dbg !7
  %1 = add i32 %0, 1, !dbg !7
  store i32 %1, i32* %a, align 4, !dbg !7
  store i32 %0, i32* %b, align 4, !dbg !7
  %2 = load i32, i32* %a, align 4, !dbg !7
  %3 = icmp ne i32 %2, 14, !dbg !7
  br i1 %3, label %then, label %if.end, !dbg !7

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !7
  %4 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end, !dbg !7

if.end:                                           ; preds = %entry, %then
  %5 = load i32, i32* %b, align 4, !dbg !7
  %6 = icmp ne i32 %5, 13, !dbg !7
  br i1 %6, label %then1, label %if.end3, !dbg !7

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !7
  %7 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end3, !dbg !7

if.end3:                                          ; preds = %if.end, %then1
  store i32 13, i32* %a, align 4, !dbg !7
  %8 = load i32, i32* %a, align 4, !dbg !7
  %9 = load i32, i32* %a, align 4, !dbg !7
  %10 = add i32 %9, 1, !dbg !7
  store i32 %10, i32* %a, align 4, !dbg !7
  %11 = load i32, i32* %a, align 4, !dbg !7
  store i32 %11, i32* %c, align 4, !dbg !7
  %12 = load i32, i32* %a, align 4, !dbg !7
  %13 = icmp ne i32 %12, 14, !dbg !7
  br i1 %13, label %then4, label %if.end6, !dbg !7

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !7
  %14 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end6, !dbg !7

if.end6:                                          ; preds = %if.end3, %then4
  %15 = load i32, i32* %c, align 4, !dbg !7
  %16 = icmp ne i32 %15, 14, !dbg !7
  br i1 %16, label %then7, label %if.end9, !dbg !7

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !7
  %17 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end9, !dbg !7

if.end9:                                          ; preds = %if.end6, %then7
  store i32 13, i32* %a, align 4, !dbg !7
  %18 = load i32, i32* %a, align 4, !dbg !7
  %19 = load i32, i32* %a, align 4, !dbg !7
  %20 = sub i32 %19, 1, !dbg !7
  store i32 %20, i32* %a, align 4, !dbg !7
  store i32 %19, i32* %d, align 4, !dbg !7
  %21 = load i32, i32* %a, align 4, !dbg !7
  %22 = icmp ne i32 %21, 12, !dbg !7
  br i1 %22, label %then10, label %if.end12, !dbg !7

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !7
  %23 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end12, !dbg !7

if.end12:                                         ; preds = %if.end9, %then10
  %24 = load i32, i32* %d, align 4, !dbg !7
  %25 = icmp ne i32 %24, 13, !dbg !7
  br i1 %25, label %then13, label %if.end15, !dbg !7

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !7
  %26 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end15, !dbg !7

if.end15:                                         ; preds = %if.end12, %then13
  store i32 13, i32* %a, align 4, !dbg !7
  %27 = load i32, i32* %a, align 4, !dbg !7
  %28 = load i32, i32* %a, align 4, !dbg !7
  %29 = sub i32 %28, 1, !dbg !7
  store i32 %29, i32* %a, align 4, !dbg !7
  %30 = load i32, i32* %a, align 4, !dbg !7
  store i32 %30, i32* %e, align 4, !dbg !7
  %31 = load i32, i32* %a, align 4, !dbg !7
  %32 = icmp ne i32 %31, 12, !dbg !7
  br i1 %32, label %then16, label %if.end18, !dbg !7

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !7
  %33 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end18, !dbg !7

if.end18:                                         ; preds = %if.end15, %then16
  %34 = load i32, i32* %e, align 4, !dbg !7
  %35 = icmp ne i32 %34, 12, !dbg !7
  br i1 %35, label %then19, label %if.end21, !dbg !7

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !7
  %36 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end21, !dbg !7

if.end21:                                         ; preds = %if.end18, %then19
  store i32 0, i32* %a, align 4, !dbg !7
  %37 = load i32, i32* %a, align 4, !dbg !7
  %38 = load i32, i32* %a, align 4, !dbg !7
  %39 = add i32 %38, 1, !dbg !7
  store i32 %39, i32* %a, align 4, !dbg !7
  %40 = load i32, i32* %a, align 4, !dbg !7
  %41 = icmp ne i32 %40, 1, !dbg !7
  br i1 %41, label %then22, label %if.end24, !dbg !7

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !7
  %42 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end24, !dbg !7

if.end24:                                         ; preds = %if.end21, %then22
  %43 = load i32, i32* %a, align 4, !dbg !7
  %44 = sub i32 %43, 1, !dbg !7
  store i32 %44, i32* %a, align 4, !dbg !7
  %45 = load i32, i32* %a, align 4, !dbg !7
  %46 = icmp ne i32 %45, 0, !dbg !7
  br i1 %46, label %then25, label %if.end27, !dbg !7

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !7
  %47 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end27, !dbg !7

if.end27:                                         ; preds = %if.end24, %then25
  %48 = load i32, i32* %err, align 4, !dbg !7
  %49 = icmp eq i32 %48, 0, !dbg !7
  %. = select i1 %49, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @1, i32 0, i32 0), !dbg !7
  %50 = call i32 (i8*, ...) @printf(i8* %.), !dbg !7
  %51 = load i32, i32* %err, align 4, !dbg !7
  ret i32 %51, !dbg !7
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "13.double_inc_sub.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
