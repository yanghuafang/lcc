	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_countSum
	.p2align	2
_countSum:
	cmp	w0, #1
	b.lt	LBB0_4
	mov	w8, wzr
	mov	w9, #1
LBB0_2:
	add	w8, w9, w8
	add	w9, w9, #1
	cmp	w9, w0
	b.le	LBB0_2
	mov	w0, w8
	ret
LBB0_4:
	mov	w0, wzr
	ret

	.globl	_countSum2
	.p2align	2
_countSum2:
	cmp	w0, #1
	b.lt	LBB1_4
	mov	w8, wzr
	mov	w9, #1
LBB1_2:
	add	w8, w9, w8
	add	w9, w9, #1
	cmp	w9, w0
	b.le	LBB1_2
	mov	w0, w8
	ret
LBB1_4:
	mov	w0, wzr
	ret

	.globl	_countSum3
	.p2align	2
_countSum3:
	cmp	w0, #1
	b.lt	LBB2_4
	mov	w8, wzr
	mov	w9, #1
LBB2_2:
	add	w8, w9, w8
	add	w9, w9, #1
	cmp	w9, w0
	b.le	LBB2_2
	mov	w0, w8
	ret
LBB2_4:
	mov	w0, wzr
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
	.asciz	"19.for_loop.c PASS"

.subsections_via_symbols
