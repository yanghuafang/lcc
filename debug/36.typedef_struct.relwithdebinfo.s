	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_fill_employee
	.p2align	2
_fill_employee:
Lfunc_begin0:
	.file	1 "../tests" "36.typedef_struct.c"
	.loc	1 21 0
	.cfi_startproc
	str	x0, [sp, #-16]!
	.cfi_def_cfa_offset 16
Ltmp1:
	.loc	1 21 6 prologue_end
	str	w1, [sp, #8]
	strb	w2, [sp, #15]
	.loc	1 22 3
	str	w1, [x0]
	.loc	1 23 3
	strb	w2, [x0, #4]
	.loc	1 23 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp2:
Lfunc_end0:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin1:
	.loc	1 26 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]
	.cfi_def_cfa_offset 80
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #77
	add	x9, sp, #16
Ltmp3:
	.loc	1 38 3 prologue_end
	add	x0, sp, #16
	mov	w1, #11
	mov	w2, #70
	.loc	1 27 3
	str	wzr, [sp, #12]
	.loc	1 36 3
	strb	w8, [sp, #20]
	.loc	1 37 3
	str	x9, [sp, #24]
	.loc	1 38 3
	bl	_fill_employee
	mov	x9, #3
	mov	w8, #8
	movk	x9, #4, lsl #32
	.loc	1 44 3
	cmp	w8, #8
	.loc	1 43 3
	str	w8, [sp, #44]
	.loc	1 40 3
	str	x9, [sp, #32]
	.loc	1 44 3
	b.eq	LBB1_2
	.loc	1 0 3 is_stmt 0
	mov	w9, #1
	.loc	1 44 16
	str	w9, [sp, #12]
LBB1_2:
	.loc	1 46 3 is_stmt 1
	cmp	w8, #8
	.loc	1 45 3
	str	w8, [sp, #44]
	.loc	1 46 3
	b.eq	LBB1_4
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 46 16
	str	w8, [sp, #12]
LBB1_4:
	.loc	1 0 16
	mov	w8, #8
	.loc	1 48 3 is_stmt 1
	cmp	w8, #8
	.loc	1 47 3
	str	w8, [sp, #44]
	.loc	1 48 3
	b.eq	LBB1_6
	.loc	1 0 3 is_stmt 0
	mov	w9, #1
	.loc	1 48 16
	str	w9, [sp, #12]
LBB1_6:
	.loc	1 50 3 is_stmt 1
	cmp	w8, #8
	.loc	1 49 3
	str	w8, [sp, #44]
	.loc	1 50 3
	b.eq	LBB1_8
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 50 16
	str	w8, [sp, #12]
LBB1_8:
	.loc	1 52 3 is_stmt 1
Lloh0:
	adrp	x0, l___unnamed_1@PAGE
Lloh1:
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_strlen
	.loc	1 53 3
	cmp	x0, #2
	.loc	1 52 3
	str	x0, [sp, #56]
	.loc	1 53 3
	b.eq	LBB1_10
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 53 17
	str	w8, [sp, #12]
LBB1_10:
	.loc	1 55 3 is_stmt 1
	ldr	w8, [sp, #16]
	.loc	1 56 3
	cmp	w8, #11
	.loc	1 55 3
	str	w8, [sp, #48]
	.loc	1 56 3
	b.eq	LBB1_12
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 56 17
	str	w8, [sp, #12]
LBB1_12:
	.loc	1 57 3 is_stmt 1
	ldr	x8, [sp, #24]
	ldr	w8, [x8]
	.loc	1 58 3
	cmp	w8, #11
	.loc	1 57 3
	str	w8, [sp, #48]
	.loc	1 58 3
	b.eq	LBB1_14
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 58 17
	str	w8, [sp, #12]
LBB1_14:
	.loc	1 59 3 is_stmt 1
	ldr	x8, [sp, #24]
	ldrsb	w8, [x8, #4]
	.loc	1 60 3
	cmp	w8, #70
	.loc	1 59 3
	str	w8, [sp, #52]
	.loc	1 60 3
	b.eq	LBB1_16
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 60 19
	str	w8, [sp, #12]
LBB1_16:
	.loc	1 61 3 is_stmt 1
	ldr	w8, [sp, #32]
	.loc	1 62 3
	cmp	w8, #3
	.loc	1 61 3
	str	w8, [sp, #48]
	.loc	1 62 3
	b.eq	LBB1_18
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 62 16
	str	w8, [sp, #12]
LBB1_18:
	.loc	1 63 3 is_stmt 1
	ldr	w8, [sp, #36]
	.loc	1 64 3
	cmp	w8, #4
	.loc	1 63 3
	str	w8, [sp, #52]
	.loc	1 64 3
	b.eq	LBB1_20
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 64 17
	str	w8, [sp, #12]
LBB1_20:
	.loc	1 66 3 is_stmt 1
	ldr	w8, [sp, #12]
	.loc	1 0 0 is_stmt 0
Lloh2:
	adrp	x9, l___unnamed_2@PAGE
Lloh3:
	add	x9, x9, l___unnamed_2@PAGEOFF
	cmp	w8, #0
Lloh4:
	adrp	x8, l___unnamed_3@PAGE
Lloh5:
	add	x8, x8, l___unnamed_3@PAGEOFF
	csel	x0, x8, x9, eq
	bl	_printf
	.loc	1 71 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #64]
	ldr	w0, [sp, #12]
	add	sp, sp, #80
	ret
Ltmp4:
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
Lfunc_end1:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"hi"

l___unnamed_3:
	.asciz	"36.typedef_struct.c PASS\n"

l___unnamed_2:
	.asciz	"36.typedef_struct.c FAIL\n"

	.section	__DWARF,__debug_abbrev,regular,debug
Lsection_abbrev:
	.byte	1
	.byte	17
	.byte	1
	.byte	37
	.byte	14
	.byte	19
	.byte	5
	.byte	3
	.byte	14
	.byte	16
	.byte	23
	.byte	27
	.byte	14
	.byte	17
	.byte	1
	.byte	18
	.byte	6
	.byte	0
	.byte	0
	.byte	2
	.byte	46
	.byte	1
	.byte	17
	.byte	1
	.byte	18
	.byte	6
	.ascii	"\347\177"
	.byte	25
	.byte	64
	.byte	24
	.byte	110
	.byte	14
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	73
	.byte	19
	.byte	63
	.byte	25
	.byte	0
	.byte	0
	.byte	3
	.byte	5
	.byte	0
	.byte	2
	.byte	24
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	4
	.byte	52
	.byte	0
	.byte	2
	.byte	24
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	5
	.byte	36
	.byte	0
	.byte	3
	.byte	14
	.byte	62
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	6
	.byte	15
	.byte	0
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	7
	.byte	19
	.byte	1
	.byte	3
	.byte	14
	.byte	11
	.byte	11
	.ascii	"\210\001"
	.byte	15
	.byte	0
	.byte	0
	.byte	8
	.byte	13
	.byte	0
	.byte	3
	.byte	14
	.byte	73
	.byte	19
	.ascii	"\210\001"
	.byte	15
	.byte	56
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.section	__DWARF,__debug_info,regular,debug
Lsection_info:
Lcu_begin0:
.set Lset0, Ldebug_info_end0-Ldebug_info_start0
	.long	Lset0
Ldebug_info_start0:
	.short	4
.set Lset1, Lsection_abbrev-Lsection_abbrev
	.long	Lset1
	.byte	8
	.byte	1
	.long	0
	.short	2
	.long	4
.set Lset2, Lline_table_start0-Lsection_line
	.long	Lset2
	.long	24
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end1-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	33
	.long	33
	.byte	1
	.byte	21
	.long	256

	.byte	3
	.byte	2
	.byte	145
	.byte	0
	.long	73
	.byte	1
	.byte	21
	.long	277
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	70
	.byte	1
	.byte	21
	.long	263
	.byte	3
	.byte	2
	.byte	145
	.byte	15
	.long	61
	.byte	1
	.byte	21
	.long	270
	.byte	0
	.byte	2
	.quad	Lfunc_begin1
.set Lset5, Lfunc_end1-Lfunc_begin1
	.long	Lset5

	.byte	1
	.byte	111
	.long	47
	.long	47
	.byte	1
	.byte	26
	.long	263

	.byte	4
	.byte	2
	.byte	145
	.byte	56
	.long	82
	.byte	1
	.byte	34
	.long	282
	.byte	4
	.byte	2
	.byte	145
	.byte	52
	.long	61
	.byte	1
	.byte	33
	.long	263
	.byte	4
	.byte	2
	.byte	145
	.byte	48
	.long	70
	.byte	1
	.byte	32
	.long	263
	.byte	4
	.byte	2
	.byte	145
	.byte	44
	.long	100
	.byte	1
	.byte	31
	.long	263
	.byte	4
	.byte	2
	.byte	145
	.byte	32
	.long	103
	.byte	1
	.byte	30
	.long	289
	.byte	4
	.byte	2
	.byte	145
	.byte	24
	.long	120
	.byte	1
	.byte	29
	.long	277
	.byte	4
	.byte	2
	.byte	145
	.byte	16
	.long	130
	.byte	1
	.byte	28
	.long	319
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	146
	.byte	1
	.byte	27
	.long	263
	.byte	0
	.byte	5
	.long	52
	.byte	1
	.byte	0
	.byte	5
	.long	57
	.byte	5
	.byte	4
	.byte	5
	.long	65
	.byte	6
	.byte	1
	.byte	6
	.long	256
	.byte	5
	.long	86
	.byte	7
	.byte	8
	.byte	7
	.long	110
	.byte	8
	.byte	4
	.byte	8
	.long	116
	.long	263
	.byte	4
	.byte	0
	.byte	8
	.long	118
	.long	263
	.byte	4
	.byte	4
	.byte	0
	.byte	7
	.long	137
	.byte	8
	.byte	4
	.byte	8
	.long	70
	.long	263
	.byte	4
	.byte	0
	.byte	8
	.long	61
	.long	270
	.byte	1
	.byte	4
	.byte	0
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"36.typedef_struct.c"
	.asciz	"../tests"
	.asciz	"fill_employee"
	.asciz	"main"
	.asciz	"void"
	.asciz	"int"
	.asciz	"sex"
	.asciz	"char"
	.asciz	"id"
	.asciz	"employee"
	.asciz	"len"
	.asciz	"unsigned long"
	.asciz	"sz"
	.asciz	"origin"
	.asciz	"Point"
	.asciz	"x"
	.asciz	"y"
	.asciz	"workerPtr"
	.asciz	"worker"
	.asciz	"Employee"
	.asciz	"err"
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	2
	.long	2
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	0
	.long	1
	.long	2090499946
	.long	1544679947
.set Lset6, LNames1-Lnames_begin
	.long	Lset6
.set Lset7, LNames0-Lnames_begin
	.long	Lset7
LNames1:
	.long	47
	.long	1
	.long	114
	.long	0
LNames0:
	.long	33
	.long	1
	.long	42
	.long	0
	.section	__DWARF,__apple_objc,regular,debug
Lobjc_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	1
	.long	0
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	-1
	.section	__DWARF,__apple_namespac,regular,debug
Lnamespac_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	1
	.long	0
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	-1
	.section	__DWARF,__apple_types,regular,debug
Ltypes_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	6
	.long	6
	.long	20
	.long	0
	.long	3
	.short	1
	.short	6
	.short	3
	.short	5
	.short	4
	.short	11
	.long	0
	.long	1
	.long	3
	.long	4
	.long	-1
	.long	5
	.long	-103762318
	.long	233133007
	.long	-48196635
	.long	193495088
	.long	2090838615
	.long	2090147939
.set Lset8, Ltypes3-Ltypes_begin
	.long	Lset8
.set Lset9, Ltypes4-Ltypes_begin
	.long	Lset9
.set Lset10, Ltypes5-Ltypes_begin
	.long	Lset10
.set Lset11, Ltypes1-Ltypes_begin
	.long	Lset11
.set Lset12, Ltypes0-Ltypes_begin
	.long	Lset12
.set Lset13, Ltypes2-Ltypes_begin
	.long	Lset13
Ltypes3:
	.long	86
	.long	1
	.long	282
	.short	36
	.byte	0
	.long	0
Ltypes4:
	.long	110
	.long	1
	.long	289
	.short	19
	.byte	0
	.long	0
Ltypes5:
	.long	137
	.long	1
	.long	319
	.short	19
	.byte	0
	.long	0
Ltypes1:
	.long	57
	.long	1
	.long	263
	.short	36
	.byte	0
	.long	0
Ltypes0:
	.long	52
	.long	1
	.long	256
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	65
	.long	1
	.long	270
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
