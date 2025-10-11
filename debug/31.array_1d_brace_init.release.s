	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
	stp	x20, x19, [sp, #-32]!
Lloh0:
	adrp	x8, _gc@PAGE
Lloh1:
	add	x8, x8, _gc@PAGEOFF
Lloh2:
	adrp	x11, _gb@PAGE
Lloh3:
	add	x11, x11, _gb@PAGEOFF
	stp	x29, x30, [sp, #16]
	ldp	w9, w10, [x8, #4]
	ldr	w8, [x8]
	orr	w9, w10, w9
	ldp	w10, w11, [x11]
	orr	w8, w9, w8
Lloh4:
	adrp	x9, _ga@PAGE
Lloh5:
	add	x9, x9, _ga@PAGEOFF
	cmp	w8, #0
	ccmp	w11, #20, #0, eq
	ldp	w11, w8, [x9, #8]
	ccmp	w10, #10, #0, eq
	ccmp	w8, #0, #0, eq
	ldp	w8, w10, [x9]
	ccmp	w11, #3, #0, eq
Lloh6:
	adrp	x9, l_str.1@PAGE
Lloh7:
	add	x9, x9, l_str.1@PAGEOFF
	ccmp	w10, #2, #0, eq
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

	.globl	_gc
.zerofill __DATA,__common,_gc,12,2
	.section	__TEXT,__cstring,cstring_literals
l_str:
	.asciz	"31.array_1d_brace_init.c FAIL"

l_str.1:
	.asciz	"31.array_1d_brace_init.c PASS"

.subsections_via_symbols
