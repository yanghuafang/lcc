	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_identity
	.p2align	2
_identity:
Lfunc_begin0:
	.file	1 "../tests" "47.paren_expr.c"
	.loc	1 20 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp1:
	.loc	1 20 5 prologue_end
	str	w0, [sp, #12]
	.loc	1 20 23 is_stmt 0
	ldr	w0, [sp, #12]
	.loc	1 20 23 epilogue_begin
	add	sp, sp, #16
	ret
Ltmp2:
Lfunc_end0:
	.cfi_endproc

	.globl	_addTwo
	.p2align	2
_addTwo:
Lfunc_begin1:
	.loc	1 22 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp4:
	.loc	1 22 5 prologue_end
	str	w0, [sp, #8]
	str	w1, [sp, #12]
	.loc	1 22 28 is_stmt 0
	ldr	w8, [sp, #8]
	ldr	w9, [sp, #12]
	add	w0, w8, w9
	.loc	1 22 28 epilogue_begin
	add	sp, sp, #16
	ret
Ltmp5:
Lfunc_end1:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin2:
	.loc	1 24 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]
	.cfi_def_cfa_offset 64
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #7
Ltmp6:
	.loc	1 25 3 prologue_end
	str	w8, [sp]
	.loc	1 26 3
	mov	w8, #3
	str	w8, [sp, #4]
	.loc	1 27 3
	mov	w8, #2
	str	w8, [sp, #8]
	.loc	1 28 3
	str	wzr, [sp, #12]
	.loc	1 29 3
	str	wzr, [sp, #16]
	.loc	1 31 3
	mov	x8, #3689348814741910323
	movk	x8, #16399, lsl #48
	fmov	d0, x8
	str	d0, [sp, #32]
	.loc	1 32 3
	str	xzr, [sp, #40]
	.loc	1 34 3
	mov	w8, #11
	str	w8, [sp, #20]
	.loc	1 35 3
	mov	w8, #22
	str	w8, [sp, #24]
	.loc	1 36 3
	mov	w8, #33
	str	w8, [sp, #28]
	.loc	1 39 3
	ldr	w8, [sp]
	str	w8, [sp, #12]
	.loc	1 40 3
	ldr	w8, [sp, #12]
	subs	w8, w8, #7
	b.eq	LBB2_2
	b	LBB2_1
LBB2_1:
Ltmp7:
	.loc	1 41 5
	mov	w8, #1
	str	w8, [sp, #16]
	b	LBB2_3
LBB2_2:
	.loc	1 41 5
	b	LBB2_3
Ltmp8:
LBB2_3:
	.loc	1 45 3
	ldr	w8, [sp]
	subs	w8, w8, #0
	b.le	LBB2_5
	b	LBB2_4
LBB2_4:
Ltmp9:
	.loc	1 46 5
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB2_6
Ltmp10:
LBB2_5:
	.loc	1 48 5
	str	wzr, [sp, #12]
	b	LBB2_6
Ltmp11:
LBB2_6:
	.loc	1 50 3
	ldr	w8, [sp, #12]
	subs	w8, w8, #1
	b.eq	LBB2_8
	b	LBB2_7
LBB2_7:
Ltmp12:
	.loc	1 51 5
	mov	w8, #1
	str	w8, [sp, #16]
	b	LBB2_9
LBB2_8:
	.loc	1 51 5
	b	LBB2_9
Ltmp13:
LBB2_9:
	.loc	1 53 3
	ldr	w8, [sp]
	subs	w8, w8, #7
	b.ne	LBB2_11
	b	LBB2_10
LBB2_10:
Ltmp14:
	.loc	1 54 5
	mov	w8, #2
	str	w8, [sp, #12]
	b	LBB2_12
Ltmp15:
LBB2_11:
	.loc	1 56 5
	str	wzr, [sp, #12]
	b	LBB2_12
Ltmp16:
LBB2_12:
	.loc	1 58 3
	ldr	w8, [sp, #12]
	subs	w8, w8, #2
	b.eq	LBB2_14
	b	LBB2_13
LBB2_13:
Ltmp17:
	.loc	1 59 5
	mov	w8, #1
	str	w8, [sp, #16]
	b	LBB2_15
LBB2_14:
	.loc	1 59 5
	b	LBB2_15
Ltmp18:
LBB2_15:
	.loc	1 63 3
	ldr	w0, [sp]
	bl	_identity
	subs	w8, w0, #7
	b.eq	LBB2_17
	b	LBB2_16
LBB2_16:
Ltmp19:
	.loc	1 64 5
	mov	w8, #1
	str	w8, [sp, #16]
	b	LBB2_18
LBB2_17:
	.loc	1 64 5
	b	LBB2_18
Ltmp20:
LBB2_18:
	.loc	1 66 3
	ldr	w0, [sp]
	ldr	w1, [sp, #4]
	bl	_addTwo
	subs	w8, w0, #10
	b.eq	LBB2_20
	b	LBB2_19
LBB2_19:
Ltmp21:
	.loc	1 67 5
	mov	w8, #1
	str	w8, [sp, #16]
	b	LBB2_21
LBB2_20:
	.loc	1 67 5
	b	LBB2_21
Ltmp22:
LBB2_21:
	.loc	1 71 3
	ldr	w8, [sp]
	subs	w8, w8, #7
	b.eq	LBB2_23
	b	LBB2_22
LBB2_22:
Ltmp23:
	.loc	1 72 5
	mov	w8, #1
	str	w8, [sp, #16]
	b	LBB2_24
LBB2_23:
	.loc	1 72 5
	b	LBB2_24
Ltmp24:
LBB2_24:
	.loc	1 74 3
	ldrsw	x9, [sp, #8]
	add	x8, sp, #20
	ldr	w8, [x8, x9, lsl #2]
	subs	w8, w8, #33
	b.eq	LBB2_26
	b	LBB2_25
LBB2_25:
Ltmp25:
	.loc	1 75 5
	mov	w8, #1
	str	w8, [sp, #16]
	b	LBB2_27
LBB2_26:
	.loc	1 75 5
	b	LBB2_27
Ltmp26:
LBB2_27:
	.loc	1 79 3
	ldr	w8, [sp]
	mov	w9, #7
	sdiv	w8, w8, w9
	subs	w8, w8, #1
	b.eq	LBB2_29
	b	LBB2_28
LBB2_28:
Ltmp27:
	.loc	1 80 5
	mov	w8, #1
	str	w8, [sp, #16]
	b	LBB2_30
LBB2_29:
	.loc	1 80 5
	b	LBB2_30
Ltmp28:
LBB2_30:
	.loc	1 82 3
	ldr	w8, [sp]
	mov	w10, #4
	sdiv	w9, w8, w10
	mul	w9, w9, w10
	subs	w8, w8, w9
	subs	w8, w8, #3
	b.eq	LBB2_32
	b	LBB2_31
LBB2_31:
Ltmp29:
	.loc	1 83 5
	mov	w8, #1
	str	w8, [sp, #16]
	b	LBB2_33
LBB2_32:
	.loc	1 83 5
	b	LBB2_33
Ltmp30:
LBB2_33:
	.loc	1 85 3
	ldr	w8, [sp, #4]
	lsl	w8, w8, #1
	subs	w8, w8, #6
	b.eq	LBB2_35
	b	LBB2_34
LBB2_34:
Ltmp31:
	.loc	1 86 5
	mov	w8, #1
	str	w8, [sp, #16]
	b	LBB2_36
LBB2_35:
	.loc	1 86 5
	b	LBB2_36
Ltmp32:
LBB2_36:
	.loc	1 90 3
	ldr	w8, [sp, #4]
	ldr	w9, [sp]
	add	w8, w8, w9
	str	w8, [sp, #12]
	.loc	1 91 3
	ldr	w8, [sp, #12]
	subs	w8, w8, #10
	b.eq	LBB2_38
	b	LBB2_37
LBB2_37:
Ltmp33:
	.loc	1 92 5
	mov	w8, #1
	str	w8, [sp, #16]
	b	LBB2_39
LBB2_38:
	.loc	1 92 5
	b	LBB2_39
Ltmp34:
LBB2_39:
	.loc	1 96 3
	ldr	d0, [sp, #32]
	fcvtzs	w8, d0
	subs	w8, w8, #3
	b.eq	LBB2_41
	b	LBB2_40
LBB2_40:
Ltmp35:
	.loc	1 97 5
	mov	w8, #1
	str	w8, [sp, #16]
	b	LBB2_42
LBB2_41:
	.loc	1 97 5
	b	LBB2_42
Ltmp36:
LBB2_42:
	.loc	1 99 3
	ldrsw	x8, [sp]
	str	x8, [sp, #40]
	.loc	1 100 3
	ldr	x8, [sp, #40]
	subs	w8, w8, #7
	b.eq	LBB2_44
	b	LBB2_43
LBB2_43:
Ltmp37:
	.loc	1 101 5
	mov	w8, #1
	str	w8, [sp, #16]
	b	LBB2_45
LBB2_44:
	.loc	1 101 5
	b	LBB2_45
Ltmp38:
LBB2_45:
	.loc	1 103 3
	ldrsw	x8, [sp, #4]
	subs	w8, w8, #3
	b.eq	LBB2_47
	b	LBB2_46
LBB2_46:
Ltmp39:
	.loc	1 104 5
	mov	w8, #1
	str	w8, [sp, #16]
	b	LBB2_48
LBB2_47:
	.loc	1 104 5
	b	LBB2_48
Ltmp40:
LBB2_48:
	.loc	1 107 3
	ldr	w8, [sp, #16]
	cbnz	w8, LBB2_50
	b	LBB2_49
LBB2_49:
Ltmp41:
	.loc	1 108 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	.loc	1 109 5
	mov	w0, wzr
	.loc	1 109 5 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #48]
	add	sp, sp, #64
	ret
LBB2_50:
	.loc	1 109 5 is_stmt 1
	b	LBB2_51
Ltmp42:
LBB2_51:
	.loc	1 111 3
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	.loc	1 112 3
	mov	w0, #1
	.loc	1 112 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #48]
	add	sp, sp, #64
	ret
Ltmp43:
Lfunc_end2:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"47.paren_expr.c PASS\n"

l___unnamed_2:
	.asciz	"47.paren_expr.c FAIL\n"

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
	.byte	1
	.byte	1
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	7
	.byte	33
	.byte	0
	.byte	73
	.byte	19
	.byte	55
	.byte	11
	.byte	0
	.byte	0
	.byte	8
	.byte	36
	.byte	0
	.byte	3
	.byte	14
	.byte	11
	.byte	11
	.byte	62
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
.set Lset3, Lfunc_end2-Lfunc_begin0
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
	.byte	20
	.long	286

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	54
	.byte	1
	.byte	20
	.long	286
	.byte	0
	.byte	2
	.quad	Lfunc_begin1
.set Lset5, Lfunc_end1-Lfunc_begin1
	.long	Lset5

	.byte	1
	.byte	111
	.long	38
	.long	38
	.byte	1
	.byte	22
	.long	286

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	54
	.byte	1
	.byte	22
	.long	286
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	56
	.byte	1
	.byte	22
	.long	286
	.byte	0
	.byte	2
	.quad	Lfunc_begin2
.set Lset6, Lfunc_end2-Lfunc_begin2
	.long	Lset6

	.byte	1
	.byte	111
	.long	45
	.long	45
	.byte	1
	.byte	24
	.long	286

	.byte	4
	.byte	2
	.byte	145
	.byte	40
	.long	58
	.byte	1
	.byte	32
	.long	293
	.byte	4
	.byte	2
	.byte	145
	.byte	32
	.long	65
	.byte	1
	.byte	31
	.long	300
	.byte	4
	.byte	2
	.byte	145
	.byte	20
	.long	74
	.byte	1
	.byte	30
	.long	307
	.byte	4
	.byte	2
	.byte	145
	.byte	16
	.long	98
	.byte	1
	.byte	29
	.long	286
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	105
	.byte	1
	.byte	28
	.long	286
	.byte	4
	.byte	2
	.byte	145
	.byte	8
	.long	107
	.byte	1
	.byte	27
	.long	286
	.byte	4
	.byte	2
	.byte	145
	.byte	4
	.long	109
	.byte	1
	.byte	26
	.long	286
	.byte	4
	.byte	2
	.byte	145
	.byte	0
	.long	111
	.byte	1
	.byte	25
	.long	286
	.byte	0
	.byte	5
	.long	50
	.byte	5
	.byte	4
	.byte	5
	.long	60
	.byte	5
	.byte	8
	.byte	5
	.long	67
	.byte	4
	.byte	8
	.byte	6
	.long	286
	.byte	7
	.long	319
	.byte	3
	.byte	0
	.byte	8
	.long	78
	.byte	8
	.byte	7
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"47.paren_expr.c"
	.asciz	"../tests"
	.asciz	"identity"
	.asciz	"addTwo"
	.asciz	"main"
	.asciz	"int"
	.asciz	"x"
	.asciz	"y"
	.asciz	"s"
	.asciz	"long"
	.asciz	"d"
	.asciz	"double"
	.asciz	"arr"
	.asciz	"__ARRAY_SIZE_TYPE__"
	.asciz	"failed"
	.asciz	"r"
	.asciz	"i"
	.asciz	"b"
	.asciz	"a"
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	3
	.long	3
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	-1
	.long	0
	.long	1
	.long	2090499946
	.long	1746161327
	.long	-244496600
.set Lset7, LNames2-Lnames_begin
	.long	Lset7
.set Lset8, LNames0-Lnames_begin
	.long	Lset8
.set Lset9, LNames1-Lnames_begin
	.long	Lset9
LNames2:
	.long	45
	.long	1
	.long	144
	.long	0
LNames0:
	.long	29
	.long	1
	.long	42
	.long	0
LNames1:
	.long	38
	.long	1
	.long	86
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
	.long	2
	.long	-1
	.long	3
	.long	193495088
	.long	-113419488
	.long	2090479413
	.long	-594775205
.set Lset10, Ltypes0-Ltypes_begin
	.long	Lset10
.set Lset11, Ltypes2-Ltypes_begin
	.long	Lset11
.set Lset12, Ltypes1-Ltypes_begin
	.long	Lset12
.set Lset13, Ltypes3-Ltypes_begin
	.long	Lset13
Ltypes0:
	.long	50
	.long	1
	.long	286
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	67
	.long	1
	.long	300
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	60
	.long	1
	.long	293
	.short	36
	.byte	0
	.long	0
Ltypes3:
	.long	78
	.long	1
	.long	319
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
