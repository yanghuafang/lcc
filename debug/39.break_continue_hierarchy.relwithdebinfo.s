	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_for_break_continue
	.p2align	2
_for_break_continue:
Lfunc_begin0:
	.file	1 "../tests" "39.break_continue_hierarchy.c"
	.loc	1 3 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	mov	w8, wzr
Ltmp5:
	.loc	1 4 3 prologue_end
	str	wzr, [sp, #8]
	b	LBB0_2
LBB0_1:
Ltmp6:
	.loc	1 12 5
	ldr	w8, [sp, #12]
	add	w8, w8, #1
Ltmp7:
LBB0_2:
	.loc	1 5 8
	cmp	w8, #9
	.loc	1 0 0 is_stmt 0
	str	w8, [sp, #12]
	.loc	1 5 8
	b.gt	LBB0_6
Ltmp8:
	.loc	1 6 5 is_stmt 1
	ldr	w8, [sp, #12]
	cmp	w8, #3
	b.eq	LBB0_1
	.loc	1 9 5
	ldr	w8, [sp, #12]
	cmp	w8, #7
	b.eq	LBB0_6
	.loc	1 12 5
	ldp	w8, w9, [sp, #8]
	add	w8, w8, w9
	str	w8, [sp, #8]
	b	LBB0_1
Ltmp9:
LBB0_6:
	.loc	1 14 3
	ldr	w0, [sp, #8]
	.loc	1 14 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp10:
Lfunc_end0:
	.cfi_endproc

	.globl	_switch_break_fallthrough
	.p2align	2
_switch_break_fallthrough:
Lfunc_begin1:
	.loc	1 17 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	mov	w8, #1
Ltmp11:
	.loc	1 20 3 prologue_end
	cmp	w8, #2
	.loc	1 18 3
	stp	w8, wzr, [sp, #8]
	.loc	1 20 3
	b.eq	LBB1_3
	cbz	w8, LBB1_4
	.loc	1 22 7
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
LBB1_3:
	.loc	1 24 7
	ldr	w8, [sp, #12]
	add	w0, w8, #10
	b	LBB1_5
LBB1_4:
	.loc	1 0 7 is_stmt 0
	mov	w0, #99
LBB1_5:
	str	w0, [sp, #12]
	.loc	1 30 3 epilogue_begin is_stmt 1
	add	sp, sp, #16
	ret
Ltmp12:
Lfunc_end1:
	.cfi_endproc

	.globl	_switch_break_only
	.p2align	2
_switch_break_only:
Lfunc_begin2:
	.loc	1 33 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	mov	w8, #2
	mov	w9, #20
Ltmp13:
	.loc	1 47 3 prologue_end
	mov	w0, #20
	.loc	1 34 3
	stp	w8, w9, [sp, #8]
	.loc	1 47 3 epilogue_begin
	add	sp, sp, #16
	ret
Ltmp14:
Lfunc_end2:
	.cfi_endproc

	.globl	_for_switch_break_continue
	.p2align	2
_for_switch_break_continue:
Lfunc_begin3:
	.loc	1 50 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	mov	w8, wzr
Ltmp15:
	.loc	1 51 3 prologue_end
	str	wzr, [sp, #8]
	b	LBB3_4
LBB3_1:
Ltmp16:
	.loc	1 62 9
	ldp	w8, w9, [sp, #8]
	add	w8, w8, w9
LBB3_2:
	.loc	1 0 0 is_stmt 0
	str	w8, [sp, #8]
LBB3_3:
	.loc	1 63 9 is_stmt 1
	ldr	w8, [sp, #12]
	add	w8, w8, #1
Ltmp17:
LBB3_4:
	.loc	1 52 8
	cmp	w8, #5
	.loc	1 0 0 is_stmt 0
	str	w8, [sp, #12]
	.loc	1 52 8
	b.gt	LBB3_9
Ltmp18:
	.loc	1 53 5 is_stmt 1
	ldr	w8, [sp, #12]
	cmp	w8, #1
	b.eq	LBB3_3
	cmp	w8, #3
	b.eq	LBB3_3
	cmp	w8, #5
	b.ne	LBB3_1
	.loc	1 59 9
	ldr	w8, [sp, #8]
	add	w8, w8, #100
	.loc	1 60 9
	b	LBB3_2
Ltmp19:
LBB3_9:
	.loc	1 66 3
	ldr	w0, [sp, #8]
	.loc	1 66 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp20:
Lfunc_end3:
	.cfi_endproc

	.globl	_switch_for_break_continue
	.p2align	2
_switch_for_break_continue:
Lfunc_begin4:
	.loc	1 69 0 is_stmt 1
	.cfi_startproc
	mov	w8, #1
Ltmp21:
	stp	wzr, w8, [sp, #-16]!
	.cfi_def_cfa_offset 16
	.loc	1 72 3 prologue_end
	cmp	w8, #1
	b.ne	LBB4_7
	.loc	1 0 3 is_stmt 0
	mov	w8, wzr
Ltmp22:
	.loc	1 75 9 is_stmt 1
	str	wzr, [sp, #8]
	b	LBB4_3
LBB4_2:
Ltmp23:
	.loc	1 83 11
	ldr	w8, [sp, #12]
	add	w8, w8, #1
Ltmp24:
LBB4_3:
	.loc	1 76 14
	cmp	w8, #4
	.loc	1 0 0 is_stmt 0
	str	w8, [sp, #12]
	.loc	1 76 14
	b.gt	LBB4_8
Ltmp25:
	.loc	1 77 11 is_stmt 1
	ldr	w8, [sp, #12]
	cmp	w8, #2
	b.eq	LBB4_2
	.loc	1 80 11
	ldr	w8, [sp, #12]
	cmp	w8, #4
	b.eq	LBB4_8
	.loc	1 83 11
	ldp	w8, w9, [sp, #8]
	add	w8, w8, w9
	str	w8, [sp, #8]
	b	LBB4_2
Ltmp26:
LBB4_7:
	.loc	1 0 11 is_stmt 0
	mov	w0, #-1
	str	w0, [sp], #16
	.loc	1 92 3 is_stmt 1
	ret
LBB4_8:
Ltmp27:
	.loc	1 85 9
	ldr	w0, [sp, #8]
Ltmp28:
	.loc	1 0 0 epilogue_begin is_stmt 0
	str	w0, [sp], #16
	.loc	1 92 3 is_stmt 1
	ret
Ltmp29:
Lfunc_end4:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin5:
	.loc	1 95 0
	.cfi_startproc
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp30:
	.loc	1 96 3 prologue_end
	str	wzr, [sp, #12]
	.loc	1 98 3
	bl	_for_break_continue
	cmp	w0, #18
	b.eq	LBB5_2
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 98 35
	str	w8, [sp, #12]
LBB5_2:
	.loc	1 99 3 is_stmt 1
	bl	_switch_break_fallthrough
	cmp	w0, #11
	b.eq	LBB5_4
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 99 41
	str	w8, [sp, #12]
LBB5_4:
	.loc	1 100 3 is_stmt 1
	bl	_switch_break_only
	cmp	w0, #20
	b.eq	LBB5_6
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 100 34
	str	w8, [sp, #12]
LBB5_6:
	.loc	1 101 3 is_stmt 1
	bl	_for_switch_break_continue
	cmp	w0, #106
	b.eq	LBB5_8
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 101 43
	str	w8, [sp, #12]
LBB5_8:
	.loc	1 102 3 is_stmt 1
	bl	_switch_for_break_continue
	cmp	w0, #4
	b.eq	LBB5_10
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 102 41
	str	w8, [sp, #12]
LBB5_10:
	.loc	1 104 3 is_stmt 1
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
	.loc	1 109 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #16]
	ldr	w0, [sp, #12]
	add	sp, sp, #32
	ret
Ltmp31:
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
Lfunc_end5:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_2:
	.asciz	"39.break_continue_hierarchy.c PASS\n"

l___unnamed_1:
	.asciz	"39.break_continue_hierarchy.c FAIL\n"

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
	.byte	11
	.byte	1
	.byte	85
	.byte	23
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
	.long	34
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end5-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	43
	.long	43
	.byte	1
	.byte	3
	.long	410

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	166
	.byte	1
	.byte	5
	.long	410
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	168
	.byte	1
	.byte	4
	.long	410
	.byte	0
	.byte	2
	.quad	Lfunc_begin1
.set Lset5, Lfunc_end1-Lfunc_begin1
	.long	Lset5

	.byte	1
	.byte	111
	.long	62
	.long	62
	.byte	1
	.byte	17
	.long	410

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	172
	.byte	1
	.byte	19
	.long	410
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	174
	.byte	1
	.byte	18
	.long	410
	.byte	0
	.byte	2
	.quad	Lfunc_begin2
.set Lset6, Lfunc_end2-Lfunc_begin2
	.long	Lset6

	.byte	1
	.byte	111
	.long	87
	.long	87
	.byte	1
	.byte	33
	.long	410

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	172
	.byte	1
	.byte	35
	.long	410
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	174
	.byte	1
	.byte	34
	.long	410
	.byte	0
	.byte	2
	.quad	Lfunc_begin3
.set Lset7, Lfunc_end3-Lfunc_begin3
	.long	Lset7

	.byte	1
	.byte	111
	.long	105
	.long	105
	.byte	1
	.byte	50
	.long	410

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	166
	.byte	1
	.byte	52
	.long	410
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	168
	.byte	1
	.byte	51
	.long	410
	.byte	0
	.byte	2
	.quad	Lfunc_begin4
.set Lset8, Lfunc_end4-Lfunc_begin4
	.long	Lset8

	.byte	1
	.byte	111
	.long	131
	.long	131
	.byte	1
	.byte	69
	.long	410

	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	174
	.byte	1
	.byte	71
	.long	410
	.byte	3
	.byte	2
	.byte	145
	.byte	0
	.long	172
	.byte	1
	.byte	70
	.long	410
	.byte	4
.set Lset9, Ldebug_ranges0-Ldebug_range
	.long	Lset9
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	166
	.byte	1
	.byte	76
	.long	410
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	168
	.byte	1
	.byte	75
	.long	410
	.byte	0
	.byte	0
	.byte	2
	.quad	Lfunc_begin5
.set Lset10, Lfunc_end5-Lfunc_begin5
	.long	Lset10

	.byte	1
	.byte	111
	.long	157
	.long	157
	.byte	1
	.byte	95
	.long	410

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	176
	.byte	1
	.byte	96
	.long	410
	.byte	0
	.byte	5
	.long	162
	.byte	5
	.byte	4
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_ranges,regular,debug
Ldebug_range:
Ldebug_ranges0:
.set Lset11, Ltmp22-Lfunc_begin0
	.quad	Lset11
.set Lset12, Ltmp26-Lfunc_begin0
	.quad	Lset12
.set Lset13, Ltmp27-Lfunc_begin0
	.quad	Lset13
.set Lset14, Ltmp28-Lfunc_begin0
	.quad	Lset14
	.quad	0
	.quad	0
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"39.break_continue_hierarchy.c"
	.asciz	"../tests"
	.asciz	"for_break_continue"
	.asciz	"switch_break_fallthrough"
	.asciz	"switch_break_only"
	.asciz	"for_switch_break_continue"
	.asciz	"switch_for_break_continue"
	.asciz	"main"
	.asciz	"int"
	.asciz	"i"
	.asciz	"sum"
	.asciz	"r"
	.asciz	"x"
	.asciz	"err"
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	6
	.long	6
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	-1
	.long	0
	.long	1
	.long	-1
	.long	4
	.long	5
	.long	1706971909
	.long	2077872026
	.long	2143264340
	.long	-871745348
	.long	2090499946
	.long	1609998917
.set Lset15, LNames3-Lnames_begin
	.long	Lset15
.set Lset16, LNames1-Lnames_begin
	.long	Lset16
.set Lset17, LNames0-Lnames_begin
	.long	Lset17
.set Lset18, LNames2-Lnames_begin
	.long	Lset18
.set Lset19, LNames5-Lnames_begin
	.long	Lset19
.set Lset20, LNames4-Lnames_begin
	.long	Lset20
LNames3:
	.long	105
	.long	1
	.long	216
	.long	0
LNames1:
	.long	62
	.long	1
	.long	100
	.long	0
LNames0:
	.long	43
	.long	1
	.long	42
	.long	0
LNames2:
	.long	87
	.long	1
	.long	158
	.long	0
LNames5:
	.long	157
	.long	1
	.long	366
	.long	0
LNames4:
	.long	131
	.long	1
	.long	274
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
.set Lset21, Ltypes0-Ltypes_begin
	.long	Lset21
Ltypes0:
	.long	162
	.long	1
	.long	410
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
