	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_sum
	.p2align	2
_sum:
Lfunc_begin0:
	.file	1 "../tests" "8.function.c"
	.loc	1 7 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp1:
	.loc	1 7 5 prologue_end
	str	w0, [sp, #8]
	str	w1, [sp, #12]
	.loc	1 7 25 is_stmt 0
	ldr	w8, [sp, #8]
	ldr	w9, [sp, #12]
	add	w0, w8, w9
	.loc	1 7 25 epilogue_begin
	add	sp, sp, #16
	ret
Ltmp2:
Lfunc_end0:
	.cfi_endproc

	.globl	_sum2
	.p2align	2
_sum2:
Lfunc_begin1:
	.loc	1 5 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp3:
	.loc	1 5 5 prologue_end
	str	x0, [sp]
	str	x1, [sp, #8]
	.loc	1 5 28 is_stmt 0
	ldr	x8, [sp]
	ldr	w0, [x8]
	ldr	x8, [sp, #8]
	ldr	w1, [x8]
	bl	_sum
	.loc	1 5 28 epilogue_begin
	ldp	x29, x30, [sp, #16]
	add	sp, sp, #32
	ret
Ltmp4:
Lfunc_end1:
	.cfi_endproc

	.globl	_sum3
	.p2align	2
_sum3:
Lfunc_begin2:
	.loc	1 6 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp6:
	.loc	1 6 6 prologue_end
	str	w0, [sp]
	str	w1, [sp, #4]
	str	x2, [sp, #8]
	.loc	1 6 40 is_stmt 0
	ldr	x9, [sp, #8]
	ldr	w8, [sp]
	ldr	w10, [sp, #4]
	add	w8, w8, w10
	str	w8, [x9]
	.loc	1 6 40 epilogue_begin
	add	sp, sp, #16
	ret
Ltmp7:
Lfunc_end2:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin3:
	.loc	1 9 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp8:
	.loc	1 10 3 prologue_end
	str	wzr, [sp]
	mov	w8, #3
	.loc	1 12 3
	str	w8, [sp, #8]
	.loc	1 13 3
	mov	w8, #4
	str	w8, [sp, #12]
	.loc	1 15 3
	mov	w0, #1
	mov	w1, #2
	bl	_sum
	subs	w8, w0, #3
	b.eq	LBB3_2
	b	LBB3_1
LBB3_1:
	.loc	1 15 23 is_stmt 0
	mov	w8, #1
	str	w8, [sp]
	b	LBB3_3
LBB3_2:
	b	LBB3_3
LBB3_3:
	.loc	1 16 3 is_stmt 1
	mov	w0, #3
	mov	w1, #4
	bl	_sum
	subs	w8, w0, #7
	b.eq	LBB3_5
	b	LBB3_4
LBB3_4:
	.loc	1 16 23 is_stmt 0
	mov	w8, #1
	str	w8, [sp]
	b	LBB3_6
LBB3_5:
	b	LBB3_6
LBB3_6:
	.loc	1 17 3 is_stmt 1
	ldr	w0, [sp, #8]
	ldr	w1, [sp, #12]
	bl	_sum
	subs	w8, w0, #7
	b.eq	LBB3_8
	b	LBB3_7
LBB3_7:
	.loc	1 17 23 is_stmt 0
	mov	w8, #1
	str	w8, [sp]
	b	LBB3_9
LBB3_8:
	b	LBB3_9
LBB3_9:
	.loc	1 18 3 is_stmt 1
	add	x0, sp, #8
	add	x1, sp, #12
	bl	_sum2
	subs	w8, w0, #7
	b.eq	LBB3_11
	b	LBB3_10
LBB3_10:
	.loc	1 18 26 is_stmt 0
	mov	w8, #1
	str	w8, [sp]
	b	LBB3_12
LBB3_11:
	b	LBB3_12
LBB3_12:
	.loc	1 20 3 is_stmt 1
	mov	w0, #3
	mov	w1, #4
	add	x2, sp, #4
	bl	_sum3
	.loc	1 21 3
	ldr	w8, [sp, #4]
	subs	w8, w8, #7
	b.eq	LBB3_14
	b	LBB3_13
LBB3_13:
	.loc	1 21 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp]
	b	LBB3_15
LBB3_14:
	b	LBB3_15
LBB3_15:
	.loc	1 22 3 is_stmt 1
	ldr	w0, [sp, #8]
	ldr	w1, [sp, #12]
	add	x2, sp, #4
	bl	_sum3
	.loc	1 23 3
	ldr	w8, [sp, #4]
	subs	w8, w8, #7
	b.eq	LBB3_17
	b	LBB3_16
LBB3_16:
	.loc	1 23 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp]
	b	LBB3_18
LBB3_17:
	b	LBB3_18
LBB3_18:
	.loc	1 25 3 is_stmt 1
	mov	w0, #16960
	movk	w0, #15, lsl #16
	mov	w1, #33920
	movk	w1, #30, lsl #16
	bl	_sum
	mov	w8, #50880
	movk	w8, #45, lsl #16
	subs	w8, w0, w8
	b.eq	LBB3_20
	b	LBB3_19
LBB3_19:
	.loc	1 25 41 is_stmt 0
	mov	w8, #1
	str	w8, [sp]
	b	LBB3_21
LBB3_20:
	b	LBB3_21
LBB3_21:
	.loc	1 27 3 is_stmt 1
	ldr	w8, [sp]
	cbnz	w8, LBB3_23
	b	LBB3_22
LBB3_22:
Ltmp9:
	.loc	1 28 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB3_24
Ltmp10:
LBB3_23:
	.loc	1 30 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB3_24
Ltmp11:
LBB3_24:
	.loc	1 32 3
	ldr	w0, [sp]
	.loc	1 32 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #16]
	add	sp, sp, #32
	ret
Ltmp12:
Lfunc_end3:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"8.function.c PASS\n"

l___unnamed_2:
	.asciz	"8.function.c FAIL\n"

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
	.long	17
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end3-Lfunc_begin0
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
	.byte	7
	.long	316

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	56
	.byte	1
	.byte	7
	.long	316
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	54
	.byte	1
	.byte	7
	.long	316
	.byte	0
	.byte	2
	.quad	Lfunc_begin1
.set Lset5, Lfunc_end1-Lfunc_begin1
	.long	Lset5

	.byte	1
	.byte	111
	.long	30
	.long	30
	.byte	1
	.byte	5
	.long	316

	.byte	3
	.byte	2
	.byte	145
	.byte	0
	.long	56
	.byte	1
	.byte	5
	.long	330
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	54
	.byte	1
	.byte	5
	.long	330
	.byte	0
	.byte	2
	.quad	Lfunc_begin2
.set Lset6, Lfunc_end2-Lfunc_begin2
	.long	Lset6

	.byte	1
	.byte	111
	.long	35
	.long	35
	.byte	1
	.byte	6
	.long	323

	.byte	3
	.byte	2
	.byte	145
	.byte	0
	.long	56
	.byte	1
	.byte	6
	.long	316
	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	54
	.byte	1
	.byte	6
	.long	316
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	58
	.byte	1
	.byte	6
	.long	330
	.byte	0
	.byte	2
	.quad	Lfunc_begin3
.set Lset7, Lfunc_end3-Lfunc_begin3
	.long	Lset7

	.byte	1
	.byte	111
	.long	40
	.long	40
	.byte	1
	.byte	9
	.long	316

	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	54
	.byte	1
	.byte	13
	.long	316
	.byte	4
	.byte	2
	.byte	145
	.byte	8
	.long	56
	.byte	1
	.byte	12
	.long	316
	.byte	4
	.byte	2
	.byte	145
	.byte	4
	.long	65
	.byte	1
	.byte	11
	.long	316
	.byte	4
	.byte	2
	.byte	145
	.byte	0
	.long	67
	.byte	1
	.byte	10
	.long	316
	.byte	0
	.byte	5
	.long	45
	.byte	5
	.byte	4
	.byte	5
	.long	49
	.byte	1
	.byte	0
	.byte	6
	.long	316
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"8.function.c"
	.asciz	"../tests"
	.asciz	"sum"
	.asciz	"sum2"
	.asciz	"sum3"
	.asciz	"main"
	.asciz	"int"
	.asciz	"void"
	.asciz	"r"
	.asciz	"l"
	.asciz	"result"
	.asciz	"i"
	.asciz	"err"
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	4
	.long	4
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	0
	.long	1
	.long	2
	.long	-1
	.long	2090737420
	.long	2090737421
	.long	193506202
	.long	2090499946
.set Lset8, LNames1-Lnames_begin
	.long	Lset8
.set Lset9, LNames2-Lnames_begin
	.long	Lset9
.set Lset10, LNames0-Lnames_begin
	.long	Lset10
.set Lset11, LNames3-Lnames_begin
	.long	Lset11
LNames1:
	.long	30
	.long	1
	.long	100
	.long	0
LNames2:
	.long	35
	.long	1
	.long	158
	.long	0
LNames0:
	.long	26
	.long	1
	.long	42
	.long	0
LNames3:
	.long	40
	.long	1
	.long	230
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
	.long	2090838615
.set Lset12, Ltypes0-Ltypes_begin
	.long	Lset12
.set Lset13, Ltypes1-Ltypes_begin
	.long	Lset13
Ltypes0:
	.long	45
	.long	1
	.long	316
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	49
	.long	1
	.long	323
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
