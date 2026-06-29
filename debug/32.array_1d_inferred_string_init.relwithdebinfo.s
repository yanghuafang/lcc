	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "32.array_1d_inferred_string_init.c"
	.loc	1 7 0
	.cfi_startproc
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x8, #1
	mov	w9, #25960
	mov	w10, #3
	movk	x8, #2, lsl #32
	movk	w9, #27756, lsl #16
Ltmp0:
	.loc	1 8 3 prologue_end
	str	wzr, [sp, #4]
	.loc	1 9 3
	str	x8, [sp, #8]
	mov	w8, #1
	stp	w10, w9, [sp, #16]
	mov	w10, #111
	.loc	1 13 3
	cmp	w8, #1
	.loc	1 10 3
	strh	w10, [sp, #24]
	.loc	1 11 3
	stur	w9, [sp, #26]
	strh	w10, [sp, #30]
	.loc	1 13 3
	b.eq	LBB0_2
	.loc	1 13 19 is_stmt 0
	str	w8, [sp, #4]
LBB0_2:
	.loc	1 14 3 is_stmt 1
	ldr	w8, [sp, #12]
	cmp	w8, #2
	b.eq	LBB0_4
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 14 19
	str	w8, [sp, #4]
LBB0_4:
	.loc	1 15 3 is_stmt 1
	ldr	w8, [sp, #16]
	cmp	w8, #3
	b.eq	LBB0_6
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 15 19
	str	w8, [sp, #4]
LBB0_6:
	.loc	1 17 3 is_stmt 1
	ldrsb	w8, [sp, #20]
	cmp	w8, #104
	b.eq	LBB0_8
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 17 21
	str	w8, [sp, #4]
LBB0_8:
	.loc	1 18 3 is_stmt 1
	ldrsb	w8, [sp, #21]
	cmp	w8, #101
	b.eq	LBB0_10
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 18 21
	str	w8, [sp, #4]
LBB0_10:
	.loc	1 19 3 is_stmt 1
	ldrsb	w8, [sp, #22]
	cmp	w8, #108
	b.eq	LBB0_12
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 19 21
	str	w8, [sp, #4]
LBB0_12:
	.loc	1 20 3 is_stmt 1
	ldrsb	w8, [sp, #23]
	cmp	w8, #108
	b.eq	LBB0_14
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 20 21
	str	w8, [sp, #4]
LBB0_14:
	.loc	1 21 3 is_stmt 1
	ldrsb	w8, [sp, #24]
	cmp	w8, #111
	b.eq	LBB0_16
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 21 21
	str	w8, [sp, #4]
LBB0_16:
	.loc	1 22 3 is_stmt 1
	ldrsb	w8, [sp, #25]
	cbz	w8, LBB0_18
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 22 19
	str	w8, [sp, #4]
LBB0_18:
	.loc	1 24 3 is_stmt 1
	ldrsb	w8, [sp, #26]
	cmp	w8, #104
	b.eq	LBB0_20
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 24 21
	str	w8, [sp, #4]
LBB0_20:
	.loc	1 25 3 is_stmt 1
	ldrsb	w8, [sp, #31]
	cbz	w8, LBB0_22
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 25 19
	str	w8, [sp, #4]
LBB0_22:
	.loc	1 27 3 is_stmt 1
Lloh0:
	adrp	x8, _ga@PAGE
Lloh1:
	ldr	w8, [x8, _ga@PAGEOFF]
	cmp	w8, #10
	b.eq	LBB0_24
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 27 20
	str	w8, [sp, #4]
LBB0_24:
	.loc	1 28 3 is_stmt 1
Lloh2:
	adrp	x8, _ga@PAGE+4
Lloh3:
	ldr	w8, [x8, _ga@PAGEOFF+4]
	cmp	w8, #7
	b.eq	LBB0_26
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 28 19
	str	w8, [sp, #4]
LBB0_26:
	.loc	1 29 3 is_stmt 1
Lloh4:
	adrp	x8, _ga@PAGE+8
Lloh5:
	ldr	w8, [x8, _ga@PAGEOFF+8]
	cmp	w8, #8
	b.eq	LBB0_28
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 29 19
	str	w8, [sp, #4]
LBB0_28:
	.loc	1 30 3 is_stmt 1
Lloh6:
	adrp	x8, _ga@PAGE+12
Lloh7:
	ldr	w8, [x8, _ga@PAGEOFF+12]
	cmp	w8, #9
	b.eq	LBB0_30
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 30 19
	str	w8, [sp, #4]
LBB0_30:
	.loc	1 31 3 is_stmt 1
Lloh8:
	adrp	x8, _ga@PAGE+16
Lloh9:
	ldr	w8, [x8, _ga@PAGEOFF+16]
	cmp	w8, #1
	b.eq	LBB0_32
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 31 19
	str	w8, [sp, #4]
LBB0_32:
	.loc	1 32 3 is_stmt 1
Lloh10:
	adrp	x8, _ga@PAGE+20
Lloh11:
	ldr	w8, [x8, _ga@PAGEOFF+20]
	cmp	w8, #5
	b.eq	LBB0_34
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 32 19
	str	w8, [sp, #4]
LBB0_34:
	.loc	1 34 3 is_stmt 1
	adrp	x8, _gs@PAGE
	ldrsb	w8, [x8, _gs@PAGEOFF]
	cmp	w8, #104
	b.eq	LBB0_36
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 34 21
	str	w8, [sp, #4]
LBB0_36:
	.loc	1 35 3 is_stmt 1
	adrp	x8, _gs@PAGE+1
	ldrsb	w8, [x8, _gs@PAGEOFF+1]
	cmp	w8, #105
	b.eq	LBB0_38
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 35 21
	str	w8, [sp, #4]
LBB0_38:
	.loc	1 36 3 is_stmt 1
	adrp	x8, _gs@PAGE+2
	ldrsb	w8, [x8, _gs@PAGEOFF+2]
	cbz	w8, LBB0_40
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 36 19
	str	w8, [sp, #4]
LBB0_40:
	.loc	1 38 3 is_stmt 1
	adrp	x8, _gt@PAGE
	ldrsb	w8, [x8, _gt@PAGEOFF]
	cmp	w8, #104
	b.eq	LBB0_42
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 38 21
	str	w8, [sp, #4]
LBB0_42:
	.loc	1 39 3 is_stmt 1
	adrp	x8, _gt@PAGE+1
	ldrsb	w8, [x8, _gt@PAGEOFF+1]
	cmp	w8, #101
	b.eq	LBB0_44
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 39 21
	str	w8, [sp, #4]
LBB0_44:
	.loc	1 40 3 is_stmt 1
	adrp	x8, _gt@PAGE+2
	ldrsb	w8, [x8, _gt@PAGEOFF+2]
	cmp	w8, #121
	b.eq	LBB0_46
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 40 21
	str	w8, [sp, #4]
LBB0_46:
	.loc	1 41 3 is_stmt 1
	adrp	x8, _gt@PAGE+3
	ldrsb	w8, [x8, _gt@PAGEOFF+3]
	cbz	w8, LBB0_48
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 41 19
	str	w8, [sp, #4]
LBB0_48:
	.loc	1 43 3 is_stmt 1
	ldr	w8, [sp, #4]
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
	.loc	1 48 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #32]
	ldr	w0, [sp, #4]
	add	sp, sp, #48
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
	.p2align	4, 0x0
_ga:
	.long	10
	.long	7
	.long	8
	.long	9
	.long	1
	.long	5

	.globl	_gs
_gs:
	.asciz	"hi"

	.globl	_gt
_gt:
	.asciz	"hey"

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_2:
	.asciz	"32.array_1d_inferred_string_init.c PASS\n"

l___unnamed_1:
	.asciz	"32.array_1d_inferred_string_init.c FAIL\n"

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
	.byte	7
	.long	128

	.byte	3
	.byte	2
	.byte	145
	.byte	26
	.long	57
	.byte	1
	.byte	11
	.long	135
	.byte	3
	.byte	2
	.byte	145
	.byte	20
	.long	85
	.byte	1
	.byte	10
	.long	135
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	88
	.byte	1
	.byte	9
	.long	161
	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	91
	.byte	1
	.byte	8
	.long	128
	.byte	0
	.byte	4
	.long	53
	.byte	5
	.byte	4
	.byte	5
	.long	147
	.byte	6
	.long	154
	.byte	6
	.byte	0
	.byte	4
	.long	60
	.byte	6
	.byte	1
	.byte	7
	.long	65
	.byte	8
	.byte	7
	.byte	5
	.long	128
	.byte	6
	.long	154
	.byte	3
	.byte	0
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"32.array_1d_inferred_string_init.c"
	.asciz	"../tests"
	.asciz	"main"
	.asciz	"int"
	.asciz	"lb"
	.asciz	"char"
	.asciz	"__ARRAY_SIZE_TYPE__"
	.asciz	"ls"
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
	.long	-1
	.long	-1
	.long	0
	.long	193495088
	.long	2090147939
	.long	-594775205
.set Lset6, Ltypes0-Ltypes_begin
	.long	Lset6
.set Lset7, Ltypes1-Ltypes_begin
	.long	Lset7
.set Lset8, Ltypes2-Ltypes_begin
	.long	Lset8
Ltypes0:
	.long	53
	.long	1
	.long	128
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	60
	.long	1
	.long	147
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	65
	.long	1
	.long	154
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
