	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_fill_employee
	.p2align	2
_fill_employee:
	str	w1, [x0]
	strb	w2, [x0, #4]
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
	.asciz	"36.typedef_struct.c PASS"

.subsections_via_symbols
