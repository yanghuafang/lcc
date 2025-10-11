	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "34.array_2d_brace_init.c"
	.loc	1 12 0
	.cfi_startproc
	sub	sp, sp, #112
	stp	x29, x30, [sp, #96]
	.cfi_def_cfa_offset 112
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x8, #1
	mov	x9, #12884901888
	mov	x10, #9
	movk	x8, #2, lsl #32
	movk	x10, #10, lsl #32
Ltmp0:
	.loc	1 13 3 prologue_end
	str	wzr, [sp, #4]
	.loc	1 14 3
	stp	x8, x9, [sp, #8]
	mov	x9, #7
	movk	x9, #8, lsl #32
	.loc	1 16 3
	stp	xzr, xzr, [sp, #72]
	.loc	1 14 3
	stp	xzr, x9, [sp, #24]
	mov	x9, #11
	movk	x9, #12, lsl #32
	.loc	1 17 3
	str	xzr, [sp, #88]
	.loc	1 15 3
	stp	x10, x9, [sp, #40]
	mov	x9, #3
	movk	x9, #4, lsl #32
	.loc	1 16 3
	stp	x8, x9, [sp, #56]
	mov	w8, #1
	.loc	1 19 3
	cmp	w8, #1
	b.eq	LBB0_2
	.loc	1 19 22 is_stmt 0
	str	w8, [sp, #4]
LBB0_2:
	.loc	1 20 3 is_stmt 1
	ldr	w8, [sp, #16]
	cbz	w8, LBB0_4
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 20 22
	str	w8, [sp, #4]
LBB0_4:
	.loc	1 21 3 is_stmt 1
	ldr	w8, [sp, #20]
	cmp	w8, #3
	b.eq	LBB0_6
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 21 22
	str	w8, [sp, #4]
LBB0_6:
	.loc	1 22 3 is_stmt 1
	ldr	w8, [sp, #28]
	cbz	w8, LBB0_8
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 22 22
	str	w8, [sp, #4]
LBB0_8:
	.loc	1 24 3 is_stmt 1
	ldr	w8, [sp, #32]
	cmp	w8, #7
	b.eq	LBB0_10
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 24 22
	str	w8, [sp, #4]
LBB0_10:
	.loc	1 25 3 is_stmt 1
	ldr	w8, [sp, #52]
	cmp	w8, #12
	b.eq	LBB0_12
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 25 23
	str	w8, [sp, #4]
LBB0_12:
	.loc	1 27 3 is_stmt 1
	ldr	w8, [sp, #64]
	cmp	w8, #3
	b.eq	LBB0_14
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 27 22
	str	w8, [sp, #4]
LBB0_14:
	.loc	1 28 3 is_stmt 1
	ldr	w8, [sp, #68]
	cmp	w8, #4
	b.eq	LBB0_16
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 28 22
	str	w8, [sp, #4]
LBB0_16:
	.loc	1 29 3 is_stmt 1
	ldr	w8, [sp, #76]
	cbz	w8, LBB0_18
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 29 22
	str	w8, [sp, #4]
LBB0_18:
	.loc	1 31 3 is_stmt 1
	ldr	w8, [sp, #80]
	cbz	w8, LBB0_20
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 31 22
	str	w8, [sp, #4]
LBB0_20:
	.loc	1 32 3 is_stmt 1
	ldr	w8, [sp, #84]
	cbz	w8, LBB0_22
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 32 22
	str	w8, [sp, #4]
LBB0_22:
	.loc	1 33 3 is_stmt 1
	ldr	w8, [sp, #88]
	cbz	w8, LBB0_24
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 33 22
	str	w8, [sp, #4]
LBB0_24:
	.loc	1 34 3 is_stmt 1
	ldr	w8, [sp, #92]
	cbz	w8, LBB0_26
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 34 22
	str	w8, [sp, #4]
LBB0_26:
	.loc	1 36 3 is_stmt 1
Lloh0:
	adrp	x8, _ga@PAGE
Lloh1:
	ldr	w8, [x8, _ga@PAGEOFF]
	cmp	w8, #1
	b.eq	LBB0_28
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 36 22
	str	w8, [sp, #4]
LBB0_28:
	.loc	1 37 3 is_stmt 1
Lloh2:
	adrp	x8, _ga@PAGE+20
Lloh3:
	ldr	w8, [x8, _ga@PAGEOFF+20]
	cmp	w8, #6
	b.eq	LBB0_30
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 37 22
	str	w8, [sp, #4]
LBB0_30:
	.loc	1 39 3 is_stmt 1
Lloh4:
	adrp	x8, _gb@PAGE+4
Lloh5:
	ldr	w8, [x8, _gb@PAGEOFF+4]
	cmp	w8, #1
	b.eq	LBB0_32
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 39 22
	str	w8, [sp, #4]
LBB0_32:
	.loc	1 40 3 is_stmt 1
Lloh6:
	adrp	x8, _gb@PAGE+12
Lloh7:
	ldr	w8, [x8, _gb@PAGEOFF+12]
	cmp	w8, #3
	b.eq	LBB0_34
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 40 22
	str	w8, [sp, #4]
LBB0_34:
	.loc	1 42 3 is_stmt 1
Lloh8:
	adrp	x8, _gc@PAGE+4
Lloh9:
	ldr	w8, [x8, _gc@PAGEOFF+4]
	cmp	w8, #11
	b.eq	LBB0_36
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 42 23
	str	w8, [sp, #4]
LBB0_36:
	.loc	1 43 3 is_stmt 1
Lloh10:
	adrp	x8, _gc@PAGE+8
Lloh11:
	ldr	w8, [x8, _gc@PAGEOFF+8]
	cmp	w8, #20
	b.eq	LBB0_38
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 43 23
	str	w8, [sp, #4]
LBB0_38:
	.loc	1 44 3 is_stmt 1
Lloh12:
	adrp	x8, _gc@PAGE+12
Lloh13:
	ldr	w8, [x8, _gc@PAGEOFF+12]
	cbz	w8, LBB0_40
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 44 22
	str	w8, [sp, #4]
LBB0_40:
	.loc	1 46 3 is_stmt 1
Lloh14:
	adrp	x8, _gd@PAGE
Lloh15:
	ldr	w8, [x8, _gd@PAGEOFF]
	cbz	w8, LBB0_42
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 46 22
	str	w8, [sp, #4]
LBB0_42:
	.loc	1 47 3 is_stmt 1
Lloh16:
	adrp	x8, _gd@PAGE+4
Lloh17:
	ldr	w8, [x8, _gd@PAGEOFF+4]
	cbz	w8, LBB0_44
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 47 22
	str	w8, [sp, #4]
LBB0_44:
	.loc	1 48 3 is_stmt 1
Lloh18:
	adrp	x8, _gd@PAGE+8
Lloh19:
	ldr	w8, [x8, _gd@PAGEOFF+8]
	cbz	w8, LBB0_46
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 48 22
	str	w8, [sp, #4]
LBB0_46:
	.loc	1 49 3 is_stmt 1
Lloh20:
	adrp	x8, _gd@PAGE+12
Lloh21:
	ldr	w8, [x8, _gd@PAGEOFF+12]
	cbz	w8, LBB0_48
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 49 22
	str	w8, [sp, #4]
LBB0_48:
	.loc	1 51 3 is_stmt 1
	ldr	w8, [sp, #4]
	.loc	1 0 0 is_stmt 0
Lloh22:
	adrp	x9, l___unnamed_1@PAGE
Lloh23:
	add	x9, x9, l___unnamed_1@PAGEOFF
	cmp	w8, #0
Lloh24:
	adrp	x8, l___unnamed_2@PAGE
Lloh25:
	add	x8, x8, l___unnamed_2@PAGEOFF
	csel	x0, x8, x9, eq
	bl	_printf
	.loc	1 56 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #96]
	ldr	w0, [sp, #4]
	add	sp, sp, #112
	ret
Ltmp1:
	.loh AdrpLdr	Lloh0, Lloh1
	.loh AdrpLdr	Lloh2, Lloh3
	.loh AdrpLdr	Lloh4, Lloh5
	.loh AdrpLdr	Lloh6, Lloh7
	.loh AdrpLdr	Lloh8, Lloh9
	.loh AdrpLdr	Lloh10, Lloh11
	.loh AdrpLdr	Lloh12, Lloh13
	.loh AdrpLdr	Lloh14, Lloh15
	.loh AdrpLdr	Lloh16, Lloh17
	.loh AdrpLdr	Lloh18, Lloh19
	.loh AdrpLdr	Lloh20, Lloh21
	.loh AdrpAdd	Lloh24, Lloh25
	.loh AdrpAdd	Lloh22, Lloh23
Lfunc_end0:
	.cfi_endproc

	.section	__DATA,__data
	.globl	_ga
	.p2align	4, 0x0
_ga:
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6

	.globl	_gb
	.p2align	4, 0x0
_gb:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5

	.globl	_gc
	.p2align	2, 0x0
_gc:
	.long	10
	.long	11
	.long	20
	.long	0

	.globl	_gd
.zerofill __DATA,__common,_gd,16,2
	.section	__TEXT,__cstring,cstring_literals
l___unnamed_2:
	.asciz	"34.array_2d_brace_init.c PASS\n"

l___unnamed_1:
	.asciz	"34.array_2d_brace_init.c FAIL\n"

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
	.byte	12
	.long	143

	.byte	3
	.byte	3
	.byte	145
	.asciz	"\320"
	.long	47
	.byte	1
	.byte	17
	.long	150
	.byte	3
	.byte	2
	.byte	145
	.byte	56
	.long	70
	.byte	1
	.byte	16
	.long	181
	.byte	3
	.byte	2
	.byte	145
	.byte	32
	.long	73
	.byte	1
	.byte	15
	.long	181
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	76
	.byte	1
	.byte	14
	.long	181
	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	79
	.byte	1
	.byte	13
	.long	143
	.byte	0
	.byte	4
	.long	43
	.byte	5
	.byte	4
	.byte	5
	.long	162
	.byte	6
	.long	174
	.byte	2
	.byte	0
	.byte	5
	.long	143
	.byte	6
	.long	174
	.byte	2
	.byte	0
	.byte	7
	.long	50
	.byte	8
	.byte	7
	.byte	5
	.long	193
	.byte	6
	.long	174
	.byte	2
	.byte	0
	.byte	5
	.long	143
	.byte	6
	.long	174
	.byte	3
	.byte	0
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"34.array_2d_brace_init.c"
	.asciz	"../tests"
	.asciz	"main"
	.asciz	"int"
	.asciz	"ld"
	.asciz	"__ARRAY_SIZE_TYPE__"
	.asciz	"lc"
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
	.long	143
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	50
	.long	1
	.long	174
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
