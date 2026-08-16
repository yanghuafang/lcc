; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

%struct.Employee = type { i32, i8 }
%struct.Point = type { i32, i32 }

@0 = private unnamed_addr constant [3 x i8] c"hi\00", align 1
@1 = private unnamed_addr constant [26 x i8] c"36.typedef_struct.c PASS\0A\00", align 1
@2 = private unnamed_addr constant [26 x i8] c"36.typedef_struct.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

declare ptr @malloc(i64)

declare i64 @strlen(ptr)

define void @fill_employee(ptr %0, i32 %1, i8 %2) !dbg !4 {
entry:
  %sex = alloca i8, align 1
    #dbg_declare(ptr %sex, !12, !DIExpression(), !13)
  %id = alloca i32, align 4
    #dbg_declare(ptr %id, !14, !DIExpression(), !13)
  %employee = alloca ptr, align 8
    #dbg_declare(ptr %employee, !15, !DIExpression(), !13)
  store ptr %0, ptr %employee, align 8, !dbg !13
  store i32 %1, ptr %id, align 4, !dbg !13
  store i8 %2, ptr %sex, align 1, !dbg !13
  %3 = load ptr, ptr %employee, align 8, !dbg !16
  %4 = getelementptr %struct.Employee, ptr %3, i32 0, i32 0, !dbg !16
  %5 = load i32, ptr %id, align 4, !dbg !16
  store i32 %5, ptr %4, align 4, !dbg !16
  %6 = load i32, ptr %4, align 4, !dbg !16
  %7 = load ptr, ptr %employee, align 8, !dbg !17
  %8 = getelementptr %struct.Employee, ptr %7, i32 0, i32 1, !dbg !17
  %9 = load i8, ptr %sex, align 1, !dbg !17
  store i8 %9, ptr %8, align 1, !dbg !17
  %10 = load i8, ptr %8, align 1, !dbg !17
  ret void, !dbg !17
}

define i32 @main() !dbg !18 {
entry:
  %len = alloca i64, align 8
    #dbg_declare(ptr %len, !21, !DIExpression(), !23)
  %sex = alloca i32, align 4
    #dbg_declare(ptr %sex, !24, !DIExpression(), !25)
  %id = alloca i32, align 4
    #dbg_declare(ptr %id, !26, !DIExpression(), !27)
  %sz = alloca i32, align 4
    #dbg_declare(ptr %sz, !28, !DIExpression(), !29)
  %origin = alloca %struct.Point, align 8
    #dbg_declare(ptr %origin, !30, !DIExpression(), !35)
  %workerPtr = alloca ptr, align 8
    #dbg_declare(ptr %workerPtr, !36, !DIExpression(), !37)
  %worker = alloca %struct.Employee, align 8
    #dbg_declare(ptr %worker, !38, !DIExpression(), !43)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !44, !DIExpression(), !45)
  store i32 0, ptr %err, align 4, !dbg !45
  %0 = getelementptr %struct.Employee, ptr %worker, i32 0, i32 1, !dbg !46
  store i8 77, ptr %0, align 1, !dbg !46
  %1 = load i8, ptr %0, align 1, !dbg !46
  store ptr %worker, ptr %workerPtr, align 8, !dbg !47
  %2 = load ptr, ptr %workerPtr, align 8, !dbg !47
  %3 = load ptr, ptr %workerPtr, align 8, !dbg !48
  call void @fill_employee(ptr %3, i32 11, i8 70), !dbg !48
  %4 = getelementptr %struct.Point, ptr %origin, i32 0, i32 0, !dbg !49
  store i32 3, ptr %4, align 4, !dbg !49
  %5 = load i32, ptr %4, align 4, !dbg !49
  %6 = getelementptr %struct.Point, ptr %origin, i32 0, i32 1, !dbg !50
  store i32 4, ptr %6, align 4, !dbg !50
  %7 = load i32, ptr %6, align 4, !dbg !50
  store i32 8, ptr %sz, align 4, !dbg !51
  %8 = load i32, ptr %sz, align 4, !dbg !51
  %9 = load i32, ptr %sz, align 4, !dbg !52
  %10 = icmp ne i32 %9, 8, !dbg !52
  br i1 %10, label %then, label %else, !dbg !52

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !53
  %11 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end, !dbg !53

else:                                             ; preds = %entry
  br label %if.end, !dbg !53

if.end:                                           ; preds = %else, %then
  store i32 8, ptr %sz, align 4, !dbg !54
  %12 = load i32, ptr %sz, align 4, !dbg !54
  %13 = load i32, ptr %sz, align 4, !dbg !55
  %14 = icmp ne i32 %13, 8, !dbg !55
  br i1 %14, label %then1, label %else2, !dbg !55

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !56
  %15 = load i32, ptr %err, align 4, !dbg !56
  br label %if.end3, !dbg !56

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !56

if.end3:                                          ; preds = %else2, %then1
  store i32 8, ptr %sz, align 4, !dbg !57
  %16 = load i32, ptr %sz, align 4, !dbg !57
  %17 = load i32, ptr %sz, align 4, !dbg !58
  %18 = icmp ne i32 %17, 8, !dbg !58
  br i1 %18, label %then4, label %else5, !dbg !58

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !59
  %19 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end6, !dbg !59

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !59

if.end6:                                          ; preds = %else5, %then4
  store i32 8, ptr %sz, align 4, !dbg !60
  %20 = load i32, ptr %sz, align 4, !dbg !60
  %21 = load i32, ptr %sz, align 4, !dbg !61
  %22 = icmp ne i32 %21, 8, !dbg !61
  br i1 %22, label %then7, label %else8, !dbg !61

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !62
  %23 = load i32, ptr %err, align 4, !dbg !62
  br label %if.end9, !dbg !62

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !62

if.end9:                                          ; preds = %else8, %then7
  %24 = call i64 @strlen(ptr @0), !dbg !63
  store i64 %24, ptr %len, align 4, !dbg !63
  %25 = load i64, ptr %len, align 4, !dbg !63
  %26 = load i64, ptr %len, align 4, !dbg !64
  %27 = icmp ne i64 %26, 2, !dbg !64
  br i1 %27, label %then10, label %else11, !dbg !64

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !65
  %28 = load i32, ptr %err, align 4, !dbg !65
  br label %if.end12, !dbg !65

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !65

if.end12:                                         ; preds = %else11, %then10
  %29 = getelementptr %struct.Employee, ptr %worker, i32 0, i32 0, !dbg !66
  %30 = load i32, ptr %29, align 4, !dbg !66
  store i32 %30, ptr %id, align 4, !dbg !66
  %31 = load i32, ptr %id, align 4, !dbg !66
  %32 = load i32, ptr %id, align 4, !dbg !67
  %33 = icmp ne i32 %32, 11, !dbg !67
  br i1 %33, label %then13, label %else14, !dbg !67

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !68
  %34 = load i32, ptr %err, align 4, !dbg !68
  br label %if.end15, !dbg !68

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !68

if.end15:                                         ; preds = %else14, %then13
  %35 = load ptr, ptr %workerPtr, align 8, !dbg !69
  %36 = getelementptr %struct.Employee, ptr %35, i32 0, i32 0, !dbg !69
  %37 = load i32, ptr %36, align 4, !dbg !69
  store i32 %37, ptr %id, align 4, !dbg !69
  %38 = load i32, ptr %id, align 4, !dbg !69
  %39 = load i32, ptr %id, align 4, !dbg !70
  %40 = icmp ne i32 %39, 11, !dbg !70
  br i1 %40, label %then16, label %else17, !dbg !70

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !71
  %41 = load i32, ptr %err, align 4, !dbg !71
  br label %if.end18, !dbg !71

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !71

if.end18:                                         ; preds = %else17, %then16
  %42 = load ptr, ptr %workerPtr, align 8, !dbg !72
  %43 = getelementptr %struct.Employee, ptr %42, i32 0, i32 1, !dbg !72
  %44 = load i8, ptr %43, align 1, !dbg !72
  %45 = sext i8 %44 to i32, !dbg !72
  store i32 %45, ptr %sex, align 4, !dbg !72
  %46 = load i32, ptr %sex, align 4, !dbg !72
  %47 = load i32, ptr %sex, align 4, !dbg !73
  %48 = icmp ne i32 %47, 70, !dbg !73
  br i1 %48, label %then19, label %else20, !dbg !73

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !74
  %49 = load i32, ptr %err, align 4, !dbg !74
  br label %if.end21, !dbg !74

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !74

if.end21:                                         ; preds = %else20, %then19
  %50 = getelementptr %struct.Point, ptr %origin, i32 0, i32 0, !dbg !75
  %51 = load i32, ptr %50, align 4, !dbg !75
  store i32 %51, ptr %id, align 4, !dbg !75
  %52 = load i32, ptr %id, align 4, !dbg !75
  %53 = load i32, ptr %id, align 4, !dbg !76
  %54 = icmp ne i32 %53, 3, !dbg !76
  br i1 %54, label %then22, label %else23, !dbg !76

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !77
  %55 = load i32, ptr %err, align 4, !dbg !77
  br label %if.end24, !dbg !77

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !77

if.end24:                                         ; preds = %else23, %then22
  %56 = getelementptr %struct.Point, ptr %origin, i32 0, i32 1, !dbg !78
  %57 = load i32, ptr %56, align 4, !dbg !78
  store i32 %57, ptr %sex, align 4, !dbg !78
  %58 = load i32, ptr %sex, align 4, !dbg !78
  %59 = load i32, ptr %sex, align 4, !dbg !79
  %60 = icmp ne i32 %59, 4, !dbg !79
  br i1 %60, label %then25, label %else26, !dbg !79

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !80
  %61 = load i32, ptr %err, align 4, !dbg !80
  br label %if.end27, !dbg !80

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !80

if.end27:                                         ; preds = %else26, %then25
  %62 = load i32, ptr %err, align 4, !dbg !81
  %63 = icmp eq i32 %62, 0, !dbg !81
  br i1 %63, label %then28, label %else29, !dbg !81

then28:                                           ; preds = %if.end27
  %64 = call i32 (ptr, ...) @printf(ptr @1), !dbg !82
  br label %if.end30, !dbg !82

else29:                                           ; preds = %if.end27
  %65 = call i32 (ptr, ...) @printf(ptr @2), !dbg !84
  br label %if.end30, !dbg !84

if.end30:                                         ; preds = %else29, %then28
  %66 = load i32, ptr %err, align 4, !dbg !86
  ret i32 %66, !dbg !86
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "36.typedef_struct.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "fill_employee", linkageName: "fill_employee", scope: null, file: !1, line: 24, type: !5, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !11)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !8, !9, !10}
!7 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!11 = !{}
!12 = !DILocalVariable(name: "sex", arg: 3, scope: !4, file: !1, line: 24, type: !10)
!13 = !DILocation(line: 24, column: 6, scope: !4)
!14 = !DILocalVariable(name: "id", arg: 2, scope: !4, file: !1, line: 24, type: !9)
!15 = !DILocalVariable(name: "employee", arg: 1, scope: !4, file: !1, line: 24, type: !8)
!16 = !DILocation(line: 25, column: 3, scope: !4)
!17 = !DILocation(line: 26, column: 3, scope: !4)
!18 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 29, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !11)
!19 = !DISubroutineType(types: !20)
!20 = !{!9}
!21 = !DILocalVariable(name: "len", scope: !18, file: !1, line: 37, type: !22)
!22 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!23 = !DILocation(line: 37, column: 3, scope: !18)
!24 = !DILocalVariable(name: "sex", scope: !18, file: !1, line: 36, type: !9)
!25 = !DILocation(line: 36, column: 3, scope: !18)
!26 = !DILocalVariable(name: "id", scope: !18, file: !1, line: 35, type: !9)
!27 = !DILocation(line: 35, column: 3, scope: !18)
!28 = !DILocalVariable(name: "sz", scope: !18, file: !1, line: 34, type: !9)
!29 = !DILocation(line: 34, column: 3, scope: !18)
!30 = !DILocalVariable(name: "origin", scope: !18, file: !1, line: 33, type: !31)
!31 = !DICompositeType(tag: DW_TAG_structure_type, name: "Point", file: !1, size: 64, align: 32, elements: !32)
!32 = !{!33, !34}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "x", file: !1, baseType: !9, size: 32, align: 32)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "y", file: !1, baseType: !9, size: 32, align: 32, offset: 32)
!35 = !DILocation(line: 33, column: 3, scope: !18)
!36 = !DILocalVariable(name: "workerPtr", scope: !18, file: !1, line: 32, type: !8)
!37 = !DILocation(line: 32, column: 3, scope: !18)
!38 = !DILocalVariable(name: "worker", scope: !18, file: !1, line: 31, type: !39)
!39 = !DICompositeType(tag: DW_TAG_structure_type, name: "Employee", file: !1, size: 64, align: 32, elements: !40)
!40 = !{!41, !42}
!41 = !DIDerivedType(tag: DW_TAG_member, name: "id", file: !1, baseType: !9, size: 32, align: 32)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "sex", file: !1, baseType: !10, size: 8, align: 8, offset: 32)
!43 = !DILocation(line: 31, column: 3, scope: !18)
!44 = !DILocalVariable(name: "err", scope: !18, file: !1, line: 30, type: !9)
!45 = !DILocation(line: 30, column: 3, scope: !18)
!46 = !DILocation(line: 39, column: 3, scope: !18)
!47 = !DILocation(line: 40, column: 3, scope: !18)
!48 = !DILocation(line: 41, column: 3, scope: !18)
!49 = !DILocation(line: 43, column: 3, scope: !18)
!50 = !DILocation(line: 44, column: 3, scope: !18)
!51 = !DILocation(line: 46, column: 3, scope: !18)
!52 = !DILocation(line: 47, column: 3, scope: !18)
!53 = !DILocation(line: 47, column: 16, scope: !18)
!54 = !DILocation(line: 48, column: 3, scope: !18)
!55 = !DILocation(line: 49, column: 3, scope: !18)
!56 = !DILocation(line: 49, column: 16, scope: !18)
!57 = !DILocation(line: 50, column: 3, scope: !18)
!58 = !DILocation(line: 51, column: 3, scope: !18)
!59 = !DILocation(line: 51, column: 16, scope: !18)
!60 = !DILocation(line: 52, column: 3, scope: !18)
!61 = !DILocation(line: 53, column: 3, scope: !18)
!62 = !DILocation(line: 53, column: 16, scope: !18)
!63 = !DILocation(line: 55, column: 3, scope: !18)
!64 = !DILocation(line: 56, column: 3, scope: !18)
!65 = !DILocation(line: 56, column: 17, scope: !18)
!66 = !DILocation(line: 58, column: 3, scope: !18)
!67 = !DILocation(line: 59, column: 3, scope: !18)
!68 = !DILocation(line: 59, column: 17, scope: !18)
!69 = !DILocation(line: 60, column: 3, scope: !18)
!70 = !DILocation(line: 61, column: 3, scope: !18)
!71 = !DILocation(line: 61, column: 17, scope: !18)
!72 = !DILocation(line: 62, column: 3, scope: !18)
!73 = !DILocation(line: 63, column: 3, scope: !18)
!74 = !DILocation(line: 63, column: 19, scope: !18)
!75 = !DILocation(line: 64, column: 3, scope: !18)
!76 = !DILocation(line: 65, column: 3, scope: !18)
!77 = !DILocation(line: 65, column: 16, scope: !18)
!78 = !DILocation(line: 66, column: 3, scope: !18)
!79 = !DILocation(line: 67, column: 3, scope: !18)
!80 = !DILocation(line: 67, column: 17, scope: !18)
!81 = !DILocation(line: 69, column: 3, scope: !18)
!82 = !DILocation(line: 70, column: 5, scope: !83)
!83 = distinct !DILexicalBlock(scope: !18, file: !1, line: 69, column: 17)
!84 = !DILocation(line: 72, column: 5, scope: !85)
!85 = distinct !DILexicalBlock(scope: !18, file: !1, line: 71, column: 10)
!86 = !DILocation(line: 74, column: 3, scope: !18)
