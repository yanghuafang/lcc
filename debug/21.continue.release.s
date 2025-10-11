	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_countEvenNumber
	.p2align	2
_countEvenNumber:
	cmp	w0, #1
	b.lt	LBB0_4
	mov	w8, wzr
	mov	w9, #1
	mov	w10, #1
LBB0_2:
	bic	w11, w9, w10
	add	w10, w10, #1
	cmp	w10, w0
	add	w8, w11, w8
	b.le	LBB0_2
	mov	w0, w8
	ret
LBB0_4:
	mov	w0, wzr
	ret

	.globl	_countEvenNumber2
	.p2align	2
_countEvenNumber2:
	cmp	w0, #1
	b.lt	LBB1_5
	mov	w8, w0
	mov	w0, wzr
	mov	w9, #2
LBB1_2:
	cmp	w9, w8
	b.gt	LBB1_4
	cmp	w9, w8
	add	w9, w9, #2
	add	w0, w0, #1
	b.lt	LBB1_2
LBB1_4:
	ret
LBB1_5:
	mov	w0, wzr
	ret

	.globl	_countEvenNumber3
	.p2align	2
_countEvenNumber3:
	mov	w8, w0
	mov	w0, wzr
	mov	w9, #1
LBB2_1:
	orr	w10, w9, #0x1
	ands	w11, w9, #0x1
	csinc	w9, w10, w9, eq
	eor	w10, w11, #0x1
	cmp	w9, w8
	add	w0, w10, w0
	b.le	LBB2_1
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
	.asciz	"21.continue.c PASS"

.subsections_via_symbols
