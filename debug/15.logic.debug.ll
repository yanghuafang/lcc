; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [17 x i8] c"15.logic.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"15.logic.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %ui = alloca i32, align 4
  %si = alloca i32, align 4
  %ub = alloca i32, align 4
  %ua = alloca i32, align 4
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %v = alloca i32, align 4
  %f = alloca i1, align 1
  %t = alloca i1, align 1
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  store i1 true, i1* %t, align 1, !dbg !8
  store i1 false, i1* %f, align 1, !dbg !9
  %0 = load i1, i1* %t, align 1, !dbg !10
  %1 = zext i1 %0 to i32, !dbg !10
  %2 = icmp eq i32 %1, 0, !dbg !10
  br i1 %2, label %then, label %if.end, !dbg !10

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !11
  %3 = load i32, i32* %err, align 4, !dbg !11
  br label %if.end, !dbg !11

if.end:                                           ; preds = %entry, %then
  %4 = load i1, i1* %f, align 1, !dbg !12
  %5 = zext i1 %4 to i32, !dbg !12
  %6 = icmp ne i32 %5, 0, !dbg !12
  br i1 %6, label %then1, label %if.end3, !dbg !12

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !13
  %7 = load i32, i32* %err, align 4, !dbg !13
  br label %if.end3, !dbg !13

if.end3:                                          ; preds = %if.end, %then1
  %8 = load i1, i1* %t, align 1, !dbg !14
  %9 = load i1, i1* %f, align 1, !dbg !14
  %10 = select i1 %8, i1 %9, i1 false, !dbg !14
  %11 = sext i1 %10 to i32, !dbg !14
  store i32 %11, i32* %v, align 4, !dbg !14
  %12 = load i32, i32* %v, align 4, !dbg !14
  %13 = load i32, i32* %v, align 4, !dbg !15
  %14 = icmp ne i32 %13, 0, !dbg !15
  br i1 %14, label %then4, label %if.end6, !dbg !15

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !16
  %15 = load i32, i32* %err, align 4, !dbg !16
  br label %if.end6, !dbg !16

if.end6:                                          ; preds = %if.end3, %then4
  %16 = load i1, i1* %t, align 1, !dbg !17
  %17 = load i1, i1* %t, align 1, !dbg !17
  %18 = select i1 %16, i1 %17, i1 false, !dbg !17
  %19 = sext i1 %18 to i32, !dbg !17
  store i32 %19, i32* %v, align 4, !dbg !17
  %20 = load i32, i32* %v, align 4, !dbg !17
  %21 = load i32, i32* %v, align 4, !dbg !18
  %22 = icmp eq i32 %21, 0, !dbg !18
  br i1 %22, label %then7, label %if.end9, !dbg !18

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !19
  %23 = load i32, i32* %err, align 4, !dbg !19
  br label %if.end9, !dbg !19

if.end9:                                          ; preds = %if.end6, %then7
  %24 = load i1, i1* %f, align 1, !dbg !20
  %25 = load i1, i1* %f, align 1, !dbg !20
  %26 = select i1 %24, i1 %25, i1 false, !dbg !20
  %27 = sext i1 %26 to i32, !dbg !20
  store i32 %27, i32* %v, align 4, !dbg !20
  %28 = load i32, i32* %v, align 4, !dbg !20
  %29 = load i32, i32* %v, align 4, !dbg !21
  %30 = icmp ne i32 %29, 0, !dbg !21
  br i1 %30, label %then10, label %if.end12, !dbg !21

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !22
  %31 = load i32, i32* %err, align 4, !dbg !22
  br label %if.end12, !dbg !22

if.end12:                                         ; preds = %if.end9, %then10
  %32 = load i1, i1* %t, align 1, !dbg !23
  %33 = load i1, i1* %f, align 1, !dbg !23
  %34 = select i1 %32, i1 true, i1 %33, !dbg !23
  %35 = sext i1 %34 to i32, !dbg !23
  store i32 %35, i32* %v, align 4, !dbg !23
  %36 = load i32, i32* %v, align 4, !dbg !23
  %37 = load i32, i32* %v, align 4, !dbg !24
  %38 = icmp eq i32 %37, 0, !dbg !24
  br i1 %38, label %then13, label %if.end15, !dbg !24

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !25
  %39 = load i32, i32* %err, align 4, !dbg !25
  br label %if.end15, !dbg !25

if.end15:                                         ; preds = %if.end12, %then13
  %40 = load i1, i1* %t, align 1, !dbg !26
  %41 = load i1, i1* %t, align 1, !dbg !26
  %42 = select i1 %40, i1 true, i1 %41, !dbg !26
  %43 = sext i1 %42 to i32, !dbg !26
  store i32 %43, i32* %v, align 4, !dbg !26
  %44 = load i32, i32* %v, align 4, !dbg !26
  %45 = load i32, i32* %v, align 4, !dbg !27
  %46 = icmp eq i32 %45, 0, !dbg !27
  br i1 %46, label %then16, label %if.end18, !dbg !27

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !28
  %47 = load i32, i32* %err, align 4, !dbg !28
  br label %if.end18, !dbg !28

if.end18:                                         ; preds = %if.end15, %then16
  %48 = load i1, i1* %f, align 1, !dbg !29
  %49 = load i1, i1* %f, align 1, !dbg !29
  %50 = select i1 %48, i1 true, i1 %49, !dbg !29
  %51 = sext i1 %50 to i32, !dbg !29
  store i32 %51, i32* %v, align 4, !dbg !29
  %52 = load i32, i32* %v, align 4, !dbg !29
  %53 = load i32, i32* %v, align 4, !dbg !30
  %54 = icmp ne i32 %53, 0, !dbg !30
  br i1 %54, label %then19, label %if.end21, !dbg !30

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !31
  %55 = load i32, i32* %err, align 4, !dbg !31
  br label %if.end21, !dbg !31

if.end21:                                         ; preds = %if.end18, %then19
  %56 = load i1, i1* %t, align 1, !dbg !32
  %57 = icmp eq i1 %56, false, !dbg !32
  %58 = sext i1 %57 to i32, !dbg !32
  store i32 %58, i32* %v, align 4, !dbg !32
  %59 = load i32, i32* %v, align 4, !dbg !32
  %60 = load i32, i32* %v, align 4, !dbg !33
  %61 = icmp ne i32 %60, 0, !dbg !33
  br i1 %61, label %then22, label %if.end24, !dbg !33

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !34
  %62 = load i32, i32* %err, align 4, !dbg !34
  br label %if.end24, !dbg !34

if.end24:                                         ; preds = %if.end21, %then22
  %63 = load i1, i1* %f, align 1, !dbg !35
  %64 = icmp eq i1 %63, false, !dbg !35
  %65 = sext i1 %64 to i32, !dbg !35
  store i32 %65, i32* %v, align 4, !dbg !35
  %66 = load i32, i32* %v, align 4, !dbg !35
  %67 = load i32, i32* %v, align 4, !dbg !36
  %68 = icmp eq i32 %67, 0, !dbg !36
  br i1 %68, label %then25, label %if.end27, !dbg !36

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !37
  %69 = load i32, i32* %err, align 4, !dbg !37
  br label %if.end27, !dbg !37

if.end27:                                         ; preds = %if.end24, %then25
  store i32 100, i32* %a, align 4, !dbg !38
  store i32 100, i32* %b, align 4, !dbg !39
  store i32 128, i32* %c, align 4, !dbg !40
  %70 = load i32, i32* %a, align 4, !dbg !41
  %71 = load i32, i32* %b, align 4, !dbg !41
  %72 = icmp eq i32 %70, %71, !dbg !41
  %73 = sext i1 %72 to i32, !dbg !41
  store i32 %73, i32* %v, align 4, !dbg !41
  %74 = load i32, i32* %v, align 4, !dbg !41
  %75 = load i32, i32* %v, align 4, !dbg !42
  %76 = icmp eq i32 %75, 0, !dbg !42
  br i1 %76, label %then28, label %if.end30, !dbg !42

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !43
  %77 = load i32, i32* %err, align 4, !dbg !43
  br label %if.end30, !dbg !43

if.end30:                                         ; preds = %if.end27, %then28
  %78 = load i32, i32* %a, align 4, !dbg !44
  %79 = load i32, i32* %c, align 4, !dbg !44
  %80 = icmp eq i32 %78, %79, !dbg !44
  %81 = sext i1 %80 to i32, !dbg !44
  store i32 %81, i32* %v, align 4, !dbg !44
  %82 = load i32, i32* %v, align 4, !dbg !44
  %83 = load i32, i32* %v, align 4, !dbg !45
  %84 = icmp ne i32 %83, 0, !dbg !45
  br i1 %84, label %then31, label %if.end33, !dbg !45

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !46
  %85 = load i32, i32* %err, align 4, !dbg !46
  br label %if.end33, !dbg !46

if.end33:                                         ; preds = %if.end30, %then31
  %86 = load i32, i32* %a, align 4, !dbg !47
  %87 = load i32, i32* %b, align 4, !dbg !47
  %88 = icmp ne i32 %86, %87, !dbg !47
  %89 = sext i1 %88 to i32, !dbg !47
  store i32 %89, i32* %v, align 4, !dbg !47
  %90 = load i32, i32* %v, align 4, !dbg !47
  %91 = load i32, i32* %v, align 4, !dbg !48
  %92 = icmp ne i32 %91, 0, !dbg !48
  br i1 %92, label %then34, label %if.end36, !dbg !48

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4, !dbg !49
  %93 = load i32, i32* %err, align 4, !dbg !49
  br label %if.end36, !dbg !49

if.end36:                                         ; preds = %if.end33, %then34
  %94 = load i32, i32* %a, align 4, !dbg !50
  %95 = load i32, i32* %c, align 4, !dbg !50
  %96 = icmp ne i32 %94, %95, !dbg !50
  %97 = sext i1 %96 to i32, !dbg !50
  store i32 %97, i32* %v, align 4, !dbg !50
  %98 = load i32, i32* %v, align 4, !dbg !50
  %99 = load i32, i32* %v, align 4, !dbg !51
  %100 = icmp eq i32 %99, 0, !dbg !51
  br i1 %100, label %then37, label %if.end39, !dbg !51

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4, !dbg !52
  %101 = load i32, i32* %err, align 4, !dbg !52
  br label %if.end39, !dbg !52

if.end39:                                         ; preds = %if.end36, %then37
  %102 = load i32, i32* %a, align 4, !dbg !53
  %103 = load i32, i32* %b, align 4, !dbg !53
  %104 = icmp slt i32 %102, %103, !dbg !53
  %105 = sext i1 %104 to i32, !dbg !53
  store i32 %105, i32* %v, align 4, !dbg !53
  %106 = load i32, i32* %v, align 4, !dbg !53
  %107 = load i32, i32* %v, align 4, !dbg !54
  %108 = icmp ne i32 %107, 0, !dbg !54
  br i1 %108, label %then40, label %if.end42, !dbg !54

then40:                                           ; preds = %if.end39
  store i32 1, i32* %err, align 4, !dbg !55
  %109 = load i32, i32* %err, align 4, !dbg !55
  br label %if.end42, !dbg !55

if.end42:                                         ; preds = %if.end39, %then40
  %110 = load i32, i32* %a, align 4, !dbg !56
  %111 = load i32, i32* %c, align 4, !dbg !56
  %112 = icmp slt i32 %110, %111, !dbg !56
  %113 = sext i1 %112 to i32, !dbg !56
  store i32 %113, i32* %v, align 4, !dbg !56
  %114 = load i32, i32* %v, align 4, !dbg !56
  %115 = load i32, i32* %v, align 4, !dbg !57
  %116 = icmp eq i32 %115, 0, !dbg !57
  br i1 %116, label %then43, label %if.end45, !dbg !57

then43:                                           ; preds = %if.end42
  store i32 1, i32* %err, align 4, !dbg !58
  %117 = load i32, i32* %err, align 4, !dbg !58
  br label %if.end45, !dbg !58

if.end45:                                         ; preds = %if.end42, %then43
  %118 = load i32, i32* %c, align 4, !dbg !59
  %119 = load i32, i32* %a, align 4, !dbg !59
  %120 = icmp slt i32 %118, %119, !dbg !59
  %121 = sext i1 %120 to i32, !dbg !59
  store i32 %121, i32* %v, align 4, !dbg !59
  %122 = load i32, i32* %v, align 4, !dbg !59
  %123 = load i32, i32* %v, align 4, !dbg !60
  %124 = icmp ne i32 %123, 0, !dbg !60
  br i1 %124, label %then46, label %if.end48, !dbg !60

then46:                                           ; preds = %if.end45
  store i32 1, i32* %err, align 4, !dbg !61
  %125 = load i32, i32* %err, align 4, !dbg !61
  br label %if.end48, !dbg !61

if.end48:                                         ; preds = %if.end45, %then46
  %126 = load i32, i32* %a, align 4, !dbg !62
  %127 = load i32, i32* %b, align 4, !dbg !62
  %128 = icmp sle i32 %126, %127, !dbg !62
  %129 = sext i1 %128 to i32, !dbg !62
  store i32 %129, i32* %v, align 4, !dbg !62
  %130 = load i32, i32* %v, align 4, !dbg !62
  %131 = load i32, i32* %v, align 4, !dbg !63
  %132 = icmp eq i32 %131, 0, !dbg !63
  br i1 %132, label %then49, label %if.end51, !dbg !63

then49:                                           ; preds = %if.end48
  store i32 1, i32* %err, align 4, !dbg !64
  %133 = load i32, i32* %err, align 4, !dbg !64
  br label %if.end51, !dbg !64

if.end51:                                         ; preds = %if.end48, %then49
  %134 = load i32, i32* %a, align 4, !dbg !65
  %135 = load i32, i32* %c, align 4, !dbg !65
  %136 = icmp sle i32 %134, %135, !dbg !65
  %137 = sext i1 %136 to i32, !dbg !65
  store i32 %137, i32* %v, align 4, !dbg !65
  %138 = load i32, i32* %v, align 4, !dbg !65
  %139 = load i32, i32* %v, align 4, !dbg !66
  %140 = icmp eq i32 %139, 0, !dbg !66
  br i1 %140, label %then52, label %if.end54, !dbg !66

then52:                                           ; preds = %if.end51
  store i32 1, i32* %err, align 4, !dbg !67
  %141 = load i32, i32* %err, align 4, !dbg !67
  br label %if.end54, !dbg !67

if.end54:                                         ; preds = %if.end51, %then52
  %142 = load i32, i32* %c, align 4, !dbg !68
  %143 = load i32, i32* %a, align 4, !dbg !68
  %144 = icmp sle i32 %142, %143, !dbg !68
  %145 = sext i1 %144 to i32, !dbg !68
  store i32 %145, i32* %v, align 4, !dbg !68
  %146 = load i32, i32* %v, align 4, !dbg !68
  %147 = load i32, i32* %v, align 4, !dbg !69
  %148 = icmp ne i32 %147, 0, !dbg !69
  br i1 %148, label %then55, label %if.end57, !dbg !69

then55:                                           ; preds = %if.end54
  store i32 1, i32* %err, align 4, !dbg !70
  %149 = load i32, i32* %err, align 4, !dbg !70
  br label %if.end57, !dbg !70

if.end57:                                         ; preds = %if.end54, %then55
  %150 = load i32, i32* %a, align 4, !dbg !71
  %151 = load i32, i32* %b, align 4, !dbg !71
  %152 = icmp sgt i32 %150, %151, !dbg !71
  %153 = sext i1 %152 to i32, !dbg !71
  store i32 %153, i32* %v, align 4, !dbg !71
  %154 = load i32, i32* %v, align 4, !dbg !71
  %155 = load i32, i32* %v, align 4, !dbg !72
  %156 = icmp ne i32 %155, 0, !dbg !72
  br i1 %156, label %then58, label %if.end60, !dbg !72

then58:                                           ; preds = %if.end57
  store i32 1, i32* %err, align 4, !dbg !73
  %157 = load i32, i32* %err, align 4, !dbg !73
  br label %if.end60, !dbg !73

if.end60:                                         ; preds = %if.end57, %then58
  %158 = load i32, i32* %a, align 4, !dbg !74
  %159 = load i32, i32* %c, align 4, !dbg !74
  %160 = icmp sgt i32 %158, %159, !dbg !74
  %161 = sext i1 %160 to i32, !dbg !74
  store i32 %161, i32* %v, align 4, !dbg !74
  %162 = load i32, i32* %v, align 4, !dbg !74
  %163 = load i32, i32* %v, align 4, !dbg !75
  %164 = icmp ne i32 %163, 0, !dbg !75
  br i1 %164, label %then61, label %if.end63, !dbg !75

then61:                                           ; preds = %if.end60
  store i32 1, i32* %err, align 4, !dbg !76
  %165 = load i32, i32* %err, align 4, !dbg !76
  br label %if.end63, !dbg !76

if.end63:                                         ; preds = %if.end60, %then61
  %166 = load i32, i32* %c, align 4, !dbg !77
  %167 = load i32, i32* %a, align 4, !dbg !77
  %168 = icmp sgt i32 %166, %167, !dbg !77
  %169 = sext i1 %168 to i32, !dbg !77
  store i32 %169, i32* %v, align 4, !dbg !77
  %170 = load i32, i32* %v, align 4, !dbg !77
  %171 = load i32, i32* %v, align 4, !dbg !78
  %172 = icmp eq i32 %171, 0, !dbg !78
  br i1 %172, label %then64, label %if.end66, !dbg !78

then64:                                           ; preds = %if.end63
  store i32 1, i32* %err, align 4, !dbg !79
  %173 = load i32, i32* %err, align 4, !dbg !79
  br label %if.end66, !dbg !79

if.end66:                                         ; preds = %if.end63, %then64
  %174 = load i32, i32* %a, align 4, !dbg !80
  %175 = load i32, i32* %b, align 4, !dbg !80
  %176 = icmp sge i32 %174, %175, !dbg !80
  %177 = sext i1 %176 to i32, !dbg !80
  store i32 %177, i32* %v, align 4, !dbg !80
  %178 = load i32, i32* %v, align 4, !dbg !80
  %179 = load i32, i32* %v, align 4, !dbg !81
  %180 = icmp eq i32 %179, 0, !dbg !81
  br i1 %180, label %then67, label %if.end69, !dbg !81

then67:                                           ; preds = %if.end66
  store i32 1, i32* %err, align 4, !dbg !82
  %181 = load i32, i32* %err, align 4, !dbg !82
  br label %if.end69, !dbg !82

if.end69:                                         ; preds = %if.end66, %then67
  %182 = load i32, i32* %a, align 4, !dbg !83
  %183 = load i32, i32* %c, align 4, !dbg !83
  %184 = icmp sge i32 %182, %183, !dbg !83
  %185 = sext i1 %184 to i32, !dbg !83
  store i32 %185, i32* %v, align 4, !dbg !83
  %186 = load i32, i32* %v, align 4, !dbg !83
  %187 = load i32, i32* %v, align 4, !dbg !84
  %188 = icmp ne i32 %187, 0, !dbg !84
  br i1 %188, label %then70, label %if.end72, !dbg !84

then70:                                           ; preds = %if.end69
  store i32 1, i32* %err, align 4, !dbg !85
  %189 = load i32, i32* %err, align 4, !dbg !85
  br label %if.end72, !dbg !85

if.end72:                                         ; preds = %if.end69, %then70
  %190 = load i32, i32* %c, align 4, !dbg !86
  %191 = load i32, i32* %a, align 4, !dbg !86
  %192 = icmp sge i32 %190, %191, !dbg !86
  %193 = sext i1 %192 to i32, !dbg !86
  store i32 %193, i32* %v, align 4, !dbg !86
  %194 = load i32, i32* %v, align 4, !dbg !86
  %195 = load i32, i32* %v, align 4, !dbg !87
  %196 = icmp eq i32 %195, 0, !dbg !87
  br i1 %196, label %then73, label %if.end75, !dbg !87

then73:                                           ; preds = %if.end72
  store i32 1, i32* %err, align 4, !dbg !88
  %197 = load i32, i32* %err, align 4, !dbg !88
  br label %if.end75, !dbg !88

if.end75:                                         ; preds = %if.end72, %then73
  store i32 1, i32* %ua, align 4, !dbg !89
  store i32 -1, i32* %ub, align 4, !dbg !90
  %198 = load i32, i32* %ua, align 4, !dbg !91
  %199 = load i32, i32* %ub, align 4, !dbg !91
  %200 = icmp ult i32 %198, %199, !dbg !91
  %201 = sext i1 %200 to i32, !dbg !91
  store i32 %201, i32* %v, align 4, !dbg !91
  %202 = load i32, i32* %v, align 4, !dbg !91
  %203 = load i32, i32* %v, align 4, !dbg !92
  %204 = icmp eq i32 %203, 0, !dbg !92
  br i1 %204, label %then76, label %if.end78, !dbg !92

then76:                                           ; preds = %if.end75
  store i32 1, i32* %err, align 4, !dbg !93
  %205 = load i32, i32* %err, align 4, !dbg !93
  br label %if.end78, !dbg !93

if.end78:                                         ; preds = %if.end75, %then76
  %206 = load i32, i32* %ub, align 4, !dbg !94
  %207 = load i32, i32* %ua, align 4, !dbg !94
  %208 = icmp ugt i32 %206, %207, !dbg !94
  %209 = sext i1 %208 to i32, !dbg !94
  store i32 %209, i32* %v, align 4, !dbg !94
  %210 = load i32, i32* %v, align 4, !dbg !94
  %211 = load i32, i32* %v, align 4, !dbg !95
  %212 = icmp eq i32 %211, 0, !dbg !95
  br i1 %212, label %then79, label %if.end81, !dbg !95

then79:                                           ; preds = %if.end78
  store i32 1, i32* %err, align 4, !dbg !96
  %213 = load i32, i32* %err, align 4, !dbg !96
  br label %if.end81, !dbg !96

if.end81:                                         ; preds = %if.end78, %then79
  store i32 -1, i32* %si, align 4, !dbg !97
  store i32 1, i32* %ui, align 4, !dbg !98
  %214 = load i32, i32* %si, align 4, !dbg !99
  %215 = load i32, i32* %ui, align 4, !dbg !99
  %216 = icmp ult i32 %214, %215, !dbg !99
  %217 = sext i1 %216 to i32, !dbg !99
  store i32 %217, i32* %v, align 4, !dbg !99
  %218 = load i32, i32* %v, align 4, !dbg !99
  %219 = load i32, i32* %v, align 4, !dbg !100
  %220 = icmp ne i32 %219, 0, !dbg !100
  br i1 %220, label %then82, label %if.end84, !dbg !100

then82:                                           ; preds = %if.end81
  store i32 1, i32* %err, align 4, !dbg !101
  %221 = load i32, i32* %err, align 4, !dbg !101
  br label %if.end84, !dbg !101

if.end84:                                         ; preds = %if.end81, %then82
  %222 = load i32, i32* %si, align 4, !dbg !102
  %223 = load i32, i32* %ui, align 4, !dbg !102
  %224 = icmp ugt i32 %222, %223, !dbg !102
  %225 = sext i1 %224 to i32, !dbg !102
  store i32 %225, i32* %v, align 4, !dbg !102
  %226 = load i32, i32* %v, align 4, !dbg !102
  %227 = load i32, i32* %v, align 4, !dbg !103
  %228 = icmp eq i32 %227, 0, !dbg !103
  br i1 %228, label %then85, label %if.end87, !dbg !103

then85:                                           ; preds = %if.end84
  store i32 1, i32* %err, align 4, !dbg !104
  %229 = load i32, i32* %err, align 4, !dbg !104
  br label %if.end87, !dbg !104

if.end87:                                         ; preds = %if.end84, %then85
  %230 = load i32, i32* %err, align 4, !dbg !105
  %231 = icmp eq i32 %230, 0, !dbg !105
  %. = select i1 %231, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @1, i32 0, i32 0), !dbg !106
  %232 = call i32 (i8*, ...) @printf(i8* %.), !dbg !106
  %233 = load i32, i32* %err, align 4, !dbg !107
  ret i32 %233, !dbg !107
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "15.logic.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 4, column: 3, scope: !2)
!8 = !DILocation(line: 5, column: 3, scope: !2)
!9 = !DILocation(line: 6, column: 3, scope: !2)
!10 = !DILocation(line: 9, column: 3, scope: !2)
!11 = !DILocation(line: 9, column: 15, scope: !2)
!12 = !DILocation(line: 10, column: 3, scope: !2)
!13 = !DILocation(line: 10, column: 15, scope: !2)
!14 = !DILocation(line: 12, column: 3, scope: !2)
!15 = !DILocation(line: 13, column: 3, scope: !2)
!16 = !DILocation(line: 13, column: 15, scope: !2)
!17 = !DILocation(line: 14, column: 3, scope: !2)
!18 = !DILocation(line: 15, column: 3, scope: !2)
!19 = !DILocation(line: 15, column: 15, scope: !2)
!20 = !DILocation(line: 16, column: 3, scope: !2)
!21 = !DILocation(line: 17, column: 3, scope: !2)
!22 = !DILocation(line: 17, column: 15, scope: !2)
!23 = !DILocation(line: 19, column: 3, scope: !2)
!24 = !DILocation(line: 20, column: 3, scope: !2)
!25 = !DILocation(line: 20, column: 15, scope: !2)
!26 = !DILocation(line: 21, column: 3, scope: !2)
!27 = !DILocation(line: 22, column: 3, scope: !2)
!28 = !DILocation(line: 22, column: 15, scope: !2)
!29 = !DILocation(line: 23, column: 3, scope: !2)
!30 = !DILocation(line: 24, column: 3, scope: !2)
!31 = !DILocation(line: 24, column: 15, scope: !2)
!32 = !DILocation(line: 26, column: 3, scope: !2)
!33 = !DILocation(line: 27, column: 3, scope: !2)
!34 = !DILocation(line: 27, column: 15, scope: !2)
!35 = !DILocation(line: 28, column: 3, scope: !2)
!36 = !DILocation(line: 29, column: 3, scope: !2)
!37 = !DILocation(line: 29, column: 15, scope: !2)
!38 = !DILocation(line: 31, column: 3, scope: !2)
!39 = !DILocation(line: 32, column: 3, scope: !2)
!40 = !DILocation(line: 33, column: 3, scope: !2)
!41 = !DILocation(line: 35, column: 3, scope: !2)
!42 = !DILocation(line: 36, column: 3, scope: !2)
!43 = !DILocation(line: 36, column: 15, scope: !2)
!44 = !DILocation(line: 37, column: 3, scope: !2)
!45 = !DILocation(line: 38, column: 3, scope: !2)
!46 = !DILocation(line: 38, column: 15, scope: !2)
!47 = !DILocation(line: 39, column: 3, scope: !2)
!48 = !DILocation(line: 40, column: 3, scope: !2)
!49 = !DILocation(line: 40, column: 15, scope: !2)
!50 = !DILocation(line: 41, column: 3, scope: !2)
!51 = !DILocation(line: 42, column: 3, scope: !2)
!52 = !DILocation(line: 42, column: 15, scope: !2)
!53 = !DILocation(line: 43, column: 3, scope: !2)
!54 = !DILocation(line: 44, column: 3, scope: !2)
!55 = !DILocation(line: 44, column: 15, scope: !2)
!56 = !DILocation(line: 45, column: 3, scope: !2)
!57 = !DILocation(line: 46, column: 3, scope: !2)
!58 = !DILocation(line: 46, column: 15, scope: !2)
!59 = !DILocation(line: 47, column: 3, scope: !2)
!60 = !DILocation(line: 48, column: 3, scope: !2)
!61 = !DILocation(line: 48, column: 15, scope: !2)
!62 = !DILocation(line: 49, column: 3, scope: !2)
!63 = !DILocation(line: 50, column: 3, scope: !2)
!64 = !DILocation(line: 50, column: 15, scope: !2)
!65 = !DILocation(line: 51, column: 3, scope: !2)
!66 = !DILocation(line: 52, column: 3, scope: !2)
!67 = !DILocation(line: 52, column: 15, scope: !2)
!68 = !DILocation(line: 53, column: 3, scope: !2)
!69 = !DILocation(line: 54, column: 3, scope: !2)
!70 = !DILocation(line: 54, column: 15, scope: !2)
!71 = !DILocation(line: 55, column: 3, scope: !2)
!72 = !DILocation(line: 56, column: 3, scope: !2)
!73 = !DILocation(line: 56, column: 15, scope: !2)
!74 = !DILocation(line: 57, column: 3, scope: !2)
!75 = !DILocation(line: 58, column: 3, scope: !2)
!76 = !DILocation(line: 58, column: 15, scope: !2)
!77 = !DILocation(line: 59, column: 3, scope: !2)
!78 = !DILocation(line: 60, column: 3, scope: !2)
!79 = !DILocation(line: 60, column: 15, scope: !2)
!80 = !DILocation(line: 61, column: 3, scope: !2)
!81 = !DILocation(line: 62, column: 3, scope: !2)
!82 = !DILocation(line: 62, column: 15, scope: !2)
!83 = !DILocation(line: 63, column: 3, scope: !2)
!84 = !DILocation(line: 64, column: 3, scope: !2)
!85 = !DILocation(line: 64, column: 15, scope: !2)
!86 = !DILocation(line: 65, column: 3, scope: !2)
!87 = !DILocation(line: 66, column: 3, scope: !2)
!88 = !DILocation(line: 66, column: 15, scope: !2)
!89 = !DILocation(line: 68, column: 3, scope: !2)
!90 = !DILocation(line: 69, column: 3, scope: !2)
!91 = !DILocation(line: 70, column: 3, scope: !2)
!92 = !DILocation(line: 71, column: 3, scope: !2)
!93 = !DILocation(line: 71, column: 15, scope: !2)
!94 = !DILocation(line: 72, column: 3, scope: !2)
!95 = !DILocation(line: 73, column: 3, scope: !2)
!96 = !DILocation(line: 73, column: 15, scope: !2)
!97 = !DILocation(line: 75, column: 3, scope: !2)
!98 = !DILocation(line: 76, column: 3, scope: !2)
!99 = !DILocation(line: 77, column: 3, scope: !2)
!100 = !DILocation(line: 78, column: 3, scope: !2)
!101 = !DILocation(line: 78, column: 15, scope: !2)
!102 = !DILocation(line: 79, column: 3, scope: !2)
!103 = !DILocation(line: 80, column: 3, scope: !2)
!104 = !DILocation(line: 80, column: 15, scope: !2)
!105 = !DILocation(line: 82, column: 3, scope: !2)
!106 = !DILocation(line: 0, scope: !2)
!107 = !DILocation(line: 87, column: 3, scope: !2)
