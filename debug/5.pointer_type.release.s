	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
	stp	x29, x30, [sp, #-16]!
	adrp	x8, _gc@PAGE
	mov	w9, #98
	adrp	x10, _gi@PAGE
	mov	w11, #2048
Lloh0:
	adrp	x0, l_str.1@PAGE
Lloh1:
	add	x0, x0, l_str.1@PAGEOFF
	strb	w9, [x8, _gc@PAGEOFF]
	str	w11, [x10, _gi@PAGEOFF]
	bl	_puts
	mov	w0, wzr
	ldp	x29, x30, [sp], #16
	ret
	.loh AdrpAdd	Lloh0, Lloh1

	.section	__DATA,__data
	.globl	_gc
_gc:
	.byte	97

	.globl	_gi
	.p2align	2, 0x0
_gi:
	.long	1024

	.section	__TEXT,__cstring,cstring_literals
l_str.1:
	.asciz	"5.pointer_type.c PASS"

.subsections_via_symbols
