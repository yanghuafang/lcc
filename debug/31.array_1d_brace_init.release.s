	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
	stp	x20, x19, [sp, #-32]!
Lloh0:
	adrp	x8, _gb@PAGE
Lloh1:
	add	x8, x8, _gb@PAGEOFF
Lloh2:
	adrp	x10, _ga@PAGE
Lloh3:
	add	x10, x10, _ga@PAGEOFF
	stp	x29, x30, [sp, #16]
	ldp	w8, w9, [x8]
	cmp	w9, #20
	ldp	w9, w11, [x10, #8]
	ccmp	w8, #10, #0, eq
	ldp	w10, w8, [x10]
	ccmp	w11, #0, #0, eq
	ccmp	w9, #3, #0, eq
Lloh4:
	adrp	x9, l_str@PAGE
Lloh5:
	add	x9, x9, l_str@PAGEOFF
	ccmp	w8, #2, #0, eq
Lloh6:
	adrp	x8, l_str.1@PAGE
Lloh7:
	add	x8, x8, l_str.1@PAGEOFF
	ccmp	w10, #1, #0, eq
	csel	x0, x9, x8, ne
	cset	w19, ne
	bl	_puts
	ldp	x29, x30, [sp, #16]
	mov	w0, w19
	ldp	x20, x19, [sp], #32
	ret
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1

	.section	__DATA,__data
	.globl	_ga
	.p2align	2, 0x0
_ga:
	.long	1
	.long	2
	.long	3
	.long	0

	.globl	_gb
	.p2align	2, 0x0
_gb:
	.long	10
	.long	20

	.section	__TEXT,__cstring,cstring_literals
l_str:
	.asciz	"31.array_1d_brace_init.c FAIL"

l_str.1:
	.asciz	"31.array_1d_brace_init.c PASS"

.subsections_via_symbols
