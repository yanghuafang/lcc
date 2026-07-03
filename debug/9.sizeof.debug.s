	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "9.sizeof.c"
	.loc	1 17 0
	.cfi_startproc
	sub	sp, sp, #112
	stp	x29, x30, [sp, #96]
	.cfi_def_cfa_offset 112
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp0:
	.loc	1 18 3 prologue_end
	mov	w8, wzr
	str	wzr, [sp, #12]
	.loc	1 29 3
	tbz	w8, #0, LBB0_2
	b	LBB0_1
LBB0_1:
	.loc	1 29 26 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_3
LBB0_2:
	b	LBB0_3
LBB0_3:
	.loc	1 0 26
	mov	w8, wzr
	.loc	1 30 3 is_stmt 1
	tbz	w8, #0, LBB0_5
	b	LBB0_4
LBB0_4:
	.loc	1 30 27 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_6
LBB0_5:
	b	LBB0_6
LBB0_6:
	.loc	1 0 27
	mov	w8, wzr
	.loc	1 31 3 is_stmt 1
	tbz	w8, #0, LBB0_8
	b	LBB0_7
LBB0_7:
	.loc	1 31 25 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_9
LBB0_8:
	b	LBB0_9
LBB0_9:
	.loc	1 0 25
	mov	w8, wzr
	.loc	1 32 3 is_stmt 1
	tbz	w8, #0, LBB0_11
	b	LBB0_10
LBB0_10:
	.loc	1 32 26 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_12
LBB0_11:
	b	LBB0_12
LBB0_12:
	.loc	1 0 26
	mov	w8, wzr
	.loc	1 33 3 is_stmt 1
	tbz	w8, #0, LBB0_14
	b	LBB0_13
LBB0_13:
	.loc	1 33 27 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_15
LBB0_14:
	b	LBB0_15
LBB0_15:
	.loc	1 0 27
	mov	w8, wzr
	.loc	1 34 3 is_stmt 1
	tbz	w8, #0, LBB0_17
	b	LBB0_16
LBB0_16:
	.loc	1 34 28 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_18
LBB0_17:
	b	LBB0_18
LBB0_18:
	.loc	1 0 28
	mov	w8, wzr
	.loc	1 35 3 is_stmt 1
	tbz	w8, #0, LBB0_20
	b	LBB0_19
LBB0_19:
	.loc	1 35 27 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_21
LBB0_20:
	b	LBB0_21
LBB0_21:
	.loc	1 0 27
	mov	w8, wzr
	.loc	1 36 3 is_stmt 1
	tbz	w8, #0, LBB0_23
	b	LBB0_22
LBB0_22:
	.loc	1 36 26 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_24
LBB0_23:
	b	LBB0_24
LBB0_24:
	.loc	1 0 26
	mov	w8, wzr
	.loc	1 37 3 is_stmt 1
	tbz	w8, #0, LBB0_26
	b	LBB0_25
LBB0_25:
	.loc	1 37 23 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_27
LBB0_26:
	b	LBB0_27
LBB0_27:
	.loc	1 0 23
	mov	w8, wzr
	.loc	1 38 3 is_stmt 1
	tbz	w8, #0, LBB0_29
	b	LBB0_28
LBB0_28:
	.loc	1 38 23 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_30
LBB0_29:
	b	LBB0_30
LBB0_30:
	.loc	1 0 23
	mov	w8, wzr
	.loc	1 39 3 is_stmt 1
	tbz	w8, #0, LBB0_32
	b	LBB0_31
LBB0_31:
	.loc	1 39 25 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_33
LBB0_32:
	b	LBB0_33
LBB0_33:
	.loc	1 0 25
	mov	w8, wzr
	.loc	1 40 3 is_stmt 1
	tbz	w8, #0, LBB0_35
	b	LBB0_34
LBB0_34:
	.loc	1 40 25 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB0_36
LBB0_35:
	b	LBB0_36
LBB0_36:
	.loc	1 42 3 is_stmt 1
	ldr	w8, [sp, #12]
	cbnz	w8, LBB0_38
	b	LBB0_37
LBB0_37:
Ltmp1:
	.loc	1 43 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB0_39
Ltmp2:
LBB0_38:
	.loc	1 45 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB0_39
Ltmp3:
LBB0_39:
	.loc	1 47 3
	ldr	w0, [sp, #12]
	.loc	1 47 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #96]
	add	sp, sp, #112
	ret
Ltmp4:
Lfunc_end0:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"9.sizeof.c PASS\n"

l___unnamed_2:
	.asciz	"9.sizeof.c FAIL\n"

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
	.byte	23
	.byte	1
	.byte	3
	.byte	14
	.byte	11
	.byte	11
	.ascii	"\210\001"
	.byte	15
	.byte	0
	.byte	0
	.byte	6
	.byte	13
	.byte	0
	.byte	3
	.byte	14
	.byte	73
	.byte	19
	.ascii	"\210\001"
	.byte	15
	.byte	56
	.byte	11
	.byte	0
	.byte	0
	.byte	7
	.byte	15
	.byte	0
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	8
	.byte	19
	.byte	1
	.byte	3
	.byte	14
	.byte	11
	.byte	11
	.ascii	"\210\001"
	.byte	15
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
	.byte	17
	.long	214

	.byte	3
	.byte	3
	.byte	145
	.asciz	"\334"
	.long	33
	.byte	1
	.byte	27
	.long	214
	.byte	3
	.byte	3
	.byte	145
	.asciz	"\320"
	.long	37
	.byte	1
	.byte	26
	.long	221
	.byte	3
	.byte	2
	.byte	145
	.byte	56
	.long	53
	.byte	1
	.byte	25
	.long	263
	.byte	3
	.byte	2
	.byte	145
	.byte	48
	.long	81
	.byte	1
	.byte	24
	.long	251
	.byte	3
	.byte	2
	.byte	145
	.byte	40
	.long	84
	.byte	1
	.byte	23
	.long	322
	.byte	3
	.byte	2
	.byte	145
	.byte	36
	.long	93
	.byte	1
	.byte	22
	.long	315
	.byte	3
	.byte	2
	.byte	145
	.byte	24
	.long	95
	.byte	1
	.byte	21
	.long	329
	.byte	3
	.byte	2
	.byte	145
	.byte	20
	.long	102
	.byte	1
	.byte	20
	.long	214
	.byte	3
	.byte	2
	.byte	145
	.byte	19
	.long	104
	.byte	1
	.byte	19
	.long	256
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	106
	.byte	1
	.byte	18
	.long	214
	.byte	0
	.byte	4
	.long	29
	.byte	5
	.byte	4
	.byte	5
	.long	40
	.byte	8
	.byte	8
	.byte	6
	.long	37
	.long	214
	.byte	4
	.byte	0
	.byte	6
	.long	43
	.long	251
	.byte	8
	.byte	0
	.byte	0
	.byte	7
	.long	256
	.byte	4
	.long	48
	.byte	6
	.byte	1
	.byte	8
	.long	61
	.byte	24
	.byte	8
	.byte	6
	.long	37
	.long	214
	.byte	4
	.byte	0
	.byte	6
	.long	43
	.long	251
	.byte	8
	.byte	8
	.byte	6
	.long	33
	.long	256
	.byte	1
	.byte	16
	.byte	6
	.long	69
	.long	315
	.byte	4
	.byte	20
	.byte	0
	.byte	4
	.long	75
	.byte	4
	.byte	4
	.byte	4
	.long	86
	.byte	4
	.byte	8
	.byte	4
	.long	97
	.byte	5
	.byte	8
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"9.sizeof.c"
	.asciz	"../tests"
	.asciz	"main"
	.asciz	"int"
	.asciz	"sex"
	.asciz	"id"
	.asciz	"ID"
	.asciz	"name"
	.asciz	"char"
	.asciz	"student"
	.asciz	"Student"
	.asciz	"score"
	.asciz	"float"
	.asciz	"pc"
	.asciz	"d"
	.asciz	"double"
	.asciz	"f"
	.asciz	"l"
	.asciz	"long"
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
	.long	7
	.long	7
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
	.long	0
	.long	-1
	.long	2
	.long	3
	.long	4
	.long	6
	.long	259121563
	.long	2090479413
	.long	193495088
	.long	-113419488
	.long	5862386
	.long	2090147939
	.long	267746828
.set Lset6, Ltypes4-Ltypes_begin
	.long	Lset6
.set Lset7, Ltypes6-Ltypes_begin
	.long	Lset7
.set Lset8, Ltypes0-Ltypes_begin
	.long	Lset8
.set Lset9, Ltypes5-Ltypes_begin
	.long	Lset9
.set Lset10, Ltypes1-Ltypes_begin
	.long	Lset10
.set Lset11, Ltypes2-Ltypes_begin
	.long	Lset11
.set Lset12, Ltypes3-Ltypes_begin
	.long	Lset12
Ltypes4:
	.long	75
	.long	1
	.long	315
	.short	36
	.byte	0
	.long	0
Ltypes6:
	.long	97
	.long	1
	.long	329
	.short	36
	.byte	0
	.long	0
Ltypes0:
	.long	29
	.long	1
	.long	214
	.short	36
	.byte	0
	.long	0
Ltypes5:
	.long	86
	.long	1
	.long	322
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	40
	.long	1
	.long	221
	.short	23
	.byte	0
	.long	0
Ltypes2:
	.long	48
	.long	1
	.long	256
	.short	36
	.byte	0
	.long	0
Ltypes3:
	.long	61
	.long	1
	.long	263
	.short	19
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
