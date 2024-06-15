; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.6.0"

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
  %2 = icmp eq i1 %0, i32 0
  br i1 %2, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %3 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %4 = load i1, i1* %t, align 1
  %5 = load i1, i1* %f, align 1
  %6 = select i1 %4, i1 %5, i1 false
  %7 = zext i1 %6 to i32
  store i32 %7, i32* %v, align 4
  %8 = load i32, i32* %v, align 4
  %9 = load i32, i32* %v, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %11 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %12 = load i1, i1* %t, align 1
  %13 = load i1, i1* %t, align 1
  %14 = select i1 %12, i1 %13, i1 false
  %15 = zext i1 %14 to i32
  store i32 %15, i32* %v, align 4
  %16 = load i32, i32* %v, align 4
  %17 = load i32, i32* %v, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %19 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %20 = load i1, i1* %f, align 1
  %21 = load i1, i1* %f, align 1
  %22 = select i1 %20, i1 %21, i1 false
  %23 = zext i1 %22 to i32
  store i32 %23, i32* %v, align 4
  %24 = load i32, i32* %v, align 4
  %25 = load i32, i32* %v, align 4
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %27 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %28 = load i1, i1* %t, align 1
  %29 = load i1, i1* %f, align 1
  %30 = select i1 %28, i1 true, i1 %29
  %31 = zext i1 %30 to i32
  store i32 %31, i32* %v, align 4
  %32 = load i32, i32* %v, align 4
  %33 = load i32, i32* %v, align 4
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %35 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %36 = load i1, i1* %t, align 1
  %37 = load i1, i1* %t, align 1
  %38 = select i1 %36, i1 true, i1 %37
  %39 = zext i1 %38 to i32
  store i32 %39, i32* %v, align 4
  %40 = load i32, i32* %v, align 4
  %41 = load i32, i32* %v, align 4
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %43 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %44 = load i1, i1* %f, align 1
  %45 = load i1, i1* %f, align 1
  %46 = select i1 %44, i1 true, i1 %45
  %47 = zext i1 %46 to i32
  store i32 %47, i32* %v, align 4
  %48 = load i32, i32* %v, align 4
  %49 = load i32, i32* %v, align 4
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %51 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  %52 = load i1, i1* %t, align 1
  %53 = icmp eq i1 %52, false
  %54 = zext i1 %53 to i32
  store i32 %54, i32* %v, align 4
  %55 = load i32, i32* %v, align 4
  %56 = load i32, i32* %v, align 4
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %then19, label %if.end21

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4
  %58 = load i32, i32* %err, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.end18, %then19
  %59 = load i1, i1* %f, align 1
  %60 = icmp eq i1 %59, false
  %61 = zext i1 %60 to i32
  store i32 %61, i32* %v, align 4
  %62 = load i32, i32* %v, align 4
  %63 = load i32, i32* %v, align 4
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %then22, label %if.end24

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4
  %65 = load i32, i32* %err, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.end21, %then22
  store i32 100, i32* %a, align 4
  store i32 100, i32* %b, align 4
  store i32 128, i32* %c, align 4
  %66 = load i32, i32* %a, align 4
  %67 = load i32, i32* %b, align 4
  %68 = icmp eq i32 %66, %67
  %69 = zext i1 %68 to i32
  store i32 %69, i32* %v, align 4
  %70 = load i32, i32* %v, align 4
  %71 = load i32, i32* %v, align 4
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %then25, label %if.end27

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4
  %73 = load i32, i32* %err, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.end24, %then25
  %74 = load i32, i32* %a, align 4
  %75 = load i32, i32* %c, align 4
  %76 = icmp eq i32 %74, %75
  %77 = zext i1 %76 to i32
  store i32 %77, i32* %v, align 4
  %78 = load i32, i32* %v, align 4
  %79 = load i32, i32* %v, align 4
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %then28, label %if.end30

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4
  %81 = load i32, i32* %err, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.end27, %then28
  %82 = load i32, i32* %a, align 4
  %83 = load i32, i32* %b, align 4
  %84 = icmp ne i32 %82, %83
  %85 = zext i1 %84 to i32
  store i32 %85, i32* %v, align 4
  %86 = load i32, i32* %v, align 4
  %87 = load i32, i32* %v, align 4
  %88 = icmp ne i32 %87, 0
  br i1 %88, label %then31, label %if.end33

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4
  %89 = load i32, i32* %err, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.end30, %then31
  %90 = load i32, i32* %a, align 4
  %91 = load i32, i32* %c, align 4
  %92 = icmp ne i32 %90, %91
  %93 = zext i1 %92 to i32
  store i32 %93, i32* %v, align 4
  %94 = load i32, i32* %v, align 4
  %95 = load i32, i32* %v, align 4
  %96 = icmp eq i32 %95, 0
  br i1 %96, label %then34, label %if.end36

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4
  %97 = load i32, i32* %err, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.end33, %then34
  %98 = load i32, i32* %a, align 4
  %99 = load i32, i32* %b, align 4
  %100 = icmp slt i32 %98, %99
  %101 = zext i1 %100 to i32
  store i32 %101, i32* %v, align 4
  %102 = load i32, i32* %v, align 4
  %103 = load i32, i32* %v, align 4
  %104 = icmp ne i32 %103, 0
  br i1 %104, label %then37, label %if.end39

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4
  %105 = load i32, i32* %err, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.end36, %then37
  %106 = load i32, i32* %a, align 4
  %107 = load i32, i32* %c, align 4
  %108 = icmp slt i32 %106, %107
  %109 = zext i1 %108 to i32
  store i32 %109, i32* %v, align 4
  %110 = load i32, i32* %v, align 4
  %111 = load i32, i32* %v, align 4
  %112 = icmp eq i32 %111, 0
  br i1 %112, label %then40, label %if.end42

then40:                                           ; preds = %if.end39
  store i32 1, i32* %err, align 4
  %113 = load i32, i32* %err, align 4
  br label %if.end42

if.end42:                                         ; preds = %if.end39, %then40
  %114 = load i32, i32* %c, align 4
  %115 = load i32, i32* %a, align 4
  %116 = icmp slt i32 %114, %115
  %117 = zext i1 %116 to i32
  store i32 %117, i32* %v, align 4
  %118 = load i32, i32* %v, align 4
  %119 = load i32, i32* %v, align 4
  %120 = icmp ne i32 %119, 0
  br i1 %120, label %then43, label %if.end45

then43:                                           ; preds = %if.end42
  store i32 1, i32* %err, align 4
  %121 = load i32, i32* %err, align 4
  br label %if.end45

if.end45:                                         ; preds = %if.end42, %then43
  %122 = load i32, i32* %a, align 4
  %123 = load i32, i32* %b, align 4
  %124 = icmp sle i32 %122, %123
  %125 = zext i1 %124 to i32
  store i32 %125, i32* %v, align 4
  %126 = load i32, i32* %v, align 4
  %127 = load i32, i32* %v, align 4
  %128 = icmp eq i32 %127, 0
  br i1 %128, label %then46, label %if.end48

then46:                                           ; preds = %if.end45
  store i32 1, i32* %err, align 4
  %129 = load i32, i32* %err, align 4
  br label %if.end48

if.end48:                                         ; preds = %if.end45, %then46
  %130 = load i32, i32* %a, align 4
  %131 = load i32, i32* %c, align 4
  %132 = icmp sle i32 %130, %131
  %133 = zext i1 %132 to i32
  store i32 %133, i32* %v, align 4
  %134 = load i32, i32* %v, align 4
  %135 = load i32, i32* %v, align 4
  %136 = icmp eq i32 %135, 0
  br i1 %136, label %then49, label %if.end51

then49:                                           ; preds = %if.end48
  store i32 1, i32* %err, align 4
  %137 = load i32, i32* %err, align 4
  br label %if.end51

if.end51:                                         ; preds = %if.end48, %then49
  %138 = load i32, i32* %c, align 4
  %139 = load i32, i32* %a, align 4
  %140 = icmp sle i32 %138, %139
  %141 = zext i1 %140 to i32
  store i32 %141, i32* %v, align 4
  %142 = load i32, i32* %v, align 4
  %143 = load i32, i32* %v, align 4
  %144 = icmp ne i32 %143, 0
  br i1 %144, label %then52, label %if.end54

then52:                                           ; preds = %if.end51
  store i32 1, i32* %err, align 4
  %145 = load i32, i32* %err, align 4
  br label %if.end54

if.end54:                                         ; preds = %if.end51, %then52
  %146 = load i32, i32* %a, align 4
  %147 = load i32, i32* %b, align 4
  %148 = icmp sgt i32 %146, %147
  %149 = zext i1 %148 to i32
  store i32 %149, i32* %v, align 4
  %150 = load i32, i32* %v, align 4
  %151 = load i32, i32* %v, align 4
  %152 = icmp ne i32 %151, 0
  br i1 %152, label %then55, label %if.end57

then55:                                           ; preds = %if.end54
  store i32 1, i32* %err, align 4
  %153 = load i32, i32* %err, align 4
  br label %if.end57

if.end57:                                         ; preds = %if.end54, %then55
  %154 = load i32, i32* %a, align 4
  %155 = load i32, i32* %c, align 4
  %156 = icmp sgt i32 %154, %155
  %157 = zext i1 %156 to i32
  store i32 %157, i32* %v, align 4
  %158 = load i32, i32* %v, align 4
  %159 = load i32, i32* %v, align 4
  %160 = icmp ne i32 %159, 0
  br i1 %160, label %then58, label %if.end60

then58:                                           ; preds = %if.end57
  store i32 1, i32* %err, align 4
  %161 = load i32, i32* %err, align 4
  br label %if.end60

if.end60:                                         ; preds = %if.end57, %then58
  %162 = load i32, i32* %c, align 4
  %163 = load i32, i32* %a, align 4
  %164 = icmp sgt i32 %162, %163
  %165 = zext i1 %164 to i32
  store i32 %165, i32* %v, align 4
  %166 = load i32, i32* %v, align 4
  %167 = load i32, i32* %v, align 4
  %168 = icmp eq i32 %167, 0
  br i1 %168, label %then61, label %if.end63

then61:                                           ; preds = %if.end60
  store i32 1, i32* %err, align 4
  %169 = load i32, i32* %err, align 4
  br label %if.end63

if.end63:                                         ; preds = %if.end60, %then61
  %170 = load i32, i32* %a, align 4
  %171 = load i32, i32* %b, align 4
  %172 = icmp sge i32 %170, %171
  %173 = zext i1 %172 to i32
  store i32 %173, i32* %v, align 4
  %174 = load i32, i32* %v, align 4
  %175 = load i32, i32* %v, align 4
  %176 = icmp eq i32 %175, 0
  br i1 %176, label %then64, label %if.end66

then64:                                           ; preds = %if.end63
  store i32 1, i32* %err, align 4
  %177 = load i32, i32* %err, align 4
  br label %if.end66

if.end66:                                         ; preds = %if.end63, %then64
  %178 = load i32, i32* %a, align 4
  %179 = load i32, i32* %c, align 4
  %180 = icmp sge i32 %178, %179
  %181 = zext i1 %180 to i32
  store i32 %181, i32* %v, align 4
  %182 = load i32, i32* %v, align 4
  %183 = load i32, i32* %v, align 4
  %184 = icmp ne i32 %183, 0
  br i1 %184, label %then67, label %if.end69

then67:                                           ; preds = %if.end66
  store i32 1, i32* %err, align 4
  %185 = load i32, i32* %err, align 4
  br label %if.end69

if.end69:                                         ; preds = %if.end66, %then67
  %186 = load i32, i32* %c, align 4
  %187 = load i32, i32* %a, align 4
  %188 = icmp sge i32 %186, %187
  %189 = zext i1 %188 to i32
  store i32 %189, i32* %v, align 4
  %190 = load i32, i32* %v, align 4
  %191 = load i32, i32* %v, align 4
  %192 = icmp eq i32 %191, 0
  br i1 %192, label %then70, label %if.end72

then70:                                           ; preds = %if.end69
  store i32 1, i32* %err, align 4
  %193 = load i32, i32* %err, align 4
  br label %if.end72

if.end72:                                         ; preds = %if.end69, %then70
  store i32 1, i32* %ua, align 4
  store i32 -1, i32* %ub, align 4
  %194 = load i32, i32* %ua, align 4
  %195 = load i32, i32* %ub, align 4
  %196 = icmp slt i32 %194, %195
  %197 = zext i1 %196 to i32
  store i32 %197, i32* %v, align 4
  %198 = load i32, i32* %v, align 4
  %199 = load i32, i32* %ub, align 4
  %200 = load i32, i32* %ua, align 4
  %201 = icmp sgt i32 %199, %200
  %202 = zext i1 %201 to i32
  store i32 %202, i32* %v, align 4
  %203 = load i32, i32* %v, align 4
  store i32 -1, i32* %si, align 4
  store i32 1, i32* %ui, align 4
  %204 = load i32, i32* %si, align 4
  %205 = load i32, i32* %ui, align 4
  %206 = icmp slt i32 %204, %205
  %207 = zext i1 %206 to i32
  store i32 %207, i32* %v, align 4
  %208 = load i32, i32* %v, align 4
  %209 = load i32, i32* %si, align 4
  %210 = load i32, i32* %ui, align 4
  %211 = icmp sgt i32 %209, %210
  %212 = zext i1 %211 to i32
  store i32 %212, i32* %v, align 4
  %213 = load i32, i32* %v, align 4
  %214 = load i32, i32* %a, align 4
  %215 = load i32, i32* %c, align 4
  %216 = icmp slt i32 %214, %215
  %217 = zext i1 %216 to i32
  store i32 %217, i32* %v, align 4
  %218 = load i32, i32* %v, align 4
  %219 = load i32, i32* %a, align 4
  %220 = load i32, i32* %b, align 4
  %221 = icmp eq i32 %219, %220
  %222 = zext i1 %221 to i32
  store i32 %222, i32* %v, align 4
  %223 = load i32, i32* %v, align 4
  %224 = load i1, i1* %t, align 1
  %225 = load i1, i1* %t, align 1
  %226 = select i1 %224, i1 %225, i1 false
  %227 = zext i1 %226 to i32
  store i32 %227, i32* %v, align 4
  %228 = load i32, i32* %v, align 4
  %229 = load i1, i1* %t, align 1
  %230 = load i1, i1* %f, align 1
  %231 = select i1 %229, i1 true, i1 %230
  %232 = zext i1 %231 to i32
  store i32 %232, i32* %v, align 4
  %233 = load i32, i32* %v, align 4
  %234 = load i1, i1* %f, align 1
  %235 = icmp eq i1 %234, false
  %236 = zext i1 %235 to i32
  store i32 %236, i32* %v, align 4
  %237 = load i32, i32* %v, align 4
  %238 = load i32, i32* %err, align 4
  %239 = icmp eq i32 %238, 0
  %. = select i1 %239, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @1, i32 0, i32 0)
  %240 = call i32 (i8*, ...) @printf(i8* %.)
  %241 = load i32, i32* %err, align 4
  ret i32 %241
}
Both operands to ICmp instruction are not of the same type!
  %2 = icmp eq i1 %0, i32 0
