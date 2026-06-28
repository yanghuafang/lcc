	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_countTo
	.p2align	2
_countTo:
Lfunc_begin0:
	.file	1 "../tests" "50.goto_label.c"
	.loc	1 18 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp1:
	.loc	1 18 5 prologue_end
	str	w0, [sp, #8]
	.loc	1 19 3
	str	wzr, [sp, #12]
	.loc	1 20 1
	b	LBB0_1
LBB0_1:
	.loc	1 21 3
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	.loc	1 22 3
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #8]
	subs	w8, w8, w9
	b.ge	LBB0_3
	b	LBB0_2
LBB0_2:
Ltmp2:
	.loc	1 23 5
	b	LBB0_1
LBB0_3:
	.loc	1 23 5
	b	LBB0_4
Ltmp3:
LBB0_4:
	.loc	1 25 3
	ldr	w0, [sp, #12]
	.loc	1 25 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp4:
Lfunc_end0:
	.cfi_endproc

	.globl	_skip
	.p2align	2
_skip:
Lfunc_begin1:
	.loc	1 29 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp6:
	.loc	1 29 5 prologue_end
	str	w0, [sp, #8]
	.loc	1 30 3
	mov	w8, #1
	str	w8, [sp, #12]
	.loc	1 31 3
	ldr	w8, [sp, #8]
	cbz	w8, LBB1_2
	b	LBB1_1
LBB1_1:
Ltmp7:
	.loc	1 32 5
	b	LBB1_4
LBB1_2:
	.loc	1 32 5
	b	LBB1_3
Ltmp8:
LBB1_3:
	.loc	1 34 3
	mov	w8, #2
	str	w8, [sp, #12]
	.loc	1 35 1
	b	LBB1_4
LBB1_4:
	.loc	1 36 3
	ldr	w0, [sp, #12]
	.loc	1 36 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp9:
Lfunc_end1:
	.cfi_endproc

	.globl	_firstPair
	.p2align	2
_firstPair:
Lfunc_begin2:
	.loc	1 40 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
Ltmp11:
	.loc	1 40 5 prologue_end
	str	w0, [sp, #12]
	str	w1, [sp, #16]
	.loc	1 41 3
	str	wzr, [sp, #20]
	.loc	1 43 3
	mov	w8, #-1
	str	w8, [sp, #28]
	.loc	1 44 3
	b	LBB2_1
LBB2_1:
	.loc	1 44 3
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #12]
	subs	w8, w8, w9
	b.ge	LBB2_9
	b	LBB2_2
LBB2_2:
Ltmp12:
	.loc	1 45 5
	str	wzr, [sp, #24]
	.loc	1 46 5
	b	LBB2_3
LBB2_3:
	.loc	1 46 5
	ldr	w8, [sp, #24]
	ldr	w9, [sp, #12]
	subs	w8, w8, w9
	b.ge	LBB2_8
	b	LBB2_4
LBB2_4:
Ltmp13:
	.loc	1 47 7
	ldr	w8, [sp, #20]
	mov	w9, #10
	mul	w8, w8, w9
	ldr	w9, [sp, #24]
	add	w8, w8, w9
	ldr	w9, [sp, #16]
	subs	w8, w8, w9
	b.ne	LBB2_6
	b	LBB2_5
LBB2_5:
Ltmp14:
	.loc	1 48 9
	ldr	w8, [sp, #20]
	mov	w9, #10
	mul	w8, w8, w9
	ldr	w9, [sp, #24]
	add	w8, w8, w9
	str	w8, [sp, #28]
	.loc	1 49 9
	b	LBB2_10
LBB2_6:
	.loc	1 49 9
	b	LBB2_7
Ltmp15:
LBB2_7:
	.loc	1 51 7
	ldr	w8, [sp, #24]
	add	w8, w8, #1
	str	w8, [sp, #24]
	b	LBB2_3
Ltmp16:
LBB2_8:
	.loc	1 53 5
	ldr	w8, [sp, #20]
	add	w8, w8, #1
	str	w8, [sp, #20]
	b	LBB2_1
Ltmp17:
LBB2_9:
	.loc	1 55 1
	b	LBB2_10
LBB2_10:
	.loc	1 56 3
	ldr	w0, [sp, #28]
	.loc	1 56 3 epilogue_begin is_stmt 0
	add	sp, sp, #32
	ret
Ltmp18:
Lfunc_end2:
	.cfi_endproc

	.globl	_afterReturn
	.p2align	2
_afterReturn:
Lfunc_begin3:
	.loc	1 60 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp20:
	.loc	1 60 5 prologue_end
	str	w0, [sp, #12]
	.loc	1 61 3
	ldr	w8, [sp, #12]
	cbz	w8, LBB3_2
	b	LBB3_1
LBB3_1:
Ltmp21:
	.loc	1 62 5
	b	LBB3_4
LBB3_2:
	.loc	1 62 5
	b	LBB3_3
Ltmp22:
LBB3_3:
	.loc	1 64 3
	mov	w0, #1
	.loc	1 64 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
LBB3_4:
	.loc	1 66 3 is_stmt 1
	mov	w0, #2
	.loc	1 66 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp23:
Lfunc_end3:
	.cfi_endproc

	.globl	_fromSwitch
	.p2align	2
_fromSwitch:
Lfunc_begin4:
	.loc	1 70 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp25:
	.loc	1 70 5 prologue_end
	str	w0, [sp, #12]
	.loc	1 71 3
	ldr	w8, [sp, #12]
	str	w8, [sp, #8]
	subs	w8, w8, #1
	b.eq	LBB4_2
	b	LBB4_1
LBB4_1:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #8]
	.loc	1 71 3
	subs	w8, w8, #2
	b.eq	LBB4_3
	b	LBB4_4
LBB4_2:
	.loc	1 73 7 is_stmt 1
	b	LBB4_6
LBB4_3:
	.loc	1 75 7
	mov	w0, #20
	.loc	1 75 7 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
LBB4_4:
	.loc	1 77 7 is_stmt 1
	b	LBB4_5
LBB4_5:
	.loc	1 79 3
	mov	w0, wzr
	.loc	1 79 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
LBB4_6:
	.loc	1 81 3 is_stmt 1
	mov	w0, #10
	.loc	1 81 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp26:
Lfunc_end4:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin5:
	.loc	1 84 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp27:
	.loc	1 85 3 prologue_end
	str	wzr, [sp, #28]
	mov	w0, #5
	.loc	1 87 3
	bl	_countTo
	subs	w8, w0, #5
	b.eq	LBB5_2
	b	LBB5_1
LBB5_1:
Ltmp28:
	.loc	1 88 5
	mov	w8, #1
	str	w8, [sp, #28]
	b	LBB5_3
LBB5_2:
	.loc	1 88 5
	b	LBB5_3
Ltmp29:
LBB5_3:
	.loc	1 0 5 is_stmt 0
	mov	w0, #1
	.loc	1 90 3 is_stmt 1
	bl	_skip
	mov	w8, #1
	subs	w9, w0, #1
	str	w8, [sp, #24]
	b.ne	LBB5_5
	b	LBB5_4
LBB5_4:
	mov	w0, wzr
	bl	_skip
	subs	w8, w0, #2
	cset	w8, ne
	str	w8, [sp, #24]
	b	LBB5_5
LBB5_5:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #24]
	.loc	1 90 3
	tbz	w8, #0, LBB5_7
	b	LBB5_6
LBB5_6:
Ltmp30:
	.loc	1 91 5 is_stmt 1
	mov	w8, #1
	str	w8, [sp, #28]
	b	LBB5_8
LBB5_7:
	.loc	1 91 5
	b	LBB5_8
Ltmp31:
LBB5_8:
	.loc	1 93 3
	mov	w0, #5
	mov	w1, #23
	bl	_firstPair
	mov	w8, #1
	subs	w9, w0, #23
	str	w8, [sp, #20]
	b.ne	LBB5_10
	b	LBB5_9
LBB5_9:
	mov	w0, #3
	mov	w1, #99
	bl	_firstPair
	adds	w8, w0, #1
	cset	w8, ne
	str	w8, [sp, #20]
	b	LBB5_10
LBB5_10:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #20]
	.loc	1 93 3
	tbz	w8, #0, LBB5_12
	b	LBB5_11
LBB5_11:
Ltmp32:
	.loc	1 94 5 is_stmt 1
	mov	w8, #1
	str	w8, [sp, #28]
	b	LBB5_13
LBB5_12:
	.loc	1 94 5
	b	LBB5_13
Ltmp33:
LBB5_13:
	.loc	1 96 3
	mov	w0, #1
	bl	_afterReturn
	mov	w8, #1
	subs	w9, w0, #2
	str	w8, [sp, #16]
	b.ne	LBB5_15
	b	LBB5_14
LBB5_14:
	mov	w0, wzr
	bl	_afterReturn
	subs	w8, w0, #1
	cset	w8, ne
	str	w8, [sp, #16]
	b	LBB5_15
LBB5_15:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #16]
	.loc	1 96 3
	tbz	w8, #0, LBB5_17
	b	LBB5_16
LBB5_16:
Ltmp34:
	.loc	1 97 5 is_stmt 1
	mov	w8, #1
	str	w8, [sp, #28]
	b	LBB5_18
LBB5_17:
	.loc	1 97 5
	b	LBB5_18
Ltmp35:
LBB5_18:
	.loc	1 99 3
	mov	w0, #1
	bl	_fromSwitch
	mov	w8, #1
	subs	w9, w0, #10
	str	w8, [sp, #12]
	b.ne	LBB5_20
	b	LBB5_19
LBB5_19:
	mov	w0, #2
	bl	_fromSwitch
	subs	w8, w0, #20
	cset	w8, ne
	str	w8, [sp, #12]
	b	LBB5_20
LBB5_20:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #12]
	mov	w9, #1
	str	w9, [sp, #8]
	.loc	1 99 3
	tbnz	w8, #0, LBB5_22
	b	LBB5_21
LBB5_21:
	mov	w0, #9
	bl	_fromSwitch
	subs	w8, w0, #0
	cset	w8, ne
	str	w8, [sp, #8]
	b	LBB5_22
LBB5_22:
	.loc	1 0 3
	ldr	w8, [sp, #8]
	.loc	1 99 3
	tbz	w8, #0, LBB5_24
	b	LBB5_23
LBB5_23:
Ltmp36:
	.loc	1 100 5 is_stmt 1
	mov	w8, #1
	str	w8, [sp, #28]
	b	LBB5_25
LBB5_24:
	.loc	1 100 5
	b	LBB5_25
Ltmp37:
LBB5_25:
	.loc	1 103 3
	ldr	w8, [sp, #28]
	cbnz	w8, LBB5_27
	b	LBB5_26
LBB5_26:
Ltmp38:
	.loc	1 104 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	.loc	1 105 5
	mov	w0, wzr
	.loc	1 105 5 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #32]
	add	sp, sp, #48
	ret
LBB5_27:
	.loc	1 105 5 is_stmt 1
	b	LBB5_28
Ltmp39:
LBB5_28:
	.loc	1 107 3
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	.loc	1 108 3
	mov	w0, #1
	.loc	1 108 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #32]
	add	sp, sp, #48
	ret
Ltmp40:
Lfunc_end5:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"50.goto_label.c PASS\n"

l___unnamed_2:
	.asciz	"50.goto_label.c FAIL\n"

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
	.long	20
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end5-Lfunc_begin0
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
	.byte	18
	.long	390

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	86
	.byte	1
	.byte	18
	.long	390
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	84
	.byte	1
	.byte	19
	.long	390
	.byte	0
	.byte	2
	.quad	Lfunc_begin1
.set Lset5, Lfunc_end1-Lfunc_begin1
	.long	Lset5

	.byte	1
	.byte	111
	.long	37
	.long	37
	.byte	1
	.byte	29
	.long	390

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	90
	.byte	1
	.byte	29
	.long	390
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	88
	.byte	1
	.byte	30
	.long	390
	.byte	0
	.byte	2
	.quad	Lfunc_begin2
.set Lset6, Lfunc_end2-Lfunc_begin2
	.long	Lset6

	.byte	1
	.byte	111
	.long	42
	.long	42
	.byte	1
	.byte	40
	.long	390

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	110
	.byte	1
	.byte	40
	.long	390
	.byte	3
	.byte	2
	.byte	145
	.byte	16
	.long	103
	.byte	1
	.byte	40
	.long	390
	.byte	4
	.byte	2
	.byte	145
	.byte	28
	.long	95
	.byte	1
	.byte	43
	.long	390
	.byte	4
	.byte	2
	.byte	145
	.byte	24
	.long	101
	.byte	1
	.byte	42
	.long	390
	.byte	4
	.byte	2
	.byte	145
	.byte	20
	.long	84
	.byte	1
	.byte	41
	.long	390
	.byte	0
	.byte	2
	.quad	Lfunc_begin3
.set Lset7, Lfunc_end3-Lfunc_begin3
	.long	Lset7

	.byte	1
	.byte	111
	.long	52
	.long	52
	.byte	1
	.byte	60
	.long	390

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	90
	.byte	1
	.byte	60
	.long	390
	.byte	0
	.byte	2
	.quad	Lfunc_begin4
.set Lset8, Lfunc_end4-Lfunc_begin4
	.long	Lset8

	.byte	1
	.byte	111
	.long	64
	.long	64
	.byte	1
	.byte	70
	.long	390

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	116
	.byte	1
	.byte	70
	.long	390
	.byte	0
	.byte	2
	.quad	Lfunc_begin5
.set Lset9, Lfunc_end5-Lfunc_begin5
	.long	Lset9

	.byte	1
	.byte	111
	.long	75
	.long	75
	.byte	1
	.byte	84
	.long	390

	.byte	4
	.byte	2
	.byte	145
	.byte	28
	.long	118
	.byte	1
	.byte	85
	.long	390
	.byte	0
	.byte	5
	.long	80
	.byte	5
	.byte	4
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"50.goto_label.c"
	.asciz	"../tests"
	.asciz	"countTo"
	.asciz	"skip"
	.asciz	"firstPair"
	.asciz	"afterReturn"
	.asciz	"fromSwitch"
	.asciz	"main"
	.asciz	"int"
	.asciz	"i"
	.asciz	"n"
	.asciz	"r"
	.asciz	"flag"
	.asciz	"found"
	.asciz	"j"
	.asciz	"target"
	.asciz	"limit"
	.asciz	"x"
	.asciz	"failed"
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
	.long	0
	.long	1
	.long	-1
	.long	-1
	.long	3
	.long	4
	.long	2090726460
	.long	-1631399175
	.long	-1297723605
	.long	2090499946
	.long	473420567
	.long	-738904271
.set Lset10, LNames1-Lnames_begin
	.long	Lset10
.set Lset11, LNames2-Lnames_begin
	.long	Lset11
.set Lset12, LNames4-Lnames_begin
	.long	Lset12
.set Lset13, LNames5-Lnames_begin
	.long	Lset13
.set Lset14, LNames3-Lnames_begin
	.long	Lset14
.set Lset15, LNames0-Lnames_begin
	.long	Lset15
LNames1:
	.long	37
	.long	1
	.long	100
	.long	0
LNames2:
	.long	42
	.long	1
	.long	158
	.long	0
LNames4:
	.long	64
	.long	1
	.long	302
	.long	0
LNames5:
	.long	75
	.long	1
	.long	346
	.long	0
LNames3:
	.long	52
	.long	1
	.long	258
	.long	0
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
.set Lset16, Ltypes0-Ltypes_begin
	.long	Lset16
Ltypes0:
	.long	80
	.long	1
	.long	390
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
