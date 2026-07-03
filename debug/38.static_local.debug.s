	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_get_seed
	.p2align	2
_get_seed:
Lfunc_begin0:
	.cfi_startproc
	.file	1 "../tests" "38.static_local.c"
	.loc	1 4 3 prologue_end
	mov	w0, #7
	ret
Ltmp0:
Lfunc_end0:
	.cfi_endproc

	.globl	_counter_calls
	.p2align	2
_counter_calls:
Lfunc_begin1:
	.loc	1 7 0
	.cfi_startproc
	adrp	x8, _counter_calls.count@PAGE
Ltmp1:
	.loc	1 9 3 prologue_end
	ldr	w9, [x8, _counter_calls.count@PAGEOFF]
	add	w9, w9, #1
	str	w9, [x8, _counter_calls.count@PAGEOFF]
	.loc	1 10 3
	ldr	w0, [x8, _counter_calls.count@PAGEOFF]
	ret
Ltmp2:
Lfunc_end1:
	.cfi_endproc

	.globl	_counter_with_init
	.p2align	2
_counter_with_init:
Lfunc_begin2:
	.loc	1 13 0
	.cfi_startproc
	adrp	x8, _counter_with_init.count@PAGE
Ltmp3:
	.loc	1 15 3 prologue_end
	ldr	w9, [x8, _counter_with_init.count@PAGEOFF]
	add	w9, w9, #1
	str	w9, [x8, _counter_with_init.count@PAGEOFF]
	.loc	1 16 3
	ldr	w0, [x8, _counter_with_init.count@PAGEOFF]
	ret
Ltmp4:
Lfunc_end2:
	.cfi_endproc

	.globl	_bump_runtime_static_decl
	.p2align	2
_bump_runtime_static_decl:
Lfunc_begin3:
	.loc	1 19 0
	.cfi_startproc
	stp	x29, x30, [sp, #-16]!
	.cfi_def_cfa_offset 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp5:
	.loc	1 20 10 prologue_end
	adrp	x8, l_bump_runtime_static_decl.value.inited@PAGE
	ldrb	w8, [x8, l_bump_runtime_static_decl.value.inited@PAGEOFF]
	tbnz	w8, #0, LBB3_2
	b	LBB3_1
LBB3_1:
	bl	_get_seed
	adrp	x8, _bump_runtime_static_decl.value@PAGE
	str	w0, [x8, _bump_runtime_static_decl.value@PAGEOFF]
	adrp	x9, l_bump_runtime_static_decl.value.inited@PAGE
	mov	w8, #1
	and	w8, w8, #0x1
	and	w8, w8, #0x1
	strb	w8, [x9, l_bump_runtime_static_decl.value.inited@PAGEOFF]
	b	LBB3_2
LBB3_2:
	.loc	1 0 10 is_stmt 0
	adrp	x8, _bump_runtime_static_decl.value@PAGE
	.loc	1 21 3 is_stmt 1
	ldr	w9, [x8, _bump_runtime_static_decl.value@PAGEOFF]
	add	w9, w9, #1
	str	w9, [x8, _bump_runtime_static_decl.value@PAGEOFF]
	.loc	1 22 3
	ldr	w0, [x8, _bump_runtime_static_decl.value@PAGEOFF]
	.loc	1 22 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp], #16
	ret
Ltmp6:
Lfunc_end3:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin4:
	.loc	1 25 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp7:
	.loc	1 26 3 prologue_end
	str	wzr, [sp, #12]
	.loc	1 28 3
	bl	_counter_calls
	subs	w8, w0, #1
	b.eq	LBB4_2
	b	LBB4_1
LBB4_1:
	.loc	1 28 29 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB4_3
LBB4_2:
	b	LBB4_3
LBB4_3:
	.loc	1 29 3 is_stmt 1
	bl	_counter_calls
	subs	w8, w0, #2
	b.eq	LBB4_5
	b	LBB4_4
LBB4_4:
	.loc	1 29 29 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB4_6
LBB4_5:
	b	LBB4_6
LBB4_6:
	.loc	1 30 3 is_stmt 1
	bl	_counter_calls
	subs	w8, w0, #3
	b.eq	LBB4_8
	b	LBB4_7
LBB4_7:
	.loc	1 30 29 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB4_9
LBB4_8:
	b	LBB4_9
LBB4_9:
	.loc	1 32 3 is_stmt 1
	bl	_counter_with_init
	subs	w8, w0, #11
	b.eq	LBB4_11
	b	LBB4_10
LBB4_10:
	.loc	1 32 34 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB4_12
LBB4_11:
	b	LBB4_12
LBB4_12:
	.loc	1 33 3 is_stmt 1
	bl	_counter_with_init
	subs	w8, w0, #12
	b.eq	LBB4_14
	b	LBB4_13
LBB4_13:
	.loc	1 33 34 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB4_15
LBB4_14:
	b	LBB4_15
LBB4_15:
	.loc	1 35 3 is_stmt 1
	bl	_bump_runtime_static_decl
	subs	w8, w0, #8
	b.eq	LBB4_17
	b	LBB4_16
LBB4_16:
	.loc	1 35 40 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB4_18
LBB4_17:
	b	LBB4_18
LBB4_18:
	.loc	1 36 3 is_stmt 1
	bl	_bump_runtime_static_decl
	subs	w8, w0, #9
	b.eq	LBB4_20
	b	LBB4_19
LBB4_19:
	.loc	1 36 40 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB4_21
LBB4_20:
	b	LBB4_21
LBB4_21:
	.loc	1 38 3 is_stmt 1
	ldr	w8, [sp, #12]
	cbnz	w8, LBB4_23
	b	LBB4_22
LBB4_22:
Ltmp8:
	.loc	1 39 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB4_24
Ltmp9:
LBB4_23:
	.loc	1 41 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB4_24
Ltmp10:
LBB4_24:
	.loc	1 43 3
	ldr	w0, [sp, #12]
	.loc	1 43 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #16]
	add	sp, sp, #32
	ret
Ltmp11:
Lfunc_end4:
	.cfi_endproc

.zerofill __DATA,__bss,_counter_calls.count,4,2
	.section	__DATA,__data
	.p2align	2, 0x0
_counter_with_init.count:
	.long	10

.zerofill __DATA,__bss,_bump_runtime_static_decl.value,4,2
.zerofill __DATA,__bss,l_bump_runtime_static_decl.value.inited,1,0
	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"38.static_local.c PASS\n"

l___unnamed_2:
	.asciz	"38.static_local.c FAIL\n"

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
	.byte	3
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
	.long	22
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end4-Lfunc_begin0
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
	.byte	3
	.long	202

	.byte	2
	.quad	Lfunc_begin1
.set Lset5, Lfunc_end1-Lfunc_begin1
	.long	Lset5

	.byte	1
	.byte	111
	.long	40
	.long	40
	.byte	1
	.byte	7
	.long	202

	.byte	2
	.quad	Lfunc_begin2
.set Lset6, Lfunc_end2-Lfunc_begin2
	.long	Lset6

	.byte	1
	.byte	111
	.long	54
	.long	54
	.byte	1
	.byte	13
	.long	202

	.byte	2
	.quad	Lfunc_begin3
.set Lset7, Lfunc_end3-Lfunc_begin3
	.long	Lset7

	.byte	1
	.byte	111
	.long	72
	.long	72
	.byte	1
	.byte	19
	.long	202

	.byte	3
	.quad	Lfunc_begin4
.set Lset8, Lfunc_end4-Lfunc_begin4
	.long	Lset8

	.byte	1
	.byte	111
	.long	97
	.long	97
	.byte	1
	.byte	25
	.long	202

	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	106
	.byte	1
	.byte	26
	.long	202
	.byte	0
	.byte	5
	.long	102
	.byte	5
	.byte	4
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"38.static_local.c"
	.asciz	"../tests"
	.asciz	"get_seed"
	.asciz	"counter_calls"
	.asciz	"counter_with_init"
	.asciz	"bump_runtime_static_decl"
	.asciz	"main"
	.asciz	"int"
	.asciz	"err"
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	5
	.long	5
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	-1
	.long	0
	.long	2
	.long	3
	.long	-1
	.long	1815049946
	.long	2090499946
	.long	-1277737709
	.long	851872083
	.long	-25676763
.set Lset9, LNames3-Lnames_begin
	.long	Lset9
.set Lset10, LNames4-Lnames_begin
	.long	Lset10
.set Lset11, LNames2-Lnames_begin
	.long	Lset11
.set Lset12, LNames1-Lnames_begin
	.long	Lset12
.set Lset13, LNames0-Lnames_begin
	.long	Lset13
LNames3:
	.long	72
	.long	1
	.long	129
	.long	0
LNames4:
	.long	97
	.long	1
	.long	158
	.long	0
LNames2:
	.long	54
	.long	1
	.long	100
	.long	0
LNames1:
	.long	40
	.long	1
	.long	71
	.long	0
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
.set Lset14, Ltypes0-Ltypes_begin
	.long	Lset14
Ltypes0:
	.long	102
	.long	1
	.long	202
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
