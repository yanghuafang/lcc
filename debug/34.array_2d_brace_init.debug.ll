; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.6.0"

@ga = global [2 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 4, i32 5, i32 6]]
@gb = global [2 x [3 x i32]] [[3 x i32] [i32 0, i32 1, i32 2], [3 x i32] [i32 3, i32 4, i32 5]]
@gc = global [2 x [2 x i32]] [[2 x i32] [i32 10, i32 11], [2 x i32] [i32 20, i32 0]]
@gd = global [2 x [2 x i32]] zeroinitializer
@0 = private unnamed_addr constant [31 x i8] c"34.array_2d_brace_init.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"34.array_2d_brace_init.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %ld = alloca [2 x [2 x i32]], align 4
  call void @llvm.dbg.declare(metadata [2 x [2 x i32]]* %ld, metadata !7, metadata !DIExpression()), !dbg !12
  %lc = alloca [2 x [3 x i32]], align 4
  call void @llvm.dbg.declare(metadata [2 x [3 x i32]]* %lc, metadata !13, metadata !DIExpression()), !dbg !18
  %lb = alloca [2 x [3 x i32]], align 4
  call void @llvm.dbg.declare(metadata [2 x [3 x i32]]* %lb, metadata !19, metadata !DIExpression()), !dbg !20
  %la = alloca [2 x [3 x i32]], align 4
  call void @llvm.dbg.declare(metadata [2 x [3 x i32]]* %la, metadata !21, metadata !DIExpression()), !dbg !22
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 0, i32* %err, align 4, !dbg !24
  %0 = bitcast [2 x [3 x i32]]* %la to i32*, !dbg !22
  store i32 1, i32* %0, align 4, !dbg !22
  %1 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 0, i32 1, !dbg !22
  store i32 2, i32* %1, align 4, !dbg !22
  %2 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 0, i32 2, !dbg !22
  store i32 0, i32* %2, align 4, !dbg !22
  %3 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 1, i32 0, !dbg !22
  store i32 3, i32* %3, align 4, !dbg !22
  %4 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 1, i32 1, !dbg !22
  store i32 0, i32* %4, align 4, !dbg !22
  %5 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 1, i32 2, !dbg !22
  store i32 0, i32* %5, align 4, !dbg !22
  %6 = bitcast [2 x [3 x i32]]* %lb to i32*, !dbg !20
  store i32 7, i32* %6, align 4, !dbg !20
  %7 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 0, i32 1, !dbg !20
  store i32 8, i32* %7, align 4, !dbg !20
  %8 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 0, i32 2, !dbg !20
  store i32 9, i32* %8, align 4, !dbg !20
  %9 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 1, i32 0, !dbg !20
  store i32 10, i32* %9, align 4, !dbg !20
  %10 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 1, i32 1, !dbg !20
  store i32 11, i32* %10, align 4, !dbg !20
  %11 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 1, i32 2, !dbg !20
  store i32 12, i32* %11, align 4, !dbg !20
  %12 = bitcast [2 x [3 x i32]]* %lc to i32*, !dbg !18
  store i32 1, i32* %12, align 4, !dbg !18
  %13 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 0, i32 1, !dbg !18
  store i32 2, i32* %13, align 4, !dbg !18
  %14 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 0, i32 2, !dbg !18
  store i32 3, i32* %14, align 4, !dbg !18
  %15 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 1, i32 0, !dbg !18
  store i32 4, i32* %15, align 4, !dbg !18
  %16 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 1, i32 1, !dbg !18
  store i32 0, i32* %16, align 4, !dbg !18
  %17 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 1, i32 2, !dbg !18
  store i32 0, i32* %17, align 4, !dbg !18
  %18 = bitcast [2 x [2 x i32]]* %ld to i32*, !dbg !12
  store i32 0, i32* %18, align 4, !dbg !12
  %19 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %ld, i32 0, i32 0, i32 1, !dbg !12
  store i32 0, i32* %19, align 4, !dbg !12
  %20 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %ld, i32 0, i32 1, i32 0, !dbg !12
  store i32 0, i32* %20, align 4, !dbg !12
  %21 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %ld, i32 0, i32 1, i32 1, !dbg !12
  store i32 0, i32* %21, align 4, !dbg !12
  %22 = bitcast [2 x [3 x i32]]* %la to [3 x i32]*, !dbg !25
  %23 = bitcast [3 x i32]* %22 to [3 x i32]*, !dbg !25
  %24 = bitcast [3 x i32]* %23 to i32*, !dbg !25
  %25 = bitcast i32* %24 to i32*, !dbg !25
  %26 = load i32, i32* %25, align 4, !dbg !25
  %27 = icmp ne i32 %26, 1, !dbg !25
  br i1 %27, label %then, label %if.end, !dbg !25

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !26
  %28 = load i32, i32* %err, align 4, !dbg !26
  br label %if.end, !dbg !26

if.end:                                           ; preds = %entry, %then
  %29 = bitcast [2 x [3 x i32]]* %la to [3 x i32]*, !dbg !27
  %30 = bitcast [3 x i32]* %29 to [3 x i32]*, !dbg !27
  %31 = bitcast [3 x i32]* %30 to i32*, !dbg !27
  %32 = getelementptr i32, i32* %31, i32 2, !dbg !27
  %33 = load i32, i32* %32, align 4, !dbg !27
  %34 = icmp ne i32 %33, 0, !dbg !27
  br i1 %34, label %then1, label %if.end3, !dbg !27

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !28
  %35 = load i32, i32* %err, align 4, !dbg !28
  br label %if.end3, !dbg !28

if.end3:                                          ; preds = %if.end, %then1
  %36 = bitcast [2 x [3 x i32]]* %la to [3 x i32]*, !dbg !29
  %37 = getelementptr [3 x i32], [3 x i32]* %36, i32 1, !dbg !29
  %38 = bitcast [3 x i32]* %37 to i32*, !dbg !29
  %39 = bitcast i32* %38 to i32*, !dbg !29
  %40 = load i32, i32* %39, align 4, !dbg !29
  %41 = icmp ne i32 %40, 3, !dbg !29
  br i1 %41, label %then4, label %if.end6, !dbg !29

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !30
  %42 = load i32, i32* %err, align 4, !dbg !30
  br label %if.end6, !dbg !30

if.end6:                                          ; preds = %if.end3, %then4
  %43 = bitcast [2 x [3 x i32]]* %la to [3 x i32]*, !dbg !31
  %44 = getelementptr [3 x i32], [3 x i32]* %43, i32 1, !dbg !31
  %45 = bitcast [3 x i32]* %44 to i32*, !dbg !31
  %46 = getelementptr i32, i32* %45, i32 2, !dbg !31
  %47 = load i32, i32* %46, align 4, !dbg !31
  %48 = icmp ne i32 %47, 0, !dbg !31
  br i1 %48, label %then7, label %if.end9, !dbg !31

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !32
  %49 = load i32, i32* %err, align 4, !dbg !32
  br label %if.end9, !dbg !32

if.end9:                                          ; preds = %if.end6, %then7
  %50 = bitcast [2 x [3 x i32]]* %lb to [3 x i32]*, !dbg !33
  %51 = bitcast [3 x i32]* %50 to [3 x i32]*, !dbg !33
  %52 = bitcast [3 x i32]* %51 to i32*, !dbg !33
  %53 = bitcast i32* %52 to i32*, !dbg !33
  %54 = load i32, i32* %53, align 4, !dbg !33
  %55 = icmp ne i32 %54, 7, !dbg !33
  br i1 %55, label %then10, label %if.end12, !dbg !33

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !34
  %56 = load i32, i32* %err, align 4, !dbg !34
  br label %if.end12, !dbg !34

if.end12:                                         ; preds = %if.end9, %then10
  %57 = bitcast [2 x [3 x i32]]* %lb to [3 x i32]*, !dbg !35
  %58 = getelementptr [3 x i32], [3 x i32]* %57, i32 1, !dbg !35
  %59 = bitcast [3 x i32]* %58 to i32*, !dbg !35
  %60 = getelementptr i32, i32* %59, i32 2, !dbg !35
  %61 = load i32, i32* %60, align 4, !dbg !35
  %62 = icmp ne i32 %61, 12, !dbg !35
  br i1 %62, label %then13, label %if.end15, !dbg !35

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !36
  %63 = load i32, i32* %err, align 4, !dbg !36
  br label %if.end15, !dbg !36

if.end15:                                         ; preds = %if.end12, %then13
  %64 = bitcast [2 x [3 x i32]]* %lc to [3 x i32]*, !dbg !37
  %65 = bitcast [3 x i32]* %64 to [3 x i32]*, !dbg !37
  %66 = bitcast [3 x i32]* %65 to i32*, !dbg !37
  %67 = getelementptr i32, i32* %66, i32 2, !dbg !37
  %68 = load i32, i32* %67, align 4, !dbg !37
  %69 = icmp ne i32 %68, 3, !dbg !37
  br i1 %69, label %then16, label %if.end18, !dbg !37

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !38
  %70 = load i32, i32* %err, align 4, !dbg !38
  br label %if.end18, !dbg !38

if.end18:                                         ; preds = %if.end15, %then16
  %71 = bitcast [2 x [3 x i32]]* %lc to [3 x i32]*, !dbg !39
  %72 = getelementptr [3 x i32], [3 x i32]* %71, i32 1, !dbg !39
  %73 = bitcast [3 x i32]* %72 to i32*, !dbg !39
  %74 = bitcast i32* %73 to i32*, !dbg !39
  %75 = load i32, i32* %74, align 4, !dbg !39
  %76 = icmp ne i32 %75, 4, !dbg !39
  br i1 %76, label %then19, label %if.end21, !dbg !39

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !40
  %77 = load i32, i32* %err, align 4, !dbg !40
  br label %if.end21, !dbg !40

if.end21:                                         ; preds = %if.end18, %then19
  %78 = bitcast [2 x [3 x i32]]* %lc to [3 x i32]*, !dbg !41
  %79 = getelementptr [3 x i32], [3 x i32]* %78, i32 1, !dbg !41
  %80 = bitcast [3 x i32]* %79 to i32*, !dbg !41
  %81 = getelementptr i32, i32* %80, i32 2, !dbg !41
  %82 = load i32, i32* %81, align 4, !dbg !41
  %83 = icmp ne i32 %82, 0, !dbg !41
  br i1 %83, label %then22, label %if.end24, !dbg !41

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !42
  %84 = load i32, i32* %err, align 4, !dbg !42
  br label %if.end24, !dbg !42

if.end24:                                         ; preds = %if.end21, %then22
  %85 = bitcast [2 x [2 x i32]]* %ld to [2 x i32]*, !dbg !43
  %86 = bitcast [2 x i32]* %85 to [2 x i32]*, !dbg !43
  %87 = bitcast [2 x i32]* %86 to i32*, !dbg !43
  %88 = bitcast i32* %87 to i32*, !dbg !43
  %89 = load i32, i32* %88, align 4, !dbg !43
  %90 = icmp ne i32 %89, 0, !dbg !43
  br i1 %90, label %then25, label %if.end27, !dbg !43

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !44
  %91 = load i32, i32* %err, align 4, !dbg !44
  br label %if.end27, !dbg !44

if.end27:                                         ; preds = %if.end24, %then25
  %92 = bitcast [2 x [2 x i32]]* %ld to [2 x i32]*, !dbg !45
  %93 = bitcast [2 x i32]* %92 to [2 x i32]*, !dbg !45
  %94 = bitcast [2 x i32]* %93 to i32*, !dbg !45
  %95 = getelementptr i32, i32* %94, i32 1, !dbg !45
  %96 = load i32, i32* %95, align 4, !dbg !45
  %97 = icmp ne i32 %96, 0, !dbg !45
  br i1 %97, label %then28, label %if.end30, !dbg !45

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !46
  %98 = load i32, i32* %err, align 4, !dbg !46
  br label %if.end30, !dbg !46

if.end30:                                         ; preds = %if.end27, %then28
  %99 = bitcast [2 x [2 x i32]]* %ld to [2 x i32]*, !dbg !47
  %100 = getelementptr [2 x i32], [2 x i32]* %99, i32 1, !dbg !47
  %101 = bitcast [2 x i32]* %100 to i32*, !dbg !47
  %102 = bitcast i32* %101 to i32*, !dbg !47
  %103 = load i32, i32* %102, align 4, !dbg !47
  %104 = icmp ne i32 %103, 0, !dbg !47
  br i1 %104, label %then31, label %if.end33, !dbg !47

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !48
  %105 = load i32, i32* %err, align 4, !dbg !48
  br label %if.end33, !dbg !48

if.end33:                                         ; preds = %if.end30, %then31
  %106 = bitcast [2 x [2 x i32]]* %ld to [2 x i32]*, !dbg !49
  %107 = getelementptr [2 x i32], [2 x i32]* %106, i32 1, !dbg !49
  %108 = bitcast [2 x i32]* %107 to i32*, !dbg !49
  %109 = getelementptr i32, i32* %108, i32 1, !dbg !49
  %110 = load i32, i32* %109, align 4, !dbg !49
  %111 = icmp ne i32 %110, 0, !dbg !49
  br i1 %111, label %then34, label %if.end36, !dbg !49

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4, !dbg !50
  %112 = load i32, i32* %err, align 4, !dbg !50
  br label %if.end36, !dbg !50

if.end36:                                         ; preds = %if.end33, %then34
  %113 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @ga, i32 0, i32 0, i32 0), align 4, !dbg !51
  %114 = icmp ne i32 %113, 1, !dbg !51
  br i1 %114, label %then37, label %if.end39, !dbg !51

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4, !dbg !52
  %115 = load i32, i32* %err, align 4, !dbg !52
  br label %if.end39, !dbg !52

if.end39:                                         ; preds = %if.end36, %then37
  %116 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @ga, i32 0, i32 1, i32 2), align 4, !dbg !53
  %117 = icmp ne i32 %116, 6, !dbg !53
  br i1 %117, label %then40, label %if.end42, !dbg !53

then40:                                           ; preds = %if.end39
  store i32 1, i32* %err, align 4, !dbg !54
  %118 = load i32, i32* %err, align 4, !dbg !54
  br label %if.end42, !dbg !54

if.end42:                                         ; preds = %if.end39, %then40
  %119 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @gb, i32 0, i32 0, i32 1), align 4, !dbg !55
  %120 = icmp ne i32 %119, 1, !dbg !55
  br i1 %120, label %then43, label %if.end45, !dbg !55

then43:                                           ; preds = %if.end42
  store i32 1, i32* %err, align 4, !dbg !56
  %121 = load i32, i32* %err, align 4, !dbg !56
  br label %if.end45, !dbg !56

if.end45:                                         ; preds = %if.end42, %then43
  %122 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @gb, i32 0, i32 1, i32 0), align 4, !dbg !57
  %123 = icmp ne i32 %122, 3, !dbg !57
  br i1 %123, label %then46, label %if.end48, !dbg !57

then46:                                           ; preds = %if.end45
  store i32 1, i32* %err, align 4, !dbg !58
  %124 = load i32, i32* %err, align 4, !dbg !58
  br label %if.end48, !dbg !58

if.end48:                                         ; preds = %if.end45, %then46
  %125 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gc, i32 0, i32 0, i32 1), align 4, !dbg !59
  %126 = icmp ne i32 %125, 11, !dbg !59
  br i1 %126, label %then49, label %if.end51, !dbg !59

then49:                                           ; preds = %if.end48
  store i32 1, i32* %err, align 4, !dbg !60
  %127 = load i32, i32* %err, align 4, !dbg !60
  br label %if.end51, !dbg !60

if.end51:                                         ; preds = %if.end48, %then49
  %128 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gc, i32 0, i32 1, i32 0), align 4, !dbg !61
  %129 = icmp ne i32 %128, 20, !dbg !61
  br i1 %129, label %then52, label %if.end54, !dbg !61

then52:                                           ; preds = %if.end51
  store i32 1, i32* %err, align 4, !dbg !62
  %130 = load i32, i32* %err, align 4, !dbg !62
  br label %if.end54, !dbg !62

if.end54:                                         ; preds = %if.end51, %then52
  %131 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gc, i32 0, i32 1, i32 1), align 4, !dbg !63
  %132 = icmp ne i32 %131, 0, !dbg !63
  br i1 %132, label %then55, label %if.end57, !dbg !63

then55:                                           ; preds = %if.end54
  store i32 1, i32* %err, align 4, !dbg !64
  %133 = load i32, i32* %err, align 4, !dbg !64
  br label %if.end57, !dbg !64

if.end57:                                         ; preds = %if.end54, %then55
  %134 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gd, i32 0, i32 0, i32 0), align 4, !dbg !65
  %135 = icmp ne i32 %134, 0, !dbg !65
  br i1 %135, label %then58, label %if.end60, !dbg !65

then58:                                           ; preds = %if.end57
  store i32 1, i32* %err, align 4, !dbg !66
  %136 = load i32, i32* %err, align 4, !dbg !66
  br label %if.end60, !dbg !66

if.end60:                                         ; preds = %if.end57, %then58
  %137 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gd, i32 0, i32 0, i32 1), align 4, !dbg !67
  %138 = icmp ne i32 %137, 0, !dbg !67
  br i1 %138, label %then61, label %if.end63, !dbg !67

then61:                                           ; preds = %if.end60
  store i32 1, i32* %err, align 4, !dbg !68
  %139 = load i32, i32* %err, align 4, !dbg !68
  br label %if.end63, !dbg !68

if.end63:                                         ; preds = %if.end60, %then61
  %140 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gd, i32 0, i32 1, i32 0), align 4, !dbg !69
  %141 = icmp ne i32 %140, 0, !dbg !69
  br i1 %141, label %then64, label %if.end66, !dbg !69

then64:                                           ; preds = %if.end63
  store i32 1, i32* %err, align 4, !dbg !70
  %142 = load i32, i32* %err, align 4, !dbg !70
  br label %if.end66, !dbg !70

if.end66:                                         ; preds = %if.end63, %then64
  %143 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gd, i32 0, i32 1, i32 1), align 4, !dbg !71
  %144 = icmp ne i32 %143, 0, !dbg !71
  br i1 %144, label %then67, label %if.end69, !dbg !71

then67:                                           ; preds = %if.end66
  store i32 1, i32* %err, align 4, !dbg !72
  %145 = load i32, i32* %err, align 4, !dbg !72
  br label %if.end69, !dbg !72

if.end69:                                         ; preds = %if.end66, %then67
  %146 = load i32, i32* %err, align 4, !dbg !73
  %147 = icmp eq i32 %146, 0, !dbg !73
  %. = select i1 %147, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @1, i32 0, i32 0), !dbg !74
  %148 = call i32 (i8*, ...) @printf(i8* %.), !dbg !74
  %149 = load i32, i32* %err, align 4, !dbg !75
  ret i32 %149, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "34.array_2d_brace_init.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 12, type: !3, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "ld", scope: !2, file: !1, line: 17, type: !8)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 128, align: 32, elements: !10)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 64, align: 32, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 2, lowerBound: 0)
!12 = !DILocation(line: 17, column: 3, scope: !2)
!13 = !DILocalVariable(name: "lc", scope: !2, file: !1, line: 16, type: !14)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 192, align: 32, elements: !10)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 96, align: 32, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 3, lowerBound: 0)
!18 = !DILocation(line: 16, column: 3, scope: !2)
!19 = !DILocalVariable(name: "lb", scope: !2, file: !1, line: 15, type: !14)
!20 = !DILocation(line: 15, column: 3, scope: !2)
!21 = !DILocalVariable(name: "la", scope: !2, file: !1, line: 14, type: !14)
!22 = !DILocation(line: 14, column: 3, scope: !2)
!23 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 13, type: !5)
!24 = !DILocation(line: 13, column: 3, scope: !2)
!25 = !DILocation(line: 19, column: 3, scope: !2)
!26 = !DILocation(line: 19, column: 22, scope: !2)
!27 = !DILocation(line: 20, column: 3, scope: !2)
!28 = !DILocation(line: 20, column: 22, scope: !2)
!29 = !DILocation(line: 21, column: 3, scope: !2)
!30 = !DILocation(line: 21, column: 22, scope: !2)
!31 = !DILocation(line: 22, column: 3, scope: !2)
!32 = !DILocation(line: 22, column: 22, scope: !2)
!33 = !DILocation(line: 24, column: 3, scope: !2)
!34 = !DILocation(line: 24, column: 22, scope: !2)
!35 = !DILocation(line: 25, column: 3, scope: !2)
!36 = !DILocation(line: 25, column: 23, scope: !2)
!37 = !DILocation(line: 27, column: 3, scope: !2)
!38 = !DILocation(line: 27, column: 22, scope: !2)
!39 = !DILocation(line: 28, column: 3, scope: !2)
!40 = !DILocation(line: 28, column: 22, scope: !2)
!41 = !DILocation(line: 29, column: 3, scope: !2)
!42 = !DILocation(line: 29, column: 22, scope: !2)
!43 = !DILocation(line: 31, column: 3, scope: !2)
!44 = !DILocation(line: 31, column: 22, scope: !2)
!45 = !DILocation(line: 32, column: 3, scope: !2)
!46 = !DILocation(line: 32, column: 22, scope: !2)
!47 = !DILocation(line: 33, column: 3, scope: !2)
!48 = !DILocation(line: 33, column: 22, scope: !2)
!49 = !DILocation(line: 34, column: 3, scope: !2)
!50 = !DILocation(line: 34, column: 22, scope: !2)
!51 = !DILocation(line: 36, column: 3, scope: !2)
!52 = !DILocation(line: 36, column: 22, scope: !2)
!53 = !DILocation(line: 37, column: 3, scope: !2)
!54 = !DILocation(line: 37, column: 22, scope: !2)
!55 = !DILocation(line: 39, column: 3, scope: !2)
!56 = !DILocation(line: 39, column: 22, scope: !2)
!57 = !DILocation(line: 40, column: 3, scope: !2)
!58 = !DILocation(line: 40, column: 22, scope: !2)
!59 = !DILocation(line: 42, column: 3, scope: !2)
!60 = !DILocation(line: 42, column: 23, scope: !2)
!61 = !DILocation(line: 43, column: 3, scope: !2)
!62 = !DILocation(line: 43, column: 23, scope: !2)
!63 = !DILocation(line: 44, column: 3, scope: !2)
!64 = !DILocation(line: 44, column: 22, scope: !2)
!65 = !DILocation(line: 46, column: 3, scope: !2)
!66 = !DILocation(line: 46, column: 22, scope: !2)
!67 = !DILocation(line: 47, column: 3, scope: !2)
!68 = !DILocation(line: 47, column: 22, scope: !2)
!69 = !DILocation(line: 48, column: 3, scope: !2)
!70 = !DILocation(line: 48, column: 22, scope: !2)
!71 = !DILocation(line: 49, column: 3, scope: !2)
!72 = !DILocation(line: 49, column: 22, scope: !2)
!73 = !DILocation(line: 51, column: 3, scope: !2)
!74 = !DILocation(line: 0, scope: !2)
!75 = !DILocation(line: 56, column: 3, scope: !2)
