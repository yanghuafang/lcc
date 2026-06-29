	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "14.bitwise.c"
	.loc	1 3 0
	.cfi_startproc
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]
	.cfi_def_cfa_offset 80
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w9, #22136
	mov	w8, #17185
	mov	w12, #1450704896
	movk	w9, #4660, lsl #16
	movk	w8, #34661, lsl #16
Ltmp0:
	.loc	1 4 3 prologue_end
	stp	wzr, w9, [sp, #4]
	.loc	1 8 3
	and	w10, w9, w8
	.loc	1 9 3
	orr	w11, w8, w9
	.loc	1 10 3
	eor	w9, w8, w9
	.loc	1 17 3
	stp	w11, w8, [sp, #40]
	.loc	1 9 3
	stp	w11, w9, [sp, #20]
	mov	w9, #43399
	.loc	1 22 3
	lsr	w11, w8, #16
	movk	w9, #60875, lsl #16
	.loc	1 6 3
	stp	w8, w10, [sp, #12]
	.loc	1 11 3
	str	w9, [sp, #28]
	.loc	1 12 3
	mvn	w9, w8
	stp	w9, w10, [sp, #32]
	mov	w9, #16928
	movk	w9, #548, lsl #16
	.loc	1 23 3
	stp	w12, w11, [sp, #48]
	.loc	1 26 3
	cmp	w10, w9
	b.eq	LBB0_2
	.loc	1 0 3 is_stmt 0
	mov	w10, #1
	.loc	1 26 29
	str	w10, [sp, #4]
LBB0_2:
	.loc	1 27 3 is_stmt 1
	ldr	w11, [sp, #20]
	mov	w10, #22393
	movk	w10, #38773, lsl #16
	cmp	w11, w10
	b.eq	LBB0_4
	.loc	1 0 3 is_stmt 0
	mov	w11, #1
	.loc	1 27 28
	str	w11, [sp, #4]
LBB0_4:
	.loc	1 28 3 is_stmt 1
	ldr	w11, [sp, #24]
	mov	w12, #5465
	movk	w12, #38225, lsl #16
	cmp	w11, w12
	b.eq	LBB0_6
	.loc	1 0 3 is_stmt 0
	mov	w11, #1
	.loc	1 28 29
	str	w11, [sp, #4]
LBB0_6:
	.loc	1 29 3 is_stmt 1
	ldr	w11, [sp, #28]
	mov	w12, #43399
	movk	w12, #60875, lsl #16
	cmp	w11, w12
	b.eq	LBB0_8
	.loc	1 0 3 is_stmt 0
	mov	w11, #1
	.loc	1 29 30
	str	w11, [sp, #4]
LBB0_8:
	.loc	1 30 3 is_stmt 1
	ldr	w11, [sp, #32]
	mov	w12, #48350
	movk	w12, #30874, lsl #16
	cmp	w11, w12
	b.eq	LBB0_10
	.loc	1 0 3 is_stmt 0
	mov	w11, #1
	.loc	1 30 30
	str	w11, [sp, #4]
LBB0_10:
	.loc	1 31 3 is_stmt 1
	ldr	w11, [sp, #36]
	cmp	w11, w9
	b.eq	LBB0_12
	.loc	1 0 3 is_stmt 0
	mov	w9, #1
	.loc	1 31 31
	str	w9, [sp, #4]
LBB0_12:
	.loc	1 32 3 is_stmt 1
	ldr	w9, [sp, #40]
	cmp	w9, w10
	b.eq	LBB0_14
	.loc	1 0 3 is_stmt 0
	mov	w9, #1
	.loc	1 32 30
	str	w9, [sp, #4]
LBB0_14:
	.loc	1 33 3 is_stmt 1
	ldr	w9, [sp, #44]
	cmp	w9, w8
	b.eq	LBB0_16
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 33 31
	str	w8, [sp, #4]
LBB0_16:
	.loc	1 34 3 is_stmt 1
	ldr	w8, [sp, #48]
	mov	w9, #1450704896
	cmp	w8, w9
	b.eq	LBB0_18
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 34 35
	str	w8, [sp, #4]
LBB0_18:
	.loc	1 35 3 is_stmt 1
	ldr	w8, [sp, #52]
	mov	w9, #34661
	cmp	w8, w9
	b.eq	LBB0_20
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 35 32
	str	w8, [sp, #4]
LBB0_20:
	.loc	1 0 32
	mov	w8, #1073741824
	mov	w9, #-2147483648
	.loc	1 38 3 is_stmt 1
	cmp	w8, w8
	.loc	1 37 3
	str	w9, [sp, #56]
	.loc	1 38 3
	b.eq	LBB0_22
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 38 36
	str	w8, [sp, #4]
LBB0_22:
	.loc	1 0 36
	mov	w8, #-4
	mov	w9, #-8
	.loc	1 41 3 is_stmt 1
	cmn	w8, #4
	.loc	1 40 3
	str	w9, [sp, #60]
	.loc	1 41 3
	b.eq	LBB0_24
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 41 31
	str	w8, [sp, #4]
LBB0_24:
	.loc	1 43 3 is_stmt 1
	ldr	w8, [sp, #4]
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
	.loc	1 48 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #64]
	ldr	w0, [sp, #4]
	add	sp, sp, #80
	ret
Ltmp1:
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
Lfunc_end0:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_2:
	.asciz	"14.bitwise.c PASS\n"

l___unnamed_1:
	.asciz	"14.bitwise.c FAIL\n"

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
	.long	17
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end0-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	26
	.long	26
	.byte	1
	.byte	3
	.long	282

	.byte	3
	.byte	2
	.byte	145
	.byte	60
	.long	35
	.byte	1
	.byte	40
	.long	282
	.byte	3
	.byte	2
	.byte	145
	.byte	56
	.long	45
	.byte	1
	.byte	37
	.long	289
	.byte	3
	.byte	2
	.byte	145
	.byte	52
	.long	65
	.byte	1
	.byte	22
	.long	289
	.byte	3
	.byte	2
	.byte	145
	.byte	48
	.long	79
	.byte	1
	.byte	21
	.long	289
	.byte	3
	.byte	2
	.byte	145
	.byte	44
	.long	92
	.byte	1
	.byte	18
	.long	289
	.byte	3
	.byte	2
	.byte	145
	.byte	40
	.long	101
	.byte	1
	.byte	16
	.long	289
	.byte	3
	.byte	2
	.byte	145
	.byte	36
	.long	109
	.byte	1
	.byte	14
	.long	289
	.byte	3
	.byte	2
	.byte	145
	.byte	32
	.long	118
	.byte	1
	.byte	12
	.long	289
	.byte	3
	.byte	2
	.byte	145
	.byte	28
	.long	126
	.byte	1
	.byte	11
	.long	289
	.byte	3
	.byte	2
	.byte	145
	.byte	24
	.long	134
	.byte	1
	.byte	10
	.long	289
	.byte	3
	.byte	2
	.byte	145
	.byte	20
	.long	141
	.byte	1
	.byte	9
	.long	289
	.byte	3
	.byte	2
	.byte	145
	.byte	16
	.long	147
	.byte	1
	.byte	8
	.long	289
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	154
	.byte	1
	.byte	6
	.long	289
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	156
	.byte	1
	.byte	5
	.long	289
	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	158
	.byte	1
	.byte	4
	.long	282
	.byte	0
	.byte	4
	.long	31
	.byte	5
	.byte	4
	.byte	4
	.long	52
	.byte	7
	.byte	4
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"14.bitwise.c"
	.asciz	"../tests"
	.asciz	"main"
	.asciz	"int"
	.asciz	"signedVal"
	.asciz	"msbSet"
	.asciz	"unsigned int"
	.asciz	"rightShiftVal"
	.asciz	"leftShiftVal"
	.asciz	"xoreqVal"
	.asciz	"oreqVal"
	.asciz	"andeqVal"
	.asciz	"notVal2"
	.asciz	"notVal1"
	.asciz	"xorVal"
	.asciz	"orVal"
	.asciz	"andVal"
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
	.long	26
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
	.long	-1304652851
.set Lset6, Ltypes0-Ltypes_begin
	.long	Lset6
.set Lset7, Ltypes1-Ltypes_begin
	.long	Lset7
Ltypes0:
	.long	31
	.long	1
	.long	282
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	52
	.long	1
	.long	289
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
