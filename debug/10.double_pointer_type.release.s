	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_getAddress
	.p2align	2
_getAddress:
Lloh0:
	adrp	x8, _g_data@PAGE
Lloh1:
	add	x8, x8, _g_data@PAGEOFF
	str	x8, [x0]
	ret
	.loh AdrpAdd	Lloh0, Lloh1

	.globl	_main
	.p2align	2
_main:
	stp	x29, x30, [sp, #-16]!
	adrp	x8, _g_data@PAGE
	mov	w9, #-42
Lloh2:
	adrp	x0, l_str.1@PAGE
Lloh3:
	add	x0, x0, l_str.1@PAGEOFF
	str	w9, [x8, _g_data@PAGEOFF]
	bl	_puts
	mov	w0, wzr
	ldp	x29, x30, [sp], #16
	ret
	.loh AdrpAdd	Lloh2, Lloh3

	.globl	_g_data
.zerofill __DATA,__common,_g_data,4,2
	.section	__TEXT,__cstring,cstring_literals
l_str.1:
	.asciz	"10.double_pointer_type.c PASS"

.subsections_via_symbols
