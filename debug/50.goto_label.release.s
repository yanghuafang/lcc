	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_countTo
	.p2align	2
_countTo:
	cmp	w0, #1
	csinc	w0, w0, wzr, gt
	ret

	.globl	_skip
	.p2align	2
_skip:
	mov	w8, #1
	cmp	w0, #0
	cinc	w0, w8, eq
	ret

	.globl	_firstPair
	.p2align	2
_firstPair:
	cmp	w0, #1
	b.lt	LBB2_6
	mov	w8, w0
	mov	w0, w1
	mov	w9, wzr
	mov	w10, w1
LBB2_2:
	mov	w11, wzr
LBB2_3:
	cmp	w10, w11
	b.eq	LBB2_7
	add	w11, w11, #1
	cmp	w8, w11
	b.ne	LBB2_3
	add	w9, w9, #1
	sub	w10, w10, #10
	cmp	w9, w8
	b.ne	LBB2_2
LBB2_6:
	mov	w0, #-1
LBB2_7:
	ret

	.globl	_afterReturn
	.p2align	2
_afterReturn:
	mov	w8, #1
	cmp	w0, #0
	cinc	w0, w8, ne
	ret

	.globl	_fromSwitch
	.p2align	2
_fromSwitch:
	mov	w8, #20
	cmp	w0, #2
	mov	w9, #10
	csel	w8, w8, wzr, eq
	cmp	w0, #1
	csel	w0, w9, w8, eq
	ret

	.globl	_main
	.p2align	2
_main:
	stp	x29, x30, [sp, #-16]!
Lloh0:
	adrp	x0, l_str.1@PAGE
Lloh1:
	add	x0, x0, l_str.1@PAGEOFF
	bl	_puts
	mov	w0, wzr
	ldp	x29, x30, [sp], #16
	ret
	.loh AdrpAdd	Lloh0, Lloh1

	.section	__TEXT,__cstring,cstring_literals
l_str.1:
	.asciz	"50.goto_label.c PASS"

.subsections_via_symbols
