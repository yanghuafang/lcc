	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_nested
	.p2align	2
_nested:
Lfunc_begin0:
	.file	1 "../tests" "43.nested_switch.c"
	.loc	1 12 0
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
Ltmp1:
	.loc	1 12 5 prologue_end
	str	w0, [sp, #20]
	str	w1, [sp, #24]
	.loc	1 13 3
	str	wzr, [sp, #28]
	.loc	1 14 3
	ldr	w8, [sp, #20]
	str	w8, [sp, #16]
	subs	w8, w8, #1
	b.eq	LBB0_3
	b	LBB0_1
LBB0_1:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #16]
	.loc	1 14 3
	subs	w8, w8, #2
	b.eq	LBB0_10
	b	LBB0_2
LBB0_2:
	b	LBB0_11
LBB0_3:
	.loc	1 16 7 is_stmt 1
	ldr	w8, [sp, #24]
	str	w8, [sp, #12]
	subs	w8, w8, #1
	b.eq	LBB0_6
	b	LBB0_4
LBB0_4:
	.loc	1 0 7 is_stmt 0
	ldr	w8, [sp, #12]
	.loc	1 16 7
	subs	w8, w8, #2
	b.eq	LBB0_7
	b	LBB0_5
LBB0_5:
	b	LBB0_8
LBB0_6:
	.loc	1 18 11 is_stmt 1
	ldr	w8, [sp, #28]
	add	w8, w8, #1
	str	w8, [sp, #28]
	.loc	1 19 11
	b	LBB0_9
LBB0_7:
	.loc	1 21 11
	ldr	w8, [sp, #28]
	add	w8, w8, #2
	str	w8, [sp, #28]
	.loc	1 22 11
	b	LBB0_9
LBB0_8:
	.loc	1 24 11
	ldr	w8, [sp, #28]
	add	w8, w8, #4
	str	w8, [sp, #28]
	.loc	1 25 11
	b	LBB0_9
LBB0_9:
	.loc	1 27 7
	ldr	w8, [sp, #28]
	add	w8, w8, #10
	str	w8, [sp, #28]
	b	LBB0_10
LBB0_10:
	.loc	1 30 7
	ldr	w8, [sp, #28]
	add	w8, w8, #100
	str	w8, [sp, #28]
	.loc	1 31 7
	b	LBB0_12
LBB0_11:
	.loc	1 33 7
	ldr	w8, [sp, #28]
	add	w8, w8, #1000
	str	w8, [sp, #28]
	.loc	1 34 7
	b	LBB0_12
LBB0_12:
	.loc	1 36 3
	ldr	w0, [sp, #28]
	.loc	1 36 3 epilogue_begin is_stmt 0
	add	sp, sp, #32
	ret
Ltmp2:
Lfunc_end0:
	.cfi_endproc

	.globl	_threeDeep
	.p2align	2
_threeDeep:
Lfunc_begin1:
	.loc	1 40 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp4:
	.loc	1 40 5 prologue_end
	str	w0, [sp, #8]
	.loc	1 41 3
	str	wzr, [sp, #12]
	.loc	1 42 3
	ldr	w8, [sp, #8]
	subs	w8, w8, #1
	b.eq	LBB1_2
	b	LBB1_1
LBB1_1:
	b	LBB1_9
LBB1_2:
	.loc	1 44 7
	ldr	w8, [sp, #8]
	str	w8, [sp, #4]
	subs	w8, w8, #1
	b.eq	LBB1_4
	b	LBB1_3
LBB1_3:
	.loc	1 0 7 is_stmt 0
	ldr	w8, [sp, #4]
	.loc	1 44 7
	subs	w8, w8, #2
	b.eq	LBB1_7
	b	LBB1_8
LBB1_4:
	.loc	1 46 11 is_stmt 1
	ldr	w8, [sp, #8]
	subs	w8, w8, #1
	b.ne	LBB1_6
	b	LBB1_5
LBB1_5:
	.loc	1 48 15
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	.loc	1 49 15
	b	LBB1_6
LBB1_6:
	.loc	1 51 11
	ldr	w8, [sp, #12]
	add	w8, w8, #2
	str	w8, [sp, #12]
	b	LBB1_7
LBB1_7:
	.loc	1 54 11
	ldr	w8, [sp, #12]
	add	w8, w8, #4
	str	w8, [sp, #12]
	.loc	1 55 11
	b	LBB1_8
LBB1_8:
	.loc	1 57 7
	ldr	w8, [sp, #12]
	add	w8, w8, #8
	str	w8, [sp, #12]
	.loc	1 58 7
	b	LBB1_10
LBB1_9:
	.loc	1 60 7
	ldr	w8, [sp, #12]
	add	w8, w8, #16
	str	w8, [sp, #12]
	.loc	1 61 7
	b	LBB1_10
LBB1_10:
	.loc	1 63 3
	ldr	w0, [sp, #12]
	.loc	1 63 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp5:
Lfunc_end1:
	.cfi_endproc

	.globl	_loopWithNestedSwitch
	.p2align	2
_loopWithNestedSwitch:
Lfunc_begin2:
	.loc	1 68 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp7:
	.loc	1 69 3 prologue_end
	str	wzr, [sp, #8]
	.loc	1 70 8
	str	wzr, [sp, #12]
	b	LBB2_1
LBB2_1:
	.loc	1 70 8
	ldr	w8, [sp, #12]
	subs	w8, w8, #5
	b.ge	LBB2_12
	b	LBB2_2
LBB2_2:
Ltmp8:
	.loc	1 71 5
	ldr	w8, [sp, #12]
	str	w8, [sp, #4]
	cbz	w8, LBB2_5
	b	LBB2_3
LBB2_3:
	.loc	1 0 5 is_stmt 0
	ldr	w8, [sp, #4]
	.loc	1 71 5
	subs	w8, w8, #3
	b.eq	LBB2_8
	b	LBB2_4
LBB2_4:
	b	LBB2_9
LBB2_5:
	.loc	1 73 9 is_stmt 1
	ldr	w8, [sp, #12]
	cbnz	w8, LBB2_7
	b	LBB2_6
LBB2_6:
	.loc	1 75 13
	b	LBB2_7
LBB2_7:
	.loc	1 77 9
	ldr	w8, [sp, #8]
	add	w8, w8, #1
	str	w8, [sp, #8]
	.loc	1 78 9
	b	LBB2_10
LBB2_8:
	.loc	1 80 9
	b	LBB2_11
LBB2_9:
	.loc	1 82 9
	ldr	w8, [sp, #8]
	add	w8, w8, #10
	str	w8, [sp, #8]
	.loc	1 83 9
	b	LBB2_10
LBB2_10:
	.loc	1 85 5
	ldr	w8, [sp, #8]
	add	w8, w8, #100
	str	w8, [sp, #8]
	b	LBB2_11
LBB2_11:
	.loc	1 85 5
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB2_1
Ltmp9:
LBB2_12:
	.loc	1 87 3
	ldr	w0, [sp, #8]
	.loc	1 87 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp10:
Lfunc_end2:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin3:
	.loc	1 90 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp11:
	.loc	1 91 3 prologue_end
	str	wzr, [sp, #12]
	mov	w1, #1
	.loc	1 93 3
	mov	w0, w1
	bl	_nested
	subs	w8, w0, #111
	b.eq	LBB3_2
	b	LBB3_1
LBB3_1:
	.loc	1 93 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_3
LBB3_2:
	b	LBB3_3
LBB3_3:
	.loc	1 94 3 is_stmt 1
	mov	w0, #1
	mov	w1, #2
	bl	_nested
	subs	w8, w0, #112
	b.eq	LBB3_5
	b	LBB3_4
LBB3_4:
	.loc	1 94 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_6
LBB3_5:
	b	LBB3_6
LBB3_6:
	.loc	1 95 3 is_stmt 1
	mov	w0, #1
	mov	w1, #5
	bl	_nested
	subs	w8, w0, #114
	b.eq	LBB3_8
	b	LBB3_7
LBB3_7:
	.loc	1 95 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_9
LBB3_8:
	b	LBB3_9
LBB3_9:
	.loc	1 96 3 is_stmt 1
	mov	w0, #2
	mov	w1, #1
	bl	_nested
	subs	w8, w0, #100
	b.eq	LBB3_11
	b	LBB3_10
LBB3_10:
	.loc	1 96 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_12
LBB3_11:
	b	LBB3_12
LBB3_12:
	.loc	1 97 3 is_stmt 1
	mov	w0, #3
	mov	w1, #1
	bl	_nested
	subs	w8, w0, #1000
	b.eq	LBB3_14
	b	LBB3_13
LBB3_13:
	.loc	1 97 29 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_15
LBB3_14:
	b	LBB3_15
LBB3_15:
	.loc	1 99 3 is_stmt 1
	mov	w0, #1
	bl	_threeDeep
	subs	w8, w0, #15
	b.eq	LBB3_17
	b	LBB3_16
LBB3_16:
	.loc	1 99 27 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_18
LBB3_17:
	b	LBB3_18
LBB3_18:
	.loc	1 100 3 is_stmt 1
	mov	w0, #9
	bl	_threeDeep
	subs	w8, w0, #16
	b.eq	LBB3_20
	b	LBB3_19
LBB3_19:
	.loc	1 100 27 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_21
LBB3_20:
	b	LBB3_21
LBB3_21:
	.loc	1 102 3 is_stmt 1
	bl	_loopWithNestedSwitch
	subs	w8, w0, #431
	b.eq	LBB3_23
	b	LBB3_22
LBB3_22:
	.loc	1 102 38 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_24
LBB3_23:
	b	LBB3_24
LBB3_24:
	.loc	1 104 3 is_stmt 1
	ldr	w8, [sp, #12]
	cbnz	w8, LBB3_26
	b	LBB3_25
LBB3_25:
Ltmp12:
	.loc	1 105 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB3_27
Ltmp13:
LBB3_26:
	.loc	1 107 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB3_27
Ltmp14:
LBB3_27:
	.loc	1 109 3
	ldr	w0, [sp, #12]
	.loc	1 109 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #16]
	add	sp, sp, #32
	ret
Ltmp15:
Lfunc_end3:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"43.nested_switch.c PASS\n"

l___unnamed_2:
	.asciz	"43.nested_switch.c FAIL\n"

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
	.long	23
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end3-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	32
	.long	32
	.byte	1
	.byte	12
	.long	274

	.byte	3
	.byte	2
	.byte	145
	.byte	20
	.long	87
	.byte	1
	.byte	12
	.long	274
	.byte	3
	.byte	2
	.byte	145
	.byte	24
	.long	81
	.byte	1
	.byte	12
	.long	274
	.byte	4
	.byte	2
	.byte	145
	.byte	28
	.long	79
	.byte	1
	.byte	13
	.long	274
	.byte	0
	.byte	2
	.quad	Lfunc_begin1
.set Lset5, Lfunc_end1-Lfunc_begin1
	.long	Lset5

	.byte	1
	.byte	111
	.long	39
	.long	39
	.byte	1
	.byte	40
	.long	274

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	93
	.byte	1
	.byte	40
	.long	274
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	79
	.byte	1
	.byte	41
	.long	274
	.byte	0
	.byte	2
	.quad	Lfunc_begin2
.set Lset6, Lfunc_end2-Lfunc_begin2
	.long	Lset6

	.byte	1
	.byte	111
	.long	49
	.long	49
	.byte	1
	.byte	68
	.long	274

	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	95
	.byte	1
	.byte	70
	.long	274
	.byte	4
	.byte	2
	.byte	145
	.byte	8
	.long	97
	.byte	1
	.byte	69
	.long	274
	.byte	0
	.byte	2
	.quad	Lfunc_begin3
.set Lset7, Lfunc_end3-Lfunc_begin3
	.long	Lset7

	.byte	1
	.byte	111
	.long	70
	.long	70
	.byte	1
	.byte	90
	.long	274

	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	103
	.byte	1
	.byte	91
	.long	274
	.byte	0
	.byte	5
	.long	75
	.byte	5
	.byte	4
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"43.nested_switch.c"
	.asciz	"../tests"
	.asciz	"nested"
	.asciz	"threeDeep"
	.asciz	"loopWithNestedSwitch"
	.asciz	"main"
	.asciz	"int"
	.asciz	"r"
	.asciz	"inner"
	.asciz	"outer"
	.asciz	"x"
	.asciz	"i"
	.asciz	"total"
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
	.long	-1
	.long	2
	.long	3
	.long	266022728
	.long	1490754960
	.long	2090499946
	.long	-275710021
.set Lset8, LNames0-Lnames_begin
	.long	Lset8
.set Lset9, LNames2-Lnames_begin
	.long	Lset9
.set Lset10, LNames3-Lnames_begin
	.long	Lset10
.set Lset11, LNames1-Lnames_begin
	.long	Lset11
LNames0:
	.long	32
	.long	1
	.long	42
	.long	0
LNames2:
	.long	49
	.long	1
	.long	172
	.long	0
LNames3:
	.long	70
	.long	1
	.long	230
	.long	0
LNames1:
	.long	39
	.long	1
	.long	114
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
.set Lset12, Ltypes0-Ltypes_begin
	.long	Lset12
Ltypes0:
	.long	75
	.long	1
	.long	274
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
