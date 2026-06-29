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
    #dbg_declare(ptr %sex, !10, !DIExpression(), !11)
  %id = alloca i32, align 4
    #dbg_declare(ptr %id, !12, !DIExpression(), !11)
  %employee = alloca ptr, align 8
    #dbg_declare(ptr %employee, !13, !DIExpression(), !11)
  store ptr %0, ptr %employee, align 8, !dbg !11
  store i32 %1, ptr %id, align 4, !dbg !11
  store i8 %2, ptr %sex, align 1, !dbg !11
  %3 = load ptr, ptr %employee, align 8, !dbg !14
  %4 = getelementptr %struct.Employee, ptr %3, i32 0, i32 0, !dbg !14
  %5 = load i32, ptr %id, align 4, !dbg !14
  store i32 %5, ptr %4, align 4, !dbg !14
  %6 = load i32, ptr %4, align 4, !dbg !14
  %7 = load ptr, ptr %employee, align 8, !dbg !15
  %8 = getelementptr %struct.Employee, ptr %7, i32 0, i32 1, !dbg !15
  %9 = load i8, ptr %sex, align 1, !dbg !15
  store i8 %9, ptr %8, align 1, !dbg !15
  %10 = load i8, ptr %8, align 1, !dbg !15
  ret void, !dbg !15
}

define i32 @main() !dbg !16 {
entry:
  %len = alloca i64, align 8
    #dbg_declare(ptr %len, !19, !DIExpression(), !21)
  %sex = alloca i32, align 4
    #dbg_declare(ptr %sex, !22, !DIExpression(), !23)
  %id = alloca i32, align 4
    #dbg_declare(ptr %id, !24, !DIExpression(), !25)
  %sz = alloca i32, align 4
    #dbg_declare(ptr %sz, !26, !DIExpression(), !27)
  %origin = alloca %struct.Point, align 8
    #dbg_declare(ptr %origin, !28, !DIExpression(), !33)
  %workerPtr = alloca ptr, align 8
    #dbg_declare(ptr %workerPtr, !34, !DIExpression(), !35)
  %worker = alloca %struct.Employee, align 8
    #dbg_declare(ptr %worker, !36, !DIExpression(), !41)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !42, !DIExpression(), !43)
  store i32 0, ptr %err, align 4, !dbg !43
  %0 = getelementptr %struct.Employee, ptr %worker, i32 0, i32 1, !dbg !44
  store i8 77, ptr %0, align 1, !dbg !44
  %1 = load i8, ptr %0, align 1, !dbg !44
  store ptr %worker, ptr %workerPtr, align 8, !dbg !45
  %2 = load ptr, ptr %workerPtr, align 8, !dbg !45
  %3 = load ptr, ptr %workerPtr, align 8, !dbg !46
  call void @fill_employee(ptr %3, i32 11, i8 70), !dbg !46
  %4 = getelementptr %struct.Point, ptr %origin, i32 0, i32 0, !dbg !47
  store i32 3, ptr %4, align 4, !dbg !47
  %5 = load i32, ptr %4, align 4, !dbg !47
  %6 = getelementptr %struct.Point, ptr %origin, i32 0, i32 1, !dbg !48
  store i32 4, ptr %6, align 4, !dbg !48
  %7 = load i32, ptr %6, align 4, !dbg !48
  store i32 8, ptr %sz, align 4, !dbg !49
  %8 = load i32, ptr %sz, align 4, !dbg !49
  %9 = load i32, ptr %sz, align 4, !dbg !50
  %10 = icmp ne i32 %9, 8, !dbg !50
  br i1 %10, label %then, label %else, !dbg !50

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !51
  %11 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end, !dbg !51

else:                                             ; preds = %entry
  br label %if.end, !dbg !51

if.end:                                           ; preds = %else, %then
  store i32 8, ptr %sz, align 4, !dbg !52
  %12 = load i32, ptr %sz, align 4, !dbg !52
  %13 = load i32, ptr %sz, align 4, !dbg !53
  %14 = icmp ne i32 %13, 8, !dbg !53
  br i1 %14, label %then1, label %else2, !dbg !53

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !54
  %15 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end3, !dbg !54

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !54

if.end3:                                          ; preds = %else2, %then1
  store i32 8, ptr %sz, align 4, !dbg !55
  %16 = load i32, ptr %sz, align 4, !dbg !55
  %17 = load i32, ptr %sz, align 4, !dbg !56
  %18 = icmp ne i32 %17, 8, !dbg !56
  br i1 %18, label %then4, label %else5, !dbg !56

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !57
  %19 = load i32, ptr %err, align 4, !dbg !57
  br label %if.end6, !dbg !57

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !57

if.end6:                                          ; preds = %else5, %then4
  store i32 8, ptr %sz, align 4, !dbg !58
  %20 = load i32, ptr %sz, align 4, !dbg !58
  %21 = load i32, ptr %sz, align 4, !dbg !59
  %22 = icmp ne i32 %21, 8, !dbg !59
  br i1 %22, label %then7, label %else8, !dbg !59

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !60
  %23 = load i32, ptr %err, align 4, !dbg !60
  br label %if.end9, !dbg !60

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !60

if.end9:                                          ; preds = %else8, %then7
  %24 = call i64 @strlen(ptr @0), !dbg !61
  store i64 %24, ptr %len, align 4, !dbg !61
  %25 = load i64, ptr %len, align 4, !dbg !61
  %26 = load i64, ptr %len, align 4, !dbg !62
  %27 = icmp ne i64 %26, 2, !dbg !62
  br i1 %27, label %then10, label %else11, !dbg !62

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !63
  %28 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end12, !dbg !63

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !63

if.end12:                                         ; preds = %else11, %then10
  %29 = getelementptr %struct.Employee, ptr %worker, i32 0, i32 0, !dbg !64
  %30 = load i32, ptr %29, align 4, !dbg !64
  store i32 %30, ptr %id, align 4, !dbg !64
  %31 = load i32, ptr %id, align 4, !dbg !64
  %32 = load i32, ptr %id, align 4, !dbg !65
  %33 = icmp ne i32 %32, 11, !dbg !65
  br i1 %33, label %then13, label %else14, !dbg !65

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !66
  %34 = load i32, ptr %err, align 4, !dbg !66
  br label %if.end15, !dbg !66

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !66

if.end15:                                         ; preds = %else14, %then13
  %35 = load ptr, ptr %workerPtr, align 8, !dbg !67
  %36 = getelementptr %struct.Employee, ptr %35, i32 0, i32 0, !dbg !67
  %37 = load i32, ptr %36, align 4, !dbg !67
  store i32 %37, ptr %id, align 4, !dbg !67
  %38 = load i32, ptr %id, align 4, !dbg !67
  %39 = load i32, ptr %id, align 4, !dbg !68
  %40 = icmp ne i32 %39, 11, !dbg !68
  br i1 %40, label %then16, label %else17, !dbg !68

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !69
  %41 = load i32, ptr %err, align 4, !dbg !69
  br label %if.end18, !dbg !69

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !69

if.end18:                                         ; preds = %else17, %then16
  %42 = load ptr, ptr %workerPtr, align 8, !dbg !70
  %43 = getelementptr %struct.Employee, ptr %42, i32 0, i32 1, !dbg !70
  %44 = load i8, ptr %43, align 1, !dbg !70
  %45 = sext i8 %44 to i32, !dbg !70
  store i32 %45, ptr %sex, align 4, !dbg !70
  %46 = load i32, ptr %sex, align 4, !dbg !70
  %47 = load i32, ptr %sex, align 4, !dbg !71
  %48 = icmp ne i32 %47, 70, !dbg !71
  br i1 %48, label %then19, label %else20, !dbg !71

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !72
  %49 = load i32, ptr %err, align 4, !dbg !72
  br label %if.end21, !dbg !72

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !72

if.end21:                                         ; preds = %else20, %then19
  %50 = getelementptr %struct.Point, ptr %origin, i32 0, i32 0, !dbg !73
  %51 = load i32, ptr %50, align 4, !dbg !73
  store i32 %51, ptr %id, align 4, !dbg !73
  %52 = load i32, ptr %id, align 4, !dbg !73
  %53 = load i32, ptr %id, align 4, !dbg !74
  %54 = icmp ne i32 %53, 3, !dbg !74
  br i1 %54, label %then22, label %else23, !dbg !74

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !75
  %55 = load i32, ptr %err, align 4, !dbg !75
  br label %if.end24, !dbg !75

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !75

if.end24:                                         ; preds = %else23, %then22
  %56 = getelementptr %struct.Point, ptr %origin, i32 0, i32 1, !dbg !76
  %57 = load i32, ptr %56, align 4, !dbg !76
  store i32 %57, ptr %sex, align 4, !dbg !76
  %58 = load i32, ptr %sex, align 4, !dbg !76
  %59 = load i32, ptr %sex, align 4, !dbg !77
  %60 = icmp ne i32 %59, 4, !dbg !77
  br i1 %60, label %then25, label %else26, !dbg !77

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !78
  %61 = load i32, ptr %err, align 4, !dbg !78
  br label %if.end27, !dbg !78

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !78

if.end27:                                         ; preds = %else26, %then25
  %62 = load i32, ptr %err, align 4, !dbg !79
  %63 = icmp eq i32 %62, 0, !dbg !79
  br i1 %63, label %then28, label %else29, !dbg !79

then28:                                           ; preds = %if.end27
  %64 = call i32 (ptr, ...) @printf(ptr @1), !dbg !80
  br label %if.end30, !dbg !80

else29:                                           ; preds = %if.end27
  %65 = call i32 (ptr, ...) @printf(ptr @2), !dbg !82
  br label %if.end30, !dbg !82

if.end30:                                         ; preds = %else29, %then28
  %66 = load i32, ptr %err, align 4, !dbg !84
  ret i32 %66, !dbg !84
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "36.typedef_struct.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "fill_employee", linkageName: "fill_employee", scope: null, file: !1, line: 21, type: !3, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !9)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6, !7, !8}
!5 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !{}
!10 = !DILocalVariable(name: "sex", arg: 3, scope: !2, file: !1, line: 21, type: !8)
!11 = !DILocation(line: 21, column: 6, scope: !2)
!12 = !DILocalVariable(name: "id", arg: 2, scope: !2, file: !1, line: 21, type: !7)
!13 = !DILocalVariable(name: "employee", arg: 1, scope: !2, file: !1, line: 21, type: !6)
!14 = !DILocation(line: 22, column: 3, scope: !2)
!15 = !DILocation(line: 23, column: 3, scope: !2)
!16 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 26, type: !17, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !9)
!17 = !DISubroutineType(types: !18)
!18 = !{!7}
!19 = !DILocalVariable(name: "len", scope: !16, file: !1, line: 34, type: !20)
!20 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!21 = !DILocation(line: 34, column: 3, scope: !16)
!22 = !DILocalVariable(name: "sex", scope: !16, file: !1, line: 33, type: !7)
!23 = !DILocation(line: 33, column: 3, scope: !16)
!24 = !DILocalVariable(name: "id", scope: !16, file: !1, line: 32, type: !7)
!25 = !DILocation(line: 32, column: 3, scope: !16)
!26 = !DILocalVariable(name: "sz", scope: !16, file: !1, line: 31, type: !7)
!27 = !DILocation(line: 31, column: 3, scope: !16)
!28 = !DILocalVariable(name: "origin", scope: !16, file: !1, line: 30, type: !29)
!29 = !DICompositeType(tag: DW_TAG_structure_type, name: "Point", file: !1, size: 64, align: 32, elements: !30)
!30 = !{!31, !32}
!31 = !DIDerivedType(tag: DW_TAG_member, name: "x", file: !1, baseType: !7, size: 32, align: 32)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "y", file: !1, baseType: !7, size: 32, align: 32, offset: 32)
!33 = !DILocation(line: 30, column: 3, scope: !16)
!34 = !DILocalVariable(name: "workerPtr", scope: !16, file: !1, line: 29, type: !6)
!35 = !DILocation(line: 29, column: 3, scope: !16)
!36 = !DILocalVariable(name: "worker", scope: !16, file: !1, line: 28, type: !37)
!37 = !DICompositeType(tag: DW_TAG_structure_type, name: "Employee", file: !1, size: 64, align: 32, elements: !38)
!38 = !{!39, !40}
!39 = !DIDerivedType(tag: DW_TAG_member, name: "id", file: !1, baseType: !7, size: 32, align: 32)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "sex", file: !1, baseType: !8, size: 8, align: 8, offset: 32)
!41 = !DILocation(line: 28, column: 3, scope: !16)
!42 = !DILocalVariable(name: "err", scope: !16, file: !1, line: 27, type: !7)
!43 = !DILocation(line: 27, column: 3, scope: !16)
!44 = !DILocation(line: 36, column: 3, scope: !16)
!45 = !DILocation(line: 37, column: 3, scope: !16)
!46 = !DILocation(line: 38, column: 3, scope: !16)
!47 = !DILocation(line: 40, column: 3, scope: !16)
!48 = !DILocation(line: 41, column: 3, scope: !16)
!49 = !DILocation(line: 43, column: 3, scope: !16)
!50 = !DILocation(line: 44, column: 3, scope: !16)
!51 = !DILocation(line: 44, column: 16, scope: !16)
!52 = !DILocation(line: 45, column: 3, scope: !16)
!53 = !DILocation(line: 46, column: 3, scope: !16)
!54 = !DILocation(line: 46, column: 16, scope: !16)
!55 = !DILocation(line: 47, column: 3, scope: !16)
!56 = !DILocation(line: 48, column: 3, scope: !16)
!57 = !DILocation(line: 48, column: 16, scope: !16)
!58 = !DILocation(line: 49, column: 3, scope: !16)
!59 = !DILocation(line: 50, column: 3, scope: !16)
!60 = !DILocation(line: 50, column: 16, scope: !16)
!61 = !DILocation(line: 52, column: 3, scope: !16)
!62 = !DILocation(line: 53, column: 3, scope: !16)
!63 = !DILocation(line: 53, column: 17, scope: !16)
!64 = !DILocation(line: 55, column: 3, scope: !16)
!65 = !DILocation(line: 56, column: 3, scope: !16)
!66 = !DILocation(line: 56, column: 17, scope: !16)
!67 = !DILocation(line: 57, column: 3, scope: !16)
!68 = !DILocation(line: 58, column: 3, scope: !16)
!69 = !DILocation(line: 58, column: 17, scope: !16)
!70 = !DILocation(line: 59, column: 3, scope: !16)
!71 = !DILocation(line: 60, column: 3, scope: !16)
!72 = !DILocation(line: 60, column: 19, scope: !16)
!73 = !DILocation(line: 61, column: 3, scope: !16)
!74 = !DILocation(line: 62, column: 3, scope: !16)
!75 = !DILocation(line: 62, column: 16, scope: !16)
!76 = !DILocation(line: 63, column: 3, scope: !16)
!77 = !DILocation(line: 64, column: 3, scope: !16)
!78 = !DILocation(line: 64, column: 17, scope: !16)
!79 = !DILocation(line: 66, column: 3, scope: !16)
!80 = !DILocation(line: 67, column: 5, scope: !81)
!81 = distinct !DILexicalBlock(scope: !16, file: !1, line: 66, column: 17)
!82 = !DILocation(line: 69, column: 5, scope: !83)
!83 = distinct !DILexicalBlock(scope: !16, file: !1, line: 68, column: 10)
!84 = !DILocation(line: 71, column: 3, scope: !16)
