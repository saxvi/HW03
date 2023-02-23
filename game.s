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
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #100
	mov	lr, #31
	mov	r1, #0
	mov	ip, #41
	mov	r0, #31744
	ldr	r3, .L4
	str	lr, [r3, #28]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	ip, [r3, #24]
	strh	r0, [r3, #32]	@ movhi
	str	r1, [r3, #16]
	str	r1, [r3, #36]
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initLaser
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLaser, %function
initLaser:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #68
	mov	lr, #10
	mov	ip, #3
	mov	r0, #1
	mov	r1, #31
	ldr	r3, .L8
	str	lr, [r3, #4]
	str	r2, [r3]
	str	r2, [r3, #12]
	str	ip, [r3, #20]
	str	r0, [r3, #16]
	strh	r1, [r3, #24]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L9:
	.align	2
.L8:
	.word	laser
	.size	initLaser, .-initLaser
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r5, .L20
	mov	r10, #52
	mov	r9, r5
	ldr	r4, .L20+4
	ldr	r8, .L20+8
	ldr	r7, .L20+12
	ldr	r6, .L20+16
.L17:
	mov	r3, #41
	mov	r2, #1
	str	r3, [r9, #20]
	str	r3, [r9, #24]
	str	r10, [r9]
	str	r2, [r9, #32]
	mov	lr, pc
	bx	r4
	rsbs	r3, r0, #0
	and	r3, r3, #3
	and	r0, r0, #3
	rsbpl	r0, r3, #0
	cmp	r0, #3
	ldrls	pc, [pc, r0, asl #2]
	b	.L11
.L13:
	.word	.L16
	.word	.L15
	.word	.L14
	.word	.L12
.L12:
	strh	r8, [r9, #28]	@ movhi
.L11:
	add	r10, r10, #48
	cmp	r10, #292
	add	r9, r9, #36
	bne	.L17
	mov	r1, #30
	mov	r2, #0
	ldr	r3, [r5, #96]
	str	r1, [r5, #4]
	str	r2, [r5, #40]
	str	r3, [r5, #76]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L14:
	strh	r7, [r9, #28]	@ movhi
	b	.L11
.L16:
	ldr	r3, .L20+20
	strh	r3, [r9, #28]	@ movhi
	b	.L11
.L15:
	strh	r6, [r9, #28]	@ movhi
	b	.L11
.L21:
	.align	2
.L20:
	.word	obstacles
	.word	rand
	.word	28274
	.word	14937
	.word	13619
	.word	11718
	.size	initObst, .-initObst
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, r5, r6, r7, lr}
	mov	r2, #100
	mov	r7, #41
	mov	r6, #31744
	mov	ip, #31
	mov	r5, #10
	mov	r4, #3
	mov	lr, #1
	mov	r0, #68
	ldr	r3, .L24
	str	r1, [r3]
	ldr	r3, .L24+4
	str	r7, [r3, #24]
	str	r1, [r3, #16]
	strh	r6, [r3, #32]	@ movhi
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	str	r1, [r3, #36]
	str	r2, [r3, #8]
	str	ip, [r3, #28]
	ldr	r3, .L24+8
	str	r5, [r3, #4]
	str	r4, [r3, #20]
	str	lr, [r3, #16]
	pop	{r4, r5, r6, r7, lr}
	strh	ip, [r3, #24]	@ movhi
	str	r0, [r3]
	str	r0, [r3, #12]
	b	initObst
.L25:
	.align	2
.L24:
	.word	score
	.word	player
	.word	laser
	.size	initGame, .-initGame
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L42
	ldr	r1, [r3, #36]
	cmp	r1, #0
	ldr	r2, [r3]
	bne	.L27
	ldr	r1, .L42+4
	ldrh	r1, [r1]
	tst	r1, #32
	bne	.L28
	cmp	r2, #1
	mvngt	r0, #2
	strgt	r0, [r3, #16]
	addgt	r1, r2, r0
	bgt	.L29
.L28:
	tst	r1, #16
	bne	.L33
	ldr	r1, [r3, #24]
	add	r1, r2, r1
	cmp	r1, #238
	bgt	.L33
	mov	r0, #3
	str	r0, [r3, #16]
	add	r1, r2, r0
	b	.L29
.L31:
	ldr	r1, .L42+8
	ldrh	r1, [r1]
	tst	r1, #32
	beq	.L32
	ldr	r0, .L42+4
	ldrh	r0, [r0]
	tst	r0, #32
	beq	.L40
.L32:
	tst	r1, #16
	beq	.L33
	ldr	r1, .L42+4
	ldrh	r1, [r1]
	tst	r1, #16
	beq	.L41
.L33:
	mov	r0, #0
	mov	r1, r2
	str	r0, [r3, #16]
.L29:
	str	r2, [r3, #8]
	str	r1, [r3]
	bx	lr
.L27:
	cmp	r1, #1
	beq	.L31
	ldr	r1, [r3, #16]
	add	r1, r2, r1
	b	.L29
.L40:
	cmp	r2, #1
	ble	.L32
	mvn	r0, #47
	str	r0, [r3, #16]
	add	r1, r2, r0
	b	.L29
.L41:
	ldr	r1, [r3, #24]
	add	r1, r2, r1
	cmp	r1, #238
	bgt	.L33
	mov	r0, #48
	str	r0, [r3, #16]
	add	r1, r2, r0
	b	.L29
.L43:
	.align	2
.L42:
	.word	player
	.word	buttons
	.word	oldButtons
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePlayer
	ldr	r3, .L52
	ldr	r2, [r3]
	cmp	r2, #64
	movle	r1, #1
	strle	r1, [r3, #8]
	ldr	r1, [r3, #20]
	add	r1, r2, r1
	cmp	r1, #71
	mvngt	r0, #0
	movgt	r1, r0
	ldrle	r1, [r3, #8]
	strgt	r0, [r3, #8]
	add	r1, r2, r1
	ldr	r4, .L52+4
	ldr	r0, .L52+8
	str	r1, [r3]
	str	r2, [r3, #12]
	mov	lr, pc
	bx	r4
	ldr	r0, .L52+12
	mov	lr, pc
	bx	r4
	ldr	r0, .L52+16
	mov	lr, pc
	bx	r4
	ldr	r0, .L52+20
	mov	lr, pc
	bx	r4
	ldr	r0, .L52+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L52+28
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L48
	ldr	r4, .L52+32
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L51
.L49:
	ldr	r3, .L52+36
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L48:
	mov	r2, #0
	ldr	r3, .L52+32
	str	r2, [r3]
	b	.L49
.L51:
	ldr	r3, .L52+40
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r3, [r4]
	b	.L49
.L53:
	.align	2
.L52:
	.word	laser
	.word	updateObst
	.word	obstacles
	.word	obstacles+36
	.word	obstacles+72
	.word	obstacles+108
	.word	obstacles+144
	.word	score
	.word	spawned
	.word	updateBG
	.word	newObst
	.size	updateGame, .-updateGame
	.align	2
	.global	updateLaser
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLaser, %function
updateLaser:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L58
	ldr	r2, [r3]
	cmp	r2, #64
	movle	r1, #1
	strle	r1, [r3, #8]
	ldr	r1, [r3, #20]
	add	r1, r2, r1
	cmp	r1, #71
	mvngt	r0, #0
	movgt	r1, r0
	ldrle	r1, [r3, #8]
	add	r1, r2, r1
	strgt	r0, [r3, #8]
	str	r1, [r3]
	str	r2, [r3, #12]
	bx	lr
.L59:
	.align	2
.L58:
	.word	laser
	.size	updateLaser, .-updateLaser
	.comm	spawned,4,4
	.comm	score,4,4
	.comm	obstacles,180,4
	.comm	laser,28,4
	.comm	obstacle,36,4
	.comm	player,40,4
	.comm	NOTES,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
