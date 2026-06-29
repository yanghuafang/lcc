	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_helper
	.p2align	2
_helper:
	add	w8, w1, w0
	str	w8, [x2]
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
	.asciz	"35.typedef_builtin.c PASS"

.subsections_via_symbols
