	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "13.double_inc_sub.c"
	.loc	1 6 0
	.cfi_startproc
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp0:
	.loc	1 7 3 prologue_end
	str	wzr, [sp, #8]
	.loc	1 8 3
	mov	w8, #13
	str	w8, [sp, #12]
	.loc	1 10 3
	ldr	w8, [sp, #12]
	add	w9, w8, #1
	str	w9, [sp, #12]
	str	w8, [sp, #16]
	.loc	1 11 3
	ldr	w8, [sp, #12]
	subs	w8, w8, #14
	b.eq	LBB0_2
	b	LBB0_1
LBB0_1:
	.loc	1 11 16 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_3
LBB0_2:
	b	LBB0_3
LBB0_3:
	.loc	1 12 3 is_stmt 1
	ldr	w8, [sp, #16]
	subs	w8, w8, #13
	b.eq	LBB0_5
	b	LBB0_4
LBB0_4:
	.loc	1 12 16 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_6
LBB0_5:
	b	LBB0_6
LBB0_6:
	.loc	1 14 3 is_stmt 1
	mov	w8, #13
	str	w8, [sp, #12]
	.loc	1 15 3
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	ldr	w8, [sp, #12]
	str	w8, [sp, #20]
	.loc	1 16 3
	ldr	w8, [sp, #12]
	subs	w8, w8, #14
	b.eq	LBB0_8
	b	LBB0_7
LBB0_7:
	.loc	1 16 16 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_9
LBB0_8:
	b	LBB0_9
LBB0_9:
	.loc	1 17 3 is_stmt 1
	ldr	w8, [sp, #20]
	subs	w8, w8, #14
	b.eq	LBB0_11
	b	LBB0_10
LBB0_10:
	.loc	1 17 16 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_12
LBB0_11:
	b	LBB0_12
LBB0_12:
	.loc	1 19 3 is_stmt 1
	mov	w8, #13
	str	w8, [sp, #12]
	.loc	1 20 3
	ldr	w8, [sp, #12]
	subs	w9, w8, #1
	str	w9, [sp, #12]
	str	w8, [sp, #24]
	.loc	1 21 3
	ldr	w8, [sp, #12]
	subs	w8, w8, #12
	b.eq	LBB0_14
	b	LBB0_13
LBB0_13:
	.loc	1 21 16 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_15
LBB0_14:
	b	LBB0_15
LBB0_15:
	.loc	1 22 3 is_stmt 1
	ldr	w8, [sp, #24]
	subs	w8, w8, #13
	b.eq	LBB0_17
	b	LBB0_16
LBB0_16:
	.loc	1 22 16 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_18
LBB0_17:
	b	LBB0_18
LBB0_18:
	.loc	1 24 3 is_stmt 1
	mov	w8, #13
	str	w8, [sp, #12]
	.loc	1 25 3
	ldr	w8, [sp, #12]
	subs	w8, w8, #1
	str	w8, [sp, #12]
	ldr	w8, [sp, #12]
	str	w8, [sp, #28]
	.loc	1 26 3
	ldr	w8, [sp, #12]
	subs	w8, w8, #12
	b.eq	LBB0_20
	b	LBB0_19
LBB0_19:
	.loc	1 26 16 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_21
LBB0_20:
	b	LBB0_21
LBB0_21:
	.loc	1 27 3 is_stmt 1
	ldr	w8, [sp, #28]
	subs	w8, w8, #12
	b.eq	LBB0_23
	b	LBB0_22
LBB0_22:
	.loc	1 27 16 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_24
LBB0_23:
	b	LBB0_24
LBB0_24:
	.loc	1 29 3 is_stmt 1
	str	wzr, [sp, #12]
	.loc	1 30 3
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	.loc	1 31 3
	ldr	w8, [sp, #12]
	subs	w8, w8, #1
	b.eq	LBB0_26
	b	LBB0_25
LBB0_25:
	.loc	1 31 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_27
LBB0_26:
	b	LBB0_27
LBB0_27:
	.loc	1 32 3 is_stmt 1
	ldr	w8, [sp, #12]
	subs	w8, w8, #1
	str	w8, [sp, #12]
	.loc	1 33 3
	ldr	w8, [sp, #12]
	cbz	w8, LBB0_29
	b	LBB0_28
LBB0_28:
	.loc	1 33 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_30
LBB0_29:
	b	LBB0_30
LBB0_30:
	.loc	1 35 3 is_stmt 1
	ldr	w8, [sp, #8]
	cbnz	w8, LBB0_32
	b	LBB0_31
LBB0_31:
Ltmp1:
	.loc	1 36 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB0_33
Ltmp2:
LBB0_32:
	.loc	1 38 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB0_33
Ltmp3:
LBB0_33:
	.loc	1 40 3
	ldr	w0, [sp, #8]
	.loc	1 40 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #32]
	add	sp, sp, #48
	ret
Ltmp4:
Lfunc_end0:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"13.double_inc_sub.c PASS\n"

l___unnamed_2:
	.asciz	"13.double_inc_sub.c FAIL\n"

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
	.long	24
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end0-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	33
	.long	33
	.byte	1
	.byte	6
	.long	156

	.byte	3
	.byte	2
	.byte	145
	.byte	28
	.long	42
	.byte	1
	.byte	25
	.long	156
	.byte	3
	.byte	2
	.byte	145
	.byte	24
	.long	44
	.byte	1
	.byte	20
	.long	156
	.byte	3
	.byte	2
	.byte	145
	.byte	20
	.long	46
	.byte	1
	.byte	15
	.long	156
	.byte	3
	.byte	2
	.byte	145
	.byte	16
	.long	48
	.byte	1
	.byte	10
	.long	156
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	50
	.byte	1
	.byte	8
	.long	156
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	52
	.byte	1
	.byte	7
	.long	156
	.byte	0
	.byte	4
	.long	38
	.byte	5
	.byte	4
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"13.double_inc_sub.c"
	.asciz	"../tests"
	.asciz	"main"
	.asciz	"int"
	.asciz	"e"
	.asciz	"d"
	.asciz	"c"
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
	.long	33
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
	.long	1
	.long	1
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
	.long	193495088
.set Lset6, Ltypes0-Ltypes_begin
	.long	Lset6
Ltypes0:
	.long	38
	.long	1
	.long	156
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
