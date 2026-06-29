	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2
_helper:
Lfunc_begin0:
	.file	1 "../tests" "37.static_file.c"
	.loc	1 5 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp1:
	.loc	1 6 3 prologue_end
Lloh0:
	adrp	x8, _counter@PAGE
Lloh1:
	ldr	w9, [x8, _counter@PAGEOFF]
	mov	w8, w0
	.loc	1 5 12
	str	w8, [sp, #12]
	.loc	1 6 3
	add	w0, w0, w9
	.loc	1 6 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp2:
	.loh AdrpLdr	Lloh0, Lloh1
Lfunc_end0:
	.cfi_endproc

	.globl	_bump
	.p2align	2
_bump:
Lfunc_begin1:
	.cfi_startproc
	.loc	1 10 3 prologue_end is_stmt 1
	adrp	x8, _counter@PAGE
	ldr	w9, [x8, _counter@PAGEOFF]
	add	w0, w9, #1
	str	w0, [x8, _counter@PAGEOFF]
	.loc	1 11 3
	ret
Ltmp3:
Lfunc_end1:
	.cfi_endproc

	.globl	_bump_with_helper
	.p2align	2
_bump_with_helper:
Lfunc_begin2:
	.loc	1 14 0
	.cfi_startproc
	stp	x29, x30, [sp, #-16]!
	.cfi_def_cfa_offset 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp4:
	.loc	1 15 3 prologue_end
	adrp	x8, _counter@PAGE
	ldr	w9, [x8, _counter@PAGEOFF]
	add	w0, w9, #1
	str	w0, [x8, _counter@PAGEOFF]
	.loc	1 16 3
	bl	_helper
	.loc	1 16 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp], #16
	ret
Ltmp5:
Lfunc_end2:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin3:
	.loc	1 19 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp6:
	.loc	1 22 3 prologue_end
	mov	w0, #5
	.loc	1 20 3
	str	wzr, [sp, #12]
	.loc	1 22 3
	bl	_helper
	cmp	w0, #5
	b.eq	LBB3_2
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 22 23
	str	w8, [sp, #12]
LBB3_2:
	.loc	1 23 3 is_stmt 1
	bl	_bump
	cmp	w0, #1
	b.eq	LBB3_4
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 23 20
	str	w8, [sp, #12]
LBB3_4:
	.loc	1 24 3 is_stmt 1
	bl	_bump
	cmp	w0, #2
	b.eq	LBB3_6
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 24 20
	str	w8, [sp, #12]
LBB3_6:
	.loc	1 25 3 is_stmt 1
	mov	w0, #3
	bl	_helper
	cmp	w0, #5
	b.eq	LBB3_8
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 25 23
	str	w8, [sp, #12]
LBB3_8:
	.loc	1 26 3 is_stmt 1
	bl	_bump_with_helper
	cmp	w0, #6
	b.eq	LBB3_10
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 26 32
	str	w8, [sp, #12]
LBB3_10:
	.loc	1 28 3 is_stmt 1
	ldr	w8, [sp, #12]
	.loc	1 0 0 is_stmt 0
Lloh2:
	adrp	x9, l___unnamed_1@PAGE
Lloh3:
	add	x9, x9, l___unnamed_1@PAGEOFF
	cmp	w8, #0
Lloh4:
	adrp	x8, l___unnamed_2@PAGE
Lloh5:
	add	x8, x8, l___unnamed_2@PAGEOFF
	csel	x0, x8, x9, eq
	bl	_printf
	.loc	1 33 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #16]
	ldr	w0, [sp, #12]
	add	sp, sp, #32
	ret
Ltmp7:
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
Lfunc_end3:
	.cfi_endproc

.zerofill __DATA,__bss,_counter,4,2
	.section	__TEXT,__cstring,cstring_literals
l___unnamed_2:
	.asciz	"37.static_file.c PASS\n"

l___unnamed_1:
	.asciz	"37.static_file.c FAIL\n"

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
	.byte	46
	.byte	0
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
	.byte	5
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
	.byte	6
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
	.long	21
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end3-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	30
	.long	30
	.byte	1
	.byte	5
	.long	188

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	68
	.byte	1
	.byte	5
	.long	188
	.byte	0
	.byte	4
	.quad	Lfunc_begin1
.set Lset5, Lfunc_end1-Lfunc_begin1
	.long	Lset5

	.byte	1
	.byte	111
	.long	37
	.long	37
	.byte	1
	.byte	9
	.long	188

	.byte	4
	.quad	Lfunc_begin2
.set Lset6, Lfunc_end2-Lfunc_begin2
	.long	Lset6

	.byte	1
	.byte	111
	.long	42
	.long	42
	.byte	1
	.byte	14
	.long	188

	.byte	2
	.quad	Lfunc_begin3
.set Lset7, Lfunc_end3-Lfunc_begin3
	.long	Lset7

	.byte	1
	.byte	111
	.long	59
	.long	59
	.byte	1
	.byte	19
	.long	188

	.byte	5
	.byte	2
	.byte	145
	.byte	12
	.long	74
	.byte	1
	.byte	20
	.long	188
	.byte	0
	.byte	6
	.long	64
	.byte	5
	.byte	4
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"37.static_file.c"
	.asciz	"../tests"
	.asciz	"helper"
	.asciz	"bump"
	.asciz	"bump_with_helper"
	.asciz	"main"
	.asciz	"int"
	.asciz	"value"
	.asciz	"err"
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	4
	.long	4
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	-1
	.long	0
	.long	2
	.long	3
	.long	30954469
	.long	2090126553
	.long	2090499946
	.long	476763059
.set Lset8, LNames0-Lnames_begin
	.long	Lset8
.set Lset9, LNames1-Lnames_begin
	.long	Lset9
.set Lset10, LNames3-Lnames_begin
	.long	Lset10
.set Lset11, LNames2-Lnames_begin
	.long	Lset11
LNames0:
	.long	30
	.long	1
	.long	42
	.long	0
LNames1:
	.long	37
	.long	1
	.long	86
	.long	0
LNames3:
	.long	59
	.long	1
	.long	144
	.long	0
LNames2:
	.long	42
	.long	1
	.long	115
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
	.long	1
	.long	1
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
	.long	193495088
.set Lset12, Ltypes0-Ltypes_begin
	.long	Lset12
Ltypes0:
	.long	64
	.long	1
	.long	188
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
