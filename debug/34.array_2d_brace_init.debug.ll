; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@ga = global [2 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 4, i32 5, i32 6]]
@gb = global [2 x [3 x i32]] [[3 x i32] [i32 0, i32 1, i32 2], [3 x i32] [i32 3, i32 4, i32 5]]
@gc = global [2 x [2 x i32]] [[2 x i32] [i32 10, i32 11], [2 x i32] [i32 20, i32 0]]
@gd = global [2 x [2 x i32]] zeroinitializer
@0 = private unnamed_addr constant [31 x i8] c"34.array_2d_brace_init.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"34.array_2d_brace_init.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %ld = alloca [2 x [2 x i32]], align 4
    #dbg_declare(ptr %ld, !9, !DIExpression(), !14)
  %lc = alloca [2 x [3 x i32]], align 4
    #dbg_declare(ptr %lc, !15, !DIExpression(), !20)
  %lb = alloca [2 x [3 x i32]], align 4
    #dbg_declare(ptr %lb, !21, !DIExpression(), !22)
  %la = alloca [2 x [3 x i32]], align 4
    #dbg_declare(ptr %la, !23, !DIExpression(), !24)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !25, !DIExpression(), !26)
  store i32 0, ptr %err, align 4, !dbg !26
  %0 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 0, i32 0, !dbg !24
  store i32 1, ptr %0, align 4, !dbg !24
  %1 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 0, i32 1, !dbg !24
  store i32 2, ptr %1, align 4, !dbg !24
  %2 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 0, i32 2, !dbg !24
  store i32 0, ptr %2, align 4, !dbg !24
  %3 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 1, i32 0, !dbg !24
  store i32 3, ptr %3, align 4, !dbg !24
  %4 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 1, i32 1, !dbg !24
  store i32 0, ptr %4, align 4, !dbg !24
  %5 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 1, i32 2, !dbg !24
  store i32 0, ptr %5, align 4, !dbg !24
  %6 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 0, i32 0, !dbg !22
  store i32 7, ptr %6, align 4, !dbg !22
  %7 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 0, i32 1, !dbg !22
  store i32 8, ptr %7, align 4, !dbg !22
  %8 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 0, i32 2, !dbg !22
  store i32 9, ptr %8, align 4, !dbg !22
  %9 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 1, i32 0, !dbg !22
  store i32 10, ptr %9, align 4, !dbg !22
  %10 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 1, i32 1, !dbg !22
  store i32 11, ptr %10, align 4, !dbg !22
  %11 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 1, i32 2, !dbg !22
  store i32 12, ptr %11, align 4, !dbg !22
  %12 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 0, i32 0, !dbg !20
  store i32 1, ptr %12, align 4, !dbg !20
  %13 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 0, i32 1, !dbg !20
  store i32 2, ptr %13, align 4, !dbg !20
  %14 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 0, i32 2, !dbg !20
  store i32 3, ptr %14, align 4, !dbg !20
  %15 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 1, i32 0, !dbg !20
  store i32 4, ptr %15, align 4, !dbg !20
  %16 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 1, i32 1, !dbg !20
  store i32 0, ptr %16, align 4, !dbg !20
  %17 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 1, i32 2, !dbg !20
  store i32 0, ptr %17, align 4, !dbg !20
  %18 = getelementptr [2 x [2 x i32]], ptr %ld, i32 0, i32 0, i32 0, !dbg !14
  store i32 0, ptr %18, align 4, !dbg !14
  %19 = getelementptr [2 x [2 x i32]], ptr %ld, i32 0, i32 0, i32 1, !dbg !14
  store i32 0, ptr %19, align 4, !dbg !14
  %20 = getelementptr [2 x [2 x i32]], ptr %ld, i32 0, i32 1, i32 0, !dbg !14
  store i32 0, ptr %20, align 4, !dbg !14
  %21 = getelementptr [2 x [2 x i32]], ptr %ld, i32 0, i32 1, i32 1, !dbg !14
  store i32 0, ptr %21, align 4, !dbg !14
  %22 = getelementptr [3 x i32], ptr %la, i32 0, !dbg !27
  %23 = getelementptr i32, ptr %22, i32 0, !dbg !27
  %24 = load i32, ptr %23, align 4, !dbg !27
  %25 = icmp ne i32 %24, 1, !dbg !27
  br i1 %25, label %then, label %else, !dbg !27

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !28
  %26 = load i32, ptr %err, align 4, !dbg !28
  br label %if.end, !dbg !28

else:                                             ; preds = %entry
  br label %if.end, !dbg !28

if.end:                                           ; preds = %else, %then
  %27 = getelementptr [3 x i32], ptr %la, i32 0, !dbg !29
  %28 = getelementptr i32, ptr %27, i32 2, !dbg !29
  %29 = load i32, ptr %28, align 4, !dbg !29
  %30 = icmp ne i32 %29, 0, !dbg !29
  br i1 %30, label %then1, label %else2, !dbg !29

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !30
  %31 = load i32, ptr %err, align 4, !dbg !30
  br label %if.end3, !dbg !30

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !30

if.end3:                                          ; preds = %else2, %then1
  %32 = getelementptr [3 x i32], ptr %la, i32 1, !dbg !31
  %33 = getelementptr i32, ptr %32, i32 0, !dbg !31
  %34 = load i32, ptr %33, align 4, !dbg !31
  %35 = icmp ne i32 %34, 3, !dbg !31
  br i1 %35, label %then4, label %else5, !dbg !31

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !32
  %36 = load i32, ptr %err, align 4, !dbg !32
  br label %if.end6, !dbg !32

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !32

if.end6:                                          ; preds = %else5, %then4
  %37 = getelementptr [3 x i32], ptr %la, i32 1, !dbg !33
  %38 = getelementptr i32, ptr %37, i32 2, !dbg !33
  %39 = load i32, ptr %38, align 4, !dbg !33
  %40 = icmp ne i32 %39, 0, !dbg !33
  br i1 %40, label %then7, label %else8, !dbg !33

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !34
  %41 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end9, !dbg !34

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !34

if.end9:                                          ; preds = %else8, %then7
  %42 = getelementptr [3 x i32], ptr %lb, i32 0, !dbg !35
  %43 = getelementptr i32, ptr %42, i32 0, !dbg !35
  %44 = load i32, ptr %43, align 4, !dbg !35
  %45 = icmp ne i32 %44, 7, !dbg !35
  br i1 %45, label %then10, label %else11, !dbg !35

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !36
  %46 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end12, !dbg !36

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !36

if.end12:                                         ; preds = %else11, %then10
  %47 = getelementptr [3 x i32], ptr %lb, i32 1, !dbg !37
  %48 = getelementptr i32, ptr %47, i32 2, !dbg !37
  %49 = load i32, ptr %48, align 4, !dbg !37
  %50 = icmp ne i32 %49, 12, !dbg !37
  br i1 %50, label %then13, label %else14, !dbg !37

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !38
  %51 = load i32, ptr %err, align 4, !dbg !38
  br label %if.end15, !dbg !38

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !38

if.end15:                                         ; preds = %else14, %then13
  %52 = getelementptr [3 x i32], ptr %lc, i32 0, !dbg !39
  %53 = getelementptr i32, ptr %52, i32 2, !dbg !39
  %54 = load i32, ptr %53, align 4, !dbg !39
  %55 = icmp ne i32 %54, 3, !dbg !39
  br i1 %55, label %then16, label %else17, !dbg !39

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !40
  %56 = load i32, ptr %err, align 4, !dbg !40
  br label %if.end18, !dbg !40

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !40

if.end18:                                         ; preds = %else17, %then16
  %57 = getelementptr [3 x i32], ptr %lc, i32 1, !dbg !41
  %58 = getelementptr i32, ptr %57, i32 0, !dbg !41
  %59 = load i32, ptr %58, align 4, !dbg !41
  %60 = icmp ne i32 %59, 4, !dbg !41
  br i1 %60, label %then19, label %else20, !dbg !41

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !42
  %61 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end21, !dbg !42

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !42

if.end21:                                         ; preds = %else20, %then19
  %62 = getelementptr [3 x i32], ptr %lc, i32 1, !dbg !43
  %63 = getelementptr i32, ptr %62, i32 2, !dbg !43
  %64 = load i32, ptr %63, align 4, !dbg !43
  %65 = icmp ne i32 %64, 0, !dbg !43
  br i1 %65, label %then22, label %else23, !dbg !43

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !44
  %66 = load i32, ptr %err, align 4, !dbg !44
  br label %if.end24, !dbg !44

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !44

if.end24:                                         ; preds = %else23, %then22
  %67 = getelementptr [2 x i32], ptr %ld, i32 0, !dbg !45
  %68 = getelementptr i32, ptr %67, i32 0, !dbg !45
  %69 = load i32, ptr %68, align 4, !dbg !45
  %70 = icmp ne i32 %69, 0, !dbg !45
  br i1 %70, label %then25, label %else26, !dbg !45

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !46
  %71 = load i32, ptr %err, align 4, !dbg !46
  br label %if.end27, !dbg !46

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !46

if.end27:                                         ; preds = %else26, %then25
  %72 = getelementptr [2 x i32], ptr %ld, i32 0, !dbg !47
  %73 = getelementptr i32, ptr %72, i32 1, !dbg !47
  %74 = load i32, ptr %73, align 4, !dbg !47
  %75 = icmp ne i32 %74, 0, !dbg !47
  br i1 %75, label %then28, label %else29, !dbg !47

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !48
  %76 = load i32, ptr %err, align 4, !dbg !48
  br label %if.end30, !dbg !48

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !48

if.end30:                                         ; preds = %else29, %then28
  %77 = getelementptr [2 x i32], ptr %ld, i32 1, !dbg !49
  %78 = getelementptr i32, ptr %77, i32 0, !dbg !49
  %79 = load i32, ptr %78, align 4, !dbg !49
  %80 = icmp ne i32 %79, 0, !dbg !49
  br i1 %80, label %then31, label %else32, !dbg !49

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !50
  %81 = load i32, ptr %err, align 4, !dbg !50
  br label %if.end33, !dbg !50

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !50

if.end33:                                         ; preds = %else32, %then31
  %82 = getelementptr [2 x i32], ptr %ld, i32 1, !dbg !51
  %83 = getelementptr i32, ptr %82, i32 1, !dbg !51
  %84 = load i32, ptr %83, align 4, !dbg !51
  %85 = icmp ne i32 %84, 0, !dbg !51
  br i1 %85, label %then34, label %else35, !dbg !51

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !52
  %86 = load i32, ptr %err, align 4, !dbg !52
  br label %if.end36, !dbg !52

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !52

if.end36:                                         ; preds = %else35, %then34
  %87 = load i32, ptr @ga, align 4, !dbg !53
  %88 = icmp ne i32 %87, 1, !dbg !53
  br i1 %88, label %then37, label %else38, !dbg !53

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !54
  %89 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end39, !dbg !54

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !54

if.end39:                                         ; preds = %else38, %then37
  %90 = load i32, ptr getelementptr (i32, ptr getelementptr ([3 x i32], ptr @ga, i32 1), i32 2), align 4, !dbg !55
  %91 = icmp ne i32 %90, 6, !dbg !55
  br i1 %91, label %then40, label %else41, !dbg !55

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !56
  %92 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end42, !dbg !56

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !56

if.end42:                                         ; preds = %else41, %then40
  %93 = load i32, ptr getelementptr (i32, ptr @gb, i32 1), align 4, !dbg !57
  %94 = icmp ne i32 %93, 1, !dbg !57
  br i1 %94, label %then43, label %else44, !dbg !57

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4, !dbg !58
  %95 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end45, !dbg !58

else44:                                           ; preds = %if.end42
  br label %if.end45, !dbg !58

if.end45:                                         ; preds = %else44, %then43
  %96 = load i32, ptr getelementptr ([3 x i32], ptr @gb, i32 1), align 4, !dbg !59
  %97 = icmp ne i32 %96, 3, !dbg !59
  br i1 %97, label %then46, label %else47, !dbg !59

then46:                                           ; preds = %if.end45
  store i32 1, ptr %err, align 4, !dbg !60
  %98 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end48, !dbg !60

else47:                                           ; preds = %if.end45
  br label %if.end48, !dbg !60

if.end48:                                         ; preds = %else47, %then46
  %99 = load i32, ptr getelementptr (i32, ptr @gc, i32 1), align 4, !dbg !61
  %100 = icmp ne i32 %99, 11, !dbg !61
  br i1 %100, label %then49, label %else50, !dbg !61

then49:                                           ; preds = %if.end48
  store i32 1, ptr %err, align 4, !dbg !62
  %101 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end51, !dbg !62

else50:                                           ; preds = %if.end48
  br label %if.end51, !dbg !62

if.end51:                                         ; preds = %else50, %then49
  %102 = load i32, ptr getelementptr ([2 x i32], ptr @gc, i32 1), align 4, !dbg !63
  %103 = icmp ne i32 %102, 20, !dbg !63
  br i1 %103, label %then52, label %else53, !dbg !63

then52:                                           ; preds = %if.end51
  store i32 1, ptr %err, align 4, !dbg !64
  %104 = load i32, ptr %err, align 4, !dbg !64
  br label %if.end54, !dbg !64

else53:                                           ; preds = %if.end51
  br label %if.end54, !dbg !64

if.end54:                                         ; preds = %else53, %then52
  %105 = load i32, ptr getelementptr (i32, ptr getelementptr ([2 x i32], ptr @gc, i32 1), i32 1), align 4, !dbg !65
  %106 = icmp ne i32 %105, 0, !dbg !65
  br i1 %106, label %then55, label %else56, !dbg !65

then55:                                           ; preds = %if.end54
  store i32 1, ptr %err, align 4, !dbg !66
  %107 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end57, !dbg !66

else56:                                           ; preds = %if.end54
  br label %if.end57, !dbg !66

if.end57:                                         ; preds = %else56, %then55
  %108 = load i32, ptr @gd, align 4, !dbg !67
  %109 = icmp ne i32 %108, 0, !dbg !67
  br i1 %109, label %then58, label %else59, !dbg !67

then58:                                           ; preds = %if.end57
  store i32 1, ptr %err, align 4, !dbg !68
  %110 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end60, !dbg !68

else59:                                           ; preds = %if.end57
  br label %if.end60, !dbg !68

if.end60:                                         ; preds = %else59, %then58
  %111 = load i32, ptr getelementptr (i32, ptr @gd, i32 1), align 4, !dbg !69
  %112 = icmp ne i32 %111, 0, !dbg !69
  br i1 %112, label %then61, label %else62, !dbg !69

then61:                                           ; preds = %if.end60
  store i32 1, ptr %err, align 4, !dbg !70
  %113 = load i32, ptr %err, align 4, !dbg !70
  br label %if.end63, !dbg !70

else62:                                           ; preds = %if.end60
  br label %if.end63, !dbg !70

if.end63:                                         ; preds = %else62, %then61
  %114 = load i32, ptr getelementptr ([2 x i32], ptr @gd, i32 1), align 4, !dbg !71
  %115 = icmp ne i32 %114, 0, !dbg !71
  br i1 %115, label %then64, label %else65, !dbg !71

then64:                                           ; preds = %if.end63
  store i32 1, ptr %err, align 4, !dbg !72
  %116 = load i32, ptr %err, align 4, !dbg !72
  br label %if.end66, !dbg !72

else65:                                           ; preds = %if.end63
  br label %if.end66, !dbg !72

if.end66:                                         ; preds = %else65, %then64
  %117 = load i32, ptr getelementptr (i32, ptr getelementptr ([2 x i32], ptr @gd, i32 1), i32 1), align 4, !dbg !73
  %118 = icmp ne i32 %117, 0, !dbg !73
  br i1 %118, label %then67, label %else68, !dbg !73

then67:                                           ; preds = %if.end66
  store i32 1, ptr %err, align 4, !dbg !74
  %119 = load i32, ptr %err, align 4, !dbg !74
  br label %if.end69, !dbg !74

else68:                                           ; preds = %if.end66
  br label %if.end69, !dbg !74

if.end69:                                         ; preds = %else68, %then67
  %120 = load i32, ptr %err, align 4, !dbg !75
  %121 = icmp eq i32 %120, 0, !dbg !75
  br i1 %121, label %then70, label %else71, !dbg !75

then70:                                           ; preds = %if.end69
  %122 = call i32 (ptr, ...) @printf(ptr @0), !dbg !76
  br label %if.end72, !dbg !76

else71:                                           ; preds = %if.end69
  %123 = call i32 (ptr, ...) @printf(ptr @1), !dbg !78
  br label %if.end72, !dbg !78

if.end72:                                         ; preds = %else71, %then70
  %124 = load i32, ptr %err, align 4, !dbg !80
  ret i32 %124, !dbg !80
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "34.array_2d_brace_init.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 12, type: !5, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "ld", scope: !4, file: !1, line: 17, type: !10)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 128, align: 32, elements: !12)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 64, align: 32, elements: !12)
!12 = !{!13}
!13 = !DISubrange(count: 2, lowerBound: 0)
!14 = !DILocation(line: 17, column: 3, scope: !4)
!15 = !DILocalVariable(name: "lc", scope: !4, file: !1, line: 16, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 192, align: 32, elements: !12)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 96, align: 32, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 3, lowerBound: 0)
!20 = !DILocation(line: 16, column: 3, scope: !4)
!21 = !DILocalVariable(name: "lb", scope: !4, file: !1, line: 15, type: !16)
!22 = !DILocation(line: 15, column: 3, scope: !4)
!23 = !DILocalVariable(name: "la", scope: !4, file: !1, line: 14, type: !16)
!24 = !DILocation(line: 14, column: 3, scope: !4)
!25 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 13, type: !7)
!26 = !DILocation(line: 13, column: 3, scope: !4)
!27 = !DILocation(line: 19, column: 3, scope: !4)
!28 = !DILocation(line: 19, column: 22, scope: !4)
!29 = !DILocation(line: 20, column: 3, scope: !4)
!30 = !DILocation(line: 20, column: 22, scope: !4)
!31 = !DILocation(line: 21, column: 3, scope: !4)
!32 = !DILocation(line: 21, column: 22, scope: !4)
!33 = !DILocation(line: 22, column: 3, scope: !4)
!34 = !DILocation(line: 22, column: 22, scope: !4)
!35 = !DILocation(line: 24, column: 3, scope: !4)
!36 = !DILocation(line: 24, column: 22, scope: !4)
!37 = !DILocation(line: 25, column: 3, scope: !4)
!38 = !DILocation(line: 25, column: 23, scope: !4)
!39 = !DILocation(line: 27, column: 3, scope: !4)
!40 = !DILocation(line: 27, column: 22, scope: !4)
!41 = !DILocation(line: 28, column: 3, scope: !4)
!42 = !DILocation(line: 28, column: 22, scope: !4)
!43 = !DILocation(line: 29, column: 3, scope: !4)
!44 = !DILocation(line: 29, column: 22, scope: !4)
!45 = !DILocation(line: 31, column: 3, scope: !4)
!46 = !DILocation(line: 31, column: 22, scope: !4)
!47 = !DILocation(line: 32, column: 3, scope: !4)
!48 = !DILocation(line: 32, column: 22, scope: !4)
!49 = !DILocation(line: 33, column: 3, scope: !4)
!50 = !DILocation(line: 33, column: 22, scope: !4)
!51 = !DILocation(line: 34, column: 3, scope: !4)
!52 = !DILocation(line: 34, column: 22, scope: !4)
!53 = !DILocation(line: 36, column: 3, scope: !4)
!54 = !DILocation(line: 36, column: 22, scope: !4)
!55 = !DILocation(line: 37, column: 3, scope: !4)
!56 = !DILocation(line: 37, column: 22, scope: !4)
!57 = !DILocation(line: 39, column: 3, scope: !4)
!58 = !DILocation(line: 39, column: 22, scope: !4)
!59 = !DILocation(line: 40, column: 3, scope: !4)
!60 = !DILocation(line: 40, column: 22, scope: !4)
!61 = !DILocation(line: 42, column: 3, scope: !4)
!62 = !DILocation(line: 42, column: 23, scope: !4)
!63 = !DILocation(line: 43, column: 3, scope: !4)
!64 = !DILocation(line: 43, column: 23, scope: !4)
!65 = !DILocation(line: 44, column: 3, scope: !4)
!66 = !DILocation(line: 44, column: 22, scope: !4)
!67 = !DILocation(line: 46, column: 3, scope: !4)
!68 = !DILocation(line: 46, column: 22, scope: !4)
!69 = !DILocation(line: 47, column: 3, scope: !4)
!70 = !DILocation(line: 47, column: 22, scope: !4)
!71 = !DILocation(line: 48, column: 3, scope: !4)
!72 = !DILocation(line: 48, column: 22, scope: !4)
!73 = !DILocation(line: 49, column: 3, scope: !4)
!74 = !DILocation(line: 49, column: 22, scope: !4)
!75 = !DILocation(line: 51, column: 3, scope: !4)
!76 = !DILocation(line: 52, column: 5, scope: !77)
!77 = distinct !DILexicalBlock(scope: !4, file: !1, line: 51, column: 17)
!78 = !DILocation(line: 54, column: 5, scope: !79)
!79 = distinct !DILexicalBlock(scope: !4, file: !1, line: 53, column: 10)
!80 = !DILocation(line: 56, column: 3, scope: !4)
