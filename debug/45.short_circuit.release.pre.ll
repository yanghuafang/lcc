; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@gTernary = global i32 2
@gAnd = global i32 0
@gOr = global i32 1
@calls = global i32 0
@trueRan = global i32 0
@falseRan = global i32 0
@main.sTernary = internal global i32 5
@0 = private unnamed_addr constant [25 x i8] c"45.short_circuit.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [25 x i8] c"45.short_circuit.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @bump() {
entry:
  %0 = load i32, ptr @calls, align 4
  %1 = add i32 %0, 1
  store i32 %1, ptr @calls, align 4
  %2 = load i32, ptr @calls, align 4
  ret i32 1
}

define i32 @trueArm() {
entry:
  store i32 1, ptr @trueRan, align 4
  %0 = load i32, ptr @trueRan, align 4
  ret i32 10
}

define i32 @falseArm() {
entry:
  store i32 1, ptr @falseRan, align 4
  %0 = load i32, ptr @falseRan, align 4
  ret i32 20
}

define i32 @main() {
entry:
  %k = alloca i32, align 4
  %d = alloca double, align 8
  %nestedTernary = alloca i32, align 4
  %nestedLogic = alloca i32, align 4
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %i = alloca i32, align 4
  %arr = alloca [3 x i32], align 4
  %p = alloca ptr, align 8
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  store i32 0, ptr @calls, align 4
  %0 = load i32, ptr @calls, align 4
  br i1 false, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %1 = call i32 @bump()
  %2 = icmp ne i32 %1, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %3 = phi i1 [ false, %entry ], [ %2, %land.rhs ]
  %4 = zext i1 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %then, label %else

then:                                             ; preds = %land.end
  store i32 1, ptr %err, align 4
  %6 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %land.end
  br label %if.end

if.end:                                           ; preds = %else, %then
  %7 = load i32, ptr @calls, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %9 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  store i32 0, ptr @calls, align 4
  %10 = load i32, ptr @calls, align 4
  br i1 true, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end3
  %11 = call i32 @bump()
  %12 = icmp ne i32 %11, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end3
  %13 = phi i1 [ true, %if.end3 ], [ %12, %lor.rhs ]
  %14 = zext i1 %13 to i32
  %15 = icmp ne i32 %14, 1
  br i1 %15, label %then4, label %else5

then4:                                            ; preds = %lor.end
  store i32 1, ptr %err, align 4
  %16 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %lor.end
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %17 = load i32, ptr @calls, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %19 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  store i32 0, ptr @calls, align 4
  %20 = load i32, ptr @calls, align 4
  br i1 true, label %land.rhs10, label %land.end11

land.rhs10:                                       ; preds = %if.end9
  %21 = call i32 @bump()
  %22 = icmp ne i32 %21, 0
  br label %land.end11

land.end11:                                       ; preds = %land.rhs10, %if.end9
  %23 = phi i1 [ false, %if.end9 ], [ %22, %land.rhs10 ]
  %24 = zext i1 %23 to i32
  %25 = icmp ne i32 %24, 1
  br i1 %25, label %then12, label %else13

then12:                                           ; preds = %land.end11
  store i32 1, ptr %err, align 4
  %26 = load i32, ptr %err, align 4
  br label %if.end14

else13:                                           ; preds = %land.end11
  br label %if.end14

if.end14:                                         ; preds = %else13, %then12
  %27 = load i32, ptr @calls, align 4
  %28 = icmp ne i32 %27, 1
  br i1 %28, label %then15, label %else16

then15:                                           ; preds = %if.end14
  store i32 1, ptr %err, align 4
  %29 = load i32, ptr %err, align 4
  br label %if.end17

else16:                                           ; preds = %if.end14
  br label %if.end17

if.end17:                                         ; preds = %else16, %then15
  store i32 0, ptr @calls, align 4
  %30 = load i32, ptr @calls, align 4
  br i1 false, label %lor.end19, label %lor.rhs18

lor.rhs18:                                        ; preds = %if.end17
  %31 = call i32 @bump()
  %32 = icmp ne i32 %31, 0
  br label %lor.end19

lor.end19:                                        ; preds = %lor.rhs18, %if.end17
  %33 = phi i1 [ true, %if.end17 ], [ %32, %lor.rhs18 ]
  %34 = zext i1 %33 to i32
  %35 = icmp ne i32 %34, 1
  br i1 %35, label %then20, label %else21

then20:                                           ; preds = %lor.end19
  store i32 1, ptr %err, align 4
  %36 = load i32, ptr %err, align 4
  br label %if.end22

else21:                                           ; preds = %lor.end19
  br label %if.end22

if.end22:                                         ; preds = %else21, %then20
  %37 = load i32, ptr @calls, align 4
  %38 = icmp ne i32 %37, 1
  br i1 %38, label %then23, label %else24

then23:                                           ; preds = %if.end22
  store i32 1, ptr %err, align 4
  %39 = load i32, ptr %err, align 4
  br label %if.end25

else24:                                           ; preds = %if.end22
  br label %if.end25

if.end25:                                         ; preds = %else24, %then23
  store ptr null, ptr %p, align 8
  %40 = load ptr, ptr %p, align 8
  %41 = ptrtoint ptr %40 to i64
  %42 = icmp ne i64 %41, 0
  br i1 %42, label %land.rhs26, label %land.end27

land.rhs26:                                       ; preds = %if.end25
  %43 = load ptr, ptr %p, align 8
  %44 = load i32, ptr %43, align 4
  %45 = icmp eq i32 %44, 1
  br label %land.end27

land.end27:                                       ; preds = %land.rhs26, %if.end25
  %46 = phi i1 [ false, %if.end25 ], [ %45, %land.rhs26 ]
  br i1 %46, label %then28, label %else29

then28:                                           ; preds = %land.end27
  store i32 1, ptr %err, align 4
  %47 = load i32, ptr %err, align 4
  br label %if.end30

else29:                                           ; preds = %land.end27
  br label %if.end30

if.end30:                                         ; preds = %else29, %then28
  %48 = getelementptr [3 x i32], ptr %arr, i32 0, i32 0
  store i32 1, ptr %48, align 4
  %49 = getelementptr [3 x i32], ptr %arr, i32 0, i32 1
  store i32 2, ptr %49, align 4
  %50 = getelementptr [3 x i32], ptr %arr, i32 0, i32 2
  store i32 3, ptr %50, align 4
  store i32 7, ptr %i, align 4
  %51 = load i32, ptr %i, align 4
  %52 = icmp slt i32 %51, 3
  br i1 %52, label %land.rhs31, label %land.end32

land.rhs31:                                       ; preds = %if.end30
  %53 = load i32, ptr %i, align 4
  %54 = getelementptr i32, ptr %arr, i32 %53
  %55 = load i32, ptr %54, align 4
  %56 = icmp eq i32 %55, 0
  br label %land.end32

land.end32:                                       ; preds = %land.rhs31, %if.end30
  %57 = phi i1 [ false, %if.end30 ], [ %56, %land.rhs31 ]
  br i1 %57, label %then33, label %else34

then33:                                           ; preds = %land.end32
  store i32 1, ptr %err, align 4
  %58 = load i32, ptr %err, align 4
  br label %if.end35

else34:                                           ; preds = %land.end32
  br label %if.end35

if.end35:                                         ; preds = %else34, %then33
  store i32 0, ptr @trueRan, align 4
  %59 = load i32, ptr @trueRan, align 4
  store i32 0, ptr @falseRan, align 4
  %60 = load i32, ptr @falseRan, align 4
  br i1 true, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end35
  %61 = call i32 @trueArm()
  br label %cond.end

cond.false:                                       ; preds = %if.end35
  %62 = call i32 @falseArm()
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %63 = phi i32 [ %61, %cond.true ], [ %62, %cond.false ]
  %64 = icmp ne i32 %63, 10
  br i1 %64, label %then36, label %else37

then36:                                           ; preds = %cond.end
  store i32 1, ptr %err, align 4
  %65 = load i32, ptr %err, align 4
  br label %if.end38

else37:                                           ; preds = %cond.end
  br label %if.end38

if.end38:                                         ; preds = %else37, %then36
  %66 = load i32, ptr @trueRan, align 4
  %67 = icmp ne i32 %66, 1
  br i1 %67, label %then39, label %else40

then39:                                           ; preds = %if.end38
  store i32 1, ptr %err, align 4
  %68 = load i32, ptr %err, align 4
  br label %if.end41

else40:                                           ; preds = %if.end38
  br label %if.end41

if.end41:                                         ; preds = %else40, %then39
  %69 = load i32, ptr @falseRan, align 4
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %then42, label %else43

then42:                                           ; preds = %if.end41
  store i32 1, ptr %err, align 4
  %71 = load i32, ptr %err, align 4
  br label %if.end44

else43:                                           ; preds = %if.end41
  br label %if.end44

if.end44:                                         ; preds = %else43, %then42
  store i32 0, ptr @trueRan, align 4
  %72 = load i32, ptr @trueRan, align 4
  store i32 0, ptr @falseRan, align 4
  %73 = load i32, ptr @falseRan, align 4
  br i1 false, label %cond.true45, label %cond.false46

cond.true45:                                      ; preds = %if.end44
  %74 = call i32 @trueArm()
  br label %cond.end47

cond.false46:                                     ; preds = %if.end44
  %75 = call i32 @falseArm()
  br label %cond.end47

cond.end47:                                       ; preds = %cond.false46, %cond.true45
  %76 = phi i32 [ %74, %cond.true45 ], [ %75, %cond.false46 ]
  %77 = icmp ne i32 %76, 20
  br i1 %77, label %then48, label %else49

then48:                                           ; preds = %cond.end47
  store i32 1, ptr %err, align 4
  %78 = load i32, ptr %err, align 4
  br label %if.end50

else49:                                           ; preds = %cond.end47
  br label %if.end50

if.end50:                                         ; preds = %else49, %then48
  %79 = load i32, ptr @trueRan, align 4
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %then51, label %else52

then51:                                           ; preds = %if.end50
  store i32 1, ptr %err, align 4
  %81 = load i32, ptr %err, align 4
  br label %if.end53

else52:                                           ; preds = %if.end50
  br label %if.end53

if.end53:                                         ; preds = %else52, %then51
  %82 = load i32, ptr @falseRan, align 4
  %83 = icmp ne i32 %82, 1
  br i1 %83, label %then54, label %else55

then54:                                           ; preds = %if.end53
  store i32 1, ptr %err, align 4
  %84 = load i32, ptr %err, align 4
  br label %if.end56

else55:                                           ; preds = %if.end53
  br label %if.end56

if.end56:                                         ; preds = %else55, %then54
  store i32 1, ptr %a, align 4
  store i32 0, ptr %b, align 4
  store i32 1, ptr %c, align 4
  %85 = load i32, ptr %a, align 4
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %land.rhs57, label %land.end58

land.rhs57:                                       ; preds = %if.end56
  %87 = load i32, ptr %b, align 4
  %88 = icmp ne i32 %87, 0
  br label %land.end58

land.end58:                                       ; preds = %land.rhs57, %if.end56
  %89 = phi i1 [ false, %if.end56 ], [ %88, %land.rhs57 ]
  br i1 %89, label %lor.end60, label %lor.rhs59

lor.rhs59:                                        ; preds = %land.end58
  %90 = load i32, ptr %c, align 4
  %91 = icmp ne i32 %90, 0
  br label %lor.end60

lor.end60:                                        ; preds = %lor.rhs59, %land.end58
  %92 = phi i1 [ true, %land.end58 ], [ %91, %lor.rhs59 ]
  %93 = zext i1 %92 to i32
  %94 = icmp ne i32 %93, 1
  br i1 %94, label %then61, label %else62

then61:                                           ; preds = %lor.end60
  store i32 1, ptr %err, align 4
  %95 = load i32, ptr %err, align 4
  br label %if.end63

else62:                                           ; preds = %lor.end60
  br label %if.end63

if.end63:                                         ; preds = %else62, %then61
  %96 = load i32, ptr %a, align 4
  %97 = icmp ne i32 %96, 0
  br i1 %97, label %land.rhs64, label %land.end65

land.rhs64:                                       ; preds = %if.end63
  %98 = load i32, ptr %b, align 4
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %land.rhs66, label %land.end67

land.end65:                                       ; preds = %land.end67, %if.end63
  %100 = phi i1 [ false, %if.end63 ], [ %105, %land.end67 ]
  %101 = zext i1 %100 to i32
  %102 = icmp ne i32 %101, 0
  br i1 %102, label %then68, label %else69

land.rhs66:                                       ; preds = %land.rhs64
  %103 = load i32, ptr %c, align 4
  %104 = icmp ne i32 %103, 0
  br label %land.end67

land.end67:                                       ; preds = %land.rhs66, %land.rhs64
  %105 = phi i1 [ false, %land.rhs64 ], [ %104, %land.rhs66 ]
  br label %land.end65

then68:                                           ; preds = %land.end65
  store i32 1, ptr %err, align 4
  %106 = load i32, ptr %err, align 4
  br label %if.end70

else69:                                           ; preds = %land.end65
  br label %if.end70

if.end70:                                         ; preds = %else69, %then68
  %107 = load i32, ptr %a, align 4
  %108 = icmp ne i32 %107, 0
  br i1 %108, label %cond.true71, label %cond.false72

cond.true71:                                      ; preds = %if.end70
  %109 = load i32, ptr %b, align 4
  br label %cond.end73

cond.false72:                                     ; preds = %if.end70
  %110 = load i32, ptr %c, align 4
  br label %cond.end73

cond.end73:                                       ; preds = %cond.false72, %cond.true71
  %111 = phi i32 [ %109, %cond.true71 ], [ %110, %cond.false72 ]
  %112 = icmp ne i32 %111, 0
  br i1 %112, label %land.rhs74, label %land.end75

land.rhs74:                                       ; preds = %cond.end73
  %113 = load i32, ptr %a, align 4
  %114 = icmp ne i32 %113, 0
  br label %land.end75

land.end75:                                       ; preds = %land.rhs74, %cond.end73
  %115 = phi i1 [ false, %cond.end73 ], [ %114, %land.rhs74 ]
  %116 = zext i1 %115 to i32
  %117 = icmp ne i32 %116, 0
  br i1 %117, label %then76, label %else77

then76:                                           ; preds = %land.end75
  store i32 1, ptr %err, align 4
  %118 = load i32, ptr %err, align 4
  br label %if.end78

else77:                                           ; preds = %land.end75
  br label %if.end78

if.end78:                                         ; preds = %else77, %then76
  %119 = load i32, ptr %a, align 4
  %120 = icmp ne i32 %119, 0
  br i1 %120, label %cond.true79, label %cond.false80

cond.true79:                                      ; preds = %if.end78
  %121 = load i32, ptr %b, align 4
  %122 = icmp ne i32 %121, 0
  br i1 %122, label %land.rhs82, label %land.end83

cond.false80:                                     ; preds = %if.end78
  %123 = load i32, ptr %b, align 4
  %124 = icmp ne i32 %123, 0
  br i1 %124, label %lor.end85, label %lor.rhs84

cond.end81:                                       ; preds = %lor.end85, %land.end83
  %125 = phi i32 [ %131, %land.end83 ], [ %135, %lor.end85 ]
  store i32 %125, ptr %nestedLogic, align 4
  %126 = load i32, ptr %nestedLogic, align 4
  %127 = icmp ne i32 %126, 0
  br i1 %127, label %then86, label %else87

land.rhs82:                                       ; preds = %cond.true79
  %128 = load i32, ptr %c, align 4
  %129 = icmp ne i32 %128, 0
  br label %land.end83

land.end83:                                       ; preds = %land.rhs82, %cond.true79
  %130 = phi i1 [ false, %cond.true79 ], [ %129, %land.rhs82 ]
  %131 = zext i1 %130 to i32
  br label %cond.end81

lor.rhs84:                                        ; preds = %cond.false80
  %132 = load i32, ptr %c, align 4
  %133 = icmp ne i32 %132, 0
  br label %lor.end85

lor.end85:                                        ; preds = %lor.rhs84, %cond.false80
  %134 = phi i1 [ true, %cond.false80 ], [ %133, %lor.rhs84 ]
  %135 = zext i1 %134 to i32
  br label %cond.end81

then86:                                           ; preds = %cond.end81
  store i32 1, ptr %err, align 4
  %136 = load i32, ptr %err, align 4
  br label %if.end88

else87:                                           ; preds = %cond.end81
  br label %if.end88

if.end88:                                         ; preds = %else87, %then86
  %137 = load i32, ptr %a, align 4
  %138 = icmp ne i32 %137, 0
  br i1 %138, label %cond.true89, label %cond.false90

cond.true89:                                      ; preds = %if.end88
  %139 = load i32, ptr %a, align 4
  %140 = icmp ne i32 %139, 0
  br i1 %140, label %cond.true92, label %cond.false93

cond.false90:                                     ; preds = %if.end88
  br label %cond.end91

cond.end91:                                       ; preds = %cond.false90, %cond.end94
  %141 = phi i32 [ %144, %cond.end94 ], [ 3, %cond.false90 ]
  store i32 %141, ptr %nestedTernary, align 4
  %142 = load i32, ptr %nestedTernary, align 4
  %143 = icmp ne i32 %142, 1
  br i1 %143, label %then95, label %else96

cond.true92:                                      ; preds = %cond.true89
  br label %cond.end94

cond.false93:                                     ; preds = %cond.true89
  br label %cond.end94

cond.end94:                                       ; preds = %cond.false93, %cond.true92
  %144 = phi i32 [ 1, %cond.true92 ], [ 2, %cond.false93 ]
  br label %cond.end91

then95:                                           ; preds = %cond.end91
  store i32 1, ptr %err, align 4
  %145 = load i32, ptr %err, align 4
  br label %if.end97

else96:                                           ; preds = %cond.end91
  br label %if.end97

if.end97:                                         ; preds = %else96, %then95
  br i1 false, label %cond.true98, label %cond.false99

cond.true98:                                      ; preds = %if.end97
  br label %cond.end100

cond.false99:                                     ; preds = %if.end97
  br label %cond.end100

cond.end100:                                      ; preds = %cond.false99, %cond.true98
  %146 = phi double [ 1.000000e+00, %cond.true98 ], [ 2.500000e+00, %cond.false99 ]
  store double %146, ptr %d, align 8
  %147 = load double, ptr %d, align 8
  %148 = fcmp one double %147, 2.500000e+00
  br i1 %148, label %then101, label %else102

then101:                                          ; preds = %cond.end100
  store i32 1, ptr %err, align 4
  %149 = load i32, ptr %err, align 4
  br label %if.end103

else102:                                          ; preds = %cond.end100
  br label %if.end103

if.end103:                                        ; preds = %else102, %then101
  br i1 true, label %cond.true104, label %cond.false105

cond.true104:                                     ; preds = %if.end103
  br label %cond.end106

cond.false105:                                    ; preds = %if.end103
  br label %cond.end106

cond.end106:                                      ; preds = %cond.false105, %cond.true104
  %150 = phi double [ 2.500000e+00, %cond.true104 ], [ 1.000000e+00, %cond.false105 ]
  store double %150, ptr %d, align 8
  %151 = load double, ptr %d, align 8
  %152 = load double, ptr %d, align 8
  %153 = fcmp one double %152, 2.500000e+00
  br i1 %153, label %then107, label %else108

then107:                                          ; preds = %cond.end106
  store i32 1, ptr %err, align 4
  %154 = load i32, ptr %err, align 4
  br label %if.end109

else108:                                          ; preds = %cond.end106
  br label %if.end109

if.end109:                                        ; preds = %else108, %then107
  store i32 0, ptr @calls, align 4
  %155 = load i32, ptr @calls, align 4
  store i32 0, ptr %k, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.loop, %if.end109
  %156 = load i32, ptr %k, align 4
  %157 = icmp slt i32 %156, 3
  br i1 %157, label %land.rhs110, label %land.end111

land.rhs110:                                      ; preds = %while.cond
  %158 = call i32 @bump()
  %159 = icmp eq i32 %158, 1
  br label %land.end111

land.end111:                                      ; preds = %land.rhs110, %while.cond
  %160 = phi i1 [ false, %while.cond ], [ %159, %land.rhs110 ]
  br i1 %160, label %while.loop, label %while.end

while.loop:                                       ; preds = %land.end111
  %161 = load i32, ptr %k, align 4
  %162 = add i32 %161, 1
  store i32 %162, ptr %k, align 4
  %163 = load i32, ptr %k, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end111
  %164 = load i32, ptr %k, align 4
  %165 = icmp ne i32 %164, 3
  br i1 %165, label %then112, label %else113

then112:                                          ; preds = %while.end
  store i32 1, ptr %err, align 4
  %166 = load i32, ptr %err, align 4
  br label %if.end114

else113:                                          ; preds = %while.end
  br label %if.end114

if.end114:                                        ; preds = %else113, %then112
  %167 = load i32, ptr @calls, align 4
  %168 = icmp ne i32 %167, 3
  br i1 %168, label %then115, label %else116

then115:                                          ; preds = %if.end114
  store i32 1, ptr %err, align 4
  %169 = load i32, ptr %err, align 4
  br label %if.end117

else116:                                          ; preds = %if.end114
  br label %if.end117

if.end117:                                        ; preds = %else116, %then115
  %170 = load i32, ptr @gTernary, align 4
  %171 = icmp ne i32 %170, 2
  br i1 %171, label %then118, label %else119

then118:                                          ; preds = %if.end117
  store i32 1, ptr %err, align 4
  %172 = load i32, ptr %err, align 4
  br label %if.end120

else119:                                          ; preds = %if.end117
  br label %if.end120

if.end120:                                        ; preds = %else119, %then118
  %173 = load i32, ptr @gAnd, align 4
  %174 = icmp ne i32 %173, 0
  br i1 %174, label %then121, label %else122

then121:                                          ; preds = %if.end120
  store i32 1, ptr %err, align 4
  %175 = load i32, ptr %err, align 4
  br label %if.end123

else122:                                          ; preds = %if.end120
  br label %if.end123

if.end123:                                        ; preds = %else122, %then121
  %176 = load i32, ptr @gOr, align 4
  %177 = icmp ne i32 %176, 1
  br i1 %177, label %then124, label %else125

then124:                                          ; preds = %if.end123
  store i32 1, ptr %err, align 4
  %178 = load i32, ptr %err, align 4
  br label %if.end126

else125:                                          ; preds = %if.end123
  br label %if.end126

if.end126:                                        ; preds = %else125, %then124
  %179 = load i32, ptr @main.sTernary, align 4
  %180 = icmp ne i32 %179, 5
  br i1 %180, label %then127, label %else128

then127:                                          ; preds = %if.end126
  store i32 1, ptr %err, align 4
  %181 = load i32, ptr %err, align 4
  br label %if.end129

else128:                                          ; preds = %if.end126
  br label %if.end129

if.end129:                                        ; preds = %else128, %then127
  %182 = load i32, ptr %err, align 4
  %183 = icmp eq i32 %182, 0
  br i1 %183, label %then130, label %else131

then130:                                          ; preds = %if.end129
  %184 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end132

else131:                                          ; preds = %if.end129
  %185 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end132

if.end132:                                        ; preds = %else131, %then130
  %186 = load i32, ptr %err, align 4
  ret i32 %186
}

!llvm.module.flags = !{!0, !1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
