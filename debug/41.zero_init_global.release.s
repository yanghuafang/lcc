	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
	stp	x20, x19, [sp, #-32]!
Lloh0:
	adrp	x8, _g_point@PAGE
Lloh1:
	add	x8, x8, _g_point@PAGEOFF
Lloh2:
	adrp	x10, _g_matrix@PAGE
Lloh3:
	add	x10, x10, _g_matrix@PAGEOFF
Lloh4:
	adrp	x11, _g_ptr@PAGE
	stp	x29, x30, [sp, #16]
	ldp	w9, w8, [x8]
Lloh5:
	ldr	x11, [x11, _g_ptr@PAGEOFF]
	orr	w8, w8, w9
	ldp	w9, w12, [x10, #16]
	cmp	w8, #0
Lloh6:
	adrp	x8, _g_arr@PAGE
Lloh7:
	add	x8, x8, _g_arr@PAGEOFF
	ccmp	x11, #0, #0, eq
	ldr	w11, [x10, #8]
	ldr	w10, [x10]
	ccmp	w12, #0, #0, eq
	ccmp	w9, #0, #0, eq
	ccmp	w11, #0, #0, eq
	ldp	w11, w9, [x8, #8]
	ccmp	w10, #0, #0, eq
	ldp	w8, w10, [x8]
	ccmp	w9, #0, #0, eq
Lloh8:
	adrp	x9, _g_scalar@PAGE
	ccmp	w11, #0, #0, eq
Lloh9:
	ldr	w9, [x9, _g_scalar@PAGEOFF]
	ccmp	w10, #0, #0, eq
	ccmp	w8, #0, #0, eq
	ccmp	w9, #0, #0, eq
Lloh10:
	adrp	x9, l_str.1@PAGE
Lloh11:
	add	x9, x9, l_str.1@PAGEOFF
	cset	w8, ne
	ands	w19, w8, #0x1
Lloh12:
	adrp	x8, l_str@PAGE
Lloh13:
	add	x8, x8, l_str@PAGEOFF
	csel	x0, x8, x9, ne
	bl	_puts
	ldp	x29, x30, [sp, #16]
	mov	w0, w19
	ldp	x20, x19, [sp], #32
	ret
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpLdr	Lloh8, Lloh9
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpLdr	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1

	.globl	_g_scalar
.zerofill __DATA,__common,_g_scalar,4,2
	.globl	_g_arr
.zerofill __DATA,__common,_g_arr,16,2
	.globl	_g_matrix
.zerofill __DATA,__common,_g_matrix,24,4
	.globl	_g_ptr
.zerofill __DATA,__common,_g_ptr,8,3
	.globl	_g_point
.zerofill __DATA,__common,_g_point,8,3
	.section	__TEXT,__cstring,cstring_literals
l_str:
	.asciz	"41.zero_init_global.c FAIL"

l_str.1:
	.asciz	"41.zero_init_global.c PASS"

.subsections_via_symbols
