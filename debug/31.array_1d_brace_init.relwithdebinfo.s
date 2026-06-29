	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "31.array_1d_brace_init.c"
	.loc	1 6 0
	.cfi_startproc
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]
	.cfi_def_cfa_offset 64
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x8, #1
	mov	w9, #3
Ltmp0:
	.loc	1 7 3 prologue_end
	str	wzr, [sp, #8]
	movk	x8, #2, lsl #32
	.loc	1 8 3
	stur	x9, [sp, #20]
	mov	w9, #6
	stur	x8, [sp, #12]
	mov	x8, #4
	movk	x8, #5, lsl #32
	.loc	1 9 3
	str	w9, [sp, #36]
	stur	x8, [sp, #28]
	mov	w8, #1
	.loc	1 12 3
	cmp	w8, #1
	.loc	1 10 3
	str	xzr, [sp, #40]
	.loc	1 12 3
	b.eq	LBB0_2
	.loc	1 12 19 is_stmt 0
	str	w8, [sp, #8]
LBB0_2:
	.loc	1 13 3 is_stmt 1
	ldr	w8, [sp, #16]
	cmp	w8, #2
	b.eq	LBB0_4
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 13 19
	str	w8, [sp, #8]
LBB0_4:
	.loc	1 14 3 is_stmt 1
	ldr	w8, [sp, #20]
	cmp	w8, #3
	b.eq	LBB0_6
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 14 19
	str	w8, [sp, #8]
LBB0_6:
	.loc	1 15 3 is_stmt 1
	ldr	w8, [sp, #24]
	cbz	w8, LBB0_8
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 15 19
	str	w8, [sp, #8]
LBB0_8:
	.loc	1 17 3 is_stmt 1
	ldr	w8, [sp, #28]
	cmp	w8, #4
	b.eq	LBB0_10
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 17 19
	str	w8, [sp, #8]
LBB0_10:
	.loc	1 18 3 is_stmt 1
	ldr	w8, [sp, #32]
	cmp	w8, #5
	b.eq	LBB0_12
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 18 19
	str	w8, [sp, #8]
LBB0_12:
	.loc	1 19 3 is_stmt 1
	ldr	w8, [sp, #36]
	cmp	w8, #6
	b.eq	LBB0_14
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 19 19
	str	w8, [sp, #8]
LBB0_14:
	.loc	1 21 3 is_stmt 1
	ldr	w8, [sp, #40]
	cbz	w8, LBB0_16
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 21 19
	str	w8, [sp, #8]
LBB0_16:
	.loc	1 22 3 is_stmt 1
	ldr	w8, [sp, #44]
	cbz	w8, LBB0_18
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 22 19
	str	w8, [sp, #8]
LBB0_18:
	.loc	1 24 3 is_stmt 1
Lloh0:
	adrp	x8, _ga@PAGE
Lloh1:
	ldr	w8, [x8, _ga@PAGEOFF]
	cmp	w8, #1
	b.eq	LBB0_20
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 24 19
	str	w8, [sp, #8]
LBB0_20:
	.loc	1 25 3 is_stmt 1
Lloh2:
	adrp	x8, _ga@PAGE+4
Lloh3:
	ldr	w8, [x8, _ga@PAGEOFF+4]
	cmp	w8, #2
	b.eq	LBB0_22
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 25 19
	str	w8, [sp, #8]
LBB0_22:
	.loc	1 26 3 is_stmt 1
Lloh4:
	adrp	x8, _ga@PAGE+8
Lloh5:
	ldr	w8, [x8, _ga@PAGEOFF+8]
	cmp	w8, #3
	b.eq	LBB0_24
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 26 19
	str	w8, [sp, #8]
LBB0_24:
	.loc	1 27 3 is_stmt 1
Lloh6:
	adrp	x8, _ga@PAGE+12
Lloh7:
	ldr	w8, [x8, _ga@PAGEOFF+12]
	cbz	w8, LBB0_26
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 27 19
	str	w8, [sp, #8]
LBB0_26:
	.loc	1 29 3 is_stmt 1
Lloh8:
	adrp	x8, _gb@PAGE
Lloh9:
	ldr	w8, [x8, _gb@PAGEOFF]
	cmp	w8, #10
	b.eq	LBB0_28
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 29 20
	str	w8, [sp, #8]
LBB0_28:
	.loc	1 30 3 is_stmt 1
Lloh10:
	adrp	x8, _gb@PAGE+4
Lloh11:
	ldr	w8, [x8, _gb@PAGEOFF+4]
	cmp	w8, #20
	b.eq	LBB0_30
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 30 20
	str	w8, [sp, #8]
LBB0_30:
	.loc	1 32 3 is_stmt 1
	ldr	w8, [sp, #8]
	.loc	1 0 0 is_stmt 0
Lloh12:
	adrp	x9, l___unnamed_1@PAGE
Lloh13:
	add	x9, x9, l___unnamed_1@PAGEOFF
	cmp	w8, #0
Lloh14:
	adrp	x8, l___unnamed_2@PAGE
Lloh15:
	add	x8, x8, l___unnamed_2@PAGEOFF
	csel	x0, x8, x9, eq
	bl	_printf
	.loc	1 37 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #48]
	ldr	w0, [sp, #8]
	add	sp, sp, #64
	ret
Ltmp1:
	.loh AdrpLdr	Lloh0, Lloh1
	.loh AdrpLdr	Lloh2, Lloh3
	.loh AdrpLdr	Lloh4, Lloh5
	.loh AdrpLdr	Lloh6, Lloh7
	.loh AdrpLdr	Lloh8, Lloh9
	.loh AdrpLdr	Lloh10, Lloh11
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpAdd	Lloh12, Lloh13
Lfunc_end0:
	.cfi_endproc

	.section	__DATA,__data
	.globl	_ga
	.p2align	2, 0x0
_ga:
	.long	1
	.long	2
	.long	3
	.long	0

	.globl	_gb
	.p2align	2, 0x0
_gb:
	.long	10
	.long	20

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_2:
	.asciz	"31.array_1d_brace_init.c PASS\n"

l___unnamed_1:
	.asciz	"31.array_1d_brace_init.c FAIL\n"

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
	.byte	5
	.byte	1
	.byte	1
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	6
	.byte	33
	.byte	0
	.byte	73
	.byte	19
	.byte	55
	.byte	11
	.byte	0
	.byte	0
	.byte	7
	.byte	36
	.byte	0
	.byte	3
	.byte	14
	.byte	11
	.byte	11
	.byte	62
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
	.long	29
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end0-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	38
	.long	38
	.byte	1
	.byte	6
	.long	128

	.byte	3
	.byte	2
	.byte	145
	.byte	40
	.long	47
	.byte	1
	.byte	10
	.long	135
	.byte	3
	.byte	2
	.byte	145
	.byte	28
	.long	70
	.byte	1
	.byte	9
	.long	154
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	73
	.byte	1
	.byte	8
	.long	166
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	76
	.byte	1
	.byte	7
	.long	128
	.byte	0
	.byte	4
	.long	43
	.byte	5
	.byte	4
	.byte	5
	.long	128
	.byte	6
	.long	147
	.byte	2
	.byte	0
	.byte	7
	.long	50
	.byte	8
	.byte	7
	.byte	5
	.long	128
	.byte	6
	.long	147
	.byte	3
	.byte	0
	.byte	5
	.long	128
	.byte	6
	.long	147
	.byte	4
	.byte	0
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"31.array_1d_brace_init.c"
	.asciz	"../tests"
	.asciz	"main"
	.asciz	"int"
	.asciz	"lc"
	.asciz	"__ARRAY_SIZE_TYPE__"
	.asciz	"lb"
	.asciz	"la"
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
	.long	38
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
	.long	-594775205
.set Lset6, Ltypes0-Ltypes_begin
	.long	Lset6
.set Lset7, Ltypes1-Ltypes_begin
	.long	Lset7
Ltypes0:
	.long	43
	.long	1
	.long	128
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	50
	.long	1
	.long	147
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
