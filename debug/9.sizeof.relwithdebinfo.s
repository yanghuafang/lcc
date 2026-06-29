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
	.loc	1 0 0 is_stmt 0
Lloh0:
	adrp	x0, l___unnamed_1@PAGE
Lloh1:
	add	x0, x0, l___unnamed_1@PAGEOFF
	.loc	1 18 3 prologue_end is_stmt 1
	str	wzr, [sp, #12]
	.loc	1 0 0 is_stmt 0
	bl	_printf
	.loc	1 47 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #96]
	ldr	w0, [sp, #12]
	add	sp, sp, #112
	ret
Ltmp1:
	.loh AdrpAdd	Lloh0, Lloh1
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
