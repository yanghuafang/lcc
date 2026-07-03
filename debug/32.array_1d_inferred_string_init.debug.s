	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "32.array_1d_inferred_string_init.c"
	.loc	1 7 0
	.cfi_startproc
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp0:
	.loc	1 8 3 prologue_end
	str	wzr, [sp, #4]
	mov	w8, #1
	.loc	1 9 3
	str	w8, [sp, #8]
	mov	w8, #2
	str	w8, [sp, #12]
	mov	w8, #3
	str	w8, [sp, #16]
	mov	w11, #104
	.loc	1 10 3
	strb	w11, [sp, #20]
	mov	w10, #101
	strb	w10, [sp, #21]
	mov	w9, #108
	strb	w9, [sp, #22]
	strb	w9, [sp, #23]
	mov	w8, #111
	strb	w8, [sp, #24]
	strb	wzr, [sp, #25]
	.loc	1 11 3
	strb	w11, [sp, #26]
	strb	w10, [sp, #27]
	strb	w9, [sp, #28]
	strb	w9, [sp, #29]
	strb	w8, [sp, #30]
	strb	wzr, [sp, #31]
	.loc	1 13 3
	ldr	w8, [sp, #8]
	subs	w8, w8, #1
	b.eq	LBB0_2
	b	LBB0_1
LBB0_1:
	.loc	1 13 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_3
LBB0_2:
	b	LBB0_3
LBB0_3:
	.loc	1 14 3 is_stmt 1
	ldr	w8, [sp, #12]
	subs	w8, w8, #2
	b.eq	LBB0_5
	b	LBB0_4
LBB0_4:
	.loc	1 14 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_6
LBB0_5:
	b	LBB0_6
LBB0_6:
	.loc	1 15 3 is_stmt 1
	ldr	w8, [sp, #16]
	subs	w8, w8, #3
	b.eq	LBB0_8
	b	LBB0_7
LBB0_7:
	.loc	1 15 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_9
LBB0_8:
	b	LBB0_9
LBB0_9:
	.loc	1 17 3 is_stmt 1
	ldrsb	w8, [sp, #20]
	subs	w8, w8, #104
	b.eq	LBB0_11
	b	LBB0_10
LBB0_10:
	.loc	1 17 21 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_12
LBB0_11:
	b	LBB0_12
LBB0_12:
	.loc	1 18 3 is_stmt 1
	ldrsb	w8, [sp, #21]
	subs	w8, w8, #101
	b.eq	LBB0_14
	b	LBB0_13
LBB0_13:
	.loc	1 18 21 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_15
LBB0_14:
	b	LBB0_15
LBB0_15:
	.loc	1 19 3 is_stmt 1
	ldrsb	w8, [sp, #22]
	subs	w8, w8, #108
	b.eq	LBB0_17
	b	LBB0_16
LBB0_16:
	.loc	1 19 21 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_18
LBB0_17:
	b	LBB0_18
LBB0_18:
	.loc	1 20 3 is_stmt 1
	ldrsb	w8, [sp, #23]
	subs	w8, w8, #108
	b.eq	LBB0_20
	b	LBB0_19
LBB0_19:
	.loc	1 20 21 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_21
LBB0_20:
	b	LBB0_21
LBB0_21:
	.loc	1 21 3 is_stmt 1
	ldrsb	w8, [sp, #24]
	subs	w8, w8, #111
	b.eq	LBB0_23
	b	LBB0_22
LBB0_22:
	.loc	1 21 21 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_24
LBB0_23:
	b	LBB0_24
LBB0_24:
	.loc	1 22 3 is_stmt 1
	ldrsb	w8, [sp, #25]
	cbz	w8, LBB0_26
	b	LBB0_25
LBB0_25:
	.loc	1 22 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_27
LBB0_26:
	b	LBB0_27
LBB0_27:
	.loc	1 24 3 is_stmt 1
	ldrsb	w8, [sp, #26]
	subs	w8, w8, #104
	b.eq	LBB0_29
	b	LBB0_28
LBB0_28:
	.loc	1 24 21 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_30
LBB0_29:
	b	LBB0_30
LBB0_30:
	.loc	1 25 3 is_stmt 1
	ldrsb	w8, [sp, #31]
	cbz	w8, LBB0_32
	b	LBB0_31
LBB0_31:
	.loc	1 25 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_33
LBB0_32:
	b	LBB0_33
LBB0_33:
	.loc	1 27 3 is_stmt 1
	adrp	x8, _ga@PAGE
	ldr	w8, [x8, _ga@PAGEOFF]
	subs	w8, w8, #10
	b.eq	LBB0_35
	b	LBB0_34
LBB0_34:
	.loc	1 27 20 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_36
LBB0_35:
	b	LBB0_36
LBB0_36:
	.loc	1 28 3 is_stmt 1
	adrp	x8, _ga@PAGE
	add	x8, x8, _ga@PAGEOFF
	ldr	w8, [x8, #4]
	subs	w8, w8, #7
	b.eq	LBB0_38
	b	LBB0_37
LBB0_37:
	.loc	1 28 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_39
LBB0_38:
	b	LBB0_39
LBB0_39:
	.loc	1 29 3 is_stmt 1
	adrp	x8, _ga@PAGE
	add	x8, x8, _ga@PAGEOFF
	ldr	w8, [x8, #8]
	subs	w8, w8, #8
	b.eq	LBB0_41
	b	LBB0_40
LBB0_40:
	.loc	1 29 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_42
LBB0_41:
	b	LBB0_42
LBB0_42:
	.loc	1 30 3 is_stmt 1
	adrp	x8, _ga@PAGE
	add	x8, x8, _ga@PAGEOFF
	ldr	w8, [x8, #12]
	subs	w8, w8, #9
	b.eq	LBB0_44
	b	LBB0_43
LBB0_43:
	.loc	1 30 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_45
LBB0_44:
	b	LBB0_45
LBB0_45:
	.loc	1 31 3 is_stmt 1
	adrp	x8, _ga@PAGE
	add	x8, x8, _ga@PAGEOFF
	ldr	w8, [x8, #16]
	subs	w8, w8, #1
	b.eq	LBB0_47
	b	LBB0_46
LBB0_46:
	.loc	1 31 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_48
LBB0_47:
	b	LBB0_48
LBB0_48:
	.loc	1 32 3 is_stmt 1
	adrp	x8, _ga@PAGE
	add	x8, x8, _ga@PAGEOFF
	ldr	w8, [x8, #20]
	subs	w8, w8, #5
	b.eq	LBB0_50
	b	LBB0_49
LBB0_49:
	.loc	1 32 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_51
LBB0_50:
	b	LBB0_51
LBB0_51:
	.loc	1 34 3 is_stmt 1
	adrp	x8, _gs@PAGE
	ldrsb	w8, [x8, _gs@PAGEOFF]
	subs	w8, w8, #104
	b.eq	LBB0_53
	b	LBB0_52
LBB0_52:
	.loc	1 34 21 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_54
LBB0_53:
	b	LBB0_54
LBB0_54:
	.loc	1 35 3 is_stmt 1
	adrp	x8, _gs@PAGE
	add	x8, x8, _gs@PAGEOFF
	ldrsb	w8, [x8, #1]
	subs	w8, w8, #105
	b.eq	LBB0_56
	b	LBB0_55
LBB0_55:
	.loc	1 35 21 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_57
LBB0_56:
	b	LBB0_57
LBB0_57:
	.loc	1 36 3 is_stmt 1
	adrp	x8, _gs@PAGE
	add	x8, x8, _gs@PAGEOFF
	ldrsb	w8, [x8, #2]
	cbz	w8, LBB0_59
	b	LBB0_58
LBB0_58:
	.loc	1 36 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_60
LBB0_59:
	b	LBB0_60
LBB0_60:
	.loc	1 38 3 is_stmt 1
	adrp	x8, _gt@PAGE
	ldrsb	w8, [x8, _gt@PAGEOFF]
	subs	w8, w8, #104
	b.eq	LBB0_62
	b	LBB0_61
LBB0_61:
	.loc	1 38 21 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_63
LBB0_62:
	b	LBB0_63
LBB0_63:
	.loc	1 39 3 is_stmt 1
	adrp	x8, _gt@PAGE
	add	x8, x8, _gt@PAGEOFF
	ldrsb	w8, [x8, #1]
	subs	w8, w8, #101
	b.eq	LBB0_65
	b	LBB0_64
LBB0_64:
	.loc	1 39 21 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_66
LBB0_65:
	b	LBB0_66
LBB0_66:
	.loc	1 40 3 is_stmt 1
	adrp	x8, _gt@PAGE
	add	x8, x8, _gt@PAGEOFF
	ldrsb	w8, [x8, #2]
	subs	w8, w8, #121
	b.eq	LBB0_68
	b	LBB0_67
LBB0_67:
	.loc	1 40 21 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_69
LBB0_68:
	b	LBB0_69
LBB0_69:
	.loc	1 41 3 is_stmt 1
	adrp	x8, _gt@PAGE
	add	x8, x8, _gt@PAGEOFF
	ldrsb	w8, [x8, #3]
	cbz	w8, LBB0_71
	b	LBB0_70
LBB0_70:
	.loc	1 41 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_72
LBB0_71:
	b	LBB0_72
LBB0_72:
	.loc	1 43 3 is_stmt 1
	ldr	w8, [sp, #4]
	cbnz	w8, LBB0_74
	b	LBB0_73
LBB0_73:
Ltmp1:
	.loc	1 44 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB0_75
Ltmp2:
LBB0_74:
	.loc	1 46 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB0_75
Ltmp3:
LBB0_75:
	.loc	1 48 3
	ldr	w0, [sp, #4]
	.loc	1 48 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #32]
	add	sp, sp, #48
	ret
Ltmp4:
Lfunc_end0:
	.cfi_endproc

	.section	__DATA,__data
	.globl	_ga
	.p2align	4, 0x0
_ga:
	.long	10
	.long	7
	.long	8
	.long	9
	.long	1
	.long	5

	.globl	_gs
_gs:
	.asciz	"hi"

	.globl	_gt
_gt:
	.asciz	"hey"

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"32.array_1d_inferred_string_init.c PASS\n"

l___unnamed_2:
	.asciz	"32.array_1d_inferred_string_init.c FAIL\n"

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
	.long	39
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end0-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	48
	.long	48
	.byte	1
	.byte	7
	.long	128

	.byte	3
	.byte	2
	.byte	145
	.byte	26
	.long	57
	.byte	1
	.byte	11
	.long	135
	.byte	3
	.byte	2
	.byte	145
	.byte	20
	.long	85
	.byte	1
	.byte	10
	.long	135
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	88
	.byte	1
	.byte	9
	.long	161
	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	91
	.byte	1
	.byte	8
	.long	128
	.byte	0
	.byte	4
	.long	53
	.byte	5
	.byte	4
	.byte	5
	.long	147
	.byte	6
	.long	154
	.byte	6
	.byte	0
	.byte	4
	.long	60
	.byte	6
	.byte	1
	.byte	7
	.long	65
	.byte	8
	.byte	7
	.byte	5
	.long	128
	.byte	6
	.long	154
	.byte	3
	.byte	0
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"32.array_1d_inferred_string_init.c"
	.asciz	"../tests"
	.asciz	"main"
	.asciz	"int"
	.asciz	"lb"
	.asciz	"char"
	.asciz	"__ARRAY_SIZE_TYPE__"
	.asciz	"ls"
	.asciz	"la"
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
	.long	48
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
	.long	-1
	.long	-1
	.long	0
	.long	193495088
	.long	2090147939
	.long	-594775205
.set Lset6, Ltypes0-Ltypes_begin
	.long	Lset6
.set Lset7, Ltypes1-Ltypes_begin
	.long	Lset7
.set Lset8, Ltypes2-Ltypes_begin
	.long	Lset8
Ltypes0:
	.long	53
	.long	1
	.long	128
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	60
	.long	1
	.long	147
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	65
	.long	1
	.long	154
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
