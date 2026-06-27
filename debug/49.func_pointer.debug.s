	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_addOne
	.p2align	2
_addOne:
Lfunc_begin0:
	.file	1 "../tests" "49.func_pointer.c"
	.loc	1 29 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp1:
	.loc	1 29 5 prologue_end
	str	w0, [sp, #12]
	.loc	1 29 21 is_stmt 0
	ldr	w8, [sp, #12]
	add	w0, w8, #1
	.loc	1 29 21 epilogue_begin
	add	sp, sp, #16
	ret
Ltmp2:
Lfunc_end0:
	.cfi_endproc

	.globl	_square
	.p2align	2
_square:
Lfunc_begin1:
	.loc	1 30 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp4:
	.loc	1 30 5 prologue_end
	str	w0, [sp, #12]
	.loc	1 30 21 is_stmt 0
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #12]
	mul	w0, w8, w9
	.loc	1 30 21 epilogue_begin
	add	sp, sp, #16
	ret
Ltmp5:
Lfunc_end1:
	.cfi_endproc

	.globl	_addTwo
	.p2align	2
_addTwo:
Lfunc_begin2:
	.loc	1 31 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp7:
	.loc	1 31 5 prologue_end
	str	w0, [sp, #8]
	str	w1, [sp, #12]
	.loc	1 31 28 is_stmt 0
	ldr	w8, [sp, #8]
	ldr	w9, [sp, #12]
	add	w0, w8, w9
	.loc	1 31 28 epilogue_begin
	add	sp, sp, #16
	ret
Ltmp8:
Lfunc_end2:
	.cfi_endproc

	.globl	_apply
	.p2align	2
_apply:
Lfunc_begin3:
	.loc	1 33 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp9:
	.loc	1 33 5 prologue_end
	str	x0, [sp]
	str	w1, [sp, #12]
	.loc	1 33 36 is_stmt 0
	ldr	x8, [sp]
	ldr	w0, [sp, #12]
	blr	x8
	.loc	1 33 36 epilogue_begin
	ldp	x29, x30, [sp, #16]
	add	sp, sp, #32
	ret
Ltmp10:
Lfunc_end3:
	.cfi_endproc

	.globl	_applyAlias
	.p2align	2
_applyAlias:
Lfunc_begin4:
	.loc	1 39 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp11:
	.loc	1 39 5 prologue_end
	str	x0, [sp]
	str	w1, [sp, #12]
	.loc	1 39 32 is_stmt 0
	ldr	x8, [sp]
	ldr	w0, [sp, #12]
	blr	x8
	.loc	1 39 32 epilogue_begin
	ldp	x29, x30, [sp, #16]
	add	sp, sp, #32
	ret
Ltmp12:
Lfunc_end4:
	.cfi_endproc

	.globl	_pickOp
	.p2align	2
_pickOp:
Lfunc_begin5:
	.loc	1 52 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
Ltmp14:
	.loc	1 52 4 prologue_end
	str	w0, [sp, #12]
	.loc	1 53 3
	ldr	w8, [sp, #12]
	cbnz	w8, LBB5_2
	b	LBB5_1
LBB5_1:
Ltmp15:
	.loc	1 54 5
	adrp	x0, _addOne@PAGE
	add	x0, x0, _addOne@PAGEOFF
	.loc	1 54 5 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
LBB5_2:
	.loc	1 54 5 is_stmt 1
	b	LBB5_3
Ltmp16:
LBB5_3:
	.loc	1 56 3
	adrp	x0, _square@PAGE
	add	x0, x0, _square@PAGEOFF
	.loc	1 56 3 epilogue_begin is_stmt 0
	add	sp, sp, #16
	ret
Ltmp17:
Lfunc_end5:
	.cfi_endproc

	.globl	_sumWith
	.p2align	2
_sumWith:
Lfunc_begin6:
	.loc	1 59 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp18:
	.loc	1 59 5 prologue_end
	str	x0, [sp, #8]
	str	w1, [sp, #16]
	str	w2, [sp, #20]
	.loc	1 60 3
	str	wzr, [sp, #24]
	.loc	1 61 3
	ldr	w8, [sp, #16]
	str	w8, [sp, #28]
	.loc	1 63 3
	b	LBB6_1
LBB6_1:
	.loc	1 63 3
	ldr	w8, [sp, #28]
	ldr	w9, [sp, #20]
	subs	w8, w8, w9
	b.gt	LBB6_3
	b	LBB6_2
LBB6_2:
Ltmp19:
	.loc	1 64 5
	ldr	w8, [sp, #24]
	str	w8, [sp, #4]
	ldr	x8, [sp, #8]
	ldr	w0, [sp, #28]
	blr	x8
	ldr	w8, [sp, #4]
	add	w8, w8, w0
	str	w8, [sp, #24]
	.loc	1 65 5
	ldr	w8, [sp, #28]
	add	w8, w8, #1
	str	w8, [sp, #28]
	b	LBB6_1
Ltmp20:
LBB6_3:
	.loc	1 67 3
	ldr	w0, [sp, #24]
	.loc	1 67 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #32]
	add	sp, sp, #48
	ret
Ltmp21:
Lfunc_end6:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin7:
	.loc	1 73 0 is_stmt 1
	.cfi_startproc
	sub	sp, sp, #144
	stp	x29, x30, [sp, #128]
	.cfi_def_cfa_offset 144
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp22:
	.loc	1 74 3 prologue_end
	str	wzr, [sp, #12]
	.loc	1 80 3
	adrp	x8, _addOne@PAGE
	add	x8, x8, _addOne@PAGEOFF
	str	x8, [sp, #16]
	.loc	1 81 3
	ldr	x8, [sp, #16]
	mov	w0, #10
	blr	x8
	subs	w8, w0, #11
	b.eq	LBB7_2
	b	LBB7_1
LBB7_1:
Ltmp23:
	.loc	1 82 5
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB7_3
LBB7_2:
	.loc	1 82 5
	b	LBB7_3
Ltmp24:
LBB7_3:
	.loc	1 86 3
	adrp	x8, _square@PAGE
	add	x8, x8, _square@PAGEOFF
	str	x8, [sp, #16]
	.loc	1 87 3
	ldr	x8, [sp, #16]
	mov	w0, #6
	blr	x8
	subs	w8, w0, #36
	b.eq	LBB7_5
	b	LBB7_4
LBB7_4:
Ltmp25:
	.loc	1 88 5
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB7_6
LBB7_5:
	.loc	1 88 5
	b	LBB7_6
Ltmp26:
LBB7_6:
	.loc	1 92 3
	adrp	x8, _addTwo@PAGE
	add	x8, x8, _addTwo@PAGEOFF
	str	x8, [sp, #24]
	.loc	1 93 3
	ldr	x8, [sp, #24]
	mov	w0, #3
	mov	w1, #4
	blr	x8
	subs	w8, w0, #7
	b.eq	LBB7_8
	b	LBB7_7
LBB7_7:
Ltmp27:
	.loc	1 94 5
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB7_9
LBB7_8:
	.loc	1 94 5
	b	LBB7_9
Ltmp28:
LBB7_9:
	.loc	1 98 3
	ldr	x8, [sp, #16]
	mov	w0, #5
	blr	x8
	add	w8, w0, #1
	str	w8, [sp, #36]
	.loc	1 99 3
	ldr	w8, [sp, #36]
	subs	w8, w8, #26
	b.eq	LBB7_11
	b	LBB7_10
LBB7_10:
Ltmp29:
	.loc	1 100 5
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB7_12
LBB7_11:
	.loc	1 100 5
	b	LBB7_12
Ltmp30:
LBB7_12:
	.loc	1 104 3
	adrp	x0, _addOne@PAGE
	add	x0, x0, _addOne@PAGEOFF
	mov	w1, #41
	bl	_apply
	subs	w8, w0, #42
	b.eq	LBB7_14
	b	LBB7_13
LBB7_13:
Ltmp31:
	.loc	1 105 5
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB7_15
LBB7_14:
	.loc	1 105 5
	b	LBB7_15
Ltmp32:
LBB7_15:
	.loc	1 107 3
	adrp	x0, _square@PAGE
	add	x0, x0, _square@PAGEOFF
	mov	w1, #7
	bl	_apply
	subs	w8, w0, #49
	b.eq	LBB7_17
	b	LBB7_16
LBB7_16:
Ltmp33:
	.loc	1 108 5
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB7_18
LBB7_17:
	.loc	1 108 5
	b	LBB7_18
Ltmp34:
LBB7_18:
	.loc	1 112 3
	adrp	x0, _square@PAGE
	add	x0, x0, _square@PAGEOFF
	mov	w1, #1
	mov	w2, #4
	bl	_sumWith
	subs	w8, w0, #30
	b.eq	LBB7_20
	b	LBB7_19
LBB7_19:
Ltmp35:
	.loc	1 113 5
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB7_21
LBB7_20:
	.loc	1 113 5
	b	LBB7_21
Ltmp36:
LBB7_21:
	.loc	1 0 5 is_stmt 0
	adrp	x8, _chosen@PAGE
	.loc	1 117 3 is_stmt 1
	adrp	x9, _addOne@PAGE
	add	x9, x9, _addOne@PAGEOFF
	str	x9, [x8, _chosen@PAGEOFF]
	.loc	1 118 3
	ldr	x8, [x8, _chosen@PAGEOFF]
	mov	w0, #99
	blr	x8
	subs	w8, w0, #100
	b.eq	LBB7_23
	b	LBB7_22
LBB7_22:
Ltmp37:
	.loc	1 119 5
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB7_24
LBB7_23:
	.loc	1 119 5
	b	LBB7_24
Ltmp38:
LBB7_24:
	.loc	1 123 3
	adrp	x8, _addOne@PAGE
	add	x8, x8, _addOne@PAGEOFF
	str	x8, [sp, #16]
	.loc	1 124 3
	ldr	x8, [sp, #16]
	mov	w0, #7
	blr	x8
	subs	w8, w0, #8
	b.eq	LBB7_26
	b	LBB7_25
LBB7_25:
Ltmp39:
	.loc	1 125 5
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB7_27
LBB7_26:
	.loc	1 125 5
	b	LBB7_27
Ltmp40:
LBB7_27:
	.loc	1 134 5
	adrp	x8, _addOne@PAGE
	add	x8, x8, _addOne@PAGEOFF
	str	x8, [sp, #40]
	.loc	1 135 5
	ldr	x8, [sp, #40]
	mov	w0, #10
	blr	x8
	subs	w8, w0, #11
	b.eq	LBB7_29
	b	LBB7_28
LBB7_28:
Ltmp41:
	.loc	1 136 7
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB7_30
LBB7_29:
	.loc	1 136 7
	b	LBB7_30
Ltmp42:
LBB7_30:
	.loc	1 139 5
	adrp	x8, _square@PAGE
	add	x8, x8, _square@PAGEOFF
	str	x8, [sp, #40]
	.loc	1 140 5
	ldr	x8, [sp, #40]
	mov	w0, #6
	blr	x8
	subs	w8, w0, #36
	b.eq	LBB7_32
	b	LBB7_31
LBB7_31:
Ltmp43:
	.loc	1 141 7
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB7_33
LBB7_32:
	.loc	1 141 7
	b	LBB7_33
Ltmp44:
LBB7_33:
	.loc	1 144 5
	adrp	x8, _addTwo@PAGE
	add	x8, x8, _addTwo@PAGEOFF
	str	x8, [sp, #48]
	.loc	1 145 5
	ldr	x8, [sp, #48]
	mov	w0, #3
	mov	w1, #4
	blr	x8
	subs	w8, w0, #7
	b.eq	LBB7_35
	b	LBB7_34
LBB7_34:
Ltmp45:
	.loc	1 146 7
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB7_36
LBB7_35:
	.loc	1 146 7
	b	LBB7_36
Ltmp46:
LBB7_36:
	.loc	1 150 5
	adrp	x8, _square@PAGE
	add	x8, x8, _square@PAGEOFF
	str	x8, [sp, #56]
	.loc	1 151 5
	ldr	x8, [sp, #56]
	mov	w0, #9
	blr	x8
	subs	w8, w0, #81
	b.eq	LBB7_38
	b	LBB7_37
LBB7_37:
Ltmp47:
	.loc	1 152 7
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB7_39
LBB7_38:
	.loc	1 152 7
	b	LBB7_39
Ltmp48:
LBB7_39:
	.loc	1 156 5
	adrp	x0, _addOne@PAGE
	add	x0, x0, _addOne@PAGEOFF
	mov	w1, #41
	bl	_applyAlias
	subs	w8, w0, #42
	b.eq	LBB7_41
	b	LBB7_40
LBB7_40:
Ltmp49:
	.loc	1 157 7
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB7_42
LBB7_41:
	.loc	1 157 7
	b	LBB7_42
Ltmp50:
LBB7_42:
	.loc	1 0 7 is_stmt 0
	mov	w8, wzr
	.loc	1 161 5 is_stmt 1
	tbz	w8, #0, LBB7_44
	b	LBB7_43
LBB7_43:
Ltmp51:
	.loc	1 162 7
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB7_45
LBB7_44:
	.loc	1 162 7
	b	LBB7_45
Ltmp52:
LBB7_45:
	.loc	1 0 7 is_stmt 0
	mov	w8, #5
Ltmp53:
	.loc	1 176 5 is_stmt 1
	str	w8, [sp, #64]
	.loc	1 177 5
	adrp	x8, _square@PAGE
	add	x8, x8, _square@PAGEOFF
	str	x8, [sp, #72]
	.loc	1 178 5
	ldr	x8, [sp, #72]
	str	x8, [sp, #112]
	.loc	1 179 5
	ldr	w9, [sp, #64]
	mov	w8, #1
	subs	w9, w9, #5
	str	w8, [sp, #8]
	b.ne	LBB7_47
	b	LBB7_46
LBB7_46:
	ldr	x8, [sp, #112]
	mov	w0, #7
	blr	x8
	subs	w8, w0, #49
	cset	w8, ne
	str	w8, [sp, #8]
	b	LBB7_47
LBB7_47:
	.loc	1 0 5 is_stmt 0
	ldr	w8, [sp, #8]
	.loc	1 179 5
	tbz	w8, #0, LBB7_49
	b	LBB7_48
LBB7_48:
Ltmp54:
	.loc	1 180 7 is_stmt 1
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB7_50
LBB7_49:
	.loc	1 180 7
	b	LBB7_50
Ltmp55:
LBB7_50:
	.loc	1 184 5
	adrp	x8, _addOne@PAGE
	add	x8, x8, _addOne@PAGEOFF
	str	x8, [sp, #72]
	.loc	1 185 5
	ldr	x8, [sp, #72]
	str	x8, [sp, #112]
	.loc	1 186 5
	ldr	w9, [sp, #64]
	mov	w8, #1
	subs	w9, w9, #5
	str	w8, [sp, #4]
	b.ne	LBB7_52
	b	LBB7_51
LBB7_51:
	ldr	x8, [sp, #112]
	mov	w0, #7
	blr	x8
	subs	w8, w0, #8
	cset	w8, ne
	str	w8, [sp, #4]
	b	LBB7_52
LBB7_52:
	.loc	1 0 5 is_stmt 0
	ldr	w8, [sp, #4]
	.loc	1 186 5
	tbz	w8, #0, LBB7_54
	b	LBB7_53
LBB7_53:
Ltmp56:
	.loc	1 187 7 is_stmt 1
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB7_55
LBB7_54:
	.loc	1 187 7
	b	LBB7_55
Ltmp57:
LBB7_55:
	.loc	1 191 5
	adrp	x8, _addOne@PAGE
	add	x8, x8, _addOne@PAGEOFF
	str	x8, [sp, #80]
	.loc	1 192 5
	ldr	x8, [sp, #80]
	str	x8, [sp, #112]
	.loc	1 193 5
	ldr	x8, [sp, #112]
	mov	w0, #41
	blr	x8
	subs	w8, w0, #42
	b.eq	LBB7_57
	b	LBB7_56
LBB7_56:
Ltmp58:
	.loc	1 194 7
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB7_58
LBB7_57:
	.loc	1 194 7
	b	LBB7_58
Ltmp59:
LBB7_58:
	.loc	1 0 7 is_stmt 0
	adrp	x8, _addOne@PAGE
	add	x8, x8, _addOne@PAGEOFF
	.loc	1 198 5 is_stmt 1
	mov	x9, x8
	str	x9, [sp, #88]
	.loc	1 199 5
	adrp	x9, _square@PAGE
	add	x9, x9, _square@PAGEOFF
	str	x9, [sp, #96]
	.loc	1 200 5
	str	x8, [sp, #104]
	.loc	1 201 5
	str	wzr, [sp, #124]
	.loc	1 202 5
	str	wzr, [sp, #120]
	.loc	1 203 5
	b	LBB7_59
LBB7_59:
	.loc	1 203 5
	ldr	w8, [sp, #120]
	subs	w8, w8, #3
	b.ge	LBB7_61
	b	LBB7_60
LBB7_60:
Ltmp60:
	.loc	1 204 7
	ldrsw	x9, [sp, #120]
	add	x8, sp, #88
	ldr	x8, [x8, x9, lsl #3]
	str	x8, [sp, #112]
	.loc	1 205 7
	ldr	w8, [sp, #124]
	str	w8, [sp]
	ldr	x8, [sp, #112]
	ldr	w9, [sp, #120]
	add	w0, w9, #1
	blr	x8
	ldr	w8, [sp]
	add	w8, w8, w0
	str	w8, [sp, #124]
	.loc	1 206 7
	ldr	w8, [sp, #120]
	add	w8, w8, #1
	str	w8, [sp, #120]
	b	LBB7_59
Ltmp61:
LBB7_61:
	.loc	1 208 5
	ldr	w8, [sp, #124]
	subs	w8, w8, #10
	b.eq	LBB7_63
	b	LBB7_62
LBB7_62:
Ltmp62:
	.loc	1 209 7
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB7_64
LBB7_63:
	.loc	1 209 7
	b	LBB7_64
Ltmp63:
LBB7_64:
	.loc	1 213 5
	mov	w0, wzr
	bl	_pickOp
	str	x0, [sp, #112]
	.loc	1 214 5
	ldr	x8, [sp, #112]
	mov	w0, #10
	blr	x8
	subs	w8, w0, #11
	b.eq	LBB7_66
	b	LBB7_65
LBB7_65:
Ltmp64:
	.loc	1 215 7
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB7_67
LBB7_66:
	.loc	1 215 7
	b	LBB7_67
Ltmp65:
LBB7_67:
	.loc	1 217 5
	mov	w0, #1
	bl	_pickOp
	str	x0, [sp, #112]
	.loc	1 218 5
	ldr	x8, [sp, #112]
	mov	w0, #10
	blr	x8
	subs	w8, w0, #100
	b.eq	LBB7_69
	b	LBB7_68
LBB7_68:
Ltmp66:
	.loc	1 219 7
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB7_70
LBB7_69:
	.loc	1 219 7
	b	LBB7_70
Ltmp67:
LBB7_70:
	.loc	1 223 3
	ldr	w8, [sp, #12]
	cbnz	w8, LBB7_72
	b	LBB7_71
LBB7_71:
Ltmp68:
	.loc	1 224 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	.loc	1 225 5
	mov	w0, wzr
	.loc	1 225 5 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #128]
	add	sp, sp, #144
	ret
LBB7_72:
	.loc	1 225 5 is_stmt 1
	b	LBB7_73
Ltmp69:
LBB7_73:
	.loc	1 227 3
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	.loc	1 228 3
	mov	w0, #1
	.loc	1 228 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #128]
	add	sp, sp, #144
	ret
Ltmp70:
Lfunc_end7:
	.cfi_endproc

	.globl	_chosen
.zerofill __DATA,__common,_chosen,8,3
	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"49.func_pointer.c PASS\n"

l___unnamed_2:
	.asciz	"49.func_pointer.c FAIL\n"

	.section	__DWARF,__debug_abbrev,regular,debug
Lsection_abbrev:
	.byte	1
	.byte	17
	.byte	1
	.byte	37
	.byte	14
	.byte	19
	.byte	5
	.byte	3
	.byte	14
	.byte	16
	.byte	23
	.byte	27
	.byte	14
	.byte	17
	.byte	1
	.byte	18
	.byte	6
	.byte	0
	.byte	0
	.byte	2
	.byte	46
	.byte	1
	.byte	17
	.byte	1
	.byte	18
	.byte	6
	.ascii	"\347\177"
	.byte	25
	.byte	64
	.byte	24
	.byte	110
	.byte	14
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	73
	.byte	19
	.byte	63
	.byte	25
	.byte	0
	.byte	0
	.byte	3
	.byte	5
	.byte	0
	.byte	2
	.byte	24
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	4
	.byte	52
	.byte	0
	.byte	2
	.byte	24
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	5
	.byte	11
	.byte	1
	.byte	17
	.byte	1
	.byte	18
	.byte	6
	.byte	0
	.byte	0
	.byte	6
	.byte	36
	.byte	0
	.byte	3
	.byte	14
	.byte	62
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	7
	.byte	15
	.byte	0
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	8
	.byte	1
	.byte	1
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	9
	.byte	33
	.byte	0
	.byte	73
	.byte	19
	.byte	55
	.byte	11
	.byte	0
	.byte	0
	.byte	10
	.byte	36
	.byte	0
	.byte	3
	.byte	14
	.byte	11
	.byte	11
	.byte	62
	.byte	11
	.byte	0
	.byte	0
	.byte	11
	.byte	23
	.byte	1
	.byte	3
	.byte	14
	.byte	11
	.byte	11
	.ascii	"\210\001"
	.byte	15
	.byte	0
	.byte	0
	.byte	12
	.byte	13
	.byte	0
	.byte	3
	.byte	14
	.byte	73
	.byte	19
	.ascii	"\210\001"
	.byte	15
	.byte	56
	.byte	11
	.byte	0
	.byte	0
	.byte	13
	.byte	19
	.byte	1
	.byte	3
	.byte	14
	.byte	11
	.byte	11
	.ascii	"\210\001"
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.section	__DWARF,__debug_info,regular,debug
Lsection_info:
Lcu_begin0:
.set Lset0, Ldebug_info_end0-Ldebug_info_start0
	.long	Lset0
Ldebug_info_start0:
	.short	4
.set Lset1, Lsection_abbrev-Lsection_abbrev
	.long	Lset1
	.byte	8
	.byte	1
	.long	0
	.short	2
	.long	4
.set Lset2, Lline_table_start0-Lsection_line
	.long	Lset2
	.long	22
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end7-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	31
	.long	31
	.byte	1
	.byte	29
	.long	694

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	98
	.byte	1
	.byte	29
	.long	694
	.byte	0
	.byte	2
	.quad	Lfunc_begin1
.set Lset5, Lfunc_end1-Lfunc_begin1
	.long	Lset5

	.byte	1
	.byte	111
	.long	38
	.long	38
	.byte	1
	.byte	30
	.long	694

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	98
	.byte	1
	.byte	30
	.long	694
	.byte	0
	.byte	2
	.quad	Lfunc_begin2
.set Lset6, Lfunc_end2-Lfunc_begin2
	.long	Lset6

	.byte	1
	.byte	111
	.long	45
	.long	45
	.byte	1
	.byte	31
	.long	694

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	102
	.byte	1
	.byte	31
	.long	694
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	100
	.byte	1
	.byte	31
	.long	694
	.byte	0
	.byte	2
	.quad	Lfunc_begin3
.set Lset7, Lfunc_end3-Lfunc_begin3
	.long	Lset7

	.byte	1
	.byte	111
	.long	52
	.long	52
	.byte	1
	.byte	33
	.long	694

	.byte	3
	.byte	2
	.byte	145
	.byte	0
	.long	106
	.byte	1
	.byte	33
	.long	701
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	104
	.byte	1
	.byte	33
	.long	694
	.byte	0
	.byte	2
	.quad	Lfunc_begin4
.set Lset8, Lfunc_end4-Lfunc_begin4
	.long	Lset8

	.byte	1
	.byte	111
	.long	58
	.long	58
	.byte	1
	.byte	39
	.long	694

	.byte	3
	.byte	2
	.byte	145
	.byte	0
	.long	106
	.byte	1
	.byte	39
	.long	701
	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	104
	.byte	1
	.byte	39
	.long	694
	.byte	0
	.byte	2
	.quad	Lfunc_begin5
.set Lset9, Lfunc_end5-Lfunc_begin5
	.long	Lset9

	.byte	1
	.byte	111
	.long	69
	.long	69
	.byte	1
	.byte	52
	.long	701

	.byte	3
	.byte	2
	.byte	145
	.byte	12
	.long	109
	.byte	1
	.byte	52
	.long	694
	.byte	0
	.byte	2
	.quad	Lfunc_begin6
.set Lset10, Lfunc_end6-Lfunc_begin6
	.long	Lset10

	.byte	1
	.byte	111
	.long	76
	.long	76
	.byte	1
	.byte	59
	.long	694

	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	106
	.byte	1
	.byte	59
	.long	701
	.byte	3
	.byte	2
	.byte	145
	.byte	16
	.long	126
	.byte	1
	.byte	59
	.long	694
	.byte	3
	.byte	2
	.byte	145
	.byte	20
	.long	123
	.byte	1
	.byte	59
	.long	694
	.byte	4
	.byte	2
	.byte	145
	.byte	28
	.long	115
	.byte	1
	.byte	61
	.long	694
	.byte	4
	.byte	2
	.byte	145
	.byte	24
	.long	117
	.byte	1
	.byte	60
	.long	694
	.byte	0
	.byte	2
	.quad	Lfunc_begin7
.set Lset11, Lfunc_end7-Lfunc_begin7
	.long	Lset11

	.byte	1
	.byte	111
	.long	84
	.long	84
	.byte	1
	.byte	73
	.long	694

	.byte	4
	.byte	2
	.byte	145
	.byte	36
	.long	212
	.byte	1
	.byte	77
	.long	694
	.byte	4
	.byte	2
	.byte	145
	.byte	24
	.long	214
	.byte	1
	.byte	76
	.long	701
	.byte	4
	.byte	2
	.byte	145
	.byte	16
	.long	216
	.byte	1
	.byte	75
	.long	701
	.byte	4
	.byte	2
	.byte	145
	.byte	12
	.long	218
	.byte	1
	.byte	74
	.long	694
	.byte	5
	.quad	Ltmp40
.set Lset12, Ltmp52-Ltmp40
	.long	Lset12
	.byte	4
	.byte	2
	.byte	145
	.byte	56
	.long	189
	.byte	1
	.byte	132
	.long	701
	.byte	4
	.byte	2
	.byte	145
	.byte	48
	.long	195
	.byte	1
	.byte	131
	.long	701
	.byte	4
	.byte	2
	.byte	145
	.byte	40
	.long	203
	.byte	1
	.byte	130
	.long	701
	.byte	0
	.byte	5
	.quad	Ltmp53
.set Lset13, Ltmp67-Ltmp53
	.long	Lset13
	.byte	4
	.byte	3
	.byte	145
	.asciz	"\374"
	.long	117
	.byte	1
	.byte	173
	.long	694
	.byte	4
	.byte	3
	.byte	145
	.asciz	"\370"
	.long	115
	.byte	1
	.byte	172
	.long	694
	.byte	4
	.byte	3
	.byte	145
	.asciz	"\360"
	.long	131
	.byte	1
	.byte	171
	.long	701
	.byte	4
	.byte	3
	.byte	145
	.asciz	"\330"
	.long	142
	.byte	1
	.byte	170
	.long	713
	.byte	4
	.byte	3
	.byte	145
	.asciz	"\320"
	.long	168
	.byte	1
	.byte	169
	.long	732
	.byte	4
	.byte	3
	.byte	145
	.asciz	"\300"
	.long	178
	.byte	1
	.byte	168
	.long	762
	.byte	0
	.byte	0
	.byte	6
	.long	89
	.byte	5
	.byte	4
	.byte	7
	.long	706
	.byte	6
	.long	93
	.byte	1
	.byte	0
	.byte	8
	.long	706
	.byte	9
	.long	725
	.byte	3
	.byte	0
	.byte	10
	.long	148
	.byte	8
	.byte	7
	.byte	11
	.long	173
	.byte	8
	.byte	8
	.byte	12
	.long	106
	.long	701
	.byte	8
	.byte	0
	.byte	12
	.long	104
	.long	694
	.byte	4
	.byte	0
	.byte	0
	.byte	13
	.long	182
	.byte	16
	.byte	8
	.byte	12
	.long	186
	.long	694
	.byte	4
	.byte	0
	.byte	12
	.long	106
	.long	701
	.byte	8
	.byte	8
	.byte	0
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"49.func_pointer.c"
	.asciz	"../tests"
	.asciz	"addOne"
	.asciz	"square"
	.asciz	"addTwo"
	.asciz	"apply"
	.asciz	"applyAlias"
	.asciz	"pickOp"
	.asciz	"sumWith"
	.asciz	"main"
	.asciz	"int"
	.asciz	"void"
	.asciz	"x"
	.asciz	"b"
	.asciz	"a"
	.asciz	"n"
	.asciz	"fn"
	.asciz	"which"
	.asciz	"i"
	.asciz	"total"
	.asciz	"to"
	.asciz	"from"
	.asciz	"fromMember"
	.asciz	"table"
	.asciz	"__ARRAY_SIZE_TYPE__"
	.asciz	"slot"
	.asciz	"Slot"
	.asciz	"rec"
	.asciz	"Rec"
	.asciz	"id"
	.asciz	"chain"
	.asciz	"twoArgs"
	.asciz	"viaAlias"
	.asciz	"r"
	.asciz	"q"
	.asciz	"p"
	.asciz	"failed"
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	8
	.long	8
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	0
	.long	-1
	.long	2
	.long	3
	.long	-1
	.long	5
	.long	6
	.long	-1
	.long	-244502352
	.long	-244496600
	.long	2090499946
	.long	253337163
	.long	348451691
	.long	-1449885067
	.long	475982358
	.long	-1325765738
.set Lset14, LNames0-Lnames_begin
	.long	Lset14
.set Lset15, LNames2-Lnames_begin
	.long	Lset15
.set Lset16, LNames7-Lnames_begin
	.long	Lset16
.set Lset17, LNames3-Lnames_begin
	.long	Lset17
.set Lset18, LNames5-Lnames_begin
	.long	Lset18
.set Lset19, LNames4-Lnames_begin
	.long	Lset19
.set Lset20, LNames1-Lnames_begin
	.long	Lset20
.set Lset21, LNames6-Lnames_begin
	.long	Lset21
LNames0:
	.long	31
	.long	1
	.long	42
	.long	0
LNames2:
	.long	45
	.long	1
	.long	130
	.long	0
LNames7:
	.long	84
	.long	1
	.long	448
	.long	0
LNames3:
	.long	52
	.long	1
	.long	188
	.long	0
LNames5:
	.long	69
	.long	1
	.long	304
	.long	0
LNames4:
	.long	58
	.long	1
	.long	246
	.long	0
LNames1:
	.long	38
	.long	1
	.long	86
	.long	0
LNames6:
	.long	76
	.long	1
	.long	348
	.long	0
	.section	__DWARF,__apple_objc,regular,debug
Lobjc_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	1
	.long	0
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	-1
	.section	__DWARF,__apple_namespac,regular,debug
Lnamespac_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	1
	.long	0
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	-1
	.section	__DWARF,__apple_types,regular,debug
Ltypes_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	5
	.long	5
	.long	20
	.long	0
	.long	3
	.short	1
	.short	6
	.short	3
	.short	5
	.short	4
	.short	11
	.long	0
	.long	1
	.long	2
	.long	4
	.long	-1
	.long	2090838615
	.long	-594775205
	.long	193469727
	.long	2089577767
	.long	193495088
.set Lset22, Ltypes1-Ltypes_begin
	.long	Lset22
.set Lset23, Ltypes2-Ltypes_begin
	.long	Lset23
.set Lset24, Ltypes4-Ltypes_begin
	.long	Lset24
.set Lset25, Ltypes3-Ltypes_begin
	.long	Lset25
.set Lset26, Ltypes0-Ltypes_begin
	.long	Lset26
Ltypes1:
	.long	93
	.long	1
	.long	706
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	148
	.long	1
	.long	725
	.short	36
	.byte	0
	.long	0
Ltypes4:
	.long	182
	.long	1
	.long	762
	.short	19
	.byte	0
	.long	0
Ltypes3:
	.long	173
	.long	1
	.long	732
	.short	23
	.byte	0
	.long	0
Ltypes0:
	.long	89
	.long	1
	.long	694
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
