	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_countSum
	.p2align	2
_countSum:
Lfunc_begin0:
	.file	1 "../tests" "20.do_while.c"
	.loc	1 3 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	mov	w8, #1
Ltmp2:
	.loc	1 4 3 prologue_end
	stp	w0, wzr, [sp, #4]
LBB0_1:
	.loc	1 6 3
	ldr	w9, [sp, #4]
	.loc	1 0 0 is_stmt 0
	str	w8, [sp, #12]
	.loc	1 6 3
	mov	w8, w8
	cmp	w8, w9
	b.gt	LBB0_3
Ltmp3:
	.loc	1 7 5 is_stmt 1
	ldp	w9, w8, [sp, #8]
	add	w9, w9, w8
	.loc	1 8 5
	add	w8, w8, #1
	.loc	1 7 5
	str	w9, [sp, #8]
	.loc	1 8 5
	b	LBB0_1
Ltmp4:
LBB0_3:
	.loc	1 10 3
	ldr	w0, [sp, #8]
	.loc	1 10 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp5:
Lfunc_end0:
	.cfi_endproc

	.globl	_countSum2
	.p2align	2
_countSum2:
Lfunc_begin1:
	.loc	1 13 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp6:
	.loc	1 14 3 prologue_end
	str	xzr, [sp, #8]
	.loc	1 13 5
	str	w0, [sp, #4]
LBB1_1:
Ltmp7:
	.loc	1 17 5
	ldp	w9, w8, [sp, #8]
	.loc	1 18 5
	ldr	w10, [sp, #4]
	.loc	1 17 5
	add	w9, w9, w8
	.loc	1 18 5
	add	w8, w8, #1
	cmp	w8, w10
	.loc	1 17 5
	stp	w9, w8, [sp, #8]
	.loc	1 18 5
	b.le	LBB1_1
Ltmp8:
	.loc	1 20 3
	ldr	w0, [sp, #8]
	.loc	1 20 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp9:
Lfunc_end1:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin2:
	.loc	1 23 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]
	stp	x29, x30, [sp, #32]
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
Ltmp10:
	.loc	1 26 3 prologue_end
	mov	w0, #100
	.loc	1 24 3
	str	wzr, [sp, #12]
	.loc	1 26 3
	bl	_countSum
	mov	w19, #5050
	cmp	w0, w19
	b.eq	LBB2_2
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 26 30
	str	w8, [sp, #12]
LBB2_2:
	.loc	1 27 3 is_stmt 1
	mov	w0, #100
	bl	_countSum2
	cmp	w0, w19
	b.eq	LBB2_4
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 27 31
	str	w8, [sp, #12]
LBB2_4:
	.loc	1 28 3 is_stmt 1
	mov	w0, wzr
	bl	_countSum
	cbz	w0, LBB2_6
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 28 25
	str	w8, [sp, #12]
LBB2_6:
	.loc	1 29 3 is_stmt 1
	mov	w0, wzr
	bl	_countSum2
	cbz	w0, LBB2_8
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 29 26
	str	w8, [sp, #12]
LBB2_8:
	.loc	1 31 3 is_stmt 1
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
	.loc	1 36 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #32]
	ldr	w0, [sp, #12]
	ldp	x20, x19, [sp, #16]
	add	sp, sp, #48
	ret
Ltmp11:
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
Lfunc_end2:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_2:
	.asciz	"20.do_while.c PASS\n"

l___unnamed_1:
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
	.byte	3
	.long	230

	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	61
	.byte	1
	.byte	3
	.long	230
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	55
	.byte	1
	.byte	5
	.long	230
	.byte	4
	.byte	2
	.byte	145
	.byte	8
	.long	57
	.byte	1
	.byte	4
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
	.byte	13
	.long	230

	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	61
	.byte	1
	.byte	13
	.long	230
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	55
	.byte	1
	.byte	15
	.long	230
	.byte	4
	.byte	2
	.byte	145
	.byte	8
	.long	57
	.byte	1
	.byte	14
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
	.byte	23
	.long	230

	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	63
	.byte	1
	.byte	24
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
