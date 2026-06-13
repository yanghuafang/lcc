	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
	stp	x20, x19, [sp, #-32]!
Lloh0:
	adrp	x8, _g3@PAGE
Lloh1:
	add	x8, x8, _g3@PAGEOFF
	mov	w9, #7
	ldr	w10, [x8]
	adrp	x11, _g4@PAGE+60
	str	w9, [x8, #92]
	mov	w8, #9
Lloh2:
	adrp	x9, l_str.1@PAGE
Lloh3:
	add	x9, x9, l_str.1@PAGEOFF
	cmp	w10, #0
	str	w8, [x11, _g4@PAGEOFF+60]
Lloh4:
	adrp	x8, l_str@PAGE
Lloh5:
	add	x8, x8, l_str@PAGEOFF
	stp	x29, x30, [sp, #16]
	cset	w19, ne
	csel	x0, x8, x9, ne
	bl	_puts
	ldp	x29, x30, [sp, #16]
	mov	w0, w19
	ldp	x20, x19, [sp], #32
	ret
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1

	.globl	_g3
.zerofill __DATA,__common,_g3,96,4
	.globl	_g4
.zerofill __DATA,__common,_g4,64,4
	.section	__TEXT,__cstring,cstring_literals
l_str:
	.asciz	"46.array_3d.c FAIL"

l_str.1:
	.asciz	"46.array_3d.c PASS"

.subsections_via_symbols
