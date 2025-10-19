	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_swap
	.p2align	2
_swap:
Lfunc_begin0:
	.file	1 "../tests" "25.quick_sort.c"
	.loc	1 6 0
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
Ltmp1:
	.loc	1 6 6 prologue_end
	str	x0, [sp, #8]
	str	x1, [sp, #16]
	.loc	1 7 3
	ldr	x8, [sp, #8]
	ldr	w8, [x8]
	str	w8, [sp, #28]
	.loc	1 8 3
	ldr	x9, [sp, #8]
	ldr	x8, [sp, #16]
	ldr	w8, [x8]
	str	w8, [x9]
	.loc	1 9 3
	ldr	x9, [sp, #16]
	ldr	w8, [sp, #28]
	str	w8, [x9]
	.loc	1 9 3 epilogue_begin is_stmt 0
	add	sp, sp, #32
	ret
Ltmp2:
Lfunc_end0:
	.cfi_endproc

	.globl	_partition
	.p2align	2
_partition:
Lfunc_begin1:
	.loc	1 12 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp3:
	.loc	1 12 5 prologue_end
	str	x0, [sp]
	str	w1, [sp, #12]
	str	w2, [sp, #16]
	.loc	1 13 3
	ldr	x8, [sp]
	ldrsw	x9, [sp, #16]
	ldr	w8, [x8, x9, lsl #2]
	str	w8, [sp, #20]
	.loc	1 14 3
	ldr	w8, [sp, #12]
	subs	w8, w8, #1
	str	w8, [sp, #24]
	.loc	1 15 8
	ldr	w8, [sp, #12]
	str	w8, [sp, #28]
	b	LBB1_1
LBB1_1:
	.loc	1 15 8
	ldr	w8, [sp, #28]
	ldr	w9, [sp, #16]
	subs	w9, w9, #1
	subs	w8, w8, w9
	b.gt	LBB1_7
	b	LBB1_2
LBB1_2:
Ltmp4:
	.loc	1 16 5
	ldr	x8, [sp]
	ldrsw	x9, [sp, #28]
	ldr	w8, [x8, x9, lsl #2]
	ldr	w9, [sp, #20]
	subs	w8, w8, w9
	b.gt	LBB1_4
	b	LBB1_3
LBB1_3:
Ltmp5:
	.loc	1 17 7
	ldr	w8, [sp, #24]
	add	w8, w8, #1
	str	w8, [sp, #24]
	.loc	1 18 7
	ldr	x8, [sp]
	ldrsw	x9, [sp, #24]
	add	x0, x8, x9, lsl #2
	ldr	x8, [sp]
	ldrsw	x9, [sp, #28]
	add	x1, x8, x9, lsl #2
	bl	_swap
	b	LBB1_5
LBB1_4:
	.loc	1 18 7
	b	LBB1_5
LBB1_5:
	b	LBB1_6
LBB1_6:
	ldr	w8, [sp, #28]
	add	w8, w8, #1
	str	w8, [sp, #28]
	b	LBB1_1
Ltmp6:
LBB1_7:
	.loc	1 21 3
	ldr	x8, [sp]
	ldr	w9, [sp, #24]
	add	w9, w9, #1
	add	x0, x8, w9, sxtw #2
	ldr	x8, [sp]
	ldrsw	x9, [sp, #16]
	add	x1, x8, x9, lsl #2
	bl	_swap
	.loc	1 22 3
	ldr	w8, [sp, #24]
	add	w0, w8, #1
	.loc	1 22 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #32]
	add	sp, sp, #48
	ret
Ltmp7:
Lfunc_end1:
	.cfi_endproc

	.globl	_quickSort
	.p2align	2
_quickSort:
Lfunc_begin2:
	.loc	1 25 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp8:
	.loc	1 25 6 prologue_end
	str	x0, [sp, #8]
	str	w1, [sp, #20]
	str	w2, [sp, #24]
	.loc	1 26 3
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #24]
	subs	w8, w8, w9
	b.ge	LBB2_2
	b	LBB2_1
LBB2_1:
Ltmp9:
	.loc	1 27 5
	ldr	x0, [sp, #8]
	ldr	w1, [sp, #20]
	ldr	w2, [sp, #24]
	bl	_partition
	str	w0, [sp, #28]
	.loc	1 28 5
	ldr	x0, [sp, #8]
	ldr	w1, [sp, #20]
	ldr	w8, [sp, #28]
	subs	w2, w8, #1
	bl	_quickSort
	.loc	1 29 5
	ldr	x0, [sp, #8]
	ldr	w8, [sp, #28]
	add	w1, w8, #1
	ldr	w2, [sp, #24]
	bl	_quickSort
	b	LBB2_3
LBB2_2:
	.loc	1 29 5
	b	LBB2_3
LBB2_3:
	.loc	1 29 5 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #32]
	add	sp, sp, #48
	ret
Ltmp10:
Lfunc_end2:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin3:
	.loc	1 33 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]
	.cfi_def_cfa_offset 64
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w1, wzr
Ltmp11:
	.loc	1 34 3 prologue_end
	str	wzr, [sp, #12]
	add	x0, sp, #16
	.loc	1 36 3
	mov	w8, #10
	str	w8, [sp, #16]
	.loc	1 37 3
	mov	w8, #7
	str	w8, [sp, #20]
	.loc	1 38 3
	mov	w8, #8
	str	w8, [sp, #24]
	.loc	1 39 3
	mov	w8, #9
	str	w8, [sp, #28]
	mov	w8, #1
	.loc	1 40 3
	str	w8, [sp, #32]
	.loc	1 41 3
	mov	w8, #5
	str	w8, [sp, #36]
	.loc	1 42 3
	mov	w8, #6
	str	w8, [sp, #40]
	.loc	1 44 3
	ldr	w8, [sp, #40]
	subs	w2, w8, #1
	bl	_quickSort
	.loc	1 46 3
	ldr	w8, [sp, #16]
	subs	w8, w8, #1
	b.eq	LBB3_2
	b	LBB3_1
LBB3_1:
	.loc	1 46 20 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_3
LBB3_2:
	b	LBB3_3
LBB3_3:
	.loc	1 47 3 is_stmt 1
	ldr	w8, [sp, #20]
	subs	w8, w8, #5
	b.eq	LBB3_5
	b	LBB3_4
LBB3_4:
	.loc	1 47 20 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_6
LBB3_5:
	b	LBB3_6
LBB3_6:
	.loc	1 48 3 is_stmt 1
	ldr	w8, [sp, #24]
	subs	w8, w8, #7
	b.eq	LBB3_8
	b	LBB3_7
LBB3_7:
	.loc	1 48 20 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_9
LBB3_8:
	b	LBB3_9
LBB3_9:
	.loc	1 49 3 is_stmt 1
	ldr	w8, [sp, #28]
	subs	w8, w8, #8
	b.eq	LBB3_11
	b	LBB3_10
LBB3_10:
	.loc	1 49 20 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_12
LBB3_11:
	b	LBB3_12
LBB3_12:
	.loc	1 50 3 is_stmt 1
	ldr	w8, [sp, #32]
	subs	w8, w8, #9
	b.eq	LBB3_14
	b	LBB3_13
LBB3_13:
	.loc	1 50 20 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_15
LBB3_14:
	b	LBB3_15
LBB3_15:
	.loc	1 51 3 is_stmt 1
	ldr	w8, [sp, #36]
	subs	w8, w8, #10
	b.eq	LBB3_17
	b	LBB3_16
LBB3_16:
	.loc	1 51 21 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_18
LBB3_17:
	b	LBB3_18
LBB3_18:
	.loc	1 0 21
	add	x0, sp, #44
	mov	w8, #42
	.loc	1 54 3 is_stmt 1
	str	w8, [sp, #44]
	mov	w2, wzr
	.loc	1 55 3
	mov	w1, w2
	bl	_quickSort
	.loc	1 56 3
	ldr	w8, [sp, #44]
	subs	w8, w8, #42
	b.eq	LBB3_20
	b	LBB3_19
LBB3_19:
	.loc	1 56 24 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_21
LBB3_20:
	b	LBB3_21
LBB3_21:
	.loc	1 58 3 is_stmt 1
	ldr	w8, [sp, #12]
	cbnz	w8, LBB3_23
	b	LBB3_22
LBB3_22:
Ltmp12:
	.loc	1 59 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB3_24
Ltmp13:
LBB3_23:
	.loc	1 61 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB3_24
Ltmp14:
LBB3_24:
	.loc	1 63 3
	ldr	w0, [sp, #12]
	.loc	1 63 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #48]
	add	sp, sp, #64
	ret
Ltmp15:
Lfunc_end3:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"25.quick_sort.c PASS\n"

l___unnamed_2:
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
	.byte	6
	.long	414

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	72
	.byte	1
	.byte	6
	.long	428
	.byte	3
	.byte	2
	.byte	145
	.byte	16
	.long	70
	.byte	1
	.byte	6
	.long	428
	.byte	4
	.byte	2
	.byte	145
	.byte	28
	.long	68
	.byte	1
	.byte	7
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
	.byte	12
	.long	421

	.byte	3
	.byte	2
	.byte	145
	.byte	0
	.long	93
	.byte	1
	.byte	12
	.long	428
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	89
	.byte	1
	.byte	12
	.long	421
	.byte	3
	.byte	2
	.byte	145
	.byte	16
	.long	84
	.byte	1
	.byte	12
	.long	421
	.byte	4
	.byte	2
	.byte	145
	.byte	28
	.long	74
	.byte	1
	.byte	15
	.long	421
	.byte	4
	.byte	2
	.byte	145
	.byte	24
	.long	76
	.byte	1
	.byte	14
	.long	421
	.byte	4
	.byte	2
	.byte	145
	.byte	20
	.long	78
	.byte	1
	.byte	13
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
	.byte	25
	.long	414

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	93
	.byte	1
	.byte	25
	.long	428
	.byte	3
	.byte	2
	.byte	145
	.byte	20
	.long	89
	.byte	1
	.byte	25
	.long	421
	.byte	3
	.byte	2
	.byte	145
	.byte	24
	.long	84
	.byte	1
	.byte	25
	.long	421
	.byte	5
	.quad	Ltmp9
.set Lset7, Ltmp10-Ltmp9
	.long	Lset7
	.byte	4
	.byte	2
	.byte	145
	.byte	28
	.long	97
	.byte	1
	.byte	27
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
	.byte	33
	.long	421

	.byte	4
	.byte	2
	.byte	145
	.byte	44
	.long	100
	.byte	1
	.byte	53
	.long	433
	.byte	4
	.byte	2
	.byte	145
	.byte	40
	.long	127
	.byte	1
	.byte	42
	.long	421
	.byte	4
	.byte	2
	.byte	145
	.byte	16
	.long	93
	.byte	1
	.byte	35
	.long	452
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	129
	.byte	1
	.byte	34
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
