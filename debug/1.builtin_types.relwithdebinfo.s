	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "1.builtin_types.c"
	.loc	1 3 0
	.cfi_startproc
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]
	.cfi_def_cfa_offset 80
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w12, #4058
	mov	w8, #64512
	mov	w13, #65
	movk	w12, #16457, lsl #16
Ltmp0:
	.loc	1 6 3 prologue_end
	strh	w8, [sp, #10]
	mov	w8, #250
	.loc	1 12 3
	str	w12, [sp, #44]
	mov	x12, #11537
	mov	w11, #40626
	movk	x12, #21572, lsl #16
	.loc	1 9 3
	strb	w8, [sp, #27]
	mov	x8, #30154
	movk	x12, #8699, lsl #32
	mov	x10, #-722
	mov	w9, #57072
	movk	x8, #19624, lsl #16
	movk	x12, #16393, lsl #48
	movk	w11, #65347, lsl #16
	movk	x10, #46697, lsl #16
	movk	w9, #2748, lsl #16
	movk	x8, #2, lsl #32
	.loc	1 13 3
	str	x12, [sp, #48]
	mov	w12, #1
	.loc	1 17 3
	cmp	w13, #65
	.loc	1 4 3
	str	wzr, [sp, #4]
	.loc	1 5 3
	strb	w13, [sp, #9]
	.loc	1 7 3
	str	w11, [sp, #12]
	.loc	1 8 3
	str	x10, [sp, #16]
	.loc	1 10 3
	str	w9, [sp, #28]
	.loc	1 11 3
	str	x8, [sp, #32]
	.loc	1 14 3
	strb	w12, [sp, #62]
	.loc	1 15 3
	strb	wzr, [sp, #63]
	.loc	1 17 3
	b.eq	LBB0_2
	.loc	1 17 18 is_stmt 0
	str	w12, [sp, #4]
LBB0_2:
	.loc	1 18 3 is_stmt 1
	ldrsh	w12, [sp, #10]
	cmn	w12, #1024
	b.eq	LBB0_4
	.loc	1 0 3 is_stmt 0
	mov	w12, #1
	.loc	1 18 20
	str	w12, [sp, #4]
LBB0_4:
	.loc	1 19 3 is_stmt 1
	ldr	w12, [sp, #12]
	cmp	w12, w11
	b.eq	LBB0_6
	.loc	1 0 3 is_stmt 0
	mov	w11, #1
	.loc	1 19 24
	str	w11, [sp, #4]
LBB0_6:
	.loc	1 20 3 is_stmt 1
	ldr	x11, [sp, #16]
	cmp	x11, x10
	b.eq	LBB0_8
	.loc	1 0 3 is_stmt 0
	mov	w10, #1
	.loc	1 20 27
	str	w10, [sp, #4]
LBB0_8:
	.loc	1 21 3 is_stmt 1
	ldrb	w10, [sp, #27]
	cmp	w10, #250
	b.eq	LBB0_10
	.loc	1 0 3 is_stmt 0
	mov	w10, #1
	.loc	1 21 19
	str	w10, [sp, #4]
LBB0_10:
	.loc	1 22 3 is_stmt 1
	ldr	w10, [sp, #28]
	cmp	w10, w9
	b.eq	LBB0_12
	.loc	1 0 3 is_stmt 0
	mov	w9, #1
	.loc	1 22 26
	str	w9, [sp, #4]
LBB0_12:
	.loc	1 23 3 is_stmt 1
	ldr	x9, [sp, #32]
	cmp	x9, x8
	b.eq	LBB0_14
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 23 28
	str	w8, [sp, #4]
LBB0_14:
	.loc	1 24 3 is_stmt 1
	ldrb	w8, [sp, #62]
	cmp	w8, #1
	b.eq	LBB0_16
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 24 16
	str	w8, [sp, #4]
LBB0_16:
	.loc	1 25 3 is_stmt 1
	ldrb	w8, [sp, #63]
	cbz	w8, LBB0_18
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 25 16
	str	w8, [sp, #4]
LBB0_18:
	.loc	1 27 3 is_stmt 1
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
	.loc	1 32 3 epilogue_begin is_stmt 1
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
	.asciz	"1.builtin_types.c PASS\n"

l___unnamed_1:
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
	.long	240

	.byte	3
	.byte	2
	.byte	145
	.byte	63
	.long	40
	.byte	1
	.byte	15
	.long	247
	.byte	3
	.byte	2
	.byte	145
	.byte	62
	.long	48
	.byte	1
	.byte	14
	.long	247
	.byte	3
	.byte	2
	.byte	145
	.byte	48
	.long	51
	.byte	1
	.byte	13
	.long	254
	.byte	3
	.byte	2
	.byte	145
	.byte	44
	.long	61
	.byte	1
	.byte	12
	.long	261
	.byte	3
	.byte	2
	.byte	145
	.byte	32
	.long	70
	.byte	1
	.byte	11
	.long	268
	.byte	3
	.byte	2
	.byte	145
	.byte	28
	.long	88
	.byte	1
	.byte	10
	.long	275
	.byte	3
	.byte	2
	.byte	145
	.byte	27
	.long	106
	.byte	1
	.byte	9
	.long	282
	.byte	3
	.byte	2
	.byte	145
	.byte	16
	.long	124
	.byte	1
	.byte	8
	.long	289
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	132
	.byte	1
	.byte	7
	.long	240
	.byte	3
	.byte	2
	.byte	145
	.byte	10
	.long	135
	.byte	1
	.byte	6
	.long	296
	.byte	3
	.byte	2
	.byte	145
	.byte	9
	.long	144
	.byte	1
	.byte	5
	.long	303
	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	152
	.byte	1
	.byte	4
	.long	240
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
	.long	247
	.short	36
	.byte	0
	.long	0
Ltypes3:
	.long	64
	.long	1
	.long	261
	.short	36
	.byte	0
	.long	0
Ltypes7:
	.long	127
	.long	1
	.long	289
	.short	36
	.byte	0
	.long	0
Ltypes6:
	.long	110
	.long	1
	.long	282
	.short	36
	.byte	0
	.long	0
Ltypes5:
	.long	93
	.long	1
	.long	275
	.short	36
	.byte	0
	.long	0
Ltypes0:
	.long	36
	.long	1
	.long	240
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	54
	.long	1
	.long	254
	.short	36
	.byte	0
	.long	0
Ltypes4:
	.long	74
	.long	1
	.long	268
	.short	36
	.byte	0
	.long	0
Ltypes8:
	.long	138
	.long	1
	.long	296
	.short	36
	.byte	0
	.long	0
Ltypes9:
	.long	147
	.long	1
	.long	303
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
