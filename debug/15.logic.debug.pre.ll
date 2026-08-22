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
  br i1 %8, label %land.rhs, label %land.end, !dbg !36

land.rhs:                                         ; preds = %if.end3
  %9 = load i1, ptr %f, align 1, !dbg !36
  br label %land.end, !dbg !36

land.end:                                         ; preds = %land.rhs, %if.end3
  %10 = phi i1 [ false, %if.end3 ], [ %9, %land.rhs ], !dbg !36
  %11 = zext i1 %10 to i32, !dbg !36
  store i32 %11, ptr %v, align 4, !dbg !36
  %12 = load i32, ptr %v, align 4, !dbg !36
  %13 = load i32, ptr %v, align 4, !dbg !37
  %14 = icmp ne i32 %13, 0, !dbg !37
  br i1 %14, label %then4, label %else5, !dbg !37

then4:                                            ; preds = %land.end
  store i32 1, ptr %err, align 4, !dbg !38
  %15 = load i32, ptr %err, align 4, !dbg !38
  br label %if.end6, !dbg !38

else5:                                            ; preds = %land.end
  br label %if.end6, !dbg !38

if.end6:                                          ; preds = %else5, %then4
  %16 = load i1, ptr %t, align 1, !dbg !39
  br i1 %16, label %land.rhs7, label %land.end8, !dbg !39

land.rhs7:                                        ; preds = %if.end6
  %17 = load i1, ptr %t, align 1, !dbg !39
  br label %land.end8, !dbg !39

land.end8:                                        ; preds = %land.rhs7, %if.end6
  %18 = phi i1 [ false, %if.end6 ], [ %17, %land.rhs7 ], !dbg !39
  %19 = zext i1 %18 to i32, !dbg !39
  store i32 %19, ptr %v, align 4, !dbg !39
  %20 = load i32, ptr %v, align 4, !dbg !39
  %21 = load i32, ptr %v, align 4, !dbg !40
  %22 = icmp eq i32 %21, 0, !dbg !40
  br i1 %22, label %then9, label %else10, !dbg !40

then9:                                            ; preds = %land.end8
  store i32 1, ptr %err, align 4, !dbg !41
  %23 = load i32, ptr %err, align 4, !dbg !41
  br label %if.end11, !dbg !41

else10:                                           ; preds = %land.end8
  br label %if.end11, !dbg !41

if.end11:                                         ; preds = %else10, %then9
  %24 = load i1, ptr %f, align 1, !dbg !42
  br i1 %24, label %land.rhs12, label %land.end13, !dbg !42

land.rhs12:                                       ; preds = %if.end11
  %25 = load i1, ptr %f, align 1, !dbg !42
  br label %land.end13, !dbg !42

land.end13:                                       ; preds = %land.rhs12, %if.end11
  %26 = phi i1 [ false, %if.end11 ], [ %25, %land.rhs12 ], !dbg !42
  %27 = zext i1 %26 to i32, !dbg !42
  store i32 %27, ptr %v, align 4, !dbg !42
  %28 = load i32, ptr %v, align 4, !dbg !42
  %29 = load i32, ptr %v, align 4, !dbg !43
  %30 = icmp ne i32 %29, 0, !dbg !43
  br i1 %30, label %then14, label %else15, !dbg !43

then14:                                           ; preds = %land.end13
  store i32 1, ptr %err, align 4, !dbg !44
  %31 = load i32, ptr %err, align 4, !dbg !44
  br label %if.end16, !dbg !44

else15:                                           ; preds = %land.end13
  br label %if.end16, !dbg !44

if.end16:                                         ; preds = %else15, %then14
  %32 = load i1, ptr %t, align 1, !dbg !45
  br i1 %32, label %lor.end, label %lor.rhs, !dbg !45

lor.rhs:                                          ; preds = %if.end16
  %33 = load i1, ptr %f, align 1, !dbg !45
  br label %lor.end, !dbg !45

lor.end:                                          ; preds = %lor.rhs, %if.end16
  %34 = phi i1 [ true, %if.end16 ], [ %33, %lor.rhs ], !dbg !45
  %35 = zext i1 %34 to i32, !dbg !45
  store i32 %35, ptr %v, align 4, !dbg !45
  %36 = load i32, ptr %v, align 4, !dbg !45
  %37 = load i32, ptr %v, align 4, !dbg !46
  %38 = icmp eq i32 %37, 0, !dbg !46
  br i1 %38, label %then17, label %else18, !dbg !46

then17:                                           ; preds = %lor.end
  store i32 1, ptr %err, align 4, !dbg !47
  %39 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end19, !dbg !47

else18:                                           ; preds = %lor.end
  br label %if.end19, !dbg !47

if.end19:                                         ; preds = %else18, %then17
  %40 = load i1, ptr %t, align 1, !dbg !48
  br i1 %40, label %lor.end21, label %lor.rhs20, !dbg !48

lor.rhs20:                                        ; preds = %if.end19
  %41 = load i1, ptr %t, align 1, !dbg !48
  br label %lor.end21, !dbg !48

lor.end21:                                        ; preds = %lor.rhs20, %if.end19
  %42 = phi i1 [ true, %if.end19 ], [ %41, %lor.rhs20 ], !dbg !48
  %43 = zext i1 %42 to i32, !dbg !48
  store i32 %43, ptr %v, align 4, !dbg !48
  %44 = load i32, ptr %v, align 4, !dbg !48
  %45 = load i32, ptr %v, align 4, !dbg !49
  %46 = icmp eq i32 %45, 0, !dbg !49
  br i1 %46, label %then22, label %else23, !dbg !49

then22:                                           ; preds = %lor.end21
  store i32 1, ptr %err, align 4, !dbg !50
  %47 = load i32, ptr %err, align 4, !dbg !50
  br label %if.end24, !dbg !50

else23:                                           ; preds = %lor.end21
  br label %if.end24, !dbg !50

if.end24:                                         ; preds = %else23, %then22
  %48 = load i1, ptr %f, align 1, !dbg !51
  br i1 %48, label %lor.end26, label %lor.rhs25, !dbg !51

lor.rhs25:                                        ; preds = %if.end24
  %49 = load i1, ptr %f, align 1, !dbg !51
  br label %lor.end26, !dbg !51

lor.end26:                                        ; preds = %lor.rhs25, %if.end24
  %50 = phi i1 [ true, %if.end24 ], [ %49, %lor.rhs25 ], !dbg !51
  %51 = zext i1 %50 to i32, !dbg !51
  store i32 %51, ptr %v, align 4, !dbg !51
  %52 = load i32, ptr %v, align 4, !dbg !51
  %53 = load i32, ptr %v, align 4, !dbg !52
  %54 = icmp ne i32 %53, 0, !dbg !52
  br i1 %54, label %then27, label %else28, !dbg !52

then27:                                           ; preds = %lor.end26
  store i32 1, ptr %err, align 4, !dbg !53
  %55 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end29, !dbg !53

else28:                                           ; preds = %lor.end26
  br label %if.end29, !dbg !53

if.end29:                                         ; preds = %else28, %then27
  %56 = load i1, ptr %t, align 1, !dbg !54
  %57 = icmp eq i1 %56, false, !dbg !54
  %58 = zext i1 %57 to i32, !dbg !54
  store i32 %58, ptr %v, align 4, !dbg !54
  %59 = load i32, ptr %v, align 4, !dbg !54
  %60 = load i32, ptr %v, align 4, !dbg !55
  %61 = icmp ne i32 %60, 0, !dbg !55
  br i1 %61, label %then30, label %else31, !dbg !55

then30:                                           ; preds = %if.end29
  store i32 1, ptr %err, align 4, !dbg !56
  %62 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end32, !dbg !56

else31:                                           ; preds = %if.end29
  br label %if.end32, !dbg !56

if.end32:                                         ; preds = %else31, %then30
  %63 = load i1, ptr %f, align 1, !dbg !57
  %64 = icmp eq i1 %63, false, !dbg !57
  %65 = zext i1 %64 to i32, !dbg !57
  store i32 %65, ptr %v, align 4, !dbg !57
  %66 = load i32, ptr %v, align 4, !dbg !57
  %67 = load i32, ptr %v, align 4, !dbg !58
  %68 = icmp eq i32 %67, 0, !dbg !58
  br i1 %68, label %then33, label %else34, !dbg !58

then33:                                           ; preds = %if.end32
  store i32 1, ptr %err, align 4, !dbg !59
  %69 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end35, !dbg !59

else34:                                           ; preds = %if.end32
  br label %if.end35, !dbg !59

if.end35:                                         ; preds = %else34, %then33
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
  br i1 %76, label %then36, label %else37, !dbg !61

then36:                                           ; preds = %if.end35
  store i32 1, ptr %err, align 4, !dbg !62
  %77 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end38, !dbg !62

else37:                                           ; preds = %if.end35
  br label %if.end38, !dbg !62

if.end38:                                         ; preds = %else37, %then36
  %78 = load i32, ptr %a, align 4, !dbg !63
  %79 = load i32, ptr %c, align 4, !dbg !63
  %80 = icmp eq i32 %78, %79, !dbg !63
  %81 = zext i1 %80 to i32, !dbg !63
  store i32 %81, ptr %v, align 4, !dbg !63
  %82 = load i32, ptr %v, align 4, !dbg !63
  %83 = load i32, ptr %v, align 4, !dbg !64
  %84 = icmp ne i32 %83, 0, !dbg !64
  br i1 %84, label %then39, label %else40, !dbg !64

then39:                                           ; preds = %if.end38
  store i32 1, ptr %err, align 4, !dbg !65
  %85 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end41, !dbg !65

else40:                                           ; preds = %if.end38
  br label %if.end41, !dbg !65

if.end41:                                         ; preds = %else40, %then39
  %86 = load i32, ptr %a, align 4, !dbg !66
  %87 = load i32, ptr %b, align 4, !dbg !66
  %88 = icmp ne i32 %86, %87, !dbg !66
  %89 = zext i1 %88 to i32, !dbg !66
  store i32 %89, ptr %v, align 4, !dbg !66
  %90 = load i32, ptr %v, align 4, !dbg !66
  %91 = load i32, ptr %v, align 4, !dbg !67
  %92 = icmp ne i32 %91, 0, !dbg !67
  br i1 %92, label %then42, label %else43, !dbg !67

then42:                                           ; preds = %if.end41
  store i32 1, ptr %err, align 4, !dbg !68
  %93 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end44, !dbg !68

else43:                                           ; preds = %if.end41
  br label %if.end44, !dbg !68

if.end44:                                         ; preds = %else43, %then42
  %94 = load i32, ptr %a, align 4, !dbg !69
  %95 = load i32, ptr %c, align 4, !dbg !69
  %96 = icmp ne i32 %94, %95, !dbg !69
  %97 = zext i1 %96 to i32, !dbg !69
  store i32 %97, ptr %v, align 4, !dbg !69
  %98 = load i32, ptr %v, align 4, !dbg !69
  %99 = load i32, ptr %v, align 4, !dbg !70
  %100 = icmp eq i32 %99, 0, !dbg !70
  br i1 %100, label %then45, label %else46, !dbg !70

then45:                                           ; preds = %if.end44
  store i32 1, ptr %err, align 4, !dbg !71
  %101 = load i32, ptr %err, align 4, !dbg !71
  br label %if.end47, !dbg !71

else46:                                           ; preds = %if.end44
  br label %if.end47, !dbg !71

if.end47:                                         ; preds = %else46, %then45
  %102 = load i32, ptr %a, align 4, !dbg !72
  %103 = load i32, ptr %b, align 4, !dbg !72
  %104 = icmp slt i32 %102, %103, !dbg !72
  %105 = zext i1 %104 to i32, !dbg !72
  store i32 %105, ptr %v, align 4, !dbg !72
  %106 = load i32, ptr %v, align 4, !dbg !72
  %107 = load i32, ptr %v, align 4, !dbg !73
  %108 = icmp ne i32 %107, 0, !dbg !73
  br i1 %108, label %then48, label %else49, !dbg !73

then48:                                           ; preds = %if.end47
  store i32 1, ptr %err, align 4, !dbg !74
  %109 = load i32, ptr %err, align 4, !dbg !74
  br label %if.end50, !dbg !74

else49:                                           ; preds = %if.end47
  br label %if.end50, !dbg !74

if.end50:                                         ; preds = %else49, %then48
  %110 = load i32, ptr %a, align 4, !dbg !75
  %111 = load i32, ptr %c, align 4, !dbg !75
  %112 = icmp slt i32 %110, %111, !dbg !75
  %113 = zext i1 %112 to i32, !dbg !75
  store i32 %113, ptr %v, align 4, !dbg !75
  %114 = load i32, ptr %v, align 4, !dbg !75
  %115 = load i32, ptr %v, align 4, !dbg !76
  %116 = icmp eq i32 %115, 0, !dbg !76
  br i1 %116, label %then51, label %else52, !dbg !76

then51:                                           ; preds = %if.end50
  store i32 1, ptr %err, align 4, !dbg !77
  %117 = load i32, ptr %err, align 4, !dbg !77
  br label %if.end53, !dbg !77

else52:                                           ; preds = %if.end50
  br label %if.end53, !dbg !77

if.end53:                                         ; preds = %else52, %then51
  %118 = load i32, ptr %c, align 4, !dbg !78
  %119 = load i32, ptr %a, align 4, !dbg !78
  %120 = icmp slt i32 %118, %119, !dbg !78
  %121 = zext i1 %120 to i32, !dbg !78
  store i32 %121, ptr %v, align 4, !dbg !78
  %122 = load i32, ptr %v, align 4, !dbg !78
  %123 = load i32, ptr %v, align 4, !dbg !79
  %124 = icmp ne i32 %123, 0, !dbg !79
  br i1 %124, label %then54, label %else55, !dbg !79

then54:                                           ; preds = %if.end53
  store i32 1, ptr %err, align 4, !dbg !80
  %125 = load i32, ptr %err, align 4, !dbg !80
  br label %if.end56, !dbg !80

else55:                                           ; preds = %if.end53
  br label %if.end56, !dbg !80

if.end56:                                         ; preds = %else55, %then54
  %126 = load i32, ptr %a, align 4, !dbg !81
  %127 = load i32, ptr %b, align 4, !dbg !81
  %128 = icmp sle i32 %126, %127, !dbg !81
  %129 = zext i1 %128 to i32, !dbg !81
  store i32 %129, ptr %v, align 4, !dbg !81
  %130 = load i32, ptr %v, align 4, !dbg !81
  %131 = load i32, ptr %v, align 4, !dbg !82
  %132 = icmp eq i32 %131, 0, !dbg !82
  br i1 %132, label %then57, label %else58, !dbg !82

then57:                                           ; preds = %if.end56
  store i32 1, ptr %err, align 4, !dbg !83
  %133 = load i32, ptr %err, align 4, !dbg !83
  br label %if.end59, !dbg !83

else58:                                           ; preds = %if.end56
  br label %if.end59, !dbg !83

if.end59:                                         ; preds = %else58, %then57
  %134 = load i32, ptr %a, align 4, !dbg !84
  %135 = load i32, ptr %c, align 4, !dbg !84
  %136 = icmp sle i32 %134, %135, !dbg !84
  %137 = zext i1 %136 to i32, !dbg !84
  store i32 %137, ptr %v, align 4, !dbg !84
  %138 = load i32, ptr %v, align 4, !dbg !84
  %139 = load i32, ptr %v, align 4, !dbg !85
  %140 = icmp eq i32 %139, 0, !dbg !85
  br i1 %140, label %then60, label %else61, !dbg !85

then60:                                           ; preds = %if.end59
  store i32 1, ptr %err, align 4, !dbg !86
  %141 = load i32, ptr %err, align 4, !dbg !86
  br label %if.end62, !dbg !86

else61:                                           ; preds = %if.end59
  br label %if.end62, !dbg !86

if.end62:                                         ; preds = %else61, %then60
  %142 = load i32, ptr %c, align 4, !dbg !87
  %143 = load i32, ptr %a, align 4, !dbg !87
  %144 = icmp sle i32 %142, %143, !dbg !87
  %145 = zext i1 %144 to i32, !dbg !87
  store i32 %145, ptr %v, align 4, !dbg !87
  %146 = load i32, ptr %v, align 4, !dbg !87
  %147 = load i32, ptr %v, align 4, !dbg !88
  %148 = icmp ne i32 %147, 0, !dbg !88
  br i1 %148, label %then63, label %else64, !dbg !88

then63:                                           ; preds = %if.end62
  store i32 1, ptr %err, align 4, !dbg !89
  %149 = load i32, ptr %err, align 4, !dbg !89
  br label %if.end65, !dbg !89

else64:                                           ; preds = %if.end62
  br label %if.end65, !dbg !89

if.end65:                                         ; preds = %else64, %then63
  %150 = load i32, ptr %a, align 4, !dbg !90
  %151 = load i32, ptr %b, align 4, !dbg !90
  %152 = icmp sgt i32 %150, %151, !dbg !90
  %153 = zext i1 %152 to i32, !dbg !90
  store i32 %153, ptr %v, align 4, !dbg !90
  %154 = load i32, ptr %v, align 4, !dbg !90
  %155 = load i32, ptr %v, align 4, !dbg !91
  %156 = icmp ne i32 %155, 0, !dbg !91
  br i1 %156, label %then66, label %else67, !dbg !91

then66:                                           ; preds = %if.end65
  store i32 1, ptr %err, align 4, !dbg !92
  %157 = load i32, ptr %err, align 4, !dbg !92
  br label %if.end68, !dbg !92

else67:                                           ; preds = %if.end65
  br label %if.end68, !dbg !92

if.end68:                                         ; preds = %else67, %then66
  %158 = load i32, ptr %a, align 4, !dbg !93
  %159 = load i32, ptr %c, align 4, !dbg !93
  %160 = icmp sgt i32 %158, %159, !dbg !93
  %161 = zext i1 %160 to i32, !dbg !93
  store i32 %161, ptr %v, align 4, !dbg !93
  %162 = load i32, ptr %v, align 4, !dbg !93
  %163 = load i32, ptr %v, align 4, !dbg !94
  %164 = icmp ne i32 %163, 0, !dbg !94
  br i1 %164, label %then69, label %else70, !dbg !94

then69:                                           ; preds = %if.end68
  store i32 1, ptr %err, align 4, !dbg !95
  %165 = load i32, ptr %err, align 4, !dbg !95
  br label %if.end71, !dbg !95

else70:                                           ; preds = %if.end68
  br label %if.end71, !dbg !95

if.end71:                                         ; preds = %else70, %then69
  %166 = load i32, ptr %c, align 4, !dbg !96
  %167 = load i32, ptr %a, align 4, !dbg !96
  %168 = icmp sgt i32 %166, %167, !dbg !96
  %169 = zext i1 %168 to i32, !dbg !96
  store i32 %169, ptr %v, align 4, !dbg !96
  %170 = load i32, ptr %v, align 4, !dbg !96
  %171 = load i32, ptr %v, align 4, !dbg !97
  %172 = icmp eq i32 %171, 0, !dbg !97
  br i1 %172, label %then72, label %else73, !dbg !97

then72:                                           ; preds = %if.end71
  store i32 1, ptr %err, align 4, !dbg !98
  %173 = load i32, ptr %err, align 4, !dbg !98
  br label %if.end74, !dbg !98

else73:                                           ; preds = %if.end71
  br label %if.end74, !dbg !98

if.end74:                                         ; preds = %else73, %then72
  %174 = load i32, ptr %a, align 4, !dbg !99
  %175 = load i32, ptr %b, align 4, !dbg !99
  %176 = icmp sge i32 %174, %175, !dbg !99
  %177 = zext i1 %176 to i32, !dbg !99
  store i32 %177, ptr %v, align 4, !dbg !99
  %178 = load i32, ptr %v, align 4, !dbg !99
  %179 = load i32, ptr %v, align 4, !dbg !100
  %180 = icmp eq i32 %179, 0, !dbg !100
  br i1 %180, label %then75, label %else76, !dbg !100

then75:                                           ; preds = %if.end74
  store i32 1, ptr %err, align 4, !dbg !101
  %181 = load i32, ptr %err, align 4, !dbg !101
  br label %if.end77, !dbg !101

else76:                                           ; preds = %if.end74
  br label %if.end77, !dbg !101

if.end77:                                         ; preds = %else76, %then75
  %182 = load i32, ptr %a, align 4, !dbg !102
  %183 = load i32, ptr %c, align 4, !dbg !102
  %184 = icmp sge i32 %182, %183, !dbg !102
  %185 = zext i1 %184 to i32, !dbg !102
  store i32 %185, ptr %v, align 4, !dbg !102
  %186 = load i32, ptr %v, align 4, !dbg !102
  %187 = load i32, ptr %v, align 4, !dbg !103
  %188 = icmp ne i32 %187, 0, !dbg !103
  br i1 %188, label %then78, label %else79, !dbg !103

then78:                                           ; preds = %if.end77
  store i32 1, ptr %err, align 4, !dbg !104
  %189 = load i32, ptr %err, align 4, !dbg !104
  br label %if.end80, !dbg !104

else79:                                           ; preds = %if.end77
  br label %if.end80, !dbg !104

if.end80:                                         ; preds = %else79, %then78
  %190 = load i32, ptr %c, align 4, !dbg !105
  %191 = load i32, ptr %a, align 4, !dbg !105
  %192 = icmp sge i32 %190, %191, !dbg !105
  %193 = zext i1 %192 to i32, !dbg !105
  store i32 %193, ptr %v, align 4, !dbg !105
  %194 = load i32, ptr %v, align 4, !dbg !105
  %195 = load i32, ptr %v, align 4, !dbg !106
  %196 = icmp eq i32 %195, 0, !dbg !106
  br i1 %196, label %then81, label %else82, !dbg !106

then81:                                           ; preds = %if.end80
  store i32 1, ptr %err, align 4, !dbg !107
  %197 = load i32, ptr %err, align 4, !dbg !107
  br label %if.end83, !dbg !107

else82:                                           ; preds = %if.end80
  br label %if.end83, !dbg !107

if.end83:                                         ; preds = %else82, %then81
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
  br i1 %204, label %then84, label %else85, !dbg !109

then84:                                           ; preds = %if.end83
  store i32 1, ptr %err, align 4, !dbg !110
  %205 = load i32, ptr %err, align 4, !dbg !110
  br label %if.end86, !dbg !110

else85:                                           ; preds = %if.end83
  br label %if.end86, !dbg !110

if.end86:                                         ; preds = %else85, %then84
  %206 = load i32, ptr %ub, align 4, !dbg !111
  %207 = load i32, ptr %ua, align 4, !dbg !111
  %208 = icmp ugt i32 %206, %207, !dbg !111
  %209 = zext i1 %208 to i32, !dbg !111
  store i32 %209, ptr %v, align 4, !dbg !111
  %210 = load i32, ptr %v, align 4, !dbg !111
  %211 = load i32, ptr %v, align 4, !dbg !112
  %212 = icmp eq i32 %211, 0, !dbg !112
  br i1 %212, label %then87, label %else88, !dbg !112

then87:                                           ; preds = %if.end86
  store i32 1, ptr %err, align 4, !dbg !113
  %213 = load i32, ptr %err, align 4, !dbg !113
  br label %if.end89, !dbg !113

else88:                                           ; preds = %if.end86
  br label %if.end89, !dbg !113

if.end89:                                         ; preds = %else88, %then87
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
  br i1 %220, label %then90, label %else91, !dbg !115

then90:                                           ; preds = %if.end89
  store i32 1, ptr %err, align 4, !dbg !116
  %221 = load i32, ptr %err, align 4, !dbg !116
  br label %if.end92, !dbg !116

else91:                                           ; preds = %if.end89
  br label %if.end92, !dbg !116

if.end92:                                         ; preds = %else91, %then90
  %222 = load i32, ptr %si, align 4, !dbg !117
  %223 = load i32, ptr %ui, align 4, !dbg !117
  %224 = icmp ugt i32 %222, %223, !dbg !117
  %225 = zext i1 %224 to i32, !dbg !117
  store i32 %225, ptr %v, align 4, !dbg !117
  %226 = load i32, ptr %v, align 4, !dbg !117
  %227 = load i32, ptr %v, align 4, !dbg !118
  %228 = icmp eq i32 %227, 0, !dbg !118
  br i1 %228, label %then93, label %else94, !dbg !118

then93:                                           ; preds = %if.end92
  store i32 1, ptr %err, align 4, !dbg !119
  %229 = load i32, ptr %err, align 4, !dbg !119
  br label %if.end95, !dbg !119

else94:                                           ; preds = %if.end92
  br label %if.end95, !dbg !119

if.end95:                                         ; preds = %else94, %then93
  %230 = load i32, ptr %a, align 4, !dbg !120
  %231 = load i32, ptr %c, align 4, !dbg !120
  %232 = icmp slt i32 %230, %231, !dbg !120
  %233 = zext i1 %232 to i32, !dbg !120
  store i32 %233, ptr %v, align 4, !dbg !120
  %234 = load i32, ptr %v, align 4, !dbg !120
  %235 = load i32, ptr %v, align 4, !dbg !121
  %236 = icmp ne i32 %235, 1, !dbg !121
  br i1 %236, label %then96, label %else97, !dbg !121

then96:                                           ; preds = %if.end95
  store i32 1, ptr %err, align 4, !dbg !122
  %237 = load i32, ptr %err, align 4, !dbg !122
  br label %if.end98, !dbg !122

else97:                                           ; preds = %if.end95
  br label %if.end98, !dbg !122

if.end98:                                         ; preds = %else97, %then96
  %238 = load i32, ptr %a, align 4, !dbg !123
  %239 = load i32, ptr %b, align 4, !dbg !123
  %240 = icmp eq i32 %238, %239, !dbg !123
  %241 = zext i1 %240 to i32, !dbg !123
  store i32 %241, ptr %v, align 4, !dbg !123
  %242 = load i32, ptr %v, align 4, !dbg !123
  %243 = load i32, ptr %v, align 4, !dbg !124
  %244 = icmp ne i32 %243, 1, !dbg !124
  br i1 %244, label %then99, label %else100, !dbg !124

then99:                                           ; preds = %if.end98
  store i32 1, ptr %err, align 4, !dbg !125
  %245 = load i32, ptr %err, align 4, !dbg !125
  br label %if.end101, !dbg !125

else100:                                          ; preds = %if.end98
  br label %if.end101, !dbg !125

if.end101:                                        ; preds = %else100, %then99
  %246 = load i1, ptr %t, align 1, !dbg !126
  br i1 %246, label %land.rhs102, label %land.end103, !dbg !126

land.rhs102:                                      ; preds = %if.end101
  %247 = load i1, ptr %t, align 1, !dbg !126
  br label %land.end103, !dbg !126

land.end103:                                      ; preds = %land.rhs102, %if.end101
  %248 = phi i1 [ false, %if.end101 ], [ %247, %land.rhs102 ], !dbg !126
  %249 = zext i1 %248 to i32, !dbg !126
  store i32 %249, ptr %v, align 4, !dbg !126
  %250 = load i32, ptr %v, align 4, !dbg !126
  %251 = load i32, ptr %v, align 4, !dbg !127
  %252 = icmp ne i32 %251, 1, !dbg !127
  br i1 %252, label %then104, label %else105, !dbg !127

then104:                                          ; preds = %land.end103
  store i32 1, ptr %err, align 4, !dbg !128
  %253 = load i32, ptr %err, align 4, !dbg !128
  br label %if.end106, !dbg !128

else105:                                          ; preds = %land.end103
  br label %if.end106, !dbg !128

if.end106:                                        ; preds = %else105, %then104
  %254 = load i1, ptr %t, align 1, !dbg !129
  br i1 %254, label %lor.end108, label %lor.rhs107, !dbg !129

lor.rhs107:                                       ; preds = %if.end106
  %255 = load i1, ptr %f, align 1, !dbg !129
  br label %lor.end108, !dbg !129

lor.end108:                                       ; preds = %lor.rhs107, %if.end106
  %256 = phi i1 [ true, %if.end106 ], [ %255, %lor.rhs107 ], !dbg !129
  %257 = zext i1 %256 to i32, !dbg !129
  store i32 %257, ptr %v, align 4, !dbg !129
  %258 = load i32, ptr %v, align 4, !dbg !129
  %259 = load i32, ptr %v, align 4, !dbg !130
  %260 = icmp ne i32 %259, 1, !dbg !130
  br i1 %260, label %then109, label %else110, !dbg !130

then109:                                          ; preds = %lor.end108
  store i32 1, ptr %err, align 4, !dbg !131
  %261 = load i32, ptr %err, align 4, !dbg !131
  br label %if.end111, !dbg !131

else110:                                          ; preds = %lor.end108
  br label %if.end111, !dbg !131

if.end111:                                        ; preds = %else110, %then109
  %262 = load i1, ptr %f, align 1, !dbg !132
  %263 = icmp eq i1 %262, false, !dbg !132
  %264 = zext i1 %263 to i32, !dbg !132
  store i32 %264, ptr %v, align 4, !dbg !132
  %265 = load i32, ptr %v, align 4, !dbg !132
  %266 = load i32, ptr %v, align 4, !dbg !133
  %267 = icmp ne i32 %266, 1, !dbg !133
  br i1 %267, label %then112, label %else113, !dbg !133

then112:                                          ; preds = %if.end111
  store i32 1, ptr %err, align 4, !dbg !134
  %268 = load i32, ptr %err, align 4, !dbg !134
  br label %if.end114, !dbg !134

else113:                                          ; preds = %if.end111
  br label %if.end114, !dbg !134

if.end114:                                        ; preds = %else113, %then112
  %269 = load i32, ptr %a, align 4, !dbg !135
  %270 = load i32, ptr %c, align 4, !dbg !135
  %271 = icmp slt i32 %269, %270, !dbg !135
  %272 = zext i1 %271 to i32, !dbg !135
  %273 = mul i32 %272, 3, !dbg !135
  %274 = icmp ne i32 %273, 3, !dbg !135
  br i1 %274, label %then115, label %else116, !dbg !135

then115:                                          ; preds = %if.end114
  store i32 1, ptr %err, align 4, !dbg !136
  %275 = load i32, ptr %err, align 4, !dbg !136
  br label %if.end117, !dbg !136

else116:                                          ; preds = %if.end114
  br label %if.end117, !dbg !136

if.end117:                                        ; preds = %else116, %then115
  %276 = load i32, ptr %a, align 4, !dbg !137
  %277 = load i32, ptr %c, align 4, !dbg !137
  %278 = icmp slt i32 %276, %277, !dbg !137
  %279 = zext i1 %278 to i32, !dbg !137
  %280 = add i32 %279, 10, !dbg !137
  %281 = icmp ne i32 %280, 11, !dbg !137
  br i1 %281, label %then118, label %else119, !dbg !137

then118:                                          ; preds = %if.end117
  store i32 1, ptr %err, align 4, !dbg !138
  %282 = load i32, ptr %err, align 4, !dbg !138
  br label %if.end120, !dbg !138

else119:                                          ; preds = %if.end117
  br label %if.end120, !dbg !138

if.end120:                                        ; preds = %else119, %then118
  %283 = load i32, ptr %a, align 4, !dbg !139
  %284 = load i32, ptr %c, align 4, !dbg !139
  %285 = icmp slt i32 %283, %284, !dbg !139
  %286 = zext i1 %285 to i32, !dbg !139
  %287 = sub i32 0, %286, !dbg !139
  %288 = icmp ne i32 %287, -1, !dbg !139
  br i1 %288, label %then121, label %else122, !dbg !139

then121:                                          ; preds = %if.end120
  store i32 1, ptr %err, align 4, !dbg !140
  %289 = load i32, ptr %err, align 4, !dbg !140
  br label %if.end123, !dbg !140

else122:                                          ; preds = %if.end120
  br label %if.end123, !dbg !140

if.end123:                                        ; preds = %else122, %then121
  %290 = load i32, ptr %a, align 4, !dbg !141
  %291 = load i32, ptr %c, align 4, !dbg !141
  %292 = icmp slt i32 %290, %291, !dbg !141
  %293 = zext i1 %292 to i32, !dbg !141
  %294 = icmp slt i32 %293, 5, !dbg !141
  %295 = zext i1 %294 to i32, !dbg !141
  %296 = icmp ne i32 %295, 1, !dbg !141
  br i1 %296, label %then124, label %else125, !dbg !141

then124:                                          ; preds = %if.end123
  store i32 1, ptr %err, align 4, !dbg !142
  %297 = load i32, ptr %err, align 4, !dbg !142
  br label %if.end126, !dbg !142

else125:                                          ; preds = %if.end123
  br label %if.end126, !dbg !142

if.end126:                                        ; preds = %else125, %then124
  %298 = load i32, ptr %err, align 4, !dbg !143
  %299 = icmp eq i32 %298, 0, !dbg !143
  br i1 %299, label %then127, label %else128, !dbg !143

then127:                                          ; preds = %if.end126
  %300 = call i32 (ptr, ...) @printf(ptr @0), !dbg !144
  br label %if.end129, !dbg !144

else128:                                          ; preds = %if.end126
  %301 = call i32 (ptr, ...) @printf(ptr @1), !dbg !146
  br label %if.end129, !dbg !146

if.end129:                                        ; preds = %else128, %then127
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
