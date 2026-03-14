	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_gradeOfScore
	.p2align	2
_gradeOfScore:
Lfunc_begin0:
	.file	1 "../tests" "18.switch_case.c"
	.loc	1 6 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp1:
	.loc	1 6 6 prologue_end
	str	w0, [sp, #8]
	.loc	1 8 3
	ldr	w8, [sp, #8]
	str	w8, [sp, #4]
	subs	w8, w8, #1
	b.eq	LBB0_10
	b	LBB0_1
LBB0_1:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #4]
	.loc	1 8 3
	subs	w8, w8, #2
	b.eq	LBB0_11
	b	LBB0_2
LBB0_2:
	.loc	1 0 3
	ldr	w8, [sp, #4]
	.loc	1 8 3
	subs	w8, w8, #3
	b.eq	LBB0_12
	b	LBB0_3
LBB0_3:
	.loc	1 0 3
	ldr	w8, [sp, #4]
	.loc	1 8 3
	subs	w8, w8, #4
	b.eq	LBB0_13
	b	LBB0_4
LBB0_4:
	.loc	1 0 3
	ldr	w8, [sp, #4]
	.loc	1 8 3
	subs	w8, w8, #5
	b.eq	LBB0_14
	b	LBB0_5
LBB0_5:
	.loc	1 0 3
	ldr	w8, [sp, #4]
	.loc	1 8 3
	subs	w8, w8, #6
	b.eq	LBB0_15
	b	LBB0_6
LBB0_6:
	.loc	1 0 3
	ldr	w8, [sp, #4]
	.loc	1 8 3
	subs	w8, w8, #7
	b.eq	LBB0_16
	b	LBB0_7
LBB0_7:
	.loc	1 0 3
	ldr	w8, [sp, #4]
	.loc	1 8 3
	subs	w8, w8, #8
	b.eq	LBB0_17
	b	LBB0_8
LBB0_8:
	.loc	1 0 3
	ldr	w8, [sp, #4]
	.loc	1 8 3
	subs	w8, w8, #9
	b.eq	LBB0_18
	b	LBB0_9
LBB0_9:
	.loc	1 0 3
	ldr	w8, [sp, #4]
	.loc	1 8 3
	subs	w8, w8, #10
	b.eq	LBB0_19
	b	LBB0_20
LBB0_10:
	.loc	1 9 5 is_stmt 1
	b	LBB0_11
LBB0_11:
	.loc	1 10 5
	b	LBB0_12
LBB0_12:
	.loc	1 11 5
	b	LBB0_13
LBB0_13:
	.loc	1 12 5
	b	LBB0_14
LBB0_14:
	.loc	1 14 7
	mov	w8, #68
	strb	w8, [sp, #15]
	.loc	1 15 7
	b	LBB0_21
LBB0_15:
	.loc	1 17 7
	mov	w8, #67
	strb	w8, [sp, #15]
	.loc	1 18 7
	b	LBB0_21
LBB0_16:
	.loc	1 19 5
	b	LBB0_17
LBB0_17:
	.loc	1 21 7
	mov	w8, #66
	strb	w8, [sp, #15]
	.loc	1 22 7
	b	LBB0_21
LBB0_18:
	.loc	1 23 5
	b	LBB0_19
LBB0_19:
	.loc	1 25 7
	mov	w8, #65
	strb	w8, [sp, #15]
	.loc	1 26 7
	b	LBB0_21
LBB0_20:
	.loc	1 28 7
	mov	w8, #69
	strb	w8, [sp, #15]
	.loc	1 29 7
	b	LBB0_21
LBB0_21:
	.loc	1 31 3
	ldrb	w0, [sp, #15]
	.loc	1 31 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp2:
Lfunc_end0:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin1:
	.loc	1 34 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp3:
	.loc	1 35 3 prologue_end
	str	wzr, [sp, #4]
	.loc	1 37 3
	mov	w0, #3
	bl	_gradeOfScore
	sxtb	w8, w0
	subs	w8, w8, #68
	b.eq	LBB1_2
	b	LBB1_1
LBB1_1:
	.loc	1 37 31 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB1_3
LBB1_2:
	b	LBB1_3
LBB1_3:
	.loc	1 38 3 is_stmt 1
	mov	w0, #5
	bl	_gradeOfScore
	sxtb	w8, w0
	subs	w8, w8, #68
	b.eq	LBB1_5
	b	LBB1_4
LBB1_4:
	.loc	1 38 31 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB1_6
LBB1_5:
	b	LBB1_6
LBB1_6:
	.loc	1 39 3 is_stmt 1
	mov	w0, #6
	bl	_gradeOfScore
	sxtb	w8, w0
	subs	w8, w8, #67
	b.eq	LBB1_8
	b	LBB1_7
LBB1_7:
	.loc	1 39 31 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB1_9
LBB1_8:
	b	LBB1_9
LBB1_9:
	.loc	1 40 3 is_stmt 1
	mov	w0, #8
	bl	_gradeOfScore
	sxtb	w8, w0
	subs	w8, w8, #66
	b.eq	LBB1_11
	b	LBB1_10
LBB1_10:
	.loc	1 40 31 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB1_12
LBB1_11:
	b	LBB1_12
LBB1_12:
	.loc	1 41 3 is_stmt 1
	mov	w0, #9
	bl	_gradeOfScore
	sxtb	w8, w0
	subs	w8, w8, #65
	b.eq	LBB1_14
	b	LBB1_13
LBB1_13:
	.loc	1 41 31 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB1_15
LBB1_14:
	b	LBB1_15
LBB1_15:
	.loc	1 44 3 is_stmt 1
	str	wzr, [sp, #12]
	.loc	1 45 3
	b	LBB1_16
LBB1_16:
	.loc	1 47 7
	mov	w8, #69
	strb	w8, [sp, #11]
	.loc	1 48 7
	b	LBB1_17
LBB1_17:
	.loc	1 50 3
	ldrsb	w8, [sp, #11]
	subs	w8, w8, #69
	b.eq	LBB1_19
	b	LBB1_18
LBB1_18:
	.loc	1 50 21 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB1_20
LBB1_19:
	b	LBB1_20
LBB1_20:
	.loc	1 52 3 is_stmt 1
	ldr	w8, [sp, #4]
	cbnz	w8, LBB1_22
	b	LBB1_21
LBB1_21:
Ltmp4:
	.loc	1 53 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB1_23
Ltmp5:
LBB1_22:
	.loc	1 55 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB1_23
Ltmp6:
LBB1_23:
	.loc	1 57 3
	ldr	w0, [sp, #4]
	.loc	1 57 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #16]
	add	sp, sp, #32
	ret
Ltmp7:
Lfunc_end1:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"18.switch_case.c PASS\n"

l___unnamed_2:
	.asciz	"18.switch_case.c FAIL\n"

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
	.long	21
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end1-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	30
	.long	30
	.byte	1
	.byte	6
	.long	172

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	63
	.byte	1
	.byte	6
	.long	179
	.byte	4
	.byte	2
	.byte	145
	.byte	15
	.long	57
	.byte	1
	.byte	7
	.long	172
	.byte	0
	.byte	2
	.quad	Lfunc_begin1
.set Lset5, Lfunc_end1-Lfunc_begin1
	.long	Lset5

	.byte	1
	.byte	111
	.long	43
	.long	43
	.byte	1
	.byte	34
	.long	179

	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	69
	.byte	1
	.byte	44
	.long	179
	.byte	4
	.byte	2
	.byte	145
	.byte	11
	.long	57
	.byte	1
	.byte	43
	.long	172
	.byte	4
	.byte	2
	.byte	145
	.byte	4
	.long	78
	.byte	1
	.byte	35
	.long	179
	.byte	0
	.byte	5
	.long	48
	.byte	6
	.byte	1
	.byte	5
	.long	53
	.byte	5
	.byte	4
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"18.switch_case.c"
	.asciz	"../tests"
	.asciz	"gradeOfScore"
	.asciz	"main"
	.asciz	"char"
	.asciz	"int"
	.asciz	"grade"
	.asciz	"score"
	.asciz	"boundary"
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
	.long	1638481529
.set Lset6, LNames1-Lnames_begin
	.long	Lset6
.set Lset7, LNames0-Lnames_begin
	.long	Lset7
LNames1:
	.long	43
	.long	1
	.long	100
	.long	0
LNames0:
	.long	30
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
	.long	2
	.long	2
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
	.long	193495088
	.long	2090147939
.set Lset8, Ltypes1-Ltypes_begin
	.long	Lset8
.set Lset9, Ltypes0-Ltypes_begin
	.long	Lset9
Ltypes1:
	.long	53
	.long	1
	.long	179
	.short	36
	.byte	0
	.long	0
Ltypes0:
	.long	48
	.long	1
	.long	172
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
