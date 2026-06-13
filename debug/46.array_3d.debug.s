	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "46.array_3d.c"
	.loc	1 13 0
	.cfi_startproc
	sub	sp, sp, #208
	stp	x29, x30, [sp, #192]
	.cfi_def_cfa_offset 208
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp0:
	.loc	1 14 3 prologue_end
	str	wzr, [sp, #8]
	.loc	1 18 3
	str	wzr, [sp, #188]
	.loc	1 20 3
	str	wzr, [sp, #172]
	b	LBB0_1
LBB0_1:
	.loc	1 20 3
	ldr	w8, [sp, #172]
	subs	w8, w8, #2
	b.ge	LBB0_12
	b	LBB0_2
LBB0_2:
Ltmp1:
	.loc	1 21 5
	str	wzr, [sp, #176]
	b	LBB0_3
LBB0_3:
	.loc	1 21 5
	ldr	w8, [sp, #176]
	subs	w8, w8, #3
	b.ge	LBB0_10
	b	LBB0_4
LBB0_4:
Ltmp2:
	.loc	1 22 7
	str	wzr, [sp, #180]
	b	LBB0_5
LBB0_5:
	.loc	1 22 7
	ldr	w8, [sp, #180]
	subs	w8, w8, #4
	b.ge	LBB0_8
	b	LBB0_6
LBB0_6:
Ltmp3:
	.loc	1 23 9
	ldrsw	x8, [sp, #172]
	mov	w9, #48
	mul	x9, x8, x9
	add	x8, sp, #12
	add	x8, x8, x9
	ldrsw	x9, [sp, #176]
	add	x9, x8, x9, lsl #4
	ldrsw	x10, [sp, #180]
	ldr	w8, [sp, #172]
	mov	w11, #100
	mul	w8, w8, w11
	ldr	w11, [sp, #176]
	mov	w12, #10
	mul	w11, w11, w12
	add	w8, w8, w11
	ldr	w11, [sp, #180]
	add	w8, w8, w11
	str	w8, [x9, x10, lsl #2]
	b	LBB0_7
LBB0_7:
	ldr	w8, [sp, #180]
	add	w8, w8, #1
	str	w8, [sp, #180]
	b	LBB0_5
LBB0_8:
	.loc	1 23 9
	b	LBB0_9
LBB0_9:
	ldr	w8, [sp, #176]
	add	w8, w8, #1
	str	w8, [sp, #176]
	b	LBB0_3
LBB0_10:
	.loc	1 23 9
	b	LBB0_11
LBB0_11:
	ldr	w8, [sp, #172]
	add	w8, w8, #1
	str	w8, [sp, #172]
	b	LBB0_1
Ltmp4:
LBB0_12:
	.loc	1 28 3
	str	wzr, [sp, #172]
	b	LBB0_13
LBB0_13:
	.loc	1 28 3
	ldr	w8, [sp, #172]
	subs	w8, w8, #2
	b.ge	LBB0_24
	b	LBB0_14
LBB0_14:
Ltmp5:
	.loc	1 29 5
	str	wzr, [sp, #176]
	b	LBB0_15
LBB0_15:
	.loc	1 29 5
	ldr	w8, [sp, #176]
	subs	w8, w8, #3
	b.ge	LBB0_22
	b	LBB0_16
LBB0_16:
Ltmp6:
	.loc	1 30 7
	str	wzr, [sp, #180]
	b	LBB0_17
LBB0_17:
	.loc	1 30 7
	ldr	w8, [sp, #180]
	subs	w8, w8, #4
	b.ge	LBB0_20
	b	LBB0_18
LBB0_18:
Ltmp7:
	.loc	1 31 9
	ldrsw	x8, [sp, #172]
	mov	w9, #48
	mul	x9, x8, x9
	add	x8, sp, #12
	add	x8, x8, x9
	ldrsw	x9, [sp, #176]
	add	x8, x8, x9, lsl #4
	ldrsw	x9, [sp, #180]
	ldr	w9, [x8, x9, lsl #2]
	ldr	w8, [sp, #188]
	add	w8, w8, w9
	str	w8, [sp, #188]
	b	LBB0_19
LBB0_19:
	ldr	w8, [sp, #180]
	add	w8, w8, #1
	str	w8, [sp, #180]
	b	LBB0_17
LBB0_20:
	.loc	1 31 9
	b	LBB0_21
LBB0_21:
	ldr	w8, [sp, #176]
	add	w8, w8, #1
	str	w8, [sp, #176]
	b	LBB0_15
LBB0_22:
	.loc	1 31 9
	b	LBB0_23
LBB0_23:
	ldr	w8, [sp, #172]
	add	w8, w8, #1
	str	w8, [sp, #172]
	b	LBB0_13
Ltmp8:
LBB0_24:
	.loc	1 36 3
	ldr	w8, [sp, #12]
	cbz	w8, LBB0_26
	b	LBB0_25
LBB0_25:
	.loc	1 36 24 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_27
LBB0_26:
	b	LBB0_27
LBB0_27:
	.loc	1 37 3 is_stmt 1
	ldr	w8, [sp, #104]
	subs	w8, w8, #123
	b.eq	LBB0_29
	b	LBB0_28
LBB0_28:
	.loc	1 37 26 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_30
LBB0_29:
	b	LBB0_30
LBB0_30:
	.loc	1 38 3 is_stmt 1
	ldr	w8, [sp, #188]
	subs	w8, w8, #1476
	b.eq	LBB0_32
	b	LBB0_31
LBB0_31:
	.loc	1 38 20 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_33
LBB0_32:
	b	LBB0_33
LBB0_33:
	.loc	1 41 3 is_stmt 1
	str	wzr, [sp, #172]
	b	LBB0_34
LBB0_34:
	.loc	1 41 3
	ldr	w8, [sp, #172]
	subs	w8, w8, #2
	b.ge	LBB0_49
	b	LBB0_35
LBB0_35:
Ltmp9:
	.loc	1 42 5
	str	wzr, [sp, #176]
	b	LBB0_36
LBB0_36:
	.loc	1 42 5
	ldr	w8, [sp, #176]
	subs	w8, w8, #2
	b.ge	LBB0_47
	b	LBB0_37
LBB0_37:
Ltmp10:
	.loc	1 43 7
	str	wzr, [sp, #180]
	b	LBB0_38
LBB0_38:
	.loc	1 43 7
	ldr	w8, [sp, #180]
	subs	w8, w8, #2
	b.ge	LBB0_45
	b	LBB0_39
LBB0_39:
Ltmp11:
	.loc	1 44 9
	str	wzr, [sp, #184]
	b	LBB0_40
LBB0_40:
	.loc	1 44 9
	ldr	w8, [sp, #184]
	subs	w8, w8, #2
	b.ge	LBB0_43
	b	LBB0_41
LBB0_41:
Ltmp12:
	.loc	1 45 11
	ldrsw	x9, [sp, #172]
	add	x8, sp, #108
	add	x8, x8, x9, lsl #5
	ldrsw	x9, [sp, #176]
	add	x8, x8, x9, lsl #4
	ldrsw	x9, [sp, #180]
	add	x9, x8, x9, lsl #3
	ldrsw	x10, [sp, #184]
	ldr	w8, [sp, #172]
	ldr	w11, [sp, #176]
	add	w8, w8, w11
	ldr	w11, [sp, #180]
	add	w8, w8, w11
	ldr	w11, [sp, #184]
	add	w8, w8, w11
	str	w8, [x9, x10, lsl #2]
	b	LBB0_42
LBB0_42:
	ldr	w8, [sp, #184]
	add	w8, w8, #1
	str	w8, [sp, #184]
	b	LBB0_40
LBB0_43:
	.loc	1 45 11
	b	LBB0_44
LBB0_44:
	ldr	w8, [sp, #180]
	add	w8, w8, #1
	str	w8, [sp, #180]
	b	LBB0_38
LBB0_45:
	.loc	1 45 11
	b	LBB0_46
LBB0_46:
	ldr	w8, [sp, #176]
	add	w8, w8, #1
	str	w8, [sp, #176]
	b	LBB0_36
LBB0_47:
	.loc	1 45 11
	b	LBB0_48
LBB0_48:
	ldr	w8, [sp, #172]
	add	w8, w8, #1
	str	w8, [sp, #172]
	b	LBB0_34
Ltmp13:
LBB0_49:
	.loc	1 51 3
	ldr	w8, [sp, #128]
	subs	w8, w8, #2
	b.eq	LBB0_51
	b	LBB0_50
LBB0_50:
	.loc	1 51 27 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_52
LBB0_51:
	b	LBB0_52
LBB0_52:
	.loc	1 52 3 is_stmt 1
	ldr	w8, [sp, #168]
	subs	w8, w8, #4
	b.eq	LBB0_54
	b	LBB0_53
LBB0_53:
	.loc	1 52 27 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_55
LBB0_54:
	b	LBB0_55
LBB0_55:
	.loc	1 0 27
	adrp	x8, _g3@PAGE
	add	x8, x8, _g3@PAGEOFF
	mov	w9, #7
	.loc	1 55 3 is_stmt 1
	str	w9, [x8, #92]
	.loc	1 56 3
	ldr	w8, [x8, #92]
	subs	w8, w8, #7
	b.eq	LBB0_57
	b	LBB0_56
LBB0_56:
	.loc	1 56 25 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_58
LBB0_57:
	b	LBB0_58
LBB0_58:
	.loc	1 57 3 is_stmt 1
	adrp	x8, _g3@PAGE
	ldr	w8, [x8, _g3@PAGEOFF]
	cbz	w8, LBB0_60
	b	LBB0_59
LBB0_59:
	.loc	1 57 25 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_61
LBB0_60:
	b	LBB0_61
LBB0_61:
	.loc	1 0 25
	adrp	x8, _g4@PAGE
	add	x8, x8, _g4@PAGEOFF
	mov	w9, #9
	.loc	1 59 3 is_stmt 1
	str	w9, [x8, #60]
	.loc	1 60 3
	ldr	w8, [x8, #60]
	subs	w8, w8, #9
	b.eq	LBB0_63
	b	LBB0_62
LBB0_62:
	.loc	1 60 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_64
LBB0_63:
	b	LBB0_64
LBB0_64:
	.loc	1 0 28
	mov	w8, wzr
	.loc	1 63 3 is_stmt 1
	tbz	w8, #0, LBB0_66
	b	LBB0_65
LBB0_65:
	.loc	1 63 24 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_67
LBB0_66:
	b	LBB0_67
LBB0_67:
	.loc	1 0 24
	mov	w8, wzr
	.loc	1 64 3 is_stmt 1
	tbz	w8, #0, LBB0_69
	b	LBB0_68
LBB0_68:
	.loc	1 64 25 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_70
LBB0_69:
	b	LBB0_70
LBB0_70:
	.loc	1 0 25
	mov	w8, wzr
	.loc	1 65 3 is_stmt 1
	tbz	w8, #0, LBB0_72
	b	LBB0_71
LBB0_71:
	.loc	1 65 24 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_73
LBB0_72:
	b	LBB0_73
LBB0_73:
	.loc	1 67 3 is_stmt 1
	ldr	w8, [sp, #8]
	cbnz	w8, LBB0_75
	b	LBB0_74
LBB0_74:
Ltmp14:
	.loc	1 68 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB0_76
Ltmp15:
LBB0_75:
	.loc	1 70 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB0_76
Ltmp16:
LBB0_76:
	.loc	1 72 3
	ldr	w0, [sp, #8]
	.loc	1 72 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #192]
	add	sp, sp, #208
	ret
Ltmp17:
Lfunc_end0:
	.cfi_endproc

	.globl	_g3
.zerofill __DATA,__common,_g3,96,4
	.globl	_g4
.zerofill __DATA,__common,_g4,64,4
	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"46.array_3d.c PASS\n"

l___unnamed_2:
	.asciz	"46.array_3d.c FAIL\n"

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
	.long	18
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end0-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	27
	.long	27
	.byte	1
	.byte	13
	.long	190

	.byte	3
	.byte	3
	.byte	145
	.ascii	"\274\001"
	.long	36
	.byte	1
	.byte	18
	.long	190
	.byte	3
	.byte	3
	.byte	145
	.ascii	"\270\001"
	.long	40
	.byte	1
	.byte	17
	.long	190
	.byte	3
	.byte	3
	.byte	145
	.ascii	"\264\001"
	.long	42
	.byte	1
	.byte	17
	.long	190
	.byte	3
	.byte	3
	.byte	145
	.ascii	"\260\001"
	.long	44
	.byte	1
	.byte	17
	.long	190
	.byte	3
	.byte	3
	.byte	145
	.ascii	"\254\001"
	.long	46
	.byte	1
	.byte	17
	.long	190
	.byte	3
	.byte	3
	.byte	145
	.asciz	"\354"
	.long	48
	.byte	1
	.byte	16
	.long	197
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	70
	.byte	1
	.byte	15
	.long	252
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	72
	.byte	1
	.byte	14
	.long	190
	.byte	0
	.byte	4
	.long	32
	.byte	5
	.byte	4
	.byte	5
	.long	209
	.byte	6
	.long	245
	.byte	2
	.byte	0
	.byte	5
	.long	221
	.byte	6
	.long	245
	.byte	2
	.byte	0
	.byte	5
	.long	233
	.byte	6
	.long	245
	.byte	2
	.byte	0
	.byte	5
	.long	190
	.byte	6
	.long	245
	.byte	2
	.byte	0
	.byte	7
	.long	50
	.byte	8
	.byte	7
	.byte	5
	.long	264
	.byte	6
	.long	245
	.byte	2
	.byte	0
	.byte	5
	.long	276
	.byte	6
	.long	245
	.byte	3
	.byte	0
	.byte	5
	.long	190
	.byte	6
	.long	245
	.byte	4
	.byte	0
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"46.array_3d.c"
	.asciz	"../tests"
	.asciz	"main"
	.asciz	"int"
	.asciz	"sum"
	.asciz	"l"
	.asciz	"k"
	.asciz	"j"
	.asciz	"i"
	.asciz	"b"
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
	.long	27
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
	.long	2
	.long	2
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
	.long	193495088
	.long	-594775205
.set Lset6, Ltypes0-Ltypes_begin
	.long	Lset6
.set Lset7, Ltypes1-Ltypes_begin
	.long	Lset7
Ltypes0:
	.long	32
	.long	1
	.long	190
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	50
	.long	1
	.long	245
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
