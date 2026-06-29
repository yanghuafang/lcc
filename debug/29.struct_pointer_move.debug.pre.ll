; ModuleID = 'lcc'
source_filename = "lcc"

%struct.Data = type { i32, i32 }

@0 = private unnamed_addr constant [31 x i8] c"29.struct_pointer_move.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"29.struct_pointer_move.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() !dbg !2 {
entry:
  %p = alloca ptr, align 8
    #dbg_declare(ptr %p, !6, !DIExpression(), !9)
  %val = alloca i32, align 4
    #dbg_declare(ptr %val, !10, !DIExpression(), !11)
  %id = alloca i32, align 4
    #dbg_declare(ptr %id, !12, !DIExpression(), !13)
  %data = alloca [4 x %struct.Data], align 8
    #dbg_declare(ptr %data, !14, !DIExpression(), !18)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !19, !DIExpression(), !20)
  store i32 0, ptr %err, align 4, !dbg !20
  %0 = getelementptr %struct.Data, ptr %data, i32 0, !dbg !21
  %1 = getelementptr %struct.Data, ptr %0, i32 0, i32 0, !dbg !21
  store i32 10, ptr %1, align 4, !dbg !21
  %2 = load i32, ptr %1, align 4, !dbg !21
  %3 = getelementptr %struct.Data, ptr %data, i32 0, !dbg !22
  %4 = getelementptr %struct.Data, ptr %3, i32 0, i32 1, !dbg !22
  store i32 12, ptr %4, align 4, !dbg !22
  %5 = load i32, ptr %4, align 4, !dbg !22
  %6 = getelementptr %struct.Data, ptr %data, i32 1, !dbg !23
  %7 = getelementptr %struct.Data, ptr %6, i32 0, i32 0, !dbg !23
  store i32 20, ptr %7, align 4, !dbg !23
  %8 = load i32, ptr %7, align 4, !dbg !23
  %9 = getelementptr %struct.Data, ptr %data, i32 1, !dbg !24
  %10 = getelementptr %struct.Data, ptr %9, i32 0, i32 1, !dbg !24
  store i32 24, ptr %10, align 4, !dbg !24
  %11 = load i32, ptr %10, align 4, !dbg !24
  %12 = getelementptr %struct.Data, ptr %data, i32 2, !dbg !25
  %13 = getelementptr %struct.Data, ptr %12, i32 0, i32 0, !dbg !25
  store i32 30, ptr %13, align 4, !dbg !25
  %14 = load i32, ptr %13, align 4, !dbg !25
  %15 = getelementptr %struct.Data, ptr %data, i32 2, !dbg !26
  %16 = getelementptr %struct.Data, ptr %15, i32 0, i32 1, !dbg !26
  store i32 36, ptr %16, align 4, !dbg !26
  %17 = load i32, ptr %16, align 4, !dbg !26
  %18 = getelementptr %struct.Data, ptr %data, i32 3, !dbg !27
  %19 = getelementptr %struct.Data, ptr %18, i32 0, i32 0, !dbg !27
  store i32 40, ptr %19, align 4, !dbg !27
  %20 = load i32, ptr %19, align 4, !dbg !27
  %21 = getelementptr %struct.Data, ptr %data, i32 3, !dbg !28
  %22 = getelementptr %struct.Data, ptr %21, i32 0, i32 1, !dbg !28
  store i32 48, ptr %22, align 4, !dbg !28
  %23 = load i32, ptr %22, align 4, !dbg !28
  store ptr %data, ptr %p, align 8, !dbg !9
  %24 = load ptr, ptr %p, align 8, !dbg !29
  %25 = getelementptr %struct.Data, ptr %24, i32 0, i32 0, !dbg !29
  %26 = load i32, ptr %25, align 4, !dbg !29
  store i32 %26, ptr %id, align 4, !dbg !29
  %27 = load i32, ptr %id, align 4, !dbg !29
  %28 = load ptr, ptr %p, align 8, !dbg !30
  %29 = getelementptr %struct.Data, ptr %28, i32 0, i32 1, !dbg !30
  %30 = load i32, ptr %29, align 4, !dbg !30
  store i32 %30, ptr %val, align 4, !dbg !30
  %31 = load i32, ptr %val, align 4, !dbg !30
  %32 = load i32, ptr %id, align 4, !dbg !31
  %33 = icmp ne i32 %32, 10, !dbg !31
  br i1 %33, label %then, label %else, !dbg !31

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !32
  %34 = load i32, ptr %err, align 4, !dbg !32
  br label %if.end, !dbg !32

else:                                             ; preds = %entry
  br label %if.end, !dbg !32

if.end:                                           ; preds = %else, %then
  %35 = load i32, ptr %val, align 4, !dbg !33
  %36 = icmp ne i32 %35, 12, !dbg !33
  br i1 %36, label %then1, label %else2, !dbg !33

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !34
  %37 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end3, !dbg !34

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !34

if.end3:                                          ; preds = %else2, %then1
  %38 = load ptr, ptr %p, align 8, !dbg !35
  %39 = getelementptr %struct.Data, ptr %38, i32 1, !dbg !35
  store ptr %39, ptr %p, align 8, !dbg !35
  %40 = load ptr, ptr %p, align 8, !dbg !35
  %41 = load ptr, ptr %p, align 8, !dbg !36
  %42 = getelementptr %struct.Data, ptr %41, i32 0, i32 0, !dbg !36
  %43 = load i32, ptr %42, align 4, !dbg !36
  store i32 %43, ptr %id, align 4, !dbg !36
  %44 = load i32, ptr %id, align 4, !dbg !36
  %45 = load ptr, ptr %p, align 8, !dbg !37
  %46 = getelementptr %struct.Data, ptr %45, i32 0, i32 1, !dbg !37
  %47 = load i32, ptr %46, align 4, !dbg !37
  store i32 %47, ptr %val, align 4, !dbg !37
  %48 = load i32, ptr %val, align 4, !dbg !37
  %49 = load i32, ptr %id, align 4, !dbg !38
  %50 = icmp ne i32 %49, 20, !dbg !38
  br i1 %50, label %then4, label %else5, !dbg !38

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !39
  %51 = load i32, ptr %err, align 4, !dbg !39
  br label %if.end6, !dbg !39

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !39

if.end6:                                          ; preds = %else5, %then4
  %52 = load i32, ptr %val, align 4, !dbg !40
  %53 = icmp ne i32 %52, 24, !dbg !40
  br i1 %53, label %then7, label %else8, !dbg !40

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !41
  %54 = load i32, ptr %err, align 4, !dbg !41
  br label %if.end9, !dbg !41

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !41

if.end9:                                          ; preds = %else8, %then7
  %55 = load ptr, ptr %p, align 8, !dbg !42
  %56 = getelementptr %struct.Data, ptr %55, i64 1, !dbg !42
  store ptr %56, ptr %p, align 8, !dbg !42
  %57 = load ptr, ptr %p, align 8, !dbg !42
  %58 = load ptr, ptr %p, align 8, !dbg !43
  %59 = getelementptr %struct.Data, ptr %58, i32 0, i32 0, !dbg !43
  %60 = load i32, ptr %59, align 4, !dbg !43
  store i32 %60, ptr %id, align 4, !dbg !43
  %61 = load i32, ptr %id, align 4, !dbg !43
  %62 = load i32, ptr %id, align 4, !dbg !44
  %63 = icmp ne i32 %62, 30, !dbg !44
  br i1 %63, label %then10, label %else11, !dbg !44

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !45
  %64 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end12, !dbg !45

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !45

if.end12:                                         ; preds = %else11, %then10
  %65 = load ptr, ptr %p, align 8, !dbg !46
  %66 = getelementptr %struct.Data, ptr %65, i64 1, !dbg !46
  store ptr %66, ptr %p, align 8, !dbg !46
  %67 = load ptr, ptr %p, align 8, !dbg !47
  %68 = getelementptr %struct.Data, ptr %67, i32 0, i32 0, !dbg !47
  %69 = load i32, ptr %68, align 4, !dbg !47
  store i32 %69, ptr %id, align 4, !dbg !47
  %70 = load i32, ptr %id, align 4, !dbg !47
  %71 = load ptr, ptr %p, align 8, !dbg !48
  %72 = getelementptr %struct.Data, ptr %71, i32 0, i32 1, !dbg !48
  %73 = load i32, ptr %72, align 4, !dbg !48
  store i32 %73, ptr %val, align 4, !dbg !48
  %74 = load i32, ptr %val, align 4, !dbg !48
  %75 = load i32, ptr %id, align 4, !dbg !49
  %76 = icmp ne i32 %75, 40, !dbg !49
  br i1 %76, label %then13, label %else14, !dbg !49

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !50
  %77 = load i32, ptr %err, align 4, !dbg !50
  br label %if.end15, !dbg !50

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !50

if.end15:                                         ; preds = %else14, %then13
  %78 = load i32, ptr %val, align 4, !dbg !51
  %79 = icmp ne i32 %78, 48, !dbg !51
  br i1 %79, label %then16, label %else17, !dbg !51

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !52
  %80 = load i32, ptr %err, align 4, !dbg !52
  br label %if.end18, !dbg !52

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !52

if.end18:                                         ; preds = %else17, %then16
  %81 = getelementptr %struct.Data, ptr %data, i32 3, !dbg !53
  store ptr %81, ptr %p, align 8, !dbg !53
  %82 = load ptr, ptr %p, align 8, !dbg !53
  %83 = load ptr, ptr %p, align 8, !dbg !54
  %84 = getelementptr %struct.Data, ptr %83, i32 -1, !dbg !54
  store ptr %84, ptr %p, align 8, !dbg !54
  %85 = load ptr, ptr %p, align 8, !dbg !54
  %86 = load ptr, ptr %p, align 8, !dbg !55
  %87 = getelementptr %struct.Data, ptr %86, i32 0, i32 0, !dbg !55
  %88 = load i32, ptr %87, align 4, !dbg !55
  store i32 %88, ptr %id, align 4, !dbg !55
  %89 = load i32, ptr %id, align 4, !dbg !55
  %90 = load i32, ptr %id, align 4, !dbg !56
  %91 = icmp ne i32 %90, 30, !dbg !56
  br i1 %91, label %then19, label %else20, !dbg !56

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !57
  %92 = load i32, ptr %err, align 4, !dbg !57
  br label %if.end21, !dbg !57

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !57

if.end21:                                         ; preds = %else20, %then19
  %93 = load ptr, ptr %p, align 8, !dbg !58
  %94 = getelementptr %struct.Data, ptr %93, i64 -1, !dbg !58
  store ptr %94, ptr %p, align 8, !dbg !58
  %95 = load ptr, ptr %p, align 8, !dbg !58
  %96 = load ptr, ptr %p, align 8, !dbg !59
  %97 = getelementptr %struct.Data, ptr %96, i32 0, i32 0, !dbg !59
  %98 = load i32, ptr %97, align 4, !dbg !59
  store i32 %98, ptr %id, align 4, !dbg !59
  %99 = load i32, ptr %id, align 4, !dbg !59
  %100 = load i32, ptr %id, align 4, !dbg !60
  %101 = icmp ne i32 %100, 20, !dbg !60
  br i1 %101, label %then22, label %else23, !dbg !60

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !61
  %102 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end24, !dbg !61

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !61

if.end24:                                         ; preds = %else23, %then22
  %103 = load ptr, ptr %p, align 8, !dbg !62
  %104 = getelementptr %struct.Data, ptr %103, i64 -1, !dbg !62
  store ptr %104, ptr %p, align 8, !dbg !62
  %105 = load ptr, ptr %p, align 8, !dbg !63
  %106 = getelementptr %struct.Data, ptr %105, i32 0, i32 0, !dbg !63
  %107 = load i32, ptr %106, align 4, !dbg !63
  store i32 %107, ptr %id, align 4, !dbg !63
  %108 = load i32, ptr %id, align 4, !dbg !63
  %109 = load i32, ptr %id, align 4, !dbg !64
  %110 = icmp ne i32 %109, 10, !dbg !64
  br i1 %110, label %then25, label %else26, !dbg !64

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !65
  %111 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end27, !dbg !65

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !65

if.end27:                                         ; preds = %else26, %then25
  %112 = load i32, ptr %err, align 4, !dbg !66
  %113 = icmp eq i32 %112, 0, !dbg !66
  br i1 %113, label %then28, label %else29, !dbg !66

then28:                                           ; preds = %if.end27
  %114 = call i32 (ptr, ...) @printf(ptr @0), !dbg !67
  br label %if.end30, !dbg !67

else29:                                           ; preds = %if.end27
  %115 = call i32 (ptr, ...) @printf(ptr @1), !dbg !69
  br label %if.end30, !dbg !69

if.end30:                                         ; preds = %else29, %then28
  %116 = load i32, ptr %err, align 4, !dbg !71
  ret i32 %116, !dbg !71
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "29.struct_pointer_move.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 8, type: !3, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "p", scope: !2, file: !1, line: 23, type: !7)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!9 = !DILocation(line: 23, column: 3, scope: !2)
!10 = !DILocalVariable(name: "val", scope: !2, file: !1, line: 12, type: !5)
!11 = !DILocation(line: 12, column: 3, scope: !2)
!12 = !DILocalVariable(name: "id", scope: !2, file: !1, line: 11, type: !5)
!13 = !DILocation(line: 11, column: 3, scope: !2)
!14 = !DILocalVariable(name: "data", scope: !2, file: !1, line: 10, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 256, align: 32, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 4, lowerBound: 0)
!18 = !DILocation(line: 10, column: 3, scope: !2)
!19 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 9, type: !5)
!20 = !DILocation(line: 9, column: 3, scope: !2)
!21 = !DILocation(line: 14, column: 3, scope: !2)
!22 = !DILocation(line: 15, column: 3, scope: !2)
!23 = !DILocation(line: 16, column: 3, scope: !2)
!24 = !DILocation(line: 17, column: 3, scope: !2)
!25 = !DILocation(line: 18, column: 3, scope: !2)
!26 = !DILocation(line: 19, column: 3, scope: !2)
!27 = !DILocation(line: 20, column: 3, scope: !2)
!28 = !DILocation(line: 21, column: 3, scope: !2)
!29 = !DILocation(line: 24, column: 3, scope: !2)
!30 = !DILocation(line: 25, column: 3, scope: !2)
!31 = !DILocation(line: 26, column: 3, scope: !2)
!32 = !DILocation(line: 26, column: 17, scope: !2)
!33 = !DILocation(line: 27, column: 3, scope: !2)
!34 = !DILocation(line: 27, column: 18, scope: !2)
!35 = !DILocation(line: 28, column: 3, scope: !2)
!36 = !DILocation(line: 29, column: 3, scope: !2)
!37 = !DILocation(line: 30, column: 3, scope: !2)
!38 = !DILocation(line: 31, column: 3, scope: !2)
!39 = !DILocation(line: 31, column: 17, scope: !2)
!40 = !DILocation(line: 32, column: 3, scope: !2)
!41 = !DILocation(line: 32, column: 18, scope: !2)
!42 = !DILocation(line: 33, column: 3, scope: !2)
!43 = !DILocation(line: 34, column: 3, scope: !2)
!44 = !DILocation(line: 35, column: 3, scope: !2)
!45 = !DILocation(line: 35, column: 17, scope: !2)
!46 = !DILocation(line: 36, column: 3, scope: !2)
!47 = !DILocation(line: 37, column: 3, scope: !2)
!48 = !DILocation(line: 38, column: 3, scope: !2)
!49 = !DILocation(line: 39, column: 3, scope: !2)
!50 = !DILocation(line: 39, column: 17, scope: !2)
!51 = !DILocation(line: 40, column: 3, scope: !2)
!52 = !DILocation(line: 40, column: 18, scope: !2)
!53 = !DILocation(line: 42, column: 3, scope: !2)
!54 = !DILocation(line: 43, column: 3, scope: !2)
!55 = !DILocation(line: 44, column: 3, scope: !2)
!56 = !DILocation(line: 45, column: 3, scope: !2)
!57 = !DILocation(line: 45, column: 17, scope: !2)
!58 = !DILocation(line: 46, column: 3, scope: !2)
!59 = !DILocation(line: 47, column: 3, scope: !2)
!60 = !DILocation(line: 48, column: 3, scope: !2)
!61 = !DILocation(line: 48, column: 17, scope: !2)
!62 = !DILocation(line: 49, column: 3, scope: !2)
!63 = !DILocation(line: 50, column: 3, scope: !2)
!64 = !DILocation(line: 51, column: 3, scope: !2)
!65 = !DILocation(line: 51, column: 17, scope: !2)
!66 = !DILocation(line: 53, column: 3, scope: !2)
!67 = !DILocation(line: 54, column: 5, scope: !68)
!68 = distinct !DILexicalBlock(scope: !2, file: !1, line: 53, column: 17)
!69 = !DILocation(line: 56, column: 5, scope: !70)
!70 = distinct !DILexicalBlock(scope: !2, file: !1, line: 55, column: 10)
!71 = !DILocation(line: 58, column: 3, scope: !2)
