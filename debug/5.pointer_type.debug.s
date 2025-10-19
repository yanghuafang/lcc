	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "5.pointer_type.c"
	.loc	1 8 0
	.cfi_startproc
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]
	.cfi_def_cfa_offset 64
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp0:
	.loc	1 9 3 prologue_end
	str	wzr, [sp, #4]
	add	x9, sp, #11
	.loc	1 10 3
	mov	w8, #65
	strb	w8, [sp, #11]
	add	x8, sp, #12
	.loc	1 11 3
	mov	w10, #128
	str	w10, [sp, #12]
	.loc	1 12 3
	str	x9, [sp, #16]
	.loc	1 13 3
	str	x8, [sp, #24]
	.loc	1 15 3
	ldr	x9, [sp, #16]
	mov	w8, #66
	strb	w8, [x9]
	.loc	1 16 3
	ldr	x9, [sp, #24]
	mov	w8, #256
	str	w8, [x9]
	.loc	1 18 3
	adrp	x8, _gc@PAGE
	add	x8, x8, _gc@PAGEOFF
	str	x8, [sp, #32]
	.loc	1 19 3
	adrp	x8, _gi@PAGE
	add	x8, x8, _gi@PAGEOFF
	str	x8, [sp, #40]
	.loc	1 20 3
	ldr	x9, [sp, #32]
	mov	w8, #98
	strb	w8, [x9]
	.loc	1 21 3
	ldr	x9, [sp, #40]
	mov	w8, #2048
	str	w8, [x9]
	.loc	1 23 3
	ldrsb	w8, [sp, #11]
	subs	w8, w8, #66
	b.eq	LBB0_2
	b	LBB0_1
LBB0_1:
	.loc	1 23 17 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_3
LBB0_2:
	b	LBB0_3
LBB0_3:
	.loc	1 24 3 is_stmt 1
	ldr	x8, [sp, #16]
	ldrsb	w8, [x8]
	subs	w8, w8, #66
	b.eq	LBB0_5
	b	LBB0_4
LBB0_4:
	.loc	1 24 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_6
LBB0_5:
	b	LBB0_6
LBB0_6:
	.loc	1 25 3 is_stmt 1
	ldr	w8, [sp, #12]
	subs	w8, w8, #256
	b.eq	LBB0_8
	b	LBB0_7
LBB0_7:
	.loc	1 25 17 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_9
LBB0_8:
	b	LBB0_9
LBB0_9:
	.loc	1 26 3 is_stmt 1
	ldr	x8, [sp, #24]
	ldr	w8, [x8]
	subs	w8, w8, #256
	b.eq	LBB0_11
	b	LBB0_10
LBB0_10:
	.loc	1 26 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_12
LBB0_11:
	b	LBB0_12
LBB0_12:
	.loc	1 27 3 is_stmt 1
	adrp	x8, _gc@PAGE
	ldrsb	w8, [x8, _gc@PAGEOFF]
	subs	w8, w8, #98
	b.eq	LBB0_14
	b	LBB0_13
LBB0_13:
	.loc	1 27 18 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_15
LBB0_14:
	b	LBB0_15
LBB0_15:
	.loc	1 28 3 is_stmt 1
	adrp	x8, _gi@PAGE
	ldr	w8, [x8, _gi@PAGEOFF]
	subs	w8, w8, #2048
	b.eq	LBB0_17
	b	LBB0_16
LBB0_16:
	.loc	1 28 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_18
LBB0_17:
	b	LBB0_18
LBB0_18:
	.loc	1 30 3 is_stmt 1
	ldr	x8, [sp, #24]
	str	wzr, [x8]
	.loc	1 31 3
	ldr	w8, [sp, #12]
	cbz	w8, LBB0_20
	b	LBB0_19
LBB0_19:
	.loc	1 31 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #4]
	b	LBB0_21
LBB0_20:
	b	LBB0_21
LBB0_21:
	.loc	1 33 3 is_stmt 1
	ldr	w8, [sp, #4]
	cbnz	w8, LBB0_23
	b	LBB0_22
LBB0_22:
Ltmp1:
	.loc	1 34 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB0_24
Ltmp2:
LBB0_23:
	.loc	1 36 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB0_24
Ltmp3:
LBB0_24:
	.loc	1 38 3
	ldr	w0, [sp, #4]
	.loc	1 38 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #48]
	add	sp, sp, #64
	ret
Ltmp4:
Lfunc_end0:
	.cfi_endproc

	.section	__DATA,__data
	.globl	_gc
_gc:
	.byte	97

	.globl	_gi
	.p2align	2, 0x0
_gi:
	.long	1024

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"5.pointer_type.c PASS\n"

l___unnamed_2:
	.asciz	"5.pointer_type.c FAIL\n"

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
.set Lset3, Lfunc_end0-Lfunc_begin0
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
	.byte	8
	.long	170

	.byte	3
	.byte	2
	.byte	145
	.byte	40
	.long	39
	.byte	1
	.byte	19
	.long	177
	.byte	3
	.byte	2
	.byte	145
	.byte	32
	.long	43
	.byte	1
	.byte	18
	.long	182
	.byte	3
	.byte	2
	.byte	145
	.byte	24
	.long	52
	.byte	1
	.byte	13
	.long	177
	.byte	3
	.byte	2
	.byte	145
	.byte	16
	.long	55
	.byte	1
	.byte	12
	.long	182
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	58
	.byte	1
	.byte	11
	.long	170
	.byte	3
	.byte	2
	.byte	145
	.byte	11
	.long	60
	.byte	1
	.byte	10
	.long	187
	.byte	3
	.byte	2
	.byte	145
	.byte	4
	.long	62
	.byte	1
	.byte	9
	.long	170
	.byte	0
	.byte	4
	.long	35
	.byte	5
	.byte	4
	.byte	5
	.long	170
	.byte	5
	.long	187
	.byte	4
	.long	47
	.byte	6
	.byte	1
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"5.pointer_type.c"
	.asciz	"../tests"
	.asciz	"main"
	.asciz	"int"
	.asciz	"pgi"
	.asciz	"pgc"
	.asciz	"char"
	.asciz	"pi"
	.asciz	"pc"
	.asciz	"i"
	.asciz	"c"
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
	.long	30
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
	.long	2090147939
.set Lset6, Ltypes0-Ltypes_begin
	.long	Lset6
.set Lset7, Ltypes1-Ltypes_begin
	.long	Lset7
Ltypes0:
	.long	35
	.long	1
	.long	170
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	47
	.long	1
	.long	187
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
