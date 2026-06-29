	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_swap
	.p2align	2
_swap:
Lfunc_begin0:
	.file	1 "../tests" "25.quick_sort.c"
	.loc	1 3 0
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
Ltmp1:
	.loc	1 4 3 prologue_end
	ldr	w8, [x0]
	.loc	1 5 3
	ldr	w9, [x1]
	.loc	1 3 6
	stp	x0, x1, [sp, #8]
	.loc	1 4 3
	str	w8, [sp, #28]
	.loc	1 5 3
	str	w9, [x0]
	.loc	1 6 3
	str	w8, [x1]
	.loc	1 6 3 epilogue_begin is_stmt 0
	add	sp, sp, #32
	ret
Ltmp2:
Lfunc_end0:
	.cfi_endproc

	.globl	_partition
	.p2align	2
_partition:
Lfunc_begin1:
	.loc	1 9 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp3:
	.loc	1 10 3 prologue_end
	ldr	w8, [x0, w2, sxtw #2]
	.loc	1 11 3
	sub	w9, w1, #1
	.loc	1 9 5
	str	x0, [sp]
	stp	w1, w2, [sp, #12]
	.loc	1 10 3
	stp	w8, w9, [sp, #20]
	b	LBB1_2
LBB1_1:
Ltmp4:
	.loc	1 15 7
	ldr	w8, [sp, #28]
	add	w1, w8, #1
Ltmp5:
LBB1_2:
	.loc	1 12 8
	ldr	w8, [sp, #16]
	.loc	1 0 0 is_stmt 0
	str	w1, [sp, #28]
	.loc	1 12 8
	sub	w9, w8, #1
	.loc	1 0 0
	ldr	x8, [sp]
	.loc	1 12 8
	cmp	w1, w9
	b.gt	LBB1_5
Ltmp6:
	.loc	1 13 5 is_stmt 1
	ldrsw	x9, [sp, #28]
	ldr	w8, [x8, x9, lsl #2]
	ldr	w9, [sp, #20]
	cmp	w8, w9
	b.gt	LBB1_1
Ltmp7:
	.loc	1 14 7
	ldp	w8, w10, [sp, #24]
	.loc	1 15 7
	ldr	x9, [sp]
	.loc	1 14 7
	sxtw	x10, w10
	add	w8, w8, #1
	.loc	1 15 7
	add	x0, x9, w8, sxtw #2
	add	x1, x9, x10, lsl #2
	.loc	1 14 7
	str	w8, [sp, #24]
	.loc	1 15 7
	bl	_swap
	b	LBB1_1
Ltmp8:
LBB1_5:
	.loc	1 18 3
	ldr	w9, [sp, #24]
	ldr	x10, [sp]
	ldrsw	x11, [sp, #16]
	add	w9, w9, #1
	add	x1, x10, x11, lsl #2
	add	x0, x8, w9, sxtw #2
	bl	_swap
	.loc	1 19 3
	ldr	w8, [sp, #24]
	.loc	1 19 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #32]
	add	w0, w8, #1
	add	sp, sp, #48
	ret
Ltmp9:
Lfunc_end1:
	.cfi_endproc

	.globl	_quickSort
	.p2align	2
_quickSort:
Lfunc_begin2:
	.loc	1 22 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp10:
	.loc	1 23 3 prologue_end
	cmp	w1, w2
	.loc	1 22 6
	str	x0, [sp, #8]
	stp	w1, w2, [sp, #20]
	.loc	1 23 3
	b.ge	LBB2_2
Ltmp11:
	.loc	1 24 5
	ldp	w1, w2, [sp, #20]
	ldr	x0, [sp, #8]
	bl	_partition
	.loc	1 25 5
	ldr	x8, [sp, #8]
	ldr	w1, [sp, #20]
	sub	w2, w0, #1
	.loc	1 24 5
	str	w0, [sp, #28]
	.loc	1 25 5
	mov	x0, x8
	bl	_quickSort
	.loc	1 26 5
	ldp	w2, w8, [sp, #24]
	ldr	x0, [sp, #8]
	add	w1, w8, #1
	bl	_quickSort
LBB2_2:
	.loc	1 26 5 epilogue_begin
	ldp	x29, x30, [sp, #32]
	add	sp, sp, #48
	ret
Ltmp12:
Lfunc_end2:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin3:
	.loc	1 30 0
	.cfi_startproc
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]
	.cfi_def_cfa_offset 64
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #10
	mov	w9, #7
Ltmp13:
	.loc	1 41 3 prologue_end
	add	x0, sp, #16
	.loc	1 31 3
	stp	wzr, w8, [sp, #12]
	mov	x8, #8
	.loc	1 41 3
	mov	w1, wzr
	.loc	1 34 3
	str	w9, [sp, #20]
	mov	x9, #1
	movk	x8, #9, lsl #32
	movk	x9, #5, lsl #32
	.loc	1 41 3
	mov	w2, #5
	.loc	1 35 3
	stp	x8, x9, [sp, #24]
	mov	w8, #6
	.loc	1 39 3
	str	w8, [sp, #40]
	.loc	1 41 3
	bl	_quickSort
	.loc	1 43 3
	ldr	w8, [sp, #16]
	cmp	w8, #1
	b.eq	LBB3_2
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 43 20
	str	w8, [sp, #12]
LBB3_2:
	.loc	1 44 3 is_stmt 1
	ldr	w8, [sp, #20]
	cmp	w8, #5
	b.eq	LBB3_4
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 44 20
	str	w8, [sp, #12]
LBB3_4:
	.loc	1 45 3 is_stmt 1
	ldr	w8, [sp, #24]
	cmp	w8, #7
	b.eq	LBB3_6
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 45 20
	str	w8, [sp, #12]
LBB3_6:
	.loc	1 46 3 is_stmt 1
	ldr	w8, [sp, #28]
	cmp	w8, #8
	b.eq	LBB3_8
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 46 20
	str	w8, [sp, #12]
LBB3_8:
	.loc	1 47 3 is_stmt 1
	ldr	w8, [sp, #32]
	cmp	w8, #9
	b.eq	LBB3_10
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 47 20
	str	w8, [sp, #12]
LBB3_10:
	.loc	1 48 3 is_stmt 1
	ldr	w8, [sp, #36]
	cmp	w8, #10
	b.eq	LBB3_12
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 48 21
	str	w8, [sp, #12]
LBB3_12:
	.loc	1 0 21
	mov	w8, #42
	.loc	1 52 3 is_stmt 1
	add	x0, sp, #44
	mov	w1, wzr
	mov	w2, wzr
	.loc	1 51 3
	str	w8, [sp, #44]
	.loc	1 52 3
	bl	_quickSort
	.loc	1 53 3
	ldr	w8, [sp, #44]
	cmp	w8, #42
	b.eq	LBB3_14
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 53 24
	str	w8, [sp, #12]
LBB3_14:
	.loc	1 55 3 is_stmt 1
	ldr	w8, [sp, #12]
	.loc	1 0 0 is_stmt 0
Lloh0:
	adrp	x9, l___unnamed_1@PAGE
Lloh1:
	add	x9, x9, l___unnamed_1@PAGEOFF
	cmp	w8, #0
Lloh2:
	adrp	x8, l___unnamed_2@PAGE
Lloh3:
	add	x8, x8, l___unnamed_2@PAGEOFF
	csel	x0, x8, x9, eq
	bl	_printf
	.loc	1 60 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #48]
	ldr	w0, [sp, #12]
	add	sp, sp, #64
	ret
Ltmp14:
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
Lfunc_end3:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_2:
	.asciz	"25.quick_sort.c PASS\n"

l___unnamed_1:
	.asciz	"25.quick_sort.c FAIL\n"

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
	.byte	11
	.byte	1
	.byte	17
	.byte	1
	.byte	18
	.byte	6
	.byte	0
	.byte	0
	.byte	6
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
	.byte	7
	.byte	15
	.byte	0
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	8
	.byte	1
	.byte	1
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	9
	.byte	33
	.byte	0
	.byte	73
	.byte	19
	.byte	55
	.byte	11
	.byte	0
	.byte	0
	.byte	10
	.byte	36
	.byte	0
	.byte	3
	.byte	14
	.byte	11
	.byte	11
	.byte	62
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
	.long	20
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end3-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	29
	.long	29
	.byte	1
	.byte	3
	.long	414

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	72
	.byte	1
	.byte	3
	.long	428
	.byte	3
	.byte	2
	.byte	145
	.byte	16
	.long	70
	.byte	1
	.byte	3
	.long	428
	.byte	4
	.byte	2
	.byte	145
	.byte	28
	.long	68
	.byte	1
	.byte	4
	.long	421
	.byte	0
	.byte	2
	.quad	Lfunc_begin1
.set Lset5, Lfunc_end1-Lfunc_begin1
	.long	Lset5

	.byte	1
	.byte	111
	.long	34
	.long	34
	.byte	1
	.byte	9
	.long	421

	.byte	3
	.byte	2
	.byte	145
	.byte	0
	.long	93
	.byte	1
	.byte	9
	.long	428
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	89
	.byte	1
	.byte	9
	.long	421
	.byte	3
	.byte	2
	.byte	145
	.byte	16
	.long	84
	.byte	1
	.byte	9
	.long	421
	.byte	4
	.byte	2
	.byte	145
	.byte	28
	.long	74
	.byte	1
	.byte	12
	.long	421
	.byte	4
	.byte	2
	.byte	145
	.byte	24
	.long	76
	.byte	1
	.byte	11
	.long	421
	.byte	4
	.byte	2
	.byte	145
	.byte	20
	.long	78
	.byte	1
	.byte	10
	.long	421
	.byte	0
	.byte	2
	.quad	Lfunc_begin2
.set Lset6, Lfunc_end2-Lfunc_begin2
	.long	Lset6

	.byte	1
	.byte	111
	.long	44
	.long	44
	.byte	1
	.byte	22
	.long	414

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	93
	.byte	1
	.byte	22
	.long	428
	.byte	3
	.byte	2
	.byte	145
	.byte	20
	.long	89
	.byte	1
	.byte	22
	.long	421
	.byte	3
	.byte	2
	.byte	145
	.byte	24
	.long	84
	.byte	1
	.byte	22
	.long	421
	.byte	5
	.quad	Ltmp11
.set Lset7, Ltmp12-Ltmp11
	.long	Lset7
	.byte	4
	.byte	2
	.byte	145
	.byte	28
	.long	97
	.byte	1
	.byte	24
	.long	421
	.byte	0
	.byte	0
	.byte	2
	.quad	Lfunc_begin3
.set Lset8, Lfunc_end3-Lfunc_begin3
	.long	Lset8

	.byte	1
	.byte	111
	.long	54
	.long	54
	.byte	1
	.byte	30
	.long	421

	.byte	4
	.byte	2
	.byte	145
	.byte	44
	.long	100
	.byte	1
	.byte	50
	.long	433
	.byte	4
	.byte	2
	.byte	145
	.byte	40
	.long	127
	.byte	1
	.byte	39
	.long	421
	.byte	4
	.byte	2
	.byte	145
	.byte	16
	.long	93
	.byte	1
	.byte	32
	.long	452
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	129
	.byte	1
	.byte	31
	.long	421
	.byte	0
	.byte	6
	.long	59
	.byte	1
	.byte	0
	.byte	6
	.long	64
	.byte	5
	.byte	4
	.byte	7
	.long	421
	.byte	8
	.long	421
	.byte	9
	.long	445
	.byte	1
	.byte	0
	.byte	10
	.long	107
	.byte	8
	.byte	7
	.byte	8
	.long	421
	.byte	9
	.long	445
	.byte	6
	.byte	0
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"25.quick_sort.c"
	.asciz	"../tests"
	.asciz	"swap"
	.asciz	"partition"
	.asciz	"quickSort"
	.asciz	"main"
	.asciz	"void"
	.asciz	"int"
	.asciz	"t"
	.asciz	"b"
	.asciz	"a"
	.asciz	"j"
	.asciz	"i"
	.asciz	"pivot"
	.asciz	"high"
	.asciz	"low"
	.asciz	"arr"
	.asciz	"pi"
	.asciz	"single"
	.asciz	"__ARRAY_SIZE_TYPE__"
	.asciz	"n"
	.asciz	"err"
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	4
	.long	4
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	0
	.long	-1
	.long	1
	.long	3
	.long	2090739264
	.long	2090499946
	.long	-663617270
	.long	-885878401
.set Lset9, LNames0-Lnames_begin
	.long	Lset9
.set Lset10, LNames3-Lnames_begin
	.long	Lset10
.set Lset11, LNames2-Lnames_begin
	.long	Lset11
.set Lset12, LNames1-Lnames_begin
	.long	Lset12
LNames0:
	.long	29
	.long	1
	.long	42
	.long	0
LNames3:
	.long	54
	.long	1
	.long	328
	.long	0
LNames2:
	.long	44
	.long	1
	.long	228
	.long	0
LNames1:
	.long	34
	.long	1
	.long	114
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
	.long	3
	.long	3
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
	.long	-1
	.long	1
	.long	2090838615
	.long	193495088
	.long	-594775205
.set Lset13, Ltypes0-Ltypes_begin
	.long	Lset13
.set Lset14, Ltypes1-Ltypes_begin
	.long	Lset14
.set Lset15, Ltypes2-Ltypes_begin
	.long	Lset15
Ltypes0:
	.long	59
	.long	1
	.long	414
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	64
	.long	1
	.long	421
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	107
	.long	1
	.long	445
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
