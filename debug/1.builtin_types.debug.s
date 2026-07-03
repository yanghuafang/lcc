	.build_version macos, 16, 0
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3, 0x0
lCPI0_0:
	.quad	0x400921fb54442d11
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "1.builtin_types.c"
	.loc	1 3 0
	.cfi_startproc
	sub	sp, sp, #96
	stp	x29, x30, [sp, #80]
	.cfi_def_cfa_offset 96
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x9, #30154
	movk	x9, #19624, lsl #16
	movk	x9, #2, lsl #32
	str	x9, [sp, #8]
Ltmp0:
	.loc	1 4 3 prologue_end
	mov	w8, wzr
	str	wzr, [sp, #20]
	.loc	1 5 3
	mov	w10, #65
	strb	w10, [sp, #25]
	.loc	1 6 3
	mov	w10, #64512
	strh	w10, [sp, #26]
	.loc	1 7 3
	mov	w10, #40626
	movk	w10, #65347, lsl #16
	str	w10, [sp, #28]
	.loc	1 8 3
	mov	x10, #-722
	movk	x10, #46697, lsl #16
	str	x10, [sp, #32]
	.loc	1 9 3
	mov	w10, #250
	strb	w10, [sp, #43]
	.loc	1 10 3
	mov	w10, #57072
	movk	w10, #2748, lsl #16
	str	w10, [sp, #44]
	.loc	1 11 3
	str	x9, [sp, #48]
	.loc	1 12 3
	mov	w9, #4058
	movk	w9, #16457, lsl #16
	fmov	s0, w9
	str	s0, [sp, #60]
	.loc	1 13 3
	adrp	x9, lCPI0_0@PAGE
	ldr	d0, [x9, lCPI0_0@PAGEOFF]
	str	d0, [sp, #64]
	mov	w9, #1
	.loc	1 14 3
	and	w10, w9, #0x1
	and	w10, w10, #0x1
	strb	w10, [sp, #78]
	.loc	1 15 3
	and	w8, w8, #0x1
	and	w8, w8, w9
	strb	w8, [sp, #79]
	.loc	1 17 3
	ldrsb	w8, [sp, #25]
	subs	w8, w8, #65
	b.eq	LBB0_2
	b	LBB0_1
LBB0_1:
	.loc	1 17 18 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #20]
	b	LBB0_3
LBB0_2:
	b	LBB0_3
LBB0_3:
	.loc	1 18 3 is_stmt 1
	ldrsh	w8, [sp, #26]
	adds	w8, w8, #1024
	b.eq	LBB0_5
	b	LBB0_4
LBB0_4:
	.loc	1 18 20 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #20]
	b	LBB0_6
LBB0_5:
	b	LBB0_6
LBB0_6:
	.loc	1 19 3 is_stmt 1
	ldr	w8, [sp, #28]
	mov	w9, #40626
	movk	w9, #65347, lsl #16
	subs	w8, w8, w9
	b.eq	LBB0_8
	b	LBB0_7
LBB0_7:
	.loc	1 19 24 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #20]
	b	LBB0_9
LBB0_8:
	b	LBB0_9
LBB0_9:
	.loc	1 20 3 is_stmt 1
	ldr	x8, [sp, #32]
	mov	x9, #-722
	movk	x9, #46697, lsl #16
	subs	x8, x8, x9
	b.eq	LBB0_11
	b	LBB0_10
LBB0_10:
	.loc	1 20 27 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #20]
	b	LBB0_12
LBB0_11:
	b	LBB0_12
LBB0_12:
	.loc	1 21 3 is_stmt 1
	ldrb	w8, [sp, #43]
	subs	w8, w8, #250
	b.eq	LBB0_14
	b	LBB0_13
LBB0_13:
	.loc	1 21 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #20]
	b	LBB0_15
LBB0_14:
	b	LBB0_15
LBB0_15:
	.loc	1 22 3 is_stmt 1
	ldr	w8, [sp, #44]
	mov	w9, #57072
	movk	w9, #2748, lsl #16
	subs	w8, w8, w9
	b.eq	LBB0_17
	b	LBB0_16
LBB0_16:
	.loc	1 22 26 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #20]
	b	LBB0_18
LBB0_17:
	b	LBB0_18
LBB0_18:
	.loc	1 0 26
	ldr	x9, [sp, #8]
	.loc	1 23 3 is_stmt 1
	ldr	x8, [sp, #48]
	subs	x8, x8, x9
	b.eq	LBB0_20
	b	LBB0_19
LBB0_19:
	.loc	1 23 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #20]
	b	LBB0_21
LBB0_20:
	b	LBB0_21
LBB0_21:
	.loc	1 24 3 is_stmt 1
	ldrb	w8, [sp, #78]
	and	w8, w8, #0x1
	subs	w8, w8, #1
	b.eq	LBB0_23
	b	LBB0_22
LBB0_22:
	.loc	1 24 16 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #20]
	b	LBB0_24
LBB0_23:
	b	LBB0_24
LBB0_24:
	.loc	1 25 3 is_stmt 1
	ldrb	w8, [sp, #79]
	tbz	w8, #0, LBB0_26
	b	LBB0_25
LBB0_25:
	.loc	1 25 16 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #20]
	b	LBB0_27
LBB0_26:
	b	LBB0_27
LBB0_27:
	.loc	1 27 3 is_stmt 1
	ldr	w8, [sp, #20]
	cbnz	w8, LBB0_29
	b	LBB0_28
LBB0_28:
Ltmp1:
	.loc	1 28 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB0_30
Ltmp2:
LBB0_29:
	.loc	1 30 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB0_30
Ltmp3:
LBB0_30:
	.loc	1 32 3
	ldr	w0, [sp, #20]
	.loc	1 32 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #80]
	add	sp, sp, #96
	ret
Ltmp4:
Lfunc_end0:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"1.builtin_types.c PASS\n"

l___unnamed_2:
	.asciz	"1.builtin_types.c FAIL\n"

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
	.long	22
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end0-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	31
	.long	31
	.byte	1
	.byte	3
	.long	243

	.byte	3
	.byte	3
	.byte	145
	.asciz	"\317"
	.long	40
	.byte	1
	.byte	15
	.long	250
	.byte	3
	.byte	3
	.byte	145
	.asciz	"\316"
	.long	48
	.byte	1
	.byte	14
	.long	250
	.byte	3
	.byte	3
	.byte	145
	.asciz	"\300"
	.long	51
	.byte	1
	.byte	13
	.long	257
	.byte	3
	.byte	2
	.byte	145
	.byte	60
	.long	61
	.byte	1
	.byte	12
	.long	264
	.byte	3
	.byte	2
	.byte	145
	.byte	48
	.long	70
	.byte	1
	.byte	11
	.long	271
	.byte	3
	.byte	2
	.byte	145
	.byte	44
	.long	88
	.byte	1
	.byte	10
	.long	278
	.byte	3
	.byte	2
	.byte	145
	.byte	43
	.long	106
	.byte	1
	.byte	9
	.long	285
	.byte	3
	.byte	2
	.byte	145
	.byte	32
	.long	124
	.byte	1
	.byte	8
	.long	292
	.byte	3
	.byte	2
	.byte	145
	.byte	28
	.long	132
	.byte	1
	.byte	7
	.long	243
	.byte	3
	.byte	2
	.byte	145
	.byte	26
	.long	135
	.byte	1
	.byte	6
	.long	299
	.byte	3
	.byte	2
	.byte	145
	.byte	25
	.long	144
	.byte	1
	.byte	5
	.long	306
	.byte	3
	.byte	2
	.byte	145
	.byte	20
	.long	152
	.byte	1
	.byte	4
	.long	243
	.byte	0
	.byte	4
	.long	36
	.byte	5
	.byte	4
	.byte	4
	.long	43
	.byte	2
	.byte	1
	.byte	4
	.long	54
	.byte	4
	.byte	8
	.byte	4
	.long	64
	.byte	4
	.byte	4
	.byte	4
	.long	74
	.byte	7
	.byte	8
	.byte	4
	.long	93
	.byte	7
	.byte	4
	.byte	4
	.long	110
	.byte	8
	.byte	1
	.byte	4
	.long	127
	.byte	5
	.byte	8
	.byte	4
	.long	138
	.byte	5
	.byte	2
	.byte	4
	.long	147
	.byte	6
	.byte	1
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"1.builtin_types.c"
	.asciz	"../tests"
	.asciz	"main"
	.asciz	"int"
	.asciz	"bf"
	.asciz	"bool"
	.asciz	"bt"
	.asciz	"db"
	.asciz	"double"
	.asciz	"fl"
	.asciz	"float"
	.asciz	"uln"
	.asciz	"unsigned long"
	.asciz	"uint"
	.asciz	"unsigned int"
	.asciz	"uch"
	.asciz	"unsigned char"
	.asciz	"ln"
	.asciz	"long"
	.asciz	"in"
	.asciz	"sh"
	.asciz	"short"
	.asciz	"ch"
	.asciz	"char"
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
	.long	31
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
	.long	10
	.long	10
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
	.long	0
	.long	-1
	.long	1
	.long	3
	.long	4
	.long	-1
	.long	-1
	.long	5
	.long	8
	.long	2090120081
	.long	259121563
	.long	2090479413
	.long	-104093792
	.long	-1304652851
	.long	193495088
	.long	-113419488
	.long	-103762318
	.long	274395349
	.long	2090147939
.set Lset6, Ltypes1-Ltypes_begin
	.long	Lset6
.set Lset7, Ltypes3-Ltypes_begin
	.long	Lset7
.set Lset8, Ltypes7-Ltypes_begin
	.long	Lset8
.set Lset9, Ltypes6-Ltypes_begin
	.long	Lset9
.set Lset10, Ltypes5-Ltypes_begin
	.long	Lset10
.set Lset11, Ltypes0-Ltypes_begin
	.long	Lset11
.set Lset12, Ltypes2-Ltypes_begin
	.long	Lset12
.set Lset13, Ltypes4-Ltypes_begin
	.long	Lset13
.set Lset14, Ltypes8-Ltypes_begin
	.long	Lset14
.set Lset15, Ltypes9-Ltypes_begin
	.long	Lset15
Ltypes1:
	.long	43
	.long	1
	.long	250
	.short	36
	.byte	0
	.long	0
Ltypes3:
	.long	64
	.long	1
	.long	264
	.short	36
	.byte	0
	.long	0
Ltypes7:
	.long	127
	.long	1
	.long	292
	.short	36
	.byte	0
	.long	0
Ltypes6:
	.long	110
	.long	1
	.long	285
	.short	36
	.byte	0
	.long	0
Ltypes5:
	.long	93
	.long	1
	.long	278
	.short	36
	.byte	0
	.long	0
Ltypes0:
	.long	36
	.long	1
	.long	243
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	54
	.long	1
	.long	257
	.short	36
	.byte	0
	.long	0
Ltypes4:
	.long	74
	.long	1
	.long	271
	.short	36
	.byte	0
	.long	0
Ltypes8:
	.long	138
	.long	1
	.long	299
	.short	36
	.byte	0
	.long	0
Ltypes9:
	.long	147
	.long	1
	.long	306
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
