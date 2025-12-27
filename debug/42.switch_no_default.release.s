	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_grade
	.p2align	2
_grade:
	mov	w8, #20
	cmp	w0, #2
	mov	w9, #10
	csel	w8, w8, wzr, eq
	cmp	w0, #1
	csel	w0, w9, w8, eq
	ret

	.globl	_allReturn
	.p2align	2
_allReturn:
	mov	w8, #200
	cmp	w0, #1
	mov	w9, #100
	csel	w0, w9, w8, eq
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
	.asciz	"42.switch_no_default.c PASS"

.subsections_via_symbols
