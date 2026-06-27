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
    #dbg_declare(ptr %x, !8, !DIExpression(), !9)
  store i32 %0, ptr %x, align 4, !dbg !9
  %1 = load i32, ptr %x, align 4, !dbg !10
  %2 = add i32 %1, 1, !dbg !10
  ret i32 %2, !dbg !10
}

define i32 @square(i32 %0) !dbg !11 {
entry:
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !12, !DIExpression(), !13)
  store i32 %0, ptr %x, align 4, !dbg !13
  %1 = load i32, ptr %x, align 4, !dbg !14
  %2 = load i32, ptr %x, align 4, !dbg !14
  %3 = mul i32 %1, %2, !dbg !14
  ret i32 %3, !dbg !14
}

define i32 @addTwo(i32 %0, i32 %1) !dbg !15 {
entry:
  %b = alloca i32, align 4
    #dbg_declare(ptr %b, !18, !DIExpression(), !19)
  %a = alloca i32, align 4
    #dbg_declare(ptr %a, !20, !DIExpression(), !19)
  store i32 %0, ptr %a, align 4, !dbg !19
  store i32 %1, ptr %b, align 4, !dbg !19
  %2 = load i32, ptr %a, align 4, !dbg !21
  %3 = load i32, ptr %b, align 4, !dbg !21
  %4 = add i32 %2, %3, !dbg !21
  ret i32 %4, !dbg !21
}

define i32 @apply(ptr %0, i32 %1) !dbg !22 {
entry:
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !27, !DIExpression(), !28)
  %fn = alloca ptr, align 8
    #dbg_declare(ptr %fn, !29, !DIExpression(), !28)
  store ptr %0, ptr %fn, align 8, !dbg !28
  store i32 %1, ptr %n, align 4, !dbg !28
  %2 = load ptr, ptr %fn, align 8, !dbg !30
  %3 = load i32, ptr %n, align 4, !dbg !30
  %4 = call i32 %2(i32 %3), !dbg !30
  ret i32 %4, !dbg !30
}

define i32 @applyAlias(ptr %0, i32 %1) !dbg !31 {
entry:
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !32, !DIExpression(), !33)
  %fn = alloca ptr, align 8
    #dbg_declare(ptr %fn, !34, !DIExpression(), !33)
  store ptr %0, ptr %fn, align 8, !dbg !33
  store i32 %1, ptr %n, align 4, !dbg !33
  %2 = load ptr, ptr %fn, align 8, !dbg !35
  %3 = load i32, ptr %n, align 4, !dbg !35
  %4 = call i32 %2(i32 %3), !dbg !35
  ret i32 %4, !dbg !35
}

define ptr @pickOp(i32 %0) !dbg !36 {
entry:
  %which = alloca i32, align 4
    #dbg_declare(ptr %which, !39, !DIExpression(), !40)
  store i32 %0, ptr %which, align 4, !dbg !40
  %1 = load i32, ptr %which, align 4, !dbg !41
  %2 = icmp eq i32 %1, 0, !dbg !41
  br i1 %2, label %then, label %else, !dbg !41

then:                                             ; preds = %entry
  ret ptr @addOne, !dbg !42

else:                                             ; preds = %entry
  br label %if.end, !dbg !42

if.end:                                           ; preds = %else
  ret ptr @square, !dbg !44
}

define i32 @sumWith(ptr %0, i32 %1, i32 %2) !dbg !45 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !48, !DIExpression(), !49)
  %total = alloca i32, align 4
    #dbg_declare(ptr %total, !50, !DIExpression(), !51)
  %to = alloca i32, align 4
    #dbg_declare(ptr %to, !52, !DIExpression(), !53)
  %from = alloca i32, align 4
    #dbg_declare(ptr %from, !54, !DIExpression(), !53)
  %fn = alloca ptr, align 8
    #dbg_declare(ptr %fn, !55, !DIExpression(), !53)
  store ptr %0, ptr %fn, align 8, !dbg !53
  store i32 %1, ptr %from, align 4, !dbg !53
  store i32 %2, ptr %to, align 4, !dbg !53
  store i32 0, ptr %total, align 4, !dbg !51
  %3 = load i32, ptr %from, align 4, !dbg !49
  store i32 %3, ptr %i, align 4, !dbg !49
  br label %while.cond, !dbg !56

while.cond:                                       ; preds = %while.loop, %entry
  %4 = load i32, ptr %i, align 4, !dbg !56
  %5 = load i32, ptr %to, align 4, !dbg !56
  %6 = icmp sle i32 %4, %5, !dbg !56
  br i1 %6, label %while.loop, label %while.end, !dbg !56

while.loop:                                       ; preds = %while.cond
  %7 = load i32, ptr %total, align 4, !dbg !57
  %8 = load ptr, ptr %fn, align 8, !dbg !57
  %9 = load i32, ptr %i, align 4, !dbg !57
  %10 = call i32 %8(i32 %9), !dbg !57
  %11 = add i32 %7, %10, !dbg !57
  store i32 %11, ptr %total, align 4, !dbg !57
  %12 = load i32, ptr %total, align 4, !dbg !57
  %13 = load i32, ptr %i, align 4, !dbg !59
  %14 = add i32 %13, 1, !dbg !59
  store i32 %14, ptr %i, align 4, !dbg !59
  %15 = load i32, ptr %i, align 4, !dbg !59
  br label %while.cond, !dbg !59

while.end:                                        ; preds = %while.cond
  %16 = load i32, ptr %total, align 4, !dbg !60
  ret i32 %16, !dbg !60
}

define i32 @main() !dbg !61 {
entry:
  %total = alloca i32, align 4
    #dbg_declare(ptr %total, !64, !DIExpression(), !66)
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !67, !DIExpression(), !68)
  %fromMember = alloca ptr, align 8
    #dbg_declare(ptr %fromMember, !69, !DIExpression(), !70)
  %table = alloca [3 x ptr], align 8
    #dbg_declare(ptr %table, !71, !DIExpression(), !75)
  %slot = alloca %union.Slot, align 8
    #dbg_declare(ptr %slot, !76, !DIExpression(), !81)
  %rec = alloca %struct.Rec, align 8
    #dbg_declare(ptr %rec, !82, !DIExpression(), !87)
  %chain = alloca ptr, align 8
    #dbg_declare(ptr %chain, !88, !DIExpression(), !90)
  %twoArgs = alloca ptr, align 8
    #dbg_declare(ptr %twoArgs, !91, !DIExpression(), !92)
  %viaAlias = alloca ptr, align 8
    #dbg_declare(ptr %viaAlias, !93, !DIExpression(), !94)
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !95, !DIExpression(), !96)
  %q = alloca ptr, align 8
    #dbg_declare(ptr %q, !97, !DIExpression(), !98)
  %p = alloca ptr, align 8
    #dbg_declare(ptr %p, !99, !DIExpression(), !100)
  %failed = alloca i32, align 4
    #dbg_declare(ptr %failed, !101, !DIExpression(), !102)
  store i32 0, ptr %failed, align 4, !dbg !102
  store ptr @addOne, ptr %p, align 8, !dbg !103
  %0 = load ptr, ptr %p, align 8, !dbg !103
  %1 = load ptr, ptr %p, align 8, !dbg !104
  %2 = call i32 %1(i32 10), !dbg !104
  %3 = icmp ne i32 %2, 11, !dbg !104
  br i1 %3, label %then, label %else, !dbg !104

then:                                             ; preds = %entry
  store i32 1, ptr %failed, align 4, !dbg !105
  %4 = load i32, ptr %failed, align 4, !dbg !105
  br label %if.end, !dbg !105

else:                                             ; preds = %entry
  br label %if.end, !dbg !105

if.end:                                           ; preds = %else, %then
  store ptr @square, ptr %p, align 8, !dbg !107
  %5 = load ptr, ptr %p, align 8, !dbg !107
  %6 = load ptr, ptr %p, align 8, !dbg !108
  %7 = call i32 %6(i32 6), !dbg !108
  %8 = icmp ne i32 %7, 36, !dbg !108
  br i1 %8, label %then1, label %else2, !dbg !108

then1:                                            ; preds = %if.end
  store i32 1, ptr %failed, align 4, !dbg !109
  %9 = load i32, ptr %failed, align 4, !dbg !109
  br label %if.end3, !dbg !109

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !109

if.end3:                                          ; preds = %else2, %then1
  store ptr @addTwo, ptr %q, align 8, !dbg !111
  %10 = load ptr, ptr %q, align 8, !dbg !111
  %11 = load ptr, ptr %q, align 8, !dbg !112
  %12 = call i32 %11(i32 3, i32 4), !dbg !112
  %13 = icmp ne i32 %12, 7, !dbg !112
  br i1 %13, label %then4, label %else5, !dbg !112

then4:                                            ; preds = %if.end3
  store i32 1, ptr %failed, align 4, !dbg !113
  %14 = load i32, ptr %failed, align 4, !dbg !113
  br label %if.end6, !dbg !113

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !113

if.end6:                                          ; preds = %else5, %then4
  %15 = load ptr, ptr %p, align 8, !dbg !115
  %16 = call i32 %15(i32 5), !dbg !115
  %17 = add i32 %16, 1, !dbg !115
  store i32 %17, ptr %r, align 4, !dbg !115
  %18 = load i32, ptr %r, align 4, !dbg !115
  %19 = load i32, ptr %r, align 4, !dbg !116
  %20 = icmp ne i32 %19, 26, !dbg !116
  br i1 %20, label %then7, label %else8, !dbg !116

then7:                                            ; preds = %if.end6
  store i32 1, ptr %failed, align 4, !dbg !117
  %21 = load i32, ptr %failed, align 4, !dbg !117
  br label %if.end9, !dbg !117

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !117

if.end9:                                          ; preds = %else8, %then7
  %22 = call i32 @apply(ptr @addOne, i32 41), !dbg !119
  %23 = icmp ne i32 %22, 42, !dbg !119
  br i1 %23, label %then10, label %else11, !dbg !119

then10:                                           ; preds = %if.end9
  store i32 1, ptr %failed, align 4, !dbg !120
  %24 = load i32, ptr %failed, align 4, !dbg !120
  br label %if.end12, !dbg !120

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !120

if.end12:                                         ; preds = %else11, %then10
  %25 = call i32 @apply(ptr @square, i32 7), !dbg !122
  %26 = icmp ne i32 %25, 49, !dbg !122
  br i1 %26, label %then13, label %else14, !dbg !122

then13:                                           ; preds = %if.end12
  store i32 1, ptr %failed, align 4, !dbg !123
  %27 = load i32, ptr %failed, align 4, !dbg !123
  br label %if.end15, !dbg !123

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !123

if.end15:                                         ; preds = %else14, %then13
  %28 = call i32 @sumWith(ptr @square, i32 1, i32 4), !dbg !125
  %29 = icmp ne i32 %28, 30, !dbg !125
  br i1 %29, label %then16, label %else17, !dbg !125

then16:                                           ; preds = %if.end15
  store i32 1, ptr %failed, align 4, !dbg !126
  %30 = load i32, ptr %failed, align 4, !dbg !126
  br label %if.end18, !dbg !126

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !126

if.end18:                                         ; preds = %else17, %then16
  store ptr @addOne, ptr @chosen, align 8, !dbg !128
  %31 = load ptr, ptr @chosen, align 8, !dbg !128
  %32 = load ptr, ptr @chosen, align 8, !dbg !129
  %33 = call i32 %32(i32 99), !dbg !129
  %34 = icmp ne i32 %33, 100, !dbg !129
  br i1 %34, label %then19, label %else20, !dbg !129

then19:                                           ; preds = %if.end18
  store i32 1, ptr %failed, align 4, !dbg !130
  %35 = load i32, ptr %failed, align 4, !dbg !130
  br label %if.end21, !dbg !130

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !130

if.end21:                                         ; preds = %else20, %then19
  store ptr @addOne, ptr %p, align 8, !dbg !132
  %36 = load ptr, ptr %p, align 8, !dbg !132
  %37 = load ptr, ptr %p, align 8, !dbg !133
  %38 = call i32 %37(i32 7), !dbg !133
  %39 = icmp ne i32 %38, 8, !dbg !133
  br i1 %39, label %then22, label %else23, !dbg !133

then22:                                           ; preds = %if.end21
  store i32 1, ptr %failed, align 4, !dbg !134
  %40 = load i32, ptr %failed, align 4, !dbg !134
  br label %if.end24, !dbg !134

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !134

if.end24:                                         ; preds = %else23, %then22
  store ptr @addOne, ptr %viaAlias, align 8, !dbg !136
  %41 = load ptr, ptr %viaAlias, align 8, !dbg !136
  %42 = load ptr, ptr %viaAlias, align 8, !dbg !137
  %43 = call i32 %42(i32 10), !dbg !137
  %44 = icmp ne i32 %43, 11, !dbg !137
  br i1 %44, label %then25, label %else26, !dbg !137

then25:                                           ; preds = %if.end24
  store i32 1, ptr %failed, align 4, !dbg !138
  %45 = load i32, ptr %failed, align 4, !dbg !138
  br label %if.end27, !dbg !138

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !138

if.end27:                                         ; preds = %else26, %then25
  store ptr @square, ptr %viaAlias, align 8, !dbg !140
  %46 = load ptr, ptr %viaAlias, align 8, !dbg !140
  %47 = load ptr, ptr %viaAlias, align 8, !dbg !141
  %48 = call i32 %47(i32 6), !dbg !141
  %49 = icmp ne i32 %48, 36, !dbg !141
  br i1 %49, label %then28, label %else29, !dbg !141

then28:                                           ; preds = %if.end27
  store i32 1, ptr %failed, align 4, !dbg !142
  %50 = load i32, ptr %failed, align 4, !dbg !142
  br label %if.end30, !dbg !142

else29:                                           ; preds = %if.end27
  br label %if.end30, !dbg !142

if.end30:                                         ; preds = %else29, %then28
  store ptr @addTwo, ptr %twoArgs, align 8, !dbg !144
  %51 = load ptr, ptr %twoArgs, align 8, !dbg !144
  %52 = load ptr, ptr %twoArgs, align 8, !dbg !145
  %53 = call i32 %52(i32 3, i32 4), !dbg !145
  %54 = icmp ne i32 %53, 7, !dbg !145
  br i1 %54, label %then31, label %else32, !dbg !145

then31:                                           ; preds = %if.end30
  store i32 1, ptr %failed, align 4, !dbg !146
  %55 = load i32, ptr %failed, align 4, !dbg !146
  br label %if.end33, !dbg !146

else32:                                           ; preds = %if.end30
  br label %if.end33, !dbg !146

if.end33:                                         ; preds = %else32, %then31
  store ptr @square, ptr %chain, align 8, !dbg !148
  %56 = load ptr, ptr %chain, align 8, !dbg !148
  %57 = load ptr, ptr %chain, align 8, !dbg !149
  %58 = call i32 %57(i32 9), !dbg !149
  %59 = icmp ne i32 %58, 81, !dbg !149
  br i1 %59, label %then34, label %else35, !dbg !149

then34:                                           ; preds = %if.end33
  store i32 1, ptr %failed, align 4, !dbg !150
  %60 = load i32, ptr %failed, align 4, !dbg !150
  br label %if.end36, !dbg !150

else35:                                           ; preds = %if.end33
  br label %if.end36, !dbg !150

if.end36:                                         ; preds = %else35, %then34
  %61 = call i32 @applyAlias(ptr @addOne, i32 41), !dbg !152
  %62 = icmp ne i32 %61, 42, !dbg !152
  br i1 %62, label %then37, label %else38, !dbg !152

then37:                                           ; preds = %if.end36
  store i32 1, ptr %failed, align 4, !dbg !153
  %63 = load i32, ptr %failed, align 4, !dbg !153
  br label %if.end39, !dbg !153

else38:                                           ; preds = %if.end36
  br label %if.end39, !dbg !153

if.end39:                                         ; preds = %else38, %then37
  br i1 false, label %then40, label %else41, !dbg !155

then40:                                           ; preds = %if.end39
  store i32 1, ptr %failed, align 4, !dbg !156
  %64 = load i32, ptr %failed, align 4, !dbg !156
  br label %if.end42, !dbg !156

else41:                                           ; preds = %if.end39
  br label %if.end42, !dbg !156

if.end42:                                         ; preds = %else41, %then40
  %65 = getelementptr %struct.Rec, ptr %rec, i32 0, i32 0, !dbg !158
  store i32 5, ptr %65, align 4, !dbg !158
  %66 = load i32, ptr %65, align 4, !dbg !158
  %67 = getelementptr %struct.Rec, ptr %rec, i32 0, i32 1, !dbg !159
  store ptr @square, ptr %67, align 8, !dbg !159
  %68 = load ptr, ptr %67, align 8, !dbg !159
  %69 = getelementptr %struct.Rec, ptr %rec, i32 0, i32 1, !dbg !160
  %70 = load ptr, ptr %69, align 8, !dbg !160
  store ptr %70, ptr %fromMember, align 8, !dbg !160
  %71 = load ptr, ptr %fromMember, align 8, !dbg !160
  %72 = getelementptr %struct.Rec, ptr %rec, i32 0, i32 0, !dbg !161
  %73 = load i32, ptr %72, align 4, !dbg !161
  %74 = icmp ne i32 %73, 5, !dbg !161
  br i1 %74, label %lor.end, label %lor.rhs, !dbg !161

lor.rhs:                                          ; preds = %if.end42
  %75 = load ptr, ptr %fromMember, align 8, !dbg !161
  %76 = call i32 %75(i32 7), !dbg !161
  %77 = icmp ne i32 %76, 49, !dbg !161
  br label %lor.end, !dbg !161

lor.end:                                          ; preds = %lor.rhs, %if.end42
  %78 = phi i1 [ true, %if.end42 ], [ %77, %lor.rhs ], !dbg !161
  br i1 %78, label %then43, label %else44, !dbg !161

then43:                                           ; preds = %lor.end
  store i32 1, ptr %failed, align 4, !dbg !162
  %79 = load i32, ptr %failed, align 4, !dbg !162
  br label %if.end45, !dbg !162

else44:                                           ; preds = %lor.end
  br label %if.end45, !dbg !162

if.end45:                                         ; preds = %else44, %then43
  %80 = getelementptr %struct.Rec, ptr %rec, i32 0, i32 1, !dbg !164
  store ptr @addOne, ptr %80, align 8, !dbg !164
  %81 = load ptr, ptr %80, align 8, !dbg !164
  %82 = getelementptr %struct.Rec, ptr %rec, i32 0, i32 1, !dbg !165
  %83 = load ptr, ptr %82, align 8, !dbg !165
  store ptr %83, ptr %fromMember, align 8, !dbg !165
  %84 = load ptr, ptr %fromMember, align 8, !dbg !165
  %85 = getelementptr %struct.Rec, ptr %rec, i32 0, i32 0, !dbg !166
  %86 = load i32, ptr %85, align 4, !dbg !166
  %87 = icmp ne i32 %86, 5, !dbg !166
  br i1 %87, label %lor.end47, label %lor.rhs46, !dbg !166

lor.rhs46:                                        ; preds = %if.end45
  %88 = load ptr, ptr %fromMember, align 8, !dbg !166
  %89 = call i32 %88(i32 7), !dbg !166
  %90 = icmp ne i32 %89, 8, !dbg !166
  br label %lor.end47, !dbg !166

lor.end47:                                        ; preds = %lor.rhs46, %if.end45
  %91 = phi i1 [ true, %if.end45 ], [ %90, %lor.rhs46 ], !dbg !166
  br i1 %91, label %then48, label %else49, !dbg !166

then48:                                           ; preds = %lor.end47
  store i32 1, ptr %failed, align 4, !dbg !167
  %92 = load i32, ptr %failed, align 4, !dbg !167
  br label %if.end50, !dbg !167

else49:                                           ; preds = %lor.end47
  br label %if.end50, !dbg !167

if.end50:                                         ; preds = %else49, %then48
  store ptr @addOne, ptr %slot, align 8, !dbg !169
  %93 = load ptr, ptr %slot, align 8, !dbg !169
  %94 = load ptr, ptr %slot, align 8, !dbg !170
  store ptr %94, ptr %fromMember, align 8, !dbg !170
  %95 = load ptr, ptr %fromMember, align 8, !dbg !170
  %96 = load ptr, ptr %fromMember, align 8, !dbg !171
  %97 = call i32 %96(i32 41), !dbg !171
  %98 = icmp ne i32 %97, 42, !dbg !171
  br i1 %98, label %then51, label %else52, !dbg !171

then51:                                           ; preds = %if.end50
  store i32 1, ptr %failed, align 4, !dbg !172
  %99 = load i32, ptr %failed, align 4, !dbg !172
  br label %if.end53, !dbg !172

else52:                                           ; preds = %if.end50
  br label %if.end53, !dbg !172

if.end53:                                         ; preds = %else52, %then51
  %100 = getelementptr ptr, ptr %table, i32 0, !dbg !174
  store ptr @addOne, ptr %100, align 8, !dbg !174
  %101 = load ptr, ptr %100, align 8, !dbg !174
  %102 = getelementptr ptr, ptr %table, i32 1, !dbg !175
  store ptr @square, ptr %102, align 8, !dbg !175
  %103 = load ptr, ptr %102, align 8, !dbg !175
  %104 = getelementptr ptr, ptr %table, i32 2, !dbg !176
  store ptr @addOne, ptr %104, align 8, !dbg !176
  %105 = load ptr, ptr %104, align 8, !dbg !176
  store i32 0, ptr %total, align 4, !dbg !177
  %106 = load i32, ptr %total, align 4, !dbg !177
  store i32 0, ptr %i, align 4, !dbg !178
  %107 = load i32, ptr %i, align 4, !dbg !178
  br label %while.cond, !dbg !179

while.cond:                                       ; preds = %while.loop, %if.end53
  %108 = load i32, ptr %i, align 4, !dbg !179
  %109 = icmp slt i32 %108, 3, !dbg !179
  br i1 %109, label %while.loop, label %while.end, !dbg !179

while.loop:                                       ; preds = %while.cond
  %110 = load i32, ptr %i, align 4, !dbg !180
  %111 = getelementptr ptr, ptr %table, i32 %110, !dbg !180
  %112 = load ptr, ptr %111, align 8, !dbg !180
  store ptr %112, ptr %fromMember, align 8, !dbg !180
  %113 = load ptr, ptr %fromMember, align 8, !dbg !180
  %114 = load i32, ptr %total, align 4, !dbg !182
  %115 = load ptr, ptr %fromMember, align 8, !dbg !182
  %116 = load i32, ptr %i, align 4, !dbg !182
  %117 = add i32 %116, 1, !dbg !182
  %118 = call i32 %115(i32 %117), !dbg !182
  %119 = add i32 %114, %118, !dbg !182
  store i32 %119, ptr %total, align 4, !dbg !182
  %120 = load i32, ptr %total, align 4, !dbg !182
  %121 = load i32, ptr %i, align 4, !dbg !183
  %122 = add i32 %121, 1, !dbg !183
  store i32 %122, ptr %i, align 4, !dbg !183
  %123 = load i32, ptr %i, align 4, !dbg !183
  br label %while.cond, !dbg !183

while.end:                                        ; preds = %while.cond
  %124 = load i32, ptr %total, align 4, !dbg !184
  %125 = icmp ne i32 %124, 10, !dbg !184
  br i1 %125, label %then54, label %else55, !dbg !184

then54:                                           ; preds = %while.end
  store i32 1, ptr %failed, align 4, !dbg !185
  %126 = load i32, ptr %failed, align 4, !dbg !185
  br label %if.end56, !dbg !185

else55:                                           ; preds = %while.end
  br label %if.end56, !dbg !185

if.end56:                                         ; preds = %else55, %then54
  %127 = call ptr @pickOp(i32 0), !dbg !187
  store ptr %127, ptr %fromMember, align 8, !dbg !187
  %128 = load ptr, ptr %fromMember, align 8, !dbg !187
  %129 = load ptr, ptr %fromMember, align 8, !dbg !188
  %130 = call i32 %129(i32 10), !dbg !188
  %131 = icmp ne i32 %130, 11, !dbg !188
  br i1 %131, label %then57, label %else58, !dbg !188

then57:                                           ; preds = %if.end56
  store i32 1, ptr %failed, align 4, !dbg !189
  %132 = load i32, ptr %failed, align 4, !dbg !189
  br label %if.end59, !dbg !189

else58:                                           ; preds = %if.end56
  br label %if.end59, !dbg !189

if.end59:                                         ; preds = %else58, %then57
  %133 = call ptr @pickOp(i32 1), !dbg !191
  store ptr %133, ptr %fromMember, align 8, !dbg !191
  %134 = load ptr, ptr %fromMember, align 8, !dbg !191
  %135 = load ptr, ptr %fromMember, align 8, !dbg !192
  %136 = call i32 %135(i32 10), !dbg !192
  %137 = icmp ne i32 %136, 100, !dbg !192
  br i1 %137, label %then60, label %else61, !dbg !192

then60:                                           ; preds = %if.end59
  store i32 1, ptr %failed, align 4, !dbg !193
  %138 = load i32, ptr %failed, align 4, !dbg !193
  br label %if.end62, !dbg !193

else61:                                           ; preds = %if.end59
  br label %if.end62, !dbg !193

if.end62:                                         ; preds = %else61, %then60
  %139 = load i32, ptr %failed, align 4, !dbg !195
  %140 = icmp eq i32 %139, 0, !dbg !195
  br i1 %140, label %then63, label %else64, !dbg !195

then63:                                           ; preds = %if.end62
  %141 = call i32 (ptr, ...) @printf(ptr @0), !dbg !196
  ret i32 0, !dbg !198

else64:                                           ; preds = %if.end62
  br label %if.end65, !dbg !198

if.end65:                                         ; preds = %else64
  %142 = call i32 (ptr, ...) @printf(ptr @1), !dbg !199
  ret i32 1, !dbg !200
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "49.func_pointer.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "addOne", linkageName: "addOne", scope: null, file: !3, line: 29, type: !5, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "x", arg: 1, scope: !4, file: !3, line: 29, type: !7)
!9 = !DILocation(line: 29, column: 5, scope: !4)
!10 = !DILocation(line: 29, column: 21, scope: !4)
!11 = distinct !DISubprogram(name: "square", linkageName: "square", scope: null, file: !3, line: 30, type: !5, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2)
!12 = !DILocalVariable(name: "x", arg: 1, scope: !11, file: !3, line: 30, type: !7)
!13 = !DILocation(line: 30, column: 5, scope: !11)
!14 = !DILocation(line: 30, column: 21, scope: !11)
!15 = distinct !DISubprogram(name: "addTwo", linkageName: "addTwo", scope: null, file: !3, line: 31, type: !16, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2)
!16 = !DISubroutineType(types: !17)
!17 = !{!7, !7, !7}
!18 = !DILocalVariable(name: "b", arg: 2, scope: !15, file: !3, line: 31, type: !7)
!19 = !DILocation(line: 31, column: 5, scope: !15)
!20 = !DILocalVariable(name: "a", arg: 1, scope: !15, file: !3, line: 31, type: !7)
!21 = !DILocation(line: 31, column: 28, scope: !15)
!22 = distinct !DISubprogram(name: "apply", linkageName: "apply", scope: null, file: !3, line: 33, type: !23, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!7, !25, !7}
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!27 = !DILocalVariable(name: "n", arg: 2, scope: !22, file: !3, line: 33, type: !7)
!28 = !DILocation(line: 33, column: 5, scope: !22)
!29 = !DILocalVariable(name: "fn", arg: 1, scope: !22, file: !3, line: 33, type: !25)
!30 = !DILocation(line: 33, column: 36, scope: !22)
!31 = distinct !DISubprogram(name: "applyAlias", linkageName: "applyAlias", scope: null, file: !3, line: 39, type: !23, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2)
!32 = !DILocalVariable(name: "n", arg: 2, scope: !31, file: !3, line: 39, type: !7)
!33 = !DILocation(line: 39, column: 5, scope: !31)
!34 = !DILocalVariable(name: "fn", arg: 1, scope: !31, file: !3, line: 39, type: !25)
!35 = !DILocation(line: 39, column: 32, scope: !31)
!36 = distinct !DISubprogram(name: "pickOp", linkageName: "pickOp", scope: null, file: !3, line: 52, type: !37, scopeLine: 52, spFlags: DISPFlagDefinition, unit: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{!25, !7}
!39 = !DILocalVariable(name: "which", arg: 1, scope: !36, file: !3, line: 52, type: !7)
!40 = !DILocation(line: 52, column: 4, scope: !36)
!41 = !DILocation(line: 53, column: 3, scope: !36)
!42 = !DILocation(line: 54, column: 5, scope: !43)
!43 = distinct !DILexicalBlock(scope: !36, file: !3, line: 53, column: 19)
!44 = !DILocation(line: 56, column: 3, scope: !36)
!45 = distinct !DISubprogram(name: "sumWith", linkageName: "sumWith", scope: null, file: !3, line: 59, type: !46, scopeLine: 59, spFlags: DISPFlagDefinition, unit: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!7, !25, !7, !7}
!48 = !DILocalVariable(name: "i", scope: !45, file: !3, line: 61, type: !7)
!49 = !DILocation(line: 61, column: 3, scope: !45)
!50 = !DILocalVariable(name: "total", scope: !45, file: !3, line: 60, type: !7)
!51 = !DILocation(line: 60, column: 3, scope: !45)
!52 = !DILocalVariable(name: "to", arg: 3, scope: !45, file: !3, line: 59, type: !7)
!53 = !DILocation(line: 59, column: 5, scope: !45)
!54 = !DILocalVariable(name: "from", arg: 2, scope: !45, file: !3, line: 59, type: !7)
!55 = !DILocalVariable(name: "fn", arg: 1, scope: !45, file: !3, line: 59, type: !25)
!56 = !DILocation(line: 63, column: 3, scope: !45)
!57 = !DILocation(line: 64, column: 5, scope: !58)
!58 = distinct !DILexicalBlock(scope: !45, file: !3, line: 63, column: 19)
!59 = !DILocation(line: 65, column: 5, scope: !58)
!60 = !DILocation(line: 67, column: 3, scope: !45)
!61 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 73, type: !62, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!7}
!64 = !DILocalVariable(name: "total", scope: !65, file: !3, line: 173, type: !7)
!65 = distinct !DILexicalBlock(scope: !61, file: !3, line: 167, column: 3)
!66 = !DILocation(line: 173, column: 5, scope: !65)
!67 = !DILocalVariable(name: "i", scope: !65, file: !3, line: 172, type: !7)
!68 = !DILocation(line: 172, column: 5, scope: !65)
!69 = !DILocalVariable(name: "fromMember", scope: !65, file: !3, line: 171, type: !25)
!70 = !DILocation(line: 171, column: 5, scope: !65)
!71 = !DILocalVariable(name: "table", scope: !65, file: !3, line: 170, type: !72)
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 192, align: 64, elements: !73)
!73 = !{!74}
!74 = !DISubrange(count: 3, lowerBound: 0)
!75 = !DILocation(line: 170, column: 5, scope: !65)
!76 = !DILocalVariable(name: "slot", scope: !65, file: !3, line: 169, type: !77)
!77 = !DICompositeType(tag: DW_TAG_union_type, name: "Slot", file: !3, size: 64, align: 64, elements: !78)
!78 = !{!79, !80}
!79 = !DIDerivedType(tag: DW_TAG_member, name: "fn", file: !3, baseType: !25, size: 64, align: 64)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "n", file: !3, baseType: !7, size: 32, align: 32)
!81 = !DILocation(line: 169, column: 5, scope: !65)
!82 = !DILocalVariable(name: "rec", scope: !65, file: !3, line: 168, type: !83)
!83 = !DICompositeType(tag: DW_TAG_structure_type, name: "Rec", file: !3, size: 128, align: 64, elements: !84)
!84 = !{!85, !86}
!85 = !DIDerivedType(tag: DW_TAG_member, name: "id", file: !3, baseType: !7, size: 32, align: 32)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "fn", file: !3, baseType: !25, size: 64, align: 64, offset: 64)
!87 = !DILocation(line: 168, column: 5, scope: !65)
!88 = !DILocalVariable(name: "chain", scope: !89, file: !3, line: 132, type: !25)
!89 = distinct !DILexicalBlock(scope: !61, file: !3, line: 129, column: 3)
!90 = !DILocation(line: 132, column: 5, scope: !89)
!91 = !DILocalVariable(name: "twoArgs", scope: !89, file: !3, line: 131, type: !25)
!92 = !DILocation(line: 131, column: 5, scope: !89)
!93 = !DILocalVariable(name: "viaAlias", scope: !89, file: !3, line: 130, type: !25)
!94 = !DILocation(line: 130, column: 5, scope: !89)
!95 = !DILocalVariable(name: "r", scope: !61, file: !3, line: 77, type: !7)
!96 = !DILocation(line: 77, column: 3, scope: !61)
!97 = !DILocalVariable(name: "q", scope: !61, file: !3, line: 76, type: !25)
!98 = !DILocation(line: 76, column: 3, scope: !61)
!99 = !DILocalVariable(name: "p", scope: !61, file: !3, line: 75, type: !25)
!100 = !DILocation(line: 75, column: 3, scope: !61)
!101 = !DILocalVariable(name: "failed", scope: !61, file: !3, line: 74, type: !7)
!102 = !DILocation(line: 74, column: 3, scope: !61)
!103 = !DILocation(line: 80, column: 3, scope: !61)
!104 = !DILocation(line: 81, column: 3, scope: !61)
!105 = !DILocation(line: 82, column: 5, scope: !106)
!106 = distinct !DILexicalBlock(scope: !61, file: !3, line: 81, column: 20)
!107 = !DILocation(line: 86, column: 3, scope: !61)
!108 = !DILocation(line: 87, column: 3, scope: !61)
!109 = !DILocation(line: 88, column: 5, scope: !110)
!110 = distinct !DILexicalBlock(scope: !61, file: !3, line: 87, column: 19)
!111 = !DILocation(line: 92, column: 3, scope: !61)
!112 = !DILocation(line: 93, column: 3, scope: !61)
!113 = !DILocation(line: 94, column: 5, scope: !114)
!114 = distinct !DILexicalBlock(scope: !61, file: !3, line: 93, column: 21)
!115 = !DILocation(line: 98, column: 3, scope: !61)
!116 = !DILocation(line: 99, column: 3, scope: !61)
!117 = !DILocation(line: 100, column: 5, scope: !118)
!118 = distinct !DILexicalBlock(scope: !61, file: !3, line: 99, column: 16)
!119 = !DILocation(line: 104, column: 3, scope: !61)
!120 = !DILocation(line: 105, column: 5, scope: !121)
!121 = distinct !DILexicalBlock(scope: !61, file: !3, line: 104, column: 32)
!122 = !DILocation(line: 107, column: 3, scope: !61)
!123 = !DILocation(line: 108, column: 5, scope: !124)
!124 = distinct !DILexicalBlock(scope: !61, file: !3, line: 107, column: 31)
!125 = !DILocation(line: 112, column: 3, scope: !61)
!126 = !DILocation(line: 113, column: 5, scope: !127)
!127 = distinct !DILexicalBlock(scope: !61, file: !3, line: 112, column: 36)
!128 = !DILocation(line: 117, column: 3, scope: !61)
!129 = !DILocation(line: 118, column: 3, scope: !61)
!130 = !DILocation(line: 119, column: 5, scope: !131)
!131 = distinct !DILexicalBlock(scope: !61, file: !3, line: 118, column: 26)
!132 = !DILocation(line: 123, column: 3, scope: !61)
!133 = !DILocation(line: 124, column: 3, scope: !61)
!134 = !DILocation(line: 125, column: 5, scope: !135)
!135 = distinct !DILexicalBlock(scope: !61, file: !3, line: 124, column: 18)
!136 = !DILocation(line: 134, column: 5, scope: !89)
!137 = !DILocation(line: 135, column: 5, scope: !89)
!138 = !DILocation(line: 136, column: 7, scope: !139)
!139 = distinct !DILexicalBlock(scope: !89, file: !3, line: 135, column: 29)
!140 = !DILocation(line: 139, column: 5, scope: !89)
!141 = !DILocation(line: 140, column: 5, scope: !89)
!142 = !DILocation(line: 141, column: 7, scope: !143)
!143 = distinct !DILexicalBlock(scope: !89, file: !3, line: 140, column: 28)
!144 = !DILocation(line: 144, column: 5, scope: !89)
!145 = !DILocation(line: 145, column: 5, scope: !89)
!146 = !DILocation(line: 146, column: 7, scope: !147)
!147 = distinct !DILexicalBlock(scope: !89, file: !3, line: 145, column: 29)
!148 = !DILocation(line: 150, column: 5, scope: !89)
!149 = !DILocation(line: 151, column: 5, scope: !89)
!150 = !DILocation(line: 152, column: 7, scope: !151)
!151 = distinct !DILexicalBlock(scope: !89, file: !3, line: 151, column: 25)
!152 = !DILocation(line: 156, column: 5, scope: !89)
!153 = !DILocation(line: 157, column: 7, scope: !154)
!154 = distinct !DILexicalBlock(scope: !89, file: !3, line: 156, column: 39)
!155 = !DILocation(line: 161, column: 5, scope: !89)
!156 = !DILocation(line: 162, column: 7, scope: !157)
!157 = distinct !DILexicalBlock(scope: !89, file: !3, line: 161, column: 26)
!158 = !DILocation(line: 176, column: 5, scope: !65)
!159 = !DILocation(line: 177, column: 5, scope: !65)
!160 = !DILocation(line: 178, column: 5, scope: !65)
!161 = !DILocation(line: 179, column: 5, scope: !65)
!162 = !DILocation(line: 180, column: 7, scope: !163)
!163 = distinct !DILexicalBlock(scope: !65, file: !3, line: 179, column: 45)
!164 = !DILocation(line: 184, column: 5, scope: !65)
!165 = !DILocation(line: 185, column: 5, scope: !65)
!166 = !DILocation(line: 186, column: 5, scope: !65)
!167 = !DILocation(line: 187, column: 7, scope: !168)
!168 = distinct !DILexicalBlock(scope: !65, file: !3, line: 186, column: 44)
!169 = !DILocation(line: 191, column: 5, scope: !65)
!170 = !DILocation(line: 192, column: 5, scope: !65)
!171 = !DILocation(line: 193, column: 5, scope: !65)
!172 = !DILocation(line: 194, column: 7, scope: !173)
!173 = distinct !DILexicalBlock(scope: !65, file: !3, line: 193, column: 31)
!174 = !DILocation(line: 198, column: 5, scope: !65)
!175 = !DILocation(line: 199, column: 5, scope: !65)
!176 = !DILocation(line: 200, column: 5, scope: !65)
!177 = !DILocation(line: 201, column: 5, scope: !65)
!178 = !DILocation(line: 202, column: 5, scope: !65)
!179 = !DILocation(line: 203, column: 5, scope: !65)
!180 = !DILocation(line: 204, column: 7, scope: !181)
!181 = distinct !DILexicalBlock(scope: !65, file: !3, line: 203, column: 19)
!182 = !DILocation(line: 205, column: 7, scope: !181)
!183 = !DILocation(line: 206, column: 7, scope: !181)
!184 = !DILocation(line: 208, column: 5, scope: !65)
!185 = !DILocation(line: 209, column: 7, scope: !186)
!186 = distinct !DILexicalBlock(scope: !65, file: !3, line: 208, column: 22)
!187 = !DILocation(line: 213, column: 5, scope: !65)
!188 = !DILocation(line: 214, column: 5, scope: !65)
!189 = !DILocation(line: 215, column: 7, scope: !190)
!190 = distinct !DILexicalBlock(scope: !65, file: !3, line: 214, column: 31)
!191 = !DILocation(line: 217, column: 5, scope: !65)
!192 = !DILocation(line: 218, column: 5, scope: !65)
!193 = !DILocation(line: 219, column: 7, scope: !194)
!194 = distinct !DILexicalBlock(scope: !65, file: !3, line: 218, column: 32)
!195 = !DILocation(line: 223, column: 3, scope: !61)
!196 = !DILocation(line: 224, column: 5, scope: !197)
!197 = distinct !DILexicalBlock(scope: !61, file: !3, line: 223, column: 20)
!198 = !DILocation(line: 225, column: 5, scope: !197)
!199 = !DILocation(line: 227, column: 3, scope: !61)
!200 = !DILocation(line: 228, column: 3, scope: !61)
