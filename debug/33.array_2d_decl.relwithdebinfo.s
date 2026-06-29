	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "33.array_2d_decl.c"
	.loc	1 10 0
	.cfi_startproc
	sub	sp, sp, #96
	stp	x29, x30, [sp, #80]
	.cfi_def_cfa_offset 96
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w9, #2
	mov	x10, #5
	mov	w8, #1
Ltmp0:
	.loc	1 17 3 prologue_end
	str	w9, [sp, #16]
	mov	x9, #3
	movk	x10, #6, lsl #32
	movk	x9, #4, lsl #32
	.loc	1 20 3
	stur	x10, [sp, #28]
	mov	w10, #10
	.loc	1 18 3
	stur	x9, [sp, #20]
	mov	w9, #99
	.loc	1 33 3
	cmp	w8, #1
	.loc	1 22 3
	str	w9, [sp, #36]
	.loc	1 24 3
Lloh0:
	adrp	x9, _gm@PAGE
Lloh1:
	add	x9, x9, _gm@PAGEOFF
	str	w10, [x9]
	mov	w10, #20
	.loc	1 25 3
	str	w10, [x9, #24]
	mov	w10, #30
	.loc	1 26 3
	str	w10, [x9, #44]
	mov	w9, #7
	.loc	1 28 3
	str	w9, [sp, #48]
	mov	x9, #70
	movk	x9, #8, lsl #32
	.loc	1 11 3
	stp	wzr, w8, [sp, #8]
	.loc	1 29 3
	stur	x9, [sp, #52]
	.loc	1 32 3
	str	w8, [sp, #76]
	.loc	1 33 3
	b.eq	LBB0_2
	.loc	1 33 15 is_stmt 0
	str	w8, [sp, #8]
LBB0_2:
	.loc	1 34 3 is_stmt 1
	ldr	w8, [sp, #20]
	.loc	1 35 3
	cmp	w8, #3
	.loc	1 34 3
	str	w8, [sp, #76]
	.loc	1 35 3
	b.eq	LBB0_4
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 35 15
	str	w8, [sp, #8]
LBB0_4:
	.loc	1 36 3 is_stmt 1
	ldr	w8, [sp, #28]
	.loc	1 37 3
	cmp	w8, #5
	.loc	1 36 3
	str	w8, [sp, #76]
	.loc	1 37 3
	b.eq	LBB0_6
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 37 15
	str	w8, [sp, #8]
LBB0_6:
	.loc	1 38 3 is_stmt 1
	ldr	w8, [sp, #32]
	.loc	1 39 3
	cmp	w8, #6
	.loc	1 38 3
	str	w8, [sp, #76]
	.loc	1 39 3
	b.eq	LBB0_8
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 39 15
	str	w8, [sp, #8]
LBB0_8:
	.loc	1 40 3 is_stmt 1
	ldr	w8, [sp, #36]
	cmp	w8, #99
	b.eq	LBB0_10
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 40 21
	str	w8, [sp, #8]
LBB0_10:
	.loc	1 42 3 is_stmt 1
Lloh2:
	adrp	x8, _gm@PAGE
Lloh3:
	ldr	w8, [x8, _gm@PAGEOFF]
	.loc	1 43 3
	cmp	w8, #10
	.loc	1 42 3
	str	w8, [sp, #76]
	.loc	1 43 3
	b.eq	LBB0_12
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 43 16
	str	w8, [sp, #8]
LBB0_12:
	.loc	1 44 3 is_stmt 1
Lloh4:
	adrp	x8, _gm@PAGE+24
Lloh5:
	ldr	w8, [x8, _gm@PAGEOFF+24]
	.loc	1 45 3
	cmp	w8, #20
	.loc	1 44 3
	str	w8, [sp, #76]
	.loc	1 45 3
	b.eq	LBB0_14
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 45 16
	str	w8, [sp, #8]
LBB0_14:
	.loc	1 46 3 is_stmt 1
Lloh6:
	adrp	x8, _gm@PAGE+44
Lloh7:
	ldr	w8, [x8, _gm@PAGEOFF+44]
	.loc	1 47 3
	cmp	w8, #30
	.loc	1 46 3
	str	w8, [sp, #76]
	.loc	1 47 3
	b.eq	LBB0_16
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 47 16
	str	w8, [sp, #8]
LBB0_16:
	.loc	1 48 3 is_stmt 1
Lloh8:
	adrp	x8, _gm@PAGE+4
Lloh9:
	ldr	w8, [x8, _gm@PAGEOFF+4]
	str	w8, [sp, #76]
	.loc	1 49 3
	cbz	w8, LBB0_18
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 49 15
	str	w8, [sp, #8]
LBB0_18:
	.loc	1 51 3 is_stmt 1
	ldr	w8, [sp, #48]
	.loc	1 52 3
	cmp	w8, #7
	.loc	1 51 3
	str	w8, [sp, #76]
	.loc	1 52 3
	b.eq	LBB0_20
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 52 15
	str	w8, [sp, #8]
LBB0_20:
	.loc	1 53 3 is_stmt 1
	ldr	w8, [sp, #52]
	.loc	1 54 3
	cmp	w8, #70
	.loc	1 53 3
	str	w8, [sp, #76]
	.loc	1 54 3
	b.eq	LBB0_22
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 54 16
	str	w8, [sp, #8]
LBB0_22:
	.loc	1 55 3 is_stmt 1
	ldr	w8, [sp, #56]
	.loc	1 56 3
	cmp	w8, #8
	.loc	1 55 3
	str	w8, [sp, #76]
	.loc	1 56 3
	b.eq	LBB0_24
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 56 15
	str	w8, [sp, #8]
LBB0_24:
	.loc	1 58 3 is_stmt 1
	ldr	w8, [sp, #8]
	.loc	1 0 0 is_stmt 0
Lloh10:
	adrp	x9, l___unnamed_1@PAGE
Lloh11:
	add	x9, x9, l___unnamed_1@PAGEOFF
	cmp	w8, #0
Lloh12:
	adrp	x8, l___unnamed_2@PAGE
Lloh13:
	add	x8, x8, l___unnamed_2@PAGEOFF
	csel	x0, x8, x9, eq
	bl	_printf
	.loc	1 63 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #80]
	ldr	w0, [sp, #8]
	add	sp, sp, #96
	ret
Ltmp1:
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpLdr	Lloh2, Lloh3
	.loh AdrpLdr	Lloh4, Lloh5
	.loh AdrpLdr	Lloh6, Lloh7
	.loh AdrpLdr	Lloh8, Lloh9
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpAdd	Lloh10, Lloh11
Lfunc_end0:
	.cfi_endproc

	.globl	_gm
.zerofill __DATA,__common,_gm,48,4
	.section	__TEXT,__cstring,cstring_literals
l___unnamed_2:
	.asciz	"33.array_2d_decl.c PASS\n"

l___unnamed_1:
	.asciz	"33.array_2d_decl.c FAIL\n"

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
	.long	23
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end0-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	32
	.long	32
	.byte	1
	.byte	10
	.long	143

	.byte	3
	.byte	3
	.byte	145
	.asciz	"\314"
	.long	41
	.byte	1
	.byte	14
	.long	143
	.byte	3
	.byte	2
	.byte	145
	.byte	40
	.long	43
	.byte	1
	.byte	13
	.long	150
	.byte	3
	.byte	2
	.byte	145
	.byte	36
	.long	73
	.byte	1
	.byte	12
	.long	143
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	80
	.byte	1
	.byte	12
	.long	188
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	82
	.byte	1
	.byte	11
	.long	143
	.byte	0
	.byte	4
	.long	37
	.byte	5
	.byte	4
	.byte	5
	.long	162
	.byte	6
	.long	181
	.byte	2
	.byte	0
	.byte	5
	.long	174
	.byte	6
	.long	181
	.byte	2
	.byte	0
	.byte	4
	.long	48
	.byte	1
	.byte	0
	.byte	7
	.long	53
	.byte	8
	.byte	7
	.byte	5
	.long	200
	.byte	6
	.long	181
	.byte	2
	.byte	0
	.byte	5
	.long	143
	.byte	6
	.long	181
	.byte	3
	.byte	0
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"33.array_2d_decl.c"
	.asciz	"../tests"
	.asciz	"main"
	.asciz	"int"
	.asciz	"v"
	.asciz	"grid"
	.asciz	"void"
	.asciz	"__ARRAY_SIZE_TYPE__"
	.asciz	"scalar"
	.asciz	"m"
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
	.long	32
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
	.long	3
	.long	3
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
	.long	-1
	.long	1
	.long	2090838615
	.long	193495088
	.long	-594775205
.set Lset6, Ltypes1-Ltypes_begin
	.long	Lset6
.set Lset7, Ltypes0-Ltypes_begin
	.long	Lset7
.set Lset8, Ltypes2-Ltypes_begin
	.long	Lset8
Ltypes1:
	.long	48
	.long	1
	.long	174
	.short	36
	.byte	0
	.long	0
Ltypes0:
	.long	37
	.long	1
	.long	143
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	53
	.long	1
	.long	181
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
