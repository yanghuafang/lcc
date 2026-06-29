	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
	stp	x29, x30, [sp, #-16]!
	mov	w9, #30060
Lloh0:
	adrp	x8, _gs@PAGE
Lloh1:
	add	x8, x8, _gs@PAGEOFF
	movk	w9, #27491, lsl #16
	mov	w10, #121
Lloh2:
	adrp	x0, l_str.1@PAGE
Lloh3:
	add	x0, x0, l_str.1@PAGEOFF
	str	w9, [x8]
Lloh4:
	adrp	x9, _gi@PAGE
Lloh5:
	add	x9, x9, _gi@PAGEOFF
	strh	w10, [x8, #4]
	mov	x8, #1024
	movk	x8, #2048, lsl #32
Lloh6:
	str	x8, [x9]
	bl	_puts
	mov	w0, wzr
	ldp	x29, x30, [sp], #16
	ret
	.loh AdrpAddStr	Lloh4, Lloh5, Lloh6
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1

	.globl	_gs
.zerofill __DATA,__common,_gs,16,0
	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"hello world!"

	.section	__DATA,__data
	.globl	_gps
	.p2align	3, 0x0
_gps:
	.quad	l___unnamed_1

	.globl	_gi
.zerofill __DATA,__common,_gi,16,2
	.section	__TEXT,__cstring,cstring_literals
l_str.1:
	.asciz	"6.array_type.c PASS"

.subsections_via_symbols
