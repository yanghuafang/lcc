; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

@0 = private unnamed_addr constant [11 x i8] c"t:%d f:%d\0A\00", align 1
@1 = private unnamed_addr constant [11 x i8] c"t && f:%d\0A\00", align 1
@2 = private unnamed_addr constant [11 x i8] c"t && f:%d\0A\00", align 1
@3 = private unnamed_addr constant [11 x i8] c"t && t:%d\0A\00", align 1
@4 = private unnamed_addr constant [11 x i8] c"t && t:%d\0A\00", align 1
@5 = private unnamed_addr constant [11 x i8] c"f && f:%d\0A\00", align 1
@6 = private unnamed_addr constant [11 x i8] c"f && f:%d\0A\00", align 1
@7 = private unnamed_addr constant [11 x i8] c"t || f:%d\0A\00", align 1
@8 = private unnamed_addr constant [11 x i8] c"t || f:%d\0A\00", align 1
@9 = private unnamed_addr constant [11 x i8] c"t || t:%d\0A\00", align 1
@10 = private unnamed_addr constant [11 x i8] c"t || t:%d\0A\00", align 1
@11 = private unnamed_addr constant [11 x i8] c"f || f:%d\0A\00", align 1
@12 = private unnamed_addr constant [11 x i8] c"f || f:%d\0A\00", align 1
@13 = private unnamed_addr constant [7 x i8] c"!t:%d\0A\00", align 1
@14 = private unnamed_addr constant [7 x i8] c"!t:%d\0A\00", align 1
@15 = private unnamed_addr constant [7 x i8] c"!f:%d\0A\00", align 1
@16 = private unnamed_addr constant [7 x i8] c"!f:%d\0A\00", align 1
@17 = private unnamed_addr constant [16 x i8] c"100 == 100: %d\0A\00", align 1
@18 = private unnamed_addr constant [16 x i8] c"100 == 100: %d\0A\00", align 1
@19 = private unnamed_addr constant [16 x i8] c"100 == 128: %d\0A\00", align 1
@20 = private unnamed_addr constant [16 x i8] c"100 == 128: %d\0A\00", align 1
@21 = private unnamed_addr constant [16 x i8] c"100 != 100: %d\0A\00", align 1
@22 = private unnamed_addr constant [16 x i8] c"100 != 100: %d\0A\00", align 1
@23 = private unnamed_addr constant [16 x i8] c"100 != 128: %d\0A\00", align 1
@24 = private unnamed_addr constant [16 x i8] c"100 != 128: %d\0A\00", align 1
@25 = private unnamed_addr constant [15 x i8] c"100 < 100: %d\0A\00", align 1
@26 = private unnamed_addr constant [15 x i8] c"100 < 100: %d\0A\00", align 1
@27 = private unnamed_addr constant [15 x i8] c"100 < 128: %d\0A\00", align 1
@28 = private unnamed_addr constant [15 x i8] c"100 < 128: %d\0A\00", align 1
@29 = private unnamed_addr constant [15 x i8] c"128 < 100: %d\0A\00", align 1
@30 = private unnamed_addr constant [15 x i8] c"128 < 100: %d\0A\00", align 1
@31 = private unnamed_addr constant [16 x i8] c"100 <= 100: %d\0A\00", align 1
@32 = private unnamed_addr constant [16 x i8] c"100 <= 100: %d\0A\00", align 1
@33 = private unnamed_addr constant [16 x i8] c"100 <= 128: %d\0A\00", align 1
@34 = private unnamed_addr constant [16 x i8] c"100 <= 128: %d\0A\00", align 1
@35 = private unnamed_addr constant [16 x i8] c"128 <= 100: %d\0A\00", align 1
@36 = private unnamed_addr constant [16 x i8] c"128 <= 100: %d\0A\00", align 1
@37 = private unnamed_addr constant [15 x i8] c"100 > 100: %d\0A\00", align 1
@38 = private unnamed_addr constant [15 x i8] c"100 > 100: %d\0A\00", align 1
@39 = private unnamed_addr constant [15 x i8] c"100 > 128: %d\0A\00", align 1
@40 = private unnamed_addr constant [15 x i8] c"100 > 128: %d\0A\00", align 1
@41 = private unnamed_addr constant [15 x i8] c"128 > 100: %d\0A\00", align 1
@42 = private unnamed_addr constant [15 x i8] c"128 > 100: %d\0A\00", align 1
@43 = private unnamed_addr constant [16 x i8] c"100 >= 100: %d\0A\00", align 1
@44 = private unnamed_addr constant [16 x i8] c"100 >= 100: %d\0A\00", align 1
@45 = private unnamed_addr constant [16 x i8] c"100 >= 128: %d\0A\00", align 1
@46 = private unnamed_addr constant [16 x i8] c"100 >= 128: %d\0A\00", align 1
@47 = private unnamed_addr constant [16 x i8] c"128 >= 100: %d\0A\00", align 1
@48 = private unnamed_addr constant [16 x i8] c"128 >= 100: %d\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %boolGE3 = alloca i1, align 1
  %boolGE2 = alloca i1, align 1
  %boolGE1 = alloca i1, align 1
  %boolGT3 = alloca i1, align 1
  %boolGT2 = alloca i1, align 1
  %boolGT1 = alloca i1, align 1
  %boolLE3 = alloca i1, align 1
  %boolLE2 = alloca i1, align 1
  %boolLE1 = alloca i1, align 1
  %boolLT3 = alloca i1, align 1
  %boolLT2 = alloca i1, align 1
  %boolLT1 = alloca i1, align 1
  %boolNEq2 = alloca i1, align 1
  %boolNEq1 = alloca i1, align 1
  %boolEq2 = alloca i1, align 1
  %boolEq1 = alloca i1, align 1
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %boolNot2 = alloca i1, align 1
  %boolNot1 = alloca i1, align 1
  %boolOr3 = alloca i1, align 1
  %boolOr2 = alloca i1, align 1
  %boolOr1 = alloca i1, align 1
  %boolAnd3 = alloca i1, align 1
  %boolAnd2 = alloca i1, align 1
  %boolAnd1 = alloca i1, align 1
  %f = alloca i1, align 1
  %t = alloca i1, align 1
  store i1 true, i1* %t, align 1
  store i1 false, i1* %f, align 1
  %0 = load i1, i1* %t, align 1
  %1 = zext i1 %0 to i32
  %2 = load i1, i1* %f, align 1
  %3 = zext i1 %2 to i32
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @0, i32 0, i32 0), i32 %1, i32 %3)
  %5 = load i1, i1* %t, align 1
  %6 = load i1, i1* %f, align 1
  %7 = select i1 %5, i1 %6, i1 false
  store i1 %7, i1* %boolAnd1, align 1
  %8 = load i1, i1* %t, align 1
  %9 = load i1, i1* %t, align 1
  %10 = select i1 %8, i1 %9, i1 false
  store i1 %10, i1* %boolAnd2, align 1
  %11 = load i1, i1* %f, align 1
  %12 = load i1, i1* %f, align 1
  %13 = select i1 %11, i1 %12, i1 false
  store i1 %13, i1* %boolAnd3, align 1
  %14 = load i1, i1* %boolAnd1, align 1
  %15 = zext i1 %14 to i32
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @1, i32 0, i32 0), i32 %15)
  %17 = load i1, i1* %t, align 1
  %18 = load i1, i1* %f, align 1
  %19 = select i1 %17, i1 %18, i1 false
  %20 = zext i1 %19 to i32
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @2, i32 0, i32 0), i32 %20)
  %22 = load i1, i1* %boolAnd2, align 1
  %23 = zext i1 %22 to i32
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @3, i32 0, i32 0), i32 %23)
  %25 = load i1, i1* %t, align 1
  %26 = load i1, i1* %t, align 1
  %27 = select i1 %25, i1 %26, i1 false
  %28 = zext i1 %27 to i32
  %29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @4, i32 0, i32 0), i32 %28)
  %30 = load i1, i1* %boolAnd3, align 1
  %31 = zext i1 %30 to i32
  %32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @5, i32 0, i32 0), i32 %31)
  %33 = load i1, i1* %f, align 1
  %34 = load i1, i1* %f, align 1
  %35 = select i1 %33, i1 %34, i1 false
  %36 = zext i1 %35 to i32
  %37 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @6, i32 0, i32 0), i32 %36)
  %38 = load i1, i1* %t, align 1
  %39 = load i1, i1* %f, align 1
  %40 = select i1 %38, i1 true, i1 %39
  store i1 %40, i1* %boolOr1, align 1
  %41 = load i1, i1* %t, align 1
  %42 = load i1, i1* %t, align 1
  %43 = select i1 %41, i1 true, i1 %42
  store i1 %43, i1* %boolOr2, align 1
  %44 = load i1, i1* %f, align 1
  %45 = load i1, i1* %f, align 1
  %46 = select i1 %44, i1 true, i1 %45
  store i1 %46, i1* %boolOr3, align 1
  %47 = load i1, i1* %boolOr1, align 1
  %48 = zext i1 %47 to i32
  %49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @7, i32 0, i32 0), i32 %48)
  %50 = load i1, i1* %t, align 1
  %51 = load i1, i1* %f, align 1
  %52 = select i1 %50, i1 true, i1 %51
  %53 = zext i1 %52 to i32
  %54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @8, i32 0, i32 0), i32 %53)
  %55 = load i1, i1* %boolOr2, align 1
  %56 = zext i1 %55 to i32
  %57 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @9, i32 0, i32 0), i32 %56)
  %58 = load i1, i1* %t, align 1
  %59 = load i1, i1* %t, align 1
  %60 = select i1 %58, i1 true, i1 %59
  %61 = zext i1 %60 to i32
  %62 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @10, i32 0, i32 0), i32 %61)
  %63 = load i1, i1* %boolOr3, align 1
  %64 = zext i1 %63 to i32
  %65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @11, i32 0, i32 0), i32 %64)
  %66 = load i1, i1* %f, align 1
  %67 = load i1, i1* %f, align 1
  %68 = select i1 %66, i1 true, i1 %67
  %69 = zext i1 %68 to i32
  %70 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @12, i32 0, i32 0), i32 %69)
  %71 = load i1, i1* %t, align 1
  %72 = icmp eq i1 %71, false
  store i1 %72, i1* %boolNot1, align 1
  %73 = load i1, i1* %f, align 1
  %74 = icmp eq i1 %73, false
  store i1 %74, i1* %boolNot2, align 1
  %75 = load i1, i1* %boolNot1, align 1
  %76 = zext i1 %75 to i32
  %77 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @13, i32 0, i32 0), i32 %76)
  %78 = load i1, i1* %t, align 1
  %79 = icmp eq i1 %78, false
  %80 = zext i1 %79 to i32
  %81 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @14, i32 0, i32 0), i32 %80)
  %82 = load i1, i1* %boolNot2, align 1
  %83 = icmp eq i1 %82, false
  %84 = zext i1 %83 to i32
  %85 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @15, i32 0, i32 0), i32 %84)
  %86 = load i1, i1* %f, align 1
  %87 = icmp eq i1 %86, false
  %88 = zext i1 %87 to i32
  %89 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @16, i32 0, i32 0), i32 %88)
  store i32 100, i32* %a, align 4
  store i32 100, i32* %b, align 4
  store i32 128, i32* %c, align 4
  %90 = load i32, i32* %a, align 4
  %91 = load i32, i32* %b, align 4
  %92 = icmp eq i32 %90, %91
  store i1 %92, i1* %boolEq1, align 1
  %93 = load i32, i32* %a, align 4
  %94 = load i32, i32* %c, align 4
  %95 = icmp eq i32 %93, %94
  store i1 %95, i1* %boolEq2, align 1
  %96 = load i1, i1* %boolEq1, align 1
  %97 = zext i1 %96 to i32
  %98 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @17, i32 0, i32 0), i32 %97)
  %99 = load i32, i32* %a, align 4
  %100 = load i32, i32* %b, align 4
  %101 = icmp eq i32 %99, %100
  %102 = zext i1 %101 to i32
  %103 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @18, i32 0, i32 0), i32 %102)
  %104 = load i1, i1* %boolEq2, align 1
  %105 = zext i1 %104 to i32
  %106 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @19, i32 0, i32 0), i32 %105)
  %107 = load i32, i32* %a, align 4
  %108 = load i32, i32* %c, align 4
  %109 = icmp eq i32 %107, %108
  %110 = zext i1 %109 to i32
  %111 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @20, i32 0, i32 0), i32 %110)
  %112 = load i32, i32* %a, align 4
  %113 = load i32, i32* %b, align 4
  %114 = icmp ne i32 %112, %113
  store i1 %114, i1* %boolNEq1, align 1
  %115 = load i32, i32* %a, align 4
  %116 = load i32, i32* %c, align 4
  %117 = icmp ne i32 %115, %116
  store i1 %117, i1* %boolNEq2, align 1
  %118 = load i1, i1* %boolNEq1, align 1
  %119 = zext i1 %118 to i32
  %120 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @21, i32 0, i32 0), i32 %119)
  %121 = load i32, i32* %a, align 4
  %122 = load i32, i32* %b, align 4
  %123 = icmp ne i32 %121, %122
  %124 = zext i1 %123 to i32
  %125 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @22, i32 0, i32 0), i32 %124)
  %126 = load i1, i1* %boolNEq2, align 1
  %127 = zext i1 %126 to i32
  %128 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @23, i32 0, i32 0), i32 %127)
  %129 = load i32, i32* %a, align 4
  %130 = load i32, i32* %c, align 4
  %131 = icmp ne i32 %129, %130
  %132 = zext i1 %131 to i32
  %133 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @24, i32 0, i32 0), i32 %132)
  %134 = load i32, i32* %a, align 4
  %135 = load i32, i32* %b, align 4
  %136 = icmp slt i32 %134, %135
  store i1 %136, i1* %boolLT1, align 1
  %137 = load i32, i32* %a, align 4
  %138 = load i32, i32* %c, align 4
  %139 = icmp slt i32 %137, %138
  store i1 %139, i1* %boolLT2, align 1
  %140 = load i1, i1* %boolLT1, align 1
  %141 = zext i1 %140 to i32
  %142 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @25, i32 0, i32 0), i32 %141)
  %143 = load i32, i32* %a, align 4
  %144 = load i32, i32* %b, align 4
  %145 = icmp slt i32 %143, %144
  %146 = zext i1 %145 to i32
  %147 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @26, i32 0, i32 0), i32 %146)
  %148 = load i1, i1* %boolLT2, align 1
  %149 = zext i1 %148 to i32
  %150 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @27, i32 0, i32 0), i32 %149)
  %151 = load i32, i32* %a, align 4
  %152 = load i32, i32* %c, align 4
  %153 = icmp slt i32 %151, %152
  %154 = zext i1 %153 to i32
  %155 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @28, i32 0, i32 0), i32 %154)
  %156 = load i32, i32* %c, align 4
  %157 = load i32, i32* %a, align 4
  %158 = icmp slt i32 %156, %157
  store i1 %158, i1* %boolLT3, align 1
  %159 = load i1, i1* %boolLT3, align 1
  %160 = zext i1 %159 to i32
  %161 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @29, i32 0, i32 0), i32 %160)
  %162 = load i32, i32* %c, align 4
  %163 = load i32, i32* %a, align 4
  %164 = icmp slt i32 %162, %163
  %165 = zext i1 %164 to i32
  %166 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @30, i32 0, i32 0), i32 %165)
  %167 = load i32, i32* %a, align 4
  %168 = load i32, i32* %b, align 4
  %169 = icmp sle i32 %167, %168
  store i1 %169, i1* %boolLE1, align 1
  %170 = load i32, i32* %a, align 4
  %171 = load i32, i32* %c, align 4
  %172 = icmp sle i32 %170, %171
  store i1 %172, i1* %boolLE2, align 1
  %173 = load i1, i1* %boolLE1, align 1
  %174 = zext i1 %173 to i32
  %175 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @31, i32 0, i32 0), i32 %174)
  %176 = load i32, i32* %a, align 4
  %177 = load i32, i32* %b, align 4
  %178 = icmp sle i32 %176, %177
  %179 = zext i1 %178 to i32
  %180 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @32, i32 0, i32 0), i32 %179)
  %181 = load i1, i1* %boolLE2, align 1
  %182 = zext i1 %181 to i32
  %183 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @33, i32 0, i32 0), i32 %182)
  %184 = load i32, i32* %a, align 4
  %185 = load i32, i32* %c, align 4
  %186 = icmp sle i32 %184, %185
  %187 = zext i1 %186 to i32
  %188 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @34, i32 0, i32 0), i32 %187)
  %189 = load i32, i32* %c, align 4
  %190 = load i32, i32* %a, align 4
  %191 = icmp sle i32 %189, %190
  store i1 %191, i1* %boolLE3, align 1
  %192 = load i1, i1* %boolLE3, align 1
  %193 = zext i1 %192 to i32
  %194 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @35, i32 0, i32 0), i32 %193)
  %195 = load i32, i32* %c, align 4
  %196 = load i32, i32* %a, align 4
  %197 = icmp sle i32 %195, %196
  %198 = zext i1 %197 to i32
  %199 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @36, i32 0, i32 0), i32 %198)
  %200 = load i32, i32* %a, align 4
  %201 = load i32, i32* %b, align 4
  %202 = icmp sgt i32 %200, %201
  store i1 %202, i1* %boolGT1, align 1
  %203 = load i32, i32* %a, align 4
  %204 = load i32, i32* %c, align 4
  %205 = icmp sgt i32 %203, %204
  store i1 %205, i1* %boolGT2, align 1
  %206 = load i1, i1* %boolGT1, align 1
  %207 = zext i1 %206 to i32
  %208 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @37, i32 0, i32 0), i32 %207)
  %209 = load i32, i32* %a, align 4
  %210 = load i32, i32* %b, align 4
  %211 = icmp sgt i32 %209, %210
  %212 = zext i1 %211 to i32
  %213 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @38, i32 0, i32 0), i32 %212)
  %214 = load i1, i1* %boolGT2, align 1
  %215 = zext i1 %214 to i32
  %216 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @39, i32 0, i32 0), i32 %215)
  %217 = load i32, i32* %a, align 4
  %218 = load i32, i32* %c, align 4
  %219 = icmp sgt i32 %217, %218
  %220 = zext i1 %219 to i32
  %221 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @40, i32 0, i32 0), i32 %220)
  %222 = load i32, i32* %c, align 4
  %223 = load i32, i32* %a, align 4
  %224 = icmp sgt i32 %222, %223
  store i1 %224, i1* %boolGT3, align 1
  %225 = load i1, i1* %boolGT3, align 1
  %226 = zext i1 %225 to i32
  %227 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @41, i32 0, i32 0), i32 %226)
  %228 = load i32, i32* %c, align 4
  %229 = load i32, i32* %a, align 4
  %230 = icmp sgt i32 %228, %229
  %231 = zext i1 %230 to i32
  %232 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @42, i32 0, i32 0), i32 %231)
  %233 = load i32, i32* %a, align 4
  %234 = load i32, i32* %b, align 4
  %235 = icmp sge i32 %233, %234
  store i1 %235, i1* %boolGE1, align 1
  %236 = load i32, i32* %a, align 4
  %237 = load i32, i32* %c, align 4
  %238 = icmp sge i32 %236, %237
  store i1 %238, i1* %boolGE2, align 1
  %239 = load i1, i1* %boolGE1, align 1
  %240 = zext i1 %239 to i32
  %241 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @43, i32 0, i32 0), i32 %240)
  %242 = load i32, i32* %a, align 4
  %243 = load i32, i32* %b, align 4
  %244 = icmp sge i32 %242, %243
  %245 = zext i1 %244 to i32
  %246 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @44, i32 0, i32 0), i32 %245)
  %247 = load i1, i1* %boolGE2, align 1
  %248 = zext i1 %247 to i32
  %249 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @45, i32 0, i32 0), i32 %248)
  %250 = load i32, i32* %a, align 4
  %251 = load i32, i32* %c, align 4
  %252 = icmp sge i32 %250, %251
  %253 = zext i1 %252 to i32
  %254 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @46, i32 0, i32 0), i32 %253)
  %255 = load i32, i32* %c, align 4
  %256 = load i32, i32* %a, align 4
  %257 = icmp sge i32 %255, %256
  store i1 %257, i1* %boolGE3, align 1
  %258 = load i1, i1* %boolGE3, align 1
  %259 = zext i1 %258 to i32
  %260 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @47, i32 0, i32 0), i32 %259)
  %261 = load i32, i32* %c, align 4
  %262 = load i32, i32* %a, align 4
  %263 = icmp sge i32 %261, %262
  %264 = zext i1 %263 to i32
  %265 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @48, i32 0, i32 0), i32 %264)
  ret i32 0
}
