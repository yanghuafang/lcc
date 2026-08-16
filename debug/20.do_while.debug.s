	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_countSum
	.p2align	2
_countSum:
Lfunc_begin0:
	.file	1 "../tests" "20.do_while.c"
	.loc	1 6 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp1:
	.loc	1 6 5 prologue_end
	str	w0, [sp, #4]
	.loc	1 7 3
	str	wzr, [sp, #8]
	.loc	1 8 3
	mov	w8, #1
	str	w8, [sp, #12]
	.loc	1 9 3
	b	LBB0_1
LBB0_1:
	.loc	1 9 3
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #4]
	subs	w8, w8, w9
	b.gt	LBB0_3
	b	LBB0_2
LBB0_2:
Ltmp2:
	.loc	1 10 5
	ldr	w9, [sp, #12]
	ldr	w8, [sp, #8]
	add	w8, w8, w9
	str	w8, [sp, #8]
	.loc	1 11 5
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB0_1
Ltmp3:
LBB0_3:
	.loc	1 13 3
	ldr	w0, [sp, #8]
	.loc	1 13 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp4:
Lfunc_end0:
	.cfi_endproc

	.globl	_countSum2
	.p2align	2
_countSum2:
Lfunc_begin1:
	.loc	1 16 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp6:
	.loc	1 16 5 prologue_end
	str	w0, [sp, #4]
	.loc	1 17 3
	str	wzr, [sp, #8]
	.loc	1 18 3
	str	wzr, [sp, #12]
	.loc	1 19 3
	b	LBB1_1
LBB1_1:
Ltmp7:
	.loc	1 20 5
	ldr	w9, [sp, #12]
	ldr	w8, [sp, #8]
	add	w8, w8, w9
	str	w8, [sp, #8]
	.loc	1 21 5
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB1_2
LBB1_2:
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #4]
	subs	w8, w8, w9
	b.le	LBB1_1
	b	LBB1_3
Ltmp8:
LBB1_3:
	.loc	1 23 3
	ldr	w0, [sp, #8]
	.loc	1 23 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp9:
Lfunc_end1:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin2:
	.loc	1 26 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp10:
	.loc	1 27 3 prologue_end
	str	wzr, [sp, #12]
	.loc	1 29 3
	mov	w0, #100
	bl	_countSum
	mov	w8, #5050
	subs	w8, w0, w8
	b.eq	LBB2_2
	b	LBB2_1
LBB2_1:
	.loc	1 29 30 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB2_3
LBB2_2:
	b	LBB2_3
LBB2_3:
	.loc	1 30 3 is_stmt 1
	mov	w0, #100
	bl	_countSum2
	mov	w8, #5050
	subs	w8, w0, w8
	b.eq	LBB2_5
	b	LBB2_4
LBB2_4:
	.loc	1 30 31 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB2_6
LBB2_5:
	b	LBB2_6
LBB2_6:
	.loc	1 0 31
	mov	w0, wzr
	.loc	1 31 3 is_stmt 1
	bl	_countSum
	cbz	w0, LBB2_8
	b	LBB2_7
LBB2_7:
	.loc	1 31 25 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB2_9
LBB2_8:
	b	LBB2_9
LBB2_9:
	.loc	1 0 25
	mov	w0, wzr
	.loc	1 32 3 is_stmt 1
	bl	_countSum2
	cbz	w0, LBB2_11
	b	LBB2_10
LBB2_10:
	.loc	1 32 26 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB2_12
LBB2_11:
	b	LBB2_12
LBB2_12:
	.loc	1 34 3 is_stmt 1
	ldr	w8, [sp, #12]
	cbnz	w8, LBB2_14
	b	LBB2_13
LBB2_13:
Ltmp11:
	.loc	1 35 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB2_15
Ltmp12:
LBB2_14:
	.loc	1 37 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB2_15
Ltmp13:
LBB2_15:
	.loc	1 39 3
	ldr	w0, [sp, #12]
	.loc	1 39 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #16]
	add	sp, sp, #32
	ret
Ltmp14:
Lfunc_end2:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"20.do_while.c PASS\n"

l___unnamed_2:
	.asciz	"20.do_while.c FAIL\n"

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
	.long	18
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end2-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	27
	.long	27
	.byte	1
	.byte	6
	.long	230

	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	61
	.byte	1
	.byte	6
	.long	230
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	55
	.byte	1
	.byte	8
	.long	230
	.byte	4
	.byte	2
	.byte	145
	.byte	8
	.long	57
	.byte	1
	.byte	7
	.long	230
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
	.long	230

	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	61
	.byte	1
	.byte	16
	.long	230
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	55
	.byte	1
	.byte	18
	.long	230
	.byte	4
	.byte	2
	.byte	145
	.byte	8
	.long	57
	.byte	1
	.byte	17
	.long	230
	.byte	0
	.byte	2
	.quad	Lfunc_begin2
.set Lset6, Lfunc_end2-Lfunc_begin2
	.long	Lset6

	.byte	1
	.byte	111
	.long	46
	.long	46
	.byte	1
	.byte	26
	.long	230

	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	63
	.byte	1
	.byte	27
	.long	230
	.byte	0
	.byte	5
	.long	51
	.byte	5
	.byte	4
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"20.do_while.c"
	.asciz	"../tests"
	.asciz	"countSum"
	.asciz	"countSum2"
	.asciz	"main"
	.asciz	"int"
	.asciz	"i"
	.asciz	"sum"
	.asciz	"n"
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
	.long	1385962051
	.long	2090499946
	.long	-1507892523
.set Lset7, LNames0-Lnames_begin
	.long	Lset7
.set Lset8, LNames2-Lnames_begin
	.long	Lset8
.set Lset9, LNames1-Lnames_begin
	.long	Lset9
LNames0:
	.long	27
	.long	1
	.long	42
	.long	0
LNames2:
	.long	46
	.long	1
	.long	186
	.long	0
LNames1:
	.long	36
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
	.long	51
	.long	1
	.long	230
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
