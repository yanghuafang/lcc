; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [17 x i8] c"15.logic.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"15.logic.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

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
  store i32 0, i32* %err, align 4
  store i1 true, i1* %t, align 1
  store i1 false, i1* %f, align 1
  %0 = load i1, i1* %t, align 1
  %1 = zext i1 %0 to i32
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %3 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %4 = load i1, i1* %f, align 1
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %7 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %8 = load i1, i1* %t, align 1
  %9 = load i1, i1* %f, align 1
  %10 = select i1 %8, i1 %9, i1 false
  %11 = sext i1 %10 to i32
  store i32 %11, i32* %v, align 4
  %12 = load i32, i32* %v, align 4
  %13 = load i32, i32* %v, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %15 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %16 = load i1, i1* %t, align 1
  %17 = load i1, i1* %t, align 1
  %18 = select i1 %16, i1 %17, i1 false
  %19 = sext i1 %18 to i32
  store i32 %19, i32* %v, align 4
  %20 = load i32, i32* %v, align 4
  %21 = load i32, i32* %v, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %23 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %24 = load i1, i1* %f, align 1
  %25 = load i1, i1* %f, align 1
  %26 = select i1 %24, i1 %25, i1 false
  %27 = sext i1 %26 to i32
  store i32 %27, i32* %v, align 4
  %28 = load i32, i32* %v, align 4
  %29 = load i32, i32* %v, align 4
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %31 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %32 = load i1, i1* %t, align 1
  %33 = load i1, i1* %f, align 1
  %34 = select i1 %32, i1 true, i1 %33
  %35 = sext i1 %34 to i32
  store i32 %35, i32* %v, align 4
  %36 = load i32, i32* %v, align 4
  %37 = load i32, i32* %v, align 4
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %39 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %40 = load i1, i1* %t, align 1
  %41 = load i1, i1* %t, align 1
  %42 = select i1 %40, i1 true, i1 %41
  %43 = sext i1 %42 to i32
  store i32 %43, i32* %v, align 4
  %44 = load i32, i32* %v, align 4
  %45 = load i32, i32* %v, align 4
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %47 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  %48 = load i1, i1* %f, align 1
  %49 = load i1, i1* %f, align 1
  %50 = select i1 %48, i1 true, i1 %49
  %51 = sext i1 %50 to i32
  store i32 %51, i32* %v, align 4
  %52 = load i32, i32* %v, align 4
  %53 = load i32, i32* %v, align 4
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %then19, label %if.end21

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4
  %55 = load i32, i32* %err, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.end18, %then19
  %56 = load i1, i1* %t, align 1
  %57 = icmp eq i1 %56, false
  %58 = sext i1 %57 to i32
  store i32 %58, i32* %v, align 4
  %59 = load i32, i32* %v, align 4
  %60 = load i32, i32* %v, align 4
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %then22, label %if.end24

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4
  %62 = load i32, i32* %err, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.end21, %then22
  %63 = load i1, i1* %f, align 1
  %64 = icmp eq i1 %63, false
  %65 = sext i1 %64 to i32
  store i32 %65, i32* %v, align 4
  %66 = load i32, i32* %v, align 4
  %67 = load i32, i32* %v, align 4
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %then25, label %if.end27

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4
  %69 = load i32, i32* %err, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.end24, %then25
  store i32 100, i32* %a, align 4
  store i32 100, i32* %b, align 4
  store i32 128, i32* %c, align 4
  %70 = load i32, i32* %a, align 4
  %71 = load i32, i32* %b, align 4
  %72 = icmp eq i32 %70, %71
  %73 = sext i1 %72 to i32
  store i32 %73, i32* %v, align 4
  %74 = load i32, i32* %v, align 4
  %75 = load i32, i32* %v, align 4
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %then28, label %if.end30

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4
  %77 = load i32, i32* %err, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.end27, %then28
  %78 = load i32, i32* %a, align 4
  %79 = load i32, i32* %c, align 4
  %80 = icmp eq i32 %78, %79
  %81 = sext i1 %80 to i32
  store i32 %81, i32* %v, align 4
  %82 = load i32, i32* %v, align 4
  %83 = load i32, i32* %v, align 4
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %then31, label %if.end33

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4
  %85 = load i32, i32* %err, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.end30, %then31
  %86 = load i32, i32* %a, align 4
  %87 = load i32, i32* %b, align 4
  %88 = icmp ne i32 %86, %87
  %89 = sext i1 %88 to i32
  store i32 %89, i32* %v, align 4
  %90 = load i32, i32* %v, align 4
  %91 = load i32, i32* %v, align 4
  %92 = icmp ne i32 %91, 0
  br i1 %92, label %then34, label %if.end36

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4
  %93 = load i32, i32* %err, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.end33, %then34
  %94 = load i32, i32* %a, align 4
  %95 = load i32, i32* %c, align 4
  %96 = icmp ne i32 %94, %95
  %97 = sext i1 %96 to i32
  store i32 %97, i32* %v, align 4
  %98 = load i32, i32* %v, align 4
  %99 = load i32, i32* %v, align 4
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %then37, label %if.end39

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4
  %101 = load i32, i32* %err, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.end36, %then37
  %102 = load i32, i32* %a, align 4
  %103 = load i32, i32* %b, align 4
  %104 = icmp slt i32 %102, %103
  %105 = sext i1 %104 to i32
  store i32 %105, i32* %v, align 4
  %106 = load i32, i32* %v, align 4
  %107 = load i32, i32* %v, align 4
  %108 = icmp ne i32 %107, 0
  br i1 %108, label %then40, label %if.end42

then40:                                           ; preds = %if.end39
  store i32 1, i32* %err, align 4
  %109 = load i32, i32* %err, align 4
  br label %if.end42

if.end42:                                         ; preds = %if.end39, %then40
  %110 = load i32, i32* %a, align 4
  %111 = load i32, i32* %c, align 4
  %112 = icmp slt i32 %110, %111
  %113 = sext i1 %112 to i32
  store i32 %113, i32* %v, align 4
  %114 = load i32, i32* %v, align 4
  %115 = load i32, i32* %v, align 4
  %116 = icmp eq i32 %115, 0
  br i1 %116, label %then43, label %if.end45

then43:                                           ; preds = %if.end42
  store i32 1, i32* %err, align 4
  %117 = load i32, i32* %err, align 4
  br label %if.end45

if.end45:                                         ; preds = %if.end42, %then43
  %118 = load i32, i32* %c, align 4
  %119 = load i32, i32* %a, align 4
  %120 = icmp slt i32 %118, %119
  %121 = sext i1 %120 to i32
  store i32 %121, i32* %v, align 4
  %122 = load i32, i32* %v, align 4
  %123 = load i32, i32* %v, align 4
  %124 = icmp ne i32 %123, 0
  br i1 %124, label %then46, label %if.end48

then46:                                           ; preds = %if.end45
  store i32 1, i32* %err, align 4
  %125 = load i32, i32* %err, align 4
  br label %if.end48

if.end48:                                         ; preds = %if.end45, %then46
  %126 = load i32, i32* %a, align 4
  %127 = load i32, i32* %b, align 4
  %128 = icmp sle i32 %126, %127
  %129 = sext i1 %128 to i32
  store i32 %129, i32* %v, align 4
  %130 = load i32, i32* %v, align 4
  %131 = load i32, i32* %v, align 4
  %132 = icmp eq i32 %131, 0
  br i1 %132, label %then49, label %if.end51

then49:                                           ; preds = %if.end48
  store i32 1, i32* %err, align 4
  %133 = load i32, i32* %err, align 4
  br label %if.end51

if.end51:                                         ; preds = %if.end48, %then49
  %134 = load i32, i32* %a, align 4
  %135 = load i32, i32* %c, align 4
  %136 = icmp sle i32 %134, %135
  %137 = sext i1 %136 to i32
  store i32 %137, i32* %v, align 4
  %138 = load i32, i32* %v, align 4
  %139 = load i32, i32* %v, align 4
  %140 = icmp eq i32 %139, 0
  br i1 %140, label %then52, label %if.end54

then52:                                           ; preds = %if.end51
  store i32 1, i32* %err, align 4
  %141 = load i32, i32* %err, align 4
  br label %if.end54

if.end54:                                         ; preds = %if.end51, %then52
  %142 = load i32, i32* %c, align 4
  %143 = load i32, i32* %a, align 4
  %144 = icmp sle i32 %142, %143
  %145 = sext i1 %144 to i32
  store i32 %145, i32* %v, align 4
  %146 = load i32, i32* %v, align 4
  %147 = load i32, i32* %v, align 4
  %148 = icmp ne i32 %147, 0
  br i1 %148, label %then55, label %if.end57

then55:                                           ; preds = %if.end54
  store i32 1, i32* %err, align 4
  %149 = load i32, i32* %err, align 4
  br label %if.end57

if.end57:                                         ; preds = %if.end54, %then55
  %150 = load i32, i32* %a, align 4
  %151 = load i32, i32* %b, align 4
  %152 = icmp sgt i32 %150, %151
  %153 = sext i1 %152 to i32
  store i32 %153, i32* %v, align 4
  %154 = load i32, i32* %v, align 4
  %155 = load i32, i32* %v, align 4
  %156 = icmp ne i32 %155, 0
  br i1 %156, label %then58, label %if.end60

then58:                                           ; preds = %if.end57
  store i32 1, i32* %err, align 4
  %157 = load i32, i32* %err, align 4
  br label %if.end60

if.end60:                                         ; preds = %if.end57, %then58
  %158 = load i32, i32* %a, align 4
  %159 = load i32, i32* %c, align 4
  %160 = icmp sgt i32 %158, %159
  %161 = sext i1 %160 to i32
  store i32 %161, i32* %v, align 4
  %162 = load i32, i32* %v, align 4
  %163 = load i32, i32* %v, align 4
  %164 = icmp ne i32 %163, 0
  br i1 %164, label %then61, label %if.end63

then61:                                           ; preds = %if.end60
  store i32 1, i32* %err, align 4
  %165 = load i32, i32* %err, align 4
  br label %if.end63

if.end63:                                         ; preds = %if.end60, %then61
  %166 = load i32, i32* %c, align 4
  %167 = load i32, i32* %a, align 4
  %168 = icmp sgt i32 %166, %167
  %169 = sext i1 %168 to i32
  store i32 %169, i32* %v, align 4
  %170 = load i32, i32* %v, align 4
  %171 = load i32, i32* %v, align 4
  %172 = icmp eq i32 %171, 0
  br i1 %172, label %then64, label %if.end66

then64:                                           ; preds = %if.end63
  store i32 1, i32* %err, align 4
  %173 = load i32, i32* %err, align 4
  br label %if.end66

if.end66:                                         ; preds = %if.end63, %then64
  %174 = load i32, i32* %a, align 4
  %175 = load i32, i32* %b, align 4
  %176 = icmp sge i32 %174, %175
  %177 = sext i1 %176 to i32
  store i32 %177, i32* %v, align 4
  %178 = load i32, i32* %v, align 4
  %179 = load i32, i32* %v, align 4
  %180 = icmp eq i32 %179, 0
  br i1 %180, label %then67, label %if.end69

then67:                                           ; preds = %if.end66
  store i32 1, i32* %err, align 4
  %181 = load i32, i32* %err, align 4
  br label %if.end69

if.end69:                                         ; preds = %if.end66, %then67
  %182 = load i32, i32* %a, align 4
  %183 = load i32, i32* %c, align 4
  %184 = icmp sge i32 %182, %183
  %185 = sext i1 %184 to i32
  store i32 %185, i32* %v, align 4
  %186 = load i32, i32* %v, align 4
  %187 = load i32, i32* %v, align 4
  %188 = icmp ne i32 %187, 0
  br i1 %188, label %then70, label %if.end72

then70:                                           ; preds = %if.end69
  store i32 1, i32* %err, align 4
  %189 = load i32, i32* %err, align 4
  br label %if.end72

if.end72:                                         ; preds = %if.end69, %then70
  %190 = load i32, i32* %c, align 4
  %191 = load i32, i32* %a, align 4
  %192 = icmp sge i32 %190, %191
  %193 = sext i1 %192 to i32
  store i32 %193, i32* %v, align 4
  %194 = load i32, i32* %v, align 4
  %195 = load i32, i32* %v, align 4
  %196 = icmp eq i32 %195, 0
  br i1 %196, label %then73, label %if.end75

then73:                                           ; preds = %if.end72
  store i32 1, i32* %err, align 4
  %197 = load i32, i32* %err, align 4
  br label %if.end75

if.end75:                                         ; preds = %if.end72, %then73
  store i32 1, i32* %ua, align 4
  store i32 -1, i32* %ub, align 4
  %198 = load i32, i32* %ua, align 4
  %199 = load i32, i32* %ub, align 4
  %200 = icmp ult i32 %198, %199
  %201 = sext i1 %200 to i32
  store i32 %201, i32* %v, align 4
  %202 = load i32, i32* %v, align 4
  %203 = load i32, i32* %v, align 4
  %204 = icmp eq i32 %203, 0
  br i1 %204, label %then76, label %if.end78

then76:                                           ; preds = %if.end75
  store i32 1, i32* %err, align 4
  %205 = load i32, i32* %err, align 4
  br label %if.end78

if.end78:                                         ; preds = %if.end75, %then76
  %206 = load i32, i32* %ub, align 4
  %207 = load i32, i32* %ua, align 4
  %208 = icmp ugt i32 %206, %207
  %209 = sext i1 %208 to i32
  store i32 %209, i32* %v, align 4
  %210 = load i32, i32* %v, align 4
  %211 = load i32, i32* %v, align 4
  %212 = icmp eq i32 %211, 0
  br i1 %212, label %then79, label %if.end81

then79:                                           ; preds = %if.end78
  store i32 1, i32* %err, align 4
  %213 = load i32, i32* %err, align 4
  br label %if.end81

if.end81:                                         ; preds = %if.end78, %then79
  store i32 -1, i32* %si, align 4
  store i32 1, i32* %ui, align 4
  %214 = load i32, i32* %si, align 4
  %215 = load i32, i32* %ui, align 4
  %216 = icmp ult i32 %214, %215
  %217 = sext i1 %216 to i32
  store i32 %217, i32* %v, align 4
  %218 = load i32, i32* %v, align 4
  %219 = load i32, i32* %v, align 4
  %220 = icmp ne i32 %219, 0
  br i1 %220, label %then82, label %if.end84

then82:                                           ; preds = %if.end81
  store i32 1, i32* %err, align 4
  %221 = load i32, i32* %err, align 4
  br label %if.end84

if.end84:                                         ; preds = %if.end81, %then82
  %222 = load i32, i32* %si, align 4
  %223 = load i32, i32* %ui, align 4
  %224 = icmp ugt i32 %222, %223
  %225 = sext i1 %224 to i32
  store i32 %225, i32* %v, align 4
  %226 = load i32, i32* %v, align 4
  %227 = load i32, i32* %v, align 4
  %228 = icmp eq i32 %227, 0
  br i1 %228, label %then85, label %if.end87

then85:                                           ; preds = %if.end84
  store i32 1, i32* %err, align 4
  %229 = load i32, i32* %err, align 4
  br label %if.end87

if.end87:                                         ; preds = %if.end84, %then85
  %230 = load i32, i32* %err, align 4
  %231 = icmp eq i32 %230, 0
  %. = select i1 %231, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @1, i32 0, i32 0)
  %232 = call i32 (i8*, ...) @printf(i8* %.)
  %233 = load i32, i32* %err, align 4
  ret i32 %233
}
