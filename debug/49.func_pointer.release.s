	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_addOne
	.p2align	2
_addOne:
	add	w0, w0, #1
	ret

	.globl	_square
	.p2align	2
_square:
	mul	w0, w0, w0
	ret

	.globl	_addTwo
	.p2align	2
_addTwo:
	add	w0, w1, w0
	ret

	.globl	_apply
	.p2align	2
_apply:
	.cfi_startproc
	mov	x2, x0
	mov	w0, w1
	br	x2
	.cfi_endproc

	.globl	_applyAlias
	.p2align	2
_applyAlias:
	.cfi_startproc
	mov	x2, x0
	mov	w0, w1
	br	x2
	.cfi_endproc

	.globl	_pickOp
	.p2align	2
_pickOp:
Lloh0:
	adrp	x8, _square@PAGE
Lloh1:
	add	x8, x8, _square@PAGEOFF
	cmp	w0, #0
Lloh2:
	adrp	x9, _addOne@PAGE
Lloh3:
	add	x9, x9, _addOne@PAGEOFF
	csel	x0, x9, x8, eq
	ret
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1

	.globl	_sumWith
	.p2align	2
_sumWith:
	.cfi_startproc
	stp	x22, x21, [sp, #-48]!
	stp	x20, x19, [sp, #16]
	stp	x29, x30, [sp, #32]
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	cmp	w1, w2
	b.le	LBB6_2
	mov	w22, wzr
	b	LBB6_4
LBB6_2:
	mov	w19, w2
	mov	w20, w1
	mov	x21, x0
	mov	w22, wzr
LBB6_3:
	mov	w0, w20
	blr	x21
	add	w20, w20, #1
	add	w22, w0, w22
	cmp	w20, w19
	b.le	LBB6_3
LBB6_4:
	ldp	x29, x30, [sp, #32]
	mov	w0, w22
	ldp	x20, x19, [sp, #16]
	ldp	x22, x21, [sp], #48
	ret
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
	stp	x29, x30, [sp, #-16]!
	adrp	x8, _chosen@PAGE
Lloh4:
	adrp	x9, _addOne@PAGE
Lloh5:
	add	x9, x9, _addOne@PAGEOFF
Lloh6:
	adrp	x0, l_str.1@PAGE
Lloh7:
	add	x0, x0, l_str.1@PAGEOFF
	str	x9, [x8, _chosen@PAGEOFF]
	bl	_puts
	mov	w0, wzr
	ldp	x29, x30, [sp], #16
	ret
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5

	.globl	_chosen
.zerofill __DATA,__common,_chosen,8,3
	.section	__TEXT,__cstring,cstring_literals
l_str.1:
	.asciz	"49.func_pointer.c PASS"

.subsections_via_symbols
