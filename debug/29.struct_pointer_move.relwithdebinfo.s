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
	mov	x9, #12
	mov	x10, #40
	mov	w8, #10
	movk	x9, #20, lsl #32
	movk	x10, #48, lsl #32
Ltmp0:
	.loc	1 26 3 prologue_end
	cmp	w8, #10
	.loc	1 15 3
	stur	x9, [sp, #20]
	mov	w9, #24
	.loc	1 17 3
	str	w9, [sp, #28]
	mov	x9, #30
	movk	x9, #36, lsl #32
	.loc	1 9 3
	stp	wzr, w8, [sp, #12]
	.loc	1 18 3
	stp	x9, x10, [sp, #32]
	add	x9, sp, #16
	.loc	1 23 3
	str	x9, [sp, #56]
	mov	w9, #12
	.loc	1 24 3
	stp	w8, w9, [sp, #48]
	.loc	1 26 3
	b.eq	LBB0_2
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 26 17
	str	w8, [sp, #12]
LBB0_2:
	.loc	1 27 3 is_stmt 1
	ldr	w8, [sp, #52]
	cmp	w8, #12
	b.eq	LBB0_4
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 27 18
	str	w8, [sp, #12]
LBB0_4:
	.loc	1 28 3 is_stmt 1
	ldr	x8, [sp, #56]
	.loc	1 29 3
	ldr	w9, [x8, #8]!
	.loc	1 28 3
	str	x8, [sp, #56]
	.loc	1 30 3
	ldr	w8, [x8, #4]
	.loc	1 31 3
	cmp	w9, #20
	.loc	1 29 3
	stp	w9, w8, [sp, #48]
	.loc	1 31 3
	b.eq	LBB0_6
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 31 17
	str	w8, [sp, #12]
LBB0_6:
	.loc	1 32 3 is_stmt 1
	ldr	w8, [sp, #52]
	cmp	w8, #24
	b.eq	LBB0_8
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 32 18
	str	w8, [sp, #12]
LBB0_8:
	.loc	1 33 3 is_stmt 1
	ldr	x8, [sp, #56]
	.loc	1 34 3
	ldr	w9, [x8, #8]!
	.loc	1 33 3
	str	x8, [sp, #56]
	.loc	1 35 3
	cmp	w9, #30
	.loc	1 34 3
	str	w9, [sp, #48]
	.loc	1 35 3
	b.eq	LBB0_10
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 35 17
	str	w8, [sp, #12]
LBB0_10:
	.loc	1 36 3 is_stmt 1
	ldr	x8, [sp, #56]
	.loc	1 37 3
	ldr	w9, [x8, #8]!
	.loc	1 36 3
	str	x8, [sp, #56]
	.loc	1 38 3
	ldr	w8, [x8, #4]
	.loc	1 39 3
	cmp	w9, #40
	.loc	1 37 3
	stp	w9, w8, [sp, #48]
	.loc	1 39 3
	b.eq	LBB0_12
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 39 17
	str	w8, [sp, #12]
LBB0_12:
	.loc	1 40 3 is_stmt 1
	ldr	w8, [sp, #52]
	cmp	w8, #48
	b.eq	LBB0_14
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 40 18
	str	w8, [sp, #12]
LBB0_14:
	.loc	1 44 3 is_stmt 1
	ldr	w9, [sp, #32]
	add	x8, sp, #16
	.loc	1 43 3
	add	x8, x8, #16
	.loc	1 45 3
	cmp	w9, #30
	.loc	1 43 3
	str	x8, [sp, #56]
	.loc	1 44 3
	str	w9, [sp, #48]
	.loc	1 45 3
	b.eq	LBB0_16
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 45 17
	str	w8, [sp, #12]
LBB0_16:
	.loc	1 46 3 is_stmt 1
	ldr	x8, [sp, #56]
	.loc	1 47 3
	ldr	w9, [x8, #-8]!
	.loc	1 46 3
	str	x8, [sp, #56]
	.loc	1 48 3
	cmp	w9, #20
	.loc	1 47 3
	str	w9, [sp, #48]
	.loc	1 48 3
	b.eq	LBB0_18
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 48 17
	str	w8, [sp, #12]
LBB0_18:
	.loc	1 49 3 is_stmt 1
	ldr	x8, [sp, #56]
	.loc	1 50 3
	ldr	w9, [x8, #-8]!
	.loc	1 49 3
	str	x8, [sp, #56]
	.loc	1 51 3
	cmp	w9, #10
	.loc	1 50 3
	str	w9, [sp, #48]
	.loc	1 51 3
	b.eq	LBB0_20
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 51 17
	str	w8, [sp, #12]
LBB0_20:
	.loc	1 53 3 is_stmt 1
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
	.loc	1 58 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #64]
	ldr	w0, [sp, #12]
	add	sp, sp, #80
	ret
Ltmp1:
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
Lfunc_end0:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_2:
	.asciz	"29.struct_pointer_move.c PASS\n"

l___unnamed_1:
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
