	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_addOne
	.p2align	2
_addOne:
Lfunc_begin0:
	.file	1 "../tests" "49.func_pointer.c"
	.loc	1 17 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp1:
	.loc	1 17 5 prologue_end
	str	w0, [sp, #12]
	.loc	1 17 21 is_stmt 0
	ldr	w8, [sp, #12]
	add	w0, w8, #1
	.loc	1 17 21 epilogue_begin
	add	sp, sp, #16
	ret
Ltmp2:
Lfunc_end0:
	.cfi_endproc

	.globl	_square
	.p2align	2
_square:
Lfunc_begin1:
	.loc	1 18 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp4:
	.loc	1 18 5 prologue_end
	str	w0, [sp, #12]
	.loc	1 18 21 is_stmt 0
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #12]
	mul	w0, w8, w9
	.loc	1 18 21 epilogue_begin
	add	sp, sp, #16
	ret
Ltmp5:
Lfunc_end1:
	.cfi_endproc

	.globl	_addTwo
	.p2align	2
_addTwo:
Lfunc_begin2:
	.loc	1 19 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp7:
	.loc	1 19 5 prologue_end
	str	w0, [sp, #8]
	str	w1, [sp, #12]
	.loc	1 19 28 is_stmt 0
	ldr	w8, [sp, #8]
	ldr	w9, [sp, #12]
	add	w0, w8, w9
	.loc	1 19 28 epilogue_begin
	add	sp, sp, #16
	ret
Ltmp8:
Lfunc_end2:
	.cfi_endproc

	.globl	_apply
	.p2align	2
_apply:
Lfunc_begin3:
	.loc	1 21 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp9:
	.loc	1 21 5 prologue_end
	str	x0, [sp]
	str	w1, [sp, #12]
	.loc	1 21 36 is_stmt 0
	ldr	x8, [sp]
	ldr	w0, [sp, #12]
	blr	x8
	.loc	1 21 36 epilogue_begin
	ldp	x29, x30, [sp, #16]
	add	sp, sp, #32
	ret
Ltmp10:
Lfunc_end3:
	.cfi_endproc

	.globl	_sumWith
	.p2align	2
_sumWith:
Lfunc_begin4:
	.loc	1 23 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp11:
	.loc	1 23 5 prologue_end
	str	x0, [sp, #8]
	str	w1, [sp, #16]
	str	w2, [sp, #20]
	.loc	1 24 3
	str	wzr, [sp, #24]
	.loc	1 25 3
	ldr	w8, [sp, #16]
	str	w8, [sp, #28]
	.loc	1 27 3
	b	LBB4_1
LBB4_1:
	.loc	1 27 3
	ldr	w8, [sp, #28]
	ldr	w9, [sp, #20]
	subs	w8, w8, w9
	b.gt	LBB4_3
	b	LBB4_2
LBB4_2:
Ltmp12:
	.loc	1 28 5
	ldr	w8, [sp, #24]
	str	w8, [sp, #4]
	ldr	x8, [sp, #8]
	ldr	w0, [sp, #28]
	blr	x8
	ldr	w8, [sp, #4]
	add	w8, w8, w0
	str	w8, [sp, #24]
	.loc	1 29 5
	ldr	w8, [sp, #28]
	add	w8, w8, #1
	str	w8, [sp, #28]
	b	LBB4_1
Ltmp13:
LBB4_3:
	.loc	1 31 3
	ldr	w0, [sp, #24]
	.loc	1 31 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #32]
	add	sp, sp, #48
	ret
Ltmp14:
Lfunc_end4:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin5:
	.loc	1 37 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp15:
	.loc	1 38 3 prologue_end
	str	wzr, [sp, #4]
	.loc	1 44 3
	adrp	x8, _addOne@PAGE
	add	x8, x8, _addOne@PAGEOFF
	str	x8, [sp, #8]
	.loc	1 45 3
	ldr	x8, [sp, #8]
	mov	w0, #10
	blr	x8
	subs	w8, w0, #11
	b.eq	LBB5_2
	b	LBB5_1
LBB5_1:
Ltmp16:
	.loc	1 46 5
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB5_3
LBB5_2:
	.loc	1 46 5
	b	LBB5_3
Ltmp17:
LBB5_3:
	.loc	1 50 3
	adrp	x8, _square@PAGE
	add	x8, x8, _square@PAGEOFF
	str	x8, [sp, #8]
	.loc	1 51 3
	ldr	x8, [sp, #8]
	mov	w0, #6
	blr	x8
	subs	w8, w0, #36
	b.eq	LBB5_5
	b	LBB5_4
LBB5_4:
Ltmp18:
	.loc	1 52 5
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB5_6
LBB5_5:
	.loc	1 52 5
	b	LBB5_6
Ltmp19:
LBB5_6:
	.loc	1 56 3
	adrp	x8, _addTwo@PAGE
	add	x8, x8, _addTwo@PAGEOFF
	str	x8, [sp, #16]
	.loc	1 57 3
	ldr	x8, [sp, #16]
	mov	w0, #3
	mov	w1, #4
	blr	x8
	subs	w8, w0, #7
	b.eq	LBB5_8
	b	LBB5_7
LBB5_7:
Ltmp20:
	.loc	1 58 5
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB5_9
LBB5_8:
	.loc	1 58 5
	b	LBB5_9
Ltmp21:
LBB5_9:
	.loc	1 62 3
	ldr	x8, [sp, #8]
	mov	w0, #5
	blr	x8
	add	w8, w0, #1
	str	w8, [sp, #28]
	.loc	1 63 3
	ldr	w8, [sp, #28]
	subs	w8, w8, #26
	b.eq	LBB5_11
	b	LBB5_10
LBB5_10:
Ltmp22:
	.loc	1 64 5
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB5_12
LBB5_11:
	.loc	1 64 5
	b	LBB5_12
Ltmp23:
LBB5_12:
	.loc	1 68 3
	adrp	x0, _addOne@PAGE
	add	x0, x0, _addOne@PAGEOFF
	mov	w1, #41
	bl	_apply
	subs	w8, w0, #42
	b.eq	LBB5_14
	b	LBB5_13
LBB5_13:
Ltmp24:
	.loc	1 69 5
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB5_15
LBB5_14:
	.loc	1 69 5
	b	LBB5_15
Ltmp25:
LBB5_15:
	.loc	1 71 3
	adrp	x0, _square@PAGE
	add	x0, x0, _square@PAGEOFF
	mov	w1, #7
	bl	_apply
	subs	w8, w0, #49
	b.eq	LBB5_17
	b	LBB5_16
LBB5_16:
Ltmp26:
	.loc	1 72 5
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB5_18
LBB5_17:
	.loc	1 72 5
	b	LBB5_18
Ltmp27:
LBB5_18:
	.loc	1 76 3
	adrp	x0, _square@PAGE
	add	x0, x0, _square@PAGEOFF
	mov	w1, #1
	mov	w2, #4
	bl	_sumWith
	subs	w8, w0, #30
	b.eq	LBB5_20
	b	LBB5_19
LBB5_19:
Ltmp28:
	.loc	1 77 5
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB5_21
LBB5_20:
	.loc	1 77 5
	b	LBB5_21
Ltmp29:
LBB5_21:
	.loc	1 0 5 is_stmt 0
	adrp	x8, _chosen@PAGE
	.loc	1 81 3 is_stmt 1
	adrp	x9, _addOne@PAGE
	add	x9, x9, _addOne@PAGEOFF
	str	x9, [x8, _chosen@PAGEOFF]
	.loc	1 82 3
	ldr	x8, [x8, _chosen@PAGEOFF]
	mov	w0, #99
	blr	x8
	subs	w8, w0, #100
	b.eq	LBB5_23
	b	LBB5_22
LBB5_22:
Ltmp30:
	.loc	1 83 5
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB5_24
LBB5_23:
	.loc	1 83 5
	b	LBB5_24
Ltmp31:
LBB5_24:
	.loc	1 87 3
	adrp	x8, _addOne@PAGE
	add	x8, x8, _addOne@PAGEOFF
	str	x8, [sp, #8]
	.loc	1 88 3
	ldr	x8, [sp, #8]
	mov	w0, #7
	blr	x8
	subs	w8, w0, #8
	b.eq	LBB5_26
	b	LBB5_25
LBB5_25:
Ltmp32:
	.loc	1 89 5
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB5_27
LBB5_26:
	.loc	1 89 5
	b	LBB5_27
Ltmp33:
LBB5_27:
	.loc	1 92 3
	ldr	w8, [sp, #4]
	cbnz	w8, LBB5_29
	b	LBB5_28
LBB5_28:
Ltmp34:
	.loc	1 93 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	.loc	1 94 5
	mov	w0, wzr
	.loc	1 94 5 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #32]
	add	sp, sp, #48
	ret
LBB5_29:
	.loc	1 94 5 is_stmt 1
	b	LBB5_30
Ltmp35:
LBB5_30:
	.loc	1 96 3
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	.loc	1 97 3
	mov	w0, #1
	.loc	1 97 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #32]
	add	sp, sp, #48
	ret
Ltmp36:
Lfunc_end5:
	.cfi_endproc

	.globl	_chosen
.zerofill __DATA,__common,_chosen,8,3
	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"49.func_pointer.c PASS\n"

l___unnamed_2:
	.asciz	"49.func_pointer.c FAIL\n"

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
	.long	22
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end5-Lfunc_begin0
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
	.byte	17
	.long	432

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	75
	.byte	1
	.byte	17
	.long	432
	.byte	0
	.byte	2
	.quad	Lfunc_begin1
.set Lset5, Lfunc_end1-Lfunc_begin1
	.long	Lset5

	.byte	1
	.byte	111
	.long	38
	.long	38
	.byte	1
	.byte	18
	.long	432

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	75
	.byte	1
	.byte	18
	.long	432
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
	.byte	19
	.long	432

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	79
	.byte	1
	.byte	19
	.long	432
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	77
	.byte	1
	.byte	19
	.long	432
	.byte	0
	.byte	2
	.quad	Lfunc_begin3
.set Lset7, Lfunc_end3-Lfunc_begin3
	.long	Lset7

	.byte	1
	.byte	111
	.long	52
	.long	52
	.byte	1
	.byte	21
	.long	432

	.byte	3
	.byte	2
	.byte	145
	.byte	0
	.long	83
	.byte	1
	.byte	21
	.long	439
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	81
	.byte	1
	.byte	21
	.long	432
	.byte	0
	.byte	2
	.quad	Lfunc_begin4
.set Lset8, Lfunc_end4-Lfunc_begin4
	.long	Lset8

	.byte	1
	.byte	111
	.long	58
	.long	58
	.byte	1
	.byte	23
	.long	432

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	83
	.byte	1
	.byte	23
	.long	439
	.byte	3
	.byte	2
	.byte	145
	.byte	16
	.long	102
	.byte	1
	.byte	23
	.long	432
	.byte	3
	.byte	2
	.byte	145
	.byte	20
	.long	99
	.byte	1
	.byte	23
	.long	432
	.byte	4
	.byte	2
	.byte	145
	.byte	28
	.long	91
	.byte	1
	.byte	25
	.long	432
	.byte	4
	.byte	2
	.byte	145
	.byte	24
	.long	93
	.byte	1
	.byte	24
	.long	432
	.byte	0
	.byte	2
	.quad	Lfunc_begin5
.set Lset9, Lfunc_end5-Lfunc_begin5
	.long	Lset9

	.byte	1
	.byte	111
	.long	66
	.long	66
	.byte	1
	.byte	37
	.long	432

	.byte	4
	.byte	2
	.byte	145
	.byte	28
	.long	107
	.byte	1
	.byte	41
	.long	432
	.byte	4
	.byte	2
	.byte	145
	.byte	16
	.long	109
	.byte	1
	.byte	40
	.long	439
	.byte	4
	.byte	2
	.byte	145
	.byte	8
	.long	111
	.byte	1
	.byte	39
	.long	439
	.byte	4
	.byte	2
	.byte	145
	.byte	4
	.long	113
	.byte	1
	.byte	38
	.long	432
	.byte	0
	.byte	5
	.long	71
	.byte	5
	.byte	4
	.byte	6
	.long	444
	.byte	5
	.long	86
	.byte	1
	.byte	0
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"49.func_pointer.c"
	.asciz	"../tests"
	.asciz	"addOne"
	.asciz	"square"
	.asciz	"addTwo"
	.asciz	"apply"
	.asciz	"sumWith"
	.asciz	"main"
	.asciz	"int"
	.asciz	"x"
	.asciz	"b"
	.asciz	"a"
	.asciz	"n"
	.asciz	"fn"
	.asciz	"void"
	.asciz	"i"
	.asciz	"total"
	.asciz	"to"
	.asciz	"from"
	.asciz	"r"
	.asciz	"q"
	.asciz	"p"
	.asciz	"failed"
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	6
	.long	6
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	0
	.long	-1
	.long	1
	.long	3
	.long	4
	.long	-1
	.long	475982358
	.long	-1325765738
	.long	-244496600
	.long	253337163
	.long	2090499946
	.long	-244502352
.set Lset10, LNames1-Lnames_begin
	.long	Lset10
.set Lset11, LNames4-Lnames_begin
	.long	Lset11
.set Lset12, LNames2-Lnames_begin
	.long	Lset12
.set Lset13, LNames3-Lnames_begin
	.long	Lset13
.set Lset14, LNames5-Lnames_begin
	.long	Lset14
.set Lset15, LNames0-Lnames_begin
	.long	Lset15
LNames1:
	.long	38
	.long	1
	.long	86
	.long	0
LNames4:
	.long	58
	.long	1
	.long	246
	.long	0
LNames2:
	.long	45
	.long	1
	.long	130
	.long	0
LNames3:
	.long	52
	.long	1
	.long	188
	.long	0
LNames5:
	.long	66
	.long	1
	.long	346
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
.set Lset16, Ltypes0-Ltypes_begin
	.long	Lset16
.set Lset17, Ltypes1-Ltypes_begin
	.long	Lset17
Ltypes0:
	.long	71
	.long	1
	.long	432
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	86
	.long	1
	.long	444
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
