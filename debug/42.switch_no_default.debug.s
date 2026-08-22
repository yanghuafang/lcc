	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_grade
	.p2align	2
_grade:
Lfunc_begin0:
	.file	1 "../tests" "42.switch_no_default.c"
	.loc	1 11 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp1:
	.loc	1 11 5 prologue_end
	str	w0, [sp, #8]
	.loc	1 12 3
	str	wzr, [sp, #12]
	.loc	1 13 3
	ldr	w8, [sp, #8]
	str	w8, [sp, #4]
	subs	w8, w8, #1
	b.eq	LBB0_2
	b	LBB0_1
LBB0_1:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #4]
	.loc	1 13 3
	subs	w8, w8, #2
	b.eq	LBB0_3
	b	LBB0_4
LBB0_2:
	.loc	1 15 7 is_stmt 1
	mov	w8, #10
	str	w8, [sp, #12]
	.loc	1 16 7
	b	LBB0_4
LBB0_3:
	.loc	1 18 7
	mov	w8, #20
	str	w8, [sp, #12]
	.loc	1 19 7
	b	LBB0_4
LBB0_4:
	.loc	1 21 3
	ldr	w0, [sp, #12]
	.loc	1 21 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp2:
Lfunc_end0:
	.cfi_endproc

	.globl	_allReturn
	.p2align	2
_allReturn:
Lfunc_begin1:
	.loc	1 25 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp4:
	.loc	1 25 5 prologue_end
	str	w0, [sp, #12]
	.loc	1 26 3
	ldr	w8, [sp, #12]
	subs	w8, w8, #1
	b.ne	LBB1_2
	b	LBB1_1
LBB1_1:
	.loc	1 28 7
	mov	w0, #100
	.loc	1 28 7 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
LBB1_2:
	.loc	1 30 7 is_stmt 1
	mov	w0, #200
	.loc	1 30 7 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp5:
Lfunc_end1:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin2:
	.loc	1 34 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp6:
	.loc	1 35 3 prologue_end
	str	wzr, [sp, #12]
	.loc	1 37 3
	mov	w0, #1
	bl	_grade
	subs	w8, w0, #10
	b.eq	LBB2_2
	b	LBB2_1
LBB2_1:
	.loc	1 37 23 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB2_3
LBB2_2:
	b	LBB2_3
LBB2_3:
	.loc	1 38 3 is_stmt 1
	mov	w0, #2
	bl	_grade
	subs	w8, w0, #20
	b.eq	LBB2_5
	b	LBB2_4
LBB2_4:
	.loc	1 38 23 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB2_6
LBB2_5:
	b	LBB2_6
LBB2_6:
	.loc	1 39 3 is_stmt 1
	mov	w0, #7
	bl	_grade
	cbz	w0, LBB2_8
	b	LBB2_7
LBB2_7:
	.loc	1 39 22 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB2_9
LBB2_8:
	b	LBB2_9
LBB2_9:
	.loc	1 41 3 is_stmt 1
	mov	w0, #1
	bl	_allReturn
	subs	w8, w0, #100
	b.eq	LBB2_11
	b	LBB2_10
LBB2_10:
	.loc	1 41 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB2_12
LBB2_11:
	b	LBB2_12
LBB2_12:
	.loc	1 42 3 is_stmt 1
	mov	w0, #3
	bl	_allReturn
	subs	w8, w0, #200
	b.eq	LBB2_14
	b	LBB2_13
LBB2_13:
	.loc	1 42 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB2_15
LBB2_14:
	b	LBB2_15
LBB2_15:
	.loc	1 44 3 is_stmt 1
	ldr	w8, [sp, #12]
	cbnz	w8, LBB2_17
	b	LBB2_16
LBB2_16:
Ltmp7:
	.loc	1 45 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB2_18
Ltmp8:
LBB2_17:
	.loc	1 47 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB2_18
Ltmp9:
LBB2_18:
	.loc	1 49 3
	ldr	w0, [sp, #12]
	.loc	1 49 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #16]
	add	sp, sp, #32
	ret
Ltmp10:
Lfunc_end2:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"42.switch_no_default.c PASS\n"

l___unnamed_2:
	.asciz	"42.switch_no_default.c FAIL\n"

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
	.long	27
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end2-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	36
	.long	36
	.byte	1
	.byte	11
	.long	188

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	63
	.byte	1
	.byte	11
	.long	188
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	61
	.byte	1
	.byte	12
	.long	188
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
	.byte	25
	.long	188

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	69
	.byte	1
	.byte	25
	.long	188
	.byte	0
	.byte	2
	.quad	Lfunc_begin2
.set Lset6, Lfunc_end2-Lfunc_begin2
	.long	Lset6

	.byte	1
	.byte	111
	.long	52
	.long	52
	.byte	1
	.byte	34
	.long	188

	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	71
	.byte	1
	.byte	35
	.long	188
	.byte	0
	.byte	5
	.long	57
	.byte	5
	.byte	4
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"42.switch_no_default.c"
	.asciz	"../tests"
	.asciz	"grade"
	.asciz	"allReturn"
	.asciz	"main"
	.asciz	"int"
	.asciz	"r"
	.asciz	"score"
	.asciz	"x"
	.asciz	"err"
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	3
	.long	3
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	-1
	.long	0
	.long	-1
	.long	21436318
	.long	260507944
	.long	2090499946
.set Lset7, LNames1-Lnames_begin
	.long	Lset7
.set Lset8, LNames0-Lnames_begin
	.long	Lset8
.set Lset9, LNames2-Lnames_begin
	.long	Lset9
LNames1:
	.long	42
	.long	1
	.long	100
	.long	0
LNames0:
	.long	36
	.long	1
	.long	42
	.long	0
LNames2:
	.long	52
	.long	1
	.long	144
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
.set Lset10, Ltypes0-Ltypes_begin
	.long	Lset10
Ltypes0:
	.long	57
	.long	1
	.long	188
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
