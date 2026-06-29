	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "11.type_cast.c"
	.loc	1 3 0
	.cfi_startproc
	sub	sp, sp, #128
	stp	x29, x30, [sp, #112]
	.cfi_def_cfa_offset 128
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x10, #1073741824
	mov	w8, #65
	mov	w9, #4058
	movk	x10, #8699, lsl #32
	movk	w9, #16457, lsl #16
Ltmp0:
	.loc	1 25 3 prologue_end
	cmp	w8, #65
	movk	x10, #16393, lsl #48
	.loc	1 4 3
	str	wzr, [sp, #8]
	.loc	1 5 3
	strb	w8, [sp, #12]
	.loc	1 6 3
	strb	w8, [sp, #13]
	.loc	1 7 3
	strb	w8, [sp, #14]
	.loc	1 8 3
	strb	w8, [sp, #15]
	.loc	1 10 3
	stp	w8, w8, [sp, #16]
	.loc	1 12 3
	stp	w8, w8, [sp, #24]
	.loc	1 15 3
	stp	x8, x8, [sp, #32]
	.loc	1 17 3
	stp	x8, x8, [sp, #48]
	.loc	1 20 3
	str	w9, [sp, #68]
	.loc	1 21 3
	stp	x10, x10, [sp, #72]
	.loc	1 23 3
	str	w9, [sp, #92]
	.loc	1 25 3
	b.eq	LBB0_2
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 25 24
	str	w8, [sp, #8]
LBB0_2:
	.loc	1 26 3 is_stmt 1
	ldrb	w8, [sp, #13]
	cmp	w8, #65
	b.eq	LBB0_4
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 26 23
	str	w8, [sp, #8]
LBB0_4:
	.loc	1 27 3 is_stmt 1
	ldr	w8, [sp, #16]
	cmp	w8, #65
	b.eq	LBB0_6
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 27 21
	str	w8, [sp, #8]
LBB0_6:
	.loc	1 28 3 is_stmt 1
	ldr	w8, [sp, #20]
	cmp	w8, #65
	b.eq	LBB0_8
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 28 22
	str	w8, [sp, #8]
LBB0_8:
	.loc	1 29 3 is_stmt 1
	ldr	w8, [sp, #28]
	cmp	w8, #65
	b.eq	LBB0_10
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 29 22
	str	w8, [sp, #8]
LBB0_10:
	.loc	1 30 3 is_stmt 1
	ldr	w8, [sp, #32]
	cmp	w8, #65
	b.eq	LBB0_12
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 30 27
	str	w8, [sp, #8]
LBB0_12:
	.loc	1 31 3 is_stmt 1
	ldr	w8, [sp, #40]
	cmp	w8, #65
	b.eq	LBB0_14
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 31 28
	str	w8, [sp, #8]
LBB0_14:
	.loc	1 32 3 is_stmt 1
	ldr	w8, [sp, #56]
	cmp	w8, #65
	b.eq	LBB0_16
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 32 28
	str	w8, [sp, #8]
LBB0_16:
	.loc	1 0 28
	mov	w9, #-6
	mov	w8, #250
	.loc	1 36 3 is_stmt 1
	cmn	w9, #6
	.loc	1 34 3
	strb	w8, [sp, #99]
	.loc	1 35 3
	str	w8, [sp, #100]
	.loc	1 36 3
	b.eq	LBB0_18
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 36 28
	str	w8, [sp, #8]
LBB0_18:
	.loc	1 38 3 is_stmt 1
	ldrb	w8, [sp, #100]
	.loc	1 39 3
	cmp	w8, #250
	.loc	1 38 3
	strb	w8, [sp, #107]
	.loc	1 39 3
	b.eq	LBB0_20
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 39 28
	str	w8, [sp, #8]
LBB0_20:
	.loc	1 0 28
	mov	w8, #-1
	.loc	1 42 3 is_stmt 1
	cmn	w8, #1
	.loc	1 41 3
	str	w8, [sp, #108]
	.loc	1 42 3
	b.eq	LBB0_22
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	.loc	1 42 32
	str	w8, [sp, #8]
LBB0_22:
	.loc	1 44 3 is_stmt 1
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
	.loc	1 49 3 epilogue_begin is_stmt 1
	ldp	x29, x30, [sp, #112]
	ldr	w0, [sp, #8]
	add	sp, sp, #128
	ret
Ltmp1:
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
Lfunc_end0:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_2:
	.asciz	"11.type_cast.c PASS\n"

l___unnamed_1:
	.asciz	"11.type_cast.c FAIL\n"

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
	.byte	3
	.long	374

	.byte	3
	.byte	3
	.byte	145
	.asciz	"\354"
	.long	37
	.byte	1
	.byte	41
	.long	381
	.byte	3
	.byte	3
	.byte	145
	.asciz	"\353"
	.long	60
	.byte	1
	.byte	38
	.long	388
	.byte	3
	.byte	3
	.byte	145
	.asciz	"\344"
	.long	87
	.byte	1
	.byte	35
	.long	374
	.byte	3
	.byte	3
	.byte	145
	.asciz	"\343"
	.long	100
	.byte	1
	.byte	34
	.long	388
	.byte	3
	.byte	3
	.byte	145
	.asciz	"\334"
	.long	114
	.byte	1
	.byte	23
	.long	395
	.byte	3
	.byte	3
	.byte	145
	.asciz	"\320"
	.long	130
	.byte	1
	.byte	22
	.long	402
	.byte	3
	.byte	3
	.byte	145
	.asciz	"\310"
	.long	148
	.byte	1
	.byte	21
	.long	402
	.byte	3
	.byte	3
	.byte	145
	.asciz	"\304"
	.long	158
	.byte	1
	.byte	20
	.long	395
	.byte	3
	.byte	2
	.byte	145
	.byte	56
	.long	167
	.byte	1
	.byte	18
	.long	409
	.byte	3
	.byte	2
	.byte	145
	.byte	48
	.long	181
	.byte	1
	.byte	17
	.long	416
	.byte	3
	.byte	2
	.byte	145
	.byte	40
	.long	205
	.byte	1
	.byte	16
	.long	416
	.byte	3
	.byte	2
	.byte	145
	.byte	32
	.long	214
	.byte	1
	.byte	15
	.long	409
	.byte	3
	.byte	2
	.byte	145
	.byte	28
	.long	222
	.byte	1
	.byte	13
	.long	374
	.byte	3
	.byte	2
	.byte	145
	.byte	24
	.long	230
	.byte	1
	.byte	12
	.long	381
	.byte	3
	.byte	2
	.byte	145
	.byte	20
	.long	239
	.byte	1
	.byte	11
	.long	381
	.byte	3
	.byte	2
	.byte	145
	.byte	16
	.long	247
	.byte	1
	.byte	10
	.long	374
	.byte	3
	.byte	2
	.byte	145
	.byte	15
	.long	254
	.byte	1
	.byte	8
	.long	423
	.byte	3
	.byte	2
	.byte	145
	.byte	14
	.long	268
	.byte	1
	.byte	7
	.long	388
	.byte	3
	.byte	2
	.byte	145
	.byte	13
	.long	278
	.byte	1
	.byte	6
	.long	388
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	287
	.byte	1
	.byte	5
	.long	423
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	295
	.byte	1
	.byte	4
	.long	374
	.byte	0
	.byte	4
	.long	33
	.byte	5
	.byte	4
	.byte	4
	.long	47
	.byte	7
	.byte	4
	.byte	4
	.long	73
	.byte	8
	.byte	1
	.byte	4
	.long	124
	.byte	4
	.byte	4
	.byte	4
	.long	141
	.byte	4
	.byte	8
	.byte	4
	.long	176
	.byte	5
	.byte	8
	.byte	4
	.long	191
	.byte	7
	.byte	8
	.byte	4
	.long	263
	.byte	6
	.byte	1
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"11.type_cast.c"
	.asciz	"../tests"
	.asciz	"main"
	.asciz	"int"
	.asciz	"negToUint"
	.asciz	"unsigned int"
	.asciz	"ucharFromInt"
	.asciz	"unsigned char"
	.asciz	"intFromUchar"
	.asciz	"ucharBoundary"
	.asciz	"floatVal2"
	.asciz	"float"
	.asciz	"doubleVal2"
	.asciz	"double"
	.asciz	"doubleVal"
	.asciz	"floatVal"
	.asciz	"longVal2"
	.asciz	"long"
	.asciz	"ulongVal2"
	.asciz	"unsigned long"
	.asciz	"ulongVal"
	.asciz	"longVal"
	.asciz	"intVal2"
	.asciz	"uintVal2"
	.asciz	"uintVal"
	.asciz	"intVal"
	.asciz	"charVal2"
	.asciz	"char"
	.asciz	"ucharVal2"
	.asciz	"ucharVal"
	.asciz	"charVal"
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
	.long	8
	.long	8
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
	.long	3
	.long	4
	.long	-1
	.long	6
	.long	-1
	.long	-1
	.long	193495088
	.long	-113419488
	.long	-104093792
	.long	-103762318
	.long	259121563
	.long	2090147939
	.long	2090479413
	.long	-1304652851
.set Lset6, Ltypes0-Ltypes_begin
	.long	Lset6
.set Lset7, Ltypes4-Ltypes_begin
	.long	Lset7
.set Lset8, Ltypes2-Ltypes_begin
	.long	Lset8
.set Lset9, Ltypes6-Ltypes_begin
	.long	Lset9
.set Lset10, Ltypes3-Ltypes_begin
	.long	Lset10
.set Lset11, Ltypes7-Ltypes_begin
	.long	Lset11
.set Lset12, Ltypes5-Ltypes_begin
	.long	Lset12
.set Lset13, Ltypes1-Ltypes_begin
	.long	Lset13
Ltypes0:
	.long	33
	.long	1
	.long	374
	.short	36
	.byte	0
	.long	0
Ltypes4:
	.long	141
	.long	1
	.long	402
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	73
	.long	1
	.long	388
	.short	36
	.byte	0
	.long	0
Ltypes6:
	.long	191
	.long	1
	.long	416
	.short	36
	.byte	0
	.long	0
Ltypes3:
	.long	124
	.long	1
	.long	395
	.short	36
	.byte	0
	.long	0
Ltypes7:
	.long	263
	.long	1
	.long	423
	.short	36
	.byte	0
	.long	0
Ltypes5:
	.long	176
	.long	1
	.long	409
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	47
	.long	1
	.long	381
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
