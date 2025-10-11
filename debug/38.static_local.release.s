	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_get_seed
	.p2align	2
_get_seed:
	mov	w0, #7
	ret

	.globl	_counter_calls
	.p2align	2
_counter_calls:
	adrp	x8, _counter_calls.count@PAGE
	ldr	w9, [x8, _counter_calls.count@PAGEOFF]
	add	w0, w9, #1
	str	w0, [x8, _counter_calls.count@PAGEOFF]
	ret

	.globl	_counter_with_init
	.p2align	2
_counter_with_init:
	adrp	x8, _counter_with_init.count@PAGE
	ldr	w9, [x8, _counter_with_init.count@PAGEOFF]
	add	w0, w9, #1
	str	w0, [x8, _counter_with_init.count@PAGEOFF]
	ret

	.globl	_bump_runtime_static_decl
	.p2align	2
_bump_runtime_static_decl:
	adrp	x9, l_bump_runtime_static_decl.value.inited@PAGE
	ldrb	w8, [x9, l_bump_runtime_static_decl.value.inited@PAGEOFF]
	cmp	w8, #1
	adrp	x8, _bump_runtime_static_decl.value@PAGE
	b.ne	LBB3_2
	ldr	w9, [x8, _bump_runtime_static_decl.value@PAGEOFF]
	add	w0, w9, #1
	str	w0, [x8, _bump_runtime_static_decl.value@PAGEOFF]
	ret
LBB3_2:
	mov	w10, #1
	mov	w0, #8
	strb	w10, [x9, l_bump_runtime_static_decl.value.inited@PAGEOFF]
	str	w0, [x8, _bump_runtime_static_decl.value@PAGEOFF]
	ret

	.globl	_main
	.p2align	2
_main:
	stp	x20, x19, [sp, #-32]!
	adrp	x8, _counter_calls.count@PAGE
	adrp	x10, _counter_with_init.count@PAGE
	adrp	x9, l_bump_runtime_static_decl.value.inited@PAGE
	ldr	w11, [x8, _counter_calls.count@PAGEOFF]
	ldr	w12, [x10, _counter_with_init.count@PAGEOFF]
	ldrb	w14, [x9, l_bump_runtime_static_decl.value.inited@PAGEOFF]
	stp	x29, x30, [sp, #16]
	add	w13, w11, #3
	cmp	w12, #10
	str	w13, [x8, _counter_calls.count@PAGEOFF]
	add	w8, w12, #2
	ccmp	w11, #0, #0, eq
	str	w8, [x10, _counter_with_init.count@PAGEOFF]
	cset	w8, ne
	tbz	w14, #0, LBB4_4
	adrp	x9, _bump_runtime_static_decl.value@PAGE
	ldr	w10, [x9, _bump_runtime_static_decl.value@PAGEOFF]
	cmp	w10, #7
	add	w10, w10, #2
	csinc	w8, w8, wzr, eq
	cmp	w10, #9
	str	w10, [x9, _bump_runtime_static_decl.value@PAGEOFF]
	b.ne	LBB4_3
	cbz	w8, LBB4_5
LBB4_3:
	mov	w19, #1
Lloh0:
	adrp	x0, l_str@PAGE
Lloh1:
	add	x0, x0, l_str@PAGEOFF
	b	LBB4_6
LBB4_4:
	mov	w10, #1
	adrp	x11, _bump_runtime_static_decl.value@PAGE
	mov	w12, #9
	strb	w10, [x9, l_bump_runtime_static_decl.value.inited@PAGEOFF]
	str	w12, [x11, _bump_runtime_static_decl.value@PAGEOFF]
	cbnz	w8, LBB4_3
LBB4_5:
	mov	w19, wzr
Lloh2:
	adrp	x0, l_str.1@PAGE
Lloh3:
	add	x0, x0, l_str.1@PAGEOFF
LBB4_6:
	bl	_puts
	ldp	x29, x30, [sp, #16]
	mov	w0, w19
	ldp	x20, x19, [sp], #32
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh2, Lloh3

.zerofill __DATA,__bss,_counter_calls.count,4,2
	.section	__DATA,__data
	.p2align	2, 0x0
_counter_with_init.count:
	.long	10

.zerofill __DATA,__bss,_bump_runtime_static_decl.value,4,2
.zerofill __DATA,__bss,l_bump_runtime_static_decl.value.inited,1,0
	.section	__TEXT,__cstring,cstring_literals
l_str:
	.asciz	"38.static_local.c FAIL"

l_str.1:
	.asciz	"38.static_local.c PASS"

.subsections_via_symbols
