	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_gradeOfScore
	.p2align	2
_gradeOfScore:
Lfunc_begin0:
	.file	1 "../tests" "18.switch_case.c"
	.loc	1 3 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp1:
	.loc	1 5 3 prologue_end
	sub	w8, w0, #1
	.loc	1 3 6
	str	w0, [sp, #8]
	.loc	1 5 3
	cmp	w8, #9
	b.hi	LBB0_2
Lloh0:
	adrp	x9, l_switch.table.gradeOfScore@PAGE
Lloh1:
	add	x9, x9, l_switch.table.gradeOfScore@PAGEOFF
	ldrb	w0, [x9, w8, sxtw]
	b	LBB0_3
LBB0_2:
	.loc	1 0 3 is_stmt 0
	mov	w0, #69
LBB0_3:
	strb	w0, [sp, #15]
	.loc	1 28 3 epilogue_begin is_stmt 1
	add	sp, sp, #16
	ret
Ltmp2:
	.loh AdrpAdd	Lloh0, Lloh1
Lfunc_end0:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin1:
	.loc	1 31 0
	.cfi_startproc
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp3:
	.loc	1 34 3 prologue_end
	mov	w0, #3
	.loc	1 32 3
	str	wzr, [sp, #4]
	.loc	1 34 3
	bl	_gradeOfScore
	and	w8, w0, #0xff
	cmp	w8, #68
	b.eq	LBB1_2
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 34 31
	str	w8, [sp, #4]
LBB1_2:
	.loc	1 35 3 is_stmt 1
	mov	w0, #5
	bl	_gradeOfScore
	and	w8, w0, #0xff
	cmp	w8, #68
	b.eq	LBB1_4
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 35 31
	str	w8, [sp, #4]
LBB1_4:
	.loc	1 36 3 is_stmt 1
	mov	w0, #6
	bl	_gradeOfScore
	and	w8, w0, #0xff
	cmp	w8, #67
	b.eq	LBB1_6
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 36 31
	str	w8, [sp, #4]
LBB1_6:
	.loc	1 37 3 is_stmt 1
	mov	w0, #8
	bl	_gradeOfScore
	and	w8, w0, #0xff
	cmp	w8, #66
	b.eq	LBB1_8
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 37 31
	str	w8, [sp, #4]
LBB1_8:
	.loc	1 38 3 is_stmt 1
	mov	w0, #9
	bl	_gradeOfScore
	and	w8, w0, #0xff
	cmp	w8, #65
	b.eq	LBB1_10
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 38 31
	str	w8, [sp, #4]
LBB1_10:
	.loc	1 0 31
	mov	w8, #69
	.loc	1 41 3 is_stmt 1
	str	wzr, [sp, #12]
	.loc	1 47 3
	cmp	w8, #69
	.loc	1 44 7
	strb	w8, [sp, #11]
	.loc	1 47 3
	b.eq	LBB1_12
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 47 21
	str	w8, [sp, #4]
LBB1_12:
	.loc	1 49 3 is_stmt 1
	ldr	w8, [sp, #4]
	.loc	1 0 0 is_stmt 0
Lloh2:
	adrp	x9, l___unnamed_1@PAGE
Lloh3:
	add	x9, x9, l___unnamed_1@PAGEOFF
	cmp	w8, #0
Lloh4:
	adrp	x8, l___unnamed_2@PAGE
Lloh5:
	add	x8, x8, l___unnamed_2@PAGEOFF
	csel	x0, x8, x9, eq
	bl	_printf
	.loc	1 54 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #16]
	ldr	w0, [sp, #4]
	add	sp, sp, #32
	ret
Ltmp4:
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
Lfunc_end1:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_2:
	.asciz	"18.switch_case.c PASS\n"

l___unnamed_1:
	.asciz	"18.switch_case.c FAIL\n"

	.section	__TEXT,__const
l_switch.table.gradeOfScore:
	.ascii	"DDDDDCBBAA"

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
	.byte	3
	.long	172

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	63
	.byte	1
	.byte	3
	.long	179
	.byte	4
	.byte	2
	.byte	145
	.byte	15
	.long	57
	.byte	1
	.byte	4
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
	.byte	31
	.long	179

	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	69
	.byte	1
	.byte	41
	.long	179
	.byte	4
	.byte	2
	.byte	145
	.byte	11
	.long	57
	.byte	1
	.byte	40
	.long	172
	.byte	4
	.byte	2
	.byte	145
	.byte	4
	.long	78
	.byte	1
	.byte	32
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
