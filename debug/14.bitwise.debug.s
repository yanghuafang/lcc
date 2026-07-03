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
Ltmp0:
	.loc	1 4 3 prologue_end
	str	wzr, [sp, #4]
	.loc	1 5 3
	mov	w8, #22136
	movk	w8, #4660, lsl #16
	str	w8, [sp, #8]
	.loc	1 6 3
	mov	w8, #17185
	movk	w8, #34661, lsl #16
	str	w8, [sp, #12]
	.loc	1 8 3
	ldr	w8, [sp, #8]
	ldr	w9, [sp, #12]
	and	w8, w8, w9
	str	w8, [sp, #16]
	.loc	1 9 3
	ldr	w8, [sp, #8]
	ldr	w9, [sp, #12]
	orr	w8, w8, w9
	str	w8, [sp, #20]
	.loc	1 10 3
	ldr	w8, [sp, #8]
	ldr	w9, [sp, #12]
	eor	w8, w8, w9
	str	w8, [sp, #24]
	.loc	1 11 3
	ldr	w8, [sp, #8]
	mvn	w8, w8
	str	w8, [sp, #28]
	.loc	1 12 3
	ldr	w8, [sp, #12]
	mvn	w8, w8
	str	w8, [sp, #32]
	.loc	1 14 3
	ldr	w8, [sp, #16]
	str	w8, [sp, #36]
	.loc	1 15 3
	ldr	w9, [sp, #8]
	ldr	w8, [sp, #36]
	and	w8, w8, w9
	str	w8, [sp, #36]
	.loc	1 16 3
	ldr	w8, [sp, #20]
	str	w8, [sp, #40]
	.loc	1 17 3
	ldr	w9, [sp, #8]
	ldr	w8, [sp, #40]
	orr	w8, w8, w9
	str	w8, [sp, #40]
	.loc	1 18 3
	ldr	w8, [sp, #24]
	str	w8, [sp, #44]
	.loc	1 19 3
	ldr	w9, [sp, #8]
	ldr	w8, [sp, #44]
	eor	w8, w8, w9
	str	w8, [sp, #44]
	.loc	1 21 3
	ldr	w8, [sp, #8]
	lsl	w8, w8, #8
	str	w8, [sp, #48]
	.loc	1 22 3
	ldr	w8, [sp, #12]
	lsr	w8, w8, #8
	str	w8, [sp, #52]
	.loc	1 23 3
	ldr	w8, [sp, #48]
	lsl	w8, w8, #8
	str	w8, [sp, #48]
	.loc	1 24 3
	ldr	w8, [sp, #52]
	lsr	w8, w8, #8
	str	w8, [sp, #52]
	.loc	1 26 3
	ldr	w8, [sp, #16]
	mov	w9, #16928
	movk	w9, #548, lsl #16
	subs	w8, w8, w9
	b.eq	LBB0_2
	b	LBB0_1
LBB0_1:
	.loc	1 26 29 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_3
LBB0_2:
	b	LBB0_3
LBB0_3:
	.loc	1 27 3 is_stmt 1
	ldr	w8, [sp, #20]
	mov	w9, #22393
	movk	w9, #38773, lsl #16
	subs	w8, w8, w9
	b.eq	LBB0_5
	b	LBB0_4
LBB0_4:
	.loc	1 27 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_6
LBB0_5:
	b	LBB0_6
LBB0_6:
	.loc	1 28 3 is_stmt 1
	ldr	w8, [sp, #24]
	mov	w9, #5465
	movk	w9, #38225, lsl #16
	subs	w8, w8, w9
	b.eq	LBB0_8
	b	LBB0_7
LBB0_7:
	.loc	1 28 29 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_9
LBB0_8:
	b	LBB0_9
LBB0_9:
	.loc	1 29 3 is_stmt 1
	ldr	w8, [sp, #28]
	mov	w9, #43399
	movk	w9, #60875, lsl #16
	subs	w8, w8, w9
	b.eq	LBB0_11
	b	LBB0_10
LBB0_10:
	.loc	1 29 30 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_12
LBB0_11:
	b	LBB0_12
LBB0_12:
	.loc	1 30 3 is_stmt 1
	ldr	w8, [sp, #32]
	mov	w9, #48350
	movk	w9, #30874, lsl #16
	subs	w8, w8, w9
	b.eq	LBB0_14
	b	LBB0_13
LBB0_13:
	.loc	1 30 30 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_15
LBB0_14:
	b	LBB0_15
LBB0_15:
	.loc	1 31 3 is_stmt 1
	ldr	w8, [sp, #36]
	mov	w9, #16928
	movk	w9, #548, lsl #16
	subs	w8, w8, w9
	b.eq	LBB0_17
	b	LBB0_16
LBB0_16:
	.loc	1 31 31 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_18
LBB0_17:
	b	LBB0_18
LBB0_18:
	.loc	1 32 3 is_stmt 1
	ldr	w8, [sp, #40]
	mov	w9, #22393
	movk	w9, #38773, lsl #16
	subs	w8, w8, w9
	b.eq	LBB0_20
	b	LBB0_19
LBB0_19:
	.loc	1 32 30 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_21
LBB0_20:
	b	LBB0_21
LBB0_21:
	.loc	1 33 3 is_stmt 1
	ldr	w8, [sp, #44]
	mov	w9, #17185
	movk	w9, #34661, lsl #16
	subs	w8, w8, w9
	b.eq	LBB0_23
	b	LBB0_22
LBB0_22:
	.loc	1 33 31 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_24
LBB0_23:
	b	LBB0_24
LBB0_24:
	.loc	1 34 3 is_stmt 1
	ldr	w8, [sp, #48]
	mov	w9, #1450704896
	subs	w8, w8, w9
	b.eq	LBB0_26
	b	LBB0_25
LBB0_25:
	.loc	1 34 35 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_27
LBB0_26:
	b	LBB0_27
LBB0_27:
	.loc	1 35 3 is_stmt 1
	ldr	w8, [sp, #52]
	mov	w9, #34661
	subs	w8, w8, w9
	b.eq	LBB0_29
	b	LBB0_28
LBB0_28:
	.loc	1 35 32 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_30
LBB0_29:
	b	LBB0_30
LBB0_30:
	.loc	1 37 3 is_stmt 1
	mov	w8, #-2147483648
	str	w8, [sp, #56]
	.loc	1 38 3
	ldr	w9, [sp, #56]
	mov	w8, #1073741824
	subs	w8, w8, w9, lsr #1
	b.eq	LBB0_32
	b	LBB0_31
LBB0_31:
	.loc	1 38 36 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_33
LBB0_32:
	b	LBB0_33
LBB0_33:
	.loc	1 40 3 is_stmt 1
	mov	w8, #-8
	str	w8, [sp, #60]
	.loc	1 41 3
	ldr	w9, [sp, #60]
	mov	w8, #-4
	subs	w8, w8, w9, asr #1
	b.eq	LBB0_35
	b	LBB0_34
LBB0_34:
	.loc	1 41 31 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_36
LBB0_35:
	b	LBB0_36
LBB0_36:
	.loc	1 43 3 is_stmt 1
	ldr	w8, [sp, #4]
	cbnz	w8, LBB0_38
	b	LBB0_37
LBB0_37:
Ltmp1:
	.loc	1 44 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB0_39
Ltmp2:
LBB0_38:
	.loc	1 46 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB0_39
Ltmp3:
LBB0_39:
	.loc	1 48 3
	ldr	w0, [sp, #4]
	.loc	1 48 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #64]
	add	sp, sp, #80
	ret
Ltmp4:
Lfunc_end0:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"14.bitwise.c PASS\n"

l___unnamed_2:
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
