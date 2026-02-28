	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_checkAge1
	.p2align	2
_checkAge1:
Lfunc_begin0:
	.file	1 "../tests" "23.return.c"
	.loc	1 6 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp1:
	.loc	1 6 5 prologue_end
	str	w0, [sp, #12]
	.loc	1 7 3
	ldr	w8, [sp, #12]
	subs	w8, w8, #18
	b.ge	LBB0_2
	b	LBB0_1
LBB0_1:
Ltmp2:
	.loc	1 8 5
	ldr	w0, [sp, #12]
	.loc	1 8 5 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
LBB0_2:
	.loc	1 8 5 is_stmt 1
	b	LBB0_3
Ltmp3:
LBB0_3:
	.loc	1 10 3
	ldr	w8, [sp, #12]
	subs	w8, w8, #18
	b.ne	LBB0_5
	b	LBB0_4
LBB0_4:
Ltmp4:
	.loc	1 11 5
	ldr	w0, [sp, #12]
	.loc	1 11 5 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp5:
LBB0_5:
	.loc	1 12 10 is_stmt 1
	b	LBB0_6
LBB0_6:
	.loc	1 14 3
	ldr	w8, [sp, #12]
	subs	w8, w8, #18
	b.le	LBB0_8
	b	LBB0_7
LBB0_7:
Ltmp6:
	.loc	1 15 5
	ldr	w0, [sp, #12]
	.loc	1 15 5 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
LBB0_8:
	.loc	1 15 5 is_stmt 1
	b	LBB0_9
Ltmp7:
LBB0_9:
	.loc	1 17 3
	ldr	w0, [sp, #12]
	.loc	1 17 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp8:
Lfunc_end0:
	.cfi_endproc

	.globl	_checkAge2
	.p2align	2
_checkAge2:
Lfunc_begin1:
	.loc	1 20 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp10:
	.loc	1 20 5 prologue_end
	str	w0, [sp, #12]
	.loc	1 21 3
	ldr	w8, [sp, #12]
	subs	w8, w8, #18
	b.ge	LBB1_2
	b	LBB1_1
LBB1_1:
Ltmp11:
	.loc	1 22 5
	ldr	w0, [sp, #12]
	.loc	1 22 5 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp12:
LBB1_2:
	.loc	1 23 10 is_stmt 1
	ldr	w8, [sp, #12]
	subs	w8, w8, #18
	b.ne	LBB1_4
	b	LBB1_3
LBB1_3:
Ltmp13:
	.loc	1 24 5
	ldr	w0, [sp, #12]
	.loc	1 24 5 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp14:
LBB1_4:
	.loc	1 26 5 is_stmt 1
	ldr	w0, [sp, #12]
	.loc	1 26 5 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp15:
Lfunc_end1:
	.cfi_endproc

	.globl	_checkAge3
	.p2align	2
_checkAge3:
Lfunc_begin2:
	.loc	1 30 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp17:
	.loc	1 30 5 prologue_end
	str	w0, [sp, #12]
	.loc	1 31 3
	ldr	w8, [sp, #12]
	subs	w8, w8, #6
	b.gt	LBB2_2
	b	LBB2_1
LBB2_1:
Ltmp18:
	.loc	1 32 5
	ldr	w0, [sp, #12]
	.loc	1 32 5 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp19:
LBB2_2:
	.loc	1 33 10 is_stmt 1
	ldr	w9, [sp, #12]
	mov	w8, #0
	subs	w9, w9, #6
	str	w8, [sp, #8]
	b.le	LBB2_4
	b	LBB2_3
LBB2_3:
	ldr	w8, [sp, #12]
	subs	w8, w8, #14
	cset	w8, le
	str	w8, [sp, #8]
	b	LBB2_4
LBB2_4:
	.loc	1 0 10 is_stmt 0
	ldr	w8, [sp, #8]
	.loc	1 33 10
	tbz	w8, #0, LBB2_6
	b	LBB2_5
LBB2_5:
Ltmp20:
	.loc	1 34 5 is_stmt 1
	ldr	w0, [sp, #12]
	.loc	1 34 5 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp21:
LBB2_6:
	.loc	1 35 10 is_stmt 1
	ldr	w9, [sp, #12]
	mov	w8, #0
	subs	w9, w9, #14
	str	w8, [sp, #4]
	b.le	LBB2_8
	b	LBB2_7
LBB2_7:
	ldr	w8, [sp, #12]
	subs	w8, w8, #18
	cset	w8, le
	str	w8, [sp, #4]
	b	LBB2_8
LBB2_8:
	.loc	1 0 10 is_stmt 0
	ldr	w8, [sp, #4]
	.loc	1 35 10
	tbz	w8, #0, LBB2_10
	b	LBB2_9
LBB2_9:
Ltmp22:
	.loc	1 36 5 is_stmt 1
	ldr	w0, [sp, #12]
	.loc	1 36 5 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp23:
LBB2_10:
	.loc	1 37 10 is_stmt 1
	ldr	w9, [sp, #12]
	mov	w8, #0
	subs	w9, w9, #18
	str	w8, [sp]
	b.le	LBB2_12
	b	LBB2_11
LBB2_11:
	ldr	w8, [sp, #12]
	subs	w8, w8, #35
	cset	w8, le
	str	w8, [sp]
	b	LBB2_12
LBB2_12:
	.loc	1 0 10 is_stmt 0
	ldr	w8, [sp]
	.loc	1 37 10
	tbz	w8, #0, LBB2_14
	b	LBB2_13
LBB2_13:
Ltmp24:
	.loc	1 38 5 is_stmt 1
	ldr	w0, [sp, #12]
	.loc	1 38 5 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
LBB2_14:
	.loc	1 38 5 is_stmt 1
	b	LBB2_15
LBB2_15:
	b	LBB2_16
LBB2_16:
	b	LBB2_17
LBB2_17:
	b	LBB2_18
Ltmp25:
LBB2_18:
	.loc	1 40 3
	ldr	w0, [sp, #12]
	.loc	1 40 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp26:
Lfunc_end2:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin3:
	.loc	1 43 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp27:
	.loc	1 44 3 prologue_end
	str	wzr, [sp, #12]
	mov	w0, #16
	.loc	1 46 3
	bl	_checkAge1
	subs	w8, w0, #16
	b.eq	LBB3_2
	b	LBB3_1
LBB3_1:
	.loc	1 46 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_3
LBB3_2:
	b	LBB3_3
LBB3_3:
	.loc	1 0 28
	mov	w0, #18
	.loc	1 47 3 is_stmt 1
	bl	_checkAge1
	subs	w8, w0, #18
	b.eq	LBB3_5
	b	LBB3_4
LBB3_4:
	.loc	1 47 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_6
LBB3_5:
	b	LBB3_6
LBB3_6:
	.loc	1 0 28
	mov	w0, #20
	.loc	1 48 3 is_stmt 1
	bl	_checkAge1
	subs	w8, w0, #20
	b.eq	LBB3_8
	b	LBB3_7
LBB3_7:
	.loc	1 48 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_9
LBB3_8:
	b	LBB3_9
LBB3_9:
	.loc	1 0 28
	mov	w0, #16
	.loc	1 49 3 is_stmt 1
	bl	_checkAge2
	subs	w8, w0, #16
	b.eq	LBB3_11
	b	LBB3_10
LBB3_10:
	.loc	1 49 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_12
LBB3_11:
	b	LBB3_12
LBB3_12:
	.loc	1 0 28
	mov	w0, #18
	.loc	1 50 3 is_stmt 1
	bl	_checkAge2
	subs	w8, w0, #18
	b.eq	LBB3_14
	b	LBB3_13
LBB3_13:
	.loc	1 50 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_15
LBB3_14:
	b	LBB3_15
LBB3_15:
	.loc	1 0 28
	mov	w0, #20
	.loc	1 51 3 is_stmt 1
	bl	_checkAge2
	subs	w8, w0, #20
	b.eq	LBB3_17
	b	LBB3_16
LBB3_16:
	.loc	1 51 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_18
LBB3_17:
	b	LBB3_18
LBB3_18:
	.loc	1 0 28
	mov	w0, #6
	.loc	1 52 3 is_stmt 1
	bl	_checkAge3
	subs	w8, w0, #6
	b.eq	LBB3_20
	b	LBB3_19
LBB3_19:
	.loc	1 52 26 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_21
LBB3_20:
	b	LBB3_21
LBB3_21:
	.loc	1 0 26
	mov	w0, #35
	.loc	1 53 3 is_stmt 1
	bl	_checkAge3
	subs	w8, w0, #35
	b.eq	LBB3_23
	b	LBB3_22
LBB3_22:
	.loc	1 53 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB3_24
LBB3_23:
	b	LBB3_24
LBB3_24:
	.loc	1 55 3 is_stmt 1
	ldr	w8, [sp, #12]
	cbnz	w8, LBB3_26
	b	LBB3_25
LBB3_25:
Ltmp28:
	.loc	1 56 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB3_27
Ltmp29:
LBB3_26:
	.loc	1 58 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB3_27
Ltmp30:
LBB3_27:
	.loc	1 60 3
	ldr	w0, [sp, #12]
	.loc	1 60 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #16]
	add	sp, sp, #32
	ret
Ltmp31:
Lfunc_end3:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"23.return.c PASS\n"

l___unnamed_2:
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
	.byte	6
	.long	218

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	64
	.byte	1
	.byte	6
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
	.byte	20
	.long	218

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	64
	.byte	1
	.byte	20
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
	.byte	30
	.long	218

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	64
	.byte	1
	.byte	30
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
	.byte	43
	.long	218

	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	68
	.byte	1
	.byte	44
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
