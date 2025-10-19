	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_countNumber
	.p2align	2
_countNumber:
Lfunc_begin0:
	.file	1 "../tests" "22.break.c"
	.loc	1 5 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp1:
	.loc	1 5 5 prologue_end
	str	w0, [sp]
	str	w1, [sp, #4]
	.loc	1 6 3
	str	wzr, [sp, #8]
	.loc	1 7 8
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_1
LBB0_1:
	.loc	1 7 8
	ldr	w8, [sp, #12]
	ldr	w9, [sp]
	subs	w8, w8, w9
	b.gt	LBB0_7
	b	LBB0_2
LBB0_2:
Ltmp2:
	.loc	1 8 5
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #4]
	subs	w8, w8, w9
	b.le	LBB0_4
	b	LBB0_3
LBB0_3:
Ltmp3:
	.loc	1 9 7
	b	LBB0_7
LBB0_4:
	.loc	1 9 7
	b	LBB0_5
Ltmp4:
LBB0_5:
	.loc	1 11 5
	ldr	w8, [sp, #8]
	add	w8, w8, #1
	str	w8, [sp, #8]
	b	LBB0_6
LBB0_6:
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB0_1
Ltmp5:
LBB0_7:
	.loc	1 13 3
	ldr	w0, [sp, #8]
	.loc	1 13 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp6:
Lfunc_end0:
	.cfi_endproc

	.globl	_countNumber2
	.p2align	2
_countNumber2:
Lfunc_begin1:
	.loc	1 16 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp8:
	.loc	1 16 5 prologue_end
	str	w0, [sp]
	str	w1, [sp, #4]
	.loc	1 17 3
	str	wzr, [sp, #8]
	.loc	1 18 3
	mov	w8, #1
	str	w8, [sp, #12]
	.loc	1 19 3
	b	LBB1_1
LBB1_1:
	.loc	1 19 3
	ldr	w8, [sp, #12]
	ldr	w9, [sp]
	subs	w8, w8, w9
	b.gt	LBB1_6
	b	LBB1_2
LBB1_2:
Ltmp9:
	.loc	1 20 5
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #4]
	subs	w8, w8, w9
	b.le	LBB1_4
	b	LBB1_3
LBB1_3:
Ltmp10:
	.loc	1 21 7
	b	LBB1_6
LBB1_4:
	.loc	1 21 7
	b	LBB1_5
Ltmp11:
LBB1_5:
	.loc	1 23 5
	ldr	w8, [sp, #8]
	add	w8, w8, #1
	str	w8, [sp, #8]
	.loc	1 24 5
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB1_1
Ltmp12:
LBB1_6:
	.loc	1 26 3
	ldr	w0, [sp, #8]
	.loc	1 26 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp13:
Lfunc_end1:
	.cfi_endproc

	.globl	_countNumber3
	.p2align	2
_countNumber3:
Lfunc_begin2:
	.loc	1 29 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp15:
	.loc	1 29 5 prologue_end
	str	w0, [sp]
	str	w1, [sp, #4]
	.loc	1 30 3
	str	wzr, [sp, #8]
	.loc	1 31 3
	mov	w8, #1
	str	w8, [sp, #12]
	.loc	1 32 3
	b	LBB2_1
LBB2_1:
Ltmp16:
	.loc	1 33 5
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #4]
	subs	w8, w8, w9
	b.le	LBB2_3
	b	LBB2_2
LBB2_2:
Ltmp17:
	.loc	1 34 7
	b	LBB2_6
LBB2_3:
	.loc	1 34 7
	b	LBB2_4
Ltmp18:
LBB2_4:
	.loc	1 36 5
	ldr	w8, [sp, #8]
	add	w8, w8, #1
	str	w8, [sp, #8]
	.loc	1 37 5
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB2_5
LBB2_5:
	ldr	w8, [sp, #12]
	ldr	w9, [sp]
	subs	w8, w8, w9
	b.le	LBB2_1
	b	LBB2_6
Ltmp19:
LBB2_6:
	.loc	1 39 3
	ldr	w0, [sp, #8]
	.loc	1 39 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp20:
Lfunc_end2:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin3:
	.loc	1 42 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp21:
	.loc	1 43 3 prologue_end
	str	wzr, [sp, #12]
	.loc	1 45 3
	mov	w0, #100
	mov	w1, #37
	bl	_countNumber
	subs	w8, w0, #37
	b.eq	LBB3_2
	b	LBB3_1
LBB3_1:
	.loc	1 45 35 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_3
LBB3_2:
	b	LBB3_3
LBB3_3:
	.loc	1 46 3 is_stmt 1
	mov	w0, #100
	mov	w1, #37
	bl	_countNumber2
	subs	w8, w0, #37
	b.eq	LBB3_5
	b	LBB3_4
LBB3_4:
	.loc	1 46 36 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_6
LBB3_5:
	b	LBB3_6
LBB3_6:
	.loc	1 47 3 is_stmt 1
	mov	w0, #100
	mov	w1, #37
	bl	_countNumber3
	subs	w8, w0, #37
	b.eq	LBB3_8
	b	LBB3_7
LBB3_7:
	.loc	1 47 36 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_9
LBB3_8:
	b	LBB3_9
LBB3_9:
	.loc	1 0 36
	mov	w1, #10
	.loc	1 48 3 is_stmt 1
	mov	w0, w1
	bl	_countNumber
	subs	w8, w0, #10
	b.eq	LBB3_11
	b	LBB3_10
LBB3_10:
	.loc	1 48 34 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_12
LBB3_11:
	b	LBB3_12
LBB3_12:
	.loc	1 0 34
	mov	w1, #10
	.loc	1 49 3 is_stmt 1
	mov	w0, w1
	bl	_countNumber2
	subs	w8, w0, #10
	b.eq	LBB3_14
	b	LBB3_13
LBB3_13:
	.loc	1 49 35 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_15
LBB3_14:
	b	LBB3_15
LBB3_15:
	.loc	1 0 35
	mov	w1, #10
	.loc	1 50 3 is_stmt 1
	mov	w0, w1
	bl	_countNumber3
	subs	w8, w0, #10
	b.eq	LBB3_17
	b	LBB3_16
LBB3_16:
	.loc	1 50 35 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_18
LBB3_17:
	b	LBB3_18
LBB3_18:
	.loc	1 51 3 is_stmt 1
	mov	w0, #5
	mov	w1, wzr
	bl	_countNumber
	cbz	w0, LBB3_20
	b	LBB3_19
LBB3_19:
	.loc	1 51 31 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_21
LBB3_20:
	b	LBB3_21
LBB3_21:
	.loc	1 52 3 is_stmt 1
	mov	w0, #5
	mov	w1, wzr
	bl	_countNumber2
	cbz	w0, LBB3_23
	b	LBB3_22
LBB3_22:
	.loc	1 52 32 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_24
LBB3_23:
	b	LBB3_24
LBB3_24:
	.loc	1 53 3 is_stmt 1
	mov	w0, #5
	mov	w1, wzr
	bl	_countNumber3
	cbz	w0, LBB3_26
	b	LBB3_25
LBB3_25:
	.loc	1 53 32 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_27
LBB3_26:
	b	LBB3_27
LBB3_27:
	.loc	1 55 3 is_stmt 1
	ldr	w8, [sp, #12]
	cbnz	w8, LBB3_29
	b	LBB3_28
LBB3_28:
Ltmp22:
	.loc	1 56 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB3_30
Ltmp23:
LBB3_29:
	.loc	1 58 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB3_30
Ltmp24:
LBB3_30:
	.loc	1 60 3
	ldr	w0, [sp, #12]
	.loc	1 60 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #16]
	add	sp, sp, #32
	ret
Ltmp25:
Lfunc_end3:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"22.break.c PASS\n"

l___unnamed_2:
	.asciz	"22.break.c FAIL\n"

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
	.long	15
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end3-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	24
	.long	24
	.byte	1
	.byte	5
	.long	344

	.byte	3
	.byte	2
	.byte	145
	.byte	0
	.long	90
	.byte	1
	.byte	5
	.long	344
	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	79
	.byte	1
	.byte	5
	.long	344
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	71
	.byte	1
	.byte	7
	.long	344
	.byte	4
	.byte	2
	.byte	145
	.byte	8
	.long	73
	.byte	1
	.byte	6
	.long	344
	.byte	0
	.byte	2
	.quad	Lfunc_begin1
.set Lset5, Lfunc_end1-Lfunc_begin1
	.long	Lset5

	.byte	1
	.byte	111
	.long	36
	.long	36
	.byte	1
	.byte	16
	.long	344

	.byte	3
	.byte	2
	.byte	145
	.byte	0
	.long	90
	.byte	1
	.byte	16
	.long	344
	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	79
	.byte	1
	.byte	16
	.long	344
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	71
	.byte	1
	.byte	18
	.long	344
	.byte	4
	.byte	2
	.byte	145
	.byte	8
	.long	73
	.byte	1
	.byte	17
	.long	344
	.byte	0
	.byte	2
	.quad	Lfunc_begin2
.set Lset6, Lfunc_end2-Lfunc_begin2
	.long	Lset6

	.byte	1
	.byte	111
	.long	49
	.long	49
	.byte	1
	.byte	29
	.long	344

	.byte	3
	.byte	2
	.byte	145
	.byte	0
	.long	90
	.byte	1
	.byte	29
	.long	344
	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	79
	.byte	1
	.byte	29
	.long	344
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	71
	.byte	1
	.byte	31
	.long	344
	.byte	4
	.byte	2
	.byte	145
	.byte	8
	.long	73
	.byte	1
	.byte	30
	.long	344
	.byte	0
	.byte	2
	.quad	Lfunc_begin3
.set Lset7, Lfunc_end3-Lfunc_begin3
	.long	Lset7

	.byte	1
	.byte	111
	.long	62
	.long	62
	.byte	1
	.byte	42
	.long	344

	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	99
	.byte	1
	.byte	43
	.long	344
	.byte	0
	.byte	5
	.long	67
	.byte	5
	.byte	4
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"22.break.c"
	.asciz	"../tests"
	.asciz	"countNumber"
	.asciz	"countNumber2"
	.asciz	"countNumber3"
	.asciz	"main"
	.asciz	"int"
	.asciz	"i"
	.asciz	"count"
	.asciz	"smallRange"
	.asciz	"maxRange"
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
	.long	-1
	.long	0
	.long	1
	.long	3
	.long	-1691759191
	.long	2090499946
	.long	-1691759190
	.long	-1613071721
.set Lset8, LNames1-Lnames_begin
	.long	Lset8
.set Lset9, LNames3-Lnames_begin
	.long	Lset9
.set Lset10, LNames2-Lnames_begin
	.long	Lset10
.set Lset11, LNames0-Lnames_begin
	.long	Lset11
LNames1:
	.long	36
	.long	1
	.long	128
	.long	0
LNames3:
	.long	62
	.long	1
	.long	300
	.long	0
LNames2:
	.long	49
	.long	1
	.long	214
	.long	0
LNames0:
	.long	24
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
	.long	67
	.long	1
	.long	344
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
