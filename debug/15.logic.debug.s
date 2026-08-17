	.build_version macos, 16, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:
Lfunc_begin0:
	.file	1 "../tests" "15.logic.c"
	.loc	1 6 0
	.cfi_startproc
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]
	.cfi_def_cfa_offset 64
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, wzr
Ltmp0:
	.loc	1 7 3 prologue_end
	str	wzr, [sp, #8]
	mov	w9, #1
	.loc	1 8 3
	and	w10, w9, #0x1
	and	w10, w10, #0x1
	strb	w10, [sp, #14]
	.loc	1 9 3
	and	w8, w8, #0x1
	and	w8, w8, w9
	strb	w8, [sp, #15]
	.loc	1 12 3
	ldrb	w8, [sp, #14]
	tbnz	w8, #0, LBB0_2
	b	LBB0_1
LBB0_1:
	.loc	1 12 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_3
LBB0_2:
	b	LBB0_3
LBB0_3:
	.loc	1 13 3 is_stmt 1
	ldrb	w8, [sp, #15]
	tbz	w8, #0, LBB0_5
	b	LBB0_4
LBB0_4:
	.loc	1 13 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_6
LBB0_5:
	b	LBB0_6
LBB0_6:
	.loc	1 15 3 is_stmt 1
	ldrb	w10, [sp, #14]
	ldrb	w8, [sp, #15]
	.loc	1 0 0 is_stmt 0
	mov	w9, wzr
	.loc	1 15 3
	and	w10, w10, #0x1
	ands	w10, w10, #0x1
	csel	w8, w8, w9, ne
	and	w8, w8, #0x1
	str	w8, [sp, #16]
	.loc	1 16 3 is_stmt 1
	ldr	w8, [sp, #16]
	cbz	w8, LBB0_8
	b	LBB0_7
LBB0_7:
	.loc	1 16 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_9
LBB0_8:
	b	LBB0_9
LBB0_9:
	.loc	1 17 3 is_stmt 1
	ldrb	w10, [sp, #14]
	ldrb	w8, [sp, #14]
	.loc	1 0 0 is_stmt 0
	mov	w9, wzr
	.loc	1 17 3
	and	w10, w10, #0x1
	ands	w10, w10, #0x1
	csel	w8, w8, w9, ne
	and	w8, w8, #0x1
	str	w8, [sp, #16]
	.loc	1 18 3 is_stmt 1
	ldr	w8, [sp, #16]
	cbnz	w8, LBB0_11
	b	LBB0_10
LBB0_10:
	.loc	1 18 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_12
LBB0_11:
	b	LBB0_12
LBB0_12:
	.loc	1 19 3 is_stmt 1
	ldrb	w10, [sp, #15]
	ldrb	w8, [sp, #15]
	.loc	1 0 0 is_stmt 0
	mov	w9, wzr
	.loc	1 19 3
	and	w10, w10, #0x1
	ands	w10, w10, #0x1
	csel	w8, w8, w9, ne
	and	w8, w8, #0x1
	str	w8, [sp, #16]
	.loc	1 20 3 is_stmt 1
	ldr	w8, [sp, #16]
	cbz	w8, LBB0_14
	b	LBB0_13
LBB0_13:
	.loc	1 20 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_15
LBB0_14:
	b	LBB0_15
LBB0_15:
	.loc	1 22 3 is_stmt 1
	ldrb	w9, [sp, #14]
	ldrb	w8, [sp, #15]
	and	w9, w9, #0x1
	ands	w9, w9, #0x1
	csinc	w8, w8, wzr, eq
	and	w8, w8, #0x1
	str	w8, [sp, #16]
	.loc	1 23 3
	ldr	w8, [sp, #16]
	cbnz	w8, LBB0_17
	b	LBB0_16
LBB0_16:
	.loc	1 23 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_18
LBB0_17:
	b	LBB0_18
LBB0_18:
	.loc	1 24 3 is_stmt 1
	ldrb	w9, [sp, #14]
	ldrb	w8, [sp, #14]
	and	w9, w9, #0x1
	ands	w9, w9, #0x1
	csinc	w8, w8, wzr, eq
	and	w8, w8, #0x1
	str	w8, [sp, #16]
	.loc	1 25 3
	ldr	w8, [sp, #16]
	cbnz	w8, LBB0_20
	b	LBB0_19
LBB0_19:
	.loc	1 25 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_21
LBB0_20:
	b	LBB0_21
LBB0_21:
	.loc	1 26 3 is_stmt 1
	ldrb	w9, [sp, #15]
	ldrb	w8, [sp, #15]
	and	w9, w9, #0x1
	ands	w9, w9, #0x1
	csinc	w8, w8, wzr, eq
	and	w8, w8, #0x1
	str	w8, [sp, #16]
	.loc	1 27 3
	ldr	w8, [sp, #16]
	cbz	w8, LBB0_23
	b	LBB0_22
LBB0_22:
	.loc	1 27 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_24
LBB0_23:
	b	LBB0_24
LBB0_24:
	.loc	1 29 3 is_stmt 1
	ldrb	w8, [sp, #14]
	and	w8, w8, #0x1
	.loc	1 0 0 is_stmt 0
	mov	w9, wzr
	.loc	1 29 3
	and	w9, w9, #0x1
	subs	w8, w8, w9
	cset	w8, eq
	str	w8, [sp, #16]
	.loc	1 30 3 is_stmt 1
	ldr	w8, [sp, #16]
	cbz	w8, LBB0_26
	b	LBB0_25
LBB0_25:
	.loc	1 30 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_27
LBB0_26:
	b	LBB0_27
LBB0_27:
	.loc	1 31 3 is_stmt 1
	ldrb	w8, [sp, #15]
	and	w8, w8, #0x1
	.loc	1 0 0 is_stmt 0
	mov	w9, wzr
	.loc	1 31 3
	and	w9, w9, #0x1
	subs	w8, w8, w9
	cset	w8, eq
	str	w8, [sp, #16]
	.loc	1 32 3 is_stmt 1
	ldr	w8, [sp, #16]
	cbnz	w8, LBB0_29
	b	LBB0_28
LBB0_28:
	.loc	1 32 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_30
LBB0_29:
	b	LBB0_30
LBB0_30:
	.loc	1 0 15
	mov	w8, #100
	.loc	1 34 3 is_stmt 1
	str	w8, [sp, #20]
	.loc	1 35 3
	str	w8, [sp, #24]
	.loc	1 36 3
	mov	w8, #128
	str	w8, [sp, #28]
	.loc	1 38 3
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #24]
	subs	w8, w8, w9
	cset	w8, eq
	str	w8, [sp, #16]
	.loc	1 39 3
	ldr	w8, [sp, #16]
	cbnz	w8, LBB0_32
	b	LBB0_31
LBB0_31:
	.loc	1 39 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_33
LBB0_32:
	b	LBB0_33
LBB0_33:
	.loc	1 40 3 is_stmt 1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #28]
	subs	w8, w8, w9
	cset	w8, eq
	str	w8, [sp, #16]
	.loc	1 41 3
	ldr	w8, [sp, #16]
	cbz	w8, LBB0_35
	b	LBB0_34
LBB0_34:
	.loc	1 41 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_36
LBB0_35:
	b	LBB0_36
LBB0_36:
	.loc	1 42 3 is_stmt 1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #24]
	subs	w8, w8, w9
	cset	w8, ne
	str	w8, [sp, #16]
	.loc	1 43 3
	ldr	w8, [sp, #16]
	cbz	w8, LBB0_38
	b	LBB0_37
LBB0_37:
	.loc	1 43 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_39
LBB0_38:
	b	LBB0_39
LBB0_39:
	.loc	1 44 3 is_stmt 1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #28]
	subs	w8, w8, w9
	cset	w8, ne
	str	w8, [sp, #16]
	.loc	1 45 3
	ldr	w8, [sp, #16]
	cbnz	w8, LBB0_41
	b	LBB0_40
LBB0_40:
	.loc	1 45 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_42
LBB0_41:
	b	LBB0_42
LBB0_42:
	.loc	1 46 3 is_stmt 1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #24]
	subs	w8, w8, w9
	cset	w8, lt
	str	w8, [sp, #16]
	.loc	1 47 3
	ldr	w8, [sp, #16]
	cbz	w8, LBB0_44
	b	LBB0_43
LBB0_43:
	.loc	1 47 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_45
LBB0_44:
	b	LBB0_45
LBB0_45:
	.loc	1 48 3 is_stmt 1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #28]
	subs	w8, w8, w9
	cset	w8, lt
	str	w8, [sp, #16]
	.loc	1 49 3
	ldr	w8, [sp, #16]
	cbnz	w8, LBB0_47
	b	LBB0_46
LBB0_46:
	.loc	1 49 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_48
LBB0_47:
	b	LBB0_48
LBB0_48:
	.loc	1 50 3 is_stmt 1
	ldr	w8, [sp, #28]
	ldr	w9, [sp, #20]
	subs	w8, w8, w9
	cset	w8, lt
	str	w8, [sp, #16]
	.loc	1 51 3
	ldr	w8, [sp, #16]
	cbz	w8, LBB0_50
	b	LBB0_49
LBB0_49:
	.loc	1 51 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_51
LBB0_50:
	b	LBB0_51
LBB0_51:
	.loc	1 52 3 is_stmt 1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #24]
	subs	w8, w8, w9
	cset	w8, le
	str	w8, [sp, #16]
	.loc	1 53 3
	ldr	w8, [sp, #16]
	cbnz	w8, LBB0_53
	b	LBB0_52
LBB0_52:
	.loc	1 53 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_54
LBB0_53:
	b	LBB0_54
LBB0_54:
	.loc	1 54 3 is_stmt 1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #28]
	subs	w8, w8, w9
	cset	w8, le
	str	w8, [sp, #16]
	.loc	1 55 3
	ldr	w8, [sp, #16]
	cbnz	w8, LBB0_56
	b	LBB0_55
LBB0_55:
	.loc	1 55 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_57
LBB0_56:
	b	LBB0_57
LBB0_57:
	.loc	1 56 3 is_stmt 1
	ldr	w8, [sp, #28]
	ldr	w9, [sp, #20]
	subs	w8, w8, w9
	cset	w8, le
	str	w8, [sp, #16]
	.loc	1 57 3
	ldr	w8, [sp, #16]
	cbz	w8, LBB0_59
	b	LBB0_58
LBB0_58:
	.loc	1 57 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_60
LBB0_59:
	b	LBB0_60
LBB0_60:
	.loc	1 58 3 is_stmt 1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #24]
	subs	w8, w8, w9
	cset	w8, gt
	str	w8, [sp, #16]
	.loc	1 59 3
	ldr	w8, [sp, #16]
	cbz	w8, LBB0_62
	b	LBB0_61
LBB0_61:
	.loc	1 59 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_63
LBB0_62:
	b	LBB0_63
LBB0_63:
	.loc	1 60 3 is_stmt 1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #28]
	subs	w8, w8, w9
	cset	w8, gt
	str	w8, [sp, #16]
	.loc	1 61 3
	ldr	w8, [sp, #16]
	cbz	w8, LBB0_65
	b	LBB0_64
LBB0_64:
	.loc	1 61 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_66
LBB0_65:
	b	LBB0_66
LBB0_66:
	.loc	1 62 3 is_stmt 1
	ldr	w8, [sp, #28]
	ldr	w9, [sp, #20]
	subs	w8, w8, w9
	cset	w8, gt
	str	w8, [sp, #16]
	.loc	1 63 3
	ldr	w8, [sp, #16]
	cbnz	w8, LBB0_68
	b	LBB0_67
LBB0_67:
	.loc	1 63 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_69
LBB0_68:
	b	LBB0_69
LBB0_69:
	.loc	1 64 3 is_stmt 1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #24]
	subs	w8, w8, w9
	cset	w8, ge
	str	w8, [sp, #16]
	.loc	1 65 3
	ldr	w8, [sp, #16]
	cbnz	w8, LBB0_71
	b	LBB0_70
LBB0_70:
	.loc	1 65 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_72
LBB0_71:
	b	LBB0_72
LBB0_72:
	.loc	1 66 3 is_stmt 1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #28]
	subs	w8, w8, w9
	cset	w8, ge
	str	w8, [sp, #16]
	.loc	1 67 3
	ldr	w8, [sp, #16]
	cbz	w8, LBB0_74
	b	LBB0_73
LBB0_73:
	.loc	1 67 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_75
LBB0_74:
	b	LBB0_75
LBB0_75:
	.loc	1 68 3 is_stmt 1
	ldr	w8, [sp, #28]
	ldr	w9, [sp, #20]
	subs	w8, w8, w9
	cset	w8, ge
	str	w8, [sp, #16]
	.loc	1 69 3
	ldr	w8, [sp, #16]
	cbnz	w8, LBB0_77
	b	LBB0_76
LBB0_76:
	.loc	1 69 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_78
LBB0_77:
	b	LBB0_78
LBB0_78:
	.loc	1 71 3 is_stmt 1
	mov	w8, #1
	str	w8, [sp, #32]
	.loc	1 72 3
	mov	w8, #-1
	str	w8, [sp, #36]
	.loc	1 73 3
	ldr	w8, [sp, #32]
	ldr	w9, [sp, #36]
	subs	w8, w8, w9
	cset	w8, lo
	str	w8, [sp, #16]
	.loc	1 74 3
	ldr	w8, [sp, #16]
	cbnz	w8, LBB0_80
	b	LBB0_79
LBB0_79:
	.loc	1 74 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_81
LBB0_80:
	b	LBB0_81
LBB0_81:
	.loc	1 75 3 is_stmt 1
	ldr	w8, [sp, #36]
	ldr	w9, [sp, #32]
	subs	w8, w8, w9
	cset	w8, hi
	str	w8, [sp, #16]
	.loc	1 76 3
	ldr	w8, [sp, #16]
	cbnz	w8, LBB0_83
	b	LBB0_82
LBB0_82:
	.loc	1 76 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_84
LBB0_83:
	b	LBB0_84
LBB0_84:
	.loc	1 78 3 is_stmt 1
	mov	w8, #-1
	str	w8, [sp, #40]
	.loc	1 79 3
	mov	w8, #1
	str	w8, [sp, #44]
	.loc	1 80 3
	ldr	w8, [sp, #40]
	ldr	w9, [sp, #44]
	subs	w8, w8, w9
	cset	w8, lo
	str	w8, [sp, #16]
	.loc	1 81 3
	ldr	w8, [sp, #16]
	cbz	w8, LBB0_86
	b	LBB0_85
LBB0_85:
	.loc	1 81 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_87
LBB0_86:
	b	LBB0_87
LBB0_87:
	.loc	1 82 3 is_stmt 1
	ldr	w8, [sp, #40]
	ldr	w9, [sp, #44]
	subs	w8, w8, w9
	cset	w8, hi
	str	w8, [sp, #16]
	.loc	1 83 3
	ldr	w8, [sp, #16]
	cbnz	w8, LBB0_89
	b	LBB0_88
LBB0_88:
	.loc	1 83 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_90
LBB0_89:
	b	LBB0_90
LBB0_90:
	.loc	1 88 3 is_stmt 1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #28]
	subs	w8, w8, w9
	cset	w8, lt
	str	w8, [sp, #16]
	.loc	1 89 3
	ldr	w8, [sp, #16]
	subs	w8, w8, #1
	b.eq	LBB0_92
	b	LBB0_91
LBB0_91:
	.loc	1 89 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_93
LBB0_92:
	b	LBB0_93
LBB0_93:
	.loc	1 90 3 is_stmt 1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #24]
	subs	w8, w8, w9
	cset	w8, eq
	str	w8, [sp, #16]
	.loc	1 91 3
	ldr	w8, [sp, #16]
	subs	w8, w8, #1
	b.eq	LBB0_95
	b	LBB0_94
LBB0_94:
	.loc	1 91 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_96
LBB0_95:
	b	LBB0_96
LBB0_96:
	.loc	1 92 3 is_stmt 1
	ldrb	w10, [sp, #14]
	ldrb	w8, [sp, #14]
	mov	w9, wzr
	and	w10, w10, #0x1
	ands	w10, w10, #0x1
	csel	w8, w8, w9, ne
	and	w8, w8, #0x1
	str	w8, [sp, #16]
	.loc	1 93 3
	ldr	w8, [sp, #16]
	subs	w8, w8, #1
	b.eq	LBB0_98
	b	LBB0_97
LBB0_97:
	.loc	1 93 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_99
LBB0_98:
	b	LBB0_99
LBB0_99:
	.loc	1 94 3 is_stmt 1
	ldrb	w9, [sp, #14]
	ldrb	w8, [sp, #15]
	and	w9, w9, #0x1
	ands	w9, w9, #0x1
	csinc	w8, w8, wzr, eq
	and	w8, w8, #0x1
	str	w8, [sp, #16]
	.loc	1 95 3
	ldr	w8, [sp, #16]
	subs	w8, w8, #1
	b.eq	LBB0_101
	b	LBB0_100
LBB0_100:
	.loc	1 95 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_102
LBB0_101:
	b	LBB0_102
LBB0_102:
	.loc	1 96 3 is_stmt 1
	ldrb	w8, [sp, #15]
	and	w8, w8, #0x1
	mov	w9, wzr
	and	w9, w9, #0x1
	subs	w8, w8, w9
	cset	w8, eq
	str	w8, [sp, #16]
	.loc	1 97 3
	ldr	w8, [sp, #16]
	subs	w8, w8, #1
	b.eq	LBB0_104
	b	LBB0_103
LBB0_103:
	.loc	1 97 15 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_105
LBB0_104:
	b	LBB0_105
LBB0_105:
	.loc	1 101 3 is_stmt 1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #28]
	subs	w8, w8, w9
	cset	w8, lt
	mov	w9, #3
	mul	w8, w8, w9
	subs	w8, w8, #3
	b.eq	LBB0_107
	b	LBB0_106
LBB0_106:
	.loc	1 101 25 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_108
LBB0_107:
	b	LBB0_108
LBB0_108:
	.loc	1 102 3 is_stmt 1
	ldr	w9, [sp, #20]
	ldr	w10, [sp, #28]
	mov	w8, #10
	subs	w9, w9, w10
	cinc	w8, w8, lt
	subs	w8, w8, #11
	b.eq	LBB0_110
	b	LBB0_109
LBB0_109:
	.loc	1 102 27 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_111
LBB0_110:
	b	LBB0_111
LBB0_111:
	.loc	1 103 3 is_stmt 1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #28]
	subs	w8, w8, w9
	cset	w8, lt
	subs	w8, w8, #1
	b.eq	LBB0_113
	b	LBB0_112
LBB0_112:
	.loc	1 103 23 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_114
LBB0_113:
	b	LBB0_114
LBB0_114:
	.loc	1 104 3 is_stmt 1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #28]
	subs	w8, w8, w9
	cset	w8, lt
	subs	w8, w8, #5
	cset	w8, lt
	subs	w8, w8, #1
	b.eq	LBB0_116
	b	LBB0_115
LBB0_115:
	.loc	1 104 27 is_stmt 0
	mov	w8, #1
	str	w8, [sp, #8]
	b	LBB0_117
LBB0_116:
	b	LBB0_117
LBB0_117:
	.loc	1 106 3 is_stmt 1
	ldr	w8, [sp, #8]
	cbnz	w8, LBB0_119
	b	LBB0_118
LBB0_118:
Ltmp1:
	.loc	1 107 5
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	bl	_printf
	b	LBB0_120
Ltmp2:
LBB0_119:
	.loc	1 109 5
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	bl	_printf
	b	LBB0_120
Ltmp3:
LBB0_120:
	.loc	1 111 3
	ldr	w0, [sp, #8]
	.loc	1 111 3 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp, #48]
	add	sp, sp, #64
	ret
Ltmp4:
Lfunc_end0:
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
l___unnamed_1:
	.asciz	"15.logic.c PASS\n"

l___unnamed_2:
	.asciz	"15.logic.c FAIL\n"

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
	.byte	4
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
	.long	15
	.quad	Lfunc_begin0
.set Lset3, Lfunc_end0-Lfunc_begin0
	.long	Lset3
	.byte	2
	.quad	Lfunc_begin0
.set Lset4, Lfunc_end0-Lfunc_begin0
	.long	Lset4

	.byte	1
	.byte	111
	.long	24
	.long	24
	.byte	1
	.byte	6
	.long	226

	.byte	3
	.byte	2
	.byte	145
	.byte	44
	.long	33
	.byte	1
	.byte	79
	.long	233
	.byte	3
	.byte	2
	.byte	145
	.byte	40
	.long	49
	.byte	1
	.byte	78
	.long	226
	.byte	3
	.byte	2
	.byte	145
	.byte	36
	.long	52
	.byte	1
	.byte	72
	.long	233
	.byte	3
	.byte	2
	.byte	145
	.byte	32
	.long	55
	.byte	1
	.byte	71
	.long	233
	.byte	3
	.byte	2
	.byte	145
	.byte	28
	.long	58
	.byte	1
	.byte	36
	.long	226
	.byte	3
	.byte	2
	.byte	145
	.byte	24
	.long	60
	.byte	1
	.byte	35
	.long	226
	.byte	3
	.byte	2
	.byte	145
	.byte	20
	.long	62
	.byte	1
	.byte	34
	.long	226
	.byte	3
	.byte	2
	.byte	145
	.byte	16
	.long	64
	.byte	1
	.byte	10
	.long	226
	.byte	3
	.byte	2
	.byte	145
	.byte	15
	.long	66
	.byte	1
	.byte	9
	.long	240
	.byte	3
	.byte	2
	.byte	145
	.byte	14
	.long	73
	.byte	1
	.byte	8
	.long	240
	.byte	3
	.byte	2
	.byte	145
	.byte	8
	.long	75
	.byte	1
	.byte	7
	.long	226
	.byte	0
	.byte	4
	.long	29
	.byte	5
	.byte	4
	.byte	4
	.long	36
	.byte	7
	.byte	4
	.byte	4
	.long	68
	.byte	2
	.byte	1
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"lcc"
	.asciz	"15.logic.c"
	.asciz	"../tests"
	.asciz	"main"
	.asciz	"int"
	.asciz	"ui"
	.asciz	"unsigned int"
	.asciz	"si"
	.asciz	"ub"
	.asciz	"ua"
	.asciz	"c"
	.asciz	"b"
	.asciz	"a"
	.asciz	"v"
	.asciz	"f"
	.asciz	"bool"
	.asciz	"t"
	.asciz	"err"
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	1
	.long	1
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	0
	.long	2090499946
.set Lset5, LNames0-Lnames_begin
	.long	Lset5
LNames0:
	.long	24
	.long	1
	.long	42
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
	.long	-1
	.long	0
	.long	193495088
	.long	2090120081
	.long	-1304652851
.set Lset6, Ltypes0-Ltypes_begin
	.long	Lset6
.set Lset7, Ltypes2-Ltypes_begin
	.long	Lset7
.set Lset8, Ltypes1-Ltypes_begin
	.long	Lset8
Ltypes0:
	.long	29
	.long	1
	.long	226
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	68
	.long	1
	.long	240
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	36
	.long	1
	.long	233
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
