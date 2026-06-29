	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_countNumber
	.p2align	2
_countNumber:
Lfunc_begin0:
	.file	1 "../tests" "22.break.c"
	.loc	1 3 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	mov	w8, #1
Ltmp3:
	.loc	1 4 3 prologue_end
	stp	w1, wzr, [sp, #4]
	.loc	1 3 5
	str	w0, [sp]
	.loc	1 5 8
	str	w8, [sp, #12]
LBB0_1:
	.loc	1 5 8
	ldr	w8, [sp, #12]
	ldr	w9, [sp]
	cmp	w8, w9
	b.gt	LBB0_4
Ltmp4:
	.loc	1 6 5
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #4]
	cmp	w8, w9
	b.gt	LBB0_4
	.loc	1 9 5
	ldp	w8, w9, [sp, #8]
	add	w8, w8, #1
	add	w9, w9, #1
	stp	w8, w9, [sp, #8]
	b	LBB0_1
Ltmp5:
LBB0_4:
	.loc	1 11 3
	ldr	w0, [sp, #8]
	.loc	1 11 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp6:
Lfunc_end0:
	.cfi_endproc

	.globl	_countNumber2
	.p2align	2
_countNumber2:
Lfunc_begin1:
	.loc	1 14 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	mov	w8, #1
Ltmp7:
	.loc	1 15 3 prologue_end
	stp	w1, wzr, [sp, #4]
	.loc	1 14 5
	str	w0, [sp]
	.loc	1 16 3
	str	w8, [sp, #12]
LBB1_1:
	.loc	1 17 3
	ldr	w8, [sp, #12]
	ldr	w9, [sp]
	cmp	w8, w9
	b.gt	LBB1_4
Ltmp8:
	.loc	1 18 5
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #4]
	cmp	w8, w9
	b.gt	LBB1_4
	.loc	1 21 5
	ldp	w8, w9, [sp, #8]
	add	w8, w8, #1
	.loc	1 22 5
	add	w9, w9, #1
	.loc	1 21 5
	stp	w8, w9, [sp, #8]
	.loc	1 22 5
	b	LBB1_1
Ltmp9:
LBB1_4:
	.loc	1 24 3
	ldr	w0, [sp, #8]
	.loc	1 24 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp10:
Lfunc_end1:
	.cfi_endproc

	.globl	_countNumber3
	.p2align	2
_countNumber3:
Lfunc_begin2:
	.loc	1 27 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	mov	w8, #1
Ltmp11:
	.loc	1 28 3 prologue_end
	stp	w1, wzr, [sp, #4]
	.loc	1 27 5
	str	w0, [sp]
	.loc	1 29 3
	str	w8, [sp, #12]
LBB2_1:
Ltmp12:
	.loc	1 31 5
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #4]
	cmp	w8, w9
	b.gt	LBB2_3
	.loc	1 34 5
	ldp	w8, w9, [sp, #8]
	.loc	1 35 5
	ldr	w10, [sp]
	add	w9, w9, #1
	.loc	1 34 5
	add	w8, w8, #1
	.loc	1 35 5
	cmp	w9, w10
	.loc	1 34 5
	stp	w8, w9, [sp, #8]
	.loc	1 35 5
	b.le	LBB2_1
Ltmp13:
LBB2_3:
	.loc	1 37 3
	ldr	w0, [sp, #8]
	.loc	1 37 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp14:
Lfunc_end2:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin3:
	.loc	1 40 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp15:
	.loc	1 43 3 prologue_end
	mov	w0, #100
	mov	w1, #37
	.loc	1 41 3
	str	wzr, [sp, #12]
	.loc	1 43 3
	bl	_countNumber
	cmp	w0, #37
	b.eq	LBB3_2
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 43 35
	str	w8, [sp, #12]
LBB3_2:
	.loc	1 44 3 is_stmt 1
	mov	w0, #100
	mov	w1, #37
	bl	_countNumber2
	cmp	w0, #37
	b.eq	LBB3_4
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 44 36
	str	w8, [sp, #12]
LBB3_4:
	.loc	1 45 3 is_stmt 1
	mov	w0, #100
	mov	w1, #37
	bl	_countNumber3
	cmp	w0, #37
	b.eq	LBB3_6
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 45 36
	str	w8, [sp, #12]
LBB3_6:
	.loc	1 46 3 is_stmt 1
	mov	w0, #10
	mov	w1, #10
	bl	_countNumber
	cmp	w0, #10
	b.eq	LBB3_8
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 46 34
	str	w8, [sp, #12]
LBB3_8:
	.loc	1 47 3 is_stmt 1
	mov	w0, #10
	mov	w1, #10
	bl	_countNumber2
	cmp	w0, #10
	b.eq	LBB3_10
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 47 35
	str	w8, [sp, #12]
LBB3_10:
	.loc	1 48 3 is_stmt 1
	mov	w0, #10
	mov	w1, #10
	bl	_countNumber3
	cmp	w0, #10
	b.eq	LBB3_12
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 48 35
	str	w8, [sp, #12]
LBB3_12:
	.loc	1 49 3 is_stmt 1
	mov	w0, #5
	mov	w1, wzr
	bl	_countNumber
	cbz	w0, LBB3_14
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 49 31
	str	w8, [sp, #12]
LBB3_14:
	.loc	1 50 3 is_stmt 1
	mov	w0, #5
	mov	w1, wzr
	bl	_countNumber2
	cbz	w0, LBB3_16
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 50 32
	str	w8, [sp, #12]
LBB3_16:
	.loc	1 51 3 is_stmt 1
	mov	w0, #5
	mov	w1, wzr
	bl	_countNumber3
	cbz	w0, LBB3_18
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 51 32
	str	w8, [sp, #12]
LBB3_18:
	.loc	1 53 3 is_stmt 1
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
	.loc	1 58 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #16]
	ldr	w0, [sp, #12]
	add	sp, sp, #32
	ret
Ltmp16:
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
Lfunc_end3:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_2:
	.asciz	"22.break.c PASS\n"

l___unnamed_1:
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
	.byte	3
	.long	344

	.byte	3
	.byte	2
	.byte	145
	.byte	0
	.long	90
	.byte	1
	.byte	3
	.long	344
	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	79
	.byte	1
	.byte	3
	.long	344
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	71
	.byte	1
	.byte	5
	.long	344
	.byte	4
	.byte	2
	.byte	145
	.byte	8
	.long	73
	.byte	1
	.byte	4
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
	.byte	14
	.long	344

	.byte	3
	.byte	2
	.byte	145
	.byte	0
	.long	90
	.byte	1
	.byte	14
	.long	344
	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	79
	.byte	1
	.byte	14
	.long	344
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	71
	.byte	1
	.byte	16
	.long	344
	.byte	4
	.byte	2
	.byte	145
	.byte	8
	.long	73
	.byte	1
	.byte	15
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
	.byte	27
	.long	344

	.byte	3
	.byte	2
	.byte	145
	.byte	0
	.long	90
	.byte	1
	.byte	27
	.long	344
	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	79
	.byte	1
	.byte	27
	.long	344
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	71
	.byte	1
	.byte	29
	.long	344
	.byte	4
	.byte	2
	.byte	145
	.byte	8
	.long	73
	.byte	1
	.byte	28
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
	.byte	40
	.long	344

	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	99
	.byte	1
	.byte	41
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
