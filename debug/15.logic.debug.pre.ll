; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [17 x i8] c"15.logic.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"15.logic.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %ui = alloca i32, align 4
    #dbg_declare(ptr %ui, !6, !DIExpression(), !8)
  %si = alloca i32, align 4
    #dbg_declare(ptr %si, !9, !DIExpression(), !10)
  %ub = alloca i32, align 4
    #dbg_declare(ptr %ub, !11, !DIExpression(), !12)
  %ua = alloca i32, align 4
    #dbg_declare(ptr %ua, !13, !DIExpression(), !14)
  %c = alloca i32, align 4
    #dbg_declare(ptr %c, !15, !DIExpression(), !16)
  %b = alloca i32, align 4
    #dbg_declare(ptr %b, !17, !DIExpression(), !18)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !19, !DIExpression(), !20)
  %v = alloca i32, align 4
    #dbg_declare(ptr %v, !21, !DIExpression(), !22)
  %f = alloca i1, align 1
    #dbg_declare(ptr %f, !23, !DIExpression(), !25)
  %t = alloca i1, align 1
    #dbg_declare(ptr %t, !26, !DIExpression(), !27)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !28, !DIExpression(), !29)
  store i32 0, ptr %err, align 4, !dbg !29
  store i1 true, ptr %t, align 1, !dbg !27
  store i1 false, ptr %f, align 1, !dbg !25
  %0 = load i1, ptr %t, align 1, !dbg !30
  %1 = zext i1 %0 to i32, !dbg !30
  %2 = icmp eq i32 %1, 0, !dbg !30
  br i1 %2, label %then, label %else, !dbg !30

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !31
  %3 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end, !dbg !31

else:                                             ; preds = %entry
  br label %if.end, !dbg !31

if.end:                                           ; preds = %else, %then
  %4 = load i1, ptr %f, align 1, !dbg !32
  %5 = zext i1 %4 to i32, !dbg !32
  %6 = icmp ne i32 %5, 0, !dbg !32
  br i1 %6, label %then1, label %else2, !dbg !32

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !33
  %7 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end3, !dbg !33

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !33

if.end3:                                          ; preds = %else2, %then1
  %8 = load i1, ptr %t, align 1, !dbg !34
  %9 = load i1, ptr %f, align 1, !dbg !34
  %10 = select i1 %8, i1 %9, i1 false, !dbg !34
  %11 = sext i1 %10 to i32, !dbg !34
  store i32 %11, ptr %v, align 4, !dbg !34
  %12 = load i32, ptr %v, align 4, !dbg !34
  %13 = load i32, ptr %v, align 4, !dbg !35
  %14 = icmp ne i32 %13, 0, !dbg !35
  br i1 %14, label %then4, label %else5, !dbg !35

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !36
  %15 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end6, !dbg !36

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !36

if.end6:                                          ; preds = %else5, %then4
  %16 = load i1, ptr %t, align 1, !dbg !37
  %17 = load i1, ptr %t, align 1, !dbg !37
  %18 = select i1 %16, i1 %17, i1 false, !dbg !37
  %19 = sext i1 %18 to i32, !dbg !37
  store i32 %19, ptr %v, align 4, !dbg !37
  %20 = load i32, ptr %v, align 4, !dbg !37
  %21 = load i32, ptr %v, align 4, !dbg !38
  %22 = icmp eq i32 %21, 0, !dbg !38
  br i1 %22, label %then7, label %else8, !dbg !38

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !39
  %23 = load i32, ptr %err, align 4, !dbg !39
  br label %if.end9, !dbg !39

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !39

if.end9:                                          ; preds = %else8, %then7
  %24 = load i1, ptr %f, align 1, !dbg !40
  %25 = load i1, ptr %f, align 1, !dbg !40
  %26 = select i1 %24, i1 %25, i1 false, !dbg !40
  %27 = sext i1 %26 to i32, !dbg !40
  store i32 %27, ptr %v, align 4, !dbg !40
  %28 = load i32, ptr %v, align 4, !dbg !40
  %29 = load i32, ptr %v, align 4, !dbg !41
  %30 = icmp ne i32 %29, 0, !dbg !41
  br i1 %30, label %then10, label %else11, !dbg !41

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !42
  %31 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end12, !dbg !42

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !42

if.end12:                                         ; preds = %else11, %then10
  %32 = load i1, ptr %t, align 1, !dbg !43
  %33 = load i1, ptr %f, align 1, !dbg !43
  %34 = select i1 %32, i1 true, i1 %33, !dbg !43
  %35 = sext i1 %34 to i32, !dbg !43
  store i32 %35, ptr %v, align 4, !dbg !43
  %36 = load i32, ptr %v, align 4, !dbg !43
  %37 = load i32, ptr %v, align 4, !dbg !44
  %38 = icmp eq i32 %37, 0, !dbg !44
  br i1 %38, label %then13, label %else14, !dbg !44

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !45
  %39 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end15, !dbg !45

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !45

if.end15:                                         ; preds = %else14, %then13
  %40 = load i1, ptr %t, align 1, !dbg !46
  %41 = load i1, ptr %t, align 1, !dbg !46
  %42 = select i1 %40, i1 true, i1 %41, !dbg !46
  %43 = sext i1 %42 to i32, !dbg !46
  store i32 %43, ptr %v, align 4, !dbg !46
  %44 = load i32, ptr %v, align 4, !dbg !46
  %45 = load i32, ptr %v, align 4, !dbg !47
  %46 = icmp eq i32 %45, 0, !dbg !47
  br i1 %46, label %then16, label %else17, !dbg !47

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !48
  %47 = load i32, ptr %err, align 4, !dbg !48
  br label %if.end18, !dbg !48

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !48

if.end18:                                         ; preds = %else17, %then16
  %48 = load i1, ptr %f, align 1, !dbg !49
  %49 = load i1, ptr %f, align 1, !dbg !49
  %50 = select i1 %48, i1 true, i1 %49, !dbg !49
  %51 = sext i1 %50 to i32, !dbg !49
  store i32 %51, ptr %v, align 4, !dbg !49
  %52 = load i32, ptr %v, align 4, !dbg !49
  %53 = load i32, ptr %v, align 4, !dbg !50
  %54 = icmp ne i32 %53, 0, !dbg !50
  br i1 %54, label %then19, label %else20, !dbg !50

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !51
  %55 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end21, !dbg !51

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !51

if.end21:                                         ; preds = %else20, %then19
  %56 = load i1, ptr %t, align 1, !dbg !52
  %57 = icmp eq i1 %56, false, !dbg !52
  %58 = sext i1 %57 to i32, !dbg !52
  store i32 %58, ptr %v, align 4, !dbg !52
  %59 = load i32, ptr %v, align 4, !dbg !52
  %60 = load i32, ptr %v, align 4, !dbg !53
  %61 = icmp ne i32 %60, 0, !dbg !53
  br i1 %61, label %then22, label %else23, !dbg !53

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !54
  %62 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end24, !dbg !54

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !54

if.end24:                                         ; preds = %else23, %then22
  %63 = load i1, ptr %f, align 1, !dbg !55
  %64 = icmp eq i1 %63, false, !dbg !55
  %65 = sext i1 %64 to i32, !dbg !55
  store i32 %65, ptr %v, align 4, !dbg !55
  %66 = load i32, ptr %v, align 4, !dbg !55
  %67 = load i32, ptr %v, align 4, !dbg !56
  %68 = icmp eq i32 %67, 0, !dbg !56
  br i1 %68, label %then25, label %else26, !dbg !56

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !57
  %69 = load i32, ptr %err, align 4, !dbg !57
  br label %if.end27, !dbg !57

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !57

if.end27:                                         ; preds = %else26, %then25
  store i32 100, ptr %a, align 4, !dbg !20
  store i32 100, ptr %b, align 4, !dbg !18
  store i32 128, ptr %c, align 4, !dbg !16
  %70 = load i32, ptr %a, align 4, !dbg !58
  %71 = load i32, ptr %b, align 4, !dbg !58
  %72 = icmp eq i32 %70, %71, !dbg !58
  %73 = sext i1 %72 to i32, !dbg !58
  store i32 %73, ptr %v, align 4, !dbg !58
  %74 = load i32, ptr %v, align 4, !dbg !58
  %75 = load i32, ptr %v, align 4, !dbg !59
  %76 = icmp eq i32 %75, 0, !dbg !59
  br i1 %76, label %then28, label %else29, !dbg !59

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !60
  %77 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end30, !dbg !60

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !60

if.end30:                                         ; preds = %else29, %then28
  %78 = load i32, ptr %a, align 4, !dbg !61
  %79 = load i32, ptr %c, align 4, !dbg !61
  %80 = icmp eq i32 %78, %79, !dbg !61
  %81 = sext i1 %80 to i32, !dbg !61
  store i32 %81, ptr %v, align 4, !dbg !61
  %82 = load i32, ptr %v, align 4, !dbg !61
  %83 = load i32, ptr %v, align 4, !dbg !62
  %84 = icmp ne i32 %83, 0, !dbg !62
  br i1 %84, label %then31, label %else32, !dbg !62

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !63
  %85 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end33, !dbg !63

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !63

if.end33:                                         ; preds = %else32, %then31
  %86 = load i32, ptr %a, align 4, !dbg !64
  %87 = load i32, ptr %b, align 4, !dbg !64
  %88 = icmp ne i32 %86, %87, !dbg !64
  %89 = sext i1 %88 to i32, !dbg !64
  store i32 %89, ptr %v, align 4, !dbg !64
  %90 = load i32, ptr %v, align 4, !dbg !64
  %91 = load i32, ptr %v, align 4, !dbg !65
  %92 = icmp ne i32 %91, 0, !dbg !65
  br i1 %92, label %then34, label %else35, !dbg !65

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !66
  %93 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end36, !dbg !66

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !66

if.end36:                                         ; preds = %else35, %then34
  %94 = load i32, ptr %a, align 4, !dbg !67
  %95 = load i32, ptr %c, align 4, !dbg !67
  %96 = icmp ne i32 %94, %95, !dbg !67
  %97 = sext i1 %96 to i32, !dbg !67
  store i32 %97, ptr %v, align 4, !dbg !67
  %98 = load i32, ptr %v, align 4, !dbg !67
  %99 = load i32, ptr %v, align 4, !dbg !68
  %100 = icmp eq i32 %99, 0, !dbg !68
  br i1 %100, label %then37, label %else38, !dbg !68

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !69
  %101 = load i32, ptr %err, align 4, !dbg !69
  br label %if.end39, !dbg !69

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !69

if.end39:                                         ; preds = %else38, %then37
  %102 = load i32, ptr %a, align 4, !dbg !70
  %103 = load i32, ptr %b, align 4, !dbg !70
  %104 = icmp slt i32 %102, %103, !dbg !70
  %105 = sext i1 %104 to i32, !dbg !70
  store i32 %105, ptr %v, align 4, !dbg !70
  %106 = load i32, ptr %v, align 4, !dbg !70
  %107 = load i32, ptr %v, align 4, !dbg !71
  %108 = icmp ne i32 %107, 0, !dbg !71
  br i1 %108, label %then40, label %else41, !dbg !71

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !72
  %109 = load i32, ptr %err, align 4, !dbg !72
  br label %if.end42, !dbg !72

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !72

if.end42:                                         ; preds = %else41, %then40
  %110 = load i32, ptr %a, align 4, !dbg !73
  %111 = load i32, ptr %c, align 4, !dbg !73
  %112 = icmp slt i32 %110, %111, !dbg !73
  %113 = sext i1 %112 to i32, !dbg !73
  store i32 %113, ptr %v, align 4, !dbg !73
  %114 = load i32, ptr %v, align 4, !dbg !73
  %115 = load i32, ptr %v, align 4, !dbg !74
  %116 = icmp eq i32 %115, 0, !dbg !74
  br i1 %116, label %then43, label %else44, !dbg !74

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4, !dbg !75
  %117 = load i32, ptr %err, align 4, !dbg !75
  br label %if.end45, !dbg !75

else44:                                           ; preds = %if.end42
  br label %if.end45, !dbg !75

if.end45:                                         ; preds = %else44, %then43
  %118 = load i32, ptr %c, align 4, !dbg !76
  %119 = load i32, ptr %a, align 4, !dbg !76
  %120 = icmp slt i32 %118, %119, !dbg !76
  %121 = sext i1 %120 to i32, !dbg !76
  store i32 %121, ptr %v, align 4, !dbg !76
  %122 = load i32, ptr %v, align 4, !dbg !76
  %123 = load i32, ptr %v, align 4, !dbg !77
  %124 = icmp ne i32 %123, 0, !dbg !77
  br i1 %124, label %then46, label %else47, !dbg !77

then46:                                           ; preds = %if.end45
  store i32 1, ptr %err, align 4, !dbg !78
  %125 = load i32, ptr %err, align 4, !dbg !78
  br label %if.end48, !dbg !78

else47:                                           ; preds = %if.end45
  br label %if.end48, !dbg !78

if.end48:                                         ; preds = %else47, %then46
  %126 = load i32, ptr %a, align 4, !dbg !79
  %127 = load i32, ptr %b, align 4, !dbg !79
  %128 = icmp sle i32 %126, %127, !dbg !79
  %129 = sext i1 %128 to i32, !dbg !79
  store i32 %129, ptr %v, align 4, !dbg !79
  %130 = load i32, ptr %v, align 4, !dbg !79
  %131 = load i32, ptr %v, align 4, !dbg !80
  %132 = icmp eq i32 %131, 0, !dbg !80
  br i1 %132, label %then49, label %else50, !dbg !80

then49:                                           ; preds = %if.end48
  store i32 1, ptr %err, align 4, !dbg !81
  %133 = load i32, ptr %err, align 4, !dbg !81
  br label %if.end51, !dbg !81

else50:                                           ; preds = %if.end48
  br label %if.end51, !dbg !81

if.end51:                                         ; preds = %else50, %then49
  %134 = load i32, ptr %a, align 4, !dbg !82
  %135 = load i32, ptr %c, align 4, !dbg !82
  %136 = icmp sle i32 %134, %135, !dbg !82
  %137 = sext i1 %136 to i32, !dbg !82
  store i32 %137, ptr %v, align 4, !dbg !82
  %138 = load i32, ptr %v, align 4, !dbg !82
  %139 = load i32, ptr %v, align 4, !dbg !83
  %140 = icmp eq i32 %139, 0, !dbg !83
  br i1 %140, label %then52, label %else53, !dbg !83

then52:                                           ; preds = %if.end51
  store i32 1, ptr %err, align 4, !dbg !84
  %141 = load i32, ptr %err, align 4, !dbg !84
  br label %if.end54, !dbg !84

else53:                                           ; preds = %if.end51
  br label %if.end54, !dbg !84

if.end54:                                         ; preds = %else53, %then52
  %142 = load i32, ptr %c, align 4, !dbg !85
  %143 = load i32, ptr %a, align 4, !dbg !85
  %144 = icmp sle i32 %142, %143, !dbg !85
  %145 = sext i1 %144 to i32, !dbg !85
  store i32 %145, ptr %v, align 4, !dbg !85
  %146 = load i32, ptr %v, align 4, !dbg !85
  %147 = load i32, ptr %v, align 4, !dbg !86
  %148 = icmp ne i32 %147, 0, !dbg !86
  br i1 %148, label %then55, label %else56, !dbg !86

then55:                                           ; preds = %if.end54
  store i32 1, ptr %err, align 4, !dbg !87
  %149 = load i32, ptr %err, align 4, !dbg !87
  br label %if.end57, !dbg !87

else56:                                           ; preds = %if.end54
  br label %if.end57, !dbg !87

if.end57:                                         ; preds = %else56, %then55
  %150 = load i32, ptr %a, align 4, !dbg !88
  %151 = load i32, ptr %b, align 4, !dbg !88
  %152 = icmp sgt i32 %150, %151, !dbg !88
  %153 = sext i1 %152 to i32, !dbg !88
  store i32 %153, ptr %v, align 4, !dbg !88
  %154 = load i32, ptr %v, align 4, !dbg !88
  %155 = load i32, ptr %v, align 4, !dbg !89
  %156 = icmp ne i32 %155, 0, !dbg !89
  br i1 %156, label %then58, label %else59, !dbg !89

then58:                                           ; preds = %if.end57
  store i32 1, ptr %err, align 4, !dbg !90
  %157 = load i32, ptr %err, align 4, !dbg !90
  br label %if.end60, !dbg !90

else59:                                           ; preds = %if.end57
  br label %if.end60, !dbg !90

if.end60:                                         ; preds = %else59, %then58
  %158 = load i32, ptr %a, align 4, !dbg !91
  %159 = load i32, ptr %c, align 4, !dbg !91
  %160 = icmp sgt i32 %158, %159, !dbg !91
  %161 = sext i1 %160 to i32, !dbg !91
  store i32 %161, ptr %v, align 4, !dbg !91
  %162 = load i32, ptr %v, align 4, !dbg !91
  %163 = load i32, ptr %v, align 4, !dbg !92
  %164 = icmp ne i32 %163, 0, !dbg !92
  br i1 %164, label %then61, label %else62, !dbg !92

then61:                                           ; preds = %if.end60
  store i32 1, ptr %err, align 4, !dbg !93
  %165 = load i32, ptr %err, align 4, !dbg !93
  br label %if.end63, !dbg !93

else62:                                           ; preds = %if.end60
  br label %if.end63, !dbg !93

if.end63:                                         ; preds = %else62, %then61
  %166 = load i32, ptr %c, align 4, !dbg !94
  %167 = load i32, ptr %a, align 4, !dbg !94
  %168 = icmp sgt i32 %166, %167, !dbg !94
  %169 = sext i1 %168 to i32, !dbg !94
  store i32 %169, ptr %v, align 4, !dbg !94
  %170 = load i32, ptr %v, align 4, !dbg !94
  %171 = load i32, ptr %v, align 4, !dbg !95
  %172 = icmp eq i32 %171, 0, !dbg !95
  br i1 %172, label %then64, label %else65, !dbg !95

then64:                                           ; preds = %if.end63
  store i32 1, ptr %err, align 4, !dbg !96
  %173 = load i32, ptr %err, align 4, !dbg !96
  br label %if.end66, !dbg !96

else65:                                           ; preds = %if.end63
  br label %if.end66, !dbg !96

if.end66:                                         ; preds = %else65, %then64
  %174 = load i32, ptr %a, align 4, !dbg !97
  %175 = load i32, ptr %b, align 4, !dbg !97
  %176 = icmp sge i32 %174, %175, !dbg !97
  %177 = sext i1 %176 to i32, !dbg !97
  store i32 %177, ptr %v, align 4, !dbg !97
  %178 = load i32, ptr %v, align 4, !dbg !97
  %179 = load i32, ptr %v, align 4, !dbg !98
  %180 = icmp eq i32 %179, 0, !dbg !98
  br i1 %180, label %then67, label %else68, !dbg !98

then67:                                           ; preds = %if.end66
  store i32 1, ptr %err, align 4, !dbg !99
  %181 = load i32, ptr %err, align 4, !dbg !99
  br label %if.end69, !dbg !99

else68:                                           ; preds = %if.end66
  br label %if.end69, !dbg !99

if.end69:                                         ; preds = %else68, %then67
  %182 = load i32, ptr %a, align 4, !dbg !100
  %183 = load i32, ptr %c, align 4, !dbg !100
  %184 = icmp sge i32 %182, %183, !dbg !100
  %185 = sext i1 %184 to i32, !dbg !100
  store i32 %185, ptr %v, align 4, !dbg !100
  %186 = load i32, ptr %v, align 4, !dbg !100
  %187 = load i32, ptr %v, align 4, !dbg !101
  %188 = icmp ne i32 %187, 0, !dbg !101
  br i1 %188, label %then70, label %else71, !dbg !101

then70:                                           ; preds = %if.end69
  store i32 1, ptr %err, align 4, !dbg !102
  %189 = load i32, ptr %err, align 4, !dbg !102
  br label %if.end72, !dbg !102

else71:                                           ; preds = %if.end69
  br label %if.end72, !dbg !102

if.end72:                                         ; preds = %else71, %then70
  %190 = load i32, ptr %c, align 4, !dbg !103
  %191 = load i32, ptr %a, align 4, !dbg !103
  %192 = icmp sge i32 %190, %191, !dbg !103
  %193 = sext i1 %192 to i32, !dbg !103
  store i32 %193, ptr %v, align 4, !dbg !103
  %194 = load i32, ptr %v, align 4, !dbg !103
  %195 = load i32, ptr %v, align 4, !dbg !104
  %196 = icmp eq i32 %195, 0, !dbg !104
  br i1 %196, label %then73, label %else74, !dbg !104

then73:                                           ; preds = %if.end72
  store i32 1, ptr %err, align 4, !dbg !105
  %197 = load i32, ptr %err, align 4, !dbg !105
  br label %if.end75, !dbg !105

else74:                                           ; preds = %if.end72
  br label %if.end75, !dbg !105

if.end75:                                         ; preds = %else74, %then73
  store i32 1, ptr %ua, align 4, !dbg !14
  store i32 -1, ptr %ub, align 4, !dbg !12
  %198 = load i32, ptr %ua, align 4, !dbg !106
  %199 = load i32, ptr %ub, align 4, !dbg !106
  %200 = icmp ult i32 %198, %199, !dbg !106
  %201 = sext i1 %200 to i32, !dbg !106
  store i32 %201, ptr %v, align 4, !dbg !106
  %202 = load i32, ptr %v, align 4, !dbg !106
  %203 = load i32, ptr %v, align 4, !dbg !107
  %204 = icmp eq i32 %203, 0, !dbg !107
  br i1 %204, label %then76, label %else77, !dbg !107

then76:                                           ; preds = %if.end75
  store i32 1, ptr %err, align 4, !dbg !108
  %205 = load i32, ptr %err, align 4, !dbg !108
  br label %if.end78, !dbg !108

else77:                                           ; preds = %if.end75
  br label %if.end78, !dbg !108

if.end78:                                         ; preds = %else77, %then76
  %206 = load i32, ptr %ub, align 4, !dbg !109
  %207 = load i32, ptr %ua, align 4, !dbg !109
  %208 = icmp ugt i32 %206, %207, !dbg !109
  %209 = sext i1 %208 to i32, !dbg !109
  store i32 %209, ptr %v, align 4, !dbg !109
  %210 = load i32, ptr %v, align 4, !dbg !109
  %211 = load i32, ptr %v, align 4, !dbg !110
  %212 = icmp eq i32 %211, 0, !dbg !110
  br i1 %212, label %then79, label %else80, !dbg !110

then79:                                           ; preds = %if.end78
  store i32 1, ptr %err, align 4, !dbg !111
  %213 = load i32, ptr %err, align 4, !dbg !111
  br label %if.end81, !dbg !111

else80:                                           ; preds = %if.end78
  br label %if.end81, !dbg !111

if.end81:                                         ; preds = %else80, %then79
  store i32 -1, ptr %si, align 4, !dbg !10
  store i32 1, ptr %ui, align 4, !dbg !8
  %214 = load i32, ptr %si, align 4, !dbg !112
  %215 = load i32, ptr %ui, align 4, !dbg !112
  %216 = icmp ult i32 %214, %215, !dbg !112
  %217 = sext i1 %216 to i32, !dbg !112
  store i32 %217, ptr %v, align 4, !dbg !112
  %218 = load i32, ptr %v, align 4, !dbg !112
  %219 = load i32, ptr %v, align 4, !dbg !113
  %220 = icmp ne i32 %219, 0, !dbg !113
  br i1 %220, label %then82, label %else83, !dbg !113

then82:                                           ; preds = %if.end81
  store i32 1, ptr %err, align 4, !dbg !114
  %221 = load i32, ptr %err, align 4, !dbg !114
  br label %if.end84, !dbg !114

else83:                                           ; preds = %if.end81
  br label %if.end84, !dbg !114

if.end84:                                         ; preds = %else83, %then82
  %222 = load i32, ptr %si, align 4, !dbg !115
  %223 = load i32, ptr %ui, align 4, !dbg !115
  %224 = icmp ugt i32 %222, %223, !dbg !115
  %225 = sext i1 %224 to i32, !dbg !115
  store i32 %225, ptr %v, align 4, !dbg !115
  %226 = load i32, ptr %v, align 4, !dbg !115
  %227 = load i32, ptr %v, align 4, !dbg !116
  %228 = icmp eq i32 %227, 0, !dbg !116
  br i1 %228, label %then85, label %else86, !dbg !116

then85:                                           ; preds = %if.end84
  store i32 1, ptr %err, align 4, !dbg !117
  %229 = load i32, ptr %err, align 4, !dbg !117
  br label %if.end87, !dbg !117

else86:                                           ; preds = %if.end84
  br label %if.end87, !dbg !117

if.end87:                                         ; preds = %else86, %then85
  %230 = load i32, ptr %err, align 4, !dbg !118
  %231 = icmp eq i32 %230, 0, !dbg !118
  br i1 %231, label %then88, label %else89, !dbg !118

then88:                                           ; preds = %if.end87
  %232 = call i32 (ptr, ...) @printf(ptr @0), !dbg !119
  br label %if.end90, !dbg !119

else89:                                           ; preds = %if.end87
  %233 = call i32 (ptr, ...) @printf(ptr @1), !dbg !121
  br label %if.end90, !dbg !121

if.end90:                                         ; preds = %else89, %then88
  %234 = load i32, ptr %err, align 4, !dbg !123
  ret i32 %234, !dbg !123
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "15.logic.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "ui", scope: !2, file: !1, line: 76, type: !7)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !DILocation(line: 76, column: 3, scope: !2)
!9 = !DILocalVariable(name: "si", scope: !2, file: !1, line: 75, type: !5)
!10 = !DILocation(line: 75, column: 3, scope: !2)
!11 = !DILocalVariable(name: "ub", scope: !2, file: !1, line: 69, type: !7)
!12 = !DILocation(line: 69, column: 3, scope: !2)
!13 = !DILocalVariable(name: "ua", scope: !2, file: !1, line: 68, type: !7)
!14 = !DILocation(line: 68, column: 3, scope: !2)
!15 = !DILocalVariable(name: "c", scope: !2, file: !1, line: 33, type: !5)
!16 = !DILocation(line: 33, column: 3, scope: !2)
!17 = !DILocalVariable(name: "b", scope: !2, file: !1, line: 32, type: !5)
!18 = !DILocation(line: 32, column: 3, scope: !2)
!19 = !DILocalVariable(name: "a", scope: !2, file: !1, line: 31, type: !5)
!20 = !DILocation(line: 31, column: 3, scope: !2)
!21 = !DILocalVariable(name: "v", scope: !2, file: !1, line: 7, type: !5)
!22 = !DILocation(line: 7, column: 3, scope: !2)
!23 = !DILocalVariable(name: "f", scope: !2, file: !1, line: 6, type: !24)
!24 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!25 = !DILocation(line: 6, column: 3, scope: !2)
!26 = !DILocalVariable(name: "t", scope: !2, file: !1, line: 5, type: !24)
!27 = !DILocation(line: 5, column: 3, scope: !2)
!28 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 4, type: !5)
!29 = !DILocation(line: 4, column: 3, scope: !2)
!30 = !DILocation(line: 9, column: 3, scope: !2)
!31 = !DILocation(line: 9, column: 15, scope: !2)
!32 = !DILocation(line: 10, column: 3, scope: !2)
!33 = !DILocation(line: 10, column: 15, scope: !2)
!34 = !DILocation(line: 12, column: 3, scope: !2)
!35 = !DILocation(line: 13, column: 3, scope: !2)
!36 = !DILocation(line: 13, column: 15, scope: !2)
!37 = !DILocation(line: 14, column: 3, scope: !2)
!38 = !DILocation(line: 15, column: 3, scope: !2)
!39 = !DILocation(line: 15, column: 15, scope: !2)
!40 = !DILocation(line: 16, column: 3, scope: !2)
!41 = !DILocation(line: 17, column: 3, scope: !2)
!42 = !DILocation(line: 17, column: 15, scope: !2)
!43 = !DILocation(line: 19, column: 3, scope: !2)
!44 = !DILocation(line: 20, column: 3, scope: !2)
!45 = !DILocation(line: 20, column: 15, scope: !2)
!46 = !DILocation(line: 21, column: 3, scope: !2)
!47 = !DILocation(line: 22, column: 3, scope: !2)
!48 = !DILocation(line: 22, column: 15, scope: !2)
!49 = !DILocation(line: 23, column: 3, scope: !2)
!50 = !DILocation(line: 24, column: 3, scope: !2)
!51 = !DILocation(line: 24, column: 15, scope: !2)
!52 = !DILocation(line: 26, column: 3, scope: !2)
!53 = !DILocation(line: 27, column: 3, scope: !2)
!54 = !DILocation(line: 27, column: 15, scope: !2)
!55 = !DILocation(line: 28, column: 3, scope: !2)
!56 = !DILocation(line: 29, column: 3, scope: !2)
!57 = !DILocation(line: 29, column: 15, scope: !2)
!58 = !DILocation(line: 35, column: 3, scope: !2)
!59 = !DILocation(line: 36, column: 3, scope: !2)
!60 = !DILocation(line: 36, column: 15, scope: !2)
!61 = !DILocation(line: 37, column: 3, scope: !2)
!62 = !DILocation(line: 38, column: 3, scope: !2)
!63 = !DILocation(line: 38, column: 15, scope: !2)
!64 = !DILocation(line: 39, column: 3, scope: !2)
!65 = !DILocation(line: 40, column: 3, scope: !2)
!66 = !DILocation(line: 40, column: 15, scope: !2)
!67 = !DILocation(line: 41, column: 3, scope: !2)
!68 = !DILocation(line: 42, column: 3, scope: !2)
!69 = !DILocation(line: 42, column: 15, scope: !2)
!70 = !DILocation(line: 43, column: 3, scope: !2)
!71 = !DILocation(line: 44, column: 3, scope: !2)
!72 = !DILocation(line: 44, column: 15, scope: !2)
!73 = !DILocation(line: 45, column: 3, scope: !2)
!74 = !DILocation(line: 46, column: 3, scope: !2)
!75 = !DILocation(line: 46, column: 15, scope: !2)
!76 = !DILocation(line: 47, column: 3, scope: !2)
!77 = !DILocation(line: 48, column: 3, scope: !2)
!78 = !DILocation(line: 48, column: 15, scope: !2)
!79 = !DILocation(line: 49, column: 3, scope: !2)
!80 = !DILocation(line: 50, column: 3, scope: !2)
!81 = !DILocation(line: 50, column: 15, scope: !2)
!82 = !DILocation(line: 51, column: 3, scope: !2)
!83 = !DILocation(line: 52, column: 3, scope: !2)
!84 = !DILocation(line: 52, column: 15, scope: !2)
!85 = !DILocation(line: 53, column: 3, scope: !2)
!86 = !DILocation(line: 54, column: 3, scope: !2)
!87 = !DILocation(line: 54, column: 15, scope: !2)
!88 = !DILocation(line: 55, column: 3, scope: !2)
!89 = !DILocation(line: 56, column: 3, scope: !2)
!90 = !DILocation(line: 56, column: 15, scope: !2)
!91 = !DILocation(line: 57, column: 3, scope: !2)
!92 = !DILocation(line: 58, column: 3, scope: !2)
!93 = !DILocation(line: 58, column: 15, scope: !2)
!94 = !DILocation(line: 59, column: 3, scope: !2)
!95 = !DILocation(line: 60, column: 3, scope: !2)
!96 = !DILocation(line: 60, column: 15, scope: !2)
!97 = !DILocation(line: 61, column: 3, scope: !2)
!98 = !DILocation(line: 62, column: 3, scope: !2)
!99 = !DILocation(line: 62, column: 15, scope: !2)
!100 = !DILocation(line: 63, column: 3, scope: !2)
!101 = !DILocation(line: 64, column: 3, scope: !2)
!102 = !DILocation(line: 64, column: 15, scope: !2)
!103 = !DILocation(line: 65, column: 3, scope: !2)
!104 = !DILocation(line: 66, column: 3, scope: !2)
!105 = !DILocation(line: 66, column: 15, scope: !2)
!106 = !DILocation(line: 70, column: 3, scope: !2)
!107 = !DILocation(line: 71, column: 3, scope: !2)
!108 = !DILocation(line: 71, column: 15, scope: !2)
!109 = !DILocation(line: 72, column: 3, scope: !2)
!110 = !DILocation(line: 73, column: 3, scope: !2)
!111 = !DILocation(line: 73, column: 15, scope: !2)
!112 = !DILocation(line: 77, column: 3, scope: !2)
!113 = !DILocation(line: 78, column: 3, scope: !2)
!114 = !DILocation(line: 78, column: 15, scope: !2)
!115 = !DILocation(line: 79, column: 3, scope: !2)
!116 = !DILocation(line: 80, column: 3, scope: !2)
!117 = !DILocation(line: 80, column: 15, scope: !2)
!118 = !DILocation(line: 82, column: 3, scope: !2)
!119 = !DILocation(line: 83, column: 5, scope: !120)
!120 = distinct !DILexicalBlock(scope: !2, file: !1, line: 82, column: 17)
!121 = !DILocation(line: 85, column: 5, scope: !122)
!122 = distinct !DILexicalBlock(scope: !2, file: !1, line: 84, column: 10)
!123 = !DILocation(line: 87, column: 3, scope: !2)
