	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "44.token_adjacency.c"
	.loc	1 25 0
	.cfi_startproc
	sub	sp, sp, #112
	stp	x29, x30, [sp, #96]
	.cfi_def_cfa_offset 112
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp0:
	.loc	1 26 3 prologue_end
	str	wzr, [sp, #8]
	.loc	1 31 3
	mov	w8, #5
	str	w8, [sp, #12]
	.loc	1 32 3
	ldr	w8, [sp, #12]
	subs	w8, w8, #1
	subs	w8, w8, #4
	b.eq	LBB0_2
	b	LBB0_1
LBB0_1:
	.loc	1 32 17 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_3
LBB0_2:
	b	LBB0_3
LBB0_3:
	.loc	1 33 3 is_stmt 1
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	subs	w8, w8, #6
	b.eq	LBB0_5
	b	LBB0_4
LBB0_4:
	.loc	1 33 17 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_6
LBB0_5:
	b	LBB0_6
LBB0_6:
	.loc	1 0 17
	mov	w8, wzr
	.loc	1 34 3 is_stmt 1
	tbz	w8, #0, LBB0_8
	b	LBB0_7
LBB0_7:
	.loc	1 34 18 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_9
LBB0_8:
	b	LBB0_9
LBB0_9:
	.loc	1 0 18
	mov	w8, wzr
	.loc	1 35 3 is_stmt 1
	tbz	w8, #0, LBB0_11
	b	LBB0_10
LBB0_10:
	.loc	1 35 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_12
LBB0_11:
	b	LBB0_12
LBB0_12:
	.loc	1 0 19
	add	x8, sp, #16
	.loc	1 38 3 is_stmt 1
	mov	w9, #10
	str	w9, [sp, #16]
	mov	w9, #20
	str	w9, [sp, #20]
	mov	w9, #30
	str	w9, [sp, #24]
	mov	w9, #40
	str	w9, [sp, #28]
	.loc	1 39 3
	mov	w9, #3
	str	w9, [sp, #32]
	.loc	1 40 3
	ldr	w9, [sp, #32]
	subs	w9, w9, #1
	ldr	w8, [x8, w9, sxtw #2]
	subs	w8, w8, #30
	b.eq	LBB0_14
	b	LBB0_13
LBB0_13:
	.loc	1 40 23 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_15
LBB0_14:
	b	LBB0_15
LBB0_15:
	.loc	1 41 3 is_stmt 1
	ldr	w8, [sp, #32]
	subs	w9, w8, #3
	add	x8, sp, #16
	ldr	w8, [x8, w9, sxtw #2]
	subs	w8, w8, #10
	b.eq	LBB0_17
	b	LBB0_16
LBB0_16:
	.loc	1 41 23 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_18
LBB0_17:
	b	LBB0_18
LBB0_18:
	.loc	1 44 3 is_stmt 1
	mov	w8, #32
	str	w8, [sp, #36]
	.loc	1 45 3
	ldr	w8, [sp, #36]
	subs	w8, w8, #16
	subs	w8, w8, #16
	b.eq	LBB0_20
	b	LBB0_19
LBB0_19:
	.loc	1 45 21 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_21
LBB0_20:
	b	LBB0_21
LBB0_21:
	.loc	1 46 3 is_stmt 1
	mov	w8, #32
	str	x8, [sp, #40]
	.loc	1 47 3
	ldr	x8, [sp, #40]
	subs	x8, x8, #16
	subs	x8, x8, #16
	b.eq	LBB0_23
	b	LBB0_22
LBB0_22:
	.loc	1 47 23 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_24
LBB0_23:
	b	LBB0_24
LBB0_24:
	.loc	1 50 3 is_stmt 1
	mov	w8, #5
	str	w8, [sp, #52]
	.loc	1 51 3
	ldr	w8, [sp, #52]
	add	w8, w8, #1
	subs	w8, w8, #6
	b.eq	LBB0_26
	b	LBB0_25
LBB0_25:
	.loc	1 51 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_27
LBB0_26:
	b	LBB0_27
LBB0_27:
	.loc	1 52 3 is_stmt 1
	mov	w8, #5
	str	x8, [sp, #56]
	.loc	1 53 3
	ldr	x8, [sp, #56]
	subs	x8, x8, #1
	subs	x8, x8, #4
	b.eq	LBB0_29
	b	LBB0_28
LBB0_28:
	.loc	1 53 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_30
LBB0_29:
	b	LBB0_30
LBB0_30:
	.loc	1 54 3 is_stmt 1
	mov	w8, #5
	str	x8, [sp, #64]
	.loc	1 55 3
	ldr	x8, [sp, #64]
	add	x8, x8, #1
	subs	x8, x8, #6
	b.eq	LBB0_32
	b	LBB0_31
LBB0_31:
	.loc	1 55 21 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_33
LBB0_32:
	b	LBB0_33
LBB0_33:
	.loc	1 59 3 is_stmt 1
	fmov	d0, #5.00000000
	str	d0, [sp, #72]
	.loc	1 60 3
	ldr	d0, [sp, #72]
	fmov	d1, #1.50000000
	fsub	d0, d0, d1
	fmov	d1, #3.50000000
	fcmp	d0, d1
	b.eq	LBB0_35
	b.vs	LBB0_35
	b	LBB0_34
LBB0_34:
	.loc	1 60 21 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_36
LBB0_35:
	b	LBB0_36
LBB0_36:
	.loc	1 61 3 is_stmt 1
	ldr	d0, [sp, #72]
	fmov	d1, #1.50000000
	fadd	d0, d0, d1
	fmov	d1, #6.50000000
	fcmp	d0, d1
	b.eq	LBB0_38
	b.vs	LBB0_38
	b	LBB0_37
LBB0_37:
	.loc	1 61 21 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_39
LBB0_38:
	b	LBB0_39
LBB0_39:
	.loc	1 62 3 is_stmt 1
	fmov	s0, #5.00000000
	str	s0, [sp, #80]
	.loc	1 63 3
	ldr	s0, [sp, #80]
	fcvt	d0, s0
	fmov	d1, #1.50000000
	fsub	d0, d0, d1
	fmov	d1, #3.50000000
	fcmp	d0, d1
	b.eq	LBB0_41
	b.vs	LBB0_41
	b	LBB0_40
LBB0_40:
	.loc	1 63 23 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_42
LBB0_41:
	b	LBB0_42
LBB0_42:
	.loc	1 0 23
	mov	w8, wzr
	.loc	1 68 3 is_stmt 1
	tbz	w8, #0, LBB0_44
	b	LBB0_43
LBB0_43:
	.loc	1 68 20 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_45
LBB0_44:
	b	LBB0_45
LBB0_45:
	.loc	1 0 20
	mov	w8, wzr
	.loc	1 69 3 is_stmt 1
	tbz	w8, #0, LBB0_47
	b	LBB0_46
LBB0_46:
	.loc	1 69 22 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_48
LBB0_47:
	b	LBB0_48
LBB0_48:
	.loc	1 0 22
	mov	w8, wzr
	.loc	1 70 3 is_stmt 1
	tbz	w8, #0, LBB0_50
	b	LBB0_49
LBB0_49:
	.loc	1 70 22 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_51
LBB0_50:
	b	LBB0_51
LBB0_51:
	.loc	1 73 3 is_stmt 1
	ldr	w9, [sp, #12]
	mov	w8, wzr
	subs	w9, w8, w9
	mov	w8, #-10
	subs	w8, w8, w9, lsl #1
	b.eq	LBB0_53
	b	LBB0_52
LBB0_52:
	.loc	1 73 20 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_54
LBB0_53:
	b	LBB0_54
LBB0_54:
	.loc	1 0 20
	mov	w8, #-1
	.loc	1 81 3 is_stmt 1
	str	w8, [sp, #84]
	.loc	1 82 3
	str	wzr, [sp, #88]
	.loc	1 83 3
	mov	w8, #1
	str	w8, [sp, #92]
	.loc	1 84 3
	ldr	w8, [sp, #84]
	adds	w8, w8, #1
	b.eq	LBB0_56
	b	LBB0_55
LBB0_55:
	.loc	1 84 18 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_57
LBB0_56:
	b	LBB0_57
LBB0_57:
	.loc	1 85 3 is_stmt 1
	ldr	w8, [sp, #88]
	cbz	w8, LBB0_59
	b	LBB0_58
LBB0_58:
	.loc	1 85 18 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_60
LBB0_59:
	b	LBB0_60
LBB0_60:
	.loc	1 86 3 is_stmt 1
	ldr	w8, [sp, #92]
	subs	w8, w8, #1
	b.eq	LBB0_62
	b	LBB0_61
LBB0_61:
	.loc	1 86 17 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_63
LBB0_62:
	b	LBB0_63
LBB0_63:
	.loc	1 88 3 is_stmt 1
	ldr	w8, [sp, #8]
	cbnz	w8, LBB0_65
	b	LBB0_64
LBB0_64:
Ltmp1:
	.loc	1 89 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB0_66
Ltmp2:
LBB0_65:
	.loc	1 91 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB0_66
Ltmp3:
LBB0_66:
	.loc	1 93 3
	ldr	w0, [sp, #8]
	.loc	1 93 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #96]
	add	sp, sp, #112
	ret
Ltmp4:
Lfunc_end0:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"44.token_adjacency.c PASS\n"

l___unnamed_2:
	.asciz	"44.token_adjacency.c FAIL\n"

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
	.byte	5
	.byte	1
	.byte	1
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	6
	.byte	33
	.byte	0
	.byte	73
	.byte	19
	.byte	55
	.byte	11
	.byte	0
	.byte	0
	.byte	7
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
	.long	25
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end0-Lfunc_begin0
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
	.byte	25
	.long	274

	.byte	3
	.byte	3
	.byte	145
	.asciz	"\334"
	.long	43
	.byte	1
	.byte	83
	.long	274
	.byte	3
	.byte	3
	.byte	145
	.asciz	"\330"
	.long	47
	.byte	1
	.byte	82
	.long	274
	.byte	3
	.byte	3
	.byte	145
	.asciz	"\324"
	.long	52
	.byte	1
	.byte	81
	.long	274
	.byte	3
	.byte	3
	.byte	145
	.asciz	"\320"
	.long	56
	.byte	1
	.byte	62
	.long	281
	.byte	3
	.byte	3
	.byte	145
	.asciz	"\310"
	.long	64
	.byte	1
	.byte	59
	.long	288
	.byte	3
	.byte	3
	.byte	145
	.asciz	"\300"
	.long	73
	.byte	1
	.byte	54
	.long	295
	.byte	3
	.byte	2
	.byte	145
	.byte	56
	.long	91
	.byte	1
	.byte	52
	.long	302
	.byte	3
	.byte	2
	.byte	145
	.byte	52
	.long	99
	.byte	1
	.byte	50
	.long	309
	.byte	3
	.byte	2
	.byte	145
	.byte	40
	.long	115
	.byte	1
	.byte	46
	.long	302
	.byte	3
	.byte	2
	.byte	145
	.byte	36
	.long	118
	.byte	1
	.byte	44
	.long	274
	.byte	3
	.byte	2
	.byte	145
	.byte	32
	.long	120
	.byte	1
	.byte	39
	.long	274
	.byte	3
	.byte	2
	.byte	145
	.byte	16
	.long	122
	.byte	1
	.byte	38
	.long	316
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	146
	.byte	1
	.byte	31
	.long	274
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	148
	.byte	1
	.byte	26
	.long	274
	.byte	0
	.byte	4
	.long	39
	.byte	5
	.byte	4
	.byte	4
	.long	58
	.byte	4
	.byte	4
	.byte	4
	.long	66
	.byte	4
	.byte	8
	.byte	4
	.long	77
	.byte	7
	.byte	8
	.byte	4
	.long	94
	.byte	5
	.byte	8
	.byte	4
	.long	102
	.byte	7
	.byte	4
	.byte	5
	.long	274
	.byte	6
	.long	328
	.byte	4
	.byte	0
	.byte	7
	.long	126
	.byte	8
	.byte	7
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"44.token_adjacency.c"
	.asciz	"../tests"
	.asciz	"main"
	.asciz	"int"
	.asciz	"pos"
	.asciz	"zero"
	.asciz	"neg"
	.asciz	"f"
	.asciz	"float"
	.asciz	"d"
	.asciz	"double"
	.asciz	"ulv"
	.asciz	"unsigned long"
	.asciz	"lv"
	.asciz	"long"
	.asciz	"ui"
	.asciz	"unsigned int"
	.asciz	"hl"
	.asciz	"h"
	.asciz	"n"
	.asciz	"arr"
	.asciz	"__ARRAY_SIZE_TYPE__"
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
	.long	7
	.long	7
	.long	20
	.long	0
	.long	3
	.short	1
	.short	6
	.short	3
	.short	5
	.short	4
	.short	11
	.long	-1
	.long	0
	.long	3
	.long	4
	.long	5
	.long	-1
	.long	6
	.long	259121563
	.long	2090479413
	.long	-594775205
	.long	-103762318
	.long	193495088
	.long	-113419488
	.long	-1304652851
.set Lset6, Ltypes1-Ltypes_begin
	.long	Lset6
.set Lset7, Ltypes4-Ltypes_begin
	.long	Lset7
.set Lset8, Ltypes6-Ltypes_begin
	.long	Lset8
.set Lset9, Ltypes3-Ltypes_begin
	.long	Lset9
.set Lset10, Ltypes0-Ltypes_begin
	.long	Lset10
.set Lset11, Ltypes2-Ltypes_begin
	.long	Lset11
.set Lset12, Ltypes5-Ltypes_begin
	.long	Lset12
Ltypes1:
	.long	58
	.long	1
	.long	281
	.short	36
	.byte	0
	.long	0
Ltypes4:
	.long	94
	.long	1
	.long	302
	.short	36
	.byte	0
	.long	0
Ltypes6:
	.long	126
	.long	1
	.long	328
	.short	36
	.byte	0
	.long	0
Ltypes3:
	.long	77
	.long	1
	.long	295
	.short	36
	.byte	0
	.long	0
Ltypes0:
	.long	39
	.long	1
	.long	274
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	66
	.long	1
	.long	288
	.short	36
	.byte	0
	.long	0
Ltypes5:
	.long	102
	.long	1
	.long	309
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
