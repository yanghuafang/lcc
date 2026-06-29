	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_gradeOfScore
	.p2align	2
_gradeOfScore:
	sub	w8, w0, #1
	cmp	w8, #9
	b.hi	LBB0_2
Lloh0:
	adrp	x9, l_switch.table.gradeOfScore@PAGE
Lloh1:
	add	x9, x9, l_switch.table.gradeOfScore@PAGEOFF
	ldrb	w0, [x9, w8, sxtw]
	ret
LBB0_2:
	mov	w0, #69
	ret
	.loh AdrpAdd	Lloh0, Lloh1

	.globl	_main
	.p2align	2
_main:
	stp	x29, x30, [sp, #-16]!
Lloh2:
	adrp	x0, l_str.1@PAGE
Lloh3:
	add	x0, x0, l_str.1@PAGEOFF
	bl	_puts
	mov	w0, wzr
	ldp	x29, x30, [sp], #16
	ret
	.loh AdrpAdd	Lloh2, Lloh3

	.section	__TEXT,__cstring,cstring_literals
l_str.1:
	.asciz	"18.switch_case.c PASS"

	.section	__TEXT,__const
l_switch.table.gradeOfScore:
	.ascii	"DDDDDCBBAA"

.subsections_via_symbols
