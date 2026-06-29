	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "24.struct_array.c"
	.loc	1 8 0
	.cfi_startproc
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x8, #10
	mov	w9, #80
Ltmp0:
	.loc	1 9 3 prologue_end
	str	wzr, [sp, #4]
	movk	x8, #80, lsl #32
	.loc	1 14 3
	stp	xzr, x8, [sp, #8]
	mov	w8, #10
	.loc	1 21 3
	cmp	w8, #10
	.loc	1 19 3
	stp	w8, w9, [sp, #24]
	.loc	1 21 3
	b.eq	LBB0_2
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 21 17
	str	w8, [sp, #4]
LBB0_2:
	.loc	1 22 3 is_stmt 1
	ldr	w8, [sp, #28]
	cmp	w8, #80
	b.eq	LBB0_4
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 22 19
	str	w8, [sp, #4]
LBB0_4:
	.loc	1 24 3 is_stmt 1
	ldp	w8, w9, [sp, #8]
	stp	w8, w9, [sp, #24]
	.loc	1 26 3
	cbz	w8, LBB0_6
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 26 16
	str	w8, [sp, #4]
LBB0_6:
	.loc	1 27 3 is_stmt 1
	ldr	w8, [sp, #28]
	cbz	w8, LBB0_8
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 27 18
	str	w8, [sp, #4]
LBB0_8:
	.loc	1 29 3 is_stmt 1
	ldr	w8, [sp, #4]
	.loc	1 0 0 is_stmt 0
Lloh0:
	adrp	x9, l___unnamed_1@PAGE
Lloh1:
	add	x9, x9, l___unnamed_1@PAGEOFF
	cmp	w8, #0
Lloh2:
	adrp	x8, l___unnamed_2@PAGE
Lloh3:
	add	x8, x8, l___unnamed_2@PAGEOFF
	csel	x0, x8, x9, eq
	bl	_printf
	.loc	1 34 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #32]
	ldr	w0, [sp, #4]
	add	sp, sp, #48
	ret
Ltmp1:
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
Lfunc_end0:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_2:
	.asciz	"24.struct_array.c PASS\n"

l___unnamed_1:
	.asciz	"24.struct_array.c FAIL\n"

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
	.long	22
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end0-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	31
	.long	31
	.byte	1
	.byte	8
	.long	128

	.byte	3
	.byte	2
	.byte	145
	.byte	28
	.long	40
	.byte	1
	.byte	12
	.long	128
	.byte	3
	.byte	2
	.byte	145
	.byte	24
	.long	45
	.byte	1
	.byte	11
	.long	128
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	48
	.byte	1
	.byte	10
	.long	135
	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	76
	.byte	1
	.byte	9
	.long	128
	.byte	0
	.byte	4
	.long	36
	.byte	5
	.byte	4
	.byte	5
	.long	147
	.byte	6
	.long	154
	.byte	2
	.byte	0
	.byte	4
	.long	51
	.byte	1
	.byte	0
	.byte	7
	.long	56
	.byte	8
	.byte	7
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"24.struct_array.c"
	.asciz	"../tests"
	.asciz	"main"
	.asciz	"int"
	.asciz	"data"
	.asciz	"id"
	.asciz	"da"
	.asciz	"void"
	.asciz	"__ARRAY_SIZE_TYPE__"
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
	.long	31
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
	.long	0
	.long	-1
	.long	1
	.long	2090838615
	.long	193495088
	.long	-594775205
.set Lset6, Ltypes1-Ltypes_begin
	.long	Lset6
.set Lset7, Ltypes0-Ltypes_begin
	.long	Lset7
.set Lset8, Ltypes2-Ltypes_begin
	.long	Lset8
Ltypes1:
	.long	51
	.long	1
	.long	147
	.short	36
	.byte	0
	.long	0
Ltypes0:
	.long	36
	.long	1
	.long	128
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	56
	.long	1
	.long	154
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
