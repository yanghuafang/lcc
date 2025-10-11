	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_sum
	.p2align	2
_sum:
	add	w0, w1, w0
	ret

	.globl	_sum2
	.p2align	2
_sum2:
	ldr	w8, [x0]
	ldr	w9, [x1]
	add	w0, w9, w8
	ret

	.globl	_sum3
	.p2align	2
_sum3:
	add	w8, w1, w0
	str	w8, [x2]
	ret

	.globl	_main
	.p2align	2
_main:
	stp	x29, x30, [sp, #-16]!
Lloh0:
	adrp	x0, l_str.2@PAGE
Lloh1:
	add	x0, x0, l_str.2@PAGEOFF
	bl	_puts
	mov	w0, wzr
	ldp	x29, x30, [sp], #16
	ret
	.loh AdrpAdd	Lloh0, Lloh1

	.section	__TEXT,__cstring,cstring_literals
l_str.2:
	.asciz	"8.function.c PASS"

.subsections_via_symbols
