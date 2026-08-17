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
  %9 = load i1, ptr %f, align 1
  %10 = select i1 %8, i1 %9, i1 false
  %11 = zext i1 %10 to i32
  store i32 %11, ptr %v, align 4
  %12 = load i32, ptr %v, align 4
  %13 = load i32, ptr %v, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %15 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %16 = load i1, ptr %t, align 1
  %17 = load i1, ptr %t, align 1
  %18 = select i1 %16, i1 %17, i1 false
  %19 = zext i1 %18 to i32
  store i32 %19, ptr %v, align 4
  %20 = load i32, ptr %v, align 4
  %21 = load i32, ptr %v, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %23 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %24 = load i1, ptr %f, align 1
  %25 = load i1, ptr %f, align 1
  %26 = select i1 %24, i1 %25, i1 false
  %27 = zext i1 %26 to i32
  store i32 %27, ptr %v, align 4
  %28 = load i32, ptr %v, align 4
  %29 = load i32, ptr %v, align 4
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %31 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %32 = load i1, ptr %t, align 1
  %33 = load i1, ptr %f, align 1
  %34 = select i1 %32, i1 true, i1 %33
  %35 = zext i1 %34 to i32
  store i32 %35, ptr %v, align 4
  %36 = load i32, ptr %v, align 4
  %37 = load i32, ptr %v, align 4
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %39 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %40 = load i1, ptr %t, align 1
  %41 = load i1, ptr %t, align 1
  %42 = select i1 %40, i1 true, i1 %41
  %43 = zext i1 %42 to i32
  store i32 %43, ptr %v, align 4
  %44 = load i32, ptr %v, align 4
  %45 = load i32, ptr %v, align 4
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %47 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %48 = load i1, ptr %f, align 1
  %49 = load i1, ptr %f, align 1
  %50 = select i1 %48, i1 true, i1 %49
  %51 = zext i1 %50 to i32
  store i32 %51, ptr %v, align 4
  %52 = load i32, ptr %v, align 4
  %53 = load i32, ptr %v, align 4
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4
  %55 = load i32, ptr %err, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %56 = load i1, ptr %t, align 1
  %57 = icmp eq i1 %56, false
  %58 = zext i1 %57 to i32
  store i32 %58, ptr %v, align 4
  %59 = load i32, ptr %v, align 4
  %60 = load i32, ptr %v, align 4
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %then22, label %else23

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4
  %62 = load i32, ptr %err, align 4
  br label %if.end24

else23:                                           ; preds = %if.end21
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %63 = load i1, ptr %f, align 1
  %64 = icmp eq i1 %63, false
  %65 = zext i1 %64 to i32
  store i32 %65, ptr %v, align 4
  %66 = load i32, ptr %v, align 4
  %67 = load i32, ptr %v, align 4
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %then25, label %else26

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4
  %69 = load i32, ptr %err, align 4
  br label %if.end27

else26:                                           ; preds = %if.end24
  br label %if.end27

if.end27:                                         ; preds = %else26, %then25
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
  br i1 %76, label %then28, label %else29

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4
  %77 = load i32, ptr %err, align 4
  br label %if.end30

else29:                                           ; preds = %if.end27
  br label %if.end30

if.end30:                                         ; preds = %else29, %then28
  %78 = load i32, ptr %a, align 4
  %79 = load i32, ptr %c, align 4
  %80 = icmp eq i32 %78, %79
  %81 = zext i1 %80 to i32
  store i32 %81, ptr %v, align 4
  %82 = load i32, ptr %v, align 4
  %83 = load i32, ptr %v, align 4
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %then31, label %else32

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4
  %85 = load i32, ptr %err, align 4
  br label %if.end33

else32:                                           ; preds = %if.end30
  br label %if.end33

if.end33:                                         ; preds = %else32, %then31
  %86 = load i32, ptr %a, align 4
  %87 = load i32, ptr %b, align 4
  %88 = icmp ne i32 %86, %87
  %89 = zext i1 %88 to i32
  store i32 %89, ptr %v, align 4
  %90 = load i32, ptr %v, align 4
  %91 = load i32, ptr %v, align 4
  %92 = icmp ne i32 %91, 0
  br i1 %92, label %then34, label %else35

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4
  %93 = load i32, ptr %err, align 4
  br label %if.end36

else35:                                           ; preds = %if.end33
  br label %if.end36

if.end36:                                         ; preds = %else35, %then34
  %94 = load i32, ptr %a, align 4
  %95 = load i32, ptr %c, align 4
  %96 = icmp ne i32 %94, %95
  %97 = zext i1 %96 to i32
  store i32 %97, ptr %v, align 4
  %98 = load i32, ptr %v, align 4
  %99 = load i32, ptr %v, align 4
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %then37, label %else38

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4
  %101 = load i32, ptr %err, align 4
  br label %if.end39

else38:                                           ; preds = %if.end36
  br label %if.end39

if.end39:                                         ; preds = %else38, %then37
  %102 = load i32, ptr %a, align 4
  %103 = load i32, ptr %b, align 4
  %104 = icmp slt i32 %102, %103
  %105 = zext i1 %104 to i32
  store i32 %105, ptr %v, align 4
  %106 = load i32, ptr %v, align 4
  %107 = load i32, ptr %v, align 4
  %108 = icmp ne i32 %107, 0
  br i1 %108, label %then40, label %else41

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4
  %109 = load i32, ptr %err, align 4
  br label %if.end42

else41:                                           ; preds = %if.end39
  br label %if.end42

if.end42:                                         ; preds = %else41, %then40
  %110 = load i32, ptr %a, align 4
  %111 = load i32, ptr %c, align 4
  %112 = icmp slt i32 %110, %111
  %113 = zext i1 %112 to i32
  store i32 %113, ptr %v, align 4
  %114 = load i32, ptr %v, align 4
  %115 = load i32, ptr %v, align 4
  %116 = icmp eq i32 %115, 0
  br i1 %116, label %then43, label %else44

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4
  %117 = load i32, ptr %err, align 4
  br label %if.end45

else44:                                           ; preds = %if.end42
  br label %if.end45

if.end45:                                         ; preds = %else44, %then43
  %118 = load i32, ptr %c, align 4
  %119 = load i32, ptr %a, align 4
  %120 = icmp slt i32 %118, %119
  %121 = zext i1 %120 to i32
  store i32 %121, ptr %v, align 4
  %122 = load i32, ptr %v, align 4
  %123 = load i32, ptr %v, align 4
  %124 = icmp ne i32 %123, 0
  br i1 %124, label %then46, label %else47

then46:                                           ; preds = %if.end45
  store i32 1, ptr %err, align 4
  %125 = load i32, ptr %err, align 4
  br label %if.end48

else47:                                           ; preds = %if.end45
  br label %if.end48

if.end48:                                         ; preds = %else47, %then46
  %126 = load i32, ptr %a, align 4
  %127 = load i32, ptr %b, align 4
  %128 = icmp sle i32 %126, %127
  %129 = zext i1 %128 to i32
  store i32 %129, ptr %v, align 4
  %130 = load i32, ptr %v, align 4
  %131 = load i32, ptr %v, align 4
  %132 = icmp eq i32 %131, 0
  br i1 %132, label %then49, label %else50

then49:                                           ; preds = %if.end48
  store i32 1, ptr %err, align 4
  %133 = load i32, ptr %err, align 4
  br label %if.end51

else50:                                           ; preds = %if.end48
  br label %if.end51

if.end51:                                         ; preds = %else50, %then49
  %134 = load i32, ptr %a, align 4
  %135 = load i32, ptr %c, align 4
  %136 = icmp sle i32 %134, %135
  %137 = zext i1 %136 to i32
  store i32 %137, ptr %v, align 4
  %138 = load i32, ptr %v, align 4
  %139 = load i32, ptr %v, align 4
  %140 = icmp eq i32 %139, 0
  br i1 %140, label %then52, label %else53

then52:                                           ; preds = %if.end51
  store i32 1, ptr %err, align 4
  %141 = load i32, ptr %err, align 4
  br label %if.end54

else53:                                           ; preds = %if.end51
  br label %if.end54

if.end54:                                         ; preds = %else53, %then52
  %142 = load i32, ptr %c, align 4
  %143 = load i32, ptr %a, align 4
  %144 = icmp sle i32 %142, %143
  %145 = zext i1 %144 to i32
  store i32 %145, ptr %v, align 4
  %146 = load i32, ptr %v, align 4
  %147 = load i32, ptr %v, align 4
  %148 = icmp ne i32 %147, 0
  br i1 %148, label %then55, label %else56

then55:                                           ; preds = %if.end54
  store i32 1, ptr %err, align 4
  %149 = load i32, ptr %err, align 4
  br label %if.end57

else56:                                           ; preds = %if.end54
  br label %if.end57

if.end57:                                         ; preds = %else56, %then55
  %150 = load i32, ptr %a, align 4
  %151 = load i32, ptr %b, align 4
  %152 = icmp sgt i32 %150, %151
  %153 = zext i1 %152 to i32
  store i32 %153, ptr %v, align 4
  %154 = load i32, ptr %v, align 4
  %155 = load i32, ptr %v, align 4
  %156 = icmp ne i32 %155, 0
  br i1 %156, label %then58, label %else59

then58:                                           ; preds = %if.end57
  store i32 1, ptr %err, align 4
  %157 = load i32, ptr %err, align 4
  br label %if.end60

else59:                                           ; preds = %if.end57
  br label %if.end60

if.end60:                                         ; preds = %else59, %then58
  %158 = load i32, ptr %a, align 4
  %159 = load i32, ptr %c, align 4
  %160 = icmp sgt i32 %158, %159
  %161 = zext i1 %160 to i32
  store i32 %161, ptr %v, align 4
  %162 = load i32, ptr %v, align 4
  %163 = load i32, ptr %v, align 4
  %164 = icmp ne i32 %163, 0
  br i1 %164, label %then61, label %else62

then61:                                           ; preds = %if.end60
  store i32 1, ptr %err, align 4
  %165 = load i32, ptr %err, align 4
  br label %if.end63

else62:                                           ; preds = %if.end60
  br label %if.end63

if.end63:                                         ; preds = %else62, %then61
  %166 = load i32, ptr %c, align 4
  %167 = load i32, ptr %a, align 4
  %168 = icmp sgt i32 %166, %167
  %169 = zext i1 %168 to i32
  store i32 %169, ptr %v, align 4
  %170 = load i32, ptr %v, align 4
  %171 = load i32, ptr %v, align 4
  %172 = icmp eq i32 %171, 0
  br i1 %172, label %then64, label %else65

then64:                                           ; preds = %if.end63
  store i32 1, ptr %err, align 4
  %173 = load i32, ptr %err, align 4
  br label %if.end66

else65:                                           ; preds = %if.end63
  br label %if.end66

if.end66:                                         ; preds = %else65, %then64
  %174 = load i32, ptr %a, align 4
  %175 = load i32, ptr %b, align 4
  %176 = icmp sge i32 %174, %175
  %177 = zext i1 %176 to i32
  store i32 %177, ptr %v, align 4
  %178 = load i32, ptr %v, align 4
  %179 = load i32, ptr %v, align 4
  %180 = icmp eq i32 %179, 0
  br i1 %180, label %then67, label %else68

then67:                                           ; preds = %if.end66
  store i32 1, ptr %err, align 4
  %181 = load i32, ptr %err, align 4
  br label %if.end69

else68:                                           ; preds = %if.end66
  br label %if.end69

if.end69:                                         ; preds = %else68, %then67
  %182 = load i32, ptr %a, align 4
  %183 = load i32, ptr %c, align 4
  %184 = icmp sge i32 %182, %183
  %185 = zext i1 %184 to i32
  store i32 %185, ptr %v, align 4
  %186 = load i32, ptr %v, align 4
  %187 = load i32, ptr %v, align 4
  %188 = icmp ne i32 %187, 0
  br i1 %188, label %then70, label %else71

then70:                                           ; preds = %if.end69
  store i32 1, ptr %err, align 4
  %189 = load i32, ptr %err, align 4
  br label %if.end72

else71:                                           ; preds = %if.end69
  br label %if.end72

if.end72:                                         ; preds = %else71, %then70
  %190 = load i32, ptr %c, align 4
  %191 = load i32, ptr %a, align 4
  %192 = icmp sge i32 %190, %191
  %193 = zext i1 %192 to i32
  store i32 %193, ptr %v, align 4
  %194 = load i32, ptr %v, align 4
  %195 = load i32, ptr %v, align 4
  %196 = icmp eq i32 %195, 0
  br i1 %196, label %then73, label %else74

then73:                                           ; preds = %if.end72
  store i32 1, ptr %err, align 4
  %197 = load i32, ptr %err, align 4
  br label %if.end75

else74:                                           ; preds = %if.end72
  br label %if.end75

if.end75:                                         ; preds = %else74, %then73
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
  br i1 %204, label %then76, label %else77

then76:                                           ; preds = %if.end75
  store i32 1, ptr %err, align 4
  %205 = load i32, ptr %err, align 4
  br label %if.end78

else77:                                           ; preds = %if.end75
  br label %if.end78

if.end78:                                         ; preds = %else77, %then76
  %206 = load i32, ptr %ub, align 4
  %207 = load i32, ptr %ua, align 4
  %208 = icmp ugt i32 %206, %207
  %209 = zext i1 %208 to i32
  store i32 %209, ptr %v, align 4
  %210 = load i32, ptr %v, align 4
  %211 = load i32, ptr %v, align 4
  %212 = icmp eq i32 %211, 0
  br i1 %212, label %then79, label %else80

then79:                                           ; preds = %if.end78
  store i32 1, ptr %err, align 4
  %213 = load i32, ptr %err, align 4
  br label %if.end81

else80:                                           ; preds = %if.end78
  br label %if.end81

if.end81:                                         ; preds = %else80, %then79
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
  br i1 %220, label %then82, label %else83

then82:                                           ; preds = %if.end81
  store i32 1, ptr %err, align 4
  %221 = load i32, ptr %err, align 4
  br label %if.end84

else83:                                           ; preds = %if.end81
  br label %if.end84

if.end84:                                         ; preds = %else83, %then82
  %222 = load i32, ptr %si, align 4
  %223 = load i32, ptr %ui, align 4
  %224 = icmp ugt i32 %222, %223
  %225 = zext i1 %224 to i32
  store i32 %225, ptr %v, align 4
  %226 = load i32, ptr %v, align 4
  %227 = load i32, ptr %v, align 4
  %228 = icmp eq i32 %227, 0
  br i1 %228, label %then85, label %else86

then85:                                           ; preds = %if.end84
  store i32 1, ptr %err, align 4
  %229 = load i32, ptr %err, align 4
  br label %if.end87

else86:                                           ; preds = %if.end84
  br label %if.end87

if.end87:                                         ; preds = %else86, %then85
  %230 = load i32, ptr %a, align 4
  %231 = load i32, ptr %c, align 4
  %232 = icmp slt i32 %230, %231
  %233 = zext i1 %232 to i32
  store i32 %233, ptr %v, align 4
  %234 = load i32, ptr %v, align 4
  %235 = load i32, ptr %v, align 4
  %236 = icmp ne i32 %235, 1
  br i1 %236, label %then88, label %else89

then88:                                           ; preds = %if.end87
  store i32 1, ptr %err, align 4
  %237 = load i32, ptr %err, align 4
  br label %if.end90

else89:                                           ; preds = %if.end87
  br label %if.end90

if.end90:                                         ; preds = %else89, %then88
  %238 = load i32, ptr %a, align 4
  %239 = load i32, ptr %b, align 4
  %240 = icmp eq i32 %238, %239
  %241 = zext i1 %240 to i32
  store i32 %241, ptr %v, align 4
  %242 = load i32, ptr %v, align 4
  %243 = load i32, ptr %v, align 4
  %244 = icmp ne i32 %243, 1
  br i1 %244, label %then91, label %else92

then91:                                           ; preds = %if.end90
  store i32 1, ptr %err, align 4
  %245 = load i32, ptr %err, align 4
  br label %if.end93

else92:                                           ; preds = %if.end90
  br label %if.end93

if.end93:                                         ; preds = %else92, %then91
  %246 = load i1, ptr %t, align 1
  %247 = load i1, ptr %t, align 1
  %248 = select i1 %246, i1 %247, i1 false
  %249 = zext i1 %248 to i32
  store i32 %249, ptr %v, align 4
  %250 = load i32, ptr %v, align 4
  %251 = load i32, ptr %v, align 4
  %252 = icmp ne i32 %251, 1
  br i1 %252, label %then94, label %else95

then94:                                           ; preds = %if.end93
  store i32 1, ptr %err, align 4
  %253 = load i32, ptr %err, align 4
  br label %if.end96

else95:                                           ; preds = %if.end93
  br label %if.end96

if.end96:                                         ; preds = %else95, %then94
  %254 = load i1, ptr %t, align 1
  %255 = load i1, ptr %f, align 1
  %256 = select i1 %254, i1 true, i1 %255
  %257 = zext i1 %256 to i32
  store i32 %257, ptr %v, align 4
  %258 = load i32, ptr %v, align 4
  %259 = load i32, ptr %v, align 4
  %260 = icmp ne i32 %259, 1
  br i1 %260, label %then97, label %else98

then97:                                           ; preds = %if.end96
  store i32 1, ptr %err, align 4
  %261 = load i32, ptr %err, align 4
  br label %if.end99

else98:                                           ; preds = %if.end96
  br label %if.end99

if.end99:                                         ; preds = %else98, %then97
  %262 = load i1, ptr %f, align 1
  %263 = icmp eq i1 %262, false
  %264 = zext i1 %263 to i32
  store i32 %264, ptr %v, align 4
  %265 = load i32, ptr %v, align 4
  %266 = load i32, ptr %v, align 4
  %267 = icmp ne i32 %266, 1
  br i1 %267, label %then100, label %else101

then100:                                          ; preds = %if.end99
  store i32 1, ptr %err, align 4
  %268 = load i32, ptr %err, align 4
  br label %if.end102

else101:                                          ; preds = %if.end99
  br label %if.end102

if.end102:                                        ; preds = %else101, %then100
  %269 = load i32, ptr %a, align 4
  %270 = load i32, ptr %c, align 4
  %271 = icmp slt i32 %269, %270
  %272 = zext i1 %271 to i32
  %273 = mul i32 %272, 3
  %274 = icmp ne i32 %273, 3
  br i1 %274, label %then103, label %else104

then103:                                          ; preds = %if.end102
  store i32 1, ptr %err, align 4
  %275 = load i32, ptr %err, align 4
  br label %if.end105

else104:                                          ; preds = %if.end102
  br label %if.end105

if.end105:                                        ; preds = %else104, %then103
  %276 = load i32, ptr %a, align 4
  %277 = load i32, ptr %c, align 4
  %278 = icmp slt i32 %276, %277
  %279 = zext i1 %278 to i32
  %280 = add i32 %279, 10
  %281 = icmp ne i32 %280, 11
  br i1 %281, label %then106, label %else107

then106:                                          ; preds = %if.end105
  store i32 1, ptr %err, align 4
  %282 = load i32, ptr %err, align 4
  br label %if.end108

else107:                                          ; preds = %if.end105
  br label %if.end108

if.end108:                                        ; preds = %else107, %then106
  %283 = load i32, ptr %a, align 4
  %284 = load i32, ptr %c, align 4
  %285 = icmp slt i32 %283, %284
  %286 = zext i1 %285 to i32
  %287 = sub i32 0, %286
  %288 = icmp ne i32 %287, -1
  br i1 %288, label %then109, label %else110

then109:                                          ; preds = %if.end108
  store i32 1, ptr %err, align 4
  %289 = load i32, ptr %err, align 4
  br label %if.end111

else110:                                          ; preds = %if.end108
  br label %if.end111

if.end111:                                        ; preds = %else110, %then109
  %290 = load i32, ptr %a, align 4
  %291 = load i32, ptr %c, align 4
  %292 = icmp slt i32 %290, %291
  %293 = zext i1 %292 to i32
  %294 = icmp slt i32 %293, 5
  %295 = zext i1 %294 to i32
  %296 = icmp ne i32 %295, 1
  br i1 %296, label %then112, label %else113

then112:                                          ; preds = %if.end111
  store i32 1, ptr %err, align 4
  %297 = load i32, ptr %err, align 4
  br label %if.end114

else113:                                          ; preds = %if.end111
  br label %if.end114

if.end114:                                        ; preds = %else113, %then112
  %298 = load i32, ptr %err, align 4
  %299 = icmp eq i32 %298, 0
  br i1 %299, label %then115, label %else116

then115:                                          ; preds = %if.end114
  %300 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end117

else116:                                          ; preds = %if.end114
  %301 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end117

if.end117:                                        ; preds = %else116, %then115
  %302 = load i32, ptr %err, align 4
  ret i32 %302
}

!llvm.module.flags = !{!0, !1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
