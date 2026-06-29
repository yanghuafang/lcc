	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_countNumber
	.p2align	2
_countNumber:
	cmp	w0, w1
	csel	w8, w0, w1, lt
	cmp	w8, #1
	b.lt	LBB0_4
	mov	w9, wzr
LBB0_2:
	add	w10, w9, #2
	add	w0, w9, #1
	cmp	w10, w8
	mov	w9, w0
	b.le	LBB0_2
	ret
LBB0_4:
	mov	w0, wzr
	ret

	.globl	_countNumber2
	.p2align	2
_countNumber2:
	cmp	w0, w1
	csel	w8, w0, w1, lt
	cmp	w8, #1
	b.lt	LBB1_4
	mov	w9, wzr
LBB1_2:
	add	w10, w9, #2
	add	w0, w9, #1
	cmp	w10, w8
	mov	w9, w0
	b.le	LBB1_2
	ret
LBB1_4:
	mov	w0, wzr
	ret

	.globl	_countNumber3
	.p2align	2
_countNumber3:
	mov	w9, wzr
LBB2_1:
	add	w8, w9, #1
	cmp	w8, w1
	b.gt	LBB2_4
	add	w9, w9, #2
	cmp	w9, w0
	mov	w9, w8
	b.le	LBB2_1
	mov	w0, w8
	ret
LBB2_4:
	mov	w0, w9
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
	.asciz	"22.break.c PASS"

.subsections_via_symbols
