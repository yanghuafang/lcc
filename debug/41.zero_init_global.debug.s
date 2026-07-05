	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "41.zero_init_global.c"
	.loc	1 17 0
	.cfi_startproc
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp0:
	.loc	1 18 3 prologue_end
	str	wzr, [sp, #12]
	.loc	1 20 3
	adrp	x8, _g_scalar@PAGE
	ldr	w8, [x8, _g_scalar@PAGEOFF]
	cbz	w8, LBB0_2
	b	LBB0_1
LBB0_1:
	.loc	1 20 22 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_3
LBB0_2:
	b	LBB0_3
LBB0_3:
	.loc	1 22 3 is_stmt 1
	adrp	x8, _g_arr@PAGE
	ldr	w8, [x8, _g_arr@PAGEOFF]
	cbz	w8, LBB0_5
	b	LBB0_4
LBB0_4:
	.loc	1 22 22 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_6
LBB0_5:
	b	LBB0_6
LBB0_6:
	.loc	1 23 3 is_stmt 1
	adrp	x8, _g_arr@PAGE
	add	x8, x8, _g_arr@PAGEOFF
	ldr	w8, [x8, #4]
	cbz	w8, LBB0_8
	b	LBB0_7
LBB0_7:
	.loc	1 23 22 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_9
LBB0_8:
	b	LBB0_9
LBB0_9:
	.loc	1 24 3 is_stmt 1
	adrp	x8, _g_arr@PAGE
	add	x8, x8, _g_arr@PAGEOFF
	ldr	w8, [x8, #8]
	cbz	w8, LBB0_11
	b	LBB0_10
LBB0_10:
	.loc	1 24 22 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_12
LBB0_11:
	b	LBB0_12
LBB0_12:
	.loc	1 25 3 is_stmt 1
	adrp	x8, _g_arr@PAGE
	add	x8, x8, _g_arr@PAGEOFF
	ldr	w8, [x8, #12]
	cbz	w8, LBB0_14
	b	LBB0_13
LBB0_13:
	.loc	1 25 22 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_15
LBB0_14:
	b	LBB0_15
LBB0_15:
	.loc	1 27 3 is_stmt 1
	adrp	x8, _g_matrix@PAGE
	ldr	w8, [x8, _g_matrix@PAGEOFF]
	cbz	w8, LBB0_17
	b	LBB0_16
LBB0_16:
	.loc	1 27 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_18
LBB0_17:
	b	LBB0_18
LBB0_18:
	.loc	1 28 3 is_stmt 1
	adrp	x8, _g_matrix@PAGE
	add	x8, x8, _g_matrix@PAGEOFF
	ldr	w8, [x8, #8]
	cbz	w8, LBB0_20
	b	LBB0_19
LBB0_19:
	.loc	1 28 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_21
LBB0_20:
	b	LBB0_21
LBB0_21:
	.loc	1 29 3 is_stmt 1
	adrp	x8, _g_matrix@PAGE
	add	x8, x8, _g_matrix@PAGEOFF
	ldr	w8, [x8, #16]
	cbz	w8, LBB0_23
	b	LBB0_22
LBB0_22:
	.loc	1 29 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_24
LBB0_23:
	b	LBB0_24
LBB0_24:
	.loc	1 30 3 is_stmt 1
	adrp	x8, _g_matrix@PAGE
	add	x8, x8, _g_matrix@PAGEOFF
	ldr	w8, [x8, #20]
	cbz	w8, LBB0_26
	b	LBB0_25
LBB0_25:
	.loc	1 30 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_27
LBB0_26:
	b	LBB0_27
LBB0_27:
	.loc	1 32 3 is_stmt 1
	adrp	x8, _g_ptr@PAGE
	ldr	x8, [x8, _g_ptr@PAGEOFF]
	cbz	x8, LBB0_29
	b	LBB0_28
LBB0_28:
	.loc	1 32 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_30
LBB0_29:
	b	LBB0_30
LBB0_30:
	.loc	1 34 3 is_stmt 1
	adrp	x8, _g_point@PAGE
	ldr	w8, [x8, _g_point@PAGEOFF]
	cbz	w8, LBB0_32
	b	LBB0_31
LBB0_31:
	.loc	1 34 23 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_33
LBB0_32:
	b	LBB0_33
LBB0_33:
	.loc	1 35 3 is_stmt 1
	adrp	x8, _g_point@PAGE
	add	x8, x8, _g_point@PAGEOFF
	ldr	w8, [x8, #4]
	cbz	w8, LBB0_35
	b	LBB0_34
LBB0_34:
	.loc	1 35 23 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_36
LBB0_35:
	b	LBB0_36
LBB0_36:
	.loc	1 37 3 is_stmt 1
	ldr	w8, [sp, #12]
	cbnz	w8, LBB0_38
	b	LBB0_37
LBB0_37:
Ltmp1:
	.loc	1 38 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB0_39
Ltmp2:
LBB0_38:
	.loc	1 40 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB0_39
Ltmp3:
LBB0_39:
	.loc	1 42 3
	ldr	w0, [sp, #12]
	.loc	1 42 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #16]
	add	sp, sp, #32
	ret
Ltmp4:
Lfunc_end0:
	.cfi_endproc

	.globl	_g_scalar
.zerofill __DATA,__common,_g_scalar,4,2
	.globl	_g_arr
.zerofill __DATA,__common,_g_arr,16,2
	.globl	_g_matrix
.zerofill __DATA,__common,_g_matrix,24,4
	.globl	_g_ptr
.zerofill __DATA,__common,_g_ptr,8,3
	.globl	_g_point
.zerofill __DATA,__common,_g_point,8,3
	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"41.zero_init_global.c PASS\n"

l___unnamed_2:
	.asciz	"41.zero_init_global.c FAIL\n"

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
	.long	26
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end0-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	35
	.long	35
	.byte	1
	.byte	17
	.long	86

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	44
	.byte	1
	.byte	18
	.long	86
	.byte	0
	.byte	4
	.long	40
	.byte	5
	.byte	4
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"41.zero_init_global.c"
	.asciz	"../tests"
	.asciz	"main"
	.asciz	"int"
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
	.long	35
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
.set Lset6, Ltypes0-Ltypes_begin
	.long	Lset6
Ltypes0:
	.long	40
	.long	1
	.long	86
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
