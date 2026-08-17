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
    #dbg_declare(ptr %sex, !11, !DIExpression(), !12)
  %id = alloca i32, align 4
    #dbg_declare(ptr %id, !13, !DIExpression(), !12)
  %employee = alloca ptr, align 8
    #dbg_declare(ptr %employee, !14, !DIExpression(), !12)
  store ptr %0, ptr %employee, align 8, !dbg !12
  store i32 %1, ptr %id, align 4, !dbg !12
  store i8 %2, ptr %sex, align 1, !dbg !12
  %3 = load ptr, ptr %employee, align 8, !dbg !15
  %4 = getelementptr %struct.Employee, ptr %3, i32 0, i32 0, !dbg !15
  %5 = load i32, ptr %id, align 4, !dbg !15
  store i32 %5, ptr %4, align 4, !dbg !15
  %6 = load i32, ptr %4, align 4, !dbg !15
  %7 = load ptr, ptr %employee, align 8, !dbg !16
  %8 = getelementptr %struct.Employee, ptr %7, i32 0, i32 1, !dbg !16
  %9 = load i8, ptr %sex, align 1, !dbg !16
  store i8 %9, ptr %8, align 1, !dbg !16
  %10 = load i8, ptr %8, align 1, !dbg !16
  ret void, !dbg !16
}

define i32 @main() !dbg !17 {
entry:
  %len = alloca i64, align 8
    #dbg_declare(ptr %len, !20, !DIExpression(), !22)
  %sex = alloca i32, align 4
    #dbg_declare(ptr %sex, !23, !DIExpression(), !24)
  %id = alloca i32, align 4
    #dbg_declare(ptr %id, !25, !DIExpression(), !26)
  %sz = alloca i32, align 4
    #dbg_declare(ptr %sz, !27, !DIExpression(), !28)
  %origin = alloca %struct.Point, align 8
    #dbg_declare(ptr %origin, !29, !DIExpression(), !34)
  %workerPtr = alloca ptr, align 8
    #dbg_declare(ptr %workerPtr, !35, !DIExpression(), !36)
  %worker = alloca %struct.Employee, align 8
    #dbg_declare(ptr %worker, !37, !DIExpression(), !42)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !43, !DIExpression(), !44)
  store i32 0, ptr %err, align 4, !dbg !44
  %0 = getelementptr %struct.Employee, ptr %worker, i32 0, i32 1, !dbg !45
  store i8 77, ptr %0, align 1, !dbg !45
  %1 = load i8, ptr %0, align 1, !dbg !45
  store ptr %worker, ptr %workerPtr, align 8, !dbg !46
  %2 = load ptr, ptr %workerPtr, align 8, !dbg !46
  %3 = load ptr, ptr %workerPtr, align 8, !dbg !47
  call void @fill_employee(ptr %3, i32 11, i8 70), !dbg !47
  %4 = getelementptr %struct.Point, ptr %origin, i32 0, i32 0, !dbg !48
  store i32 3, ptr %4, align 4, !dbg !48
  %5 = load i32, ptr %4, align 4, !dbg !48
  %6 = getelementptr %struct.Point, ptr %origin, i32 0, i32 1, !dbg !49
  store i32 4, ptr %6, align 4, !dbg !49
  %7 = load i32, ptr %6, align 4, !dbg !49
  store i32 8, ptr %sz, align 4, !dbg !50
  %8 = load i32, ptr %sz, align 4, !dbg !50
  %9 = load i32, ptr %sz, align 4, !dbg !51
  %10 = icmp ne i32 %9, 8, !dbg !51
  br i1 %10, label %then, label %else, !dbg !51

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !52
  %11 = load i32, ptr %err, align 4, !dbg !52
  br label %if.end, !dbg !52

else:                                             ; preds = %entry
  br label %if.end, !dbg !52

if.end:                                           ; preds = %else, %then
  store i32 8, ptr %sz, align 4, !dbg !53
  %12 = load i32, ptr %sz, align 4, !dbg !53
  %13 = load i32, ptr %sz, align 4, !dbg !54
  %14 = icmp ne i32 %13, 8, !dbg !54
  br i1 %14, label %then1, label %else2, !dbg !54

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !55
  %15 = load i32, ptr %err, align 4, !dbg !55
  br label %if.end3, !dbg !55

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !55

if.end3:                                          ; preds = %else2, %then1
  store i32 8, ptr %sz, align 4, !dbg !56
  %16 = load i32, ptr %sz, align 4, !dbg !56
  %17 = load i32, ptr %sz, align 4, !dbg !57
  %18 = icmp ne i32 %17, 8, !dbg !57
  br i1 %18, label %then4, label %else5, !dbg !57

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !58
  %19 = load i32, ptr %err, align 4, !dbg !58
  br label %if.end6, !dbg !58

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !58

if.end6:                                          ; preds = %else5, %then4
  store i32 8, ptr %sz, align 4, !dbg !59
  %20 = load i32, ptr %sz, align 4, !dbg !59
  %21 = load i32, ptr %sz, align 4, !dbg !60
  %22 = icmp ne i32 %21, 8, !dbg !60
  br i1 %22, label %then7, label %else8, !dbg !60

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !61
  %23 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end9, !dbg !61

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !61

if.end9:                                          ; preds = %else8, %then7
  %24 = call i64 @strlen(ptr @0), !dbg !62
  store i64 %24, ptr %len, align 8, !dbg !62
  %25 = load i64, ptr %len, align 8, !dbg !62
  %26 = load i64, ptr %len, align 8, !dbg !63
  %27 = icmp ne i64 %26, 2, !dbg !63
  br i1 %27, label %then10, label %else11, !dbg !63

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !64
  %28 = load i32, ptr %err, align 4, !dbg !64
  br label %if.end12, !dbg !64

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !64

if.end12:                                         ; preds = %else11, %then10
  %29 = getelementptr %struct.Employee, ptr %worker, i32 0, i32 0, !dbg !65
  %30 = load i32, ptr %29, align 4, !dbg !65
  store i32 %30, ptr %id, align 4, !dbg !65
  %31 = load i32, ptr %id, align 4, !dbg !65
  %32 = load i32, ptr %id, align 4, !dbg !66
  %33 = icmp ne i32 %32, 11, !dbg !66
  br i1 %33, label %then13, label %else14, !dbg !66

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !67
  %34 = load i32, ptr %err, align 4, !dbg !67
  br label %if.end15, !dbg !67

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !67

if.end15:                                         ; preds = %else14, %then13
  %35 = load ptr, ptr %workerPtr, align 8, !dbg !68
  %36 = getelementptr %struct.Employee, ptr %35, i32 0, i32 0, !dbg !68
  %37 = load i32, ptr %36, align 4, !dbg !68
  store i32 %37, ptr %id, align 4, !dbg !68
  %38 = load i32, ptr %id, align 4, !dbg !68
  %39 = load i32, ptr %id, align 4, !dbg !69
  %40 = icmp ne i32 %39, 11, !dbg !69
  br i1 %40, label %then16, label %else17, !dbg !69

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !70
  %41 = load i32, ptr %err, align 4, !dbg !70
  br label %if.end18, !dbg !70

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !70

if.end18:                                         ; preds = %else17, %then16
  %42 = load ptr, ptr %workerPtr, align 8, !dbg !71
  %43 = getelementptr %struct.Employee, ptr %42, i32 0, i32 1, !dbg !71
  %44 = load i8, ptr %43, align 1, !dbg !71
  %45 = sext i8 %44 to i32, !dbg !71
  store i32 %45, ptr %sex, align 4, !dbg !71
  %46 = load i32, ptr %sex, align 4, !dbg !71
  %47 = load i32, ptr %sex, align 4, !dbg !72
  %48 = icmp ne i32 %47, 70, !dbg !72
  br i1 %48, label %then19, label %else20, !dbg !72

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4, !dbg !73
  %49 = load i32, ptr %err, align 4, !dbg !73
  br label %if.end21, !dbg !73

else20:                                           ; preds = %if.end18
  br label %if.end21, !dbg !73

if.end21:                                         ; preds = %else20, %then19
  %50 = getelementptr %struct.Point, ptr %origin, i32 0, i32 0, !dbg !74
  %51 = load i32, ptr %50, align 4, !dbg !74
  store i32 %51, ptr %id, align 4, !dbg !74
  %52 = load i32, ptr %id, align 4, !dbg !74
  %53 = load i32, ptr %id, align 4, !dbg !75
  %54 = icmp ne i32 %53, 3, !dbg !75
  br i1 %54, label %then22, label %else23, !dbg !75

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4, !dbg !76
  %55 = load i32, ptr %err, align 4, !dbg !76
  br label %if.end24, !dbg !76

else23:                                           ; preds = %if.end21
  br label %if.end24, !dbg !76

if.end24:                                         ; preds = %else23, %then22
  %56 = getelementptr %struct.Point, ptr %origin, i32 0, i32 1, !dbg !77
  %57 = load i32, ptr %56, align 4, !dbg !77
  store i32 %57, ptr %sex, align 4, !dbg !77
  %58 = load i32, ptr %sex, align 4, !dbg !77
  %59 = load i32, ptr %sex, align 4, !dbg !78
  %60 = icmp ne i32 %59, 4, !dbg !78
  br i1 %60, label %then25, label %else26, !dbg !78

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4, !dbg !79
  %61 = load i32, ptr %err, align 4, !dbg !79
  br label %if.end27, !dbg !79

else26:                                           ; preds = %if.end24
  br label %if.end27, !dbg !79

if.end27:                                         ; preds = %else26, %then25
  %62 = load i32, ptr %err, align 4, !dbg !80
  %63 = icmp eq i32 %62, 0, !dbg !80
  br i1 %63, label %then28, label %else29, !dbg !80

then28:                                           ; preds = %if.end27
  %64 = call i32 (ptr, ...) @printf(ptr @1), !dbg !81
  br label %if.end30, !dbg !81

else29:                                           ; preds = %if.end27
  %65 = call i32 (ptr, ...) @printf(ptr @2), !dbg !83
  br label %if.end30, !dbg !83

if.end30:                                         ; preds = %else29, %then28
  %66 = load i32, ptr %err, align 4, !dbg !85
  ret i32 %66, !dbg !85
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "36.typedef_struct.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "fill_employee", linkageName: "fill_employee", scope: null, file: !3, line: 24, type: !5, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !8, !9, !10}
!7 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!11 = !DILocalVariable(name: "sex", arg: 3, scope: !4, file: !3, line: 24, type: !10)
!12 = !DILocation(line: 24, column: 6, scope: !4)
!13 = !DILocalVariable(name: "id", arg: 2, scope: !4, file: !3, line: 24, type: !9)
!14 = !DILocalVariable(name: "employee", arg: 1, scope: !4, file: !3, line: 24, type: !8)
!15 = !DILocation(line: 25, column: 3, scope: !4)
!16 = !DILocation(line: 26, column: 3, scope: !4)
!17 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 29, type: !18, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2)
!18 = !DISubroutineType(types: !19)
!19 = !{!9}
!20 = !DILocalVariable(name: "len", scope: !17, file: !3, line: 37, type: !21)
!21 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!22 = !DILocation(line: 37, column: 3, scope: !17)
!23 = !DILocalVariable(name: "sex", scope: !17, file: !3, line: 36, type: !9)
!24 = !DILocation(line: 36, column: 3, scope: !17)
!25 = !DILocalVariable(name: "id", scope: !17, file: !3, line: 35, type: !9)
!26 = !DILocation(line: 35, column: 3, scope: !17)
!27 = !DILocalVariable(name: "sz", scope: !17, file: !3, line: 34, type: !9)
!28 = !DILocation(line: 34, column: 3, scope: !17)
!29 = !DILocalVariable(name: "origin", scope: !17, file: !3, line: 33, type: !30)
!30 = !DICompositeType(tag: DW_TAG_structure_type, name: "Point", file: !3, size: 64, align: 32, elements: !31)
!31 = !{!32, !33}
!32 = !DIDerivedType(tag: DW_TAG_member, name: "x", file: !3, baseType: !9, size: 32, align: 32)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "y", file: !3, baseType: !9, size: 32, align: 32, offset: 32)
!34 = !DILocation(line: 33, column: 3, scope: !17)
!35 = !DILocalVariable(name: "workerPtr", scope: !17, file: !3, line: 32, type: !8)
!36 = !DILocation(line: 32, column: 3, scope: !17)
!37 = !DILocalVariable(name: "worker", scope: !17, file: !3, line: 31, type: !38)
!38 = !DICompositeType(tag: DW_TAG_structure_type, name: "Employee", file: !3, size: 64, align: 32, elements: !39)
!39 = !{!40, !41}
!40 = !DIDerivedType(tag: DW_TAG_member, name: "id", file: !3, baseType: !9, size: 32, align: 32)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "sex", file: !3, baseType: !10, size: 8, align: 8, offset: 32)
!42 = !DILocation(line: 31, column: 3, scope: !17)
!43 = !DILocalVariable(name: "err", scope: !17, file: !3, line: 30, type: !9)
!44 = !DILocation(line: 30, column: 3, scope: !17)
!45 = !DILocation(line: 39, column: 3, scope: !17)
!46 = !DILocation(line: 40, column: 3, scope: !17)
!47 = !DILocation(line: 41, column: 3, scope: !17)
!48 = !DILocation(line: 43, column: 3, scope: !17)
!49 = !DILocation(line: 44, column: 3, scope: !17)
!50 = !DILocation(line: 46, column: 3, scope: !17)
!51 = !DILocation(line: 47, column: 3, scope: !17)
!52 = !DILocation(line: 47, column: 16, scope: !17)
!53 = !DILocation(line: 48, column: 3, scope: !17)
!54 = !DILocation(line: 49, column: 3, scope: !17)
!55 = !DILocation(line: 49, column: 16, scope: !17)
!56 = !DILocation(line: 50, column: 3, scope: !17)
!57 = !DILocation(line: 51, column: 3, scope: !17)
!58 = !DILocation(line: 51, column: 16, scope: !17)
!59 = !DILocation(line: 52, column: 3, scope: !17)
!60 = !DILocation(line: 53, column: 3, scope: !17)
!61 = !DILocation(line: 53, column: 16, scope: !17)
!62 = !DILocation(line: 55, column: 3, scope: !17)
!63 = !DILocation(line: 56, column: 3, scope: !17)
!64 = !DILocation(line: 56, column: 17, scope: !17)
!65 = !DILocation(line: 58, column: 3, scope: !17)
!66 = !DILocation(line: 59, column: 3, scope: !17)
!67 = !DILocation(line: 59, column: 17, scope: !17)
!68 = !DILocation(line: 60, column: 3, scope: !17)
!69 = !DILocation(line: 61, column: 3, scope: !17)
!70 = !DILocation(line: 61, column: 17, scope: !17)
!71 = !DILocation(line: 62, column: 3, scope: !17)
!72 = !DILocation(line: 63, column: 3, scope: !17)
!73 = !DILocation(line: 63, column: 19, scope: !17)
!74 = !DILocation(line: 64, column: 3, scope: !17)
!75 = !DILocation(line: 65, column: 3, scope: !17)
!76 = !DILocation(line: 65, column: 16, scope: !17)
!77 = !DILocation(line: 66, column: 3, scope: !17)
!78 = !DILocation(line: 67, column: 3, scope: !17)
!79 = !DILocation(line: 67, column: 17, scope: !17)
!80 = !DILocation(line: 69, column: 3, scope: !17)
!81 = !DILocation(line: 70, column: 5, scope: !82)
!82 = distinct !DILexicalBlock(scope: !17, file: !3, line: 69, column: 17)
!83 = !DILocation(line: 72, column: 5, scope: !84)
!84 = distinct !DILexicalBlock(scope: !17, file: !3, line: 71, column: 10)
!85 = !DILocation(line: 74, column: 3, scope: !17)
