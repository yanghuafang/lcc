	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "2.struct_type.c"
	.loc	1 11 0
	.cfi_startproc
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]
	.cfi_def_cfa_offset 64
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp0:
	.loc	1 14 3 prologue_end
Lloh0:
	adrp	x8, l___unnamed_1@PAGE
Lloh1:
	add	x8, x8, l___unnamed_1@PAGEOFF
	mov	x10, #22
	str	x8, [sp, #8]
	mov	w8, #77
	mov	w9, #100
	movk	x10, #32768, lsl #32
	.loc	1 15 3
	strb	w8, [sp, #16]
	.loc	1 23 3
	cmp	w9, #100
	movk	x10, #17723, lsl #48
	.loc	1 20 3
	stp	w9, w8, [sp, #36]
	mov	w8, #22
	.loc	1 12 3
	str	wzr, [sp, #4]
	.loc	1 16 3
	str	w9, [sp, #20]
	.loc	1 17 3
	str	x10, [sp, #24]
	.loc	1 22 3
	str	w8, [sp, #44]
	.loc	1 23 3
	b.eq	LBB0_2
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 23 18
	str	w8, [sp, #4]
LBB0_2:
	.loc	1 24 3 is_stmt 1
	ldr	w8, [sp, #40]
	cmp	w8, #77
	b.eq	LBB0_4
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 24 19
	str	w8, [sp, #4]
LBB0_4:
	.loc	1 25 3 is_stmt 1
	ldr	w8, [sp, #44]
	cmp	w8, #22
	b.eq	LBB0_6
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 25 18
	str	w8, [sp, #4]
LBB0_6:
	.loc	1 27 3 is_stmt 1
	str	wzr, [sp, #24]
	.loc	1 28 3
	str	wzr, [sp, #44]
	.loc	1 29 3
	cbz	wzr, LBB0_8
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 29 17
	str	w8, [sp, #4]
LBB0_8:
	.loc	1 31 3 is_stmt 1
	ldr	w8, [sp, #4]
	.loc	1 0 0 is_stmt 0
Lloh2:
	adrp	x9, l___unnamed_2@PAGE
Lloh3:
	add	x9, x9, l___unnamed_2@PAGEOFF
	cmp	w8, #0
Lloh4:
	adrp	x8, l___unnamed_3@PAGE
Lloh5:
	add	x8, x8, l___unnamed_3@PAGEOFF
	csel	x0, x8, x9, eq
	bl	_printf
	.loc	1 36 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #48]
	ldr	w0, [sp, #4]
	add	sp, sp, #64
	ret
Ltmp1:
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
Lfunc_end0:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"employee"

l___unnamed_3:
	.asciz	"2.struct_type.c PASS\n"

l___unnamed_2:
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
	.byte	11
	.long	142

	.byte	3
	.byte	2
	.byte	145
	.byte	44
	.long	38
	.byte	1
	.byte	22
	.long	142
	.byte	3
	.byte	2
	.byte	145
	.byte	40
	.long	42
	.byte	1
	.byte	21
	.long	142
	.byte	3
	.byte	2
	.byte	145
	.byte	36
	.long	46
	.byte	1
	.byte	20
	.long	142
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	49
	.byte	1
	.byte	13
	.long	149
	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	103
	.byte	1
	.byte	12
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
