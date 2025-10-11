	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_swap
	.p2align	2
_swap:
	ldr	w8, [x1]
	ldr	w9, [x0]
	str	w8, [x0]
	str	w9, [x1]
	ret

	.globl	_partition
	.p2align	2
_partition:
	sub	w10, w2, #1
	ldr	w9, [x0, w2, sxtw #2]
	mov	x8, x0
	cmp	w1, w10
	b.gt	LBB1_6
	sub	w11, w1, #1
	b	LBB1_3
LBB1_2:
	add	w1, w12, #1
	cmp	w1, w10
	b.gt	LBB1_5
LBB1_3:
	ldr	w13, [x8, w1, sxtw #2]
	sxtw	x12, w1
	cmp	w13, w9
	b.gt	LBB1_2
	add	w11, w11, #1
	ldr	w14, [x8, w11, sxtw #2]
	str	w13, [x8, w11, sxtw #2]
	str	w14, [x8, x12, lsl #2]
	b	LBB1_2
LBB1_5:
	ldr	w9, [x8, w2, sxtw #2]
	add	w1, w11, #1
LBB1_6:
	ldr	w10, [x8, w1, sxtw #2]
	mov	w0, w1
	str	w9, [x8, w1, sxtw #2]
	str	w10, [x8, w2, sxtw #2]
	ret

	.globl	_quickSort
	.p2align	2
_quickSort:
	cmp	w1, w2
	b.ge	LBB2_8
	stp	x22, x21, [sp, #-48]!
	stp	x20, x19, [sp, #16]
	mov	w19, w2
	mov	x20, x0
	stp	x29, x30, [sp, #32]
	b	LBB2_3
LBB2_2:
	add	w9, w21, #1
	ldr	w8, [x20, w19, sxtw #2]
	mov	x0, x20
	ldr	w10, [x20, w9, sxtw #2]
	mov	w2, w21
	str	w8, [x20, w9, sxtw #2]
	str	w10, [x20, w19, sxtw #2]
	bl	_quickSort
	add	w1, w21, #2
	cmp	w1, w19
	b.ge	LBB2_7
LBB2_3:
	ldr	w8, [x20, w19, sxtw #2]
	sbfiz	x9, x1, #2, #32
	sub	w21, w1, #1
	mov	w10, w1
	b	LBB2_5
LBB2_4:
	add	w10, w10, #1
	add	x9, x9, #4
	cmp	w10, w19
	b.ge	LBB2_2
LBB2_5:
	ldr	w11, [x20, x9]
	cmp	w11, w8
	b.gt	LBB2_4
	add	w21, w21, #1
	ldr	w12, [x20, w21, sxtw #2]
	str	w11, [x20, w21, sxtw #2]
	str	w12, [x20, x9]
	b	LBB2_4
LBB2_7:
	ldp	x29, x30, [sp, #32]
	ldp	x20, x19, [sp, #16]
	ldp	x22, x21, [sp], #48
LBB2_8:
	ret

	.globl	_main
	.p2align	2
_main:
	sub	sp, sp, #64
	mov	x8, #10
	mov	x9, #8
	add	x0, sp, #8
	movk	x8, #7, lsl #32
	movk	x9, #9, lsl #32
	mov	w1, wzr
	stp	x8, x9, [sp, #8]
	mov	x8, #1
	mov	w2, #5
	movk	x8, #5, lsl #32
	stp	x20, x19, [sp, #32]
	stp	x29, x30, [sp, #48]
	str	x8, [sp, #24]
	bl	_quickSort
	ldp	w9, w8, [sp, #24]
	cmp	w8, #10
	ldp	w8, w10, [sp, #16]
	ccmp	w9, #9, #0, eq
	ccmp	w10, #8, #0, eq
	ldp	w10, w9, [sp, #8]
	ccmp	w8, #7, #0, eq
Lloh0:
	adrp	x8, l_str.1@PAGE
Lloh1:
	add	x8, x8, l_str.1@PAGEOFF
	ccmp	w9, #5, #0, eq
Lloh2:
	adrp	x9, l_str@PAGE
Lloh3:
	add	x9, x9, l_str@PAGEOFF
	ccmp	w10, #1, #0, eq
	csel	x0, x9, x8, ne
	cset	w19, ne
	bl	_puts
	mov	w0, w19
	ldp	x29, x30, [sp, #48]
	ldp	x20, x19, [sp, #32]
	add	sp, sp, #64
	ret
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1

	.section	__TEXT,__cstring,cstring_literals
l_str:
	.asciz	"25.quick_sort.c FAIL"

l_str.1:
	.asciz	"25.quick_sort.c PASS"

.subsections_via_symbols
