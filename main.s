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
	.file	"main.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"PIGEON RUN\000"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r0, .L9
	sub	sp, sp, #16
	ldr	r3, .L9+4
	mov	lr, pc
	bx	r3
	ldr	r2, .L9+8
	ldm	r2, {r0, r1, r2}
	add	ip, sp, #4
	stmia	ip!, {r0, r1}
	mov	r5, #72
	mov	r3, #80
	mov	r4, #0
	ldr	r7, .L9+12
	strh	r2, [ip]	@ movhi
	ldr	r8, .L9+16
	add	r6, sp, #4
	b	.L5
.L8:
	ldrb	r3, [r6, #1]!	@ zero_extendqisi2
.L5:
	tst	r4, #1
	mov	r2, r3
	mov	r0, r5
	moveq	r3, r8
	movne	r3, #16896
	mov	r1, #70
	add	r4, r4, #1
	mov	lr, pc
	bx	r7
	cmp	r4, #8
	add	r5, r5, #12
	bne	.L8
	mov	r3, #0
	ldr	r1, .L9+20
	ldr	r2, .L9+24
	str	r3, [r1]
	str	r3, [r2]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	19327
	.word	fillScreen
	.word	.LC1
	.word	drawChar
	.word	21152
	.word	state
	.word	rSeed
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #2
	mvn	ip, #170
	mov	r2, #0
	str	lr, [sp, #-4]!
	ldr	lr, .L13
	strh	lr, [r3]	@ movhi
	strh	r0, [r3, #132]	@ movhi
	strh	ip, [r3, #128]	@ movhi
	ldr	r0, .L13+4
	strh	r1, [r3, #130]	@ movhi
	ldr	r1, .L13+8
	ldrh	r0, [r0, #48]
	ldr	r3, .L13+12
	ldr	lr, [sp], #4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L14:
	.align	2
.L13:
	.word	1027
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	ip, #128
	mvn	r0, #170
	mov	r1, #2
	mov	r2, #0
	push	{r4, r7, fp, lr}
	ldr	lr, .L26
	ldr	r4, .L26+4
	strh	lr, [r3]	@ movhi
	strh	ip, [r3, #132]	@ movhi
	strh	r0, [r3, #128]	@ movhi
	strh	r1, [r3, #130]	@ movhi
	ldr	fp, .L26+8
	ldrh	r1, [r4, #48]
	ldr	r5, .L26+12
	ldr	r3, .L26+16
	strh	r1, [fp]	@ movhi
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L26+20
	ldr	r10, .L26+24
	ldr	r9, .L26+28
	ldr	r8, .L26+32
	ldr	r7, .L26+36
.L16:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L17:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L17
.L19:
	.word	.L22
	.word	.L21
	.word	.L20
	.word	.L17
	.word	.L18
.L18:
	mov	lr, pc
	bx	r7
	b	.L16
.L20:
	mov	lr, pc
	bx	r8
	b	.L16
.L21:
	mov	lr, pc
	bx	r9
	b	.L16
.L22:
	mov	lr, pc
	bx	r10
	b	.L16
.L27:
	.align	2
.L26:
	.word	1027
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	goToStart
	.word	state
	.word	start
	.word	game
	.word	pause
	.word	lose
	.size	main, .-main
	.comm	buffer,41,4
	.comm	rSeed,4,4
	.comm	state,4,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	NOTES,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
