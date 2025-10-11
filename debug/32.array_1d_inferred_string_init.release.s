	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
	stp	x20, x19, [sp, #-32]!
Lloh0:
	adrp	x8, _ga@PAGE
Lloh1:
	add	x8, x8, _ga@PAGEOFF
Lloh2:
	adrp	x11, _gs@PAGE
Lloh3:
	add	x11, x11, _gs@PAGEOFF
	stp	x29, x30, [sp, #16]
	ldp	w9, w10, [x8]
	ldrb	w13, [x11, #1]
	ldrb	w0, [x11, #2]
	ldrb	w11, [x11]
	cmp	w9, #10
	and	w11, w11, #0xff
	cset	w9, ne
	cmp	w10, #7
	ldp	w10, w12, [x8, #8]
	cset	w14, ne
	cmp	w10, #8
Lloh4:
	adrp	x10, _gt@PAGE
Lloh5:
	add	x10, x10, _gt@PAGEOFF
	ldrb	w15, [x10, #2]
	ldrb	w17, [x10, #3]
	ldrb	w1, [x10]
	ldrb	w10, [x10, #1]
	cset	w16, ne
	and	w15, w15, #0xff
	cmp	w17, #0
	mov	w17, #121
	and	w10, w10, #0xff
	ccmp	w15, w17, #0, eq
	mov	w15, #101
	and	w17, w1, #0xff
	ccmp	w10, w15, #0, eq
	mov	w10, #104
	ccmp	w17, w10, #0, eq
	and	w10, w13, #0xff
	ldp	w8, w15, [x8, #16]
	cset	w13, ne
	tst	w0, #0xff
	csinc	w13, w13, wzr, eq
	cmp	w10, #105
	csinc	w10, w13, wzr, eq
	cmp	w11, #104
	csinc	w10, w10, wzr, eq
	cmp	w15, #5
	csinc	w10, w10, wzr, eq
	cmp	w8, #1
	csinc	w8, w10, wzr, eq
	cmp	w12, #9
	orr	w10, w16, w14
	csinc	w8, w8, wzr, eq
	orr	w9, w10, w9
	orr	w8, w8, w9
Lloh6:
	adrp	x9, l_str.1@PAGE
Lloh7:
	add	x9, x9, l_str.1@PAGEOFF
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
	.long	10
	.long	7
	.long	8
	.long	9
	.long	1
	.long	5

	.globl	_gs
_gs:
	.asciz	"hi"

	.globl	_gt
_gt:
	.asciz	"hey"

	.section	__TEXT,__cstring,cstring_literals
l_str:
	.asciz	"32.array_1d_inferred_string_init.c FAIL"

l_str.1:
	.asciz	"32.array_1d_inferred_string_init.c PASS"

.subsections_via_symbols
