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
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateObst.part.0, %function
updateObst.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r0, [r0, #24]
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	sub	sp, sp, #16
	ldr	r5, .L7
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	ldm	r5, {r0, r1}
	ldr	r6, .L7+4
	mov	lr, pc
	bx	r6
	ldr	r2, [r5, #4]
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #24]
	cmp	r0, #0
	subne	r2, r2, #1
	add	r3, r1, r3
	strne	r2, [r5, #4]
	cmp	r3, r2
	bge	.L4
	mov	r3, #67108864
	mov	r2, #9472
	ldr	r0, .L7+8
	strh	r2, [r3, #104]	@ movhi
	ldr	r2, .L7+12
	strh	r0, [r3, #108]	@ movhi
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
.L4:
	ldr	r3, [r4]
	ldr	r2, [r4, #16]
	add	r3, r3, r2
	str	r1, [r4, #12]
	str	r3, [r4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	player
	.word	collision
	.word	-31118
	.word	score
	.size	updateObst.part.0, .-updateObst.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawObst.part.0, %function
drawObst.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r4, r0
	ldr	ip, .L11
	sub	sp, sp, #12
	add	r2, r0, #20
	add	r0, r0, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L11+4
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #28]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	18137
	.word	drawRect
	.size	drawObst.part.0, .-drawObst.part.0
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
	str	lr, [sp, #-4]!
	mov	r2, #100
	mov	r1, #0
	mov	lr, #31
	mov	ip, #41
	mov	r0, #31744
	ldr	r3, .L15
	str	lr, [r3, #28]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	ip, [r3, #24]
	strh	r0, [r3, #32]	@ movhi
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r1, [r3, #36]
	ldr	lr, [sp], #4
	bx	lr
.L16:
	.align	2
.L15:
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
	ldr	r3, .L19
	str	lr, [r3, #4]
	str	r2, [r3]
	str	r2, [r3, #12]
	str	ip, [r3, #20]
	str	r0, [r3, #16]
	strh	r1, [r3, #24]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L20:
	.align	2
.L19:
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
	ldr	r4, .L31
	mov	r10, #52
	mov	r9, r4
	ldr	r5, .L31+4
	ldr	r8, .L31+8
	ldr	r7, .L31+12
	ldr	r6, .L31+16
.L28:
	mov	r3, #41
	mov	r1, #1
	mvn	r2, #0
	str	r3, [r9, #20]
	str	r3, [r9, #24]
	str	r10, [r9]
	str	r1, [r9, #32]
	str	r2, [r9, #16]
	mov	lr, pc
	bx	r5
	rsbs	r3, r0, #0
	and	r3, r3, #3
	and	r0, r0, #3
	rsbpl	r0, r3, #0
	cmp	r0, #3
	ldrls	pc, [pc, r0, asl #2]
	b	.L22
.L24:
	.word	.L27
	.word	.L26
	.word	.L25
	.word	.L23
.L23:
	strh	r8, [r9, #28]	@ movhi
.L22:
	add	r10, r10, #48
	cmp	r10, #244
	add	r9, r9, #36
	bne	.L28
	mov	r1, #30
	mov	r2, #0
	ldr	r3, [r4, #96]
	str	r1, [r4, #4]
	str	r2, [r4, #40]
	str	r3, [r4, #76]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L25:
	strh	r7, [r9, #28]	@ movhi
	b	.L22
.L27:
	ldr	r3, .L31+20
	strh	r3, [r9, #28]	@ movhi
	b	.L22
.L26:
	strh	r6, [r9, #28]	@ movhi
	b	.L22
.L32:
	.align	2
.L31:
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
	ldr	r3, .L35
	str	r1, [r3]
	ldr	r3, .L35+4
	str	r7, [r3, #24]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	strh	r6, [r3, #32]	@ movhi
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	str	r1, [r3, #36]
	str	r2, [r3, #8]
	str	ip, [r3, #28]
	ldr	r3, .L35+8
	str	r5, [r3, #4]
	str	r4, [r3, #20]
	str	lr, [r3, #16]
	pop	{r4, r5, r6, r7, lr}
	strh	ip, [r3, #24]	@ movhi
	str	r0, [r3]
	str	r0, [r3, #12]
	b	initObst
.L36:
	.align	2
.L35:
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
	push	{r4, r5, lr}
	ldr	r4, .L56
	ldr	r3, [r4, #36]
	cmp	r3, #0
	ldr	r0, [r4]
	ldr	r2, [r4, #24]
	sub	sp, sp, #20
	bne	.L38
	ldr	r3, .L56+4
	ldrh	r3, [r3]
	tst	r3, #32
	bne	.L39
	cmp	r0, #1
	mvngt	r3, #2
	strgt	r3, [r4, #16]
	bgt	.L40
.L39:
	tst	r3, #16
	beq	.L54
.L41:
	mov	r3, #0
	str	r3, [r4, #16]
.L40:
	mov	r1, #52
	mov	r3, #160
	mov	ip, #137
	mov	lr, #1
	ldr	r5, .L56+8
	stm	sp, {r1, r3, ip, lr}
	ldr	r3, [r4, #28]
	ldr	r1, [r4, #4]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L43
	mov	r3, #67108864
	mov	ip, #22272
	mvn	r1, #0
	ldr	r0, .L56+12
	ldr	r2, .L56+16
	strh	ip, [r3, #104]	@ movhi
	strh	r0, [r3, #108]	@ movhi
	str	r1, [r2]
.L43:
	ldr	r0, [r4]
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #16]
	ldr	r3, [r4, #20]
	add	r2, r2, r0
	add	r3, r3, r1
	str	r0, [r4, #8]
	str	r2, [r4]
	str	r1, [r4, #12]
	str	r3, [r4, #4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L38:
	cmp	r3, #1
	bne	.L40
	ldr	r3, .L56+20
	ldrh	r3, [r3]
	tst	r3, #32
	beq	.L42
	ldr	r1, .L56+4
	ldrh	r1, [r1]
	tst	r1, #32
	beq	.L55
.L42:
	tst	r3, #16
	beq	.L41
	ldr	r3, .L56+4
	ldrh	r3, [r3]
	tst	r3, #16
	bne	.L41
	add	r3, r0, r2
	cmp	r3, #238
	bgt	.L41
	mov	r3, #48
	str	r3, [r4, #16]
	b	.L40
.L54:
	add	r3, r0, r2
	cmp	r3, #238
	movle	r3, #3
	strle	r3, [r4, #16]
	ble	.L40
	b	.L41
.L55:
	cmp	r0, #1
	mvngt	r3, #47
	strgt	r3, [r4, #16]
	bgt	.L40
	b	.L42
.L57:
	.align	2
.L56:
	.word	player
	.word	buttons
	.word	collision
	.word	-31221
	.word	score
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
	push	{r4, r5, r6, lr}
	bl	updatePlayer
	ldr	r3, .L74
	ldr	r2, [r3]
	cmp	r2, #64
	movle	r1, #1
	strle	r1, [r3, #8]
	ldr	r1, [r3, #20]
	add	r1, r2, r1
	cmp	r1, #71
	mvngt	r0, #0
	movgt	r1, r0
	ldr	r6, .L74+4
	mov	r4, r6
	ldrle	r1, [r3, #8]
	add	r1, r2, r1
	strgt	r0, [r3, #8]
	str	r1, [r3]
	str	r2, [r3, #12]
	add	r5, r6, #144
.L63:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L73
.L62:
	add	r4, r4, #36
	cmp	r5, r4
	bne	.L63
	ldr	r3, .L74+8
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L64
	ldr	r3, .L74+12
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L66
	mov	r2, #1
	ldr	r1, [r6, #32]
	cmp	r1, #0
	str	r2, [r3]
	streq	r2, [r6, #32]
.L66:
	ldr	r3, .L74+16
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L73:
	mov	r0, r4
	bl	updateObst.part.0
	b	.L62
.L64:
	mov	r2, #0
	ldr	r3, .L74+12
	str	r2, [r3]
	b	.L66
.L75:
	.align	2
.L74:
	.word	laser
	.word	obstacles
	.word	score
	.word	spawned
	.word	updateBG
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
	ldr	r3, .L80
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
.L81:
	.align	2
.L80:
	.word	laser
	.size	updateLaser, .-updateLaser
	.align	2
	.global	updateObst
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateObst, %function
updateObst:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	b	updateObst.part.0
	.size	updateObst, .-updateObst
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L86
	ldr	ip, .L86+4
	sub	sp, sp, #12
	add	r2, r4, #24
	add	r0, r4, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L86+8
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #28]
	str	r2, [sp]
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #24]
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L87:
	.align	2
.L86:
	.word	player
	.word	18137
	.word	drawRect
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawLaser
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLaser, %function
drawLaser:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L90
	ldr	ip, .L90+4
	ldr	r3, [r4, #20]
	sub	sp, sp, #12
	str	ip, [sp]
	ldr	r5, .L90+8
	mov	r2, r3
	ldr	r1, [r4, #4]
	ldr	r0, [r4]
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4, #24]
	ldr	r0, [r4]
	str	r3, [sp]
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #16]
	ldr	r1, [r4, #4]
	sub	r0, r0, #1
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4, #24]
	ldr	r1, [r4, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r0, [r4]
	sub	r1, r1, #1
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L91:
	.align	2
.L90:
	.word	laser
	.word	18137
	.word	drawRect
	.size	drawLaser, .-drawLaser
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	drawPlayer
	bl	drawLaser
	ldr	r4, .L101
	add	r5, r4, #144
.L94:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L100
.L93:
	add	r4, r4, #36
	cmp	r4, r5
	bne	.L94
	pop	{r4, r5, r6, lr}
	bx	lr
.L100:
	mov	r0, r4
	bl	drawObst.part.0
	b	.L93
.L102:
	.align	2
.L101:
	.word	obstacles
	.size	drawGame, .-drawGame
	.align	2
	.global	drawObst
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawObst, %function
drawObst:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	b	drawObst.part.0
	.size	drawObst, .-drawObst
	.align	2
	.global	newObst
	.syntax unified
	.arm
	.fpu softvfp
	.type	newObst, %function
newObst:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L107
	ldr	r0, [r3, #32]
	ldr	r1, .L107+4
	cmp	r0, #0
	str	r2, [r1]
	streq	r2, [r3, #32]
	bx	lr
.L108:
	.align	2
.L107:
	.word	obstacles
	.word	spawned
	.size	newObst, .-newObst
	.comm	spawned,4,4
	.comm	score,4,4
	.comm	obstacles,144,4
	.comm	laser,28,4
	.comm	obstacle,36,4
	.comm	player,40,4
	.comm	NOTES,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
