	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #100
	mov	r0, #0
	mov	r1, #30
	mov	ip, #31744
	push	{r4, lr}
	ldr	r3, .L4
	ldr	lr, .L4+4
	ldr	r4, .L4+8
	str	r0, [lr]
	str	r0, [r3, #16]
	strh	ip, [r3, #32]	@ movhi
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r1, [r3, #28]
	str	r1, [r3, #24]
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	score
	.word	initObsts
	.size	initGame, .-initGame
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #100
	mov	r1, #30
	mov	ip, #0
	mov	r0, #31744
	ldr	r3, .L7
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	ip, [r3, #16]
	strh	r0, [r3, #32]	@ movhi
	str	r1, [r3, #28]
	str	r1, [r3, #24]
	bx	lr
.L8:
	.align	2
.L7:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initObst
	.syntax unified
	.arm
	.fpu softvfp
	.type	initObst, %function
initObst:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	initObst, .-initObst
	.comm	spawned,4,4
	.comm	score,4,4
	.comm	obstacle,32,4
	.comm	player,36,4
	.comm	NOTES,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
