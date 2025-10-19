	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_helper
	.p2align	2
_helper:
Lfunc_begin0:
	.file	1 "../tests" "35.typedef_builtin.c"
	.loc	1 10 0
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
Ltmp1:
	.loc	1 10 6 prologue_end
	str	x0, [sp, #8]
	str	w1, [sp, #20]
	str	x2, [sp, #24]
	.loc	1 11 3
	ldr	x9, [sp, #24]
	ldr	x8, [sp, #8]
	ldr	w10, [sp, #20]
	add	x8, x8, x10
	str	w8, [x9]
	.loc	1 11 3 epilogue_begin is_stmt 0
	add	sp, sp, #32
	ret
Ltmp2:
Lfunc_end0:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin1:
	.loc	1 14 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp3:
	.loc	1 15 3 prologue_end
	str	wzr, [sp, #4]
	mov	w8, #7
	.loc	1 16 3
	str	w8, [sp, #8]
	add	x8, sp, #12
	.loc	1 17 3
	mov	w9, #10
	str	w9, [sp, #12]
	.loc	1 18 3
	str	x8, [sp, #16]
	.loc	1 20 3
	ldr	w1, [sp, #8]
	ldr	x2, [sp, #16]
	mov	w8, #42
	mov	w0, w8
	bl	_helper
	.loc	1 22 3
	ldr	w8, [sp, #8]
	subs	w8, w8, #7
	b.eq	LBB1_2
	b	LBB1_1
LBB1_1:
	.loc	1 22 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB1_3
LBB1_2:
	b	LBB1_3
LBB1_3:
	.loc	1 23 3 is_stmt 1
	ldr	w8, [sp, #12]
	subs	w8, w8, #49
	b.eq	LBB1_5
	b	LBB1_4
LBB1_4:
	.loc	1 23 16 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB1_6
LBB1_5:
	b	LBB1_6
LBB1_6:
	.loc	1 24 3 is_stmt 1
	ldr	x8, [sp, #16]
	ldr	w8, [x8]
	str	w8, [sp, #28]
	.loc	1 25 3
	ldr	w8, [sp, #28]
	subs	w8, w8, #49
	b.eq	LBB1_8
	b	LBB1_7
LBB1_7:
	.loc	1 25 21 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB1_9
LBB1_8:
	b	LBB1_9
LBB1_9:
	.loc	1 27 3 is_stmt 1
	ldr	w8, [sp, #4]
	cbnz	w8, LBB1_11
	b	LBB1_10
LBB1_10:
Ltmp4:
	.loc	1 28 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB1_12
Ltmp5:
LBB1_11:
	.loc	1 30 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB1_12
Ltmp6:
LBB1_12:
	.loc	1 32 3
	ldr	w0, [sp, #4]
	.loc	1 32 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #32]
	add	sp, sp, #48
	ret
Ltmp7:
Lfunc_end1:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"35.typedef_builtin.c PASS\n"

l___unnamed_2:
	.asciz	"35.typedef_builtin.c FAIL\n"

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
	.long	25
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end1-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	34
	.long	34
	.byte	1
	.byte	10
	.long	214

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	62
	.byte	1
	.byte	10
	.long	233
	.byte	3
	.byte	2
	.byte	145
	.byte	20
	.long	57
	.byte	1
	.byte	10
	.long	221
	.byte	3
	.byte	2
	.byte	145
	.byte	24
	.long	55
	.byte	1
	.byte	10
	.long	228
	.byte	0
	.byte	2
	.quad	Lfunc_begin1
.set Lset5, Lfunc_end1-Lfunc_begin1
	.long	Lset5

	.byte	1
	.byte	111
	.long	41
	.long	41
	.byte	1
	.byte	14
	.long	221

	.byte	4
	.byte	2
	.byte	145
	.byte	28
	.long	74
	.byte	1
	.byte	24
	.long	221
	.byte	4
	.byte	2
	.byte	145
	.byte	16
	.long	55
	.byte	1
	.byte	18
	.long	228
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	81
	.byte	1
	.byte	17
	.long	221
	.byte	4
	.byte	2
	.byte	145
	.byte	8
	.long	83
	.byte	1
	.byte	16
	.long	221
	.byte	4
	.byte	2
	.byte	145
	.byte	4
	.long	85
	.byte	1
	.byte	15
	.long	221
	.byte	0
	.byte	5
	.long	46
	.byte	1
	.byte	0
	.byte	5
	.long	51
	.byte	5
	.byte	4
	.byte	6
	.long	214
	.byte	5
	.long	69
	.byte	5
	.byte	8
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"35.typedef_builtin.c"
	.asciz	"../tests"
	.asciz	"helper"
	.asciz	"main"
	.asciz	"void"
	.asciz	"int"
	.asciz	"p"
	.asciz	"step"
	.asciz	"nbytes"
	.asciz	"long"
	.asciz	"result"
	.asciz	"x"
	.asciz	"c"
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
	.long	30954469
.set Lset6, LNames1-Lnames_begin
	.long	Lset6
.set Lset7, LNames0-Lnames_begin
	.long	Lset7
LNames1:
	.long	41
	.long	1
	.long	114
	.long	0
LNames0:
	.long	34
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
	.long	0
	.long	-1
	.long	2
	.long	2090479413
	.long	2090838615
	.long	193495088
.set Lset8, Ltypes2-Ltypes_begin
	.long	Lset8
.set Lset9, Ltypes0-Ltypes_begin
	.long	Lset9
.set Lset10, Ltypes1-Ltypes_begin
	.long	Lset10
Ltypes2:
	.long	69
	.long	1
	.long	233
	.short	36
	.byte	0
	.long	0
Ltypes0:
	.long	46
	.long	1
	.long	214
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	51
	.long	1
	.long	221
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
