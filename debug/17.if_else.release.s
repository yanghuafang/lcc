	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_accumulateFlags
	.p2align	2
_accumulateFlags:
	mov	w8, #4
	cmp	w0, #0
	mov	w9, #2
	bfxil	w8, w0, #31, #1
	csel	w8, w9, w8, eq
	cmp	w0, #10
	orr	w9, w8, #0x8
	csel	w0, w9, w8, gt
	ret

	.globl	_signBucket
	.p2align	2
_signBucket:
	mov	w8, #2
	cmp	w0, #0
	cinc	w8, w8, ne
	csinc	w0, w8, wzr, ge
	ret

	.globl	_decadeBucket
	.p2align	2
_decadeBucket:
	mov	w8, #2
	cmp	w0, #30
	mov	w9, #1
	cinc	w8, w8, hs
	cmp	w0, #20
	csel	w8, w9, w8, lo
	cmp	w0, #10
	csel	w0, wzr, w8, lt
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
	.asciz	"17.if_else.c PASS"

.subsections_via_symbols
