	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
	stp	x20, x19, [sp, #-32]!
Lloh0:
	adrp	x8, _gd@PAGE
Lloh1:
	add	x8, x8, _gd@PAGEOFF
Lloh2:
	adrp	x12, _gc@PAGE+4
Lloh3:
	add	x12, x12, _gc@PAGEOFF+4
	stp	x29, x30, [sp, #16]
	ldp	w9, w10, [x8]
	ldp	w11, w8, [x8, #8]
	orr	w9, w10, w9
Lloh4:
	adrp	x10, _ga@PAGE
Lloh5:
	add	x10, x10, _ga@PAGEOFF
	orr	w8, w8, w11
	ldp	w11, w13, [x12, #4]
	orr	w8, w8, w9
	ldr	w9, [x12]
Lloh6:
	adrp	x12, _gb@PAGE+4
Lloh7:
	add	x12, x12, _gb@PAGEOFF+4
	orr	w8, w8, w13
	cmp	w8, #0
	ldr	w8, [x12, #8]
	ccmp	w11, #20, #0, eq
	ldr	w11, [x12]
	ccmp	w9, #11, #0, eq
	ldr	w9, [x10, #20]
	ccmp	w8, #3, #0, eq
	ldr	w8, [x10]
	ccmp	w11, #1, #0, eq
	ccmp	w9, #6, #0, eq
Lloh8:
	adrp	x9, l_str.1@PAGE
Lloh9:
	add	x9, x9, l_str.1@PAGEOFF
	ccmp	w8, #1, #0, eq
	cset	w8, ne
	ands	w19, w8, #0x1
Lloh10:
	adrp	x8, l_str@PAGE
Lloh11:
	add	x8, x8, l_str@PAGEOFF
	csel	x0, x8, x9, ne
	bl	_puts
	ldp	x29, x30, [sp, #16]
	mov	w0, w19
	ldp	x20, x19, [sp], #32
	ret
	.loh AdrpAdd	Lloh10, Lloh11
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

	.globl	_gd
.zerofill __DATA,__common,_gd,16,2
	.section	__TEXT,__cstring,cstring_literals
l_str:
	.asciz	"34.array_2d_brace_init.c FAIL"

l_str.1:
	.asciz	"34.array_2d_brace_init.c PASS"

.subsections_via_symbols
