	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "27.parenthesis_change_precedence.c"
	.loc	1 3 0
	.cfi_startproc
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]
	.cfi_def_cfa_offset 64
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #2
	mov	w10, #22
	mov	w9, #4
Ltmp0:
	.loc	1 4 3 prologue_end
	stp	wzr, w8, [sp, #12]
	mov	w8, #5
	.loc	1 9 3
	cmp	w10, #22
	.loc	1 6 3
	stp	w9, w8, [sp, #20]
	.loc	1 9 3
	b.eq	LBB0_2
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 9 24
	str	w8, [sp, #12]
LBB0_2:
	.loc	1 10 3 is_stmt 1
	ldp	w8, w9, [sp, #16]
	ldr	w10, [sp, #24]
	add	w8, w8, w9
	mul	w8, w8, w10
	cmp	w8, #30
	b.eq	LBB0_4
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 10 26
	str	w8, [sp, #12]
LBB0_4:
	.loc	1 11 3 is_stmt 1
	ldp	w8, w9, [sp, #16]
	ldr	w10, [sp, #24]
	sub	w8, w8, w9
	mul	w8, w10, w8
	cmn	w8, #10
	b.eq	LBB0_6
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 11 27
	str	w8, [sp, #12]
LBB0_6:
	.loc	1 12 3 is_stmt 1
	ldp	w8, w9, [sp, #20]
	sdiv	w10, w8, w9
	neg	w8, w8
	madd	w8, w10, w9, w8
	ldr	w9, [sp, #16]
	add	w8, w9, w8
	cmn	w8, #2
	b.eq	LBB0_8
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 12 24
	str	w8, [sp, #12]
LBB0_8:
	.loc	1 13 3 is_stmt 1
	ldp	w8, w9, [sp, #16]
	ldr	w10, [sp, #24]
	add	w8, w8, w9
	sdiv	w8, w8, w10
	cmp	w8, #1
	b.eq	LBB0_10
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 13 25
	str	w8, [sp, #12]
LBB0_10:
	.loc	1 0 25
	mov	w11, #24
	mov	w8, #1
	mov	w9, #2
	mov	w10, #3
	.loc	1 19 3 is_stmt 1
	cmp	w11, #24
	.loc	1 15 3
	stp	w8, w9, [sp, #28]
	.loc	1 17 3
	stp	w10, w11, [sp, #36]
	.loc	1 19 3
	b.eq	LBB0_12
	.loc	1 19 16 is_stmt 0
	str	w8, [sp, #12]
LBB0_12:
	.loc	1 21 3 is_stmt 1
	ldp	w8, w9, [sp, #28]
	ldr	w10, [sp, #36]
	add	w8, w8, w9
	lsl	w8, w8, w10
	.loc	1 22 3
	cmp	w8, #24
	.loc	1 21 3
	str	w8, [sp, #44]
	.loc	1 22 3
	b.eq	LBB0_14
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 22 16
	str	w8, [sp, #12]
LBB0_14:
	.loc	1 24 3 is_stmt 1
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
	.loc	1 29 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #48]
	ldr	w0, [sp, #12]
	add	sp, sp, #64
	ret
Ltmp1:
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
Lfunc_end0:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_2:
	.asciz	"27.parenthesis_change_precedence.c PASS\n"

l___unnamed_1:
	.asciz	"27.parenthesis_change_precedence.c FAIL\n"

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
	.byte	4
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
	.long	39
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end0-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	48
	.long	48
	.byte	1
	.byte	3
	.long	198

	.byte	3
	.byte	2
	.byte	145
	.byte	44
	.long	57
	.byte	1
	.byte	21
	.long	198
	.byte	3
	.byte	2
	.byte	145
	.byte	40
	.long	59
	.byte	1
	.byte	18
	.long	198
	.byte	3
	.byte	2
	.byte	145
	.byte	36
	.long	61
	.byte	1
	.byte	17
	.long	198
	.byte	3
	.byte	2
	.byte	145
	.byte	32
	.long	63
	.byte	1
	.byte	16
	.long	198
	.byte	3
	.byte	2
	.byte	145
	.byte	28
	.long	65
	.byte	1
	.byte	15
	.long	198
	.byte	3
	.byte	2
	.byte	145
	.byte	24
	.long	67
	.byte	1
	.byte	7
	.long	198
	.byte	3
	.byte	2
	.byte	145
	.byte	20
	.long	69
	.byte	1
	.byte	6
	.long	198
	.byte	3
	.byte	2
	.byte	145
	.byte	16
	.long	71
	.byte	1
	.byte	5
	.long	198
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	73
	.byte	1
	.byte	4
	.long	198
	.byte	0
	.byte	4
	.long	53
	.byte	5
	.byte	4
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"27.parenthesis_change_precedence.c"
	.asciz	"../tests"
	.asciz	"main"
	.asciz	"int"
	.asciz	"s"
	.asciz	"r"
	.asciz	"z"
	.asciz	"y"
	.asciz	"x"
	.asciz	"c"
	.asciz	"b"
	.asciz	"a"
	.asciz	"err"
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	1
	.long	1
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	0
	.long	2090499946
.set Lset5, LNames0-Lnames_begin
	.long	Lset5
LNames0:
	.long	48
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
.set Lset6, Ltypes0-Ltypes_begin
	.long	Lset6
Ltypes0:
	.long	53
	.long	1
	.long	198
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
