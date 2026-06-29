	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_bump
	.p2align	2
_bump:
	adrp	x8, _counter@PAGE
	ldr	w9, [x8, _counter@PAGEOFF]
	add	w0, w9, #1
	str	w0, [x8, _counter@PAGEOFF]
	ret

	.globl	_bump_with_helper
	.p2align	2
_bump_with_helper:
	adrp	x8, _counter@PAGE
	ldr	w9, [x8, _counter@PAGEOFF]
	add	w9, w9, #1
	lsl	w0, w9, #1
	str	w9, [x8, _counter@PAGEOFF]
	ret

	.globl	_main
	.p2align	2
_main:
	stp	x20, x19, [sp, #-32]!
Lloh0:
	adrp	x8, _counter@PAGE
Lloh1:
	adrp	x10, l_str.1@PAGE
Lloh2:
	add	x10, x10, l_str.1@PAGEOFF
	ldr	w9, [x8, _counter@PAGEOFF]
	stp	x29, x30, [sp, #16]
	cmp	w9, #0
	add	w9, w9, #3
	str	w9, [x8, _counter@PAGEOFF]
Lloh3:
	adrp	x8, l_str@PAGE
Lloh4:
	add	x8, x8, l_str@PAGEOFF
	csel	x0, x8, x10, ne
	cset	w19, ne
	bl	_puts
	ldp	x29, x30, [sp, #16]
	mov	w0, w19
	ldp	x20, x19, [sp], #32
	ret
	.loh AdrpAdd	Lloh3, Lloh4
	.loh AdrpAdd	Lloh1, Lloh2
	.loh AdrpAdrp	Lloh0, Lloh3

.zerofill __DATA,__bss,_counter,4,2
	.section	__TEXT,__cstring,cstring_literals
l_str:
	.asciz	"37.static_file.c FAIL"

l_str.1:
	.asciz	"37.static_file.c PASS"

.subsections_via_symbols
