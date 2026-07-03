	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "29.struct_pointer_move.c"
	.loc	1 8 0
	.cfi_startproc
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]
	.cfi_def_cfa_offset 80
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp0:
	.loc	1 9 3 prologue_end
	str	wzr, [sp, #12]
	add	x8, sp, #16
	mov	w9, #10
	.loc	1 14 3
	str	w9, [sp, #16]
	.loc	1 15 3
	mov	w9, #12
	str	w9, [sp, #20]
	.loc	1 16 3
	mov	w9, #20
	str	w9, [sp, #24]
	.loc	1 17 3
	mov	w9, #24
	str	w9, [sp, #28]
	.loc	1 18 3
	mov	w9, #30
	str	w9, [sp, #32]
	.loc	1 19 3
	mov	w9, #36
	str	w9, [sp, #36]
	.loc	1 20 3
	mov	w9, #40
	str	w9, [sp, #40]
	.loc	1 21 3
	mov	w9, #48
	str	w9, [sp, #44]
	.loc	1 23 3
	str	x8, [sp, #56]
	.loc	1 24 3
	ldr	x8, [sp, #56]
	ldr	w8, [x8]
	str	w8, [sp, #48]
	.loc	1 25 3
	ldr	x8, [sp, #56]
	ldr	w8, [x8, #4]
	str	w8, [sp, #52]
	.loc	1 26 3
	ldr	w8, [sp, #48]
	subs	w8, w8, #10
	b.eq	LBB0_2
	b	LBB0_1
LBB0_1:
	.loc	1 26 17 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_3
LBB0_2:
	b	LBB0_3
LBB0_3:
	.loc	1 27 3 is_stmt 1
	ldr	w8, [sp, #52]
	subs	w8, w8, #12
	b.eq	LBB0_5
	b	LBB0_4
LBB0_4:
	.loc	1 27 18 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_6
LBB0_5:
	b	LBB0_6
LBB0_6:
	.loc	1 28 3 is_stmt 1
	ldr	x8, [sp, #56]
	add	x8, x8, #8
	str	x8, [sp, #56]
	.loc	1 29 3
	ldr	x8, [sp, #56]
	ldr	w8, [x8]
	str	w8, [sp, #48]
	.loc	1 30 3
	ldr	x8, [sp, #56]
	ldr	w8, [x8, #4]
	str	w8, [sp, #52]
	.loc	1 31 3
	ldr	w8, [sp, #48]
	subs	w8, w8, #20
	b.eq	LBB0_8
	b	LBB0_7
LBB0_7:
	.loc	1 31 17 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_9
LBB0_8:
	b	LBB0_9
LBB0_9:
	.loc	1 32 3 is_stmt 1
	ldr	w8, [sp, #52]
	subs	w8, w8, #24
	b.eq	LBB0_11
	b	LBB0_10
LBB0_10:
	.loc	1 32 18 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_12
LBB0_11:
	b	LBB0_12
LBB0_12:
	.loc	1 33 3 is_stmt 1
	ldr	x8, [sp, #56]
	add	x8, x8, #8
	str	x8, [sp, #56]
	.loc	1 34 3
	ldr	x8, [sp, #56]
	ldr	w8, [x8]
	str	w8, [sp, #48]
	.loc	1 35 3
	ldr	w8, [sp, #48]
	subs	w8, w8, #30
	b.eq	LBB0_14
	b	LBB0_13
LBB0_13:
	.loc	1 35 17 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_15
LBB0_14:
	b	LBB0_15
LBB0_15:
	.loc	1 36 3 is_stmt 1
	ldr	x8, [sp, #56]
	add	x8, x8, #8
	str	x8, [sp, #56]
	.loc	1 37 3
	ldr	x8, [sp, #56]
	ldr	w8, [x8]
	str	w8, [sp, #48]
	.loc	1 38 3
	ldr	x8, [sp, #56]
	ldr	w8, [x8, #4]
	str	w8, [sp, #52]
	.loc	1 39 3
	ldr	w8, [sp, #48]
	subs	w8, w8, #40
	b.eq	LBB0_17
	b	LBB0_16
LBB0_16:
	.loc	1 39 17 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_18
LBB0_17:
	b	LBB0_18
LBB0_18:
	.loc	1 40 3 is_stmt 1
	ldr	w8, [sp, #52]
	subs	w8, w8, #48
	b.eq	LBB0_20
	b	LBB0_19
LBB0_19:
	.loc	1 40 18 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_21
LBB0_20:
	b	LBB0_21
LBB0_21:
	.loc	1 42 3 is_stmt 1
	add	x8, sp, #16
	add	x8, x8, #24
	str	x8, [sp, #56]
	.loc	1 43 3
	ldr	x8, [sp, #56]
	subs	x8, x8, #8
	str	x8, [sp, #56]
	.loc	1 44 3
	ldr	x8, [sp, #56]
	ldr	w8, [x8]
	str	w8, [sp, #48]
	.loc	1 45 3
	ldr	w8, [sp, #48]
	subs	w8, w8, #30
	b.eq	LBB0_23
	b	LBB0_22
LBB0_22:
	.loc	1 45 17 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_24
LBB0_23:
	b	LBB0_24
LBB0_24:
	.loc	1 46 3 is_stmt 1
	ldr	x8, [sp, #56]
	subs	x8, x8, #8
	str	x8, [sp, #56]
	.loc	1 47 3
	ldr	x8, [sp, #56]
	ldr	w8, [x8]
	str	w8, [sp, #48]
	.loc	1 48 3
	ldr	w8, [sp, #48]
	subs	w8, w8, #20
	b.eq	LBB0_26
	b	LBB0_25
LBB0_25:
	.loc	1 48 17 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_27
LBB0_26:
	b	LBB0_27
LBB0_27:
	.loc	1 49 3 is_stmt 1
	ldr	x8, [sp, #56]
	subs	x8, x8, #8
	str	x8, [sp, #56]
	.loc	1 50 3
	ldr	x8, [sp, #56]
	ldr	w8, [x8]
	str	w8, [sp, #48]
	.loc	1 51 3
	ldr	w8, [sp, #48]
	subs	w8, w8, #10
	b.eq	LBB0_29
	b	LBB0_28
LBB0_28:
	.loc	1 51 17 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_30
LBB0_29:
	b	LBB0_30
LBB0_30:
	.loc	1 53 3 is_stmt 1
	ldr	w8, [sp, #12]
	cbnz	w8, LBB0_32
	b	LBB0_31
LBB0_31:
Ltmp1:
	.loc	1 54 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB0_33
Ltmp2:
LBB0_32:
	.loc	1 56 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB0_33
Ltmp3:
LBB0_33:
	.loc	1 58 3
	ldr	w0, [sp, #12]
	.loc	1 58 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #64]
	add	sp, sp, #80
	ret
Ltmp4:
Lfunc_end0:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"29.struct_pointer_move.c PASS\n"

l___unnamed_2:
	.asciz	"29.struct_pointer_move.c FAIL\n"

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
	.byte	15
	.byte	0
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	6
	.byte	1
	.byte	1
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	7
	.byte	33
	.byte	0
	.byte	73
	.byte	19
	.byte	55
	.byte	11
	.byte	0
	.byte	0
	.byte	8
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
	.long	29
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end0-Lfunc_begin0
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
	.long	142

	.byte	3
	.byte	2
	.byte	145
	.byte	56
	.long	47
	.byte	1
	.byte	23
	.long	149
	.byte	3
	.byte	2
	.byte	145
	.byte	52
	.long	54
	.byte	1
	.byte	12
	.long	142
	.byte	3
	.byte	2
	.byte	145
	.byte	48
	.long	58
	.byte	1
	.byte	11
	.long	142
	.byte	3
	.byte	2
	.byte	145
	.byte	16
	.long	61
	.byte	1
	.byte	10
	.long	161
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	86
	.byte	1
	.byte	9
	.long	142
	.byte	0
	.byte	4
	.long	43
	.byte	5
	.byte	4
	.byte	5
	.long	154
	.byte	4
	.long	49
	.byte	1
	.byte	0
	.byte	6
	.long	154
	.byte	7
	.long	173
	.byte	4
	.byte	0
	.byte	8
	.long	66
	.byte	8
	.byte	7
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"29.struct_pointer_move.c"
	.asciz	"../tests"
	.asciz	"main"
	.asciz	"int"
	.asciz	"p"
	.asciz	"void"
	.asciz	"val"
	.asciz	"id"
	.asciz	"data"
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
	.long	49
	.long	1
	.long	154
	.short	36
	.byte	0
	.long	0
Ltypes0:
	.long	43
	.long	1
	.long	142
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	66
	.long	1
	.long	173
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
