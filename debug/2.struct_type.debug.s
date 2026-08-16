	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "2.struct_type.c"
	.loc	1 13 0
	.cfi_startproc
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]
	.cfi_def_cfa_offset 64
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp0:
	.loc	1 14 3 prologue_end
	str	wzr, [sp, #4]
	.loc	1 16 3
	adrp	x8, l___unnamed_1@PAGE
	add	x8, x8, l___unnamed_1@PAGEOFF
	str	x8, [sp, #8]
	.loc	1 17 3
	mov	w8, #77
	strb	w8, [sp, #16]
	mov	w8, #100
	.loc	1 18 3
	str	w8, [sp, #20]
	.loc	1 19 3
	mov	w8, #22
	str	w8, [sp, #24]
	.loc	1 20 3
	mov	w8, #32768
	movk	w8, #17723, lsl #16
	fmov	s0, w8
	str	s0, [sp, #28]
	.loc	1 22 3
	ldr	w8, [sp, #20]
	str	w8, [sp, #36]
	.loc	1 23 3
	ldrsb	w8, [sp, #16]
	str	w8, [sp, #40]
	.loc	1 24 3
	ldr	w8, [sp, #24]
	str	w8, [sp, #44]
	.loc	1 25 3
	ldr	w8, [sp, #36]
	subs	w8, w8, #100
	b.eq	LBB0_2
	b	LBB0_1
LBB0_1:
	.loc	1 25 18 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_3
LBB0_2:
	b	LBB0_3
LBB0_3:
	.loc	1 26 3 is_stmt 1
	ldr	w8, [sp, #40]
	subs	w8, w8, #77
	b.eq	LBB0_5
	b	LBB0_4
LBB0_4:
	.loc	1 26 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_6
LBB0_5:
	b	LBB0_6
LBB0_6:
	.loc	1 27 3 is_stmt 1
	ldr	w8, [sp, #44]
	subs	w8, w8, #22
	b.eq	LBB0_8
	b	LBB0_7
LBB0_7:
	.loc	1 27 18 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_9
LBB0_8:
	b	LBB0_9
LBB0_9:
	.loc	1 29 3 is_stmt 1
	str	wzr, [sp, #24]
	.loc	1 30 3
	ldr	w8, [sp, #24]
	str	w8, [sp, #44]
	.loc	1 31 3
	ldr	w8, [sp, #44]
	cbz	w8, LBB0_11
	b	LBB0_10
LBB0_10:
	.loc	1 31 17 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_12
LBB0_11:
	b	LBB0_12
LBB0_12:
	.loc	1 33 3 is_stmt 1
	ldr	w8, [sp, #4]
	cbnz	w8, LBB0_14
	b	LBB0_13
LBB0_13:
Ltmp1:
	.loc	1 34 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB0_15
Ltmp2:
LBB0_14:
	.loc	1 36 5
	adrp	x0, l___unnamed_3@PAGE
	add	x0, x0, l___unnamed_3@PAGEOFF
	bl	_printf
	b	LBB0_15
Ltmp3:
LBB0_15:
	.loc	1 38 3
	ldr	w0, [sp, #4]
	.loc	1 38 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #48]
	add	sp, sp, #64
	ret
Ltmp4:
Lfunc_end0:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"employee"

l___unnamed_2:
	.asciz	"2.struct_type.c PASS\n"

l___unnamed_3:
	.asciz	"2.struct_type.c FAIL\n"

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
	.byte	6
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
	.byte	7
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
	.long	20
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end0-Lfunc_begin0
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
	.byte	13
	.long	142

	.byte	3
	.byte	2
	.byte	145
	.byte	44
	.long	38
	.byte	1
	.byte	24
	.long	142
	.byte	3
	.byte	2
	.byte	145
	.byte	40
	.long	42
	.byte	1
	.byte	23
	.long	142
	.byte	3
	.byte	2
	.byte	145
	.byte	36
	.long	46
	.byte	1
	.byte	22
	.long	142
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	49
	.byte	1
	.byte	15
	.long	149
	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	103
	.byte	1
	.byte	14
	.long	142
	.byte	0
	.byte	4
	.long	34
	.byte	5
	.byte	4
	.byte	5
	.long	58
	.byte	24
	.byte	8
	.byte	6
	.long	67
	.long	212
	.byte	8
	.byte	0
	.byte	6
	.long	42
	.long	217
	.byte	1
	.byte	8
	.byte	6
	.long	46
	.long	142
	.byte	4
	.byte	12
	.byte	6
	.long	38
	.long	224
	.byte	4
	.byte	16
	.byte	6
	.long	90
	.long	231
	.byte	4
	.byte	20
	.byte	0
	.byte	7
	.long	217
	.byte	4
	.long	72
	.byte	6
	.byte	1
	.byte	4
	.long	77
	.byte	7
	.byte	4
	.byte	4
	.long	97
	.byte	4
	.byte	4
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"2.struct_type.c"
	.asciz	"../tests"
	.asciz	"main"
	.asciz	"int"
	.asciz	"age"
	.asciz	"sex"
	.asciz	"id"
	.asciz	"employee"
	.asciz	"Employee"
	.asciz	"name"
	.asciz	"char"
	.asciz	"unsigned int"
	.asciz	"salary"
	.asciz	"float"
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
	.long	1
	.long	-1
	.long	2
	.long	4
	.long	-1304652851
	.long	-48196635
	.long	193495088
	.long	259121563
	.long	2090147939
.set Lset6, Ltypes3-Ltypes_begin
	.long	Lset6
.set Lset7, Ltypes1-Ltypes_begin
	.long	Lset7
.set Lset8, Ltypes0-Ltypes_begin
	.long	Lset8
.set Lset9, Ltypes4-Ltypes_begin
	.long	Lset9
.set Lset10, Ltypes2-Ltypes_begin
	.long	Lset10
Ltypes3:
	.long	77
	.long	1
	.long	224
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	58
	.long	1
	.long	149
	.short	19
	.byte	0
	.long	0
Ltypes0:
	.long	34
	.long	1
	.long	142
	.short	36
	.byte	0
	.long	0
Ltypes4:
	.long	97
	.long	1
	.long	231
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	72
	.long	1
	.long	217
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
