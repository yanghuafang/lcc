	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_outerSize
	.p2align	2
_outerSize:
Lfunc_begin0:
	.cfi_startproc
	.file	1 "../tests" "48.block_typedef.c"
	.loc	1 20 19 prologue_end
	mov	w0, #4
	ret
Ltmp0:
Lfunc_end0:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin1:
	.loc	1 22 0
	.cfi_startproc
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]
	.cfi_def_cfa_offset 64
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp1:
	.loc	1 23 3 prologue_end
	str	wzr, [sp, #8]
	mov	w8, #1000
	.loc	1 24 3
	str	w8, [sp, #12]
	.loc	1 26 3
	ldr	w8, [sp, #12]
	subs	w8, w8, #1000
	b.eq	LBB1_2
	b	LBB1_1
LBB1_1:
Ltmp2:
	.loc	1 27 5
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB1_3
LBB1_2:
	.loc	1 27 5
	b	LBB1_3
Ltmp3:
LBB1_3:
	.loc	1 0 5 is_stmt 0
	mov	w8, wzr
	.loc	1 29 3 is_stmt 1
	tbz	w8, #0, LBB1_5
	b	LBB1_4
LBB1_4:
Ltmp4:
	.loc	1 30 5
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB1_6
LBB1_5:
	.loc	1 30 5
	b	LBB1_6
Ltmp5:
LBB1_6:
	.loc	1 36 5
	mov	w8, #44
	strb	w8, [sp, #19]
	.loc	1 38 5
	ldrsb	w8, [sp, #19]
	subs	w8, w8, #44
	b.eq	LBB1_8
	b	LBB1_7
LBB1_7:
Ltmp6:
	.loc	1 39 7
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB1_9
LBB1_8:
	.loc	1 39 7
	b	LBB1_9
Ltmp7:
LBB1_9:
	.loc	1 0 7 is_stmt 0
	mov	w8, wzr
	.loc	1 41 5 is_stmt 1
	tbz	w8, #0, LBB1_11
	b	LBB1_10
LBB1_10:
Ltmp8:
	.loc	1 42 7
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB1_12
LBB1_11:
	.loc	1 42 7
	b	LBB1_12
Ltmp9:
LBB1_12:
	.loc	1 0 7 is_stmt 0
	mov	w8, wzr
	.loc	1 47 3 is_stmt 1
	tbz	w8, #0, LBB1_14
	b	LBB1_13
LBB1_13:
Ltmp10:
	.loc	1 48 5
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB1_15
LBB1_14:
	.loc	1 48 5
	b	LBB1_15
Ltmp11:
LBB1_15:
	.loc	1 50 3
	bl	_outerSize
	subs	w8, w0, #4
	b.eq	LBB1_17
	b	LBB1_16
LBB1_16:
Ltmp12:
	.loc	1 51 5
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB1_18
LBB1_17:
	.loc	1 51 5
	b	LBB1_18
Ltmp13:
LBB1_18:
	.loc	1 0 5 is_stmt 0
	add	x8, sp, #20
	mov	w9, #7
Ltmp14:
	.loc	1 56 5 is_stmt 1
	str	w9, [sp, #20]
	.loc	1 57 5
	str	x8, [sp, #24]
	.loc	1 59 5
	ldr	x8, [sp, #24]
	ldr	w8, [x8]
	subs	w8, w8, #7
	b.eq	LBB1_20
	b	LBB1_19
LBB1_19:
Ltmp15:
	.loc	1 60 7
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB1_21
LBB1_20:
	.loc	1 60 7
	b	LBB1_21
Ltmp16:
LBB1_21:
	.loc	1 0 7 is_stmt 0
	mov	w8, wzr
	.loc	1 62 5 is_stmt 1
	tbz	w8, #0, LBB1_23
	b	LBB1_22
LBB1_22:
Ltmp17:
	.loc	1 63 7
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB1_24
LBB1_23:
	.loc	1 63 7
	b	LBB1_24
Ltmp18:
LBB1_24:
	.loc	1 74 5
	mov	w8, #3
	str	w8, [sp, #32]
	.loc	1 75 5
	mov	w8, #4
	str	w8, [sp, #36]
	.loc	1 76 5
	ldr	w8, [sp, #32]
	ldr	w9, [sp, #36]
	add	w8, w8, w9
	subs	w8, w8, #7
	b.eq	LBB1_26
	b	LBB1_25
LBB1_25:
Ltmp19:
	.loc	1 77 7
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB1_27
LBB1_26:
	.loc	1 77 7
	b	LBB1_27
Ltmp20:
LBB1_27:
	.loc	1 0 7 is_stmt 0
	mov	w8, wzr
	.loc	1 79 5 is_stmt 1
	tbz	w8, #0, LBB1_29
	b	LBB1_28
LBB1_28:
Ltmp21:
	.loc	1 80 7
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB1_30
LBB1_29:
	.loc	1 80 7
	b	LBB1_30
Ltmp22:
LBB1_30:
	.loc	1 0 7 is_stmt 0
	mov	w8, #5
Ltmp23:
	.loc	1 89 7 is_stmt 1
	str	x8, [sp, #40]
	.loc	1 91 7
	ldr	x8, [sp, #40]
	subs	x8, x8, #5
	b.eq	LBB1_32
	b	LBB1_31
LBB1_31:
Ltmp24:
	.loc	1 92 9
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB1_33
LBB1_32:
	.loc	1 92 9
	b	LBB1_33
Ltmp25:
LBB1_33:
	.loc	1 0 9 is_stmt 0
	mov	w8, wzr
	.loc	1 94 7 is_stmt 1
	tbz	w8, #0, LBB1_35
	b	LBB1_34
LBB1_34:
Ltmp26:
	.loc	1 95 9
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB1_36
LBB1_35:
	.loc	1 95 9
	b	LBB1_36
Ltmp27:
LBB1_36:
	.loc	1 100 3
	ldr	w8, [sp, #8]
	cbnz	w8, LBB1_38
	b	LBB1_37
LBB1_37:
Ltmp28:
	.loc	1 101 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	.loc	1 102 5
	mov	w0, wzr
	.loc	1 102 5 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #48]
	add	sp, sp, #64
	ret
LBB1_38:
	.loc	1 102 5 is_stmt 1
	b	LBB1_39
Ltmp29:
LBB1_39:
	.loc	1 104 3
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	.loc	1 105 3
	mov	w0, #1
	.loc	1 105 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #48]
	add	sp, sp, #64
	ret
Ltmp30:
Lfunc_end1:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"48.block_typedef.c PASS\n"

l___unnamed_2:
	.asciz	"48.block_typedef.c FAIL\n"

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
	.byte	0
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
	.byte	11
	.byte	1
	.byte	17
	.byte	1
	.byte	18
	.byte	6
	.byte	0
	.byte	0
	.byte	6
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
	.byte	7
	.byte	19
	.byte	1
	.byte	3
	.byte	14
	.byte	11
	.byte	11
	.ascii	"\210\001"
	.byte	15
	.byte	0
	.byte	0
	.byte	8
	.byte	13
	.byte	0
	.byte	3
	.byte	14
	.byte	73
	.byte	19
	.ascii	"\210\001"
	.byte	15
	.byte	56
	.byte	11
	.byte	0
	.byte	0
	.byte	9
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
	.long	23
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end1-Lfunc_begin0
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
	.byte	20
	.long	255

	.byte	3
	.quad	Lfunc_begin1
.set Lset5, Lfunc_end1-Lfunc_begin1
	.long	Lset5

	.byte	1
	.byte	111
	.long	42
	.long	42
	.byte	1
	.byte	22
	.long	255

	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	92
	.byte	1
	.byte	24
	.long	255
	.byte	4
	.byte	2
	.byte	145
	.byte	8
	.long	98
	.byte	1
	.byte	23
	.long	255
	.byte	5
	.quad	Ltmp5
.set Lset6, Ltmp9-Ltmp5
	.long	Lset6
	.byte	4
	.byte	2
	.byte	145
	.byte	19
	.long	80
	.byte	1
	.byte	36
	.long	311
	.byte	0
	.byte	5
	.quad	Ltmp14
.set Lset7, Ltmp18-Ltmp14
	.long	Lset7
	.byte	4
	.byte	2
	.byte	145
	.byte	24
	.long	71
	.byte	1
	.byte	57
	.long	299
	.byte	4
	.byte	2
	.byte	145
	.byte	20
	.long	78
	.byte	1
	.byte	56
	.long	255
	.byte	0
	.byte	5
	.quad	Ltmp18
.set Lset8, Ltmp22-Ltmp18
	.long	Lset8
	.byte	4
	.byte	2
	.byte	145
	.byte	32
	.long	58
	.byte	1
	.byte	72
	.long	269
	.byte	0
	.byte	5
	.quad	Ltmp23
.set Lset9, Ltmp27-Ltmp23
	.long	Lset9
	.byte	4
	.byte	2
	.byte	145
	.byte	40
	.long	51
	.byte	1
	.byte	89
	.long	262
	.byte	0
	.byte	0
	.byte	6
	.long	47
	.byte	5
	.byte	4
	.byte	6
	.long	53
	.byte	5
	.byte	8
	.byte	7
	.long	61
	.byte	8
	.byte	4
	.byte	8
	.long	67
	.long	255
	.byte	4
	.byte	0
	.byte	8
	.long	69
	.long	255
	.byte	4
	.byte	4
	.byte	0
	.byte	9
	.long	304
	.byte	6
	.long	73
	.byte	1
	.byte	0
	.byte	6
	.long	87
	.byte	6
	.byte	1
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"48.block_typedef.c"
	.asciz	"../tests"
	.asciz	"outerSize"
	.asciz	"main"
	.asciz	"int"
	.asciz	"w"
	.asciz	"long"
	.asciz	"pt"
	.asciz	"Point"
	.asciz	"x"
	.asciz	"y"
	.asciz	"p"
	.asciz	"void"
	.asciz	"v"
	.asciz	"narrow"
	.asciz	"char"
	.asciz	"outer"
	.asciz	"failed"
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
	.long	1130536847
.set Lset10, LNames1-Lnames_begin
	.long	Lset10
.set Lset11, LNames0-Lnames_begin
	.long	Lset11
LNames1:
	.long	42
	.long	1
	.long	71
	.long	0
LNames0:
	.long	32
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
	.long	5
	.long	5
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
	.long	1
	.long	2
	.long	4
	.long	2090838615
	.long	233133007
	.long	193495088
	.long	2090479413
	.long	2090147939
.set Lset12, Ltypes3-Ltypes_begin
	.long	Lset12
.set Lset13, Ltypes2-Ltypes_begin
	.long	Lset13
.set Lset14, Ltypes0-Ltypes_begin
	.long	Lset14
.set Lset15, Ltypes1-Ltypes_begin
	.long	Lset15
.set Lset16, Ltypes4-Ltypes_begin
	.long	Lset16
Ltypes3:
	.long	73
	.long	1
	.long	304
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	61
	.long	1
	.long	269
	.short	19
	.byte	0
	.long	0
Ltypes0:
	.long	47
	.long	1
	.long	255
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	53
	.long	1
	.long	262
	.short	36
	.byte	0
	.long	0
Ltypes4:
	.long	87
	.long	1
	.long	311
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
