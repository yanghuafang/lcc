; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [17 x i8] c"15.logic.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"15.logic.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
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
  store i32 0, ptr %err, align 4
  store i1 true, ptr %t, align 1
  store i1 false, ptr %f, align 1
  %0 = load i1, ptr %t, align 1
  %1 = zext i1 %0 to i32
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %3 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %4 = load i1, ptr %f, align 1
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %7 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %8 = load i1, ptr %t, align 1
  br i1 %8, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end3
  %9 = load i1, ptr %f, align 1
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end3
  %10 = phi i1 [ false, %if.end3 ], [ %9, %land.rhs ]
  %11 = zext i1 %10 to i32
  store i32 %11, ptr %v, align 4
  %12 = load i32, ptr %v, align 4
  %13 = load i32, ptr %v, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %then4, label %else5

then4:                                            ; preds = %land.end
  store i32 1, ptr %err, align 4
  %15 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %land.end
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %16 = load i1, ptr %t, align 1
  br i1 %16, label %land.rhs7, label %land.end8

land.rhs7:                                        ; preds = %if.end6
  %17 = load i1, ptr %t, align 1
  br label %land.end8

land.end8:                                        ; preds = %land.rhs7, %if.end6
  %18 = phi i1 [ false, %if.end6 ], [ %17, %land.rhs7 ]
  %19 = zext i1 %18 to i32
  store i32 %19, ptr %v, align 4
  %20 = load i32, ptr %v, align 4
  %21 = load i32, ptr %v, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %then9, label %else10

then9:                                            ; preds = %land.end8
  store i32 1, ptr %err, align 4
  %23 = load i32, ptr %err, align 4
  br label %if.end11

else10:                                           ; preds = %land.end8
  br label %if.end11

if.end11:                                         ; preds = %else10, %then9
  %24 = load i1, ptr %f, align 1
  br i1 %24, label %land.rhs12, label %land.end13

land.rhs12:                                       ; preds = %if.end11
  %25 = load i1, ptr %f, align 1
  br label %land.end13

land.end13:                                       ; preds = %land.rhs12, %if.end11
  %26 = phi i1 [ false, %if.end11 ], [ %25, %land.rhs12 ]
  %27 = zext i1 %26 to i32
  store i32 %27, ptr %v, align 4
  %28 = load i32, ptr %v, align 4
  %29 = load i32, ptr %v, align 4
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %then14, label %else15

then14:                                           ; preds = %land.end13
  store i32 1, ptr %err, align 4
  %31 = load i32, ptr %err, align 4
  br label %if.end16

else15:                                           ; preds = %land.end13
  br label %if.end16

if.end16:                                         ; preds = %else15, %then14
  %32 = load i1, ptr %t, align 1
  br i1 %32, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end16
  %33 = load i1, ptr %f, align 1
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end16
  %34 = phi i1 [ true, %if.end16 ], [ %33, %lor.rhs ]
  %35 = zext i1 %34 to i32
  store i32 %35, ptr %v, align 4
  %36 = load i32, ptr %v, align 4
  %37 = load i32, ptr %v, align 4
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %then17, label %else18

then17:                                           ; preds = %lor.end
  store i32 1, ptr %err, align 4
  %39 = load i32, ptr %err, align 4
  br label %if.end19

else18:                                           ; preds = %lor.end
  br label %if.end19

if.end19:                                         ; preds = %else18, %then17
  %40 = load i1, ptr %t, align 1
  br i1 %40, label %lor.end21, label %lor.rhs20

lor.rhs20:                                        ; preds = %if.end19
  %41 = load i1, ptr %t, align 1
  br label %lor.end21

lor.end21:                                        ; preds = %lor.rhs20, %if.end19
  %42 = phi i1 [ true, %if.end19 ], [ %41, %lor.rhs20 ]
  %43 = zext i1 %42 to i32
  store i32 %43, ptr %v, align 4
  %44 = load i32, ptr %v, align 4
  %45 = load i32, ptr %v, align 4
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %then22, label %else23

then22:                                           ; preds = %lor.end21
  store i32 1, ptr %err, align 4
  %47 = load i32, ptr %err, align 4
  br label %if.end24

else23:                                           ; preds = %lor.end21
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %48 = load i1, ptr %f, align 1
  br i1 %48, label %lor.end26, label %lor.rhs25

lor.rhs25:                                        ; preds = %if.end24
  %49 = load i1, ptr %f, align 1
  br label %lor.end26

lor.end26:                                        ; preds = %lor.rhs25, %if.end24
  %50 = phi i1 [ true, %if.end24 ], [ %49, %lor.rhs25 ]
  %51 = zext i1 %50 to i32
  store i32 %51, ptr %v, align 4
  %52 = load i32, ptr %v, align 4
  %53 = load i32, ptr %v, align 4
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %then27, label %else28

then27:                                           ; preds = %lor.end26
  store i32 1, ptr %err, align 4
  %55 = load i32, ptr %err, align 4
  br label %if.end29

else28:                                           ; preds = %lor.end26
  br label %if.end29

if.end29:                                         ; preds = %else28, %then27
  %56 = load i1, ptr %t, align 1
  %57 = icmp eq i1 %56, false
  %58 = zext i1 %57 to i32
  store i32 %58, ptr %v, align 4
  %59 = load i32, ptr %v, align 4
  %60 = load i32, ptr %v, align 4
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %then30, label %else31

then30:                                           ; preds = %if.end29
  store i32 1, ptr %err, align 4
  %62 = load i32, ptr %err, align 4
  br label %if.end32

else31:                                           ; preds = %if.end29
  br label %if.end32

if.end32:                                         ; preds = %else31, %then30
  %63 = load i1, ptr %f, align 1
  %64 = icmp eq i1 %63, false
  %65 = zext i1 %64 to i32
  store i32 %65, ptr %v, align 4
  %66 = load i32, ptr %v, align 4
  %67 = load i32, ptr %v, align 4
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %then33, label %else34

then33:                                           ; preds = %if.end32
  store i32 1, ptr %err, align 4
  %69 = load i32, ptr %err, align 4
  br label %if.end35

else34:                                           ; preds = %if.end32
  br label %if.end35

if.end35:                                         ; preds = %else34, %then33
  store i32 100, ptr %a, align 4
  store i32 100, ptr %b, align 4
  store i32 128, ptr %c, align 4
  %70 = load i32, ptr %a, align 4
  %71 = load i32, ptr %b, align 4
  %72 = icmp eq i32 %70, %71
  %73 = zext i1 %72 to i32
  store i32 %73, ptr %v, align 4
  %74 = load i32, ptr %v, align 4
  %75 = load i32, ptr %v, align 4
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %then36, label %else37

then36:                                           ; preds = %if.end35
  store i32 1, ptr %err, align 4
  %77 = load i32, ptr %err, align 4
  br label %if.end38

else37:                                           ; preds = %if.end35
  br label %if.end38

if.end38:                                         ; preds = %else37, %then36
  %78 = load i32, ptr %a, align 4
  %79 = load i32, ptr %c, align 4
  %80 = icmp eq i32 %78, %79
  %81 = zext i1 %80 to i32
  store i32 %81, ptr %v, align 4
  %82 = load i32, ptr %v, align 4
  %83 = load i32, ptr %v, align 4
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %then39, label %else40

then39:                                           ; preds = %if.end38
  store i32 1, ptr %err, align 4
  %85 = load i32, ptr %err, align 4
  br label %if.end41

else40:                                           ; preds = %if.end38
  br label %if.end41

if.end41:                                         ; preds = %else40, %then39
  %86 = load i32, ptr %a, align 4
  %87 = load i32, ptr %b, align 4
  %88 = icmp ne i32 %86, %87
  %89 = zext i1 %88 to i32
  store i32 %89, ptr %v, align 4
  %90 = load i32, ptr %v, align 4
  %91 = load i32, ptr %v, align 4
  %92 = icmp ne i32 %91, 0
  br i1 %92, label %then42, label %else43

then42:                                           ; preds = %if.end41
  store i32 1, ptr %err, align 4
  %93 = load i32, ptr %err, align 4
  br label %if.end44

else43:                                           ; preds = %if.end41
  br label %if.end44

if.end44:                                         ; preds = %else43, %then42
  %94 = load i32, ptr %a, align 4
  %95 = load i32, ptr %c, align 4
  %96 = icmp ne i32 %94, %95
  %97 = zext i1 %96 to i32
  store i32 %97, ptr %v, align 4
  %98 = load i32, ptr %v, align 4
  %99 = load i32, ptr %v, align 4
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %then45, label %else46

then45:                                           ; preds = %if.end44
  store i32 1, ptr %err, align 4
  %101 = load i32, ptr %err, align 4
  br label %if.end47

else46:                                           ; preds = %if.end44
  br label %if.end47

if.end47:                                         ; preds = %else46, %then45
  %102 = load i32, ptr %a, align 4
  %103 = load i32, ptr %b, align 4
  %104 = icmp slt i32 %102, %103
  %105 = zext i1 %104 to i32
  store i32 %105, ptr %v, align 4
  %106 = load i32, ptr %v, align 4
  %107 = load i32, ptr %v, align 4
  %108 = icmp ne i32 %107, 0
  br i1 %108, label %then48, label %else49

then48:                                           ; preds = %if.end47
  store i32 1, ptr %err, align 4
  %109 = load i32, ptr %err, align 4
  br label %if.end50

else49:                                           ; preds = %if.end47
  br label %if.end50

if.end50:                                         ; preds = %else49, %then48
  %110 = load i32, ptr %a, align 4
  %111 = load i32, ptr %c, align 4
  %112 = icmp slt i32 %110, %111
  %113 = zext i1 %112 to i32
  store i32 %113, ptr %v, align 4
  %114 = load i32, ptr %v, align 4
  %115 = load i32, ptr %v, align 4
  %116 = icmp eq i32 %115, 0
  br i1 %116, label %then51, label %else52

then51:                                           ; preds = %if.end50
  store i32 1, ptr %err, align 4
  %117 = load i32, ptr %err, align 4
  br label %if.end53

else52:                                           ; preds = %if.end50
  br label %if.end53

if.end53:                                         ; preds = %else52, %then51
  %118 = load i32, ptr %c, align 4
  %119 = load i32, ptr %a, align 4
  %120 = icmp slt i32 %118, %119
  %121 = zext i1 %120 to i32
  store i32 %121, ptr %v, align 4
  %122 = load i32, ptr %v, align 4
  %123 = load i32, ptr %v, align 4
  %124 = icmp ne i32 %123, 0
  br i1 %124, label %then54, label %else55

then54:                                           ; preds = %if.end53
  store i32 1, ptr %err, align 4
  %125 = load i32, ptr %err, align 4
  br label %if.end56

else55:                                           ; preds = %if.end53
  br label %if.end56

if.end56:                                         ; preds = %else55, %then54
  %126 = load i32, ptr %a, align 4
  %127 = load i32, ptr %b, align 4
  %128 = icmp sle i32 %126, %127
  %129 = zext i1 %128 to i32
  store i32 %129, ptr %v, align 4
  %130 = load i32, ptr %v, align 4
  %131 = load i32, ptr %v, align 4
  %132 = icmp eq i32 %131, 0
  br i1 %132, label %then57, label %else58

then57:                                           ; preds = %if.end56
  store i32 1, ptr %err, align 4
  %133 = load i32, ptr %err, align 4
  br label %if.end59

else58:                                           ; preds = %if.end56
  br label %if.end59

if.end59:                                         ; preds = %else58, %then57
  %134 = load i32, ptr %a, align 4
  %135 = load i32, ptr %c, align 4
  %136 = icmp sle i32 %134, %135
  %137 = zext i1 %136 to i32
  store i32 %137, ptr %v, align 4
  %138 = load i32, ptr %v, align 4
  %139 = load i32, ptr %v, align 4
  %140 = icmp eq i32 %139, 0
  br i1 %140, label %then60, label %else61

then60:                                           ; preds = %if.end59
  store i32 1, ptr %err, align 4
  %141 = load i32, ptr %err, align 4
  br label %if.end62

else61:                                           ; preds = %if.end59
  br label %if.end62

if.end62:                                         ; preds = %else61, %then60
  %142 = load i32, ptr %c, align 4
  %143 = load i32, ptr %a, align 4
  %144 = icmp sle i32 %142, %143
  %145 = zext i1 %144 to i32
  store i32 %145, ptr %v, align 4
  %146 = load i32, ptr %v, align 4
  %147 = load i32, ptr %v, align 4
  %148 = icmp ne i32 %147, 0
  br i1 %148, label %then63, label %else64

then63:                                           ; preds = %if.end62
  store i32 1, ptr %err, align 4
  %149 = load i32, ptr %err, align 4
  br label %if.end65

else64:                                           ; preds = %if.end62
  br label %if.end65

if.end65:                                         ; preds = %else64, %then63
  %150 = load i32, ptr %a, align 4
  %151 = load i32, ptr %b, align 4
  %152 = icmp sgt i32 %150, %151
  %153 = zext i1 %152 to i32
  store i32 %153, ptr %v, align 4
  %154 = load i32, ptr %v, align 4
  %155 = load i32, ptr %v, align 4
  %156 = icmp ne i32 %155, 0
  br i1 %156, label %then66, label %else67

then66:                                           ; preds = %if.end65
  store i32 1, ptr %err, align 4
  %157 = load i32, ptr %err, align 4
  br label %if.end68

else67:                                           ; preds = %if.end65
  br label %if.end68

if.end68:                                         ; preds = %else67, %then66
  %158 = load i32, ptr %a, align 4
  %159 = load i32, ptr %c, align 4
  %160 = icmp sgt i32 %158, %159
  %161 = zext i1 %160 to i32
  store i32 %161, ptr %v, align 4
  %162 = load i32, ptr %v, align 4
  %163 = load i32, ptr %v, align 4
  %164 = icmp ne i32 %163, 0
  br i1 %164, label %then69, label %else70

then69:                                           ; preds = %if.end68
  store i32 1, ptr %err, align 4
  %165 = load i32, ptr %err, align 4
  br label %if.end71

else70:                                           ; preds = %if.end68
  br label %if.end71

if.end71:                                         ; preds = %else70, %then69
  %166 = load i32, ptr %c, align 4
  %167 = load i32, ptr %a, align 4
  %168 = icmp sgt i32 %166, %167
  %169 = zext i1 %168 to i32
  store i32 %169, ptr %v, align 4
  %170 = load i32, ptr %v, align 4
  %171 = load i32, ptr %v, align 4
  %172 = icmp eq i32 %171, 0
  br i1 %172, label %then72, label %else73

then72:                                           ; preds = %if.end71
  store i32 1, ptr %err, align 4
  %173 = load i32, ptr %err, align 4
  br label %if.end74

else73:                                           ; preds = %if.end71
  br label %if.end74

if.end74:                                         ; preds = %else73, %then72
  %174 = load i32, ptr %a, align 4
  %175 = load i32, ptr %b, align 4
  %176 = icmp sge i32 %174, %175
  %177 = zext i1 %176 to i32
  store i32 %177, ptr %v, align 4
  %178 = load i32, ptr %v, align 4
  %179 = load i32, ptr %v, align 4
  %180 = icmp eq i32 %179, 0
  br i1 %180, label %then75, label %else76

then75:                                           ; preds = %if.end74
  store i32 1, ptr %err, align 4
  %181 = load i32, ptr %err, align 4
  br label %if.end77

else76:                                           ; preds = %if.end74
  br label %if.end77

if.end77:                                         ; preds = %else76, %then75
  %182 = load i32, ptr %a, align 4
  %183 = load i32, ptr %c, align 4
  %184 = icmp sge i32 %182, %183
  %185 = zext i1 %184 to i32
  store i32 %185, ptr %v, align 4
  %186 = load i32, ptr %v, align 4
  %187 = load i32, ptr %v, align 4
  %188 = icmp ne i32 %187, 0
  br i1 %188, label %then78, label %else79

then78:                                           ; preds = %if.end77
  store i32 1, ptr %err, align 4
  %189 = load i32, ptr %err, align 4
  br label %if.end80

else79:                                           ; preds = %if.end77
  br label %if.end80

if.end80:                                         ; preds = %else79, %then78
  %190 = load i32, ptr %c, align 4
  %191 = load i32, ptr %a, align 4
  %192 = icmp sge i32 %190, %191
  %193 = zext i1 %192 to i32
  store i32 %193, ptr %v, align 4
  %194 = load i32, ptr %v, align 4
  %195 = load i32, ptr %v, align 4
  %196 = icmp eq i32 %195, 0
  br i1 %196, label %then81, label %else82

then81:                                           ; preds = %if.end80
  store i32 1, ptr %err, align 4
  %197 = load i32, ptr %err, align 4
  br label %if.end83

else82:                                           ; preds = %if.end80
  br label %if.end83

if.end83:                                         ; preds = %else82, %then81
  store i32 1, ptr %ua, align 4
  store i32 -1, ptr %ub, align 4
  %198 = load i32, ptr %ua, align 4
  %199 = load i32, ptr %ub, align 4
  %200 = icmp ult i32 %198, %199
  %201 = zext i1 %200 to i32
  store i32 %201, ptr %v, align 4
  %202 = load i32, ptr %v, align 4
  %203 = load i32, ptr %v, align 4
  %204 = icmp eq i32 %203, 0
  br i1 %204, label %then84, label %else85

then84:                                           ; preds = %if.end83
  store i32 1, ptr %err, align 4
  %205 = load i32, ptr %err, align 4
  br label %if.end86

else85:                                           ; preds = %if.end83
  br label %if.end86

if.end86:                                         ; preds = %else85, %then84
  %206 = load i32, ptr %ub, align 4
  %207 = load i32, ptr %ua, align 4
  %208 = icmp ugt i32 %206, %207
  %209 = zext i1 %208 to i32
  store i32 %209, ptr %v, align 4
  %210 = load i32, ptr %v, align 4
  %211 = load i32, ptr %v, align 4
  %212 = icmp eq i32 %211, 0
  br i1 %212, label %then87, label %else88

then87:                                           ; preds = %if.end86
  store i32 1, ptr %err, align 4
  %213 = load i32, ptr %err, align 4
  br label %if.end89

else88:                                           ; preds = %if.end86
  br label %if.end89

if.end89:                                         ; preds = %else88, %then87
  store i32 -1, ptr %si, align 4
  store i32 1, ptr %ui, align 4
  %214 = load i32, ptr %si, align 4
  %215 = load i32, ptr %ui, align 4
  %216 = icmp ult i32 %214, %215
  %217 = zext i1 %216 to i32
  store i32 %217, ptr %v, align 4
  %218 = load i32, ptr %v, align 4
  %219 = load i32, ptr %v, align 4
  %220 = icmp ne i32 %219, 0
  br i1 %220, label %then90, label %else91

then90:                                           ; preds = %if.end89
  store i32 1, ptr %err, align 4
  %221 = load i32, ptr %err, align 4
  br label %if.end92

else91:                                           ; preds = %if.end89
  br label %if.end92

if.end92:                                         ; preds = %else91, %then90
  %222 = load i32, ptr %si, align 4
  %223 = load i32, ptr %ui, align 4
  %224 = icmp ugt i32 %222, %223
  %225 = zext i1 %224 to i32
  store i32 %225, ptr %v, align 4
  %226 = load i32, ptr %v, align 4
  %227 = load i32, ptr %v, align 4
  %228 = icmp eq i32 %227, 0
  br i1 %228, label %then93, label %else94

then93:                                           ; preds = %if.end92
  store i32 1, ptr %err, align 4
  %229 = load i32, ptr %err, align 4
  br label %if.end95

else94:                                           ; preds = %if.end92
  br label %if.end95

if.end95:                                         ; preds = %else94, %then93
  %230 = load i32, ptr %a, align 4
  %231 = load i32, ptr %c, align 4
  %232 = icmp slt i32 %230, %231
  %233 = zext i1 %232 to i32
  store i32 %233, ptr %v, align 4
  %234 = load i32, ptr %v, align 4
  %235 = load i32, ptr %v, align 4
  %236 = icmp ne i32 %235, 1
  br i1 %236, label %then96, label %else97

then96:                                           ; preds = %if.end95
  store i32 1, ptr %err, align 4
  %237 = load i32, ptr %err, align 4
  br label %if.end98

else97:                                           ; preds = %if.end95
  br label %if.end98

if.end98:                                         ; preds = %else97, %then96
  %238 = load i32, ptr %a, align 4
  %239 = load i32, ptr %b, align 4
  %240 = icmp eq i32 %238, %239
  %241 = zext i1 %240 to i32
  store i32 %241, ptr %v, align 4
  %242 = load i32, ptr %v, align 4
  %243 = load i32, ptr %v, align 4
  %244 = icmp ne i32 %243, 1
  br i1 %244, label %then99, label %else100

then99:                                           ; preds = %if.end98
  store i32 1, ptr %err, align 4
  %245 = load i32, ptr %err, align 4
  br label %if.end101

else100:                                          ; preds = %if.end98
  br label %if.end101

if.end101:                                        ; preds = %else100, %then99
  %246 = load i1, ptr %t, align 1
  br i1 %246, label %land.rhs102, label %land.end103

land.rhs102:                                      ; preds = %if.end101
  %247 = load i1, ptr %t, align 1
  br label %land.end103

land.end103:                                      ; preds = %land.rhs102, %if.end101
  %248 = phi i1 [ false, %if.end101 ], [ %247, %land.rhs102 ]
  %249 = zext i1 %248 to i32
  store i32 %249, ptr %v, align 4
  %250 = load i32, ptr %v, align 4
  %251 = load i32, ptr %v, align 4
  %252 = icmp ne i32 %251, 1
  br i1 %252, label %then104, label %else105

then104:                                          ; preds = %land.end103
  store i32 1, ptr %err, align 4
  %253 = load i32, ptr %err, align 4
  br label %if.end106

else105:                                          ; preds = %land.end103
  br label %if.end106

if.end106:                                        ; preds = %else105, %then104
  %254 = load i1, ptr %t, align 1
  br i1 %254, label %lor.end108, label %lor.rhs107

lor.rhs107:                                       ; preds = %if.end106
  %255 = load i1, ptr %f, align 1
  br label %lor.end108

lor.end108:                                       ; preds = %lor.rhs107, %if.end106
  %256 = phi i1 [ true, %if.end106 ], [ %255, %lor.rhs107 ]
  %257 = zext i1 %256 to i32
  store i32 %257, ptr %v, align 4
  %258 = load i32, ptr %v, align 4
  %259 = load i32, ptr %v, align 4
  %260 = icmp ne i32 %259, 1
  br i1 %260, label %then109, label %else110

then109:                                          ; preds = %lor.end108
  store i32 1, ptr %err, align 4
  %261 = load i32, ptr %err, align 4
  br label %if.end111

else110:                                          ; preds = %lor.end108
  br label %if.end111

if.end111:                                        ; preds = %else110, %then109
  %262 = load i1, ptr %f, align 1
  %263 = icmp eq i1 %262, false
  %264 = zext i1 %263 to i32
  store i32 %264, ptr %v, align 4
  %265 = load i32, ptr %v, align 4
  %266 = load i32, ptr %v, align 4
  %267 = icmp ne i32 %266, 1
  br i1 %267, label %then112, label %else113

then112:                                          ; preds = %if.end111
  store i32 1, ptr %err, align 4
  %268 = load i32, ptr %err, align 4
  br label %if.end114

else113:                                          ; preds = %if.end111
  br label %if.end114

if.end114:                                        ; preds = %else113, %then112
  %269 = load i32, ptr %a, align 4
  %270 = load i32, ptr %c, align 4
  %271 = icmp slt i32 %269, %270
  %272 = zext i1 %271 to i32
  %273 = mul i32 %272, 3
  %274 = icmp ne i32 %273, 3
  br i1 %274, label %then115, label %else116

then115:                                          ; preds = %if.end114
  store i32 1, ptr %err, align 4
  %275 = load i32, ptr %err, align 4
  br label %if.end117

else116:                                          ; preds = %if.end114
  br label %if.end117

if.end117:                                        ; preds = %else116, %then115
  %276 = load i32, ptr %a, align 4
  %277 = load i32, ptr %c, align 4
  %278 = icmp slt i32 %276, %277
  %279 = zext i1 %278 to i32
  %280 = add i32 %279, 10
  %281 = icmp ne i32 %280, 11
  br i1 %281, label %then118, label %else119

then118:                                          ; preds = %if.end117
  store i32 1, ptr %err, align 4
  %282 = load i32, ptr %err, align 4
  br label %if.end120

else119:                                          ; preds = %if.end117
  br label %if.end120

if.end120:                                        ; preds = %else119, %then118
  %283 = load i32, ptr %a, align 4
  %284 = load i32, ptr %c, align 4
  %285 = icmp slt i32 %283, %284
  %286 = zext i1 %285 to i32
  %287 = sub i32 0, %286
  %288 = icmp ne i32 %287, -1
  br i1 %288, label %then121, label %else122

then121:                                          ; preds = %if.end120
  store i32 1, ptr %err, align 4
  %289 = load i32, ptr %err, align 4
  br label %if.end123

else122:                                          ; preds = %if.end120
  br label %if.end123

if.end123:                                        ; preds = %else122, %then121
  %290 = load i32, ptr %a, align 4
  %291 = load i32, ptr %c, align 4
  %292 = icmp slt i32 %290, %291
  %293 = zext i1 %292 to i32
  %294 = icmp slt i32 %293, 5
  %295 = zext i1 %294 to i32
  %296 = icmp ne i32 %295, 1
  br i1 %296, label %then124, label %else125

then124:                                          ; preds = %if.end123
  store i32 1, ptr %err, align 4
  %297 = load i32, ptr %err, align 4
  br label %if.end126

else125:                                          ; preds = %if.end123
  br label %if.end126

if.end126:                                        ; preds = %else125, %then124
  %298 = load i32, ptr %err, align 4
  %299 = icmp eq i32 %298, 0
  br i1 %299, label %then127, label %else128

then127:                                          ; preds = %if.end126
  %300 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end129

else128:                                          ; preds = %if.end126
  %301 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end129

if.end129:                                        ; preds = %else128, %then127
  %302 = load i32, ptr %err, align 4
  ret i32 %302
}

!llvm.module.flags = !{!0, !1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
