	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_getAddress
	.p2align	2
_getAddress:
Lfunc_begin0:
	.file	1 "../tests" "10.double_pointer_type.c"
	.loc	1 8 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp1:
	.loc	1 8 6 prologue_end
	str	x0, [sp, #8]
	.loc	1 8 28 is_stmt 0
	ldr	x9, [sp, #8]
	adrp	x8, _g_data@PAGE
	add	x8, x8, _g_data@PAGEOFF
	str	x8, [x9]
	.loc	1 8 28 epilogue_begin
	add	sp, sp, #16
	ret
Ltmp2:
Lfunc_end0:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin1:
	.loc	1 10 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp3:
	.loc	1 11 3 prologue_end
	str	wzr, [sp, #12]
	adrp	x8, _g_data@PAGE
	str	x8, [sp]
	adrp	x8, _g_data@PAGE
	add	x8, x8, _g_data@PAGEOFF
	.loc	1 12 3
	str	x8, [sp, #16]
	.loc	1 13 3
	ldr	x9, [sp, #16]
	mov	w8, #1234
	str	w8, [x9]
	add	x0, sp, #24
	.loc	1 16 3
	bl	_getAddress
	ldr	x8, [sp]
	.loc	1 17 3
	ldr	x10, [sp, #24]
	mov	w9, #5678
	str	w9, [x10]
	.loc	1 19 3
	ldr	w8, [x8, _g_data@PAGEOFF]
	subs	w8, w8, w9
	b.eq	LBB1_2
	b	LBB1_1
LBB1_1:
	.loc	1 19 23 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB1_3
LBB1_2:
	b	LBB1_3
LBB1_3:
	.loc	1 20 3 is_stmt 1
	ldr	x8, [sp, #24]
	ldr	w8, [x8]
	mov	w9, #5678
	subs	w8, w8, w9
	b.eq	LBB1_5
	b	LBB1_4
LBB1_4:
	.loc	1 20 20 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB1_6
LBB1_5:
	b	LBB1_6
LBB1_6:
	.loc	1 21 3 is_stmt 1
	ldr	x8, [sp, #16]
	ldr	w8, [x8]
	mov	w9, #5678
	subs	w8, w8, w9
	b.eq	LBB1_8
	b	LBB1_7
LBB1_7:
	.loc	1 21 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB1_9
LBB1_8:
	b	LBB1_9
LBB1_9:
	.loc	1 23 3 is_stmt 1
	ldr	x8, [sp, #16]
	str	wzr, [x8]
	.loc	1 24 3
	adrp	x8, _g_data@PAGE
	ldr	w8, [x8, _g_data@PAGEOFF]
	cbz	w8, LBB1_11
	b	LBB1_10
LBB1_10:
	.loc	1 24 20 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB1_12
LBB1_11:
	b	LBB1_12
LBB1_12:
	.loc	1 26 3 is_stmt 1
	ldr	x9, [sp, #24]
	mov	w8, #-42
	str	w8, [x9]
	.loc	1 27 3
	adrp	x8, _g_data@PAGE
	ldr	w8, [x8, _g_data@PAGEOFF]
	adds	w8, w8, #42
	b.eq	LBB1_14
	b	LBB1_13
LBB1_13:
	.loc	1 27 22 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB1_15
LBB1_14:
	b	LBB1_15
LBB1_15:
	.loc	1 29 3 is_stmt 1
	ldr	w8, [sp, #12]
	cbnz	w8, LBB1_17
	b	LBB1_16
LBB1_16:
Ltmp4:
	.loc	1 30 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB1_18
Ltmp5:
LBB1_17:
	.loc	1 32 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB1_18
Ltmp6:
LBB1_18:
	.loc	1 34 3
	ldr	w0, [sp, #12]
	.loc	1 34 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #32]
	add	sp, sp, #48
	ret
Ltmp7:
Lfunc_end1:
	.cfi_endproc

	.globl	_g_data
.zerofill __DATA,__common,_g_data,4,2
	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"10.double_pointer_type.c PASS\n"

l___unnamed_2:
	.asciz	"10.double_pointer_type.c FAIL\n"

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
	.byte	8
	.long	158

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	63
	.byte	1
	.byte	8
	.long	172
	.byte	0
	.byte	2
	.quad	Lfunc_begin1
.set Lset5, Lfunc_end1-Lfunc_begin1
	.long	Lset5

	.byte	1
	.byte	111
	.long	49
	.long	49
	.byte	1
	.byte	10
	.long	165

	.byte	4
	.byte	2
	.byte	145
	.byte	24
	.long	65
	.byte	1
	.byte	15
	.long	177
	.byte	4
	.byte	2
	.byte	145
	.byte	16
	.long	63
	.byte	1
	.byte	12
	.long	177
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	68
	.byte	1
	.byte	11
	.long	165
	.byte	0
	.byte	5
	.long	54
	.byte	1
	.byte	0
	.byte	5
	.long	59
	.byte	5
	.byte	4
	.byte	6
	.long	177
	.byte	6
	.long	165
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"10.double_pointer_type.c"
	.asciz	"../tests"
	.asciz	"getAddress"
	.asciz	"main"
	.asciz	"void"
	.asciz	"int"
	.asciz	"p"
	.asciz	"p2"
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
	.long	1425698123
.set Lset6, LNames1-Lnames_begin
	.long	Lset6
.set Lset7, LNames0-Lnames_begin
	.long	Lset7
LNames1:
	.long	49
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
	.long	2090838615
.set Lset8, Ltypes1-Ltypes_begin
	.long	Lset8
.set Lset9, Ltypes0-Ltypes_begin
	.long	Lset9
Ltypes1:
	.long	59
	.long	1
	.long	165
	.short	36
	.byte	0
	.long	0
Ltypes0:
	.long	54
	.long	1
	.long	158
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
