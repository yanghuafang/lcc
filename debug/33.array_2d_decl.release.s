	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
	stp	x20, x19, [sp, #-32]!
Lloh0:
	adrp	x8, _gm@PAGE
Lloh1:
	add	x8, x8, _gm@PAGEOFF
	mov	w9, #10
	ldr	w11, [x8, #4]
	mov	w10, #20
	str	w9, [x8]
	mov	w9, #30
	str	w10, [x8, #24]
	str	w9, [x8, #44]
	cmp	w11, #0
Lloh2:
	adrp	x8, l_str.1@PAGE
Lloh3:
	add	x8, x8, l_str.1@PAGEOFF
Lloh4:
	adrp	x9, l_str@PAGE
Lloh5:
	add	x9, x9, l_str@PAGEOFF
	csel	x0, x9, x8, ne
	stp	x29, x30, [sp, #16]
	cset	w19, ne
	bl	_puts
	ldp	x29, x30, [sp, #16]
	mov	w0, w19
	ldp	x20, x19, [sp], #32
	ret
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1

	.globl	_gm
.zerofill __DATA,__common,_gm,48,4
	.section	__TEXT,__cstring,cstring_literals
l_str:
	.asciz	"33.array_2d_decl.c FAIL"

l_str.1:
	.asciz	"33.array_2d_decl.c PASS"

.subsections_via_symbols
