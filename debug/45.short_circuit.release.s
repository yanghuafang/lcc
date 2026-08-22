	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_bump
	.p2align	2
_bump:
	adrp	x8, _calls@PAGE
	mov	w0, #1
	ldr	w9, [x8, _calls@PAGEOFF]
	add	w9, w9, #1
	str	w9, [x8, _calls@PAGEOFF]
	ret

	.globl	_trueArm
	.p2align	2
_trueArm:
	adrp	x8, _trueRan@PAGE
	mov	w9, #1
	mov	w0, #10
	str	w9, [x8, _trueRan@PAGEOFF]
	ret

	.globl	_falseArm
	.p2align	2
_falseArm:
	adrp	x8, _falseRan@PAGE
	mov	w9, #1
	mov	w0, #20
	str	w9, [x8, _falseRan@PAGEOFF]
	ret

	.globl	_main
	.p2align	2
_main:
	stp	x20, x19, [sp, #-32]!
	adrp	x8, _falseRan@PAGE
	mov	w9, #1
Lloh0:
	adrp	x10, _gOr@PAGE
Lloh1:
	adrp	x11, _gAnd@PAGE
	str	w9, [x8, _falseRan@PAGEOFF]
Lloh2:
	ldr	w8, [x10, _gOr@PAGEOFF]
	adrp	x9, _trueRan@PAGE
Lloh3:
	adrp	x10, _gTernary@PAGE
Lloh4:
	ldr	w11, [x11, _gAnd@PAGEOFF]
	str	wzr, [x9, _trueRan@PAGEOFF]
Lloh5:
	ldr	w9, [x10, _gTernary@PAGEOFF]
	cmp	w8, #1
Lloh6:
	adrp	x8, _calls@PAGE
	ccmp	w11, #0, #0, eq
	mov	w10, #3
	ccmp	w9, #2, #0, eq
Lloh7:
	adrp	x9, l_str.1@PAGE
Lloh8:
	add	x9, x9, l_str.1@PAGEOFF
	str	w10, [x8, _calls@PAGEOFF]
Lloh9:
	adrp	x8, l_str@PAGE
Lloh10:
	add	x8, x8, l_str@PAGEOFF
	csel	x0, x8, x9, ne
	stp	x29, x30, [sp, #16]
	cset	w19, ne
	bl	_puts
	ldp	x29, x30, [sp, #16]
	mov	w0, w19
	ldp	x20, x19, [sp], #32
	ret
	.loh AdrpAdd	Lloh9, Lloh10
	.loh AdrpAdd	Lloh7, Lloh8
	.loh AdrpAdrp	Lloh6, Lloh9
	.loh AdrpLdr	Lloh3, Lloh5
	.loh AdrpLdr	Lloh1, Lloh4
	.loh AdrpAdrp	Lloh0, Lloh3
	.loh AdrpLdr	Lloh0, Lloh2

	.section	__DATA,__data
	.globl	_gTernary
	.p2align	2, 0x0
_gTernary:
	.long	2

	.globl	_gAnd
.zerofill __DATA,__common,_gAnd,4,2
	.globl	_gOr
	.p2align	2, 0x0
_gOr:
	.long	1

	.globl	_calls
.zerofill __DATA,__common,_calls,4,2
	.globl	_trueRan
.zerofill __DATA,__common,_trueRan,4,2
	.globl	_falseRan
.zerofill __DATA,__common,_falseRan,4,2
	.section	__TEXT,__cstring,cstring_literals
l_str:
	.asciz	"45.short_circuit.c FAIL"

l_str.1:
	.asciz	"45.short_circuit.c PASS"

.subsections_via_symbols
