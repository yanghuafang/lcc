	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_subFunc
	.p2align	2
_subFunc:
Lfunc_begin0:
	.file	1 "../tests" "26.operator_precedence.c"
	.loc	1 6 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp1:
	.loc	1 6 6 prologue_end
	str	w0, [sp, #12]
	.loc	1 6 6 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp2:
Lfunc_end0:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin1:
	.loc	1 8 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #112
	stp	x29, x30, [sp, #96]
	.cfi_def_cfa_offset 112
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x9, #22136
	movk	x9, #4660, lsl #16
	orr	x9, x9, x9, lsl #32
	mov	x8, #57072
	movk	x8, #39612, lsl #16
	orr	x8, x8, x8, lsl #32
	str	x8, [sp]
Ltmp3:
	.loc	1 9 3 prologue_end
	str	wzr, [sp, #12]
	add	x10, sp, #16
	.loc	1 11 3
	str	x9, [sp, #16]
	.loc	1 12 3
	str	x8, [sp, #24]
	add	x8, sp, #32
	.loc	1 13 3
	str	x10, [sp, #32]
	.loc	1 14 3
	ldr	x10, [sp, #16]
	and	x8, x8, x10
	ldr	x10, [sp, #24]
	and	x8, x8, x10
	str	x8, [sp, #40]
	.loc	1 15 3
	ldr	x8, [sp, #16]
	subs	x8, x8, x9
	b.eq	LBB1_2
	b	LBB1_1
LBB1_1:
	.loc	1 15 32 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB1_3
LBB1_2:
	b	LBB1_3
LBB1_3:
	.loc	1 0 32
	ldr	x9, [sp]
	.loc	1 16 3 is_stmt 1
	ldr	x8, [sp, #24]
	subs	x8, x8, x9
	b.eq	LBB1_5
	b	LBB1_4
LBB1_4:
	.loc	1 16 32 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB1_6
LBB1_5:
	b	LBB1_6
LBB1_6:
	.loc	1 18 3 is_stmt 1
	mov	w8, #13
	str	w8, [sp, #48]
	.loc	1 19 3
	ldr	w8, [sp, #48]
	add	w8, w8, #3
	subs	w8, w8, #16
	b.eq	LBB1_8
	b	LBB1_7
LBB1_7:
	.loc	1 19 25 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB1_9
LBB1_8:
	b	LBB1_9
LBB1_9:
	.loc	1 20 3 is_stmt 1
	ldr	w9, [sp, #48]
	mov	w8, #3
	subs	w8, w8, w9
	adds	w8, w8, #10
	b.eq	LBB1_11
	b	LBB1_10
LBB1_10:
	.loc	1 20 26 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB1_12
LBB1_11:
	b	LBB1_12
LBB1_12:
	.loc	1 0 26
	mov	w8, wzr
	.loc	1 21 3 is_stmt 1
	tbz	w8, #0, LBB1_14
	b	LBB1_13
LBB1_13:
	.loc	1 21 22 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB1_15
LBB1_14:
	b	LBB1_15
LBB1_15:
	.loc	1 0 22
	mov	w8, wzr
	.loc	1 22 3 is_stmt 1
	tbz	w8, #0, LBB1_17
	b	LBB1_16
LBB1_16:
	.loc	1 22 23 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB1_18
LBB1_17:
	b	LBB1_18
LBB1_18:
	.loc	1 24 3 is_stmt 1
	mov	w8, #13
	str	w8, [sp, #52]
	.loc	1 25 3
	ldr	w9, [sp, #52]
	mov	w8, wzr
	subs	w9, w8, w9
	mov	w8, #3
	subs	w8, w8, w9
	subs	w8, w8, #16
	b.eq	LBB1_20
	b	LBB1_19
LBB1_19:
	.loc	1 25 26 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB1_21
LBB1_20:
	b	LBB1_21
LBB1_21:
	.loc	1 0 26
	mov	w8, wzr
	.loc	1 26 3 is_stmt 1
	tbz	w8, #0, LBB1_23
	b	LBB1_22
LBB1_22:
	.loc	1 26 22 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB1_24
LBB1_23:
	b	LBB1_24
LBB1_24:
	.loc	1 28 3 is_stmt 1
	mov	w8, #3
	str	w8, [sp, #56]
	add	x8, sp, #60
	.loc	1 29 3
	mov	w9, #4
	str	w9, [sp, #60]
	.loc	1 30 3
	str	x8, [sp, #64]
	.loc	1 31 3
	ldr	w8, [sp, #56]
	ldr	w9, [sp, #60]
	mul	w8, w8, w9
	ldr	x9, [sp, #64]
	ldr	w9, [x9]
	mul	w8, w8, w9
	subs	w8, w8, #48
	b.eq	LBB1_26
	b	LBB1_25
LBB1_25:
	.loc	1 31 34 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB1_27
LBB1_26:
	b	LBB1_27
LBB1_27:
	.loc	1 33 3 is_stmt 1
	mov	w8, #1234
	str	x8, [sp, #72]
	.loc	1 34 3
	ldr	x8, [sp, #72]
	mov	w0, w8
	bl	_subFunc
	.loc	1 35 3
	ldr	x8, [sp, #72]
	subs	w8, w8, #1234
	b.eq	LBB1_29
	b	LBB1_28
LBB1_28:
	.loc	1 35 27 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB1_30
LBB1_29:
	b	LBB1_30
LBB1_30:
	.loc	1 37 3 is_stmt 1
	mov	w8, #10
	str	w8, [sp, #80]
	.loc	1 38 3
	ldr	w8, [sp, #80]
	add	w8, w8, #1
	str	w8, [sp, #80]
	ldr	w8, [sp, #80]
	add	w9, w8, #1
	str	w9, [sp, #80]
	str	w8, [sp, #84]
	.loc	1 39 3
	ldr	w8, [sp, #80]
	subs	w8, w8, #12
	b.eq	LBB1_32
	b	LBB1_31
LBB1_31:
	.loc	1 39 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB1_33
LBB1_32:
	b	LBB1_33
LBB1_33:
	.loc	1 40 3 is_stmt 1
	ldr	w8, [sp, #84]
	subs	w8, w8, #11
	b.eq	LBB1_35
	b	LBB1_34
LBB1_34:
	.loc	1 40 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB1_36
LBB1_35:
	b	LBB1_36
LBB1_36:
	.loc	1 42 3 is_stmt 1
	mov	w8, #10
	str	w8, [sp, #88]
	.loc	1 43 3
	ldr	w8, [sp, #88]
	subs	w8, w8, #1
	str	w8, [sp, #88]
	ldr	w8, [sp, #88]
	subs	w9, w8, #1
	str	w9, [sp, #88]
	str	w8, [sp, #92]
	.loc	1 44 3
	ldr	w8, [sp, #88]
	subs	w8, w8, #8
	b.eq	LBB1_38
	b	LBB1_37
LBB1_37:
	.loc	1 44 18 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB1_39
LBB1_38:
	b	LBB1_39
LBB1_39:
	.loc	1 45 3 is_stmt 1
	ldr	w8, [sp, #92]
	subs	w8, w8, #9
	b.eq	LBB1_41
	b	LBB1_40
LBB1_40:
	.loc	1 45 18 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB1_42
LBB1_41:
	b	LBB1_42
LBB1_42:
	.loc	1 47 3 is_stmt 1
	ldr	w8, [sp, #12]
	cbnz	w8, LBB1_44
	b	LBB1_43
LBB1_43:
Ltmp4:
	.loc	1 48 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB1_45
Ltmp5:
LBB1_44:
	.loc	1 50 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB1_45
Ltmp6:
LBB1_45:
	.loc	1 52 3
	ldr	w0, [sp, #12]
	.loc	1 52 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #96]
	add	sp, sp, #112
	ret
Ltmp7:
Lfunc_end1:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"26.operator_precedence.c PASS\n"

l___unnamed_2:
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
	.byte	6
	.long	332

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	60
	.byte	1
	.byte	6
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
	.byte	8
	.long	339

	.byte	4
	.byte	3
	.byte	145
	.asciz	"\334"
	.long	62
	.byte	1
	.byte	43
	.long	339
	.byte	4
	.byte	3
	.byte	145
	.asciz	"\330"
	.long	67
	.byte	1
	.byte	42
	.long	339
	.byte	4
	.byte	3
	.byte	145
	.asciz	"\324"
	.long	72
	.byte	1
	.byte	38
	.long	339
	.byte	4
	.byte	3
	.byte	145
	.asciz	"\320"
	.long	77
	.byte	1
	.byte	37
	.long	339
	.byte	4
	.byte	3
	.byte	145
	.asciz	"\310"
	.long	82
	.byte	1
	.byte	33
	.long	346
	.byte	4
	.byte	3
	.byte	145
	.asciz	"\300"
	.long	93
	.byte	1
	.byte	30
	.long	353
	.byte	4
	.byte	2
	.byte	145
	.byte	60
	.long	98
	.byte	1
	.byte	29
	.long	339
	.byte	4
	.byte	2
	.byte	145
	.byte	56
	.long	103
	.byte	1
	.byte	28
	.long	339
	.byte	4
	.byte	2
	.byte	145
	.byte	52
	.long	108
	.byte	1
	.byte	24
	.long	339
	.byte	4
	.byte	2
	.byte	145
	.byte	48
	.long	115
	.byte	1
	.byte	18
	.long	339
	.byte	4
	.byte	2
	.byte	145
	.byte	40
	.long	121
	.byte	1
	.byte	14
	.long	358
	.byte	4
	.byte	2
	.byte	145
	.byte	32
	.long	137
	.byte	1
	.byte	13
	.long	358
	.byte	4
	.byte	2
	.byte	145
	.byte	24
	.long	139
	.byte	1
	.byte	12
	.long	358
	.byte	4
	.byte	2
	.byte	145
	.byte	16
	.long	141
	.byte	1
	.byte	11
	.long	358
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	143
	.byte	1
	.byte	9
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
