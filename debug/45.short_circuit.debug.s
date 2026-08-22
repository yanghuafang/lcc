	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_bump
	.p2align	2
_bump:
Lfunc_begin0:
	.file	1 "../tests" "45.short_circuit.c"
	.loc	1 24 0
	.cfi_startproc
	adrp	x9, _calls@PAGE
Ltmp0:
	.loc	1 25 3 prologue_end
	ldr	w8, [x9, _calls@PAGEOFF]
	mov	w0, #1
	add	w8, w8, #1
	str	w8, [x9, _calls@PAGEOFF]
	.loc	1 26 3
	ret
Ltmp1:
Lfunc_end0:
	.cfi_endproc

	.globl	_trueArm
	.p2align	2
_trueArm:
Lfunc_begin1:
	.cfi_startproc
	.loc	1 33 3 prologue_end
	adrp	x9, _trueRan@PAGE
	mov	w8, #1
	str	w8, [x9, _trueRan@PAGEOFF]
	.loc	1 34 3
	mov	w0, #10
	ret
Ltmp2:
Lfunc_end1:
	.cfi_endproc

	.globl	_falseArm
	.p2align	2
_falseArm:
Lfunc_begin2:
	.cfi_startproc
	.loc	1 38 3 prologue_end
	adrp	x9, _falseRan@PAGE
	mov	w8, #1
	str	w8, [x9, _falseRan@PAGEOFF]
	.loc	1 39 3
	mov	w0, #20
	ret
Ltmp3:
Lfunc_end2:
	.cfi_endproc

	.globl	_main
	.p2align	2
_main:
Lfunc_begin3:
	.loc	1 42 0
	.cfi_startproc
	sub	sp, sp, #192
	stp	x29, x30, [sp, #176]
	.cfi_def_cfa_offset 192
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, wzr
Ltmp4:
	.loc	1 43 3 prologue_end
	str	wzr, [sp, #108]
	.loc	1 47 3
	adrp	x9, _calls@PAGE
	str	wzr, [x9, _calls@PAGEOFF]
	mov	w9, #0
	str	w9, [sp, #104]
	.loc	1 48 3
	tbz	w8, #0, LBB3_2
	b	LBB3_1
LBB3_1:
	bl	_bump
	subs	w8, w0, #0
	cset	w8, ne
	str	w8, [sp, #104]
	b	LBB3_2
LBB3_2:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #104]
	.loc	1 48 3
	tbz	w8, #0, LBB3_4
	b	LBB3_3
LBB3_3:
	.loc	1 48 27
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_5
LBB3_4:
	b	LBB3_5
LBB3_5:
	.loc	1 49 3 is_stmt 1
	adrp	x8, _calls@PAGE
	ldr	w8, [x8, _calls@PAGEOFF]
	cbz	w8, LBB3_7
	b	LBB3_6
LBB3_6:
	.loc	1 49 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_8
LBB3_7:
	b	LBB3_8
LBB3_8:
	.loc	1 51 3 is_stmt 1
	adrp	x8, _calls@PAGE
	str	wzr, [x8, _calls@PAGEOFF]
	mov	w9, #1
	mov	w8, #1
	str	w9, [sp, #100]
	.loc	1 52 3
	tbnz	w8, #0, LBB3_10
	b	LBB3_9
LBB3_9:
	bl	_bump
	subs	w8, w0, #0
	cset	w8, ne
	str	w8, [sp, #100]
	b	LBB3_10
LBB3_10:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #100]
	.loc	1 52 3
	and	w8, w8, #0x1
	subs	w8, w8, #1
	b.eq	LBB3_12
	b	LBB3_11
LBB3_11:
	.loc	1 52 27
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_13
LBB3_12:
	b	LBB3_13
LBB3_13:
	.loc	1 53 3 is_stmt 1
	adrp	x8, _calls@PAGE
	ldr	w8, [x8, _calls@PAGEOFF]
	cbz	w8, LBB3_15
	b	LBB3_14
LBB3_14:
	.loc	1 53 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_16
LBB3_15:
	b	LBB3_16
LBB3_16:
	.loc	1 56 3 is_stmt 1
	adrp	x8, _calls@PAGE
	str	wzr, [x8, _calls@PAGEOFF]
	mov	w8, #1
	mov	w9, #0
	str	w9, [sp, #96]
	.loc	1 57 3
	tbz	w8, #0, LBB3_18
	b	LBB3_17
LBB3_17:
	bl	_bump
	subs	w8, w0, #0
	cset	w8, ne
	str	w8, [sp, #96]
	b	LBB3_18
LBB3_18:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #96]
	.loc	1 57 3
	and	w8, w8, #0x1
	subs	w8, w8, #1
	b.eq	LBB3_20
	b	LBB3_19
LBB3_19:
	.loc	1 57 27
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_21
LBB3_20:
	b	LBB3_21
LBB3_21:
	.loc	1 58 3 is_stmt 1
	adrp	x8, _calls@PAGE
	ldr	w8, [x8, _calls@PAGEOFF]
	subs	w8, w8, #1
	b.eq	LBB3_23
	b	LBB3_22
LBB3_22:
	.loc	1 58 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_24
LBB3_23:
	b	LBB3_24
LBB3_24:
	.loc	1 60 3 is_stmt 1
	adrp	x9, _calls@PAGE
	mov	w8, wzr
	str	wzr, [x9, _calls@PAGEOFF]
	mov	w9, #1
	str	w9, [sp, #92]
	.loc	1 61 3
	tbnz	w8, #0, LBB3_26
	b	LBB3_25
LBB3_25:
	bl	_bump
	subs	w8, w0, #0
	cset	w8, ne
	str	w8, [sp, #92]
	b	LBB3_26
LBB3_26:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #92]
	.loc	1 61 3
	and	w8, w8, #0x1
	subs	w8, w8, #1
	b.eq	LBB3_28
	b	LBB3_27
LBB3_27:
	.loc	1 61 27
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_29
LBB3_28:
	b	LBB3_29
LBB3_29:
	.loc	1 62 3 is_stmt 1
	adrp	x8, _calls@PAGE
	ldr	w8, [x8, _calls@PAGEOFF]
	subs	w8, w8, #1
	b.eq	LBB3_31
	b	LBB3_30
LBB3_30:
	.loc	1 62 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_32
LBB3_31:
	b	LBB3_32
LBB3_32:
	.loc	1 67 3 is_stmt 1
	str	xzr, [sp, #112]
	.loc	1 68 3
	ldr	x8, [sp, #112]
	mov	w9, #0
	str	w9, [sp, #88]
	cbz	x8, LBB3_34
	b	LBB3_33
LBB3_33:
	ldr	x8, [sp, #112]
	ldr	w8, [x8]
	subs	w8, w8, #1
	cset	w8, eq
	str	w8, [sp, #88]
	b	LBB3_34
LBB3_34:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #88]
	.loc	1 68 3
	tbz	w8, #0, LBB3_36
	b	LBB3_35
LBB3_35:
	.loc	1 68 26
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_37
LBB3_36:
	b	LBB3_37
LBB3_37:
	.loc	1 71 3 is_stmt 1
	mov	w8, #1
	str	w8, [sp, #124]
	mov	w8, #2
	str	w8, [sp, #128]
	mov	w8, #3
	str	w8, [sp, #132]
	.loc	1 72 3
	mov	w8, #7
	str	w8, [sp, #136]
	.loc	1 73 3
	ldr	w9, [sp, #136]
	mov	w8, #0
	subs	w9, w9, #3
	str	w8, [sp, #84]
	b.ge	LBB3_39
	b	LBB3_38
LBB3_38:
	ldrsw	x9, [sp, #136]
	add	x8, sp, #124
	ldr	w8, [x8, x9, lsl #2]
	subs	w8, w8, #0
	cset	w8, eq
	str	w8, [sp, #84]
	b	LBB3_39
LBB3_39:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #84]
	.loc	1 73 3
	tbz	w8, #0, LBB3_41
	b	LBB3_40
LBB3_40:
	.loc	1 73 29
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_42
LBB3_41:
	b	LBB3_42
LBB3_42:
	.loc	1 76 3 is_stmt 1
	adrp	x8, _trueRan@PAGE
	str	wzr, [x8, _trueRan@PAGEOFF]
	.loc	1 77 3
	adrp	x8, _falseRan@PAGE
	str	wzr, [x8, _falseRan@PAGEOFF]
	mov	w8, #1
	.loc	1 78 3
	tbz	w8, #0, LBB3_44
	b	LBB3_43
LBB3_43:
	bl	_trueArm
	str	w0, [sp, #80]
	b	LBB3_45
LBB3_44:
	bl	_falseArm
	str	w0, [sp, #80]
	b	LBB3_45
LBB3_45:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #80]
	.loc	1 78 3
	subs	w8, w8, #10
	b.eq	LBB3_47
	b	LBB3_46
LBB3_46:
	.loc	1 78 43
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_48
LBB3_47:
	b	LBB3_48
LBB3_48:
	.loc	1 79 3 is_stmt 1
	adrp	x8, _trueRan@PAGE
	ldr	w8, [x8, _trueRan@PAGEOFF]
	subs	w8, w8, #1
	b.eq	LBB3_50
	b	LBB3_49
LBB3_49:
	.loc	1 79 21 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_51
LBB3_50:
	b	LBB3_51
LBB3_51:
	.loc	1 80 3 is_stmt 1
	adrp	x8, _falseRan@PAGE
	ldr	w8, [x8, _falseRan@PAGEOFF]
	cbz	w8, LBB3_53
	b	LBB3_52
LBB3_52:
	.loc	1 80 22 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_54
LBB3_53:
	b	LBB3_54
LBB3_54:
	.loc	1 82 3 is_stmt 1
	adrp	x9, _trueRan@PAGE
	mov	w8, wzr
	str	wzr, [x9, _trueRan@PAGEOFF]
	.loc	1 83 3
	adrp	x9, _falseRan@PAGE
	str	wzr, [x9, _falseRan@PAGEOFF]
	.loc	1 84 3
	tbz	w8, #0, LBB3_56
	b	LBB3_55
LBB3_55:
	bl	_trueArm
	str	w0, [sp, #76]
	b	LBB3_57
LBB3_56:
	bl	_falseArm
	str	w0, [sp, #76]
	b	LBB3_57
LBB3_57:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #76]
	.loc	1 84 3
	subs	w8, w8, #20
	b.eq	LBB3_59
	b	LBB3_58
LBB3_58:
	.loc	1 84 43
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_60
LBB3_59:
	b	LBB3_60
LBB3_60:
	.loc	1 85 3 is_stmt 1
	adrp	x8, _trueRan@PAGE
	ldr	w8, [x8, _trueRan@PAGEOFF]
	cbz	w8, LBB3_62
	b	LBB3_61
LBB3_61:
	.loc	1 85 21 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_63
LBB3_62:
	b	LBB3_63
LBB3_63:
	.loc	1 86 3 is_stmt 1
	adrp	x8, _falseRan@PAGE
	ldr	w8, [x8, _falseRan@PAGEOFF]
	subs	w8, w8, #1
	b.eq	LBB3_65
	b	LBB3_64
LBB3_64:
	.loc	1 86 22 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_66
LBB3_65:
	b	LBB3_66
LBB3_66:
	.loc	1 0 22
	mov	w8, #1
	.loc	1 91 3 is_stmt 1
	str	w8, [sp, #140]
	.loc	1 92 3
	str	wzr, [sp, #144]
	.loc	1 93 3
	str	w8, [sp, #148]
	.loc	1 94 3
	ldr	w8, [sp, #140]
	mov	w9, #0
	str	w9, [sp, #72]
	cbz	w8, LBB3_68
	b	LBB3_67
LBB3_67:
	ldr	w8, [sp, #144]
	subs	w8, w8, #0
	cset	w8, ne
	str	w8, [sp, #72]
	b	LBB3_68
LBB3_68:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #72]
	mov	w9, #1
	str	w9, [sp, #68]
	.loc	1 94 3
	tbnz	w8, #0, LBB3_70
	b	LBB3_69
LBB3_69:
	ldr	w8, [sp, #148]
	subs	w8, w8, #0
	cset	w8, ne
	str	w8, [sp, #68]
	b	LBB3_70
LBB3_70:
	.loc	1 0 3
	ldr	w8, [sp, #68]
	.loc	1 94 3
	and	w8, w8, #0x1
	subs	w8, w8, #1
	b.eq	LBB3_72
	b	LBB3_71
LBB3_71:
	.loc	1 94 27
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_73
LBB3_72:
	b	LBB3_73
LBB3_73:
	.loc	1 95 3 is_stmt 1
	ldr	w8, [sp, #140]
	mov	w9, #0
	str	w9, [sp, #64]
	cbz	w8, LBB3_75
	b	LBB3_74
LBB3_74:
	ldr	w8, [sp, #144]
	mov	w9, #0
	str	w9, [sp, #60]
	cbnz	w8, LBB3_76
	b	LBB3_77
LBB3_75:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #64]
	.loc	1 95 3
	tbnz	w8, #0, LBB3_78
	b	LBB3_79
LBB3_76:
	ldr	w8, [sp, #148]
	subs	w8, w8, #0
	cset	w8, ne
	str	w8, [sp, #60]
	b	LBB3_77
LBB3_77:
	.loc	1 0 3
	ldr	w8, [sp, #60]
	str	w8, [sp, #64]
	.loc	1 95 3
	b	LBB3_75
LBB3_78:
	.loc	1 95 29
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_80
LBB3_79:
	b	LBB3_80
LBB3_80:
	.loc	1 96 3 is_stmt 1
	ldr	w8, [sp, #140]
	cbz	w8, LBB3_82
	b	LBB3_81
LBB3_81:
	ldr	w8, [sp, #144]
	str	w8, [sp, #56]
	b	LBB3_83
LBB3_82:
	ldr	w8, [sp, #148]
	str	w8, [sp, #56]
	b	LBB3_83
LBB3_83:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #56]
	mov	w9, #0
	str	w9, [sp, #52]
	.loc	1 96 3
	cbz	w8, LBB3_85
	b	LBB3_84
LBB3_84:
	ldr	w8, [sp, #140]
	subs	w8, w8, #0
	cset	w8, ne
	str	w8, [sp, #52]
	b	LBB3_85
LBB3_85:
	.loc	1 0 3
	ldr	w8, [sp, #52]
	.loc	1 96 3
	tbz	w8, #0, LBB3_87
	b	LBB3_86
LBB3_86:
	.loc	1 96 32
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_88
LBB3_87:
	b	LBB3_88
LBB3_88:
	.loc	1 101 3 is_stmt 1
	ldr	w8, [sp, #140]
	cbz	w8, LBB3_90
	b	LBB3_89
LBB3_89:
	ldr	w8, [sp, #144]
	mov	w9, #0
	str	w9, [sp, #48]
	cbnz	w8, LBB3_92
	b	LBB3_93
LBB3_90:
	ldr	w8, [sp, #144]
	mov	w9, #1
	str	w9, [sp, #44]
	cbnz	w8, LBB3_95
	b	LBB3_94
LBB3_91:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #40]
	.loc	1 101 3
	str	w8, [sp, #152]
	.loc	1 102 3 is_stmt 1
	ldr	w8, [sp, #152]
	cbnz	w8, LBB3_96
	b	LBB3_97
LBB3_92:
	.loc	1 101 3
	ldr	w8, [sp, #148]
	subs	w8, w8, #0
	cset	w8, ne
	str	w8, [sp, #48]
	b	LBB3_93
LBB3_93:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #48]
	.loc	1 101 3
	and	w8, w8, #0x1
	str	w8, [sp, #40]
	b	LBB3_91
LBB3_94:
	ldr	w8, [sp, #148]
	subs	w8, w8, #0
	cset	w8, ne
	str	w8, [sp, #44]
	b	LBB3_95
LBB3_95:
	.loc	1 0 3
	ldr	w8, [sp, #44]
	.loc	1 101 3
	and	w8, w8, #0x1
	str	w8, [sp, #40]
	b	LBB3_91
LBB3_96:
	.loc	1 102 25 is_stmt 1
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_98
LBB3_97:
	b	LBB3_98
LBB3_98:
	.loc	1 103 3
	ldr	w8, [sp, #140]
	cbz	w8, LBB3_100
	b	LBB3_99
LBB3_99:
	ldr	w8, [sp, #140]
	cbnz	w8, LBB3_102
	b	LBB3_103
LBB3_100:
	.loc	1 0 3 is_stmt 0
	mov	w8, #3
	str	w8, [sp, #36]
	.loc	1 103 3
	b	LBB3_101
LBB3_101:
	.loc	1 0 3
	ldr	w8, [sp, #36]
	.loc	1 103 3
	str	w8, [sp, #156]
	.loc	1 104 3 is_stmt 1
	ldr	w8, [sp, #156]
	subs	w8, w8, #1
	b.ne	LBB3_105
	b	LBB3_106
LBB3_102:
	.loc	1 0 3 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #32]
	.loc	1 103 3 is_stmt 1
	b	LBB3_104
LBB3_103:
	.loc	1 0 3 is_stmt 0
	mov	w8, #2
	str	w8, [sp, #32]
	.loc	1 103 3
	b	LBB3_104
LBB3_104:
	.loc	1 0 3
	ldr	w8, [sp, #32]
	str	w8, [sp, #36]
	.loc	1 103 3
	b	LBB3_101
LBB3_105:
	.loc	1 104 27 is_stmt 1
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_107
LBB3_106:
	b	LBB3_107
LBB3_107:
	.loc	1 0 27 is_stmt 0
	mov	w8, wzr
	.loc	1 109 3 is_stmt 1
	tbz	w8, #0, LBB3_109
	b	LBB3_108
LBB3_108:
	.loc	1 0 3 is_stmt 0
	fmov	d0, #1.00000000
	str	d0, [sp, #24]
	.loc	1 109 3
	b	LBB3_110
LBB3_109:
	.loc	1 0 3
	fmov	d0, #2.50000000
	str	d0, [sp, #24]
	.loc	1 109 3
	b	LBB3_110
LBB3_110:
	.loc	1 0 3
	ldr	d0, [sp, #24]
	.loc	1 109 3
	str	d0, [sp, #160]
	.loc	1 110 3 is_stmt 1
	ldr	d0, [sp, #160]
	fmov	d1, #2.50000000
	fcmp	d0, d1
	b.eq	LBB3_112
	b.vs	LBB3_112
	b	LBB3_111
LBB3_111:
	.loc	1 110 17 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_113
LBB3_112:
	b	LBB3_113
LBB3_113:
	.loc	1 0 17
	mov	w8, #1
	.loc	1 111 3 is_stmt 1
	tbz	w8, #0, LBB3_115
	b	LBB3_114
LBB3_114:
	.loc	1 0 3 is_stmt 0
	fmov	d0, #2.50000000
	str	d0, [sp, #16]
	.loc	1 111 3
	b	LBB3_116
LBB3_115:
	.loc	1 0 3
	fmov	d0, #1.00000000
	str	d0, [sp, #16]
	.loc	1 111 3
	b	LBB3_116
LBB3_116:
	.loc	1 0 3
	ldr	d0, [sp, #16]
	.loc	1 111 3
	str	d0, [sp, #160]
	.loc	1 112 3 is_stmt 1
	ldr	d0, [sp, #160]
	fmov	d1, #2.50000000
	fcmp	d0, d1
	b.eq	LBB3_118
	b.vs	LBB3_118
	b	LBB3_117
LBB3_117:
	.loc	1 112 17 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_119
LBB3_118:
	b	LBB3_119
LBB3_119:
	.loc	1 116 3 is_stmt 1
	adrp	x8, _calls@PAGE
	str	wzr, [x8, _calls@PAGEOFF]
	.loc	1 117 3
	str	wzr, [sp, #172]
	.loc	1 118 3
	b	LBB3_120
LBB3_120:
	.loc	1 118 3
	ldr	w9, [sp, #172]
	mov	w8, #0
	subs	w9, w9, #3
	str	w8, [sp, #12]
	b.ge	LBB3_122
	b	LBB3_121
LBB3_121:
	bl	_bump
	subs	w8, w0, #1
	cset	w8, eq
	str	w8, [sp, #12]
	b	LBB3_122
LBB3_122:
	.loc	1 0 3 is_stmt 0
	ldr	w8, [sp, #12]
	.loc	1 118 3
	tbz	w8, #0, LBB3_124
	b	LBB3_123
LBB3_123:
Ltmp5:
	.loc	1 119 5 is_stmt 1
	ldr	w8, [sp, #172]
	add	w8, w8, #1
	str	w8, [sp, #172]
	b	LBB3_120
Ltmp6:
LBB3_124:
	.loc	1 121 3
	ldr	w8, [sp, #172]
	subs	w8, w8, #3
	b.eq	LBB3_126
	b	LBB3_125
LBB3_125:
	.loc	1 121 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_127
LBB3_126:
	b	LBB3_127
LBB3_127:
	.loc	1 122 3 is_stmt 1
	adrp	x8, _calls@PAGE
	ldr	w8, [x8, _calls@PAGEOFF]
	subs	w8, w8, #3
	b.eq	LBB3_129
	b	LBB3_128
LBB3_128:
	.loc	1 122 19 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_130
LBB3_129:
	b	LBB3_130
LBB3_130:
	.loc	1 125 3 is_stmt 1
	adrp	x8, _gTernary@PAGE
	ldr	w8, [x8, _gTernary@PAGEOFF]
	subs	w8, w8, #2
	b.eq	LBB3_132
	b	LBB3_131
LBB3_131:
	.loc	1 125 22 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_133
LBB3_132:
	b	LBB3_133
LBB3_133:
	.loc	1 126 3 is_stmt 1
	adrp	x8, _gAnd@PAGE
	ldr	w8, [x8, _gAnd@PAGEOFF]
	cbz	w8, LBB3_135
	b	LBB3_134
LBB3_134:
	.loc	1 126 18 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_136
LBB3_135:
	b	LBB3_136
LBB3_136:
	.loc	1 127 3 is_stmt 1
	adrp	x8, _gOr@PAGE
	ldr	w8, [x8, _gOr@PAGEOFF]
	subs	w8, w8, #1
	b.eq	LBB3_138
	b	LBB3_137
LBB3_137:
	.loc	1 127 17 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_139
LBB3_138:
	b	LBB3_139
LBB3_139:
	.loc	1 128 3 is_stmt 1
	adrp	x8, _main.sTernary@PAGE
	ldr	w8, [x8, _main.sTernary@PAGEOFF]
	subs	w8, w8, #5
	b.eq	LBB3_141
	b	LBB3_140
LBB3_140:
	.loc	1 128 22 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #108]
	b	LBB3_142
LBB3_141:
	b	LBB3_142
LBB3_142:
	.loc	1 130 3 is_stmt 1
	ldr	w8, [sp, #108]
	cbnz	w8, LBB3_144
	b	LBB3_143
LBB3_143:
Ltmp7:
	.loc	1 131 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB3_145
Ltmp8:
LBB3_144:
	.loc	1 133 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB3_145
Ltmp9:
LBB3_145:
	.loc	1 135 3
	ldr	w0, [sp, #108]
	.loc	1 135 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #176]
	add	sp, sp, #192
	ret
Ltmp10:
Lfunc_end3:
	.cfi_endproc

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
	.p2align	2, 0x0
_main.sTernary:
	.long	5

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"45.short_circuit.c PASS\n"

l___unnamed_2:
	.asciz	"45.short_circuit.c FAIL\n"

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
	.byte	0
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
	.byte	6
	.byte	1
	.byte	1
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	7
	.byte	33
	.byte	0
	.byte	73
	.byte	19
	.byte	55
	.byte	11
	.byte	0
	.byte	0
	.byte	8
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
	.byte	9
	.byte	15
	.byte	0
	.byte	73
	.byte	19
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
	.long	23
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end3-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	32
	.long	32
	.byte	1
	.byte	24
	.long	324

	.byte	2
	.quad	Lfunc_begin1
.set Lset5, Lfunc_end1-Lfunc_begin1
	.long	Lset5

	.byte	1
	.byte	111
	.long	37
	.long	37
	.byte	1
	.byte	32
	.long	324

	.byte	2
	.quad	Lfunc_begin2
.set Lset6, Lfunc_end2-Lfunc_begin2
	.long	Lset6

	.byte	1
	.byte	111
	.long	45
	.long	45
	.byte	1
	.byte	37
	.long	324

	.byte	3
	.quad	Lfunc_begin3
.set Lset7, Lfunc_end3-Lfunc_begin3
	.long	Lset7

	.byte	1
	.byte	111
	.long	54
	.long	54
	.byte	1
	.byte	42
	.long	324

	.byte	4
	.byte	3
	.byte	145
	.ascii	"\254\001"
	.long	63
	.byte	1
	.byte	117
	.long	324
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\240\001"
	.long	65
	.byte	1
	.byte	109
	.long	331
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\234\001"
	.long	74
	.byte	1
	.byte	103
	.long	324
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\230\001"
	.long	88
	.byte	1
	.byte	101
	.long	324
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\224\001"
	.long	100
	.byte	1
	.byte	93
	.long	324
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\220\001"
	.long	102
	.byte	1
	.byte	92
	.long	324
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\214\001"
	.long	104
	.byte	1
	.byte	91
	.long	324
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\210\001"
	.long	106
	.byte	1
	.byte	72
	.long	324
	.byte	4
	.byte	3
	.byte	145
	.asciz	"\374"
	.long	108
	.byte	1
	.byte	71
	.long	338
	.byte	4
	.byte	3
	.byte	145
	.asciz	"\360"
	.long	132
	.byte	1
	.byte	67
	.long	357
	.byte	4
	.byte	3
	.byte	145
	.asciz	"\354"
	.long	134
	.byte	1
	.byte	43
	.long	324
	.byte	0
	.byte	5
	.long	59
	.byte	5
	.byte	4
	.byte	5
	.long	67
	.byte	4
	.byte	8
	.byte	6
	.long	324
	.byte	7
	.long	350
	.byte	3
	.byte	0
	.byte	8
	.long	112
	.byte	8
	.byte	7
	.byte	9
	.long	324
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"45.short_circuit.c"
	.asciz	"../tests"
	.asciz	"bump"
	.asciz	"trueArm"
	.asciz	"falseArm"
	.asciz	"main"
	.asciz	"int"
	.asciz	"k"
	.asciz	"d"
	.asciz	"double"
	.asciz	"nestedTernary"
	.asciz	"nestedLogic"
	.asciz	"c"
	.asciz	"b"
	.asciz	"a"
	.asciz	"i"
	.asciz	"arr"
	.asciz	"__ARRAY_SIZE_TYPE__"
	.asciz	"p"
	.asciz	"err"
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	4
	.long	4
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	0
	.long	1
	.long	3
	.long	-1
	.long	-855257968
	.long	2090126553
	.long	-141757083
	.long	2090499946
.set Lset8, LNames2-Lnames_begin
	.long	Lset8
.set Lset9, LNames0-Lnames_begin
	.long	Lset9
.set Lset10, LNames1-Lnames_begin
	.long	Lset10
.set Lset11, LNames3-Lnames_begin
	.long	Lset11
LNames2:
	.long	45
	.long	1
	.long	100
	.long	0
LNames0:
	.long	32
	.long	1
	.long	42
	.long	0
LNames1:
	.long	37
	.long	1
	.long	71
	.long	0
LNames3:
	.long	54
	.long	1
	.long	129
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
	.long	3
	.long	3
	.long	20
	.long	0
	.long	3
	.short	1
	.short	6
	.short	3
	.short	5
	.short	4
	.short	11
	.long	-1
	.long	0
	.long	1
	.long	-113419488
	.long	193495088
	.long	-594775205
.set Lset12, Ltypes1-Ltypes_begin
	.long	Lset12
.set Lset13, Ltypes0-Ltypes_begin
	.long	Lset13
.set Lset14, Ltypes2-Ltypes_begin
	.long	Lset14
Ltypes1:
	.long	67
	.long	1
	.long	331
	.short	36
	.byte	0
	.long	0
Ltypes0:
	.long	59
	.long	1
	.long	324
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	112
	.long	1
	.long	350
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
