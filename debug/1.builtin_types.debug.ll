; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [24 x i8] c"1.builtin_types.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"1.builtin_types.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %const30 = bitcast i64 -1234567890 to i64
  %const29 = bitcast i64 9876043210 to i64
  %const28 = bitcast i32 -12345678 to i32
  %const = bitcast i32 180150000 to i32
  %bf = alloca i1, align 1
  %bt = alloca i1, align 1
  %db = alloca double, align 8
  %fl = alloca float, align 4
  %uln = alloca i64, align 8
  %uint = alloca i32, align 4
  %uch = alloca i8, align 1
  %ln = alloca i64, align 8
  %in = alloca i32, align 4
  %sh = alloca i16, align 2
  %ch = alloca i8, align 1
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  store i8 65, i8* %ch, align 1, !dbg !7
  store i16 -1024, i16* %sh, align 2, !dbg !7
  store i32 %const28, i32* %in, align 4, !dbg !7
  store i64 %const30, i64* %ln, align 4, !dbg !7
  store i8 -6, i8* %uch, align 1, !dbg !7
  store i32 %const, i32* %uint, align 4, !dbg !7
  store i64 %const29, i64* %uln, align 4, !dbg !7
  store float 0x400921FB40000000, float* %fl, align 4, !dbg !7
  store double 0x400921FB54442D11, double* %db, align 8, !dbg !7
  store i1 true, i1* %bt, align 1, !dbg !7
  store i1 false, i1* %bf, align 1, !dbg !7
  %0 = load i8, i8* %ch, align 1, !dbg !7
  %1 = sext i8 %0 to i32, !dbg !7
  %2 = icmp ne i32 %1, 65, !dbg !7
  br i1 %2, label %then, label %if.end, !dbg !7

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !7
  %3 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end, !dbg !7

if.end:                                           ; preds = %entry, %then
  %4 = load i16, i16* %sh, align 2, !dbg !7
  %5 = sext i16 %4 to i32, !dbg !7
  %6 = icmp ne i32 %5, -1024, !dbg !7
  br i1 %6, label %then1, label %if.end3, !dbg !7

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !7
  %7 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end3, !dbg !7

if.end3:                                          ; preds = %if.end, %then1
  %8 = load i32, i32* %in, align 4, !dbg !7
  %9 = icmp ne i32 %8, %const28, !dbg !7
  br i1 %9, label %then4, label %if.end6, !dbg !7

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !7
  %10 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end6, !dbg !7

if.end6:                                          ; preds = %if.end3, %then4
  %11 = load i64, i64* %ln, align 4, !dbg !7
  %12 = icmp ne i64 %11, %const30, !dbg !7
  br i1 %12, label %then7, label %if.end9, !dbg !7

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !7
  %13 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end9, !dbg !7

if.end9:                                          ; preds = %if.end6, %then7
  %14 = load i8, i8* %uch, align 1, !dbg !7
  %15 = zext i8 %14 to i32, !dbg !7
  %16 = icmp ne i32 %15, 250, !dbg !7
  br i1 %16, label %then10, label %if.end12, !dbg !7

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !7
  %17 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end12, !dbg !7

if.end12:                                         ; preds = %if.end9, %then10
  %18 = load i32, i32* %uint, align 4, !dbg !7
  %19 = icmp ne i32 %18, %const, !dbg !7
  br i1 %19, label %then13, label %if.end15, !dbg !7

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !7
  %20 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end15, !dbg !7

if.end15:                                         ; preds = %if.end12, %then13
  %21 = load i64, i64* %uln, align 4, !dbg !7
  %22 = icmp ne i64 %21, %const29, !dbg !7
  br i1 %22, label %then16, label %if.end18, !dbg !7

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !7
  %23 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end18, !dbg !7

if.end18:                                         ; preds = %if.end15, %then16
  %24 = load i1, i1* %bt, align 1, !dbg !7
  %25 = zext i1 %24 to i32, !dbg !7
  %26 = icmp ne i32 %25, 1, !dbg !7
  br i1 %26, label %then19, label %if.end21, !dbg !7

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !7
  %27 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end21, !dbg !7

if.end21:                                         ; preds = %if.end18, %then19
  %28 = load i1, i1* %bf, align 1, !dbg !7
  %29 = zext i1 %28 to i32, !dbg !7
  %30 = icmp ne i32 %29, 0, !dbg !7
  br i1 %30, label %then22, label %if.end24, !dbg !7

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !7
  %31 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end24, !dbg !7

if.end24:                                         ; preds = %if.end21, %then22
  %32 = load i32, i32* %err, align 4, !dbg !7
  %33 = icmp eq i32 %32, 0, !dbg !7
  %. = select i1 %33, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0), !dbg !7
  %34 = call i32 (i8*, ...) @printf(i8* %.), !dbg !7
  %35 = load i32, i32* %err, align 4, !dbg !7
  ret i32 %35, !dbg !7
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "1.builtin_types.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
