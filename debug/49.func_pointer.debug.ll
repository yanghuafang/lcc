; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

%union.Slot = type { ptr }
%struct.Rec = type { i32, ptr }

@chosen = global ptr null
@0 = private unnamed_addr constant [24 x i8] c"49.func_pointer.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"49.func_pointer.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @addOne(i32 %0) !dbg !4 {
entry:
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !9, !DIExpression(), !10)
  store i32 %0, ptr %x, align 4, !dbg !10
  %1 = load i32, ptr %x, align 4, !dbg !11
  %2 = add i32 %1, 1, !dbg !11
  ret i32 %2, !dbg !11
}

define i32 @square(i32 %0) !dbg !12 {
entry:
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !13, !DIExpression(), !14)
  store i32 %0, ptr %x, align 4, !dbg !14
  %1 = load i32, ptr %x, align 4, !dbg !15
  %2 = load i32, ptr %x, align 4, !dbg !15
  %3 = mul i32 %1, %2, !dbg !15
  ret i32 %3, !dbg !15
}

define i32 @addTwo(i32 %0, i32 %1) !dbg !16 {
entry:
  %b = alloca i32, align 4
    #dbg_declare(ptr %b, !19, !DIExpression(), !20)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !21, !DIExpression(), !20)
  store i32 %0, ptr %a, align 4, !dbg !20
  store i32 %1, ptr %b, align 4, !dbg !20
  %2 = load i32, ptr %a, align 4, !dbg !22
  %3 = load i32, ptr %b, align 4, !dbg !22
  %4 = add i32 %2, %3, !dbg !22
  ret i32 %4, !dbg !22
}

define i32 @apply(ptr %0, i32 %1) !dbg !23 {
entry:
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !28, !DIExpression(), !29)
  %fn = alloca ptr, align 8
    #dbg_declare(ptr %fn, !30, !DIExpression(), !29)
  store ptr %0, ptr %fn, align 8, !dbg !29
  store i32 %1, ptr %n, align 4, !dbg !29
  %2 = load ptr, ptr %fn, align 8, !dbg !31
  %3 = load i32, ptr %n, align 4, !dbg !31
  %4 = call i32 %2(i32 %3), !dbg !31
  ret i32 %4, !dbg !31
}

define i32 @applyAlias(ptr %0, i32 %1) !dbg !32 {
entry:
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !33, !DIExpression(), !34)
  %fn = alloca ptr, align 8
    #dbg_declare(ptr %fn, !35, !DIExpression(), !34)
  store ptr %0, ptr %fn, align 8, !dbg !34
  store i32 %1, ptr %n, align 4, !dbg !34
  %2 = load ptr, ptr %fn, align 8, !dbg !36
  %3 = load i32, ptr %n, align 4, !dbg !36
  %4 = call i32 %2(i32 %3), !dbg !36
  ret i32 %4, !dbg !36
}

define ptr @pickOp(i32 %0) !dbg !37 {
entry:
  %which = alloca i32, align 4
    #dbg_declare(ptr %which, !40, !DIExpression(), !41)
  store i32 %0, ptr %which, align 4, !dbg !41
  %1 = load i32, ptr %which, align 4, !dbg !42
  %2 = icmp eq i32 %1, 0, !dbg !42
  br i1 %2, label %then, label %else, !dbg !42

then:                                             ; preds = %entry
  ret ptr @addOne, !dbg !43

else:                                             ; preds = %entry
  br label %if.end, !dbg !43

if.end:                                           ; preds = %else
  ret ptr @square, !dbg !45
}

define i32 @sumWith(ptr %0, i32 %1, i32 %2) !dbg !46 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !49, !DIExpression(), !50)
  %total = alloca i32, align 4
    #dbg_declare(ptr %total, !51, !DIExpression(), !52)
  %to = alloca i32, align 4
    #dbg_declare(ptr %to, !53, !DIExpression(), !54)
  %from = alloca i32, align 4
    #dbg_declare(ptr %from, !55, !DIExpression(), !54)
  %fn = alloca ptr, align 8
    #dbg_declare(ptr %fn, !56, !DIExpression(), !54)
  store ptr %0, ptr %fn, align 8, !dbg !54
  store i32 %1, ptr %from, align 4, !dbg !54
  store i32 %2, ptr %to, align 4, !dbg !54
  store i32 0, ptr %total, align 4, !dbg !52
  %3 = load i32, ptr %from, align 4, !dbg !50
  store i32 %3, ptr %i, align 4, !dbg !50
  br label %while.cond, !dbg !57

while.cond:                                       ; preds = %while.loop, %entry
  %4 = load i32, ptr %i, align 4, !dbg !57
  %5 = load i32, ptr %to, align 4, !dbg !57
  %6 = icmp sle i32 %4, %5, !dbg !57
  br i1 %6, label %while.loop, label %while.end, !dbg !57

while.loop:                                       ; preds = %while.cond
  %7 = load i32, ptr %total, align 4, !dbg !58
  %8 = load ptr, ptr %fn, align 8, !dbg !58
  %9 = load i32, ptr %i, align 4, !dbg !58
  %10 = call i32 %8(i32 %9), !dbg !58
  %11 = add i32 %7, %10, !dbg !58
  store i32 %11, ptr %total, align 4, !dbg !58
  %12 = load i32, ptr %total, align 4, !dbg !58
  %13 = load i32, ptr %i, align 4, !dbg !60
  %14 = add i32 %13, 1, !dbg !60
  store i32 %14, ptr %i, align 4, !dbg !60
  %15 = load i32, ptr %i, align 4, !dbg !60
  br label %while.cond, !dbg !60

while.end:                                        ; preds = %while.cond
  %16 = load i32, ptr %total, align 4, !dbg !61
  ret i32 %16, !dbg !61
}

define i32 @main() !dbg !62 {
entry:
  %total = alloca i32, align 4
    #dbg_declare(ptr %total, !65, !DIExpression(), !67)
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !68, !DIExpression(), !69)
  %fromMember = alloca ptr, align 8
    #dbg_declare(ptr %fromMember, !70, !DIExpression(), !71)
  %table = alloca [3 x ptr], align 8
    #dbg_declare(ptr %table, !72, !DIExpression(), !76)
  %slot = alloca %union.Slot, align 8
    #dbg_declare(ptr %slot, !77, !DIExpression(), !82)
  %rec = alloca %struct.Rec, align 8
    #dbg_declare(ptr %rec, !83, !DIExpression(), !88)
  %chain = alloca ptr, align 8
    #dbg_declare(ptr %chain, !89, !DIExpression(), !91)
  %twoArgs = alloca ptr, align 8
    #dbg_declare(ptr %twoArgs, !92, !DIExpression(), !93)
  %viaAlias = alloca ptr, align 8
    #dbg_declare(ptr %viaAlias, !94, !DIExpression(), !95)
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !96, !DIExpression(), !97)
  %q = alloca ptr, align 8
    #dbg_declare(ptr %q, !98, !DIExpression(), !99)
  %p = alloca ptr, align 8
    #dbg_declare(ptr %p, !100, !DIExpression(), !101)
  %failed = alloca i32, align 4
    #dbg_declare(ptr %failed, !102, !DIExpression(), !103)
  store i32 0, ptr %failed, align 4, !dbg !103
  store ptr @addOne, ptr %p, align 8, !dbg !104
  %0 = load ptr, ptr %p, align 8, !dbg !104
  %1 = load ptr, ptr %p, align 8, !dbg !105
  %2 = call i32 %1(i32 10), !dbg !105
  %3 = icmp ne i32 %2, 11, !dbg !105
  br i1 %3, label %then, label %else, !dbg !105

then:                                             ; preds = %entry
  store i32 1, ptr %failed, align 4, !dbg !106
  %4 = load i32, ptr %failed, align 4, !dbg !106
  br label %if.end, !dbg !106

else:                                             ; preds = %entry
  br label %if.end, !dbg !106

if.end:                                           ; preds = %else, %then
  store ptr @square, ptr %p, align 8, !dbg !108
  %5 = load ptr, ptr %p, align 8, !dbg !108
  %6 = load ptr, ptr %p, align 8, !dbg !109
  %7 = call i32 %6(i32 6), !dbg !109
  %8 = icmp ne i32 %7, 36, !dbg !109
  br i1 %8, label %then1, label %else2, !dbg !109

then1:                                            ; preds = %if.end
  store i32 1, ptr %failed, align 4, !dbg !110
  %9 = load i32, ptr %failed, align 4, !dbg !110
  br label %if.end3, !dbg !110

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !110

if.end3:                                          ; preds = %else2, %then1
  store ptr @addTwo, ptr %q, align 8, !dbg !112
  %10 = load ptr, ptr %q, align 8, !dbg !112
  %11 = load ptr, ptr %q, align 8, !dbg !113
  %12 = call i32 %11(i32 3, i32 4), !dbg !113
  %13 = icmp ne i32 %12, 7, !dbg !113
  br i1 %13, label %then4, label %else5, !dbg !113

then4:                                            ; preds = %if.end3
  store i32 1, ptr %failed, align 4, !dbg !114
  %14 = load i32, ptr %failed, align 4, !dbg !114
  br label %if.end6, !dbg !114

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !114

if.end6:                                          ; preds = %else5, %then4
  %15 = load ptr, ptr %p, align 8, !dbg !116
  %16 = call i32 %15(i32 5), !dbg !116
  %17 = add i32 %16, 1, !dbg !116
  store i32 %17, ptr %r, align 4, !dbg !116
  %18 = load i32, ptr %r, align 4, !dbg !116
  %19 = load i32, ptr %r, align 4, !dbg !117
  %20 = icmp ne i32 %19, 26, !dbg !117
  br i1 %20, label %then7, label %else8, !dbg !117

then7:                                            ; preds = %if.end6
  store i32 1, ptr %failed, align 4, !dbg !118
  %21 = load i32, ptr %failed, align 4, !dbg !118
  br label %if.end9, !dbg !118

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !118

if.end9:                                          ; preds = %else8, %then7
  %22 = call i32 @apply(ptr @addOne, i32 41), !dbg !120
  %23 = icmp ne i32 %22, 42, !dbg !120
  br i1 %23, label %then10, label %else11, !dbg !120

then10:                                           ; preds = %if.end9
  store i32 1, ptr %failed, align 4, !dbg !121
  %24 = load i32, ptr %failed, align 4, !dbg !121
  br label %if.end12, !dbg !121

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !121

if.end12:                                         ; preds = %else11, %then10
  %25 = call i32 @apply(ptr @square, i32 7), !dbg !123
  %26 = icmp ne i32 %25, 49, !dbg !123
  br i1 %26, label %then13, label %else14, !dbg !123

then13:                                           ; preds = %if.end12
  store i32 1, ptr %failed, align 4, !dbg !124
  %27 = load i32, ptr %failed, align 4, !dbg !124
  br label %if.end15, !dbg !124

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !124

if.end15:                                         ; preds = %else14, %then13
  %28 = call i32 @sumWith(ptr @square, i32 1, i32 4), !dbg !126
  %29 = icmp ne i32 %28, 30, !dbg !126
  br i1 %29, label %then16, label %else17, !dbg !126

then16:                                           ; preds = %if.end15
  store i32 1, ptr %failed, align 4, !dbg !127
  %30 = load i32, ptr %failed, align 4, !dbg !127
  br label %if.end18, !dbg !127

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !127

if.end18:                                         ; preds = %else17, %then16
  store ptr @addOne, ptr @chosen, align 8, !dbg !129
  %31 = load ptr, ptr @chosen, align 8, !dbg !129
  %32 = load ptr, ptr @chosen, align 8, !dbg !130
  %33 = call i32 %32(i32 99), !dbg !130
  %34 = icmp ne i32 %33, 100, !dbg !130
  br i1 %34, label %then19, label %else20, !dbg !130

then19:                                           ; preds = %if.end18
  store i32 1, ptr %failed, align 4, !dbg !131
  %35 = load i32, ptr %failed, align 4, !dbg !131
  br label %if.end21, !dbg !131

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !131

if.end21:                                         ; preds = %else20, %then19
  store ptr @addOne, ptr %p, align 8, !dbg !133
  %36 = load ptr, ptr %p, align 8, !dbg !133
  %37 = load ptr, ptr %p, align 8, !dbg !134
  %38 = call i32 %37(i32 7), !dbg !134
  %39 = icmp ne i32 %38, 8, !dbg !134
  br i1 %39, label %then22, label %else23, !dbg !134

then22:                                           ; preds = %if.end21
  store i32 1, ptr %failed, align 4, !dbg !135
  %40 = load i32, ptr %failed, align 4, !dbg !135
  br label %if.end24, !dbg !135

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !135

if.end24:                                         ; preds = %else23, %then22
  store ptr @addOne, ptr %viaAlias, align 8, !dbg !137
  %41 = load ptr, ptr %viaAlias, align 8, !dbg !137
  %42 = load ptr, ptr %viaAlias, align 8, !dbg !138
  %43 = call i32 %42(i32 10), !dbg !138
  %44 = icmp ne i32 %43, 11, !dbg !138
  br i1 %44, label %then25, label %else26, !dbg !138

then25:                                           ; preds = %if.end24
  store i32 1, ptr %failed, align 4, !dbg !139
  %45 = load i32, ptr %failed, align 4, !dbg !139
  br label %if.end27, !dbg !139

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !139

if.end27:                                         ; preds = %else26, %then25
  store ptr @square, ptr %viaAlias, align 8, !dbg !141
  %46 = load ptr, ptr %viaAlias, align 8, !dbg !141
  %47 = load ptr, ptr %viaAlias, align 8, !dbg !142
  %48 = call i32 %47(i32 6), !dbg !142
  %49 = icmp ne i32 %48, 36, !dbg !142
  br i1 %49, label %then28, label %else29, !dbg !142

then28:                                           ; preds = %if.end27
  store i32 1, ptr %failed, align 4, !dbg !143
  %50 = load i32, ptr %failed, align 4, !dbg !143
  br label %if.end30, !dbg !143

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !143

if.end30:                                         ; preds = %else29, %then28
  store ptr @addTwo, ptr %twoArgs, align 8, !dbg !145
  %51 = load ptr, ptr %twoArgs, align 8, !dbg !145
  %52 = load ptr, ptr %twoArgs, align 8, !dbg !146
  %53 = call i32 %52(i32 3, i32 4), !dbg !146
  %54 = icmp ne i32 %53, 7, !dbg !146
  br i1 %54, label %then31, label %else32, !dbg !146

then31:                                           ; preds = %if.end30
  store i32 1, ptr %failed, align 4, !dbg !147
  %55 = load i32, ptr %failed, align 4, !dbg !147
  br label %if.end33, !dbg !147

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !147

if.end33:                                         ; preds = %else32, %then31
  store ptr @square, ptr %chain, align 8, !dbg !149
  %56 = load ptr, ptr %chain, align 8, !dbg !149
  %57 = load ptr, ptr %chain, align 8, !dbg !150
  %58 = call i32 %57(i32 9), !dbg !150
  %59 = icmp ne i32 %58, 81, !dbg !150
  br i1 %59, label %then34, label %else35, !dbg !150

then34:                                           ; preds = %if.end33
  store i32 1, ptr %failed, align 4, !dbg !151
  %60 = load i32, ptr %failed, align 4, !dbg !151
  br label %if.end36, !dbg !151

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !151

if.end36:                                         ; preds = %else35, %then34
  %61 = call i32 @applyAlias(ptr @addOne, i32 41), !dbg !153
  %62 = icmp ne i32 %61, 42, !dbg !153
  br i1 %62, label %then37, label %else38, !dbg !153

then37:                                           ; preds = %if.end36
  store i32 1, ptr %failed, align 4, !dbg !154
  %63 = load i32, ptr %failed, align 4, !dbg !154
  br label %if.end39, !dbg !154

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !154

if.end39:                                         ; preds = %else38, %then37
  br i1 false, label %then40, label %else41, !dbg !156

then40:                                           ; preds = %if.end39
  store i32 1, ptr %failed, align 4, !dbg !157
  %64 = load i32, ptr %failed, align 4, !dbg !157
  br label %if.end42, !dbg !157

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !157

if.end42:                                         ; preds = %else41, %then40
  %65 = getelementptr %struct.Rec, ptr %rec, i32 0, i32 0, !dbg !159
  store i32 5, ptr %65, align 4, !dbg !159
  %66 = load i32, ptr %65, align 4, !dbg !159
  %67 = getelementptr %struct.Rec, ptr %rec, i32 0, i32 1, !dbg !160
  store ptr @square, ptr %67, align 8, !dbg !160
  %68 = load ptr, ptr %67, align 8, !dbg !160
  %69 = getelementptr %struct.Rec, ptr %rec, i32 0, i32 1, !dbg !161
  %70 = load ptr, ptr %69, align 8, !dbg !161
  store ptr %70, ptr %fromMember, align 8, !dbg !161
  %71 = load ptr, ptr %fromMember, align 8, !dbg !161
  %72 = getelementptr %struct.Rec, ptr %rec, i32 0, i32 0, !dbg !162
  %73 = load i32, ptr %72, align 4, !dbg !162
  %74 = icmp ne i32 %73, 5, !dbg !162
  br i1 %74, label %lor.end, label %lor.rhs, !dbg !162

lor.rhs:                                          ; preds = %if.end42
  %75 = load ptr, ptr %fromMember, align 8, !dbg !162
  %76 = call i32 %75(i32 7), !dbg !162
  %77 = icmp ne i32 %76, 49, !dbg !162
  br label %lor.end, !dbg !162

lor.end:                                          ; preds = %lor.rhs, %if.end42
  %78 = phi i1 [ true, %if.end42 ], [ %77, %lor.rhs ], !dbg !162
  br i1 %78, label %then43, label %else44, !dbg !162

then43:                                           ; preds = %lor.end
  store i32 1, ptr %failed, align 4, !dbg !163
  %79 = load i32, ptr %failed, align 4, !dbg !163
  br label %if.end45, !dbg !163

else44:                                           ; preds = %lor.end
  br label %if.end45, !dbg !163

if.end45:                                         ; preds = %else44, %then43
  %80 = getelementptr %struct.Rec, ptr %rec, i32 0, i32 1, !dbg !165
  store ptr @addOne, ptr %80, align 8, !dbg !165
  %81 = load ptr, ptr %80, align 8, !dbg !165
  %82 = getelementptr %struct.Rec, ptr %rec, i32 0, i32 1, !dbg !166
  %83 = load ptr, ptr %82, align 8, !dbg !166
  store ptr %83, ptr %fromMember, align 8, !dbg !166
  %84 = load ptr, ptr %fromMember, align 8, !dbg !166
  %85 = getelementptr %struct.Rec, ptr %rec, i32 0, i32 0, !dbg !167
  %86 = load i32, ptr %85, align 4, !dbg !167
  %87 = icmp ne i32 %86, 5, !dbg !167
  br i1 %87, label %lor.end47, label %lor.rhs46, !dbg !167

lor.rhs46:                                        ; preds = %if.end45
  %88 = load ptr, ptr %fromMember, align 8, !dbg !167
  %89 = call i32 %88(i32 7), !dbg !167
  %90 = icmp ne i32 %89, 8, !dbg !167
  br label %lor.end47, !dbg !167

lor.end47:                                        ; preds = %lor.rhs46, %if.end45
  %91 = phi i1 [ true, %if.end45 ], [ %90, %lor.rhs46 ], !dbg !167
  br i1 %91, label %then48, label %else49, !dbg !167

then48:                                           ; preds = %lor.end47
  store i32 1, ptr %failed, align 4, !dbg !168
  %92 = load i32, ptr %failed, align 4, !dbg !168
  br label %if.end50, !dbg !168

else49:                                           ; preds = %lor.end47
  br label %if.end50, !dbg !168

if.end50:                                         ; preds = %else49, %then48
  store ptr @addOne, ptr %slot, align 8, !dbg !170
  %93 = load ptr, ptr %slot, align 8, !dbg !170
  %94 = load ptr, ptr %slot, align 8, !dbg !171
  store ptr %94, ptr %fromMember, align 8, !dbg !171
  %95 = load ptr, ptr %fromMember, align 8, !dbg !171
  %96 = load ptr, ptr %fromMember, align 8, !dbg !172
  %97 = call i32 %96(i32 41), !dbg !172
  %98 = icmp ne i32 %97, 42, !dbg !172
  br i1 %98, label %then51, label %else52, !dbg !172

then51:                                           ; preds = %if.end50
  store i32 1, ptr %failed, align 4, !dbg !173
  %99 = load i32, ptr %failed, align 4, !dbg !173
  br label %if.end53, !dbg !173

else52:                                           ; preds = %if.end50
  br label %if.end53, !dbg !173

if.end53:                                         ; preds = %else52, %then51
  %100 = getelementptr ptr, ptr %table, i32 0, !dbg !175
  store ptr @addOne, ptr %100, align 8, !dbg !175
  %101 = load ptr, ptr %100, align 8, !dbg !175
  %102 = getelementptr ptr, ptr %table, i32 1, !dbg !176
  store ptr @square, ptr %102, align 8, !dbg !176
  %103 = load ptr, ptr %102, align 8, !dbg !176
  %104 = getelementptr ptr, ptr %table, i32 2, !dbg !177
  store ptr @addOne, ptr %104, align 8, !dbg !177
  %105 = load ptr, ptr %104, align 8, !dbg !177
  store i32 0, ptr %total, align 4, !dbg !178
  %106 = load i32, ptr %total, align 4, !dbg !178
  store i32 0, ptr %i, align 4, !dbg !179
  %107 = load i32, ptr %i, align 4, !dbg !179
  br label %while.cond, !dbg !180

while.cond:                                       ; preds = %while.loop, %if.end53
  %108 = load i32, ptr %i, align 4, !dbg !180
  %109 = icmp slt i32 %108, 3, !dbg !180
  br i1 %109, label %while.loop, label %while.end, !dbg !180

while.loop:                                       ; preds = %while.cond
  %110 = load i32, ptr %i, align 4, !dbg !181
  %111 = getelementptr ptr, ptr %table, i32 %110, !dbg !181
  %112 = load ptr, ptr %111, align 8, !dbg !181
  store ptr %112, ptr %fromMember, align 8, !dbg !181
  %113 = load ptr, ptr %fromMember, align 8, !dbg !181
  %114 = load i32, ptr %total, align 4, !dbg !183
  %115 = load ptr, ptr %fromMember, align 8, !dbg !183
  %116 = load i32, ptr %i, align 4, !dbg !183
  %117 = add i32 %116, 1, !dbg !183
  %118 = call i32 %115(i32 %117), !dbg !183
  %119 = add i32 %114, %118, !dbg !183
  store i32 %119, ptr %total, align 4, !dbg !183
  %120 = load i32, ptr %total, align 4, !dbg !183
  %121 = load i32, ptr %i, align 4, !dbg !184
  %122 = add i32 %121, 1, !dbg !184
  store i32 %122, ptr %i, align 4, !dbg !184
  %123 = load i32, ptr %i, align 4, !dbg !184
  br label %while.cond, !dbg !184

while.end:                                        ; preds = %while.cond
  %124 = load i32, ptr %total, align 4, !dbg !185
  %125 = icmp ne i32 %124, 10, !dbg !185
  br i1 %125, label %then54, label %else55, !dbg !185

then54:                                           ; preds = %while.end
  store i32 1, ptr %failed, align 4, !dbg !186
  %126 = load i32, ptr %failed, align 4, !dbg !186
  br label %if.end56, !dbg !186

else55:                                           ; preds = %while.end
  br label %if.end56, !dbg !186

if.end56:                                         ; preds = %else55, %then54
  %127 = call ptr @pickOp(i32 0), !dbg !188
  store ptr %127, ptr %fromMember, align 8, !dbg !188
  %128 = load ptr, ptr %fromMember, align 8, !dbg !188
  %129 = load ptr, ptr %fromMember, align 8, !dbg !189
  %130 = call i32 %129(i32 10), !dbg !189
  %131 = icmp ne i32 %130, 11, !dbg !189
  br i1 %131, label %then57, label %else58, !dbg !189

then57:                                           ; preds = %if.end56
  store i32 1, ptr %failed, align 4, !dbg !190
  %132 = load i32, ptr %failed, align 4, !dbg !190
  br label %if.end59, !dbg !190

else58:                                           ; preds = %if.end56
  br label %if.end59, !dbg !190

if.end59:                                         ; preds = %else58, %then57
  %133 = call ptr @pickOp(i32 1), !dbg !192
  store ptr %133, ptr %fromMember, align 8, !dbg !192
  %134 = load ptr, ptr %fromMember, align 8, !dbg !192
  %135 = load ptr, ptr %fromMember, align 8, !dbg !193
  %136 = call i32 %135(i32 10), !dbg !193
  %137 = icmp ne i32 %136, 100, !dbg !193
  br i1 %137, label %then60, label %else61, !dbg !193

then60:                                           ; preds = %if.end59
  store i32 1, ptr %failed, align 4, !dbg !194
  %138 = load i32, ptr %failed, align 4, !dbg !194
  br label %if.end62, !dbg !194

else61:                                           ; preds = %if.end59
  br label %if.end62, !dbg !194

if.end62:                                         ; preds = %else61, %then60
  %139 = load i32, ptr %failed, align 4, !dbg !196
  %140 = icmp eq i32 %139, 0, !dbg !196
  br i1 %140, label %then63, label %else64, !dbg !196

then63:                                           ; preds = %if.end62
  %141 = call i32 (ptr, ...) @printf(ptr @0), !dbg !197
  ret i32 0, !dbg !199

else64:                                           ; preds = %if.end62
  br label %if.end65, !dbg !199

if.end65:                                         ; preds = %else64
  %142 = call i32 (ptr, ...) @printf(ptr @1), !dbg !200
  ret i32 1, !dbg !201
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "49.func_pointer.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "addOne", linkageName: "addOne", scope: null, file: !3, line: 29, type: !5, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "x", arg: 1, scope: !4, file: !3, line: 29, type: !7)
!10 = !DILocation(line: 29, column: 5, scope: !4)
!11 = !DILocation(line: 29, column: 21, scope: !4)
!12 = distinct !DISubprogram(name: "square", linkageName: "square", scope: null, file: !3, line: 30, type: !5, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!13 = !DILocalVariable(name: "x", arg: 1, scope: !12, file: !3, line: 30, type: !7)
!14 = !DILocation(line: 30, column: 5, scope: !12)
!15 = !DILocation(line: 30, column: 21, scope: !12)
!16 = distinct !DISubprogram(name: "addTwo", linkageName: "addTwo", scope: null, file: !3, line: 31, type: !17, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!17 = !DISubroutineType(types: !18)
!18 = !{!7, !7, !7}
!19 = !DILocalVariable(name: "b", arg: 2, scope: !16, file: !3, line: 31, type: !7)
!20 = !DILocation(line: 31, column: 5, scope: !16)
!21 = !DILocalVariable(name: "a", arg: 1, scope: !16, file: !3, line: 31, type: !7)
!22 = !DILocation(line: 31, column: 28, scope: !16)
!23 = distinct !DISubprogram(name: "apply", linkageName: "apply", scope: null, file: !3, line: 33, type: !24, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!24 = !DISubroutineType(types: !25)
!25 = !{!7, !26, !7}
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!28 = !DILocalVariable(name: "n", arg: 2, scope: !23, file: !3, line: 33, type: !7)
!29 = !DILocation(line: 33, column: 5, scope: !23)
!30 = !DILocalVariable(name: "fn", arg: 1, scope: !23, file: !3, line: 33, type: !26)
!31 = !DILocation(line: 33, column: 36, scope: !23)
!32 = distinct !DISubprogram(name: "applyAlias", linkageName: "applyAlias", scope: null, file: !3, line: 39, type: !24, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!33 = !DILocalVariable(name: "n", arg: 2, scope: !32, file: !3, line: 39, type: !7)
!34 = !DILocation(line: 39, column: 5, scope: !32)
!35 = !DILocalVariable(name: "fn", arg: 1, scope: !32, file: !3, line: 39, type: !26)
!36 = !DILocation(line: 39, column: 32, scope: !32)
!37 = distinct !DISubprogram(name: "pickOp", linkageName: "pickOp", scope: null, file: !3, line: 52, type: !38, scopeLine: 52, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!38 = !DISubroutineType(types: !39)
!39 = !{!26, !7}
!40 = !DILocalVariable(name: "which", arg: 1, scope: !37, file: !3, line: 52, type: !7)
!41 = !DILocation(line: 52, column: 4, scope: !37)
!42 = !DILocation(line: 53, column: 3, scope: !37)
!43 = !DILocation(line: 54, column: 5, scope: !44)
!44 = distinct !DILexicalBlock(scope: !37, file: !3, line: 53, column: 19)
!45 = !DILocation(line: 56, column: 3, scope: !37)
!46 = distinct !DISubprogram(name: "sumWith", linkageName: "sumWith", scope: null, file: !3, line: 59, type: !47, scopeLine: 59, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!47 = !DISubroutineType(types: !48)
!48 = !{!7, !26, !7, !7}
!49 = !DILocalVariable(name: "i", scope: !46, file: !3, line: 61, type: !7)
!50 = !DILocation(line: 61, column: 3, scope: !46)
!51 = !DILocalVariable(name: "total", scope: !46, file: !3, line: 60, type: !7)
!52 = !DILocation(line: 60, column: 3, scope: !46)
!53 = !DILocalVariable(name: "to", arg: 3, scope: !46, file: !3, line: 59, type: !7)
!54 = !DILocation(line: 59, column: 5, scope: !46)
!55 = !DILocalVariable(name: "from", arg: 2, scope: !46, file: !3, line: 59, type: !7)
!56 = !DILocalVariable(name: "fn", arg: 1, scope: !46, file: !3, line: 59, type: !26)
!57 = !DILocation(line: 63, column: 3, scope: !46)
!58 = !DILocation(line: 64, column: 5, scope: !59)
!59 = distinct !DILexicalBlock(scope: !46, file: !3, line: 63, column: 19)
!60 = !DILocation(line: 65, column: 5, scope: !59)
!61 = !DILocation(line: 67, column: 3, scope: !46)
!62 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 73, type: !63, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!63 = !DISubroutineType(types: !64)
!64 = !{!7}
!65 = !DILocalVariable(name: "total", scope: !66, file: !3, line: 173, type: !7)
!66 = distinct !DILexicalBlock(scope: !62, file: !3, line: 167, column: 3)
!67 = !DILocation(line: 173, column: 5, scope: !66)
!68 = !DILocalVariable(name: "i", scope: !66, file: !3, line: 172, type: !7)
!69 = !DILocation(line: 172, column: 5, scope: !66)
!70 = !DILocalVariable(name: "fromMember", scope: !66, file: !3, line: 171, type: !26)
!71 = !DILocation(line: 171, column: 5, scope: !66)
!72 = !DILocalVariable(name: "table", scope: !66, file: !3, line: 170, type: !73)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 192, align: 64, elements: !74)
!74 = !{!75}
!75 = !DISubrange(count: 3, lowerBound: 0)
!76 = !DILocation(line: 170, column: 5, scope: !66)
!77 = !DILocalVariable(name: "slot", scope: !66, file: !3, line: 169, type: !78)
!78 = !DICompositeType(tag: DW_TAG_union_type, name: "Slot", file: !3, size: 64, align: 64, elements: !79)
!79 = !{!80, !81}
!80 = !DIDerivedType(tag: DW_TAG_member, name: "fn", file: !3, baseType: !26, size: 64, align: 64)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "n", file: !3, baseType: !7, size: 32, align: 32)
!82 = !DILocation(line: 169, column: 5, scope: !66)
!83 = !DILocalVariable(name: "rec", scope: !66, file: !3, line: 168, type: !84)
!84 = !DICompositeType(tag: DW_TAG_structure_type, name: "Rec", file: !3, size: 128, align: 64, elements: !85)
!85 = !{!86, !87}
!86 = !DIDerivedType(tag: DW_TAG_member, name: "id", file: !3, baseType: !7, size: 32, align: 32)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "fn", file: !3, baseType: !26, size: 64, align: 64, offset: 64)
!88 = !DILocation(line: 168, column: 5, scope: !66)
!89 = !DILocalVariable(name: "chain", scope: !90, file: !3, line: 132, type: !26)
!90 = distinct !DILexicalBlock(scope: !62, file: !3, line: 129, column: 3)
!91 = !DILocation(line: 132, column: 5, scope: !90)
!92 = !DILocalVariable(name: "twoArgs", scope: !90, file: !3, line: 131, type: !26)
!93 = !DILocation(line: 131, column: 5, scope: !90)
!94 = !DILocalVariable(name: "viaAlias", scope: !90, file: !3, line: 130, type: !26)
!95 = !DILocation(line: 130, column: 5, scope: !90)
!96 = !DILocalVariable(name: "r", scope: !62, file: !3, line: 77, type: !7)
!97 = !DILocation(line: 77, column: 3, scope: !62)
!98 = !DILocalVariable(name: "q", scope: !62, file: !3, line: 76, type: !26)
!99 = !DILocation(line: 76, column: 3, scope: !62)
!100 = !DILocalVariable(name: "p", scope: !62, file: !3, line: 75, type: !26)
!101 = !DILocation(line: 75, column: 3, scope: !62)
!102 = !DILocalVariable(name: "failed", scope: !62, file: !3, line: 74, type: !7)
!103 = !DILocation(line: 74, column: 3, scope: !62)
!104 = !DILocation(line: 80, column: 3, scope: !62)
!105 = !DILocation(line: 81, column: 3, scope: !62)
!106 = !DILocation(line: 82, column: 5, scope: !107)
!107 = distinct !DILexicalBlock(scope: !62, file: !3, line: 81, column: 20)
!108 = !DILocation(line: 86, column: 3, scope: !62)
!109 = !DILocation(line: 87, column: 3, scope: !62)
!110 = !DILocation(line: 88, column: 5, scope: !111)
!111 = distinct !DILexicalBlock(scope: !62, file: !3, line: 87, column: 19)
!112 = !DILocation(line: 92, column: 3, scope: !62)
!113 = !DILocation(line: 93, column: 3, scope: !62)
!114 = !DILocation(line: 94, column: 5, scope: !115)
!115 = distinct !DILexicalBlock(scope: !62, file: !3, line: 93, column: 21)
!116 = !DILocation(line: 98, column: 3, scope: !62)
!117 = !DILocation(line: 99, column: 3, scope: !62)
!118 = !DILocation(line: 100, column: 5, scope: !119)
!119 = distinct !DILexicalBlock(scope: !62, file: !3, line: 99, column: 16)
!120 = !DILocation(line: 104, column: 3, scope: !62)
!121 = !DILocation(line: 105, column: 5, scope: !122)
!122 = distinct !DILexicalBlock(scope: !62, file: !3, line: 104, column: 32)
!123 = !DILocation(line: 107, column: 3, scope: !62)
!124 = !DILocation(line: 108, column: 5, scope: !125)
!125 = distinct !DILexicalBlock(scope: !62, file: !3, line: 107, column: 31)
!126 = !DILocation(line: 112, column: 3, scope: !62)
!127 = !DILocation(line: 113, column: 5, scope: !128)
!128 = distinct !DILexicalBlock(scope: !62, file: !3, line: 112, column: 36)
!129 = !DILocation(line: 117, column: 3, scope: !62)
!130 = !DILocation(line: 118, column: 3, scope: !62)
!131 = !DILocation(line: 119, column: 5, scope: !132)
!132 = distinct !DILexicalBlock(scope: !62, file: !3, line: 118, column: 26)
!133 = !DILocation(line: 123, column: 3, scope: !62)
!134 = !DILocation(line: 124, column: 3, scope: !62)
!135 = !DILocation(line: 125, column: 5, scope: !136)
!136 = distinct !DILexicalBlock(scope: !62, file: !3, line: 124, column: 18)
!137 = !DILocation(line: 134, column: 5, scope: !90)
!138 = !DILocation(line: 135, column: 5, scope: !90)
!139 = !DILocation(line: 136, column: 7, scope: !140)
!140 = distinct !DILexicalBlock(scope: !90, file: !3, line: 135, column: 29)
!141 = !DILocation(line: 139, column: 5, scope: !90)
!142 = !DILocation(line: 140, column: 5, scope: !90)
!143 = !DILocation(line: 141, column: 7, scope: !144)
!144 = distinct !DILexicalBlock(scope: !90, file: !3, line: 140, column: 28)
!145 = !DILocation(line: 144, column: 5, scope: !90)
!146 = !DILocation(line: 145, column: 5, scope: !90)
!147 = !DILocation(line: 146, column: 7, scope: !148)
!148 = distinct !DILexicalBlock(scope: !90, file: !3, line: 145, column: 29)
!149 = !DILocation(line: 150, column: 5, scope: !90)
!150 = !DILocation(line: 151, column: 5, scope: !90)
!151 = !DILocation(line: 152, column: 7, scope: !152)
!152 = distinct !DILexicalBlock(scope: !90, file: !3, line: 151, column: 25)
!153 = !DILocation(line: 156, column: 5, scope: !90)
!154 = !DILocation(line: 157, column: 7, scope: !155)
!155 = distinct !DILexicalBlock(scope: !90, file: !3, line: 156, column: 39)
!156 = !DILocation(line: 161, column: 5, scope: !90)
!157 = !DILocation(line: 162, column: 7, scope: !158)
!158 = distinct !DILexicalBlock(scope: !90, file: !3, line: 161, column: 26)
!159 = !DILocation(line: 176, column: 5, scope: !66)
!160 = !DILocation(line: 177, column: 5, scope: !66)
!161 = !DILocation(line: 178, column: 5, scope: !66)
!162 = !DILocation(line: 179, column: 5, scope: !66)
!163 = !DILocation(line: 180, column: 7, scope: !164)
!164 = distinct !DILexicalBlock(scope: !66, file: !3, line: 179, column: 45)
!165 = !DILocation(line: 184, column: 5, scope: !66)
!166 = !DILocation(line: 185, column: 5, scope: !66)
!167 = !DILocation(line: 186, column: 5, scope: !66)
!168 = !DILocation(line: 187, column: 7, scope: !169)
!169 = distinct !DILexicalBlock(scope: !66, file: !3, line: 186, column: 44)
!170 = !DILocation(line: 191, column: 5, scope: !66)
!171 = !DILocation(line: 192, column: 5, scope: !66)
!172 = !DILocation(line: 193, column: 5, scope: !66)
!173 = !DILocation(line: 194, column: 7, scope: !174)
!174 = distinct !DILexicalBlock(scope: !66, file: !3, line: 193, column: 31)
!175 = !DILocation(line: 198, column: 5, scope: !66)
!176 = !DILocation(line: 199, column: 5, scope: !66)
!177 = !DILocation(line: 200, column: 5, scope: !66)
!178 = !DILocation(line: 201, column: 5, scope: !66)
!179 = !DILocation(line: 202, column: 5, scope: !66)
!180 = !DILocation(line: 203, column: 5, scope: !66)
!181 = !DILocation(line: 204, column: 7, scope: !182)
!182 = distinct !DILexicalBlock(scope: !66, file: !3, line: 203, column: 19)
!183 = !DILocation(line: 205, column: 7, scope: !182)
!184 = !DILocation(line: 206, column: 7, scope: !182)
!185 = !DILocation(line: 208, column: 5, scope: !66)
!186 = !DILocation(line: 209, column: 7, scope: !187)
!187 = distinct !DILexicalBlock(scope: !66, file: !3, line: 208, column: 22)
!188 = !DILocation(line: 213, column: 5, scope: !66)
!189 = !DILocation(line: 214, column: 5, scope: !66)
!190 = !DILocation(line: 215, column: 7, scope: !191)
!191 = distinct !DILexicalBlock(scope: !66, file: !3, line: 214, column: 31)
!192 = !DILocation(line: 217, column: 5, scope: !66)
!193 = !DILocation(line: 218, column: 5, scope: !66)
!194 = !DILocation(line: 219, column: 7, scope: !195)
!195 = distinct !DILexicalBlock(scope: !66, file: !3, line: 218, column: 32)
!196 = !DILocation(line: 223, column: 3, scope: !62)
!197 = !DILocation(line: 224, column: 5, scope: !198)
!198 = distinct !DILexicalBlock(scope: !62, file: !3, line: 223, column: 20)
!199 = !DILocation(line: 225, column: 5, scope: !198)
!200 = !DILocation(line: 227, column: 3, scope: !62)
!201 = !DILocation(line: 228, column: 3, scope: !62)
