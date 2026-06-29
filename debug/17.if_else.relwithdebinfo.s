	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_accumulateFlags
	.p2align	2
_accumulateFlags:
Lfunc_begin0:
	.file	1 "../tests" "17.if_else.c"
	.loc	1 4 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp3:
	.loc	1 5 3 prologue_end
	stp	w0, wzr, [sp, #8]
	.loc	1 6 3
	tbz	w0, #31, LBB0_2
Ltmp4:
	.loc	1 7 5
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
Ltmp5:
LBB0_2:
	.loc	1 9 3
	ldp	w8, w9, [sp, #8]
	mov	w10, #4
	mov	w11, #2
	.loc	1 0 0 is_stmt 0
	cmp	w8, #0
	csel	w10, w11, w10, eq
	.loc	1 14 3 is_stmt 1
	cmp	w8, #11
	.loc	1 0 0 is_stmt 0
	add	w9, w9, w10
	str	w9, [sp, #12]
	.loc	1 14 3
	b.lt	LBB0_4
Ltmp6:
	.loc	1 15 5 is_stmt 1
	ldr	w8, [sp, #12]
	add	w8, w8, #8
	str	w8, [sp, #12]
Ltmp7:
LBB0_4:
	.loc	1 17 3
	ldr	w0, [sp, #12]
	.loc	1 17 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp8:
Lfunc_end0:
	.cfi_endproc

	.globl	_signBucket
	.p2align	2
_signBucket:
Lfunc_begin1:
	.loc	1 21 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	mov	w8, #2
Ltmp9:
	.loc	1 23 3 prologue_end
	cmp	w0, #0
	cinc	w8, w8, ne
	csinc	w8, w8, wzr, ge
	.loc	1 21 5
	stp	w0, w8, [sp, #8]
	.loc	1 30 3
	mov	w0, w8
	.loc	1 30 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp10:
Lfunc_end1:
	.cfi_endproc

	.globl	_decadeBucket
	.p2align	2
_decadeBucket:
Lfunc_begin2:
	.loc	1 34 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp11:
	.loc	1 36 3 prologue_end
	cmp	w0, #10
	.loc	1 34 5
	str	w0, [sp, #8]
	.loc	1 36 3
	b.ge	LBB2_2
	.loc	1 0 3 is_stmt 0
	mov	w0, wzr
	.loc	1 36 3
	b	LBB2_3
LBB2_2:
	.loc	1 38 10 is_stmt 1
	ldr	w8, [sp, #8]
	mov	w9, #2
	cmp	w8, #30
	cinc	w9, w9, ge
	cmp	w8, #20
	csinc	w0, w9, wzr, ge
LBB2_3:
	.loc	1 0 0 is_stmt 0
	str	w0, [sp, #12]
	.loc	1 45 3 epilogue_begin is_stmt 1
	add	sp, sp, #16
	ret
Ltmp12:
Lfunc_end2:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin3:
	.loc	1 48 0
	.cfi_startproc
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp13:
	.loc	1 51 3 prologue_end
	mov	w0, #-5
	.loc	1 49 3
	str	wzr, [sp, #12]
	.loc	1 51 3
	bl	_accumulateFlags
	cmp	w0, #5
	b.eq	LBB3_2
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 51 33
	str	w8, [sp, #12]
LBB3_2:
	.loc	1 52 3 is_stmt 1
	mov	w0, wzr
	bl	_accumulateFlags
	cmp	w0, #2
	b.eq	LBB3_4
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 52 32
	str	w8, [sp, #12]
LBB3_4:
	.loc	1 53 3 is_stmt 1
	mov	w0, #5
	bl	_accumulateFlags
	cmp	w0, #4
	b.eq	LBB3_6
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 53 32
	str	w8, [sp, #12]
LBB3_6:
	.loc	1 54 3 is_stmt 1
	mov	w0, #15
	bl	_accumulateFlags
	cmp	w0, #12
	b.eq	LBB3_8
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 54 34
	str	w8, [sp, #12]
LBB3_8:
	.loc	1 56 3 is_stmt 1
	mov	w0, #-1
	bl	_signBucket
	cmp	w0, #1
	b.eq	LBB3_10
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 56 28
	str	w8, [sp, #12]
LBB3_10:
	.loc	1 57 3 is_stmt 1
	mov	w0, wzr
	bl	_signBucket
	cmp	w0, #2
	b.eq	LBB3_12
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 57 27
	str	w8, [sp, #12]
LBB3_12:
	.loc	1 58 3 is_stmt 1
	mov	w0, #7
	bl	_signBucket
	cmp	w0, #3
	b.eq	LBB3_14
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 58 27
	str	w8, [sp, #12]
LBB3_14:
	.loc	1 60 3 is_stmt 1
	mov	w0, #5
	bl	_decadeBucket
	cbz	w0, LBB3_16
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 60 29
	str	w8, [sp, #12]
LBB3_16:
	.loc	1 61 3 is_stmt 1
	mov	w0, #15
	bl	_decadeBucket
	cmp	w0, #1
	b.eq	LBB3_18
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 61 30
	str	w8, [sp, #12]
LBB3_18:
	.loc	1 62 3 is_stmt 1
	mov	w0, #25
	bl	_decadeBucket
	cmp	w0, #2
	b.eq	LBB3_20
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 62 30
	str	w8, [sp, #12]
LBB3_20:
	.loc	1 63 3 is_stmt 1
	mov	w0, #35
	bl	_decadeBucket
	cmp	w0, #3
	b.eq	LBB3_22
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 63 30
	str	w8, [sp, #12]
LBB3_22:
	.loc	1 65 3 is_stmt 1
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
	.loc	1 70 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #16]
	ldr	w0, [sp, #12]
	add	sp, sp, #32
	ret
Ltmp14:
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
Lfunc_end3:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_2:
	.asciz	"17.if_else.c PASS\n"

l___unnamed_1:
	.asciz	"17.if_else.c FAIL\n"

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
	.long	17
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end3-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	26
	.long	26
	.byte	1
	.byte	4
	.long	260

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	81
	.byte	1
	.byte	4
	.long	260
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	75
	.byte	1
	.byte	5
	.long	260
	.byte	0
	.byte	2
	.quad	Lfunc_begin1
.set Lset5, Lfunc_end1-Lfunc_begin1
	.long	Lset5

	.byte	1
	.byte	111
	.long	42
	.long	42
	.byte	1
	.byte	21
	.long	260

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	81
	.byte	1
	.byte	21
	.long	260
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	83
	.byte	1
	.byte	22
	.long	260
	.byte	0
	.byte	2
	.quad	Lfunc_begin2
.set Lset6, Lfunc_end2-Lfunc_begin2
	.long	Lset6

	.byte	1
	.byte	111
	.long	53
	.long	53
	.byte	1
	.byte	34
	.long	260

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	81
	.byte	1
	.byte	34
	.long	260
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	83
	.byte	1
	.byte	35
	.long	260
	.byte	0
	.byte	2
	.quad	Lfunc_begin3
.set Lset7, Lfunc_end3-Lfunc_begin3
	.long	Lset7

	.byte	1
	.byte	111
	.long	66
	.long	66
	.byte	1
	.byte	48
	.long	260

	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	90
	.byte	1
	.byte	49
	.long	260
	.byte	0
	.byte	5
	.long	71
	.byte	5
	.byte	4
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"17.if_else.c"
	.asciz	"../tests"
	.asciz	"accumulateFlags"
	.asciz	"signBucket"
	.asciz	"decadeBucket"
	.asciz	"main"
	.asciz	"int"
	.asciz	"flags"
	.asciz	"n"
	.asciz	"bucket"
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
	.long	1
	.long	2
	.long	-1
	.long	-1846806892
	.long	325491929
	.long	2090499946
	.long	-1896781834
.set Lset8, LNames1-Lnames_begin
	.long	Lset8
.set Lset9, LNames2-Lnames_begin
	.long	Lset9
.set Lset10, LNames3-Lnames_begin
	.long	Lset10
.set Lset11, LNames0-Lnames_begin
	.long	Lset11
LNames1:
	.long	42
	.long	1
	.long	100
	.long	0
LNames2:
	.long	53
	.long	1
	.long	158
	.long	0
LNames3:
	.long	66
	.long	1
	.long	216
	.long	0
LNames0:
	.long	26
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
	.long	1
	.long	1
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
	.long	193495088
.set Lset12, Ltypes0-Ltypes_begin
	.long	Lset12
Ltypes0:
	.long	71
	.long	1
	.long	260
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
