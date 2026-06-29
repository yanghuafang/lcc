	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "15.logic.c"
	.loc	1 3 0
	.cfi_startproc
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]
	.cfi_def_cfa_offset 64
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #1
Ltmp0:
	.loc	1 4 3 prologue_end
	str	wzr, [sp, #8]
	.loc	1 5 3
	strb	w8, [sp, #14]
	.loc	1 6 3
	strb	wzr, [sp, #15]
	.loc	1 9 3
	cbnz	w8, LBB0_2
	.loc	1 9 15 is_stmt 0
	str	w8, [sp, #8]
LBB0_2:
	.loc	1 10 3 is_stmt 1
	ldrb	w8, [sp, #15]
	cbz	w8, LBB0_4
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 10 15
	str	w8, [sp, #8]
LBB0_4:
	.loc	1 12 3 is_stmt 1
	ldrb	w8, [sp, #14]
	ldrb	w9, [sp, #15]
	and	w8, w8, w9
	sbfx	w9, w8, #0, #1
	str	w9, [sp, #16]
	.loc	1 13 3
	tbz	w8, #0, LBB0_6
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 13 15
	str	w8, [sp, #8]
LBB0_6:
	.loc	1 14 3 is_stmt 1
	ldrb	w8, [sp, #14]
	sbfx	w8, w8, #0, #1
	str	w8, [sp, #16]
	.loc	1 15 3
	cbnz	w8, LBB0_8
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 15 15
	str	w8, [sp, #8]
LBB0_8:
	.loc	1 16 3 is_stmt 1
	ldrb	w8, [sp, #15]
	sbfx	w8, w8, #0, #1
	str	w8, [sp, #16]
	.loc	1 17 3
	cbz	w8, LBB0_10
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 17 15
	str	w8, [sp, #8]
LBB0_10:
	.loc	1 19 3 is_stmt 1
	ldrb	w8, [sp, #14]
	ldrb	w9, [sp, #15]
	orr	w8, w8, w9
	sbfx	w9, w8, #0, #1
	str	w9, [sp, #16]
	.loc	1 20 3
	tbnz	w8, #0, LBB0_12
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 20 15
	str	w8, [sp, #8]
LBB0_12:
	.loc	1 21 3 is_stmt 1
	ldrb	w8, [sp, #14]
	orr	w8, w8, w8
	sbfx	w9, w8, #0, #1
	str	w9, [sp, #16]
	.loc	1 22 3
	tbnz	w8, #0, LBB0_14
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 22 15
	str	w8, [sp, #8]
LBB0_14:
	.loc	1 23 3 is_stmt 1
	ldrb	w8, [sp, #15]
	orr	w8, w8, w8
	sbfx	w9, w8, #0, #1
	str	w9, [sp, #16]
	.loc	1 24 3
	tbz	w8, #0, LBB0_16
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 24 15
	str	w8, [sp, #8]
LBB0_16:
	.loc	1 26 3 is_stmt 1
	ldrb	w8, [sp, #14]
	subs	w8, w8, #1
	str	w8, [sp, #16]
	.loc	1 27 3
	b.eq	LBB0_18
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 27 15
	str	w8, [sp, #8]
LBB0_18:
	.loc	1 28 3 is_stmt 1
	ldrb	w8, [sp, #15]
	subs	w8, w8, #1
	str	w8, [sp, #16]
	.loc	1 29 3
	b.ne	LBB0_20
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 29 15
	str	w8, [sp, #8]
LBB0_20:
	.loc	1 0 15
	mov	w8, #100
	mov	w9, #128
	.loc	1 31 3 is_stmt 1
	stp	w8, w8, [sp, #20]
	mov	w8, #-1
	.loc	1 33 3
	str	w9, [sp, #28]
	.loc	1 35 3
	str	w8, [sp, #16]
	.loc	1 36 3
	cbnz	w8, LBB0_22
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 36 15
	str	w8, [sp, #8]
LBB0_22:
	.loc	1 37 3 is_stmt 1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #28]
	cmp	w8, w9
	csetm	w8, eq
	str	w8, [sp, #16]
	.loc	1 38 3
	cbz	w8, LBB0_24
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 38 15
	str	w8, [sp, #8]
LBB0_24:
	.loc	1 39 3 is_stmt 1
	ldp	w8, w9, [sp, #20]
	cmp	w8, w9
	csetm	w8, ne
	str	w8, [sp, #16]
	.loc	1 40 3
	cbz	w8, LBB0_26
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 40 15
	str	w8, [sp, #8]
LBB0_26:
	.loc	1 41 3 is_stmt 1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #28]
	cmp	w8, w9
	csetm	w8, ne
	str	w8, [sp, #16]
	.loc	1 42 3
	cbnz	w8, LBB0_28
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 42 15
	str	w8, [sp, #8]
LBB0_28:
	.loc	1 43 3 is_stmt 1
	ldp	w8, w9, [sp, #20]
	cmp	w8, w9
	csetm	w8, lt
	str	w8, [sp, #16]
	.loc	1 44 3
	cbz	w8, LBB0_30
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 44 15
	str	w8, [sp, #8]
LBB0_30:
	.loc	1 45 3 is_stmt 1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #28]
	cmp	w8, w9
	csetm	w8, lt
	str	w8, [sp, #16]
	.loc	1 46 3
	cbnz	w8, LBB0_32
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 46 15
	str	w8, [sp, #8]
LBB0_32:
	.loc	1 47 3 is_stmt 1
	ldr	w8, [sp, #28]
	ldr	w9, [sp, #20]
	cmp	w8, w9
	csetm	w8, lt
	str	w8, [sp, #16]
	.loc	1 48 3
	cbz	w8, LBB0_34
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 48 15
	str	w8, [sp, #8]
LBB0_34:
	.loc	1 49 3 is_stmt 1
	ldp	w8, w9, [sp, #20]
	cmp	w8, w9
	csetm	w8, le
	str	w8, [sp, #16]
	.loc	1 50 3
	cbnz	w8, LBB0_36
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 50 15
	str	w8, [sp, #8]
LBB0_36:
	.loc	1 51 3 is_stmt 1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #28]
	cmp	w8, w9
	csetm	w8, le
	str	w8, [sp, #16]
	.loc	1 52 3
	cbnz	w8, LBB0_38
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 52 15
	str	w8, [sp, #8]
LBB0_38:
	.loc	1 53 3 is_stmt 1
	ldr	w8, [sp, #28]
	ldr	w9, [sp, #20]
	cmp	w8, w9
	csetm	w8, le
	str	w8, [sp, #16]
	.loc	1 54 3
	cbz	w8, LBB0_40
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 54 15
	str	w8, [sp, #8]
LBB0_40:
	.loc	1 55 3 is_stmt 1
	ldp	w8, w9, [sp, #20]
	cmp	w8, w9
	csetm	w8, gt
	str	w8, [sp, #16]
	.loc	1 56 3
	cbz	w8, LBB0_42
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 56 15
	str	w8, [sp, #8]
LBB0_42:
	.loc	1 57 3 is_stmt 1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #28]
	cmp	w8, w9
	csetm	w8, gt
	str	w8, [sp, #16]
	.loc	1 58 3
	cbz	w8, LBB0_44
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 58 15
	str	w8, [sp, #8]
LBB0_44:
	.loc	1 59 3 is_stmt 1
	ldr	w8, [sp, #28]
	ldr	w9, [sp, #20]
	cmp	w8, w9
	csetm	w8, gt
	str	w8, [sp, #16]
	.loc	1 60 3
	cbnz	w8, LBB0_46
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 60 15
	str	w8, [sp, #8]
LBB0_46:
	.loc	1 61 3 is_stmt 1
	ldp	w8, w9, [sp, #20]
	cmp	w8, w9
	csetm	w8, ge
	str	w8, [sp, #16]
	.loc	1 62 3
	cbnz	w8, LBB0_48
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 62 15
	str	w8, [sp, #8]
LBB0_48:
	.loc	1 63 3 is_stmt 1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #28]
	cmp	w8, w9
	csetm	w8, ge
	str	w8, [sp, #16]
	.loc	1 64 3
	cbz	w8, LBB0_50
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 64 15
	str	w8, [sp, #8]
LBB0_50:
	.loc	1 65 3 is_stmt 1
	ldr	w8, [sp, #28]
	ldr	w9, [sp, #20]
	cmp	w8, w9
	csetm	w8, ge
	str	w8, [sp, #16]
	.loc	1 66 3
	cbnz	w8, LBB0_52
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 66 15
	str	w8, [sp, #8]
LBB0_52:
	.loc	1 0 15
	mov	w8, #1
	mov	w9, #-1
	.loc	1 68 3 is_stmt 1
	stp	w8, w9, [sp, #32]
	.loc	1 70 3
	str	w9, [sp, #16]
	.loc	1 71 3
	cbnz	w9, LBB0_54
	.loc	1 71 15 is_stmt 0
	str	w8, [sp, #8]
LBB0_54:
	.loc	1 72 3 is_stmt 1
	ldp	w9, w8, [sp, #32]
	cmp	w8, w9
	csetm	w8, hi
	str	w8, [sp, #16]
	.loc	1 73 3
	cbnz	w8, LBB0_56
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 73 15
	str	w8, [sp, #8]
LBB0_56:
	.loc	1 0 15
	mov	w9, #-1
	mov	w8, #1
	.loc	1 77 3 is_stmt 1
	str	wzr, [sp, #16]
	.loc	1 75 3
	stp	w9, w8, [sp, #40]
	.loc	1 78 3
	cbz	wzr, LBB0_58
	.loc	1 78 15 is_stmt 0
	str	w8, [sp, #8]
LBB0_58:
	.loc	1 79 3 is_stmt 1
	ldp	w8, w9, [sp, #40]
	cmp	w8, w9
	csetm	w8, hi
	str	w8, [sp, #16]
	.loc	1 80 3
	cbnz	w8, LBB0_60
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 80 15
	str	w8, [sp, #8]
LBB0_60:
	.loc	1 82 3 is_stmt 1
	ldr	w8, [sp, #8]
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
	.loc	1 87 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #48]
	ldr	w0, [sp, #8]
	add	sp, sp, #64
	ret
Ltmp1:
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
Lfunc_end0:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_2:
	.asciz	"15.logic.c PASS\n"

l___unnamed_1:
	.asciz	"15.logic.c FAIL\n"

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
	.long	15
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end0-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	24
	.long	24
	.byte	1
	.byte	3
	.long	226

	.byte	3
	.byte	2
	.byte	145
	.byte	44
	.long	33
	.byte	1
	.byte	76
	.long	233
	.byte	3
	.byte	2
	.byte	145
	.byte	40
	.long	49
	.byte	1
	.byte	75
	.long	226
	.byte	3
	.byte	2
	.byte	145
	.byte	36
	.long	52
	.byte	1
	.byte	69
	.long	233
	.byte	3
	.byte	2
	.byte	145
	.byte	32
	.long	55
	.byte	1
	.byte	68
	.long	233
	.byte	3
	.byte	2
	.byte	145
	.byte	28
	.long	58
	.byte	1
	.byte	33
	.long	226
	.byte	3
	.byte	2
	.byte	145
	.byte	24
	.long	60
	.byte	1
	.byte	32
	.long	226
	.byte	3
	.byte	2
	.byte	145
	.byte	20
	.long	62
	.byte	1
	.byte	31
	.long	226
	.byte	3
	.byte	2
	.byte	145
	.byte	16
	.long	64
	.byte	1
	.byte	7
	.long	226
	.byte	3
	.byte	2
	.byte	145
	.byte	15
	.long	66
	.byte	1
	.byte	6
	.long	240
	.byte	3
	.byte	2
	.byte	145
	.byte	14
	.long	73
	.byte	1
	.byte	5
	.long	240
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	75
	.byte	1
	.byte	4
	.long	226
	.byte	0
	.byte	4
	.long	29
	.byte	5
	.byte	4
	.byte	4
	.long	36
	.byte	7
	.byte	4
	.byte	4
	.long	68
	.byte	2
	.byte	1
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"15.logic.c"
	.asciz	"../tests"
	.asciz	"main"
	.asciz	"int"
	.asciz	"ui"
	.asciz	"unsigned int"
	.asciz	"si"
	.asciz	"ub"
	.asciz	"ua"
	.asciz	"c"
	.asciz	"b"
	.asciz	"a"
	.asciz	"v"
	.asciz	"f"
	.asciz	"bool"
	.asciz	"t"
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
	.long	24
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
	.long	-1
	.long	-1
	.long	0
	.long	193495088
	.long	2090120081
	.long	-1304652851
.set Lset6, Ltypes0-Ltypes_begin
	.long	Lset6
.set Lset7, Ltypes2-Ltypes_begin
	.long	Lset7
.set Lset8, Ltypes1-Ltypes_begin
	.long	Lset8
Ltypes0:
	.long	29
	.long	1
	.long	226
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	68
	.long	1
	.long	240
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	36
	.long	1
	.long	233
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
