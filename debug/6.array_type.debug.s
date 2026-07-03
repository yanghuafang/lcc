	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "6.array_type.c"
	.loc	1 7 0
	.cfi_startproc
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]
	.cfi_def_cfa_offset 64
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp0:
	.loc	1 8 3 prologue_end
	str	wzr, [sp, #12]
	.loc	1 12 3
	mov	w8, #103
	strb	w8, [sp, #16]
	mov	w8, #111
	.loc	1 13 3
	strb	w8, [sp, #17]
	.loc	1 14 3
	strb	w8, [sp, #18]
	.loc	1 15 3
	mov	w8, #100
	strb	w8, [sp, #19]
	.loc	1 16 3
	strb	wzr, [sp, #20]
	adrp	x10, _gs@PAGE
	adrp	x8, _gs@PAGE
	add	x8, x8, _gs@PAGEOFF
	.loc	1 18 3
	mov	w9, #108
	strb	w9, [x10, _gs@PAGEOFF]
	.loc	1 19 3
	mov	w9, #117
	strb	w9, [x8, #1]
	.loc	1 20 3
	mov	w9, #99
	strb	w9, [x8, #2]
	.loc	1 21 3
	mov	w9, #107
	strb	w9, [x8, #3]
	.loc	1 22 3
	mov	w9, #121
	strb	w9, [x8, #4]
	.loc	1 23 3
	strb	wzr, [x8, #5]
	mov	w8, #128
	.loc	1 25 3
	str	w8, [sp, #32]
	.loc	1 26 3
	mov	w8, #256
	str	w8, [sp, #36]
	adrp	x10, _gi@PAGE
	adrp	x9, _gi@PAGE
	add	x9, x9, _gi@PAGEOFF
	.loc	1 27 3
	mov	w8, #1024
	str	w8, [x10, _gi@PAGEOFF]
	.loc	1 28 3
	mov	w8, #2048
	str	w8, [x9, #4]
	.loc	1 30 3
	ldr	w8, [sp, #32]
	subs	w8, w8, #128
	b.eq	LBB0_2
	b	LBB0_1
LBB0_1:
	.loc	1 30 20 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_3
LBB0_2:
	b	LBB0_3
LBB0_3:
	.loc	1 31 3 is_stmt 1
	ldr	w8, [sp, #36]
	subs	w8, w8, #256
	b.eq	LBB0_5
	b	LBB0_4
LBB0_4:
	.loc	1 31 20 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_6
LBB0_5:
	b	LBB0_6
LBB0_6:
	.loc	1 32 3 is_stmt 1
	adrp	x8, _gi@PAGE
	ldr	w8, [x8, _gi@PAGEOFF]
	subs	w8, w8, #1024
	b.eq	LBB0_8
	b	LBB0_7
LBB0_7:
	.loc	1 32 22 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_9
LBB0_8:
	b	LBB0_9
LBB0_9:
	.loc	1 33 3 is_stmt 1
	adrp	x8, _gi@PAGE
	add	x8, x8, _gi@PAGEOFF
	ldr	w8, [x8, #4]
	subs	w8, w8, #2048
	b.eq	LBB0_11
	b	LBB0_10
LBB0_10:
	.loc	1 33 22 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_12
LBB0_11:
	b	LBB0_12
LBB0_12:
	.loc	1 34 3 is_stmt 1
	ldrsb	w8, [sp, #16]
	subs	w8, w8, #103
	b.eq	LBB0_14
	b	LBB0_13
LBB0_13:
	.loc	1 34 20 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_15
LBB0_14:
	b	LBB0_15
LBB0_15:
	.loc	1 35 3 is_stmt 1
	adrp	x8, _gs@PAGE
	ldrsb	w8, [x8, _gs@PAGEOFF]
	subs	w8, w8, #108
	b.eq	LBB0_17
	b	LBB0_16
LBB0_16:
	.loc	1 35 21 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_18
LBB0_17:
	b	LBB0_18
LBB0_18:
	.loc	1 37 3 is_stmt 1
	str	wzr, [sp, #40]
	.loc	1 38 3
	mov	w8, #-1
	str	w8, [sp, #44]
	.loc	1 39 3
	ldr	w8, [sp, #40]
	cbz	w8, LBB0_20
	b	LBB0_19
LBB0_19:
	.loc	1 39 18 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_21
LBB0_20:
	b	LBB0_21
LBB0_21:
	.loc	1 40 3 is_stmt 1
	ldr	w8, [sp, #44]
	adds	w8, w8, #1
	b.eq	LBB0_23
	b	LBB0_22
LBB0_22:
	.loc	1 40 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_24
LBB0_23:
	b	LBB0_24
LBB0_24:
	.loc	1 42 3 is_stmt 1
	ldr	w8, [sp, #12]
	cbnz	w8, LBB0_26
	b	LBB0_25
LBB0_25:
Ltmp1:
	.loc	1 43 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB0_27
Ltmp2:
LBB0_26:
	.loc	1 45 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB0_27
Ltmp3:
LBB0_27:
	.loc	1 47 3
	ldr	w0, [sp, #12]
	.loc	1 47 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #48]
	add	sp, sp, #64
	ret
Ltmp4:
Lfunc_end0:
	.cfi_endproc

	.globl	_gs
.zerofill __DATA,__common,_gs,16,0
	.section	__TEXT,__cstring,cstring_literals
l___unnamed_3:
	.asciz	"hello world!"

	.section	__DATA,__data
	.globl	_gps
	.p2align	3, 0x0
_gps:
	.quad	l___unnamed_3

	.globl	_gi
.zerofill __DATA,__common,_gi,16,2
	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"6.array_type.c PASS\n"

l___unnamed_2:
	.asciz	"6.array_type.c FAIL\n"

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
	.byte	1
	.byte	1
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	6
	.byte	33
	.byte	0
	.byte	73
	.byte	19
	.byte	55
	.byte	11
	.byte	0
	.byte	0
	.byte	7
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
	.long	19
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end0-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	28
	.long	28
	.byte	1
	.byte	7
	.long	114

	.byte	3
	.byte	2
	.byte	145
	.byte	32
	.long	37
	.byte	1
	.byte	10
	.long	121
	.byte	3
	.byte	2
	.byte	145
	.byte	16
	.long	59
	.byte	1
	.byte	9
	.long	140
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	66
	.byte	1
	.byte	8
	.long	114
	.byte	0
	.byte	4
	.long	33
	.byte	5
	.byte	4
	.byte	5
	.long	114
	.byte	6
	.long	133
	.byte	4
	.byte	0
	.byte	7
	.long	39
	.byte	8
	.byte	7
	.byte	5
	.long	152
	.byte	6
	.long	133
	.byte	16
	.byte	0
	.byte	4
	.long	61
	.byte	6
	.byte	1
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"6.array_type.c"
	.asciz	"../tests"
	.asciz	"main"
	.asciz	"int"
	.asciz	"i"
	.asciz	"__ARRAY_SIZE_TYPE__"
	.asciz	"s"
	.asciz	"char"
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
	.long	28
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
	.long	2090147939
	.long	-594775205
.set Lset6, Ltypes0-Ltypes_begin
	.long	Lset6
.set Lset7, Ltypes2-Ltypes_begin
	.long	Lset7
.set Lset8, Ltypes1-Ltypes_begin
	.long	Lset8
Ltypes0:
	.long	33
	.long	1
	.long	114
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	61
	.long	1
	.long	152
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	39
	.long	1
	.long	133
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
