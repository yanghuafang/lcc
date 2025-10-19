	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_for_break_continue
	.p2align	2
_for_break_continue:
Lfunc_begin0:
	.file	1 "../tests" "39.break_continue_hierarchy.c"
	.loc	1 7 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp1:
	.loc	1 8 3 prologue_end
	str	wzr, [sp, #8]
	.loc	1 9 8
	str	wzr, [sp, #12]
	b	LBB0_1
LBB0_1:
	.loc	1 9 8
	ldr	w8, [sp, #12]
	subs	w8, w8, #10
	b.ge	LBB0_10
	b	LBB0_2
LBB0_2:
Ltmp2:
	.loc	1 10 5
	ldr	w8, [sp, #12]
	subs	w8, w8, #3
	b.ne	LBB0_4
	b	LBB0_3
LBB0_3:
Ltmp3:
	.loc	1 11 7
	b	LBB0_9
LBB0_4:
	.loc	1 11 7
	b	LBB0_5
Ltmp4:
LBB0_5:
	.loc	1 13 5
	ldr	w8, [sp, #12]
	subs	w8, w8, #7
	b.ne	LBB0_7
	b	LBB0_6
LBB0_6:
Ltmp5:
	.loc	1 14 7
	b	LBB0_10
LBB0_7:
	.loc	1 14 7
	b	LBB0_8
Ltmp6:
LBB0_8:
	.loc	1 16 5
	ldr	w8, [sp, #8]
	ldr	w9, [sp, #12]
	add	w8, w8, w9
	str	w8, [sp, #8]
	b	LBB0_9
LBB0_9:
	.loc	1 16 5
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB0_1
Ltmp7:
LBB0_10:
	.loc	1 18 3
	ldr	w0, [sp, #8]
	.loc	1 18 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp8:
Lfunc_end0:
	.cfi_endproc

	.globl	_switch_break_fallthrough
	.p2align	2
_switch_break_fallthrough:
Lfunc_begin1:
	.loc	1 21 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	mov	w8, #1
Ltmp10:
	.loc	1 22 3 prologue_end
	str	w8, [sp, #8]
	.loc	1 23 3
	str	wzr, [sp, #12]
	.loc	1 24 3
	ldr	w8, [sp, #8]
	str	w8, [sp, #4]
	subs	w8, w8, #1
	b.eq	LBB1_3
	b	LBB1_1
LBB1_1:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #4]
	.loc	1 24 3
	subs	w8, w8, #2
	b.eq	LBB1_4
	b	LBB1_2
LBB1_2:
	b	LBB1_5
LBB1_3:
	.loc	1 26 7 is_stmt 1
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB1_4
LBB1_4:
	.loc	1 28 7
	ldr	w8, [sp, #12]
	add	w8, w8, #10
	str	w8, [sp, #12]
	.loc	1 29 7
	b	LBB1_6
LBB1_5:
	.loc	1 31 7
	mov	w8, #99
	str	w8, [sp, #12]
	.loc	1 32 7
	b	LBB1_6
LBB1_6:
	.loc	1 34 3
	ldr	w0, [sp, #12]
	.loc	1 34 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp11:
Lfunc_end1:
	.cfi_endproc

	.globl	_switch_break_only
	.p2align	2
_switch_break_only:
Lfunc_begin2:
	.loc	1 37 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp13:
	.loc	1 38 3 prologue_end
	mov	w8, #2
	str	w8, [sp, #8]
	.loc	1 39 3
	str	wzr, [sp, #12]
	.loc	1 40 3
	ldr	w8, [sp, #8]
	str	w8, [sp, #4]
	subs	w8, w8, #1
	b.eq	LBB2_3
	b	LBB2_1
LBB2_1:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #4]
	.loc	1 40 3
	subs	w8, w8, #2
	b.eq	LBB2_4
	b	LBB2_2
LBB2_2:
	b	LBB2_5
LBB2_3:
	.loc	1 42 7 is_stmt 1
	mov	w8, #10
	str	w8, [sp, #12]
	.loc	1 43 7
	b	LBB2_6
LBB2_4:
	.loc	1 45 7
	mov	w8, #20
	str	w8, [sp, #12]
	.loc	1 46 7
	b	LBB2_6
LBB2_5:
	.loc	1 48 7
	mov	w8, #99
	str	w8, [sp, #12]
	.loc	1 49 7
	b	LBB2_6
LBB2_6:
	.loc	1 51 3
	ldr	w0, [sp, #12]
	.loc	1 51 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp14:
Lfunc_end2:
	.cfi_endproc

	.globl	_for_switch_break_continue
	.p2align	2
_for_switch_break_continue:
Lfunc_begin3:
	.loc	1 54 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp16:
	.loc	1 55 3 prologue_end
	str	wzr, [sp, #8]
	.loc	1 56 8
	str	wzr, [sp, #12]
	b	LBB3_1
LBB3_1:
	.loc	1 56 8
	ldr	w8, [sp, #12]
	subs	w8, w8, #6
	b.ge	LBB3_12
	b	LBB3_2
LBB3_2:
Ltmp17:
	.loc	1 57 5
	ldr	w8, [sp, #12]
	str	w8, [sp, #4]
	subs	w8, w8, #1
	b.eq	LBB3_6
	b	LBB3_3
LBB3_3:
	.loc	1 0 5 is_stmt 0
	ldr	w8, [sp, #4]
	.loc	1 57 5
	subs	w8, w8, #3
	b.eq	LBB3_7
	b	LBB3_4
LBB3_4:
	.loc	1 0 5
	ldr	w8, [sp, #4]
	.loc	1 57 5
	subs	w8, w8, #5
	b.eq	LBB3_8
	b	LBB3_5
LBB3_5:
	b	LBB3_9
LBB3_6:
	.loc	1 59 9 is_stmt 1
	b	LBB3_11
LBB3_7:
	.loc	1 61 9
	b	LBB3_10
LBB3_8:
	.loc	1 63 9
	ldr	w8, [sp, #8]
	add	w8, w8, #100
	str	w8, [sp, #8]
	.loc	1 64 9
	b	LBB3_10
LBB3_9:
	.loc	1 66 9
	ldr	w8, [sp, #8]
	ldr	w9, [sp, #12]
	add	w8, w8, w9
	str	w8, [sp, #8]
	.loc	1 67 9
	b	LBB3_10
LBB3_10:
	.loc	1 67 9
	b	LBB3_11
LBB3_11:
	.loc	1 67 9
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB3_1
Ltmp18:
LBB3_12:
	.loc	1 70 3
	ldr	w0, [sp, #8]
	.loc	1 70 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp19:
Lfunc_end3:
	.cfi_endproc

	.globl	_switch_for_break_continue
	.p2align	2
_switch_for_break_continue:
Lfunc_begin4:
	.loc	1 73 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp21:
	.loc	1 74 3 prologue_end
	str	wzr, [sp]
	mov	w8, #1
	.loc	1 75 3
	str	w8, [sp, #4]
	.loc	1 76 3
	ldr	w8, [sp, #4]
	subs	w8, w8, #1
	b.eq	LBB4_2
	b	LBB4_1
LBB4_1:
	b	LBB4_13
LBB4_2:
Ltmp22:
	.loc	1 78 7
	str	wzr, [sp, #8]
	.loc	1 79 12
	str	wzr, [sp, #12]
	b	LBB4_3
LBB4_3:
	.loc	1 79 12
	ldr	w8, [sp, #12]
	subs	w8, w8, #5
	b.ge	LBB4_12
	b	LBB4_4
LBB4_4:
Ltmp23:
	.loc	1 80 9
	ldr	w8, [sp, #12]
	subs	w8, w8, #2
	b.ne	LBB4_6
	b	LBB4_5
LBB4_5:
Ltmp24:
	.loc	1 81 11
	b	LBB4_11
LBB4_6:
	.loc	1 81 11
	b	LBB4_7
Ltmp25:
LBB4_7:
	.loc	1 83 9
	ldr	w8, [sp, #12]
	subs	w8, w8, #4
	b.ne	LBB4_9
	b	LBB4_8
LBB4_8:
Ltmp26:
	.loc	1 84 11
	b	LBB4_12
LBB4_9:
	.loc	1 84 11
	b	LBB4_10
Ltmp27:
LBB4_10:
	.loc	1 86 9
	ldr	w8, [sp, #8]
	ldr	w9, [sp, #12]
	add	w8, w8, w9
	str	w8, [sp, #8]
	b	LBB4_11
LBB4_11:
	.loc	1 86 9
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB4_3
Ltmp28:
LBB4_12:
	.loc	1 88 7
	ldr	w8, [sp, #8]
	str	w8, [sp]
Ltmp29:
	.loc	1 89 7
	b	LBB4_14
LBB4_13:
	.loc	1 91 7
	mov	w8, #-1
	str	w8, [sp]
	.loc	1 92 7
	b	LBB4_14
LBB4_14:
	.loc	1 94 3
	ldr	w0, [sp]
	.loc	1 94 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp30:
Lfunc_end4:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin5:
	.loc	1 97 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp31:
	.loc	1 98 3 prologue_end
	str	wzr, [sp, #12]
	.loc	1 100 3
	bl	_for_break_continue
	subs	w8, w0, #18
	b.eq	LBB5_2
	b	LBB5_1
LBB5_1:
	.loc	1 100 35 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB5_3
LBB5_2:
	b	LBB5_3
LBB5_3:
	.loc	1 101 3 is_stmt 1
	bl	_switch_break_fallthrough
	subs	w8, w0, #11
	b.eq	LBB5_5
	b	LBB5_4
LBB5_4:
	.loc	1 101 41 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB5_6
LBB5_5:
	b	LBB5_6
LBB5_6:
	.loc	1 102 3 is_stmt 1
	bl	_switch_break_only
	subs	w8, w0, #20
	b.eq	LBB5_8
	b	LBB5_7
LBB5_7:
	.loc	1 102 34 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB5_9
LBB5_8:
	b	LBB5_9
LBB5_9:
	.loc	1 103 3 is_stmt 1
	bl	_for_switch_break_continue
	subs	w8, w0, #106
	b.eq	LBB5_11
	b	LBB5_10
LBB5_10:
	.loc	1 103 43 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB5_12
LBB5_11:
	b	LBB5_12
LBB5_12:
	.loc	1 104 3 is_stmt 1
	bl	_switch_for_break_continue
	subs	w8, w0, #4
	b.eq	LBB5_14
	b	LBB5_13
LBB5_13:
	.loc	1 104 41 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB5_15
LBB5_14:
	b	LBB5_15
LBB5_15:
	.loc	1 106 3 is_stmt 1
	ldr	w8, [sp, #12]
	cbnz	w8, LBB5_17
	b	LBB5_16
LBB5_16:
Ltmp32:
	.loc	1 107 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB5_18
Ltmp33:
LBB5_17:
	.loc	1 109 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB5_18
Ltmp34:
LBB5_18:
	.loc	1 111 3
	ldr	w0, [sp, #12]
	.loc	1 111 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #16]
	add	sp, sp, #32
	ret
Ltmp35:
Lfunc_end5:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"39.break_continue_hierarchy.c PASS\n"

l___unnamed_2:
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
	.byte	17
	.byte	1
	.byte	18
	.byte	6
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
	.byte	7
	.long	418

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	166
	.byte	1
	.byte	9
	.long	418
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	168
	.byte	1
	.byte	8
	.long	418
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
	.byte	21
	.long	418

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	172
	.byte	1
	.byte	23
	.long	418
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	174
	.byte	1
	.byte	22
	.long	418
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
	.byte	37
	.long	418

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	172
	.byte	1
	.byte	39
	.long	418
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	174
	.byte	1
	.byte	38
	.long	418
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
	.byte	54
	.long	418

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	166
	.byte	1
	.byte	56
	.long	418
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	168
	.byte	1
	.byte	55
	.long	418
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
	.byte	73
	.long	418

	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	174
	.byte	1
	.byte	75
	.long	418
	.byte	3
	.byte	2
	.byte	145
	.byte	0
	.long	172
	.byte	1
	.byte	74
	.long	418
	.byte	4
	.quad	Ltmp22
.set Lset9, Ltmp29-Ltmp22
	.long	Lset9
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	166
	.byte	1
	.byte	79
	.long	418
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	168
	.byte	1
	.byte	78
	.long	418
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
	.byte	97
	.long	418

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	176
	.byte	1
	.byte	98
	.long	418
	.byte	0
	.byte	5
	.long	162
	.byte	5
	.byte	4
	.byte	0
Ldebug_info_end0:
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
.set Lset11, LNames3-Lnames_begin
	.long	Lset11
.set Lset12, LNames1-Lnames_begin
	.long	Lset12
.set Lset13, LNames0-Lnames_begin
	.long	Lset13
.set Lset14, LNames2-Lnames_begin
	.long	Lset14
.set Lset15, LNames5-Lnames_begin
	.long	Lset15
.set Lset16, LNames4-Lnames_begin
	.long	Lset16
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
	.long	374
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
.set Lset17, Ltypes0-Ltypes_begin
	.long	Lset17
Ltypes0:
	.long	162
	.long	1
	.long	418
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
