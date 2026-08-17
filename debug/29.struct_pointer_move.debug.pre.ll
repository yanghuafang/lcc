; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

%struct.Data = type { i32, i32 }

@0 = private unnamed_addr constant [31 x i8] c"29.struct_pointer_move.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"29.struct_pointer_move.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !4 {
entry:
  %p = alloca ptr, align 8
    #dbg_declare(ptr %p, !8, !DIExpression(), !11)
  %val = alloca i32, align 4
    #dbg_declare(ptr %val, !12, !DIExpression(), !13)
  %id = alloca i32, align 4
    #dbg_declare(ptr %id, !14, !DIExpression(), !15)
  %data = alloca [4 x %struct.Data], align 8
    #dbg_declare(ptr %data, !16, !DIExpression(), !20)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !21, !DIExpression(), !22)
  store i32 0, ptr %err, align 4, !dbg !22
  %0 = getelementptr %struct.Data, ptr %data, i32 0, !dbg !23
  %1 = getelementptr %struct.Data, ptr %0, i32 0, i32 0, !dbg !23
  store i32 10, ptr %1, align 4, !dbg !23
  %2 = load i32, ptr %1, align 4, !dbg !23
  %3 = getelementptr %struct.Data, ptr %data, i32 0, !dbg !24
  %4 = getelementptr %struct.Data, ptr %3, i32 0, i32 1, !dbg !24
  store i32 12, ptr %4, align 4, !dbg !24
  %5 = load i32, ptr %4, align 4, !dbg !24
  %6 = getelementptr %struct.Data, ptr %data, i32 1, !dbg !25
  %7 = getelementptr %struct.Data, ptr %6, i32 0, i32 0, !dbg !25
  store i32 20, ptr %7, align 4, !dbg !25
  %8 = load i32, ptr %7, align 4, !dbg !25
  %9 = getelementptr %struct.Data, ptr %data, i32 1, !dbg !26
  %10 = getelementptr %struct.Data, ptr %9, i32 0, i32 1, !dbg !26
  store i32 24, ptr %10, align 4, !dbg !26
  %11 = load i32, ptr %10, align 4, !dbg !26
  %12 = getelementptr %struct.Data, ptr %data, i32 2, !dbg !27
  %13 = getelementptr %struct.Data, ptr %12, i32 0, i32 0, !dbg !27
  store i32 30, ptr %13, align 4, !dbg !27
  %14 = load i32, ptr %13, align 4, !dbg !27
  %15 = getelementptr %struct.Data, ptr %data, i32 2, !dbg !28
  %16 = getelementptr %struct.Data, ptr %15, i32 0, i32 1, !dbg !28
  store i32 36, ptr %16, align 4, !dbg !28
  %17 = load i32, ptr %16, align 4, !dbg !28
  %18 = getelementptr %struct.Data, ptr %data, i32 3, !dbg !29
  %19 = getelementptr %struct.Data, ptr %18, i32 0, i32 0, !dbg !29
  store i32 40, ptr %19, align 4, !dbg !29
  %20 = load i32, ptr %19, align 4, !dbg !29
  %21 = getelementptr %struct.Data, ptr %data, i32 3, !dbg !30
  %22 = getelementptr %struct.Data, ptr %21, i32 0, i32 1, !dbg !30
  store i32 48, ptr %22, align 4, !dbg !30
  %23 = load i32, ptr %22, align 4, !dbg !30
  store ptr %data, ptr %p, align 8, !dbg !11
  %24 = load ptr, ptr %p, align 8, !dbg !31
  %25 = getelementptr %struct.Data, ptr %24, i32 0, i32 0, !dbg !31
  %26 = load i32, ptr %25, align 4, !dbg !31
  store i32 %26, ptr %id, align 4, !dbg !31
  %27 = load i32, ptr %id, align 4, !dbg !31
  %28 = load ptr, ptr %p, align 8, !dbg !32
  %29 = getelementptr %struct.Data, ptr %28, i32 0, i32 1, !dbg !32
  %30 = load i32, ptr %29, align 4, !dbg !32
  store i32 %30, ptr %val, align 4, !dbg !32
  %31 = load i32, ptr %val, align 4, !dbg !32
  %32 = load i32, ptr %id, align 4, !dbg !33
  %33 = icmp ne i32 %32, 10, !dbg !33
  br i1 %33, label %then, label %else, !dbg !33

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !34
  %34 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end, !dbg !34

else:                                             ; preds = %entry
  br label %if.end, !dbg !34

if.end:                                           ; preds = %else, %then
  %35 = load i32, ptr %val, align 4, !dbg !35
  %36 = icmp ne i32 %35, 12, !dbg !35
  br i1 %36, label %then1, label %else2, !dbg !35

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !36
  %37 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end3, !dbg !36

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !36

if.end3:                                          ; preds = %else2, %then1
  %38 = load ptr, ptr %p, align 8, !dbg !37
  %39 = getelementptr %struct.Data, ptr %38, i32 1, !dbg !37
  store ptr %39, ptr %p, align 8, !dbg !37
  %40 = load ptr, ptr %p, align 8, !dbg !37
  %41 = load ptr, ptr %p, align 8, !dbg !38
  %42 = getelementptr %struct.Data, ptr %41, i32 0, i32 0, !dbg !38
  %43 = load i32, ptr %42, align 4, !dbg !38
  store i32 %43, ptr %id, align 4, !dbg !38
  %44 = load i32, ptr %id, align 4, !dbg !38
  %45 = load ptr, ptr %p, align 8, !dbg !39
  %46 = getelementptr %struct.Data, ptr %45, i32 0, i32 1, !dbg !39
  %47 = load i32, ptr %46, align 4, !dbg !39
  store i32 %47, ptr %val, align 4, !dbg !39
  %48 = load i32, ptr %val, align 4, !dbg !39
  %49 = load i32, ptr %id, align 4, !dbg !40
  %50 = icmp ne i32 %49, 20, !dbg !40
  br i1 %50, label %then4, label %else5, !dbg !40

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !41
  %51 = load i32, ptr %err, align 4, !dbg !41
  br label %if.end6, !dbg !41

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !41

if.end6:                                          ; preds = %else5, %then4
  %52 = load i32, ptr %val, align 4, !dbg !42
  %53 = icmp ne i32 %52, 24, !dbg !42
  br i1 %53, label %then7, label %else8, !dbg !42

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !43
  %54 = load i32, ptr %err, align 4, !dbg !43
  br label %if.end9, !dbg !43

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !43

if.end9:                                          ; preds = %else8, %then7
  %55 = load ptr, ptr %p, align 8, !dbg !44
  %56 = getelementptr %struct.Data, ptr %55, i64 1, !dbg !44
  store ptr %56, ptr %p, align 8, !dbg !44
  %57 = load ptr, ptr %p, align 8, !dbg !44
  %58 = load ptr, ptr %p, align 8, !dbg !45
  %59 = getelementptr %struct.Data, ptr %58, i32 0, i32 0, !dbg !45
  %60 = load i32, ptr %59, align 4, !dbg !45
  store i32 %60, ptr %id, align 4, !dbg !45
  %61 = load i32, ptr %id, align 4, !dbg !45
  %62 = load i32, ptr %id, align 4, !dbg !46
  %63 = icmp ne i32 %62, 30, !dbg !46
  br i1 %63, label %then10, label %else11, !dbg !46

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !47
  %64 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end12, !dbg !47

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !47

if.end12:                                         ; preds = %else11, %then10
  %65 = load ptr, ptr %p, align 8, !dbg !48
  %66 = getelementptr %struct.Data, ptr %65, i64 1, !dbg !48
  store ptr %66, ptr %p, align 8, !dbg !48
  %67 = load ptr, ptr %p, align 8, !dbg !49
  %68 = getelementptr %struct.Data, ptr %67, i32 0, i32 0, !dbg !49
  %69 = load i32, ptr %68, align 4, !dbg !49
  store i32 %69, ptr %id, align 4, !dbg !49
  %70 = load i32, ptr %id, align 4, !dbg !49
  %71 = load ptr, ptr %p, align 8, !dbg !50
  %72 = getelementptr %struct.Data, ptr %71, i32 0, i32 1, !dbg !50
  %73 = load i32, ptr %72, align 4, !dbg !50
  store i32 %73, ptr %val, align 4, !dbg !50
  %74 = load i32, ptr %val, align 4, !dbg !50
  %75 = load i32, ptr %id, align 4, !dbg !51
  %76 = icmp ne i32 %75, 40, !dbg !51
  br i1 %76, label %then13, label %else14, !dbg !51

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !52
  %77 = load i32, ptr %err, align 4, !dbg !52
  br label %if.end15, !dbg !52

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !52

if.end15:                                         ; preds = %else14, %then13
  %78 = load i32, ptr %val, align 4, !dbg !53
  %79 = icmp ne i32 %78, 48, !dbg !53
  br i1 %79, label %then16, label %else17, !dbg !53

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !54
  %80 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end18, !dbg !54

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !54

if.end18:                                         ; preds = %else17, %then16
  %81 = getelementptr %struct.Data, ptr %data, i32 3, !dbg !55
  store ptr %81, ptr %p, align 8, !dbg !55
  %82 = load ptr, ptr %p, align 8, !dbg !55
  %83 = load ptr, ptr %p, align 8, !dbg !56
  %84 = getelementptr %struct.Data, ptr %83, i32 -1, !dbg !56
  store ptr %84, ptr %p, align 8, !dbg !56
  %85 = load ptr, ptr %p, align 8, !dbg !56
  %86 = load ptr, ptr %p, align 8, !dbg !57
  %87 = getelementptr %struct.Data, ptr %86, i32 0, i32 0, !dbg !57
  %88 = load i32, ptr %87, align 4, !dbg !57
  store i32 %88, ptr %id, align 4, !dbg !57
  %89 = load i32, ptr %id, align 4, !dbg !57
  %90 = load i32, ptr %id, align 4, !dbg !58
  %91 = icmp ne i32 %90, 30, !dbg !58
  br i1 %91, label %then19, label %else20, !dbg !58

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !59
  %92 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end21, !dbg !59

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !59

if.end21:                                         ; preds = %else20, %then19
  %93 = load ptr, ptr %p, align 8, !dbg !60
  %94 = getelementptr %struct.Data, ptr %93, i64 -1, !dbg !60
  store ptr %94, ptr %p, align 8, !dbg !60
  %95 = load ptr, ptr %p, align 8, !dbg !60
  %96 = load ptr, ptr %p, align 8, !dbg !61
  %97 = getelementptr %struct.Data, ptr %96, i32 0, i32 0, !dbg !61
  %98 = load i32, ptr %97, align 4, !dbg !61
  store i32 %98, ptr %id, align 4, !dbg !61
  %99 = load i32, ptr %id, align 4, !dbg !61
  %100 = load i32, ptr %id, align 4, !dbg !62
  %101 = icmp ne i32 %100, 20, !dbg !62
  br i1 %101, label %then22, label %else23, !dbg !62

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !63
  %102 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end24, !dbg !63

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !63

if.end24:                                         ; preds = %else23, %then22
  %103 = load ptr, ptr %p, align 8, !dbg !64
  %104 = getelementptr %struct.Data, ptr %103, i64 -1, !dbg !64
  store ptr %104, ptr %p, align 8, !dbg !64
  %105 = load ptr, ptr %p, align 8, !dbg !65
  %106 = getelementptr %struct.Data, ptr %105, i32 0, i32 0, !dbg !65
  %107 = load i32, ptr %106, align 4, !dbg !65
  store i32 %107, ptr %id, align 4, !dbg !65
  %108 = load i32, ptr %id, align 4, !dbg !65
  %109 = load i32, ptr %id, align 4, !dbg !66
  %110 = icmp ne i32 %109, 10, !dbg !66
  br i1 %110, label %then25, label %else26, !dbg !66

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !67
  %111 = load i32, ptr %err, align 4, !dbg !67
  br label %if.end27, !dbg !67

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !67

if.end27:                                         ; preds = %else26, %then25
  %112 = load i32, ptr %err, align 4, !dbg !68
  %113 = icmp eq i32 %112, 0, !dbg !68
  br i1 %113, label %then28, label %else29, !dbg !68

then28:                                           ; preds = %if.end27
  %114 = call i32 (ptr, ...) @printf(ptr @0), !dbg !69
  br label %if.end30, !dbg !69

else29:                                           ; preds = %if.end27
  %115 = call i32 (ptr, ...) @printf(ptr @1), !dbg !71
  br label %if.end30, !dbg !71

if.end30:                                         ; preds = %else29, %then28
  %116 = load i32, ptr %err, align 4, !dbg !73
  ret i32 %116, !dbg !73
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "29.struct_pointer_move.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 10, type: !5, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "p", scope: !4, file: !3, line: 25, type: !9)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!11 = !DILocation(line: 25, column: 3, scope: !4)
!12 = !DILocalVariable(name: "val", scope: !4, file: !3, line: 14, type: !7)
!13 = !DILocation(line: 14, column: 3, scope: !4)
!14 = !DILocalVariable(name: "id", scope: !4, file: !3, line: 13, type: !7)
!15 = !DILocation(line: 13, column: 3, scope: !4)
!16 = !DILocalVariable(name: "data", scope: !4, file: !3, line: 12, type: !17)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 256, align: 32, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 4, lowerBound: 0)
!20 = !DILocation(line: 12, column: 3, scope: !4)
!21 = !DILocalVariable(name: "err", scope: !4, file: !3, line: 11, type: !7)
!22 = !DILocation(line: 11, column: 3, scope: !4)
!23 = !DILocation(line: 16, column: 3, scope: !4)
!24 = !DILocation(line: 17, column: 3, scope: !4)
!25 = !DILocation(line: 18, column: 3, scope: !4)
!26 = !DILocation(line: 19, column: 3, scope: !4)
!27 = !DILocation(line: 20, column: 3, scope: !4)
!28 = !DILocation(line: 21, column: 3, scope: !4)
!29 = !DILocation(line: 22, column: 3, scope: !4)
!30 = !DILocation(line: 23, column: 3, scope: !4)
!31 = !DILocation(line: 26, column: 3, scope: !4)
!32 = !DILocation(line: 27, column: 3, scope: !4)
!33 = !DILocation(line: 28, column: 3, scope: !4)
!34 = !DILocation(line: 28, column: 17, scope: !4)
!35 = !DILocation(line: 29, column: 3, scope: !4)
!36 = !DILocation(line: 29, column: 18, scope: !4)
!37 = !DILocation(line: 30, column: 3, scope: !4)
!38 = !DILocation(line: 31, column: 3, scope: !4)
!39 = !DILocation(line: 32, column: 3, scope: !4)
!40 = !DILocation(line: 33, column: 3, scope: !4)
!41 = !DILocation(line: 33, column: 17, scope: !4)
!42 = !DILocation(line: 34, column: 3, scope: !4)
!43 = !DILocation(line: 34, column: 18, scope: !4)
!44 = !DILocation(line: 35, column: 3, scope: !4)
!45 = !DILocation(line: 36, column: 3, scope: !4)
!46 = !DILocation(line: 37, column: 3, scope: !4)
!47 = !DILocation(line: 37, column: 17, scope: !4)
!48 = !DILocation(line: 38, column: 3, scope: !4)
!49 = !DILocation(line: 39, column: 3, scope: !4)
!50 = !DILocation(line: 40, column: 3, scope: !4)
!51 = !DILocation(line: 41, column: 3, scope: !4)
!52 = !DILocation(line: 41, column: 17, scope: !4)
!53 = !DILocation(line: 42, column: 3, scope: !4)
!54 = !DILocation(line: 42, column: 18, scope: !4)
!55 = !DILocation(line: 44, column: 3, scope: !4)
!56 = !DILocation(line: 45, column: 3, scope: !4)
!57 = !DILocation(line: 46, column: 3, scope: !4)
!58 = !DILocation(line: 47, column: 3, scope: !4)
!59 = !DILocation(line: 47, column: 17, scope: !4)
!60 = !DILocation(line: 48, column: 3, scope: !4)
!61 = !DILocation(line: 49, column: 3, scope: !4)
!62 = !DILocation(line: 50, column: 3, scope: !4)
!63 = !DILocation(line: 50, column: 17, scope: !4)
!64 = !DILocation(line: 51, column: 3, scope: !4)
!65 = !DILocation(line: 52, column: 3, scope: !4)
!66 = !DILocation(line: 53, column: 3, scope: !4)
!67 = !DILocation(line: 53, column: 17, scope: !4)
!68 = !DILocation(line: 55, column: 3, scope: !4)
!69 = !DILocation(line: 56, column: 5, scope: !70)
!70 = distinct !DILexicalBlock(scope: !4, file: !3, line: 55, column: 17)
!71 = !DILocation(line: 58, column: 5, scope: !72)
!72 = distinct !DILexicalBlock(scope: !4, file: !3, line: 57, column: 10)
!73 = !DILocation(line: 60, column: 3, scope: !4)
