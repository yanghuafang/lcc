	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_for_break_continue
	.p2align	2
_for_break_continue:
	mov	w0, #18
	ret

	.globl	_switch_break_fallthrough
	.p2align	2
_switch_break_fallthrough:
	mov	w0, #11
	ret

	.globl	_switch_break_only
	.p2align	2
_switch_break_only:
	mov	w0, #20
	ret

	.globl	_for_switch_break_continue
	.p2align	2
_for_switch_break_continue:
	mov	w0, #106
	ret

	.globl	_switch_for_break_continue
	.p2align	2
_switch_for_break_continue:
	mov	w0, #4
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
	.asciz	"39.break_continue_hierarchy.c PASS"

.subsections_via_symbols
