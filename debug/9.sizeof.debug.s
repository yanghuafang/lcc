	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "9.sizeof.c"
	.loc	1 30 0
	.cfi_startproc
	sub	sp, sp, #224
	stp	x29, x30, [sp, #208]
	.cfi_def_cfa_offset 224
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp0:
	.loc	1 31 3 prologue_end
	mov	w8, wzr
	str	wzr, [sp, #4]
	.loc	1 45 3
	tbz	w8, #0, LBB0_2
	b	LBB0_1
LBB0_1:
	.loc	1 45 26 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_3
LBB0_2:
	b	LBB0_3
LBB0_3:
	.loc	1 0 26
	mov	w8, wzr
	.loc	1 46 3 is_stmt 1
	tbz	w8, #0, LBB0_5
	b	LBB0_4
LBB0_4:
	.loc	1 46 27 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_6
LBB0_5:
	b	LBB0_6
LBB0_6:
	.loc	1 0 27
	mov	w8, wzr
	.loc	1 47 3 is_stmt 1
	tbz	w8, #0, LBB0_8
	b	LBB0_7
LBB0_7:
	.loc	1 47 25 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_9
LBB0_8:
	b	LBB0_9
LBB0_9:
	.loc	1 0 25
	mov	w8, wzr
	.loc	1 48 3 is_stmt 1
	tbz	w8, #0, LBB0_11
	b	LBB0_10
LBB0_10:
	.loc	1 48 26 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_12
LBB0_11:
	b	LBB0_12
LBB0_12:
	.loc	1 0 26
	mov	w8, wzr
	.loc	1 49 3 is_stmt 1
	tbz	w8, #0, LBB0_14
	b	LBB0_13
LBB0_13:
	.loc	1 49 27 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_15
LBB0_14:
	b	LBB0_15
LBB0_15:
	.loc	1 0 27
	mov	w8, wzr
	.loc	1 50 3 is_stmt 1
	tbz	w8, #0, LBB0_17
	b	LBB0_16
LBB0_16:
	.loc	1 50 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_18
LBB0_17:
	b	LBB0_18
LBB0_18:
	.loc	1 0 28
	mov	w8, wzr
	.loc	1 51 3 is_stmt 1
	tbz	w8, #0, LBB0_20
	b	LBB0_19
LBB0_19:
	.loc	1 51 27 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_21
LBB0_20:
	b	LBB0_21
LBB0_21:
	.loc	1 0 27
	mov	w8, wzr
	.loc	1 52 3 is_stmt 1
	tbz	w8, #0, LBB0_23
	b	LBB0_22
LBB0_22:
	.loc	1 52 26 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_24
LBB0_23:
	b	LBB0_24
LBB0_24:
	.loc	1 0 26
	mov	w8, wzr
	.loc	1 53 3 is_stmt 1
	tbz	w8, #0, LBB0_26
	b	LBB0_25
LBB0_25:
	.loc	1 53 23 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_27
LBB0_26:
	b	LBB0_27
LBB0_27:
	.loc	1 0 23
	mov	w8, wzr
	.loc	1 54 3 is_stmt 1
	tbz	w8, #0, LBB0_29
	b	LBB0_28
LBB0_28:
	.loc	1 54 23 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_30
LBB0_29:
	b	LBB0_30
LBB0_30:
	.loc	1 0 23
	mov	w8, wzr
	.loc	1 55 3 is_stmt 1
	tbz	w8, #0, LBB0_32
	b	LBB0_31
LBB0_31:
	.loc	1 55 25 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_33
LBB0_32:
	b	LBB0_33
LBB0_33:
	.loc	1 0 25
	mov	w8, wzr
	.loc	1 56 3 is_stmt 1
	tbz	w8, #0, LBB0_35
	b	LBB0_34
LBB0_34:
	.loc	1 56 25 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_36
LBB0_35:
	b	LBB0_36
LBB0_36:
	.loc	1 0 25
	mov	w8, wzr
	.loc	1 60 3 is_stmt 1
	tbz	w8, #0, LBB0_38
	b	LBB0_37
LBB0_37:
	.loc	1 60 30 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_39
LBB0_38:
	b	LBB0_39
LBB0_39:
	.loc	1 0 30
	mov	w8, wzr
	.loc	1 61 3 is_stmt 1
	tbz	w8, #0, LBB0_41
	b	LBB0_40
LBB0_40:
	.loc	1 61 30 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_42
LBB0_41:
	b	LBB0_42
LBB0_42:
	.loc	1 0 30
	mov	w8, wzr
	.loc	1 62 3 is_stmt 1
	tbz	w8, #0, LBB0_44
	b	LBB0_43
LBB0_43:
	.loc	1 62 24 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_45
LBB0_44:
	b	LBB0_45
LBB0_45:
	.loc	1 0 24
	mov	w8, wzr
	.loc	1 63 3 is_stmt 1
	tbz	w8, #0, LBB0_47
	b	LBB0_46
LBB0_46:
	.loc	1 63 24 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_48
LBB0_47:
	b	LBB0_48
LBB0_48:
	.loc	1 0 24
	mov	w8, wzr
	.loc	1 64 3 is_stmt 1
	tbz	w8, #0, LBB0_50
	b	LBB0_49
LBB0_49:
	.loc	1 64 31 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_51
LBB0_50:
	b	LBB0_51
LBB0_51:
	.loc	1 0 31
	mov	w8, wzr
	.loc	1 65 3 is_stmt 1
	tbz	w8, #0, LBB0_53
	b	LBB0_52
LBB0_52:
	.loc	1 65 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_54
LBB0_53:
	b	LBB0_54
LBB0_54:
	.loc	1 67 3 is_stmt 1
	ldr	w8, [sp, #4]
	cbnz	w8, LBB0_56
	b	LBB0_55
LBB0_55:
Ltmp1:
	.loc	1 68 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB0_57
Ltmp2:
LBB0_56:
	.loc	1 70 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB0_57
Ltmp3:
LBB0_57:
	.loc	1 72 3
	ldr	w0, [sp, #4]
	.loc	1 72 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #208]
	add	sp, sp, #224
	ret
Ltmp4:
Lfunc_end0:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"9.sizeof.c PASS\n"

l___unnamed_2:
	.asciz	"9.sizeof.c FAIL\n"

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
	.byte	8
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
	.byte	9
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
	.byte	10
	.byte	23
	.byte	1
	.byte	3
	.byte	14
	.byte	11
	.byte	11
	.ascii	"\210\001"
	.byte	15
	.byte	0
	.byte	0
	.byte	11
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
	.long	15
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end0-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	24
	.long	24
	.byte	1
	.byte	30
	.long	259

	.byte	3
	.byte	3
	.byte	145
	.ascii	"\260\001"
	.long	33
	.byte	1
	.byte	43
	.long	266
	.byte	3
	.byte	3
	.byte	145
	.asciz	"\350"
	.long	64
	.byte	1
	.byte	42
	.long	292
	.byte	3
	.byte	3
	.byte	145
	.asciz	"\330"
	.long	78
	.byte	1
	.byte	41
	.long	311
	.byte	3
	.byte	3
	.byte	145
	.asciz	"\324"
	.long	101
	.byte	1
	.byte	40
	.long	259
	.byte	3
	.byte	3
	.byte	145
	.asciz	"\310"
	.long	105
	.byte	1
	.byte	39
	.long	348
	.byte	3
	.byte	2
	.byte	145
	.byte	48
	.long	116
	.byte	1
	.byte	38
	.long	383
	.byte	3
	.byte	2
	.byte	145
	.byte	40
	.long	144
	.byte	1
	.byte	37
	.long	378
	.byte	3
	.byte	2
	.byte	145
	.byte	32
	.long	147
	.byte	1
	.byte	36
	.long	442
	.byte	3
	.byte	2
	.byte	145
	.byte	28
	.long	156
	.byte	1
	.byte	35
	.long	435
	.byte	3
	.byte	2
	.byte	145
	.byte	16
	.long	99
	.byte	1
	.byte	34
	.long	278
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	158
	.byte	1
	.byte	33
	.long	259
	.byte	3
	.byte	2
	.byte	145
	.byte	11
	.long	92
	.byte	1
	.byte	32
	.long	341
	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	160
	.byte	1
	.byte	31
	.long	259
	.byte	0
	.byte	4
	.long	29
	.byte	5
	.byte	4
	.byte	5
	.long	278
	.byte	6
	.long	285
	.byte	4
	.byte	0
	.byte	4
	.long	39
	.byte	5
	.byte	8
	.byte	7
	.long	44
	.byte	8
	.byte	7
	.byte	5
	.long	304
	.byte	6
	.long	285
	.byte	3
	.byte	0
	.byte	4
	.long	73
	.byte	1
	.byte	0
	.byte	8
	.long	85
	.byte	12
	.byte	4
	.byte	9
	.long	92
	.long	341
	.byte	1
	.byte	0
	.byte	9
	.long	99
	.long	278
	.byte	4
	.byte	4
	.byte	0
	.byte	4
	.long	94
	.byte	6
	.byte	1
	.byte	10
	.long	108
	.byte	8
	.byte	8
	.byte	9
	.long	105
	.long	259
	.byte	4
	.byte	0
	.byte	9
	.long	111
	.long	378
	.byte	8
	.byte	0
	.byte	0
	.byte	11
	.long	341
	.byte	8
	.long	124
	.byte	24
	.byte	8
	.byte	9
	.long	105
	.long	259
	.byte	4
	.byte	0
	.byte	9
	.long	111
	.long	378
	.byte	8
	.byte	8
	.byte	9
	.long	101
	.long	341
	.byte	1
	.byte	16
	.byte	9
	.long	132
	.long	435
	.byte	4
	.byte	20
	.byte	0
	.byte	4
	.long	138
	.byte	4
	.byte	4
	.byte	4
	.long	149
	.byte	4
	.byte	8
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"9.sizeof.c"
	.asciz	"../tests"
	.asciz	"main"
	.asciz	"int"
	.asciz	"longs"
	.asciz	"long"
	.asciz	"__ARRAY_SIZE_TYPE__"
	.asciz	"students"
	.asciz	"void"
	.asciz	"padded"
	.asciz	"Padded"
	.asciz	"c"
	.asciz	"char"
	.asciz	"l"
	.asciz	"sex"
	.asciz	"id"
	.asciz	"ID"
	.asciz	"name"
	.asciz	"student"
	.asciz	"Student"
	.asciz	"score"
	.asciz	"float"
	.asciz	"pc"
	.asciz	"d"
	.asciz	"double"
	.asciz	"f"
	.asciz	"i"
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
	.long	24
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
	.long	10
	.long	10
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
	.long	-1
	.long	2
	.long	-1
	.long	4
	.long	5
	.long	-1
	.long	6
	.long	9
	.long	-913339225
	.long	-594775205
	.long	259121563
	.long	2090479413
	.long	2090838615
	.long	5862386
	.long	193495088
	.long	267746828
	.long	-113419488
	.long	2090147939
.set Lset6, Ltypes4-Ltypes_begin
	.long	Lset6
.set Lset7, Ltypes2-Ltypes_begin
	.long	Lset7
.set Lset8, Ltypes8-Ltypes_begin
	.long	Lset8
.set Lset9, Ltypes1-Ltypes_begin
	.long	Lset9
.set Lset10, Ltypes3-Ltypes_begin
	.long	Lset10
.set Lset11, Ltypes6-Ltypes_begin
	.long	Lset11
.set Lset12, Ltypes0-Ltypes_begin
	.long	Lset12
.set Lset13, Ltypes7-Ltypes_begin
	.long	Lset13
.set Lset14, Ltypes9-Ltypes_begin
	.long	Lset14
.set Lset15, Ltypes5-Ltypes_begin
	.long	Lset15
Ltypes4:
	.long	85
	.long	1
	.long	311
	.short	19
	.byte	0
	.long	0
Ltypes2:
	.long	44
	.long	1
	.long	285
	.short	36
	.byte	0
	.long	0
Ltypes8:
	.long	138
	.long	1
	.long	435
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	39
	.long	1
	.long	278
	.short	36
	.byte	0
	.long	0
Ltypes3:
	.long	73
	.long	1
	.long	304
	.short	36
	.byte	0
	.long	0
Ltypes6:
	.long	108
	.long	1
	.long	348
	.short	23
	.byte	0
	.long	0
Ltypes0:
	.long	29
	.long	1
	.long	259
	.short	36
	.byte	0
	.long	0
Ltypes7:
	.long	124
	.long	1
	.long	383
	.short	19
	.byte	0
	.long	0
Ltypes9:
	.long	149
	.long	1
	.long	442
	.short	36
	.byte	0
	.long	0
Ltypes5:
	.long	94
	.long	1
	.long	341
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
