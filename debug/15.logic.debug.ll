; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [17 x i8] c"15.logic.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"15.logic.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %ui = alloca i32, align 4
    #dbg_declare(ptr %ui, !9, !DIExpression(), !11)
  %si = alloca i32, align 4
    #dbg_declare(ptr %si, !12, !DIExpression(), !13)
  %ub = alloca i32, align 4
    #dbg_declare(ptr %ub, !14, !DIExpression(), !15)
  %ua = alloca i32, align 4
    #dbg_declare(ptr %ua, !16, !DIExpression(), !17)
  %c = alloca i32, align 4
    #dbg_declare(ptr %c, !18, !DIExpression(), !19)
  %b = alloca i32, align 4
    #dbg_declare(ptr %b, !20, !DIExpression(), !21)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !22, !DIExpression(), !23)
  %v = alloca i32, align 4
    #dbg_declare(ptr %v, !24, !DIExpression(), !25)
  %f = alloca i1, align 1
    #dbg_declare(ptr %f, !26, !DIExpression(), !28)
  %t = alloca i1, align 1
    #dbg_declare(ptr %t, !29, !DIExpression(), !30)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !31, !DIExpression(), !32)
  store i32 0, ptr %err, align 4, !dbg !32
  store i1 true, ptr %t, align 1, !dbg !30
  store i1 false, ptr %f, align 1, !dbg !28
  %0 = load i1, ptr %t, align 1, !dbg !33
  %1 = zext i1 %0 to i32, !dbg !33
  %2 = icmp eq i32 %1, 0, !dbg !33
  br i1 %2, label %then, label %if.end, !dbg !33

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !34
  %3 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end, !dbg !34

if.end:                                           ; preds = %entry, %then
  %4 = load i1, ptr %f, align 1, !dbg !35
  %5 = zext i1 %4 to i32, !dbg !35
  %6 = icmp ne i32 %5, 0, !dbg !35
  br i1 %6, label %then1, label %if.end3, !dbg !35

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !36
  %7 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end3, !dbg !36

if.end3:                                          ; preds = %if.end, %then1
  %8 = load i1, ptr %t, align 1, !dbg !37
  %9 = load i1, ptr %f, align 1, !dbg !37
  %10 = select i1 %8, i1 %9, i1 false, !dbg !37
  %11 = sext i1 %10 to i32, !dbg !37
  store i32 %11, ptr %v, align 4, !dbg !37
  %12 = load i32, ptr %v, align 4, !dbg !37
  %13 = load i32, ptr %v, align 4, !dbg !38
  %14 = icmp ne i32 %13, 0, !dbg !38
  br i1 %14, label %then4, label %if.end6, !dbg !38

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !39
  %15 = load i32, ptr %err, align 4, !dbg !39
  br label %if.end6, !dbg !39

if.end6:                                          ; preds = %if.end3, %then4
  %16 = load i1, ptr %t, align 1, !dbg !40
  %17 = load i1, ptr %t, align 1, !dbg !40
  %18 = select i1 %16, i1 %17, i1 false, !dbg !40
  %19 = sext i1 %18 to i32, !dbg !40
  store i32 %19, ptr %v, align 4, !dbg !40
  %20 = load i32, ptr %v, align 4, !dbg !40
  %21 = load i32, ptr %v, align 4, !dbg !41
  %22 = icmp eq i32 %21, 0, !dbg !41
  br i1 %22, label %then7, label %if.end9, !dbg !41

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !42
  %23 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end9, !dbg !42

if.end9:                                          ; preds = %if.end6, %then7
  %24 = load i1, ptr %f, align 1, !dbg !43
  %25 = load i1, ptr %f, align 1, !dbg !43
  %26 = select i1 %24, i1 %25, i1 false, !dbg !43
  %27 = sext i1 %26 to i32, !dbg !43
  store i32 %27, ptr %v, align 4, !dbg !43
  %28 = load i32, ptr %v, align 4, !dbg !43
  %29 = load i32, ptr %v, align 4, !dbg !44
  %30 = icmp ne i32 %29, 0, !dbg !44
  br i1 %30, label %then10, label %if.end12, !dbg !44

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !45
  %31 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end12, !dbg !45

if.end12:                                         ; preds = %if.end9, %then10
  %32 = load i1, ptr %t, align 1, !dbg !46
  %33 = load i1, ptr %f, align 1, !dbg !46
  %34 = select i1 %32, i1 true, i1 %33, !dbg !46
  %35 = sext i1 %34 to i32, !dbg !46
  store i32 %35, ptr %v, align 4, !dbg !46
  %36 = load i32, ptr %v, align 4, !dbg !46
  %37 = load i32, ptr %v, align 4, !dbg !47
  %38 = icmp eq i32 %37, 0, !dbg !47
  br i1 %38, label %then13, label %if.end15, !dbg !47

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !48
  %39 = load i32, ptr %err, align 4, !dbg !48
  br label %if.end15, !dbg !48

if.end15:                                         ; preds = %if.end12, %then13
  %40 = load i1, ptr %t, align 1, !dbg !49
  %41 = load i1, ptr %t, align 1, !dbg !49
  %42 = select i1 %40, i1 true, i1 %41, !dbg !49
  %43 = sext i1 %42 to i32, !dbg !49
  store i32 %43, ptr %v, align 4, !dbg !49
  %44 = load i32, ptr %v, align 4, !dbg !49
  %45 = load i32, ptr %v, align 4, !dbg !50
  %46 = icmp eq i32 %45, 0, !dbg !50
  br i1 %46, label %then16, label %if.end18, !dbg !50

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !51
  %47 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end18, !dbg !51

if.end18:                                         ; preds = %if.end15, %then16
  %48 = load i1, ptr %f, align 1, !dbg !52
  %49 = load i1, ptr %f, align 1, !dbg !52
  %50 = select i1 %48, i1 true, i1 %49, !dbg !52
  %51 = sext i1 %50 to i32, !dbg !52
  store i32 %51, ptr %v, align 4, !dbg !52
  %52 = load i32, ptr %v, align 4, !dbg !52
  %53 = load i32, ptr %v, align 4, !dbg !53
  %54 = icmp ne i32 %53, 0, !dbg !53
  br i1 %54, label %then19, label %if.end21, !dbg !53

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !54
  %55 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end21, !dbg !54

if.end21:                                         ; preds = %if.end18, %then19
  %56 = load i1, ptr %t, align 1, !dbg !55
  %57 = icmp eq i1 %56, false, !dbg !55
  %58 = sext i1 %57 to i32, !dbg !55
  store i32 %58, ptr %v, align 4, !dbg !55
  %59 = load i32, ptr %v, align 4, !dbg !55
  %60 = load i32, ptr %v, align 4, !dbg !56
  %61 = icmp ne i32 %60, 0, !dbg !56
  br i1 %61, label %then22, label %if.end24, !dbg !56

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !57
  %62 = load i32, ptr %err, align 4, !dbg !57
  br label %if.end24, !dbg !57

if.end24:                                         ; preds = %if.end21, %then22
  %63 = load i1, ptr %f, align 1, !dbg !58
  %64 = icmp eq i1 %63, false, !dbg !58
  %65 = sext i1 %64 to i32, !dbg !58
  store i32 %65, ptr %v, align 4, !dbg !58
  %66 = load i32, ptr %v, align 4, !dbg !58
  %67 = load i32, ptr %v, align 4, !dbg !59
  %68 = icmp eq i32 %67, 0, !dbg !59
  br i1 %68, label %then25, label %if.end27, !dbg !59

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !60
  %69 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end27, !dbg !60

if.end27:                                         ; preds = %if.end24, %then25
  store i32 100, ptr %a, align 4, !dbg !23
  store i32 100, ptr %b, align 4, !dbg !21
  store i32 128, ptr %c, align 4, !dbg !19
  %70 = load i32, ptr %a, align 4, !dbg !61
  %71 = load i32, ptr %b, align 4, !dbg !61
  %72 = icmp eq i32 %70, %71, !dbg !61
  %73 = sext i1 %72 to i32, !dbg !61
  store i32 %73, ptr %v, align 4, !dbg !61
  %74 = load i32, ptr %v, align 4, !dbg !61
  %75 = load i32, ptr %v, align 4, !dbg !62
  %76 = icmp eq i32 %75, 0, !dbg !62
  br i1 %76, label %then28, label %if.end30, !dbg !62

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4, !dbg !63
  %77 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end30, !dbg !63

if.end30:                                         ; preds = %if.end27, %then28
  %78 = load i32, ptr %a, align 4, !dbg !64
  %79 = load i32, ptr %c, align 4, !dbg !64
  %80 = icmp eq i32 %78, %79, !dbg !64
  %81 = sext i1 %80 to i32, !dbg !64
  store i32 %81, ptr %v, align 4, !dbg !64
  %82 = load i32, ptr %v, align 4, !dbg !64
  %83 = load i32, ptr %v, align 4, !dbg !65
  %84 = icmp ne i32 %83, 0, !dbg !65
  br i1 %84, label %then31, label %if.end33, !dbg !65

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4, !dbg !66
  %85 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end33, !dbg !66

if.end33:                                         ; preds = %if.end30, %then31
  %86 = load i32, ptr %a, align 4, !dbg !67
  %87 = load i32, ptr %b, align 4, !dbg !67
  %88 = icmp ne i32 %86, %87, !dbg !67
  %89 = sext i1 %88 to i32, !dbg !67
  store i32 %89, ptr %v, align 4, !dbg !67
  %90 = load i32, ptr %v, align 4, !dbg !67
  %91 = load i32, ptr %v, align 4, !dbg !68
  %92 = icmp ne i32 %91, 0, !dbg !68
  br i1 %92, label %then34, label %if.end36, !dbg !68

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4, !dbg !69
  %93 = load i32, ptr %err, align 4, !dbg !69
  br label %if.end36, !dbg !69

if.end36:                                         ; preds = %if.end33, %then34
  %94 = load i32, ptr %a, align 4, !dbg !70
  %95 = load i32, ptr %c, align 4, !dbg !70
  %96 = icmp ne i32 %94, %95, !dbg !70
  %97 = sext i1 %96 to i32, !dbg !70
  store i32 %97, ptr %v, align 4, !dbg !70
  %98 = load i32, ptr %v, align 4, !dbg !70
  %99 = load i32, ptr %v, align 4, !dbg !71
  %100 = icmp eq i32 %99, 0, !dbg !71
  br i1 %100, label %then37, label %if.end39, !dbg !71

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4, !dbg !72
  %101 = load i32, ptr %err, align 4, !dbg !72
  br label %if.end39, !dbg !72

if.end39:                                         ; preds = %if.end36, %then37
  %102 = load i32, ptr %a, align 4, !dbg !73
  %103 = load i32, ptr %b, align 4, !dbg !73
  %104 = icmp slt i32 %102, %103, !dbg !73
  %105 = sext i1 %104 to i32, !dbg !73
  store i32 %105, ptr %v, align 4, !dbg !73
  %106 = load i32, ptr %v, align 4, !dbg !73
  %107 = load i32, ptr %v, align 4, !dbg !74
  %108 = icmp ne i32 %107, 0, !dbg !74
  br i1 %108, label %then40, label %if.end42, !dbg !74

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4, !dbg !75
  %109 = load i32, ptr %err, align 4, !dbg !75
  br label %if.end42, !dbg !75

if.end42:                                         ; preds = %if.end39, %then40
  %110 = load i32, ptr %a, align 4, !dbg !76
  %111 = load i32, ptr %c, align 4, !dbg !76
  %112 = icmp slt i32 %110, %111, !dbg !76
  %113 = sext i1 %112 to i32, !dbg !76
  store i32 %113, ptr %v, align 4, !dbg !76
  %114 = load i32, ptr %v, align 4, !dbg !76
  %115 = load i32, ptr %v, align 4, !dbg !77
  %116 = icmp eq i32 %115, 0, !dbg !77
  br i1 %116, label %then43, label %if.end45, !dbg !77

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4, !dbg !78
  %117 = load i32, ptr %err, align 4, !dbg !78
  br label %if.end45, !dbg !78

if.end45:                                         ; preds = %if.end42, %then43
  %118 = load i32, ptr %c, align 4, !dbg !79
  %119 = load i32, ptr %a, align 4, !dbg !79
  %120 = icmp slt i32 %118, %119, !dbg !79
  %121 = sext i1 %120 to i32, !dbg !79
  store i32 %121, ptr %v, align 4, !dbg !79
  %122 = load i32, ptr %v, align 4, !dbg !79
  %123 = load i32, ptr %v, align 4, !dbg !80
  %124 = icmp ne i32 %123, 0, !dbg !80
  br i1 %124, label %then46, label %if.end48, !dbg !80

then46:                                           ; preds = %if.end45
  store i32 1, ptr %err, align 4, !dbg !81
  %125 = load i32, ptr %err, align 4, !dbg !81
  br label %if.end48, !dbg !81

if.end48:                                         ; preds = %if.end45, %then46
  %126 = load i32, ptr %a, align 4, !dbg !82
  %127 = load i32, ptr %b, align 4, !dbg !82
  %128 = icmp sle i32 %126, %127, !dbg !82
  %129 = sext i1 %128 to i32, !dbg !82
  store i32 %129, ptr %v, align 4, !dbg !82
  %130 = load i32, ptr %v, align 4, !dbg !82
  %131 = load i32, ptr %v, align 4, !dbg !83
  %132 = icmp eq i32 %131, 0, !dbg !83
  br i1 %132, label %then49, label %if.end51, !dbg !83

then49:                                           ; preds = %if.end48
  store i32 1, ptr %err, align 4, !dbg !84
  %133 = load i32, ptr %err, align 4, !dbg !84
  br label %if.end51, !dbg !84

if.end51:                                         ; preds = %if.end48, %then49
  %134 = load i32, ptr %a, align 4, !dbg !85
  %135 = load i32, ptr %c, align 4, !dbg !85
  %136 = icmp sle i32 %134, %135, !dbg !85
  %137 = sext i1 %136 to i32, !dbg !85
  store i32 %137, ptr %v, align 4, !dbg !85
  %138 = load i32, ptr %v, align 4, !dbg !85
  %139 = load i32, ptr %v, align 4, !dbg !86
  %140 = icmp eq i32 %139, 0, !dbg !86
  br i1 %140, label %then52, label %if.end54, !dbg !86

then52:                                           ; preds = %if.end51
  store i32 1, ptr %err, align 4, !dbg !87
  %141 = load i32, ptr %err, align 4, !dbg !87
  br label %if.end54, !dbg !87

if.end54:                                         ; preds = %if.end51, %then52
  %142 = load i32, ptr %c, align 4, !dbg !88
  %143 = load i32, ptr %a, align 4, !dbg !88
  %144 = icmp sle i32 %142, %143, !dbg !88
  %145 = sext i1 %144 to i32, !dbg !88
  store i32 %145, ptr %v, align 4, !dbg !88
  %146 = load i32, ptr %v, align 4, !dbg !88
  %147 = load i32, ptr %v, align 4, !dbg !89
  %148 = icmp ne i32 %147, 0, !dbg !89
  br i1 %148, label %then55, label %if.end57, !dbg !89

then55:                                           ; preds = %if.end54
  store i32 1, ptr %err, align 4, !dbg !90
  %149 = load i32, ptr %err, align 4, !dbg !90
  br label %if.end57, !dbg !90

if.end57:                                         ; preds = %if.end54, %then55
  %150 = load i32, ptr %a, align 4, !dbg !91
  %151 = load i32, ptr %b, align 4, !dbg !91
  %152 = icmp sgt i32 %150, %151, !dbg !91
  %153 = sext i1 %152 to i32, !dbg !91
  store i32 %153, ptr %v, align 4, !dbg !91
  %154 = load i32, ptr %v, align 4, !dbg !91
  %155 = load i32, ptr %v, align 4, !dbg !92
  %156 = icmp ne i32 %155, 0, !dbg !92
  br i1 %156, label %then58, label %if.end60, !dbg !92

then58:                                           ; preds = %if.end57
  store i32 1, ptr %err, align 4, !dbg !93
  %157 = load i32, ptr %err, align 4, !dbg !93
  br label %if.end60, !dbg !93

if.end60:                                         ; preds = %if.end57, %then58
  %158 = load i32, ptr %a, align 4, !dbg !94
  %159 = load i32, ptr %c, align 4, !dbg !94
  %160 = icmp sgt i32 %158, %159, !dbg !94
  %161 = sext i1 %160 to i32, !dbg !94
  store i32 %161, ptr %v, align 4, !dbg !94
  %162 = load i32, ptr %v, align 4, !dbg !94
  %163 = load i32, ptr %v, align 4, !dbg !95
  %164 = icmp ne i32 %163, 0, !dbg !95
  br i1 %164, label %then61, label %if.end63, !dbg !95

then61:                                           ; preds = %if.end60
  store i32 1, ptr %err, align 4, !dbg !96
  %165 = load i32, ptr %err, align 4, !dbg !96
  br label %if.end63, !dbg !96

if.end63:                                         ; preds = %if.end60, %then61
  %166 = load i32, ptr %c, align 4, !dbg !97
  %167 = load i32, ptr %a, align 4, !dbg !97
  %168 = icmp sgt i32 %166, %167, !dbg !97
  %169 = sext i1 %168 to i32, !dbg !97
  store i32 %169, ptr %v, align 4, !dbg !97
  %170 = load i32, ptr %v, align 4, !dbg !97
  %171 = load i32, ptr %v, align 4, !dbg !98
  %172 = icmp eq i32 %171, 0, !dbg !98
  br i1 %172, label %then64, label %if.end66, !dbg !98

then64:                                           ; preds = %if.end63
  store i32 1, ptr %err, align 4, !dbg !99
  %173 = load i32, ptr %err, align 4, !dbg !99
  br label %if.end66, !dbg !99

if.end66:                                         ; preds = %if.end63, %then64
  %174 = load i32, ptr %a, align 4, !dbg !100
  %175 = load i32, ptr %b, align 4, !dbg !100
  %176 = icmp sge i32 %174, %175, !dbg !100
  %177 = sext i1 %176 to i32, !dbg !100
  store i32 %177, ptr %v, align 4, !dbg !100
  %178 = load i32, ptr %v, align 4, !dbg !100
  %179 = load i32, ptr %v, align 4, !dbg !101
  %180 = icmp eq i32 %179, 0, !dbg !101
  br i1 %180, label %then67, label %if.end69, !dbg !101

then67:                                           ; preds = %if.end66
  store i32 1, ptr %err, align 4, !dbg !102
  %181 = load i32, ptr %err, align 4, !dbg !102
  br label %if.end69, !dbg !102

if.end69:                                         ; preds = %if.end66, %then67
  %182 = load i32, ptr %a, align 4, !dbg !103
  %183 = load i32, ptr %c, align 4, !dbg !103
  %184 = icmp sge i32 %182, %183, !dbg !103
  %185 = sext i1 %184 to i32, !dbg !103
  store i32 %185, ptr %v, align 4, !dbg !103
  %186 = load i32, ptr %v, align 4, !dbg !103
  %187 = load i32, ptr %v, align 4, !dbg !104
  %188 = icmp ne i32 %187, 0, !dbg !104
  br i1 %188, label %then70, label %if.end72, !dbg !104

then70:                                           ; preds = %if.end69
  store i32 1, ptr %err, align 4, !dbg !105
  %189 = load i32, ptr %err, align 4, !dbg !105
  br label %if.end72, !dbg !105

if.end72:                                         ; preds = %if.end69, %then70
  %190 = load i32, ptr %c, align 4, !dbg !106
  %191 = load i32, ptr %a, align 4, !dbg !106
  %192 = icmp sge i32 %190, %191, !dbg !106
  %193 = sext i1 %192 to i32, !dbg !106
  store i32 %193, ptr %v, align 4, !dbg !106
  %194 = load i32, ptr %v, align 4, !dbg !106
  %195 = load i32, ptr %v, align 4, !dbg !107
  %196 = icmp eq i32 %195, 0, !dbg !107
  br i1 %196, label %then73, label %if.end75, !dbg !107

then73:                                           ; preds = %if.end72
  store i32 1, ptr %err, align 4, !dbg !108
  %197 = load i32, ptr %err, align 4, !dbg !108
  br label %if.end75, !dbg !108

if.end75:                                         ; preds = %if.end72, %then73
  store i32 1, ptr %ua, align 4, !dbg !17
  store i32 -1, ptr %ub, align 4, !dbg !15
  %198 = load i32, ptr %ua, align 4, !dbg !109
  %199 = load i32, ptr %ub, align 4, !dbg !109
  %200 = icmp ult i32 %198, %199, !dbg !109
  %201 = sext i1 %200 to i32, !dbg !109
  store i32 %201, ptr %v, align 4, !dbg !109
  %202 = load i32, ptr %v, align 4, !dbg !109
  %203 = load i32, ptr %v, align 4, !dbg !110
  %204 = icmp eq i32 %203, 0, !dbg !110
  br i1 %204, label %then76, label %if.end78, !dbg !110

then76:                                           ; preds = %if.end75
  store i32 1, ptr %err, align 4, !dbg !111
  %205 = load i32, ptr %err, align 4, !dbg !111
  br label %if.end78, !dbg !111

if.end78:                                         ; preds = %if.end75, %then76
  %206 = load i32, ptr %ub, align 4, !dbg !112
  %207 = load i32, ptr %ua, align 4, !dbg !112
  %208 = icmp ugt i32 %206, %207, !dbg !112
  %209 = sext i1 %208 to i32, !dbg !112
  store i32 %209, ptr %v, align 4, !dbg !112
  %210 = load i32, ptr %v, align 4, !dbg !112
  %211 = load i32, ptr %v, align 4, !dbg !113
  %212 = icmp eq i32 %211, 0, !dbg !113
  br i1 %212, label %then79, label %if.end81, !dbg !113

then79:                                           ; preds = %if.end78
  store i32 1, ptr %err, align 4, !dbg !114
  %213 = load i32, ptr %err, align 4, !dbg !114
  br label %if.end81, !dbg !114

if.end81:                                         ; preds = %if.end78, %then79
  store i32 -1, ptr %si, align 4, !dbg !13
  store i32 1, ptr %ui, align 4, !dbg !11
  %214 = load i32, ptr %si, align 4, !dbg !115
  %215 = load i32, ptr %ui, align 4, !dbg !115
  %216 = icmp ult i32 %214, %215, !dbg !115
  %217 = sext i1 %216 to i32, !dbg !115
  store i32 %217, ptr %v, align 4, !dbg !115
  %218 = load i32, ptr %v, align 4, !dbg !115
  %219 = load i32, ptr %v, align 4, !dbg !116
  %220 = icmp ne i32 %219, 0, !dbg !116
  br i1 %220, label %then82, label %if.end84, !dbg !116

then82:                                           ; preds = %if.end81
  store i32 1, ptr %err, align 4, !dbg !117
  %221 = load i32, ptr %err, align 4, !dbg !117
  br label %if.end84, !dbg !117

if.end84:                                         ; preds = %if.end81, %then82
  %222 = load i32, ptr %si, align 4, !dbg !118
  %223 = load i32, ptr %ui, align 4, !dbg !118
  %224 = icmp ugt i32 %222, %223, !dbg !118
  %225 = sext i1 %224 to i32, !dbg !118
  store i32 %225, ptr %v, align 4, !dbg !118
  %226 = load i32, ptr %v, align 4, !dbg !118
  %227 = load i32, ptr %v, align 4, !dbg !119
  %228 = icmp eq i32 %227, 0, !dbg !119
  br i1 %228, label %then85, label %if.end87, !dbg !119

then85:                                           ; preds = %if.end84
  store i32 1, ptr %err, align 4, !dbg !120
  %229 = load i32, ptr %err, align 4, !dbg !120
  br label %if.end87, !dbg !120

if.end87:                                         ; preds = %if.end84, %then85
  %230 = load i32, ptr %err, align 4, !dbg !121
  %231 = icmp eq i32 %230, 0, !dbg !121
  %. = select i1 %231, ptr @0, ptr @1, !dbg !122
  %232 = call i32 (ptr, ...) @printf(ptr %.), !dbg !122
  %233 = load i32, ptr %err, align 4, !dbg !123
  ret i32 %233, !dbg !123
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "15.logic.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "ui", scope: !4, file: !1, line: 76, type: !10)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !DILocation(line: 76, column: 3, scope: !4)
!12 = !DILocalVariable(name: "si", scope: !4, file: !1, line: 75, type: !7)
!13 = !DILocation(line: 75, column: 3, scope: !4)
!14 = !DILocalVariable(name: "ub", scope: !4, file: !1, line: 69, type: !10)
!15 = !DILocation(line: 69, column: 3, scope: !4)
!16 = !DILocalVariable(name: "ua", scope: !4, file: !1, line: 68, type: !10)
!17 = !DILocation(line: 68, column: 3, scope: !4)
!18 = !DILocalVariable(name: "c", scope: !4, file: !1, line: 33, type: !7)
!19 = !DILocation(line: 33, column: 3, scope: !4)
!20 = !DILocalVariable(name: "b", scope: !4, file: !1, line: 32, type: !7)
!21 = !DILocation(line: 32, column: 3, scope: !4)
!22 = !DILocalVariable(name: "a", scope: !4, file: !1, line: 31, type: !7)
!23 = !DILocation(line: 31, column: 3, scope: !4)
!24 = !DILocalVariable(name: "v", scope: !4, file: !1, line: 7, type: !7)
!25 = !DILocation(line: 7, column: 3, scope: !4)
!26 = !DILocalVariable(name: "f", scope: !4, file: !1, line: 6, type: !27)
!27 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!28 = !DILocation(line: 6, column: 3, scope: !4)
!29 = !DILocalVariable(name: "t", scope: !4, file: !1, line: 5, type: !27)
!30 = !DILocation(line: 5, column: 3, scope: !4)
!31 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 4, type: !7)
!32 = !DILocation(line: 4, column: 3, scope: !4)
!33 = !DILocation(line: 9, column: 3, scope: !4)
!34 = !DILocation(line: 9, column: 15, scope: !4)
!35 = !DILocation(line: 10, column: 3, scope: !4)
!36 = !DILocation(line: 10, column: 15, scope: !4)
!37 = !DILocation(line: 12, column: 3, scope: !4)
!38 = !DILocation(line: 13, column: 3, scope: !4)
!39 = !DILocation(line: 13, column: 15, scope: !4)
!40 = !DILocation(line: 14, column: 3, scope: !4)
!41 = !DILocation(line: 15, column: 3, scope: !4)
!42 = !DILocation(line: 15, column: 15, scope: !4)
!43 = !DILocation(line: 16, column: 3, scope: !4)
!44 = !DILocation(line: 17, column: 3, scope: !4)
!45 = !DILocation(line: 17, column: 15, scope: !4)
!46 = !DILocation(line: 19, column: 3, scope: !4)
!47 = !DILocation(line: 20, column: 3, scope: !4)
!48 = !DILocation(line: 20, column: 15, scope: !4)
!49 = !DILocation(line: 21, column: 3, scope: !4)
!50 = !DILocation(line: 22, column: 3, scope: !4)
!51 = !DILocation(line: 22, column: 15, scope: !4)
!52 = !DILocation(line: 23, column: 3, scope: !4)
!53 = !DILocation(line: 24, column: 3, scope: !4)
!54 = !DILocation(line: 24, column: 15, scope: !4)
!55 = !DILocation(line: 26, column: 3, scope: !4)
!56 = !DILocation(line: 27, column: 3, scope: !4)
!57 = !DILocation(line: 27, column: 15, scope: !4)
!58 = !DILocation(line: 28, column: 3, scope: !4)
!59 = !DILocation(line: 29, column: 3, scope: !4)
!60 = !DILocation(line: 29, column: 15, scope: !4)
!61 = !DILocation(line: 35, column: 3, scope: !4)
!62 = !DILocation(line: 36, column: 3, scope: !4)
!63 = !DILocation(line: 36, column: 15, scope: !4)
!64 = !DILocation(line: 37, column: 3, scope: !4)
!65 = !DILocation(line: 38, column: 3, scope: !4)
!66 = !DILocation(line: 38, column: 15, scope: !4)
!67 = !DILocation(line: 39, column: 3, scope: !4)
!68 = !DILocation(line: 40, column: 3, scope: !4)
!69 = !DILocation(line: 40, column: 15, scope: !4)
!70 = !DILocation(line: 41, column: 3, scope: !4)
!71 = !DILocation(line: 42, column: 3, scope: !4)
!72 = !DILocation(line: 42, column: 15, scope: !4)
!73 = !DILocation(line: 43, column: 3, scope: !4)
!74 = !DILocation(line: 44, column: 3, scope: !4)
!75 = !DILocation(line: 44, column: 15, scope: !4)
!76 = !DILocation(line: 45, column: 3, scope: !4)
!77 = !DILocation(line: 46, column: 3, scope: !4)
!78 = !DILocation(line: 46, column: 15, scope: !4)
!79 = !DILocation(line: 47, column: 3, scope: !4)
!80 = !DILocation(line: 48, column: 3, scope: !4)
!81 = !DILocation(line: 48, column: 15, scope: !4)
!82 = !DILocation(line: 49, column: 3, scope: !4)
!83 = !DILocation(line: 50, column: 3, scope: !4)
!84 = !DILocation(line: 50, column: 15, scope: !4)
!85 = !DILocation(line: 51, column: 3, scope: !4)
!86 = !DILocation(line: 52, column: 3, scope: !4)
!87 = !DILocation(line: 52, column: 15, scope: !4)
!88 = !DILocation(line: 53, column: 3, scope: !4)
!89 = !DILocation(line: 54, column: 3, scope: !4)
!90 = !DILocation(line: 54, column: 15, scope: !4)
!91 = !DILocation(line: 55, column: 3, scope: !4)
!92 = !DILocation(line: 56, column: 3, scope: !4)
!93 = !DILocation(line: 56, column: 15, scope: !4)
!94 = !DILocation(line: 57, column: 3, scope: !4)
!95 = !DILocation(line: 58, column: 3, scope: !4)
!96 = !DILocation(line: 58, column: 15, scope: !4)
!97 = !DILocation(line: 59, column: 3, scope: !4)
!98 = !DILocation(line: 60, column: 3, scope: !4)
!99 = !DILocation(line: 60, column: 15, scope: !4)
!100 = !DILocation(line: 61, column: 3, scope: !4)
!101 = !DILocation(line: 62, column: 3, scope: !4)
!102 = !DILocation(line: 62, column: 15, scope: !4)
!103 = !DILocation(line: 63, column: 3, scope: !4)
!104 = !DILocation(line: 64, column: 3, scope: !4)
!105 = !DILocation(line: 64, column: 15, scope: !4)
!106 = !DILocation(line: 65, column: 3, scope: !4)
!107 = !DILocation(line: 66, column: 3, scope: !4)
!108 = !DILocation(line: 66, column: 15, scope: !4)
!109 = !DILocation(line: 70, column: 3, scope: !4)
!110 = !DILocation(line: 71, column: 3, scope: !4)
!111 = !DILocation(line: 71, column: 15, scope: !4)
!112 = !DILocation(line: 72, column: 3, scope: !4)
!113 = !DILocation(line: 73, column: 3, scope: !4)
!114 = !DILocation(line: 73, column: 15, scope: !4)
!115 = !DILocation(line: 77, column: 3, scope: !4)
!116 = !DILocation(line: 78, column: 3, scope: !4)
!117 = !DILocation(line: 78, column: 15, scope: !4)
!118 = !DILocation(line: 79, column: 3, scope: !4)
!119 = !DILocation(line: 80, column: 3, scope: !4)
!120 = !DILocation(line: 80, column: 15, scope: !4)
!121 = !DILocation(line: 82, column: 3, scope: !4)
!122 = !DILocation(line: 0, scope: !4)
!123 = !DILocation(line: 87, column: 3, scope: !4)
