	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_subFunc
	.p2align	2
_subFunc:
Lfunc_begin0:
	.file	1 "../tests" "26.operator_precedence.c"
	.loc	1 3 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp1:
	.loc	1 3 6 prologue_end
	str	w0, [sp, #12]
	.loc	1 3 6 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp2:
Lfunc_end0:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin1:
	.loc	1 5 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #112
	stp	x29, x30, [sp, #96]
	.cfi_def_cfa_offset 112
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x9, #22136
	mov	x8, #57072
	add	x10, sp, #32
	movk	x9, #4660, lsl #16
	movk	x8, #39612, lsl #16
	add	x11, sp, #16
	orr	x9, x9, x9, lsl #32
	orr	x8, x8, x8, lsl #32
Ltmp3:
	.loc	1 6 3 prologue_end
	str	wzr, [sp, #12]
	.loc	1 11 3
	and	x10, x10, x9
	.loc	1 12 3
	cmp	x9, x9
	.loc	1 8 3
	stp	x9, x8, [sp, #16]
	.loc	1 11 3
	and	x10, x10, #0xfffffff7fffffff7
	.loc	1 10 3
	stp	x11, x10, [sp, #32]
	.loc	1 12 3
	b.eq	LBB1_2
	.loc	1 0 3 is_stmt 0
	mov	w9, #1
	.loc	1 12 32
	str	w9, [sp, #12]
LBB1_2:
	.loc	1 13 3 is_stmt 1
	ldr	x9, [sp, #24]
	cmp	x9, x8
	b.eq	LBB1_4
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 13 32
	str	w8, [sp, #12]
LBB1_4:
	.loc	1 0 32
	mov	w8, #13
	.loc	1 16 3 is_stmt 1
	cmp	w8, #13
	.loc	1 15 3
	str	w8, [sp, #48]
	.loc	1 16 3
	b.eq	LBB1_6
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 16 25
	str	w8, [sp, #12]
LBB1_6:
	.loc	1 17 3 is_stmt 1
	ldr	w8, [sp, #48]
	cmp	w8, #13
	b.eq	LBB1_8
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 17 26
	str	w8, [sp, #12]
LBB1_8:
	.loc	1 0 26
	mov	w8, #13
	.loc	1 22 3 is_stmt 1
	cmp	w8, #13
	.loc	1 21 3
	str	w8, [sp, #52]
	.loc	1 22 3
	b.eq	LBB1_10
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 22 26
	str	w8, [sp, #12]
LBB1_10:
	.loc	1 0 26
	mov	w8, #3
	mov	w9, #4
	mov	w10, #48
	.loc	1 25 3 is_stmt 1
	stp	w8, w9, [sp, #56]
	add	x8, sp, #60
	.loc	1 28 3
	cmp	w10, #48
	.loc	1 27 3
	str	x8, [sp, #64]
	.loc	1 28 3
	b.eq	LBB1_12
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 28 34
	str	w8, [sp, #12]
LBB1_12:
	.loc	1 0 34
	mov	w8, #1234
	.loc	1 31 3 is_stmt 1
	mov	w0, #1234
	.loc	1 30 3
	str	x8, [sp, #72]
	.loc	1 31 3
	bl	_subFunc
	.loc	1 32 3
	ldr	w8, [sp, #72]
	cmp	w8, #1234
	b.eq	LBB1_14
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 32 27
	str	w8, [sp, #12]
LBB1_14:
	.loc	1 0 27
	mov	w8, #12
	mov	w9, #11
	.loc	1 36 3 is_stmt 1
	cmp	w8, #12
	.loc	1 35 3
	stp	w8, w9, [sp, #80]
	.loc	1 36 3
	b.eq	LBB1_16
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 36 19
	str	w8, [sp, #12]
LBB1_16:
	.loc	1 37 3 is_stmt 1
	ldr	w8, [sp, #84]
	cmp	w8, #11
	b.eq	LBB1_18
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 37 19
	str	w8, [sp, #12]
LBB1_18:
	.loc	1 0 19
	mov	w8, #8
	mov	w9, #9
	.loc	1 41 3 is_stmt 1
	cmp	w8, #8
	.loc	1 40 3
	stp	w8, w9, [sp, #88]
	.loc	1 41 3
	b.eq	LBB1_20
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 41 18
	str	w8, [sp, #12]
LBB1_20:
	.loc	1 42 3 is_stmt 1
	ldr	w8, [sp, #92]
	cmp	w8, #9
	b.eq	LBB1_22
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 42 18
	str	w8, [sp, #12]
LBB1_22:
	.loc	1 44 3 is_stmt 1
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
	.loc	1 49 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #96]
	ldr	w0, [sp, #12]
	add	sp, sp, #112
	ret
Ltmp4:
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
Lfunc_end1:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_2:
	.asciz	"26.operator_precedence.c PASS\n"

l___unnamed_1:
	.asciz	"26.operator_precedence.c FAIL\n"

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
	.byte	5
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
	.byte	5
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
	.byte	6
	.byte	15
	.byte	0
	.byte	73
	.byte	19
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
.set Lset3, Lfunc_end1-Lfunc_begin0
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
	.byte	3
	.long	332

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	60
	.byte	1
	.byte	3
	.long	339
	.byte	0
	.byte	2
	.quad	Lfunc_begin1
.set Lset5, Lfunc_end1-Lfunc_begin1
	.long	Lset5

	.byte	1
	.byte	111
	.long	46
	.long	46
	.byte	1
	.byte	5
	.long	339

	.byte	4
	.byte	3
	.byte	145
	.asciz	"\334"
	.long	62
	.byte	1
	.byte	40
	.long	339
	.byte	4
	.byte	3
	.byte	145
	.asciz	"\330"
	.long	67
	.byte	1
	.byte	39
	.long	339
	.byte	4
	.byte	3
	.byte	145
	.asciz	"\324"
	.long	72
	.byte	1
	.byte	35
	.long	339
	.byte	4
	.byte	3
	.byte	145
	.asciz	"\320"
	.long	77
	.byte	1
	.byte	34
	.long	339
	.byte	4
	.byte	3
	.byte	145
	.asciz	"\310"
	.long	82
	.byte	1
	.byte	30
	.long	346
	.byte	4
	.byte	3
	.byte	145
	.asciz	"\300"
	.long	93
	.byte	1
	.byte	27
	.long	353
	.byte	4
	.byte	2
	.byte	145
	.byte	60
	.long	98
	.byte	1
	.byte	26
	.long	339
	.byte	4
	.byte	2
	.byte	145
	.byte	56
	.long	103
	.byte	1
	.byte	25
	.long	339
	.byte	4
	.byte	2
	.byte	145
	.byte	52
	.long	108
	.byte	1
	.byte	21
	.long	339
	.byte	4
	.byte	2
	.byte	145
	.byte	48
	.long	115
	.byte	1
	.byte	15
	.long	339
	.byte	4
	.byte	2
	.byte	145
	.byte	40
	.long	121
	.byte	1
	.byte	11
	.long	358
	.byte	4
	.byte	2
	.byte	145
	.byte	32
	.long	137
	.byte	1
	.byte	10
	.long	358
	.byte	4
	.byte	2
	.byte	145
	.byte	24
	.long	139
	.byte	1
	.byte	9
	.long	358
	.byte	4
	.byte	2
	.byte	145
	.byte	16
	.long	141
	.byte	1
	.byte	8
	.long	358
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	143
	.byte	1
	.byte	6
	.long	339
	.byte	0
	.byte	5
	.long	51
	.byte	1
	.byte	0
	.byte	5
	.long	56
	.byte	5
	.byte	4
	.byte	5
	.long	88
	.byte	5
	.byte	8
	.byte	6
	.long	339
	.byte	5
	.long	123
	.byte	7
	.byte	8
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"26.operator_precedence.c"
	.asciz	"../tests"
	.asciz	"subFunc"
	.asciz	"main"
	.asciz	"void"
	.asciz	"int"
	.asciz	"i"
	.asciz	"decB"
	.asciz	"decA"
	.asciz	"incB"
	.asciz	"incA"
	.asciz	"callI"
	.asciz	"long"
	.asciz	"mulC"
	.asciz	"mulB"
	.asciz	"mulA"
	.asciz	"minusA"
	.asciz	"plusA"
	.asciz	"d"
	.asciz	"unsigned long"
	.asciz	"c"
	.asciz	"b"
	.asciz	"a"
	.asciz	"err"
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	2
	.long	2
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	0
	.long	1
	.long	2090499946
	.long	-1339408933
.set Lset6, LNames1-Lnames_begin
	.long	Lset6
.set Lset7, LNames0-Lnames_begin
	.long	Lset7
LNames1:
	.long	46
	.long	1
	.long	86
	.long	0
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
	.long	4
	.long	4
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
	.long	2
	.long	3
	.long	193495088
	.long	2090479413
	.long	-103762318
	.long	2090838615
.set Lset8, Ltypes1-Ltypes_begin
	.long	Lset8
.set Lset9, Ltypes2-Ltypes_begin
	.long	Lset9
.set Lset10, Ltypes3-Ltypes_begin
	.long	Lset10
.set Lset11, Ltypes0-Ltypes_begin
	.long	Lset11
Ltypes1:
	.long	56
	.long	1
	.long	339
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	88
	.long	1
	.long	346
	.short	36
	.byte	0
	.long	0
Ltypes3:
	.long	123
	.long	1
	.long	358
	.short	36
	.byte	0
	.long	0
Ltypes0:
	.long	51
	.long	1
	.long	332
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
