	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_nested
	.p2align	2
_nested:
	mov	w8, #114
	cmp	w1, #2
	mov	w9, #112
	csel	w8, w9, w8, eq
	cmp	w1, #1
	mov	w9, #111
	mov	w10, #1000
	csel	w8, w9, w8, eq
	cmp	w0, #1
	mov	w9, #100
	csel	w8, w10, w8, ne
	cmp	w0, #2
	csel	w0, w9, w8, eq
	ret

	.globl	_threeDeep
	.p2align	2
_threeDeep:
	mov	w8, #15
	cmp	w0, #1
	cinc	w0, w8, ne
	ret

	.globl	_loopWithNestedSwitch
	.p2align	2
_loopWithNestedSwitch:
	mov	w0, #431
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
	.asciz	"43.nested_switch.c PASS"

.subsections_via_symbols
