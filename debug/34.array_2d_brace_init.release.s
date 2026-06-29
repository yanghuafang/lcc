	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
	stp	x20, x19, [sp, #-32]!
Lloh0:
	adrp	x9, _gc@PAGE+4
Lloh1:
	add	x9, x9, _gc@PAGEOFF+4
Lloh2:
	adrp	x12, _gb@PAGE+4
Lloh3:
	add	x12, x12, _gb@PAGEOFF+4
	ldr	w11, [x9]
Lloh4:
	adrp	x8, _ga@PAGE
Lloh5:
	add	x8, x8, _ga@PAGEOFF
	stp	x29, x30, [sp, #16]
	ldp	w9, w10, [x9, #4]
	cmp	w10, #0
	ldr	w10, [x12, #8]
	ccmp	w9, #20, #0, eq
	ldr	w9, [x12]
	ccmp	w11, #11, #0, eq
	ldr	w11, [x8, #20]
	ldr	w8, [x8]
	ccmp	w10, #3, #0, eq
	ccmp	w9, #1, #0, eq
Lloh6:
	adrp	x9, l_str.1@PAGE
Lloh7:
	add	x9, x9, l_str.1@PAGEOFF
	ccmp	w11, #6, #0, eq
	ccmp	w8, #1, #0, eq
	cset	w8, ne
	ands	w19, w8, #0x1
Lloh8:
	adrp	x8, l_str@PAGE
Lloh9:
	add	x8, x8, l_str@PAGEOFF
	csel	x0, x8, x9, ne
	bl	_puts
	ldp	x29, x30, [sp, #16]
	mov	w0, w19
	ldp	x20, x19, [sp], #32
	ret
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1

	.section	__DATA,__data
	.globl	_ga
	.p2align	4, 0x0
_ga:
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6

	.globl	_gb
	.p2align	4, 0x0
_gb:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5

	.globl	_gc
	.p2align	2, 0x0
_gc:
	.long	10
	.long	11
	.long	20
	.long	0

	.section	__TEXT,__cstring,cstring_literals
l_str:
	.asciz	"34.array_2d_brace_init.c FAIL"

l_str.1:
	.asciz	"34.array_2d_brace_init.c PASS"

.subsections_via_symbols
