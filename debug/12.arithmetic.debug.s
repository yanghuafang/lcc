	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "12.arithmetic.c"
	.loc	1 3 0
	.cfi_startproc
	sub	sp, sp, #96
	stp	x29, x30, [sp, #80]
	.cfi_def_cfa_offset 96
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w9, #37
	mov	w10, #8
	mov	w8, wzr
Ltmp0:
	.loc	1 4 3 prologue_end
	stp	wzr, w9, [sp]
	mov	w9, #45
	mov	w11, #29
	.loc	1 6 3
	stp	w10, w9, [sp, #8]
	mov	w10, #-29
	.loc	1 24 3
	subs	w8, w8, #45
	.loc	1 9 3
	stp	w11, w10, [sp, #16]
	mov	w11, #296
	mov	w10, #4
	.loc	1 11 3
	stp	w11, w10, [sp, #24]
	mov	w10, #5
	mov	w11, #53
	.loc	1 24 3
	and	w8, w8, #0x7
	.loc	1 13 3
	stp	w10, w11, [sp, #32]
	mov	w11, #360
	.loc	1 24 3
	csneg	w8, w10, w8, mi
	.loc	1 26 3
	cmp	w9, #45
	.loc	1 18 3
	stp	w9, w11, [sp, #40]
	.loc	1 22 3
	stp	w9, w8, [sp, #48]
	.loc	1 26 3
	b.eq	LBB0_2
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 26 18
	str	w8, [sp]
LBB0_2:
	.loc	1 27 3 is_stmt 1
	ldr	w8, [sp, #16]
	cmp	w8, #29
	b.eq	LBB0_4
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 27 18
	str	w8, [sp]
LBB0_4:
	.loc	1 28 3 is_stmt 1
	ldr	w8, [sp, #20]
	cmn	w8, #29
	b.eq	LBB0_6
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 28 20
	str	w8, [sp]
LBB0_6:
	.loc	1 29 3 is_stmt 1
	ldr	w8, [sp, #24]
	cmp	w8, #296
	b.eq	LBB0_8
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 29 19
	str	w8, [sp]
LBB0_8:
	.loc	1 30 3 is_stmt 1
	ldr	w8, [sp, #28]
	cmp	w8, #4
	b.eq	LBB0_10
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 30 17
	str	w8, [sp]
LBB0_10:
	.loc	1 31 3 is_stmt 1
	ldr	w8, [sp, #32]
	cmp	w8, #5
	b.eq	LBB0_12
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 31 17
	str	w8, [sp]
LBB0_12:
	.loc	1 32 3 is_stmt 1
	ldr	w8, [sp, #36]
	cmp	w8, #53
	b.eq	LBB0_14
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 32 20
	str	w8, [sp]
LBB0_14:
	.loc	1 33 3 is_stmt 1
	ldr	w8, [sp, #40]
	cmp	w8, #45
	b.eq	LBB0_16
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 33 20
	str	w8, [sp]
LBB0_16:
	.loc	1 34 3 is_stmt 1
	ldr	w8, [sp, #44]
	cmp	w8, #360
	b.eq	LBB0_18
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 34 21
	str	w8, [sp]
LBB0_18:
	.loc	1 35 3 is_stmt 1
	ldr	w8, [sp, #48]
	cmp	w8, #45
	b.eq	LBB0_20
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 35 20
	str	w8, [sp]
LBB0_20:
	.loc	1 36 3 is_stmt 1
	ldr	w8, [sp, #52]
	cmp	w8, #5
	b.eq	LBB0_22
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 36 19
	str	w8, [sp]
LBB0_22:
	.loc	1 0 19
	mov	w9, #3
	mov	w8, #10
	.loc	1 40 3 is_stmt 1
	cmp	w9, #3
	.loc	1 38 3
	stp	w8, w9, [sp, #56]
	.loc	1 40 3
	b.eq	LBB0_24
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 40 21
	str	w8, [sp]
LBB0_24:
	.loc	1 41 3 is_stmt 1
	ldp	w8, w9, [sp, #56]
	udiv	w10, w8, w9
	msub	w8, w10, w9, w8
	cmp	w8, #1
	b.eq	LBB0_26
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 41 21
	str	w8, [sp]
LBB0_26:
	.loc	1 0 21
	mov	w9, #-2
	mov	w10, #-8
	mov	w8, #3
	.loc	1 45 3 is_stmt 1
	cmn	w9, #2
	.loc	1 43 3
	stp	w10, w8, [sp, #64]
	.loc	1 45 3
	b.eq	LBB0_28
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 45 26
	str	w8, [sp]
LBB0_28:
	.loc	1 0 26
	mov	w9, #-1
	mov	w8, #1
	.loc	1 49 3 is_stmt 1
	cmn	w9, #1
	.loc	1 47 3
	stp	w9, w8, [sp, #72]
	.loc	1 49 3
	b.eq	LBB0_30
	.loc	1 49 31 is_stmt 0
	str	w8, [sp]
LBB0_30:
	.loc	1 51 3 is_stmt 1
	ldr	w8, [sp]
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
	.loc	1 56 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #80]
	ldr	w0, [sp]
	add	sp, sp, #96
	ret
Ltmp1:
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
Lfunc_end0:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_2:
	.asciz	"12.arithmetic.c PASS\n"

l___unnamed_1:
	.asciz	"12.arithmetic.c FAIL\n"

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
	.long	20
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end0-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	29
	.long	29
	.byte	1
	.byte	3
	.long	356

	.byte	3
	.byte	3
	.byte	145
	.asciz	"\314"
	.long	38
	.byte	1
	.byte	48
	.long	363
	.byte	3
	.byte	3
	.byte	145
	.asciz	"\310"
	.long	59
	.byte	1
	.byte	47
	.long	356
	.byte	3
	.byte	3
	.byte	145
	.asciz	"\304"
	.long	67
	.byte	1
	.byte	44
	.long	356
	.byte	3
	.byte	3
	.byte	145
	.asciz	"\300"
	.long	72
	.byte	1
	.byte	43
	.long	356
	.byte	3
	.byte	2
	.byte	145
	.byte	60
	.long	77
	.byte	1
	.byte	39
	.long	363
	.byte	3
	.byte	2
	.byte	145
	.byte	56
	.long	80
	.byte	1
	.byte	38
	.long	363
	.byte	3
	.byte	2
	.byte	145
	.byte	52
	.long	83
	.byte	1
	.byte	23
	.long	356
	.byte	3
	.byte	2
	.byte	145
	.byte	48
	.long	89
	.byte	1
	.byte	21
	.long	356
	.byte	3
	.byte	2
	.byte	145
	.byte	44
	.long	95
	.byte	1
	.byte	19
	.long	356
	.byte	3
	.byte	2
	.byte	145
	.byte	40
	.long	101
	.byte	1
	.byte	17
	.long	356
	.byte	3
	.byte	2
	.byte	145
	.byte	36
	.long	107
	.byte	1
	.byte	15
	.long	356
	.byte	3
	.byte	2
	.byte	145
	.byte	32
	.long	113
	.byte	1
	.byte	13
	.long	356
	.byte	3
	.byte	2
	.byte	145
	.byte	28
	.long	117
	.byte	1
	.byte	12
	.long	356
	.byte	3
	.byte	2
	.byte	145
	.byte	24
	.long	121
	.byte	1
	.byte	11
	.long	356
	.byte	3
	.byte	2
	.byte	145
	.byte	20
	.long	125
	.byte	1
	.byte	10
	.long	356
	.byte	3
	.byte	2
	.byte	145
	.byte	16
	.long	130
	.byte	1
	.byte	9
	.long	356
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	134
	.byte	1
	.byte	8
	.long	356
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	138
	.byte	1
	.byte	6
	.long	356
	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	140
	.byte	1
	.byte	5
	.long	356
	.byte	3
	.byte	2
	.byte	145
	.byte	0
	.long	142
	.byte	1
	.byte	4
	.long	356
	.byte	0
	.byte	4
	.long	34
	.byte	5
	.byte	4
	.byte	4
	.long	46
	.byte	7
	.byte	4
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"12.arithmetic.c"
	.asciz	"../tests"
	.asciz	"main"
	.asciz	"int"
	.asciz	"mixedUi"
	.asciz	"unsigned int"
	.asciz	"mixedSi"
	.asciz	"negB"
	.asciz	"negA"
	.asciz	"ub"
	.asciz	"ua"
	.asciz	"modeq"
	.asciz	"diveq"
	.asciz	"muleq"
	.asciz	"subeq"
	.asciz	"sumeq"
	.asciz	"mod"
	.asciz	"div"
	.asciz	"mul"
	.asciz	"sub2"
	.asciz	"sub"
	.asciz	"sum"
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
	.long	29
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
	.long	34
	.long	1
	.long	356
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	46
	.long	1
	.long	363
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
