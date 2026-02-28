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

define i32 @bump() !dbg !4 {
entry:
  %0 = load i32, ptr @calls, align 4, !dbg !8
  %1 = add i32 %0, 1, !dbg !8
  store i32 %1, ptr @calls, align 4, !dbg !8
  %2 = load i32, ptr @calls, align 4, !dbg !8
  ret i32 1, !dbg !9
}

define i32 @trueArm() !dbg !10 {
entry:
  store i32 1, ptr @trueRan, align 4, !dbg !11
  %0 = load i32, ptr @trueRan, align 4, !dbg !11
  ret i32 10, !dbg !12
}

define i32 @falseArm() !dbg !13 {
entry:
  store i32 1, ptr @falseRan, align 4, !dbg !14
  %0 = load i32, ptr @falseRan, align 4, !dbg !14
  ret i32 20, !dbg !15
}

define i32 @main() !dbg !16 {
entry:
  %k = alloca i32, align 4
    #dbg_declare(ptr %k, !17, !DIExpression(), !18)
  %d = alloca double, align 8
    #dbg_declare(ptr %d, !19, !DIExpression(), !21)
  %nestedTernary = alloca i32, align 4
    #dbg_declare(ptr %nestedTernary, !22, !DIExpression(), !23)
  %nestedLogic = alloca i32, align 4
    #dbg_declare(ptr %nestedLogic, !24, !DIExpression(), !25)
  %c = alloca i32, align 4
    #dbg_declare(ptr %c, !26, !DIExpression(), !27)
  %b = alloca i32, align 4
    #dbg_declare(ptr %b, !28, !DIExpression(), !29)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !30, !DIExpression(), !31)
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !32, !DIExpression(), !33)
  %arr = alloca [3 x i32], align 4
    #dbg_declare(ptr %arr, !34, !DIExpression(), !38)
  %p = alloca ptr, align 8
    #dbg_declare(ptr %p, !39, !DIExpression(), !41)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !42, !DIExpression(), !43)
  store i32 0, ptr %err, align 4, !dbg !43
  store i32 0, ptr @calls, align 4, !dbg !44
  %0 = load i32, ptr @calls, align 4, !dbg !44
  br i1 false, label %land.rhs, label %land.end, !dbg !45

land.rhs:                                         ; preds = %entry
  %1 = call i32 @bump(), !dbg !45
  %2 = icmp ne i32 %1, 0, !dbg !45
  br label %land.end, !dbg !45

land.end:                                         ; preds = %land.rhs, %entry
  %3 = phi i1 [ false, %entry ], [ %2, %land.rhs ], !dbg !45
  %4 = zext i1 %3 to i32, !dbg !45
  %5 = icmp ne i32 %4, 0, !dbg !45
  br i1 %5, label %then, label %else, !dbg !45

then:                                             ; preds = %land.end
  store i32 1, ptr %err, align 4, !dbg !46
  %6 = load i32, ptr %err, align 4, !dbg !46
  br label %if.end, !dbg !46

else:                                             ; preds = %land.end
  br label %if.end, !dbg !46

if.end:                                           ; preds = %else, %then
  %7 = load i32, ptr @calls, align 4, !dbg !47
  %8 = icmp ne i32 %7, 0, !dbg !47
  br i1 %8, label %then1, label %else2, !dbg !47

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !48
  %9 = load i32, ptr %err, align 4, !dbg !48
  br label %if.end3, !dbg !48

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !48

if.end3:                                          ; preds = %else2, %then1
  store i32 0, ptr @calls, align 4, !dbg !49
  %10 = load i32, ptr @calls, align 4, !dbg !49
  br i1 true, label %lor.end, label %lor.rhs, !dbg !50

lor.rhs:                                          ; preds = %if.end3
  %11 = call i32 @bump(), !dbg !50
  %12 = icmp ne i32 %11, 0, !dbg !50
  br label %lor.end, !dbg !50

lor.end:                                          ; preds = %lor.rhs, %if.end3
  %13 = phi i1 [ true, %if.end3 ], [ %12, %lor.rhs ], !dbg !50
  %14 = zext i1 %13 to i32, !dbg !50
  %15 = icmp ne i32 %14, 1, !dbg !50
  br i1 %15, label %then4, label %else5, !dbg !50

then4:                                            ; preds = %lor.end
  store i32 1, ptr %err, align 4, !dbg !51
  %16 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end6, !dbg !51

else5:                                            ; preds = %lor.end
  br label %if.end6, !dbg !51

if.end6:                                          ; preds = %else5, %then4
  %17 = load i32, ptr @calls, align 4, !dbg !52
  %18 = icmp ne i32 %17, 0, !dbg !52
  br i1 %18, label %then7, label %else8, !dbg !52

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !53
  %19 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end9, !dbg !53

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !53

if.end9:                                          ; preds = %else8, %then7
  store i32 0, ptr @calls, align 4, !dbg !54
  %20 = load i32, ptr @calls, align 4, !dbg !54
  br i1 true, label %land.rhs10, label %land.end11, !dbg !55

land.rhs10:                                       ; preds = %if.end9
  %21 = call i32 @bump(), !dbg !55
  %22 = icmp ne i32 %21, 0, !dbg !55
  br label %land.end11, !dbg !55

land.end11:                                       ; preds = %land.rhs10, %if.end9
  %23 = phi i1 [ false, %if.end9 ], [ %22, %land.rhs10 ], !dbg !55
  %24 = zext i1 %23 to i32, !dbg !55
  %25 = icmp ne i32 %24, 1, !dbg !55
  br i1 %25, label %then12, label %else13, !dbg !55

then12:                                           ; preds = %land.end11
  store i32 1, ptr %err, align 4, !dbg !56
  %26 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end14, !dbg !56

else13:                                           ; preds = %land.end11
  br label %if.end14, !dbg !56

if.end14:                                         ; preds = %else13, %then12
  %27 = load i32, ptr @calls, align 4, !dbg !57
  %28 = icmp ne i32 %27, 1, !dbg !57
  br i1 %28, label %then15, label %else16, !dbg !57

then15:                                           ; preds = %if.end14
  store i32 1, ptr %err, align 4, !dbg !58
  %29 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end17, !dbg !58

else16:                                           ; preds = %if.end14
  br label %if.end17, !dbg !58

if.end17:                                         ; preds = %else16, %then15
  store i32 0, ptr @calls, align 4, !dbg !59
  %30 = load i32, ptr @calls, align 4, !dbg !59
  br i1 false, label %lor.end19, label %lor.rhs18, !dbg !60

lor.rhs18:                                        ; preds = %if.end17
  %31 = call i32 @bump(), !dbg !60
  %32 = icmp ne i32 %31, 0, !dbg !60
  br label %lor.end19, !dbg !60

lor.end19:                                        ; preds = %lor.rhs18, %if.end17
  %33 = phi i1 [ true, %if.end17 ], [ %32, %lor.rhs18 ], !dbg !60
  %34 = zext i1 %33 to i32, !dbg !60
  %35 = icmp ne i32 %34, 1, !dbg !60
  br i1 %35, label %then20, label %else21, !dbg !60

then20:                                           ; preds = %lor.end19
  store i32 1, ptr %err, align 4, !dbg !61
  %36 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end22, !dbg !61

else21:                                           ; preds = %lor.end19
  br label %if.end22, !dbg !61

if.end22:                                         ; preds = %else21, %then20
  %37 = load i32, ptr @calls, align 4, !dbg !62
  %38 = icmp ne i32 %37, 1, !dbg !62
  br i1 %38, label %then23, label %else24, !dbg !62

then23:                                           ; preds = %if.end22
  store i32 1, ptr %err, align 4, !dbg !63
  %39 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end25, !dbg !63

else24:                                           ; preds = %if.end22
  br label %if.end25, !dbg !63

if.end25:                                         ; preds = %else24, %then23
  store ptr null, ptr %p, align 8, !dbg !41
  %40 = load ptr, ptr %p, align 8, !dbg !64
  %41 = ptrtoint ptr %40 to i64, !dbg !64
  %42 = icmp ne i64 %41, 0, !dbg !64
  br i1 %42, label %land.rhs26, label %land.end27, !dbg !64

land.rhs26:                                       ; preds = %if.end25
  %43 = load ptr, ptr %p, align 8, !dbg !64
  %44 = load i32, ptr %43, align 4, !dbg !64
  %45 = icmp eq i32 %44, 1, !dbg !64
  br label %land.end27, !dbg !64

land.end27:                                       ; preds = %land.rhs26, %if.end25
  %46 = phi i1 [ false, %if.end25 ], [ %45, %land.rhs26 ], !dbg !64
  br i1 %46, label %then28, label %else29, !dbg !64

then28:                                           ; preds = %land.end27
  store i32 1, ptr %err, align 4, !dbg !65
  %47 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end30, !dbg !65

else29:                                           ; preds = %land.end27
  br label %if.end30, !dbg !65

if.end30:                                         ; preds = %else29, %then28
  %48 = getelementptr [3 x i32], ptr %arr, i32 0, i32 0, !dbg !38
  store i32 1, ptr %48, align 4, !dbg !38
  %49 = getelementptr [3 x i32], ptr %arr, i32 0, i32 1, !dbg !38
  store i32 2, ptr %49, align 4, !dbg !38
  %50 = getelementptr [3 x i32], ptr %arr, i32 0, i32 2, !dbg !38
  store i32 3, ptr %50, align 4, !dbg !38
  store i32 7, ptr %i, align 4, !dbg !33
  %51 = load i32, ptr %i, align 4, !dbg !66
  %52 = icmp slt i32 %51, 3, !dbg !66
  br i1 %52, label %land.rhs31, label %land.end32, !dbg !66

land.rhs31:                                       ; preds = %if.end30
  %53 = load i32, ptr %i, align 4, !dbg !66
  %54 = getelementptr i32, ptr %arr, i32 %53, !dbg !66
  %55 = load i32, ptr %54, align 4, !dbg !66
  %56 = icmp eq i32 %55, 0, !dbg !66
  br label %land.end32, !dbg !66

land.end32:                                       ; preds = %land.rhs31, %if.end30
  %57 = phi i1 [ false, %if.end30 ], [ %56, %land.rhs31 ], !dbg !66
  br i1 %57, label %then33, label %else34, !dbg !66

then33:                                           ; preds = %land.end32
  store i32 1, ptr %err, align 4, !dbg !67
  %58 = load i32, ptr %err, align 4, !dbg !67
  br label %if.end35, !dbg !67

else34:                                           ; preds = %land.end32
  br label %if.end35, !dbg !67

if.end35:                                         ; preds = %else34, %then33
  store i32 0, ptr @trueRan, align 4, !dbg !68
  %59 = load i32, ptr @trueRan, align 4, !dbg !68
  store i32 0, ptr @falseRan, align 4, !dbg !69
  %60 = load i32, ptr @falseRan, align 4, !dbg !69
  br i1 true, label %cond.true, label %cond.false, !dbg !70

cond.true:                                        ; preds = %if.end35
  %61 = call i32 @trueArm(), !dbg !70
  br label %cond.end, !dbg !70

cond.false:                                       ; preds = %if.end35
  %62 = call i32 @falseArm(), !dbg !70
  br label %cond.end, !dbg !70

cond.end:                                         ; preds = %cond.false, %cond.true
  %63 = phi i32 [ %61, %cond.true ], [ %62, %cond.false ], !dbg !70
  %64 = icmp ne i32 %63, 10, !dbg !70
  br i1 %64, label %then36, label %else37, !dbg !70

then36:                                           ; preds = %cond.end
  store i32 1, ptr %err, align 4, !dbg !71
  %65 = load i32, ptr %err, align 4, !dbg !71
  br label %if.end38, !dbg !71

else37:                                           ; preds = %cond.end
  br label %if.end38, !dbg !71

if.end38:                                         ; preds = %else37, %then36
  %66 = load i32, ptr @trueRan, align 4, !dbg !72
  %67 = icmp ne i32 %66, 1, !dbg !72
  br i1 %67, label %then39, label %else40, !dbg !72

then39:                                           ; preds = %if.end38
  store i32 1, ptr %err, align 4, !dbg !73
  %68 = load i32, ptr %err, align 4, !dbg !73
  br label %if.end41, !dbg !73

else40:                                           ; preds = %if.end38
  br label %if.end41, !dbg !73

if.end41:                                         ; preds = %else40, %then39
  %69 = load i32, ptr @falseRan, align 4, !dbg !74
  %70 = icmp ne i32 %69, 0, !dbg !74
  br i1 %70, label %then42, label %else43, !dbg !74

then42:                                           ; preds = %if.end41
  store i32 1, ptr %err, align 4, !dbg !75
  %71 = load i32, ptr %err, align 4, !dbg !75
  br label %if.end44, !dbg !75

else43:                                           ; preds = %if.end41
  br label %if.end44, !dbg !75

if.end44:                                         ; preds = %else43, %then42
  store i32 0, ptr @trueRan, align 4, !dbg !76
  %72 = load i32, ptr @trueRan, align 4, !dbg !76
  store i32 0, ptr @falseRan, align 4, !dbg !77
  %73 = load i32, ptr @falseRan, align 4, !dbg !77
  br i1 false, label %cond.true45, label %cond.false46, !dbg !78

cond.true45:                                      ; preds = %if.end44
  %74 = call i32 @trueArm(), !dbg !78
  br label %cond.end47, !dbg !78

cond.false46:                                     ; preds = %if.end44
  %75 = call i32 @falseArm(), !dbg !78
  br label %cond.end47, !dbg !78

cond.end47:                                       ; preds = %cond.false46, %cond.true45
  %76 = phi i32 [ %74, %cond.true45 ], [ %75, %cond.false46 ], !dbg !78
  %77 = icmp ne i32 %76, 20, !dbg !78
  br i1 %77, label %then48, label %else49, !dbg !78

then48:                                           ; preds = %cond.end47
  store i32 1, ptr %err, align 4, !dbg !79
  %78 = load i32, ptr %err, align 4, !dbg !79
  br label %if.end50, !dbg !79

else49:                                           ; preds = %cond.end47
  br label %if.end50, !dbg !79

if.end50:                                         ; preds = %else49, %then48
  %79 = load i32, ptr @trueRan, align 4, !dbg !80
  %80 = icmp ne i32 %79, 0, !dbg !80
  br i1 %80, label %then51, label %else52, !dbg !80

then51:                                           ; preds = %if.end50
  store i32 1, ptr %err, align 4, !dbg !81
  %81 = load i32, ptr %err, align 4, !dbg !81
  br label %if.end53, !dbg !81

else52:                                           ; preds = %if.end50
  br label %if.end53, !dbg !81

if.end53:                                         ; preds = %else52, %then51
  %82 = load i32, ptr @falseRan, align 4, !dbg !82
  %83 = icmp ne i32 %82, 1, !dbg !82
  br i1 %83, label %then54, label %else55, !dbg !82

then54:                                           ; preds = %if.end53
  store i32 1, ptr %err, align 4, !dbg !83
  %84 = load i32, ptr %err, align 4, !dbg !83
  br label %if.end56, !dbg !83

else55:                                           ; preds = %if.end53
  br label %if.end56, !dbg !83

if.end56:                                         ; preds = %else55, %then54
  store i32 1, ptr %a, align 4, !dbg !31
  store i32 0, ptr %b, align 4, !dbg !29
  store i32 1, ptr %c, align 4, !dbg !27
  %85 = load i32, ptr %a, align 4, !dbg !84
  %86 = icmp ne i32 %85, 0, !dbg !84
  br i1 %86, label %land.rhs57, label %land.end58, !dbg !84

land.rhs57:                                       ; preds = %if.end56
  %87 = load i32, ptr %b, align 4, !dbg !84
  %88 = icmp ne i32 %87, 0, !dbg !84
  br label %land.end58, !dbg !84

land.end58:                                       ; preds = %land.rhs57, %if.end56
  %89 = phi i1 [ false, %if.end56 ], [ %88, %land.rhs57 ], !dbg !84
  br i1 %89, label %lor.end60, label %lor.rhs59, !dbg !84

lor.rhs59:                                        ; preds = %land.end58
  %90 = load i32, ptr %c, align 4, !dbg !84
  %91 = icmp ne i32 %90, 0, !dbg !84
  br label %lor.end60, !dbg !84

lor.end60:                                        ; preds = %lor.rhs59, %land.end58
  %92 = phi i1 [ true, %land.end58 ], [ %91, %lor.rhs59 ], !dbg !84
  %93 = zext i1 %92 to i32, !dbg !84
  %94 = icmp ne i32 %93, 1, !dbg !84
  br i1 %94, label %then61, label %else62, !dbg !84

then61:                                           ; preds = %lor.end60
  store i32 1, ptr %err, align 4, !dbg !85
  %95 = load i32, ptr %err, align 4, !dbg !85
  br label %if.end63, !dbg !85

else62:                                           ; preds = %lor.end60
  br label %if.end63, !dbg !85

if.end63:                                         ; preds = %else62, %then61
  %96 = load i32, ptr %a, align 4, !dbg !86
  %97 = icmp ne i32 %96, 0, !dbg !86
  br i1 %97, label %land.rhs64, label %land.end65, !dbg !86

land.rhs64:                                       ; preds = %if.end63
  %98 = load i32, ptr %b, align 4, !dbg !86
  %99 = icmp ne i32 %98, 0, !dbg !86
  br i1 %99, label %land.rhs66, label %land.end67, !dbg !86

land.end65:                                       ; preds = %land.end67, %if.end63
  %100 = phi i1 [ false, %if.end63 ], [ %105, %land.end67 ], !dbg !86
  %101 = zext i1 %100 to i32, !dbg !86
  %102 = icmp ne i32 %101, 0, !dbg !86
  br i1 %102, label %then68, label %else69, !dbg !86

land.rhs66:                                       ; preds = %land.rhs64
  %103 = load i32, ptr %c, align 4, !dbg !86
  %104 = icmp ne i32 %103, 0, !dbg !86
  br label %land.end67, !dbg !86

land.end67:                                       ; preds = %land.rhs66, %land.rhs64
  %105 = phi i1 [ false, %land.rhs64 ], [ %104, %land.rhs66 ], !dbg !86
  br label %land.end65, !dbg !86

then68:                                           ; preds = %land.end65
  store i32 1, ptr %err, align 4, !dbg !87
  %106 = load i32, ptr %err, align 4, !dbg !87
  br label %if.end70, !dbg !87

else69:                                           ; preds = %land.end65
  br label %if.end70, !dbg !87

if.end70:                                         ; preds = %else69, %then68
  %107 = load i32, ptr %a, align 4, !dbg !88
  %108 = icmp ne i32 %107, 0, !dbg !88
  br i1 %108, label %cond.true71, label %cond.false72, !dbg !88

cond.true71:                                      ; preds = %if.end70
  %109 = load i32, ptr %b, align 4, !dbg !88
  br label %cond.end73, !dbg !88

cond.false72:                                     ; preds = %if.end70
  %110 = load i32, ptr %c, align 4, !dbg !88
  br label %cond.end73, !dbg !88

cond.end73:                                       ; preds = %cond.false72, %cond.true71
  %111 = phi i32 [ %109, %cond.true71 ], [ %110, %cond.false72 ], !dbg !88
  %112 = icmp ne i32 %111, 0, !dbg !88
  br i1 %112, label %land.rhs74, label %land.end75, !dbg !88

land.rhs74:                                       ; preds = %cond.end73
  %113 = load i32, ptr %a, align 4, !dbg !88
  %114 = icmp ne i32 %113, 0, !dbg !88
  br label %land.end75, !dbg !88

land.end75:                                       ; preds = %land.rhs74, %cond.end73
  %115 = phi i1 [ false, %cond.end73 ], [ %114, %land.rhs74 ], !dbg !88
  %116 = zext i1 %115 to i32, !dbg !88
  %117 = icmp ne i32 %116, 0, !dbg !88
  br i1 %117, label %then76, label %else77, !dbg !88

then76:                                           ; preds = %land.end75
  store i32 1, ptr %err, align 4, !dbg !89
  %118 = load i32, ptr %err, align 4, !dbg !89
  br label %if.end78, !dbg !89

else77:                                           ; preds = %land.end75
  br label %if.end78, !dbg !89

if.end78:                                         ; preds = %else77, %then76
  %119 = load i32, ptr %a, align 4, !dbg !25
  %120 = icmp ne i32 %119, 0, !dbg !25
  br i1 %120, label %cond.true79, label %cond.false80, !dbg !25

cond.true79:                                      ; preds = %if.end78
  %121 = load i32, ptr %b, align 4, !dbg !25
  %122 = icmp ne i32 %121, 0, !dbg !25
  br i1 %122, label %land.rhs82, label %land.end83, !dbg !25

cond.false80:                                     ; preds = %if.end78
  %123 = load i32, ptr %b, align 4, !dbg !25
  %124 = icmp ne i32 %123, 0, !dbg !25
  br i1 %124, label %lor.end85, label %lor.rhs84, !dbg !25

cond.end81:                                       ; preds = %lor.end85, %land.end83
  %125 = phi i32 [ %131, %land.end83 ], [ %135, %lor.end85 ], !dbg !25
  store i32 %125, ptr %nestedLogic, align 4, !dbg !25
  %126 = load i32, ptr %nestedLogic, align 4, !dbg !90
  %127 = icmp ne i32 %126, 0, !dbg !90
  br i1 %127, label %then86, label %else87, !dbg !90

land.rhs82:                                       ; preds = %cond.true79
  %128 = load i32, ptr %c, align 4, !dbg !25
  %129 = icmp ne i32 %128, 0, !dbg !25
  br label %land.end83, !dbg !25

land.end83:                                       ; preds = %land.rhs82, %cond.true79
  %130 = phi i1 [ false, %cond.true79 ], [ %129, %land.rhs82 ], !dbg !25
  %131 = zext i1 %130 to i32, !dbg !25
  br label %cond.end81, !dbg !25

lor.rhs84:                                        ; preds = %cond.false80
  %132 = load i32, ptr %c, align 4, !dbg !25
  %133 = icmp ne i32 %132, 0, !dbg !25
  br label %lor.end85, !dbg !25

lor.end85:                                        ; preds = %lor.rhs84, %cond.false80
  %134 = phi i1 [ true, %cond.false80 ], [ %133, %lor.rhs84 ], !dbg !25
  %135 = zext i1 %134 to i32, !dbg !25
  br label %cond.end81, !dbg !25

then86:                                           ; preds = %cond.end81
  store i32 1, ptr %err, align 4, !dbg !91
  %136 = load i32, ptr %err, align 4, !dbg !91
  br label %if.end88, !dbg !91

else87:                                           ; preds = %cond.end81
  br label %if.end88, !dbg !91

if.end88:                                         ; preds = %else87, %then86
  %137 = load i32, ptr %a, align 4, !dbg !23
  %138 = icmp ne i32 %137, 0, !dbg !23
  br i1 %138, label %cond.true89, label %cond.false90, !dbg !23

cond.true89:                                      ; preds = %if.end88
  %139 = load i32, ptr %a, align 4, !dbg !23
  %140 = icmp ne i32 %139, 0, !dbg !23
  br i1 %140, label %cond.true92, label %cond.false93, !dbg !23

cond.false90:                                     ; preds = %if.end88
  br label %cond.end91, !dbg !23

cond.end91:                                       ; preds = %cond.false90, %cond.end94
  %141 = phi i32 [ %144, %cond.end94 ], [ 3, %cond.false90 ], !dbg !23
  store i32 %141, ptr %nestedTernary, align 4, !dbg !23
  %142 = load i32, ptr %nestedTernary, align 4, !dbg !92
  %143 = icmp ne i32 %142, 1, !dbg !92
  br i1 %143, label %then95, label %else96, !dbg !92

cond.true92:                                      ; preds = %cond.true89
  br label %cond.end94, !dbg !23

cond.false93:                                     ; preds = %cond.true89
  br label %cond.end94, !dbg !23

cond.end94:                                       ; preds = %cond.false93, %cond.true92
  %144 = phi i32 [ 1, %cond.true92 ], [ 2, %cond.false93 ], !dbg !23
  br label %cond.end91, !dbg !23

then95:                                           ; preds = %cond.end91
  store i32 1, ptr %err, align 4, !dbg !93
  %145 = load i32, ptr %err, align 4, !dbg !93
  br label %if.end97, !dbg !93

else96:                                           ; preds = %cond.end91
  br label %if.end97, !dbg !93

if.end97:                                         ; preds = %else96, %then95
  br i1 false, label %cond.true98, label %cond.false99, !dbg !21

cond.true98:                                      ; preds = %if.end97
  br label %cond.end100, !dbg !21

cond.false99:                                     ; preds = %if.end97
  br label %cond.end100, !dbg !21

cond.end100:                                      ; preds = %cond.false99, %cond.true98
  %146 = phi double [ 1.000000e+00, %cond.true98 ], [ 2.500000e+00, %cond.false99 ], !dbg !21
  store double %146, ptr %d, align 8, !dbg !21
  %147 = load double, ptr %d, align 8, !dbg !94
  %148 = fcmp one double %147, 2.500000e+00, !dbg !94
  br i1 %148, label %then101, label %else102, !dbg !94

then101:                                          ; preds = %cond.end100
  store i32 1, ptr %err, align 4, !dbg !95
  %149 = load i32, ptr %err, align 4, !dbg !95
  br label %if.end103, !dbg !95

else102:                                          ; preds = %cond.end100
  br label %if.end103, !dbg !95

if.end103:                                        ; preds = %else102, %then101
  br i1 true, label %cond.true104, label %cond.false105, !dbg !96

cond.true104:                                     ; preds = %if.end103
  br label %cond.end106, !dbg !96

cond.false105:                                    ; preds = %if.end103
  br label %cond.end106, !dbg !96

cond.end106:                                      ; preds = %cond.false105, %cond.true104
  %150 = phi double [ 2.500000e+00, %cond.true104 ], [ 1.000000e+00, %cond.false105 ], !dbg !96
  store double %150, ptr %d, align 8, !dbg !96
  %151 = load double, ptr %d, align 8, !dbg !96
  %152 = load double, ptr %d, align 8, !dbg !97
  %153 = fcmp one double %152, 2.500000e+00, !dbg !97
  br i1 %153, label %then107, label %else108, !dbg !97

then107:                                          ; preds = %cond.end106
  store i32 1, ptr %err, align 4, !dbg !98
  %154 = load i32, ptr %err, align 4, !dbg !98
  br label %if.end109, !dbg !98

else108:                                          ; preds = %cond.end106
  br label %if.end109, !dbg !98

if.end109:                                        ; preds = %else108, %then107
  store i32 0, ptr @calls, align 4, !dbg !99
  %155 = load i32, ptr @calls, align 4, !dbg !99
  store i32 0, ptr %k, align 4, !dbg !18
  br label %while.cond, !dbg !100

while.cond:                                       ; preds = %while.loop, %if.end109
  %156 = load i32, ptr %k, align 4, !dbg !100
  %157 = icmp slt i32 %156, 3, !dbg !100
  br i1 %157, label %land.rhs110, label %land.end111, !dbg !100

land.rhs110:                                      ; preds = %while.cond
  %158 = call i32 @bump(), !dbg !100
  %159 = icmp eq i32 %158, 1, !dbg !100
  br label %land.end111, !dbg !100

land.end111:                                      ; preds = %land.rhs110, %while.cond
  %160 = phi i1 [ false, %while.cond ], [ %159, %land.rhs110 ], !dbg !100
  br i1 %160, label %while.loop, label %while.end, !dbg !100

while.loop:                                       ; preds = %land.end111
  %161 = load i32, ptr %k, align 4, !dbg !101
  %162 = add i32 %161, 1, !dbg !101
  store i32 %162, ptr %k, align 4, !dbg !101
  %163 = load i32, ptr %k, align 4, !dbg !101
  br label %while.cond, !dbg !101

while.end:                                        ; preds = %land.end111
  %164 = load i32, ptr %k, align 4, !dbg !103
  %165 = icmp ne i32 %164, 3, !dbg !103
  br i1 %165, label %then112, label %else113, !dbg !103

then112:                                          ; preds = %while.end
  store i32 1, ptr %err, align 4, !dbg !104
  %166 = load i32, ptr %err, align 4, !dbg !104
  br label %if.end114, !dbg !104

else113:                                          ; preds = %while.end
  br label %if.end114, !dbg !104

if.end114:                                        ; preds = %else113, %then112
  %167 = load i32, ptr @calls, align 4, !dbg !105
  %168 = icmp ne i32 %167, 3, !dbg !105
  br i1 %168, label %then115, label %else116, !dbg !105

then115:                                          ; preds = %if.end114
  store i32 1, ptr %err, align 4, !dbg !106
  %169 = load i32, ptr %err, align 4, !dbg !106
  br label %if.end117, !dbg !106

else116:                                          ; preds = %if.end114
  br label %if.end117, !dbg !106

if.end117:                                        ; preds = %else116, %then115
  %170 = load i32, ptr @gTernary, align 4, !dbg !107
  %171 = icmp ne i32 %170, 2, !dbg !107
  br i1 %171, label %then118, label %else119, !dbg !107

then118:                                          ; preds = %if.end117
  store i32 1, ptr %err, align 4, !dbg !108
  %172 = load i32, ptr %err, align 4, !dbg !108
  br label %if.end120, !dbg !108

else119:                                          ; preds = %if.end117
  br label %if.end120, !dbg !108

if.end120:                                        ; preds = %else119, %then118
  %173 = load i32, ptr @gAnd, align 4, !dbg !109
  %174 = icmp ne i32 %173, 0, !dbg !109
  br i1 %174, label %then121, label %else122, !dbg !109

then121:                                          ; preds = %if.end120
  store i32 1, ptr %err, align 4, !dbg !110
  %175 = load i32, ptr %err, align 4, !dbg !110
  br label %if.end123, !dbg !110

else122:                                          ; preds = %if.end120
  br label %if.end123, !dbg !110

if.end123:                                        ; preds = %else122, %then121
  %176 = load i32, ptr @gOr, align 4, !dbg !111
  %177 = icmp ne i32 %176, 1, !dbg !111
  br i1 %177, label %then124, label %else125, !dbg !111

then124:                                          ; preds = %if.end123
  store i32 1, ptr %err, align 4, !dbg !112
  %178 = load i32, ptr %err, align 4, !dbg !112
  br label %if.end126, !dbg !112

else125:                                          ; preds = %if.end123
  br label %if.end126, !dbg !112

if.end126:                                        ; preds = %else125, %then124
  %179 = load i32, ptr @main.sTernary, align 4, !dbg !113
  %180 = icmp ne i32 %179, 5, !dbg !113
  br i1 %180, label %then127, label %else128, !dbg !113

then127:                                          ; preds = %if.end126
  store i32 1, ptr %err, align 4, !dbg !114
  %181 = load i32, ptr %err, align 4, !dbg !114
  br label %if.end129, !dbg !114

else128:                                          ; preds = %if.end126
  br label %if.end129, !dbg !114

if.end129:                                        ; preds = %else128, %then127
  %182 = load i32, ptr %err, align 4, !dbg !115
  %183 = icmp eq i32 %182, 0, !dbg !115
  br i1 %183, label %then130, label %else131, !dbg !115

then130:                                          ; preds = %if.end129
  %184 = call i32 (ptr, ...) @printf(ptr @0), !dbg !116
  br label %if.end132, !dbg !116

else131:                                          ; preds = %if.end129
  %185 = call i32 (ptr, ...) @printf(ptr @1), !dbg !118
  br label %if.end132, !dbg !118

if.end132:                                        ; preds = %else131, %then130
  %186 = load i32, ptr %err, align 4, !dbg !120
  ret i32 %186, !dbg !120
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "45.short_circuit.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "bump", linkageName: "bump", scope: null, file: !3, line: 24, type: !5, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocation(line: 25, column: 3, scope: !4)
!9 = !DILocation(line: 26, column: 3, scope: !4)
!10 = distinct !DISubprogram(name: "trueArm", linkageName: "trueArm", scope: null, file: !3, line: 32, type: !5, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !2)
!11 = !DILocation(line: 33, column: 3, scope: !10)
!12 = !DILocation(line: 34, column: 3, scope: !10)
!13 = distinct !DISubprogram(name: "falseArm", linkageName: "falseArm", scope: null, file: !3, line: 37, type: !5, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !2)
!14 = !DILocation(line: 38, column: 3, scope: !13)
!15 = !DILocation(line: 39, column: 3, scope: !13)
!16 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 42, type: !5, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2)
!17 = !DILocalVariable(name: "k", scope: !16, file: !3, line: 117, type: !7)
!18 = !DILocation(line: 117, column: 3, scope: !16)
!19 = !DILocalVariable(name: "d", scope: !16, file: !3, line: 109, type: !20)
!20 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!21 = !DILocation(line: 109, column: 3, scope: !16)
!22 = !DILocalVariable(name: "nestedTernary", scope: !16, file: !3, line: 103, type: !7)
!23 = !DILocation(line: 103, column: 3, scope: !16)
!24 = !DILocalVariable(name: "nestedLogic", scope: !16, file: !3, line: 101, type: !7)
!25 = !DILocation(line: 101, column: 3, scope: !16)
!26 = !DILocalVariable(name: "c", scope: !16, file: !3, line: 93, type: !7)
!27 = !DILocation(line: 93, column: 3, scope: !16)
!28 = !DILocalVariable(name: "b", scope: !16, file: !3, line: 92, type: !7)
!29 = !DILocation(line: 92, column: 3, scope: !16)
!30 = !DILocalVariable(name: "a", scope: !16, file: !3, line: 91, type: !7)
!31 = !DILocation(line: 91, column: 3, scope: !16)
!32 = !DILocalVariable(name: "i", scope: !16, file: !3, line: 72, type: !7)
!33 = !DILocation(line: 72, column: 3, scope: !16)
!34 = !DILocalVariable(name: "arr", scope: !16, file: !3, line: 71, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 96, align: 32, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 3, lowerBound: 0)
!38 = !DILocation(line: 71, column: 3, scope: !16)
!39 = !DILocalVariable(name: "p", scope: !16, file: !3, line: 67, type: !40)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!41 = !DILocation(line: 67, column: 3, scope: !16)
!42 = !DILocalVariable(name: "err", scope: !16, file: !3, line: 43, type: !7)
!43 = !DILocation(line: 43, column: 3, scope: !16)
!44 = !DILocation(line: 47, column: 3, scope: !16)
!45 = !DILocation(line: 48, column: 3, scope: !16)
!46 = !DILocation(line: 48, column: 27, scope: !16)
!47 = !DILocation(line: 49, column: 3, scope: !16)
!48 = !DILocation(line: 49, column: 19, scope: !16)
!49 = !DILocation(line: 51, column: 3, scope: !16)
!50 = !DILocation(line: 52, column: 3, scope: !16)
!51 = !DILocation(line: 52, column: 27, scope: !16)
!52 = !DILocation(line: 53, column: 3, scope: !16)
!53 = !DILocation(line: 53, column: 19, scope: !16)
!54 = !DILocation(line: 56, column: 3, scope: !16)
!55 = !DILocation(line: 57, column: 3, scope: !16)
!56 = !DILocation(line: 57, column: 27, scope: !16)
!57 = !DILocation(line: 58, column: 3, scope: !16)
!58 = !DILocation(line: 58, column: 19, scope: !16)
!59 = !DILocation(line: 60, column: 3, scope: !16)
!60 = !DILocation(line: 61, column: 3, scope: !16)
!61 = !DILocation(line: 61, column: 27, scope: !16)
!62 = !DILocation(line: 62, column: 3, scope: !16)
!63 = !DILocation(line: 62, column: 19, scope: !16)
!64 = !DILocation(line: 68, column: 3, scope: !16)
!65 = !DILocation(line: 68, column: 26, scope: !16)
!66 = !DILocation(line: 73, column: 3, scope: !16)
!67 = !DILocation(line: 73, column: 29, scope: !16)
!68 = !DILocation(line: 76, column: 3, scope: !16)
!69 = !DILocation(line: 77, column: 3, scope: !16)
!70 = !DILocation(line: 78, column: 3, scope: !16)
!71 = !DILocation(line: 78, column: 43, scope: !16)
!72 = !DILocation(line: 79, column: 3, scope: !16)
!73 = !DILocation(line: 79, column: 21, scope: !16)
!74 = !DILocation(line: 80, column: 3, scope: !16)
!75 = !DILocation(line: 80, column: 22, scope: !16)
!76 = !DILocation(line: 82, column: 3, scope: !16)
!77 = !DILocation(line: 83, column: 3, scope: !16)
!78 = !DILocation(line: 84, column: 3, scope: !16)
!79 = !DILocation(line: 84, column: 43, scope: !16)
!80 = !DILocation(line: 85, column: 3, scope: !16)
!81 = !DILocation(line: 85, column: 21, scope: !16)
!82 = !DILocation(line: 86, column: 3, scope: !16)
!83 = !DILocation(line: 86, column: 22, scope: !16)
!84 = !DILocation(line: 94, column: 3, scope: !16)
!85 = !DILocation(line: 94, column: 27, scope: !16)
!86 = !DILocation(line: 95, column: 3, scope: !16)
!87 = !DILocation(line: 95, column: 29, scope: !16)
!88 = !DILocation(line: 96, column: 3, scope: !16)
!89 = !DILocation(line: 96, column: 32, scope: !16)
!90 = !DILocation(line: 102, column: 3, scope: !16)
!91 = !DILocation(line: 102, column: 25, scope: !16)
!92 = !DILocation(line: 104, column: 3, scope: !16)
!93 = !DILocation(line: 104, column: 27, scope: !16)
!94 = !DILocation(line: 110, column: 3, scope: !16)
!95 = !DILocation(line: 110, column: 17, scope: !16)
!96 = !DILocation(line: 111, column: 3, scope: !16)
!97 = !DILocation(line: 112, column: 3, scope: !16)
!98 = !DILocation(line: 112, column: 17, scope: !16)
!99 = !DILocation(line: 116, column: 3, scope: !16)
!100 = !DILocation(line: 118, column: 3, scope: !16)
!101 = !DILocation(line: 119, column: 5, scope: !102)
!102 = distinct !DILexicalBlock(scope: !16, file: !3, line: 118, column: 32)
!103 = !DILocation(line: 121, column: 3, scope: !16)
!104 = !DILocation(line: 121, column: 15, scope: !16)
!105 = !DILocation(line: 122, column: 3, scope: !16)
!106 = !DILocation(line: 122, column: 19, scope: !16)
!107 = !DILocation(line: 125, column: 3, scope: !16)
!108 = !DILocation(line: 125, column: 22, scope: !16)
!109 = !DILocation(line: 126, column: 3, scope: !16)
!110 = !DILocation(line: 126, column: 18, scope: !16)
!111 = !DILocation(line: 127, column: 3, scope: !16)
!112 = !DILocation(line: 127, column: 17, scope: !16)
!113 = !DILocation(line: 128, column: 3, scope: !16)
!114 = !DILocation(line: 128, column: 22, scope: !16)
!115 = !DILocation(line: 130, column: 3, scope: !16)
!116 = !DILocation(line: 131, column: 5, scope: !117)
!117 = distinct !DILexicalBlock(scope: !16, file: !3, line: 130, column: 17)
!118 = !DILocation(line: 133, column: 5, scope: !119)
!119 = distinct !DILexicalBlock(scope: !16, file: !3, line: 132, column: 10)
!120 = !DILocation(line: 135, column: 3, scope: !16)
