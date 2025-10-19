	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_accumulateFlags
	.p2align	2
_accumulateFlags:
Lfunc_begin0:
	.file	1 "../tests" "17.if_else.c"
	.loc	1 6 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp1:
	.loc	1 6 5 prologue_end
	str	w0, [sp, #8]
	.loc	1 7 3
	str	wzr, [sp, #12]
	.loc	1 8 3
	ldr	w8, [sp, #8]
	tbz	w8, #31, LBB0_2
	b	LBB0_1
LBB0_1:
Ltmp2:
	.loc	1 9 5
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB0_3
LBB0_2:
	.loc	1 9 5
	b	LBB0_3
Ltmp3:
LBB0_3:
	.loc	1 11 3
	ldr	w8, [sp, #8]
	cbnz	w8, LBB0_5
	b	LBB0_4
LBB0_4:
Ltmp4:
	.loc	1 12 5
	ldr	w8, [sp, #12]
	add	w8, w8, #2
	str	w8, [sp, #12]
	b	LBB0_6
Ltmp5:
LBB0_5:
	.loc	1 14 5
	ldr	w8, [sp, #12]
	add	w8, w8, #4
	str	w8, [sp, #12]
	b	LBB0_6
Ltmp6:
LBB0_6:
	.loc	1 16 3
	ldr	w8, [sp, #8]
	subs	w8, w8, #10
	b.le	LBB0_8
	b	LBB0_7
LBB0_7:
Ltmp7:
	.loc	1 17 5
	ldr	w8, [sp, #12]
	add	w8, w8, #8
	str	w8, [sp, #12]
	b	LBB0_9
LBB0_8:
	.loc	1 17 5
	b	LBB0_9
Ltmp8:
LBB0_9:
	.loc	1 19 3
	ldr	w0, [sp, #12]
	.loc	1 19 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp9:
Lfunc_end0:
	.cfi_endproc

	.globl	_signBucket
	.p2align	2
_signBucket:
Lfunc_begin1:
	.loc	1 23 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp11:
	.loc	1 23 5 prologue_end
	str	w0, [sp, #8]
	.loc	1 25 3
	ldr	w8, [sp, #8]
	tbz	w8, #31, LBB1_2
	b	LBB1_1
LBB1_1:
Ltmp12:
	.loc	1 26 5
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB1_6
Ltmp13:
LBB1_2:
	.loc	1 27 10
	ldr	w8, [sp, #8]
	cbnz	w8, LBB1_4
	b	LBB1_3
LBB1_3:
Ltmp14:
	.loc	1 28 5
	mov	w8, #2
	str	w8, [sp, #12]
	b	LBB1_5
Ltmp15:
LBB1_4:
	.loc	1 30 5
	mov	w8, #3
	str	w8, [sp, #12]
	b	LBB1_5
LBB1_5:
	.loc	1 30 5
	b	LBB1_6
Ltmp16:
LBB1_6:
	.loc	1 32 3
	ldr	w0, [sp, #12]
	.loc	1 32 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp17:
Lfunc_end1:
	.cfi_endproc

	.globl	_decadeBucket
	.p2align	2
_decadeBucket:
Lfunc_begin2:
	.loc	1 36 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp19:
	.loc	1 36 5 prologue_end
	str	w0, [sp, #8]
	.loc	1 38 3
	ldr	w8, [sp, #8]
	subs	w8, w8, #9
	b.gt	LBB2_2
	b	LBB2_1
LBB2_1:
Ltmp20:
	.loc	1 39 5
	str	wzr, [sp, #12]
	b	LBB2_9
Ltmp21:
LBB2_2:
	.loc	1 40 10
	ldr	w8, [sp, #8]
	subs	w8, w8, #19
	b.gt	LBB2_4
	b	LBB2_3
LBB2_3:
Ltmp22:
	.loc	1 41 5
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB2_8
Ltmp23:
LBB2_4:
	.loc	1 42 10
	ldr	w8, [sp, #8]
	subs	w8, w8, #29
	b.gt	LBB2_6
	b	LBB2_5
LBB2_5:
Ltmp24:
	.loc	1 43 5
	mov	w8, #2
	str	w8, [sp, #12]
	b	LBB2_7
Ltmp25:
LBB2_6:
	.loc	1 45 5
	mov	w8, #3
	str	w8, [sp, #12]
	b	LBB2_7
LBB2_7:
	.loc	1 45 5
	b	LBB2_8
LBB2_8:
	.loc	1 45 5
	b	LBB2_9
Ltmp26:
LBB2_9:
	.loc	1 47 3
	ldr	w0, [sp, #12]
	.loc	1 47 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp27:
Lfunc_end2:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin3:
	.loc	1 50 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp28:
	.loc	1 51 3 prologue_end
	str	wzr, [sp, #12]
	.loc	1 53 3
	mov	w0, #-5
	bl	_accumulateFlags
	subs	w8, w0, #5
	b.eq	LBB3_2
	b	LBB3_1
LBB3_1:
	.loc	1 53 33 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_3
LBB3_2:
	b	LBB3_3
LBB3_3:
	.loc	1 54 3 is_stmt 1
	mov	w0, wzr
	bl	_accumulateFlags
	subs	w8, w0, #2
	b.eq	LBB3_5
	b	LBB3_4
LBB3_4:
	.loc	1 54 32 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_6
LBB3_5:
	b	LBB3_6
LBB3_6:
	.loc	1 55 3 is_stmt 1
	mov	w0, #5
	bl	_accumulateFlags
	subs	w8, w0, #4
	b.eq	LBB3_8
	b	LBB3_7
LBB3_7:
	.loc	1 55 32 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_9
LBB3_8:
	b	LBB3_9
LBB3_9:
	.loc	1 56 3 is_stmt 1
	mov	w0, #15
	bl	_accumulateFlags
	subs	w8, w0, #12
	b.eq	LBB3_11
	b	LBB3_10
LBB3_10:
	.loc	1 56 34 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_12
LBB3_11:
	b	LBB3_12
LBB3_12:
	.loc	1 58 3 is_stmt 1
	mov	w0, #-1
	bl	_signBucket
	subs	w8, w0, #1
	b.eq	LBB3_14
	b	LBB3_13
LBB3_13:
	.loc	1 58 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_15
LBB3_14:
	b	LBB3_15
LBB3_15:
	.loc	1 59 3 is_stmt 1
	mov	w0, wzr
	bl	_signBucket
	subs	w8, w0, #2
	b.eq	LBB3_17
	b	LBB3_16
LBB3_16:
	.loc	1 59 27 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_18
LBB3_17:
	b	LBB3_18
LBB3_18:
	.loc	1 60 3 is_stmt 1
	mov	w0, #7
	bl	_signBucket
	subs	w8, w0, #3
	b.eq	LBB3_20
	b	LBB3_19
LBB3_19:
	.loc	1 60 27 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_21
LBB3_20:
	b	LBB3_21
LBB3_21:
	.loc	1 62 3 is_stmt 1
	mov	w0, #5
	bl	_decadeBucket
	cbz	w0, LBB3_23
	b	LBB3_22
LBB3_22:
	.loc	1 62 29 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_24
LBB3_23:
	b	LBB3_24
LBB3_24:
	.loc	1 63 3 is_stmt 1
	mov	w0, #15
	bl	_decadeBucket
	subs	w8, w0, #1
	b.eq	LBB3_26
	b	LBB3_25
LBB3_25:
	.loc	1 63 30 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_27
LBB3_26:
	b	LBB3_27
LBB3_27:
	.loc	1 64 3 is_stmt 1
	mov	w0, #25
	bl	_decadeBucket
	subs	w8, w0, #2
	b.eq	LBB3_29
	b	LBB3_28
LBB3_28:
	.loc	1 64 30 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_30
LBB3_29:
	b	LBB3_30
LBB3_30:
	.loc	1 65 3 is_stmt 1
	mov	w0, #35
	bl	_decadeBucket
	subs	w8, w0, #3
	b.eq	LBB3_32
	b	LBB3_31
LBB3_31:
	.loc	1 65 30 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_33
LBB3_32:
	b	LBB3_33
LBB3_33:
	.loc	1 67 3 is_stmt 1
	ldr	w8, [sp, #12]
	cbnz	w8, LBB3_35
	b	LBB3_34
LBB3_34:
Ltmp29:
	.loc	1 68 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB3_36
Ltmp30:
LBB3_35:
	.loc	1 70 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB3_36
Ltmp31:
LBB3_36:
	.loc	1 72 3
	ldr	w0, [sp, #12]
	.loc	1 72 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #16]
	add	sp, sp, #32
	ret
Ltmp32:
Lfunc_end3:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"17.if_else.c PASS\n"

l___unnamed_2:
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
	.byte	6
	.long	260

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	81
	.byte	1
	.byte	6
	.long	260
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	75
	.byte	1
	.byte	7
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
	.byte	23
	.long	260

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	81
	.byte	1
	.byte	23
	.long	260
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	83
	.byte	1
	.byte	24
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
	.byte	36
	.long	260

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	81
	.byte	1
	.byte	36
	.long	260
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	83
	.byte	1
	.byte	37
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
	.byte	50
	.long	260

	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	90
	.byte	1
	.byte	51
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
