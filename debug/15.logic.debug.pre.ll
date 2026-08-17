; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [17 x i8] c"15.logic.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"15.logic.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %ui = alloca i32, align 4
    #dbg_declare(ptr %ui, !8, !DIExpression(), !10)
  %si = alloca i32, align 4
    #dbg_declare(ptr %si, !11, !DIExpression(), !12)
  %ub = alloca i32, align 4
    #dbg_declare(ptr %ub, !13, !DIExpression(), !14)
  %ua = alloca i32, align 4
    #dbg_declare(ptr %ua, !15, !DIExpression(), !16)
  %c = alloca i32, align 4
    #dbg_declare(ptr %c, !17, !DIExpression(), !18)
  %b = alloca i32, align 4
    #dbg_declare(ptr %b, !19, !DIExpression(), !20)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !21, !DIExpression(), !22)
  %v = alloca i32, align 4
    #dbg_declare(ptr %v, !23, !DIExpression(), !24)
  %f = alloca i1, align 1
    #dbg_declare(ptr %f, !25, !DIExpression(), !27)
  %t = alloca i1, align 1
    #dbg_declare(ptr %t, !28, !DIExpression(), !29)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !30, !DIExpression(), !31)
  store i32 0, ptr %err, align 4, !dbg !31
  store i1 true, ptr %t, align 1, !dbg !29
  store i1 false, ptr %f, align 1, !dbg !27
  %0 = load i1, ptr %t, align 1, !dbg !32
  %1 = zext i1 %0 to i32, !dbg !32
  %2 = icmp eq i32 %1, 0, !dbg !32
  br i1 %2, label %then, label %else, !dbg !32

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !33
  %3 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end, !dbg !33

else:                                             ; preds = %entry
  br label %if.end, !dbg !33

if.end:                                           ; preds = %else, %then
  %4 = load i1, ptr %f, align 1, !dbg !34
  %5 = zext i1 %4 to i32, !dbg !34
  %6 = icmp ne i32 %5, 0, !dbg !34
  br i1 %6, label %then1, label %else2, !dbg !34

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !35
  %7 = load i32, ptr %err, align 4, !dbg !35
  br label %if.end3, !dbg !35

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !35

if.end3:                                          ; preds = %else2, %then1
  %8 = load i1, ptr %t, align 1, !dbg !36
  %9 = load i1, ptr %f, align 1, !dbg !36
  %10 = select i1 %8, i1 %9, i1 false, !dbg !36
  %11 = zext i1 %10 to i32, !dbg !36
  store i32 %11, ptr %v, align 4, !dbg !36
  %12 = load i32, ptr %v, align 4, !dbg !36
  %13 = load i32, ptr %v, align 4, !dbg !37
  %14 = icmp ne i32 %13, 0, !dbg !37
  br i1 %14, label %then4, label %else5, !dbg !37

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !38
  %15 = load i32, ptr %err, align 4, !dbg !38
  br label %if.end6, !dbg !38

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !38

if.end6:                                          ; preds = %else5, %then4
  %16 = load i1, ptr %t, align 1, !dbg !39
  %17 = load i1, ptr %t, align 1, !dbg !39
  %18 = select i1 %16, i1 %17, i1 false, !dbg !39
  %19 = zext i1 %18 to i32, !dbg !39
  store i32 %19, ptr %v, align 4, !dbg !39
  %20 = load i32, ptr %v, align 4, !dbg !39
  %21 = load i32, ptr %v, align 4, !dbg !40
  %22 = icmp eq i32 %21, 0, !dbg !40
  br i1 %22, label %then7, label %else8, !dbg !40

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !41
  %23 = load i32, ptr %err, align 4, !dbg !41
  br label %if.end9, !dbg !41

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !41

if.end9:                                          ; preds = %else8, %then7
  %24 = load i1, ptr %f, align 1, !dbg !42
  %25 = load i1, ptr %f, align 1, !dbg !42
  %26 = select i1 %24, i1 %25, i1 false, !dbg !42
  %27 = zext i1 %26 to i32, !dbg !42
  store i32 %27, ptr %v, align 4, !dbg !42
  %28 = load i32, ptr %v, align 4, !dbg !42
  %29 = load i32, ptr %v, align 4, !dbg !43
  %30 = icmp ne i32 %29, 0, !dbg !43
  br i1 %30, label %then10, label %else11, !dbg !43

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !44
  %31 = load i32, ptr %err, align 4, !dbg !44
  br label %if.end12, !dbg !44

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !44

if.end12:                                         ; preds = %else11, %then10
  %32 = load i1, ptr %t, align 1, !dbg !45
  %33 = load i1, ptr %f, align 1, !dbg !45
  %34 = select i1 %32, i1 true, i1 %33, !dbg !45
  %35 = zext i1 %34 to i32, !dbg !45
  store i32 %35, ptr %v, align 4, !dbg !45
  %36 = load i32, ptr %v, align 4, !dbg !45
  %37 = load i32, ptr %v, align 4, !dbg !46
  %38 = icmp eq i32 %37, 0, !dbg !46
  br i1 %38, label %then13, label %else14, !dbg !46

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !47
  %39 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end15, !dbg !47

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !47

if.end15:                                         ; preds = %else14, %then13
  %40 = load i1, ptr %t, align 1, !dbg !48
  %41 = load i1, ptr %t, align 1, !dbg !48
  %42 = select i1 %40, i1 true, i1 %41, !dbg !48
  %43 = zext i1 %42 to i32, !dbg !48
  store i32 %43, ptr %v, align 4, !dbg !48
  %44 = load i32, ptr %v, align 4, !dbg !48
  %45 = load i32, ptr %v, align 4, !dbg !49
  %46 = icmp eq i32 %45, 0, !dbg !49
  br i1 %46, label %then16, label %else17, !dbg !49

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !50
  %47 = load i32, ptr %err, align 4, !dbg !50
  br label %if.end18, !dbg !50

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !50

if.end18:                                         ; preds = %else17, %then16
  %48 = load i1, ptr %f, align 1, !dbg !51
  %49 = load i1, ptr %f, align 1, !dbg !51
  %50 = select i1 %48, i1 true, i1 %49, !dbg !51
  %51 = zext i1 %50 to i32, !dbg !51
  store i32 %51, ptr %v, align 4, !dbg !51
  %52 = load i32, ptr %v, align 4, !dbg !51
  %53 = load i32, ptr %v, align 4, !dbg !52
  %54 = icmp ne i32 %53, 0, !dbg !52
  br i1 %54, label %then19, label %else20, !dbg !52

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !53
  %55 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end21, !dbg !53

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !53

if.end21:                                         ; preds = %else20, %then19
  %56 = load i1, ptr %t, align 1, !dbg !54
  %57 = icmp eq i1 %56, false, !dbg !54
  %58 = zext i1 %57 to i32, !dbg !54
  store i32 %58, ptr %v, align 4, !dbg !54
  %59 = load i32, ptr %v, align 4, !dbg !54
  %60 = load i32, ptr %v, align 4, !dbg !55
  %61 = icmp ne i32 %60, 0, !dbg !55
  br i1 %61, label %then22, label %else23, !dbg !55

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !56
  %62 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end24, !dbg !56

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !56

if.end24:                                         ; preds = %else23, %then22
  %63 = load i1, ptr %f, align 1, !dbg !57
  %64 = icmp eq i1 %63, false, !dbg !57
  %65 = zext i1 %64 to i32, !dbg !57
  store i32 %65, ptr %v, align 4, !dbg !57
  %66 = load i32, ptr %v, align 4, !dbg !57
  %67 = load i32, ptr %v, align 4, !dbg !58
  %68 = icmp eq i32 %67, 0, !dbg !58
  br i1 %68, label %then25, label %else26, !dbg !58

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !59
  %69 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end27, !dbg !59

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !59

if.end27:                                         ; preds = %else26, %then25
  store i32 100, ptr %a, align 4, !dbg !22
  store i32 100, ptr %b, align 4, !dbg !20
  store i32 128, ptr %c, align 4, !dbg !18
  %70 = load i32, ptr %a, align 4, !dbg !60
  %71 = load i32, ptr %b, align 4, !dbg !60
  %72 = icmp eq i32 %70, %71, !dbg !60
  %73 = zext i1 %72 to i32, !dbg !60
  store i32 %73, ptr %v, align 4, !dbg !60
  %74 = load i32, ptr %v, align 4, !dbg !60
  %75 = load i32, ptr %v, align 4, !dbg !61
  %76 = icmp eq i32 %75, 0, !dbg !61
  br i1 %76, label %then28, label %else29, !dbg !61

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !62
  %77 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end30, !dbg !62

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !62

if.end30:                                         ; preds = %else29, %then28
  %78 = load i32, ptr %a, align 4, !dbg !63
  %79 = load i32, ptr %c, align 4, !dbg !63
  %80 = icmp eq i32 %78, %79, !dbg !63
  %81 = zext i1 %80 to i32, !dbg !63
  store i32 %81, ptr %v, align 4, !dbg !63
  %82 = load i32, ptr %v, align 4, !dbg !63
  %83 = load i32, ptr %v, align 4, !dbg !64
  %84 = icmp ne i32 %83, 0, !dbg !64
  br i1 %84, label %then31, label %else32, !dbg !64

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !65
  %85 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end33, !dbg !65

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !65

if.end33:                                         ; preds = %else32, %then31
  %86 = load i32, ptr %a, align 4, !dbg !66
  %87 = load i32, ptr %b, align 4, !dbg !66
  %88 = icmp ne i32 %86, %87, !dbg !66
  %89 = zext i1 %88 to i32, !dbg !66
  store i32 %89, ptr %v, align 4, !dbg !66
  %90 = load i32, ptr %v, align 4, !dbg !66
  %91 = load i32, ptr %v, align 4, !dbg !67
  %92 = icmp ne i32 %91, 0, !dbg !67
  br i1 %92, label %then34, label %else35, !dbg !67

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !68
  %93 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end36, !dbg !68

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !68

if.end36:                                         ; preds = %else35, %then34
  %94 = load i32, ptr %a, align 4, !dbg !69
  %95 = load i32, ptr %c, align 4, !dbg !69
  %96 = icmp ne i32 %94, %95, !dbg !69
  %97 = zext i1 %96 to i32, !dbg !69
  store i32 %97, ptr %v, align 4, !dbg !69
  %98 = load i32, ptr %v, align 4, !dbg !69
  %99 = load i32, ptr %v, align 4, !dbg !70
  %100 = icmp eq i32 %99, 0, !dbg !70
  br i1 %100, label %then37, label %else38, !dbg !70

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !71
  %101 = load i32, ptr %err, align 4, !dbg !71
  br label %if.end39, !dbg !71

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !71

if.end39:                                         ; preds = %else38, %then37
  %102 = load i32, ptr %a, align 4, !dbg !72
  %103 = load i32, ptr %b, align 4, !dbg !72
  %104 = icmp slt i32 %102, %103, !dbg !72
  %105 = zext i1 %104 to i32, !dbg !72
  store i32 %105, ptr %v, align 4, !dbg !72
  %106 = load i32, ptr %v, align 4, !dbg !72
  %107 = load i32, ptr %v, align 4, !dbg !73
  %108 = icmp ne i32 %107, 0, !dbg !73
  br i1 %108, label %then40, label %else41, !dbg !73

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !74
  %109 = load i32, ptr %err, align 4, !dbg !74
  br label %if.end42, !dbg !74

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !74

if.end42:                                         ; preds = %else41, %then40
  %110 = load i32, ptr %a, align 4, !dbg !75
  %111 = load i32, ptr %c, align 4, !dbg !75
  %112 = icmp slt i32 %110, %111, !dbg !75
  %113 = zext i1 %112 to i32, !dbg !75
  store i32 %113, ptr %v, align 4, !dbg !75
  %114 = load i32, ptr %v, align 4, !dbg !75
  %115 = load i32, ptr %v, align 4, !dbg !76
  %116 = icmp eq i32 %115, 0, !dbg !76
  br i1 %116, label %then43, label %else44, !dbg !76

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4, !dbg !77
  %117 = load i32, ptr %err, align 4, !dbg !77
  br label %if.end45, !dbg !77

else44:                                           ; preds = %if.end42
  br label %if.end45, !dbg !77

if.end45:                                         ; preds = %else44, %then43
  %118 = load i32, ptr %c, align 4, !dbg !78
  %119 = load i32, ptr %a, align 4, !dbg !78
  %120 = icmp slt i32 %118, %119, !dbg !78
  %121 = zext i1 %120 to i32, !dbg !78
  store i32 %121, ptr %v, align 4, !dbg !78
  %122 = load i32, ptr %v, align 4, !dbg !78
  %123 = load i32, ptr %v, align 4, !dbg !79
  %124 = icmp ne i32 %123, 0, !dbg !79
  br i1 %124, label %then46, label %else47, !dbg !79

then46:                                           ; preds = %if.end45
  store i32 1, ptr %err, align 4, !dbg !80
  %125 = load i32, ptr %err, align 4, !dbg !80
  br label %if.end48, !dbg !80

else47:                                           ; preds = %if.end45
  br label %if.end48, !dbg !80

if.end48:                                         ; preds = %else47, %then46
  %126 = load i32, ptr %a, align 4, !dbg !81
  %127 = load i32, ptr %b, align 4, !dbg !81
  %128 = icmp sle i32 %126, %127, !dbg !81
  %129 = zext i1 %128 to i32, !dbg !81
  store i32 %129, ptr %v, align 4, !dbg !81
  %130 = load i32, ptr %v, align 4, !dbg !81
  %131 = load i32, ptr %v, align 4, !dbg !82
  %132 = icmp eq i32 %131, 0, !dbg !82
  br i1 %132, label %then49, label %else50, !dbg !82

then49:                                           ; preds = %if.end48
  store i32 1, ptr %err, align 4, !dbg !83
  %133 = load i32, ptr %err, align 4, !dbg !83
  br label %if.end51, !dbg !83

else50:                                           ; preds = %if.end48
  br label %if.end51, !dbg !83

if.end51:                                         ; preds = %else50, %then49
  %134 = load i32, ptr %a, align 4, !dbg !84
  %135 = load i32, ptr %c, align 4, !dbg !84
  %136 = icmp sle i32 %134, %135, !dbg !84
  %137 = zext i1 %136 to i32, !dbg !84
  store i32 %137, ptr %v, align 4, !dbg !84
  %138 = load i32, ptr %v, align 4, !dbg !84
  %139 = load i32, ptr %v, align 4, !dbg !85
  %140 = icmp eq i32 %139, 0, !dbg !85
  br i1 %140, label %then52, label %else53, !dbg !85

then52:                                           ; preds = %if.end51
  store i32 1, ptr %err, align 4, !dbg !86
  %141 = load i32, ptr %err, align 4, !dbg !86
  br label %if.end54, !dbg !86

else53:                                           ; preds = %if.end51
  br label %if.end54, !dbg !86

if.end54:                                         ; preds = %else53, %then52
  %142 = load i32, ptr %c, align 4, !dbg !87
  %143 = load i32, ptr %a, align 4, !dbg !87
  %144 = icmp sle i32 %142, %143, !dbg !87
  %145 = zext i1 %144 to i32, !dbg !87
  store i32 %145, ptr %v, align 4, !dbg !87
  %146 = load i32, ptr %v, align 4, !dbg !87
  %147 = load i32, ptr %v, align 4, !dbg !88
  %148 = icmp ne i32 %147, 0, !dbg !88
  br i1 %148, label %then55, label %else56, !dbg !88

then55:                                           ; preds = %if.end54
  store i32 1, ptr %err, align 4, !dbg !89
  %149 = load i32, ptr %err, align 4, !dbg !89
  br label %if.end57, !dbg !89

else56:                                           ; preds = %if.end54
  br label %if.end57, !dbg !89

if.end57:                                         ; preds = %else56, %then55
  %150 = load i32, ptr %a, align 4, !dbg !90
  %151 = load i32, ptr %b, align 4, !dbg !90
  %152 = icmp sgt i32 %150, %151, !dbg !90
  %153 = zext i1 %152 to i32, !dbg !90
  store i32 %153, ptr %v, align 4, !dbg !90
  %154 = load i32, ptr %v, align 4, !dbg !90
  %155 = load i32, ptr %v, align 4, !dbg !91
  %156 = icmp ne i32 %155, 0, !dbg !91
  br i1 %156, label %then58, label %else59, !dbg !91

then58:                                           ; preds = %if.end57
  store i32 1, ptr %err, align 4, !dbg !92
  %157 = load i32, ptr %err, align 4, !dbg !92
  br label %if.end60, !dbg !92

else59:                                           ; preds = %if.end57
  br label %if.end60, !dbg !92

if.end60:                                         ; preds = %else59, %then58
  %158 = load i32, ptr %a, align 4, !dbg !93
  %159 = load i32, ptr %c, align 4, !dbg !93
  %160 = icmp sgt i32 %158, %159, !dbg !93
  %161 = zext i1 %160 to i32, !dbg !93
  store i32 %161, ptr %v, align 4, !dbg !93
  %162 = load i32, ptr %v, align 4, !dbg !93
  %163 = load i32, ptr %v, align 4, !dbg !94
  %164 = icmp ne i32 %163, 0, !dbg !94
  br i1 %164, label %then61, label %else62, !dbg !94

then61:                                           ; preds = %if.end60
  store i32 1, ptr %err, align 4, !dbg !95
  %165 = load i32, ptr %err, align 4, !dbg !95
  br label %if.end63, !dbg !95

else62:                                           ; preds = %if.end60
  br label %if.end63, !dbg !95

if.end63:                                         ; preds = %else62, %then61
  %166 = load i32, ptr %c, align 4, !dbg !96
  %167 = load i32, ptr %a, align 4, !dbg !96
  %168 = icmp sgt i32 %166, %167, !dbg !96
  %169 = zext i1 %168 to i32, !dbg !96
  store i32 %169, ptr %v, align 4, !dbg !96
  %170 = load i32, ptr %v, align 4, !dbg !96
  %171 = load i32, ptr %v, align 4, !dbg !97
  %172 = icmp eq i32 %171, 0, !dbg !97
  br i1 %172, label %then64, label %else65, !dbg !97

then64:                                           ; preds = %if.end63
  store i32 1, ptr %err, align 4, !dbg !98
  %173 = load i32, ptr %err, align 4, !dbg !98
  br label %if.end66, !dbg !98

else65:                                           ; preds = %if.end63
  br label %if.end66, !dbg !98

if.end66:                                         ; preds = %else65, %then64
  %174 = load i32, ptr %a, align 4, !dbg !99
  %175 = load i32, ptr %b, align 4, !dbg !99
  %176 = icmp sge i32 %174, %175, !dbg !99
  %177 = zext i1 %176 to i32, !dbg !99
  store i32 %177, ptr %v, align 4, !dbg !99
  %178 = load i32, ptr %v, align 4, !dbg !99
  %179 = load i32, ptr %v, align 4, !dbg !100
  %180 = icmp eq i32 %179, 0, !dbg !100
  br i1 %180, label %then67, label %else68, !dbg !100

then67:                                           ; preds = %if.end66
  store i32 1, ptr %err, align 4, !dbg !101
  %181 = load i32, ptr %err, align 4, !dbg !101
  br label %if.end69, !dbg !101

else68:                                           ; preds = %if.end66
  br label %if.end69, !dbg !101

if.end69:                                         ; preds = %else68, %then67
  %182 = load i32, ptr %a, align 4, !dbg !102
  %183 = load i32, ptr %c, align 4, !dbg !102
  %184 = icmp sge i32 %182, %183, !dbg !102
  %185 = zext i1 %184 to i32, !dbg !102
  store i32 %185, ptr %v, align 4, !dbg !102
  %186 = load i32, ptr %v, align 4, !dbg !102
  %187 = load i32, ptr %v, align 4, !dbg !103
  %188 = icmp ne i32 %187, 0, !dbg !103
  br i1 %188, label %then70, label %else71, !dbg !103

then70:                                           ; preds = %if.end69
  store i32 1, ptr %err, align 4, !dbg !104
  %189 = load i32, ptr %err, align 4, !dbg !104
  br label %if.end72, !dbg !104

else71:                                           ; preds = %if.end69
  br label %if.end72, !dbg !104

if.end72:                                         ; preds = %else71, %then70
  %190 = load i32, ptr %c, align 4, !dbg !105
  %191 = load i32, ptr %a, align 4, !dbg !105
  %192 = icmp sge i32 %190, %191, !dbg !105
  %193 = zext i1 %192 to i32, !dbg !105
  store i32 %193, ptr %v, align 4, !dbg !105
  %194 = load i32, ptr %v, align 4, !dbg !105
  %195 = load i32, ptr %v, align 4, !dbg !106
  %196 = icmp eq i32 %195, 0, !dbg !106
  br i1 %196, label %then73, label %else74, !dbg !106

then73:                                           ; preds = %if.end72
  store i32 1, ptr %err, align 4, !dbg !107
  %197 = load i32, ptr %err, align 4, !dbg !107
  br label %if.end75, !dbg !107

else74:                                           ; preds = %if.end72
  br label %if.end75, !dbg !107

if.end75:                                         ; preds = %else74, %then73
  store i32 1, ptr %ua, align 4, !dbg !16
  store i32 -1, ptr %ub, align 4, !dbg !14
  %198 = load i32, ptr %ua, align 4, !dbg !108
  %199 = load i32, ptr %ub, align 4, !dbg !108
  %200 = icmp ult i32 %198, %199, !dbg !108
  %201 = zext i1 %200 to i32, !dbg !108
  store i32 %201, ptr %v, align 4, !dbg !108
  %202 = load i32, ptr %v, align 4, !dbg !108
  %203 = load i32, ptr %v, align 4, !dbg !109
  %204 = icmp eq i32 %203, 0, !dbg !109
  br i1 %204, label %then76, label %else77, !dbg !109

then76:                                           ; preds = %if.end75
  store i32 1, ptr %err, align 4, !dbg !110
  %205 = load i32, ptr %err, align 4, !dbg !110
  br label %if.end78, !dbg !110

else77:                                           ; preds = %if.end75
  br label %if.end78, !dbg !110

if.end78:                                         ; preds = %else77, %then76
  %206 = load i32, ptr %ub, align 4, !dbg !111
  %207 = load i32, ptr %ua, align 4, !dbg !111
  %208 = icmp ugt i32 %206, %207, !dbg !111
  %209 = zext i1 %208 to i32, !dbg !111
  store i32 %209, ptr %v, align 4, !dbg !111
  %210 = load i32, ptr %v, align 4, !dbg !111
  %211 = load i32, ptr %v, align 4, !dbg !112
  %212 = icmp eq i32 %211, 0, !dbg !112
  br i1 %212, label %then79, label %else80, !dbg !112

then79:                                           ; preds = %if.end78
  store i32 1, ptr %err, align 4, !dbg !113
  %213 = load i32, ptr %err, align 4, !dbg !113
  br label %if.end81, !dbg !113

else80:                                           ; preds = %if.end78
  br label %if.end81, !dbg !113

if.end81:                                         ; preds = %else80, %then79
  store i32 -1, ptr %si, align 4, !dbg !12
  store i32 1, ptr %ui, align 4, !dbg !10
  %214 = load i32, ptr %si, align 4, !dbg !114
  %215 = load i32, ptr %ui, align 4, !dbg !114
  %216 = icmp ult i32 %214, %215, !dbg !114
  %217 = zext i1 %216 to i32, !dbg !114
  store i32 %217, ptr %v, align 4, !dbg !114
  %218 = load i32, ptr %v, align 4, !dbg !114
  %219 = load i32, ptr %v, align 4, !dbg !115
  %220 = icmp ne i32 %219, 0, !dbg !115
  br i1 %220, label %then82, label %else83, !dbg !115

then82:                                           ; preds = %if.end81
  store i32 1, ptr %err, align 4, !dbg !116
  %221 = load i32, ptr %err, align 4, !dbg !116
  br label %if.end84, !dbg !116

else83:                                           ; preds = %if.end81
  br label %if.end84, !dbg !116

if.end84:                                         ; preds = %else83, %then82
  %222 = load i32, ptr %si, align 4, !dbg !117
  %223 = load i32, ptr %ui, align 4, !dbg !117
  %224 = icmp ugt i32 %222, %223, !dbg !117
  %225 = zext i1 %224 to i32, !dbg !117
  store i32 %225, ptr %v, align 4, !dbg !117
  %226 = load i32, ptr %v, align 4, !dbg !117
  %227 = load i32, ptr %v, align 4, !dbg !118
  %228 = icmp eq i32 %227, 0, !dbg !118
  br i1 %228, label %then85, label %else86, !dbg !118

then85:                                           ; preds = %if.end84
  store i32 1, ptr %err, align 4, !dbg !119
  %229 = load i32, ptr %err, align 4, !dbg !119
  br label %if.end87, !dbg !119

else86:                                           ; preds = %if.end84
  br label %if.end87, !dbg !119

if.end87:                                         ; preds = %else86, %then85
  %230 = load i32, ptr %a, align 4, !dbg !120
  %231 = load i32, ptr %c, align 4, !dbg !120
  %232 = icmp slt i32 %230, %231, !dbg !120
  %233 = zext i1 %232 to i32, !dbg !120
  store i32 %233, ptr %v, align 4, !dbg !120
  %234 = load i32, ptr %v, align 4, !dbg !120
  %235 = load i32, ptr %v, align 4, !dbg !121
  %236 = icmp ne i32 %235, 1, !dbg !121
  br i1 %236, label %then88, label %else89, !dbg !121

then88:                                           ; preds = %if.end87
  store i32 1, ptr %err, align 4, !dbg !122
  %237 = load i32, ptr %err, align 4, !dbg !122
  br label %if.end90, !dbg !122

else89:                                           ; preds = %if.end87
  br label %if.end90, !dbg !122

if.end90:                                         ; preds = %else89, %then88
  %238 = load i32, ptr %a, align 4, !dbg !123
  %239 = load i32, ptr %b, align 4, !dbg !123
  %240 = icmp eq i32 %238, %239, !dbg !123
  %241 = zext i1 %240 to i32, !dbg !123
  store i32 %241, ptr %v, align 4, !dbg !123
  %242 = load i32, ptr %v, align 4, !dbg !123
  %243 = load i32, ptr %v, align 4, !dbg !124
  %244 = icmp ne i32 %243, 1, !dbg !124
  br i1 %244, label %then91, label %else92, !dbg !124

then91:                                           ; preds = %if.end90
  store i32 1, ptr %err, align 4, !dbg !125
  %245 = load i32, ptr %err, align 4, !dbg !125
  br label %if.end93, !dbg !125

else92:                                           ; preds = %if.end90
  br label %if.end93, !dbg !125

if.end93:                                         ; preds = %else92, %then91
  %246 = load i1, ptr %t, align 1, !dbg !126
  %247 = load i1, ptr %t, align 1, !dbg !126
  %248 = select i1 %246, i1 %247, i1 false, !dbg !126
  %249 = zext i1 %248 to i32, !dbg !126
  store i32 %249, ptr %v, align 4, !dbg !126
  %250 = load i32, ptr %v, align 4, !dbg !126
  %251 = load i32, ptr %v, align 4, !dbg !127
  %252 = icmp ne i32 %251, 1, !dbg !127
  br i1 %252, label %then94, label %else95, !dbg !127

then94:                                           ; preds = %if.end93
  store i32 1, ptr %err, align 4, !dbg !128
  %253 = load i32, ptr %err, align 4, !dbg !128
  br label %if.end96, !dbg !128

else95:                                           ; preds = %if.end93
  br label %if.end96, !dbg !128

if.end96:                                         ; preds = %else95, %then94
  %254 = load i1, ptr %t, align 1, !dbg !129
  %255 = load i1, ptr %f, align 1, !dbg !129
  %256 = select i1 %254, i1 true, i1 %255, !dbg !129
  %257 = zext i1 %256 to i32, !dbg !129
  store i32 %257, ptr %v, align 4, !dbg !129
  %258 = load i32, ptr %v, align 4, !dbg !129
  %259 = load i32, ptr %v, align 4, !dbg !130
  %260 = icmp ne i32 %259, 1, !dbg !130
  br i1 %260, label %then97, label %else98, !dbg !130

then97:                                           ; preds = %if.end96
  store i32 1, ptr %err, align 4, !dbg !131
  %261 = load i32, ptr %err, align 4, !dbg !131
  br label %if.end99, !dbg !131

else98:                                           ; preds = %if.end96
  br label %if.end99, !dbg !131

if.end99:                                         ; preds = %else98, %then97
  %262 = load i1, ptr %f, align 1, !dbg !132
  %263 = icmp eq i1 %262, false, !dbg !132
  %264 = zext i1 %263 to i32, !dbg !132
  store i32 %264, ptr %v, align 4, !dbg !132
  %265 = load i32, ptr %v, align 4, !dbg !132
  %266 = load i32, ptr %v, align 4, !dbg !133
  %267 = icmp ne i32 %266, 1, !dbg !133
  br i1 %267, label %then100, label %else101, !dbg !133

then100:                                          ; preds = %if.end99
  store i32 1, ptr %err, align 4, !dbg !134
  %268 = load i32, ptr %err, align 4, !dbg !134
  br label %if.end102, !dbg !134

else101:                                          ; preds = %if.end99
  br label %if.end102, !dbg !134

if.end102:                                        ; preds = %else101, %then100
  %269 = load i32, ptr %a, align 4, !dbg !135
  %270 = load i32, ptr %c, align 4, !dbg !135
  %271 = icmp slt i32 %269, %270, !dbg !135
  %272 = zext i1 %271 to i32, !dbg !135
  %273 = mul i32 %272, 3, !dbg !135
  %274 = icmp ne i32 %273, 3, !dbg !135
  br i1 %274, label %then103, label %else104, !dbg !135

then103:                                          ; preds = %if.end102
  store i32 1, ptr %err, align 4, !dbg !136
  %275 = load i32, ptr %err, align 4, !dbg !136
  br label %if.end105, !dbg !136

else104:                                          ; preds = %if.end102
  br label %if.end105, !dbg !136

if.end105:                                        ; preds = %else104, %then103
  %276 = load i32, ptr %a, align 4, !dbg !137
  %277 = load i32, ptr %c, align 4, !dbg !137
  %278 = icmp slt i32 %276, %277, !dbg !137
  %279 = zext i1 %278 to i32, !dbg !137
  %280 = add i32 %279, 10, !dbg !137
  %281 = icmp ne i32 %280, 11, !dbg !137
  br i1 %281, label %then106, label %else107, !dbg !137

then106:                                          ; preds = %if.end105
  store i32 1, ptr %err, align 4, !dbg !138
  %282 = load i32, ptr %err, align 4, !dbg !138
  br label %if.end108, !dbg !138

else107:                                          ; preds = %if.end105
  br label %if.end108, !dbg !138

if.end108:                                        ; preds = %else107, %then106
  %283 = load i32, ptr %a, align 4, !dbg !139
  %284 = load i32, ptr %c, align 4, !dbg !139
  %285 = icmp slt i32 %283, %284, !dbg !139
  %286 = zext i1 %285 to i32, !dbg !139
  %287 = sub i32 0, %286, !dbg !139
  %288 = icmp ne i32 %287, -1, !dbg !139
  br i1 %288, label %then109, label %else110, !dbg !139

then109:                                          ; preds = %if.end108
  store i32 1, ptr %err, align 4, !dbg !140
  %289 = load i32, ptr %err, align 4, !dbg !140
  br label %if.end111, !dbg !140

else110:                                          ; preds = %if.end108
  br label %if.end111, !dbg !140

if.end111:                                        ; preds = %else110, %then109
  %290 = load i32, ptr %a, align 4, !dbg !141
  %291 = load i32, ptr %c, align 4, !dbg !141
  %292 = icmp slt i32 %290, %291, !dbg !141
  %293 = zext i1 %292 to i32, !dbg !141
  %294 = icmp slt i32 %293, 5, !dbg !141
  %295 = zext i1 %294 to i32, !dbg !141
  %296 = icmp ne i32 %295, 1, !dbg !141
  br i1 %296, label %then112, label %else113, !dbg !141

then112:                                          ; preds = %if.end111
  store i32 1, ptr %err, align 4, !dbg !142
  %297 = load i32, ptr %err, align 4, !dbg !142
  br label %if.end114, !dbg !142

else113:                                          ; preds = %if.end111
  br label %if.end114, !dbg !142

if.end114:                                        ; preds = %else113, %then112
  %298 = load i32, ptr %err, align 4, !dbg !143
  %299 = icmp eq i32 %298, 0, !dbg !143
  br i1 %299, label %then115, label %else116, !dbg !143

then115:                                          ; preds = %if.end114
  %300 = call i32 (ptr, ...) @printf(ptr @0), !dbg !144
  br label %if.end117, !dbg !144

else116:                                          ; preds = %if.end114
  %301 = call i32 (ptr, ...) @printf(ptr @1), !dbg !146
  br label %if.end117, !dbg !146

if.end117:                                        ; preds = %else116, %then115
  %302 = load i32, ptr %err, align 4, !dbg !148
  ret i32 %302, !dbg !148
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "15.logic.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "ui", scope: !4, file: !3, line: 79, type: !9)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !DILocation(line: 79, column: 3, scope: !4)
!11 = !DILocalVariable(name: "si", scope: !4, file: !3, line: 78, type: !7)
!12 = !DILocation(line: 78, column: 3, scope: !4)
!13 = !DILocalVariable(name: "ub", scope: !4, file: !3, line: 72, type: !9)
!14 = !DILocation(line: 72, column: 3, scope: !4)
!15 = !DILocalVariable(name: "ua", scope: !4, file: !3, line: 71, type: !9)
!16 = !DILocation(line: 71, column: 3, scope: !4)
!17 = !DILocalVariable(name: "c", scope: !4, file: !3, line: 36, type: !7)
!18 = !DILocation(line: 36, column: 3, scope: !4)
!19 = !DILocalVariable(name: "b", scope: !4, file: !3, line: 35, type: !7)
!20 = !DILocation(line: 35, column: 3, scope: !4)
!21 = !DILocalVariable(name: "a", scope: !4, file: !3, line: 34, type: !7)
!22 = !DILocation(line: 34, column: 3, scope: !4)
!23 = !DILocalVariable(name: "v", scope: !4, file: !3, line: 10, type: !7)
!24 = !DILocation(line: 10, column: 3, scope: !4)
!25 = !DILocalVariable(name: "f", scope: !4, file: !3, line: 9, type: !26)
!26 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!27 = !DILocation(line: 9, column: 3, scope: !4)
!28 = !DILocalVariable(name: "t", scope: !4, file: !3, line: 8, type: !26)
!29 = !DILocation(line: 8, column: 3, scope: !4)
!30 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 7, type: !7)
!31 = !DILocation(line: 7, column: 3, scope: !4)
!32 = !DILocation(line: 12, column: 3, scope: !4)
!33 = !DILocation(line: 12, column: 15, scope: !4)
!34 = !DILocation(line: 13, column: 3, scope: !4)
!35 = !DILocation(line: 13, column: 15, scope: !4)
!36 = !DILocation(line: 15, column: 3, scope: !4)
!37 = !DILocation(line: 16, column: 3, scope: !4)
!38 = !DILocation(line: 16, column: 15, scope: !4)
!39 = !DILocation(line: 17, column: 3, scope: !4)
!40 = !DILocation(line: 18, column: 3, scope: !4)
!41 = !DILocation(line: 18, column: 15, scope: !4)
!42 = !DILocation(line: 19, column: 3, scope: !4)
!43 = !DILocation(line: 20, column: 3, scope: !4)
!44 = !DILocation(line: 20, column: 15, scope: !4)
!45 = !DILocation(line: 22, column: 3, scope: !4)
!46 = !DILocation(line: 23, column: 3, scope: !4)
!47 = !DILocation(line: 23, column: 15, scope: !4)
!48 = !DILocation(line: 24, column: 3, scope: !4)
!49 = !DILocation(line: 25, column: 3, scope: !4)
!50 = !DILocation(line: 25, column: 15, scope: !4)
!51 = !DILocation(line: 26, column: 3, scope: !4)
!52 = !DILocation(line: 27, column: 3, scope: !4)
!53 = !DILocation(line: 27, column: 15, scope: !4)
!54 = !DILocation(line: 29, column: 3, scope: !4)
!55 = !DILocation(line: 30, column: 3, scope: !4)
!56 = !DILocation(line: 30, column: 15, scope: !4)
!57 = !DILocation(line: 31, column: 3, scope: !4)
!58 = !DILocation(line: 32, column: 3, scope: !4)
!59 = !DILocation(line: 32, column: 15, scope: !4)
!60 = !DILocation(line: 38, column: 3, scope: !4)
!61 = !DILocation(line: 39, column: 3, scope: !4)
!62 = !DILocation(line: 39, column: 15, scope: !4)
!63 = !DILocation(line: 40, column: 3, scope: !4)
!64 = !DILocation(line: 41, column: 3, scope: !4)
!65 = !DILocation(line: 41, column: 15, scope: !4)
!66 = !DILocation(line: 42, column: 3, scope: !4)
!67 = !DILocation(line: 43, column: 3, scope: !4)
!68 = !DILocation(line: 43, column: 15, scope: !4)
!69 = !DILocation(line: 44, column: 3, scope: !4)
!70 = !DILocation(line: 45, column: 3, scope: !4)
!71 = !DILocation(line: 45, column: 15, scope: !4)
!72 = !DILocation(line: 46, column: 3, scope: !4)
!73 = !DILocation(line: 47, column: 3, scope: !4)
!74 = !DILocation(line: 47, column: 15, scope: !4)
!75 = !DILocation(line: 48, column: 3, scope: !4)
!76 = !DILocation(line: 49, column: 3, scope: !4)
!77 = !DILocation(line: 49, column: 15, scope: !4)
!78 = !DILocation(line: 50, column: 3, scope: !4)
!79 = !DILocation(line: 51, column: 3, scope: !4)
!80 = !DILocation(line: 51, column: 15, scope: !4)
!81 = !DILocation(line: 52, column: 3, scope: !4)
!82 = !DILocation(line: 53, column: 3, scope: !4)
!83 = !DILocation(line: 53, column: 15, scope: !4)
!84 = !DILocation(line: 54, column: 3, scope: !4)
!85 = !DILocation(line: 55, column: 3, scope: !4)
!86 = !DILocation(line: 55, column: 15, scope: !4)
!87 = !DILocation(line: 56, column: 3, scope: !4)
!88 = !DILocation(line: 57, column: 3, scope: !4)
!89 = !DILocation(line: 57, column: 15, scope: !4)
!90 = !DILocation(line: 58, column: 3, scope: !4)
!91 = !DILocation(line: 59, column: 3, scope: !4)
!92 = !DILocation(line: 59, column: 15, scope: !4)
!93 = !DILocation(line: 60, column: 3, scope: !4)
!94 = !DILocation(line: 61, column: 3, scope: !4)
!95 = !DILocation(line: 61, column: 15, scope: !4)
!96 = !DILocation(line: 62, column: 3, scope: !4)
!97 = !DILocation(line: 63, column: 3, scope: !4)
!98 = !DILocation(line: 63, column: 15, scope: !4)
!99 = !DILocation(line: 64, column: 3, scope: !4)
!100 = !DILocation(line: 65, column: 3, scope: !4)
!101 = !DILocation(line: 65, column: 15, scope: !4)
!102 = !DILocation(line: 66, column: 3, scope: !4)
!103 = !DILocation(line: 67, column: 3, scope: !4)
!104 = !DILocation(line: 67, column: 15, scope: !4)
!105 = !DILocation(line: 68, column: 3, scope: !4)
!106 = !DILocation(line: 69, column: 3, scope: !4)
!107 = !DILocation(line: 69, column: 15, scope: !4)
!108 = !DILocation(line: 73, column: 3, scope: !4)
!109 = !DILocation(line: 74, column: 3, scope: !4)
!110 = !DILocation(line: 74, column: 15, scope: !4)
!111 = !DILocation(line: 75, column: 3, scope: !4)
!112 = !DILocation(line: 76, column: 3, scope: !4)
!113 = !DILocation(line: 76, column: 15, scope: !4)
!114 = !DILocation(line: 80, column: 3, scope: !4)
!115 = !DILocation(line: 81, column: 3, scope: !4)
!116 = !DILocation(line: 81, column: 15, scope: !4)
!117 = !DILocation(line: 82, column: 3, scope: !4)
!118 = !DILocation(line: 83, column: 3, scope: !4)
!119 = !DILocation(line: 83, column: 15, scope: !4)
!120 = !DILocation(line: 88, column: 3, scope: !4)
!121 = !DILocation(line: 89, column: 3, scope: !4)
!122 = !DILocation(line: 89, column: 15, scope: !4)
!123 = !DILocation(line: 90, column: 3, scope: !4)
!124 = !DILocation(line: 91, column: 3, scope: !4)
!125 = !DILocation(line: 91, column: 15, scope: !4)
!126 = !DILocation(line: 92, column: 3, scope: !4)
!127 = !DILocation(line: 93, column: 3, scope: !4)
!128 = !DILocation(line: 93, column: 15, scope: !4)
!129 = !DILocation(line: 94, column: 3, scope: !4)
!130 = !DILocation(line: 95, column: 3, scope: !4)
!131 = !DILocation(line: 95, column: 15, scope: !4)
!132 = !DILocation(line: 96, column: 3, scope: !4)
!133 = !DILocation(line: 97, column: 3, scope: !4)
!134 = !DILocation(line: 97, column: 15, scope: !4)
!135 = !DILocation(line: 101, column: 3, scope: !4)
!136 = !DILocation(line: 101, column: 25, scope: !4)
!137 = !DILocation(line: 102, column: 3, scope: !4)
!138 = !DILocation(line: 102, column: 27, scope: !4)
!139 = !DILocation(line: 103, column: 3, scope: !4)
!140 = !DILocation(line: 103, column: 23, scope: !4)
!141 = !DILocation(line: 104, column: 3, scope: !4)
!142 = !DILocation(line: 104, column: 27, scope: !4)
!143 = !DILocation(line: 106, column: 3, scope: !4)
!144 = !DILocation(line: 107, column: 5, scope: !145)
!145 = distinct !DILexicalBlock(scope: !4, file: !3, line: 106, column: 17)
!146 = !DILocation(line: 109, column: 5, scope: !147)
!147 = distinct !DILexicalBlock(scope: !4, file: !3, line: 108, column: 10)
!148 = !DILocation(line: 111, column: 3, scope: !4)
