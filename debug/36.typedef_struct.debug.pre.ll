; ModuleID = 'lcc'
source_filename = "lcc"

%struct.Employee = type { i32, i8 }
%struct.Point = type { i32, i32 }

@0 = private unnamed_addr constant [3 x i8] c"hi\00", align 1
@1 = private unnamed_addr constant [26 x i8] c"36.typedef_struct.c PASS\0A\00", align 1
@2 = private unnamed_addr constant [26 x i8] c"36.typedef_struct.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

declare ptr @malloc(i64)

declare i64 @strlen(ptr)

define void @fill_employee(ptr %0, i32 %1, i8 %2) !dbg !2 {
entry:
  %sex = alloca i8, align 1
    #dbg_declare(ptr %sex, !9, !DIExpression(), !10)
  %id = alloca i32, align 4
    #dbg_declare(ptr %id, !11, !DIExpression(), !10)
  %employee = alloca ptr, align 8
    #dbg_declare(ptr %employee, !12, !DIExpression(), !10)
  store ptr %0, ptr %employee, align 8, !dbg !10
  store i32 %1, ptr %id, align 4, !dbg !10
  store i8 %2, ptr %sex, align 1, !dbg !10
  %3 = load ptr, ptr %employee, align 8, !dbg !13
  %4 = getelementptr %struct.Employee, ptr %3, i32 0, i32 0, !dbg !13
  %5 = load i32, ptr %id, align 4, !dbg !13
  store i32 %5, ptr %4, align 4, !dbg !13
  %6 = load i32, ptr %4, align 4, !dbg !13
  %7 = load ptr, ptr %employee, align 8, !dbg !14
  %8 = getelementptr %struct.Employee, ptr %7, i32 0, i32 1, !dbg !14
  %9 = load i8, ptr %sex, align 1, !dbg !14
  store i8 %9, ptr %8, align 1, !dbg !14
  %10 = load i8, ptr %8, align 1, !dbg !14
  ret void, !dbg !14
}

define i32 @main() !dbg !15 {
entry:
  %len = alloca i64, align 8
    #dbg_declare(ptr %len, !18, !DIExpression(), !20)
  %sex = alloca i32, align 4
    #dbg_declare(ptr %sex, !21, !DIExpression(), !22)
  %id = alloca i32, align 4
    #dbg_declare(ptr %id, !23, !DIExpression(), !24)
  %sz = alloca i32, align 4
    #dbg_declare(ptr %sz, !25, !DIExpression(), !26)
  %origin = alloca %struct.Point, align 8
    #dbg_declare(ptr %origin, !27, !DIExpression(), !32)
  %workerPtr = alloca ptr, align 8
    #dbg_declare(ptr %workerPtr, !33, !DIExpression(), !34)
  %worker = alloca %struct.Employee, align 8
    #dbg_declare(ptr %worker, !35, !DIExpression(), !40)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !41, !DIExpression(), !42)
  store i32 0, ptr %err, align 4, !dbg !42
  %0 = getelementptr %struct.Employee, ptr %worker, i32 0, i32 1, !dbg !43
  store i8 77, ptr %0, align 1, !dbg !43
  %1 = load i8, ptr %0, align 1, !dbg !43
  store ptr %worker, ptr %workerPtr, align 8, !dbg !44
  %2 = load ptr, ptr %workerPtr, align 8, !dbg !44
  %3 = load ptr, ptr %workerPtr, align 8, !dbg !45
  call void @fill_employee(ptr %3, i32 11, i8 70), !dbg !45
  %4 = getelementptr %struct.Point, ptr %origin, i32 0, i32 0, !dbg !46
  store i32 3, ptr %4, align 4, !dbg !46
  %5 = load i32, ptr %4, align 4, !dbg !46
  %6 = getelementptr %struct.Point, ptr %origin, i32 0, i32 1, !dbg !47
  store i32 4, ptr %6, align 4, !dbg !47
  %7 = load i32, ptr %6, align 4, !dbg !47
  store i32 8, ptr %sz, align 4, !dbg !48
  %8 = load i32, ptr %sz, align 4, !dbg !48
  %9 = load i32, ptr %sz, align 4, !dbg !49
  %10 = icmp ne i32 %9, 8, !dbg !49
  br i1 %10, label %then, label %else, !dbg !49

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !50
  %11 = load i32, ptr %err, align 4, !dbg !50
  br label %if.end, !dbg !50

else:                                             ; preds = %entry
  br label %if.end, !dbg !50

if.end:                                           ; preds = %else, %then
  store i32 8, ptr %sz, align 4, !dbg !51
  %12 = load i32, ptr %sz, align 4, !dbg !51
  %13 = load i32, ptr %sz, align 4, !dbg !52
  %14 = icmp ne i32 %13, 8, !dbg !52
  br i1 %14, label %then1, label %else2, !dbg !52

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !53
  %15 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end3, !dbg !53

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !53

if.end3:                                          ; preds = %else2, %then1
  store i32 8, ptr %sz, align 4, !dbg !54
  %16 = load i32, ptr %sz, align 4, !dbg !54
  %17 = load i32, ptr %sz, align 4, !dbg !55
  %18 = icmp ne i32 %17, 8, !dbg !55
  br i1 %18, label %then4, label %else5, !dbg !55

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !56
  %19 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end6, !dbg !56

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !56

if.end6:                                          ; preds = %else5, %then4
  store i32 8, ptr %sz, align 4, !dbg !57
  %20 = load i32, ptr %sz, align 4, !dbg !57
  %21 = load i32, ptr %sz, align 4, !dbg !58
  %22 = icmp ne i32 %21, 8, !dbg !58
  br i1 %22, label %then7, label %else8, !dbg !58

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !59
  %23 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end9, !dbg !59

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !59

if.end9:                                          ; preds = %else8, %then7
  %24 = call i64 @strlen(ptr @0), !dbg !60
  store i64 %24, ptr %len, align 4, !dbg !60
  %25 = load i64, ptr %len, align 4, !dbg !60
  %26 = load i64, ptr %len, align 4, !dbg !61
  %27 = icmp ne i64 %26, 2, !dbg !61
  br i1 %27, label %then10, label %else11, !dbg !61

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !62
  %28 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end12, !dbg !62

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !62

if.end12:                                         ; preds = %else11, %then10
  %29 = getelementptr %struct.Employee, ptr %worker, i32 0, i32 0, !dbg !63
  %30 = load i32, ptr %29, align 4, !dbg !63
  store i32 %30, ptr %id, align 4, !dbg !63
  %31 = load i32, ptr %id, align 4, !dbg !63
  %32 = load i32, ptr %id, align 4, !dbg !64
  %33 = icmp ne i32 %32, 11, !dbg !64
  br i1 %33, label %then13, label %else14, !dbg !64

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !65
  %34 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end15, !dbg !65

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !65

if.end15:                                         ; preds = %else14, %then13
  %35 = load ptr, ptr %workerPtr, align 8, !dbg !66
  %36 = getelementptr %struct.Employee, ptr %35, i32 0, i32 0, !dbg !66
  %37 = load i32, ptr %36, align 4, !dbg !66
  store i32 %37, ptr %id, align 4, !dbg !66
  %38 = load i32, ptr %id, align 4, !dbg !66
  %39 = load i32, ptr %id, align 4, !dbg !67
  %40 = icmp ne i32 %39, 11, !dbg !67
  br i1 %40, label %then16, label %else17, !dbg !67

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !68
  %41 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end18, !dbg !68

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !68

if.end18:                                         ; preds = %else17, %then16
  %42 = load ptr, ptr %workerPtr, align 8, !dbg !69
  %43 = getelementptr %struct.Employee, ptr %42, i32 0, i32 1, !dbg !69
  %44 = load i8, ptr %43, align 1, !dbg !69
  %45 = sext i8 %44 to i32, !dbg !69
  store i32 %45, ptr %sex, align 4, !dbg !69
  %46 = load i32, ptr %sex, align 4, !dbg !69
  %47 = load i32, ptr %sex, align 4, !dbg !70
  %48 = icmp ne i32 %47, 70, !dbg !70
  br i1 %48, label %then19, label %else20, !dbg !70

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !71
  %49 = load i32, ptr %err, align 4, !dbg !71
  br label %if.end21, !dbg !71

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !71

if.end21:                                         ; preds = %else20, %then19
  %50 = getelementptr %struct.Point, ptr %origin, i32 0, i32 0, !dbg !72
  %51 = load i32, ptr %50, align 4, !dbg !72
  store i32 %51, ptr %id, align 4, !dbg !72
  %52 = load i32, ptr %id, align 4, !dbg !72
  %53 = load i32, ptr %id, align 4, !dbg !73
  %54 = icmp ne i32 %53, 3, !dbg !73
  br i1 %54, label %then22, label %else23, !dbg !73

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !74
  %55 = load i32, ptr %err, align 4, !dbg !74
  br label %if.end24, !dbg !74

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !74

if.end24:                                         ; preds = %else23, %then22
  %56 = getelementptr %struct.Point, ptr %origin, i32 0, i32 1, !dbg !75
  %57 = load i32, ptr %56, align 4, !dbg !75
  store i32 %57, ptr %sex, align 4, !dbg !75
  %58 = load i32, ptr %sex, align 4, !dbg !75
  %59 = load i32, ptr %sex, align 4, !dbg !76
  %60 = icmp ne i32 %59, 4, !dbg !76
  br i1 %60, label %then25, label %else26, !dbg !76

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !77
  %61 = load i32, ptr %err, align 4, !dbg !77
  br label %if.end27, !dbg !77

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !77

if.end27:                                         ; preds = %else26, %then25
  %62 = load i32, ptr %err, align 4, !dbg !78
  %63 = icmp eq i32 %62, 0, !dbg !78
  br i1 %63, label %then28, label %else29, !dbg !78

then28:                                           ; preds = %if.end27
  %64 = call i32 (ptr, ...) @printf(ptr @1), !dbg !79
  br label %if.end30, !dbg !79

else29:                                           ; preds = %if.end27
  %65 = call i32 (ptr, ...) @printf(ptr @2), !dbg !81
  br label %if.end30, !dbg !81

if.end30:                                         ; preds = %else29, %then28
  %66 = load i32, ptr %err, align 4, !dbg !83
  ret i32 %66, !dbg !83
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "36.typedef_struct.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "fill_employee", linkageName: "fill_employee", scope: null, file: !1, line: 21, type: !3, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6, !7, !8}
!5 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !DILocalVariable(name: "sex", arg: 3, scope: !2, file: !1, line: 21, type: !8)
!10 = !DILocation(line: 21, column: 6, scope: !2)
!11 = !DILocalVariable(name: "id", arg: 2, scope: !2, file: !1, line: 21, type: !7)
!12 = !DILocalVariable(name: "employee", arg: 1, scope: !2, file: !1, line: 21, type: !6)
!13 = !DILocation(line: 22, column: 3, scope: !2)
!14 = !DILocation(line: 23, column: 3, scope: !2)
!15 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 26, type: !16, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0)
!16 = !DISubroutineType(types: !17)
!17 = !{!7}
!18 = !DILocalVariable(name: "len", scope: !15, file: !1, line: 34, type: !19)
!19 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!20 = !DILocation(line: 34, column: 3, scope: !15)
!21 = !DILocalVariable(name: "sex", scope: !15, file: !1, line: 33, type: !7)
!22 = !DILocation(line: 33, column: 3, scope: !15)
!23 = !DILocalVariable(name: "id", scope: !15, file: !1, line: 32, type: !7)
!24 = !DILocation(line: 32, column: 3, scope: !15)
!25 = !DILocalVariable(name: "sz", scope: !15, file: !1, line: 31, type: !7)
!26 = !DILocation(line: 31, column: 3, scope: !15)
!27 = !DILocalVariable(name: "origin", scope: !15, file: !1, line: 30, type: !28)
!28 = !DICompositeType(tag: DW_TAG_structure_type, name: "Point", file: !1, size: 64, align: 32, elements: !29)
!29 = !{!30, !31}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "x", file: !1, baseType: !7, size: 32, align: 32)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "y", file: !1, baseType: !7, size: 32, align: 32, offset: 32)
!32 = !DILocation(line: 30, column: 3, scope: !15)
!33 = !DILocalVariable(name: "workerPtr", scope: !15, file: !1, line: 29, type: !6)
!34 = !DILocation(line: 29, column: 3, scope: !15)
!35 = !DILocalVariable(name: "worker", scope: !15, file: !1, line: 28, type: !36)
!36 = !DICompositeType(tag: DW_TAG_structure_type, name: "Employee", file: !1, size: 64, align: 32, elements: !37)
!37 = !{!38, !39}
!38 = !DIDerivedType(tag: DW_TAG_member, name: "id", file: !1, baseType: !7, size: 32, align: 32)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "sex", file: !1, baseType: !8, size: 8, align: 8, offset: 32)
!40 = !DILocation(line: 28, column: 3, scope: !15)
!41 = !DILocalVariable(name: "err", scope: !15, file: !1, line: 27, type: !7)
!42 = !DILocation(line: 27, column: 3, scope: !15)
!43 = !DILocation(line: 36, column: 3, scope: !15)
!44 = !DILocation(line: 37, column: 3, scope: !15)
!45 = !DILocation(line: 38, column: 3, scope: !15)
!46 = !DILocation(line: 40, column: 3, scope: !15)
!47 = !DILocation(line: 41, column: 3, scope: !15)
!48 = !DILocation(line: 43, column: 3, scope: !15)
!49 = !DILocation(line: 44, column: 3, scope: !15)
!50 = !DILocation(line: 44, column: 16, scope: !15)
!51 = !DILocation(line: 45, column: 3, scope: !15)
!52 = !DILocation(line: 46, column: 3, scope: !15)
!53 = !DILocation(line: 46, column: 16, scope: !15)
!54 = !DILocation(line: 47, column: 3, scope: !15)
!55 = !DILocation(line: 48, column: 3, scope: !15)
!56 = !DILocation(line: 48, column: 16, scope: !15)
!57 = !DILocation(line: 49, column: 3, scope: !15)
!58 = !DILocation(line: 50, column: 3, scope: !15)
!59 = !DILocation(line: 50, column: 16, scope: !15)
!60 = !DILocation(line: 52, column: 3, scope: !15)
!61 = !DILocation(line: 53, column: 3, scope: !15)
!62 = !DILocation(line: 53, column: 17, scope: !15)
!63 = !DILocation(line: 55, column: 3, scope: !15)
!64 = !DILocation(line: 56, column: 3, scope: !15)
!65 = !DILocation(line: 56, column: 17, scope: !15)
!66 = !DILocation(line: 57, column: 3, scope: !15)
!67 = !DILocation(line: 58, column: 3, scope: !15)
!68 = !DILocation(line: 58, column: 17, scope: !15)
!69 = !DILocation(line: 59, column: 3, scope: !15)
!70 = !DILocation(line: 60, column: 3, scope: !15)
!71 = !DILocation(line: 60, column: 19, scope: !15)
!72 = !DILocation(line: 61, column: 3, scope: !15)
!73 = !DILocation(line: 62, column: 3, scope: !15)
!74 = !DILocation(line: 62, column: 16, scope: !15)
!75 = !DILocation(line: 63, column: 3, scope: !15)
!76 = !DILocation(line: 64, column: 3, scope: !15)
!77 = !DILocation(line: 64, column: 17, scope: !15)
!78 = !DILocation(line: 66, column: 3, scope: !15)
!79 = !DILocation(line: 67, column: 5, scope: !80)
!80 = distinct !DILexicalBlock(scope: !15, file: !1, line: 66, column: 17)
!81 = !DILocation(line: 69, column: 5, scope: !82)
!82 = distinct !DILexicalBlock(scope: !15, file: !1, line: 68, column: 10)
!83 = !DILocation(line: 71, column: 3, scope: !15)
