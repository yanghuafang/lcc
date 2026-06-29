	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_countSum
	.p2align	2
_countSum:
Lfunc_begin0:
	.file	1 "../tests" "19.for_loop.c"
	.loc	1 3 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	mov	w8, #1
Ltmp3:
	.loc	1 4 3 prologue_end
	stp	w0, wzr, [sp, #4]
LBB0_1:
	.loc	1 5 8
	ldr	w9, [sp, #4]
	.loc	1 0 0 is_stmt 0
	str	w8, [sp, #12]
	.loc	1 5 8
	mov	w8, w8
	cmp	w8, w9
	b.gt	LBB0_3
Ltmp4:
	.loc	1 6 5 is_stmt 1
	ldp	w9, w8, [sp, #8]
	add	w9, w9, w8
	add	w8, w8, #1
	str	w9, [sp, #8]
	b	LBB0_1
Ltmp5:
LBB0_3:
	.loc	1 8 3
	ldr	w0, [sp, #8]
	.loc	1 8 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp6:
Lfunc_end0:
	.cfi_endproc

	.globl	_countSum2
	.p2align	2
_countSum2:
Lfunc_begin1:
	.loc	1 11 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	mov	w8, #1
Ltmp7:
	.loc	1 12 3 prologue_end
	stp	w0, wzr, [sp, #4]
LBB1_1:
	.loc	1 14 3
	ldr	w9, [sp, #4]
	.loc	1 0 0 is_stmt 0
	str	w8, [sp, #12]
	.loc	1 14 3
	mov	w8, w8
	cmp	w8, w9
	b.gt	LBB1_3
Ltmp8:
	.loc	1 15 5 is_stmt 1
	ldp	w9, w8, [sp, #8]
	add	w9, w9, w8
	add	w8, w8, #1
	str	w9, [sp, #8]
	b	LBB1_1
Ltmp9:
LBB1_3:
	.loc	1 17 3
	ldr	w0, [sp, #8]
	.loc	1 17 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp10:
Lfunc_end1:
	.cfi_endproc

	.globl	_countSum3
	.p2align	2
_countSum3:
Lfunc_begin2:
	.loc	1 20 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	mov	w8, #1
Ltmp11:
	.loc	1 21 3 prologue_end
	stp	w0, wzr, [sp, #4]
LBB2_1:
	.loc	1 23 3
	ldr	w9, [sp, #4]
	.loc	1 0 0 is_stmt 0
	str	w8, [sp, #12]
	.loc	1 23 3
	cmp	w8, w9
	b.gt	LBB2_3
Ltmp12:
	.loc	1 24 5 is_stmt 1
	ldp	w9, w8, [sp, #8]
	add	w9, w9, w8
	add	w8, w8, #1
	str	w9, [sp, #8]
	b	LBB2_1
Ltmp13:
LBB2_3:
	.loc	1 26 3
	ldr	w0, [sp, #8]
	.loc	1 26 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp14:
Lfunc_end2:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin3:
	.loc	1 29 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]
	stp	x29, x30, [sp, #32]
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
Ltmp15:
	.loc	1 32 3 prologue_end
	mov	w0, #100
	.loc	1 30 3
	str	wzr, [sp, #12]
	.loc	1 32 3
	bl	_countSum
	mov	w19, #5050
	cmp	w0, w19
	b.eq	LBB3_2
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 32 30
	str	w8, [sp, #12]
LBB3_2:
	.loc	1 33 3 is_stmt 1
	mov	w0, #100
	bl	_countSum2
	cmp	w0, w19
	b.eq	LBB3_4
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 33 31
	str	w8, [sp, #12]
LBB3_4:
	.loc	1 34 3 is_stmt 1
	mov	w0, #100
	bl	_countSum3
	mov	w8, #5050
	cmp	w0, w8
	b.eq	LBB3_6
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 34 31
	str	w8, [sp, #12]
LBB3_6:
	.loc	1 35 3 is_stmt 1
	mov	w0, wzr
	bl	_countSum
	cbz	w0, LBB3_8
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 35 25
	str	w8, [sp, #12]
LBB3_8:
	.loc	1 36 3 is_stmt 1
	mov	w0, #1
	mov	w19, #1
	bl	_countSum
	cmp	w0, #1
	b.eq	LBB3_10
	.loc	1 36 25 is_stmt 0
	str	w19, [sp, #12]
LBB3_10:
	.loc	1 38 3 is_stmt 1
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
	.loc	1 43 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #32]
	ldr	w0, [sp, #12]
	ldp	x20, x19, [sp, #16]
	add	sp, sp, #48
	ret
Ltmp16:
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
Lfunc_end3:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_2:
	.asciz	"19.for_loop.c PASS\n"

l___unnamed_1:
	.asciz	"19.for_loop.c FAIL\n"

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
.set Lset3, Lfunc_end3-Lfunc_begin0
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
	.long	302

	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	71
	.byte	1
	.byte	3
	.long	302
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	65
	.byte	1
	.byte	5
	.long	302
	.byte	4
	.byte	2
	.byte	145
	.byte	8
	.long	67
	.byte	1
	.byte	4
	.long	302
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
	.byte	11
	.long	302

	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	71
	.byte	1
	.byte	11
	.long	302
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	65
	.byte	1
	.byte	13
	.long	302
	.byte	4
	.byte	2
	.byte	145
	.byte	8
	.long	67
	.byte	1
	.byte	12
	.long	302
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
	.byte	20
	.long	302

	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	71
	.byte	1
	.byte	20
	.long	302
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	65
	.byte	1
	.byte	22
	.long	302
	.byte	4
	.byte	2
	.byte	145
	.byte	8
	.long	67
	.byte	1
	.byte	21
	.long	302
	.byte	0
	.byte	2
	.quad	Lfunc_begin3
.set Lset7, Lfunc_end3-Lfunc_begin3
	.long	Lset7

	.byte	1
	.byte	111
	.long	56
	.long	56
	.byte	1
	.byte	29
	.long	302

	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	73
	.byte	1
	.byte	30
	.long	302
	.byte	0
	.byte	5
	.long	61
	.byte	5
	.byte	4
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"19.for_loop.c"
	.asciz	"../tests"
	.asciz	"countSum"
	.asciz	"countSum2"
	.asciz	"countSum3"
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
	.long	-1507892523
	.long	2090499946
	.long	-1507892522
	.long	1385962051
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
	.long	114
	.long	0
LNames3:
	.long	56
	.long	1
	.long	258
	.long	0
LNames2:
	.long	46
	.long	1
	.long	186
	.long	0
LNames0:
	.long	27
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
	.long	61
	.long	1
	.long	302
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
