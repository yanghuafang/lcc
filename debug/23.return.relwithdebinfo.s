	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_checkAge1
	.p2align	2
_checkAge1:
Lfunc_begin0:
	.file	1 "../tests" "23.return.c"
	.loc	1 3 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp3:
	.loc	1 3 5 prologue_end
	str	w0, [sp, #12]
	.loc	1 0 0 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp4:
Lfunc_end0:
	.cfi_endproc

	.globl	_checkAge2
	.p2align	2
_checkAge2:
Lfunc_begin1:
	.loc	1 17 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp5:
	.loc	1 17 5 prologue_end
	str	w0, [sp, #12]
	.loc	1 0 0 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp6:
Lfunc_end1:
	.cfi_endproc

	.globl	_checkAge3
	.p2align	2
_checkAge3:
Lfunc_begin2:
	.loc	1 27 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp7:
	.loc	1 28 3 prologue_end
	cmp	w0, #6
	.loc	1 27 5
	str	w0, [sp, #12]
	.loc	1 28 3
	b.le	LBB2_3
	.loc	1 30 10
	cmp	w0, #7
	b.lt	LBB2_4
	.loc	1 0 0 is_stmt 0
	ldr	w0, [sp, #12]
	.loc	1 30 10
	cmp	w0, #15
	b.ge	LBB2_4
LBB2_3:
	.loc	1 0 0 epilogue_begin
	add	sp, sp, #16
	ret
LBB2_4:
	.loc	1 32 10 is_stmt 1
	ldr	w0, [sp, #12]
	.loc	1 0 0 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp8:
Lfunc_end2:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin3:
	.loc	1 40 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp9:
	.loc	1 43 3 prologue_end
	mov	w0, #16
	.loc	1 41 3
	str	wzr, [sp, #12]
	.loc	1 43 3
	bl	_checkAge1
	cmp	w0, #16
	b.eq	LBB3_2
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 43 28
	str	w8, [sp, #12]
LBB3_2:
	.loc	1 44 3 is_stmt 1
	mov	w0, #18
	bl	_checkAge1
	cmp	w0, #18
	b.eq	LBB3_4
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 44 28
	str	w8, [sp, #12]
LBB3_4:
	.loc	1 45 3 is_stmt 1
	mov	w0, #20
	bl	_checkAge1
	cmp	w0, #20
	b.eq	LBB3_6
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 45 28
	str	w8, [sp, #12]
LBB3_6:
	.loc	1 46 3 is_stmt 1
	mov	w0, #16
	bl	_checkAge2
	cmp	w0, #16
	b.eq	LBB3_8
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 46 28
	str	w8, [sp, #12]
LBB3_8:
	.loc	1 47 3 is_stmt 1
	mov	w0, #18
	bl	_checkAge2
	cmp	w0, #18
	b.eq	LBB3_10
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 47 28
	str	w8, [sp, #12]
LBB3_10:
	.loc	1 48 3 is_stmt 1
	mov	w0, #20
	bl	_checkAge2
	cmp	w0, #20
	b.eq	LBB3_12
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 48 28
	str	w8, [sp, #12]
LBB3_12:
	.loc	1 49 3 is_stmt 1
	mov	w0, #6
	bl	_checkAge3
	cmp	w0, #6
	b.eq	LBB3_14
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 49 26
	str	w8, [sp, #12]
LBB3_14:
	.loc	1 50 3 is_stmt 1
	mov	w0, #35
	bl	_checkAge3
	cmp	w0, #35
	b.eq	LBB3_16
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 50 28
	str	w8, [sp, #12]
LBB3_16:
	.loc	1 52 3 is_stmt 1
	ldr	w8, [sp, #12]
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
	.loc	1 57 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #16]
	ldr	w0, [sp, #12]
	add	sp, sp, #32
	ret
Ltmp10:
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
Lfunc_end3:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_2:
	.asciz	"23.return.c PASS\n"

l___unnamed_1:
	.asciz	"23.return.c FAIL\n"

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
	.long	16
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end3-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	25
	.long	25
	.byte	1
	.byte	3
	.long	218

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	64
	.byte	1
	.byte	3
	.long	218
	.byte	0
	.byte	2
	.quad	Lfunc_begin1
.set Lset5, Lfunc_end1-Lfunc_begin1
	.long	Lset5

	.byte	1
	.byte	111
	.long	35
	.long	35
	.byte	1
	.byte	17
	.long	218

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	64
	.byte	1
	.byte	17
	.long	218
	.byte	0
	.byte	2
	.quad	Lfunc_begin2
.set Lset6, Lfunc_end2-Lfunc_begin2
	.long	Lset6

	.byte	1
	.byte	111
	.long	45
	.long	45
	.byte	1
	.byte	27
	.long	218

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	64
	.byte	1
	.byte	27
	.long	218
	.byte	0
	.byte	2
	.quad	Lfunc_begin3
.set Lset7, Lfunc_end3-Lfunc_begin3
	.long	Lset7

	.byte	1
	.byte	111
	.long	55
	.long	55
	.byte	1
	.byte	40
	.long	218

	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	68
	.byte	1
	.byte	41
	.long	218
	.byte	0
	.byte	5
	.long	60
	.byte	5
	.byte	4
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"23.return.c"
	.asciz	"../tests"
	.asciz	"checkAge1"
	.asciz	"checkAge2"
	.asciz	"checkAge3"
	.asciz	"main"
	.asciz	"int"
	.asciz	"age"
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
	.long	1
	.long	3
	.long	1180241345
	.long	1180241346
	.long	2090499946
	.long	1180241347
.set Lset8, LNames0-Lnames_begin
	.long	Lset8
.set Lset9, LNames1-Lnames_begin
	.long	Lset9
.set Lset10, LNames3-Lnames_begin
	.long	Lset10
.set Lset11, LNames2-Lnames_begin
	.long	Lset11
LNames0:
	.long	25
	.long	1
	.long	42
	.long	0
LNames1:
	.long	35
	.long	1
	.long	86
	.long	0
LNames3:
	.long	55
	.long	1
	.long	174
	.long	0
LNames2:
	.long	45
	.long	1
	.long	130
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
	.long	60
	.long	1
	.long	218
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
