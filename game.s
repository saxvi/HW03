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
	mov	r1, #0
	mov	lr, #31
	mov	ip, #20
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
	str	r1, [r3, #20]
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
	mov	r1, #120
	mov	lr, #3
	mov	r2, #10
	mov	ip, #1
	mov	r0, #31
	ldr	r3, .L8
	str	lr, [r3, #24]
	str	r1, [r3]
	str	r1, [r3, #12]
	str	ip, [r3, #20]
	strh	r0, [r3, #28]	@ movhi
	str	r2, [r3, #4]
	str	r2, [r3, #16]
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
	mov	r4, #0
	mov	r10, r4
	ldr	r9, .L17
	ldr	r5, .L17+4
	ldr	r6, .L17+8
	ldr	r8, .L17+12
	ldr	r7, .L17+16
.L14:
	mov	r3, #41
	mov	r2, #1
	str	r3, [r9, #20]
	str	r3, [r9, #24]
	str	r2, [r9, #32]
	mov	lr, pc
	bx	r5
	ldr	r2, [r9, #20]
	rsb	r3, r10, r10, lsl #3
	add	r3, r3, #52
	mla	r3, r2, r10, r3
	cmp	r0, #0
	and	r0, r0, #1
	rsblt	r0, r0, #0
	add	r0, r0, #1
	stm	r9, {r3, r4}
	str	r0, [r9, #16]
	mov	lr, pc
	bx	r5
	smull	r2, r3, r6, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r3, r0, r3
	cmp	r3, #1
	strheq	r8, [r9, #28]	@ movhi
	beq	.L13
	cmp	r3, #2
	strheq	r7, [r9, #28]	@ movhi
	beq	.L13
	cmp	r3, #0
	ldreq	r3, .L17+20
	strheq	r3, [r9, #28]	@ movhi
.L13:
	add	r10, r10, #1
	cmp	r10, #3
	add	r9, r9, #36
	add	r4, r4, #100
	bne	.L14
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	obstacles
	.word	rand
	.word	1431655766
	.word	13619
	.word	16668
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
	mov	lr, #31
	mov	r7, #20
	mov	r6, #31744
	mov	r5, #3
	mov	r4, #1
	mov	ip, #120
	mov	r0, #10
	ldr	r3, .L21
	str	r1, [r3]
	ldr	r3, .L21+4
	str	r7, [r3, #24]
	str	lr, [r3, #28]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	strh	r6, [r3, #32]	@ movhi
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	str	r1, [r3, #36]
	str	r2, [r3, #8]
	ldr	r3, .L21+8
	strh	lr, [r3, #28]	@ movhi
	str	r5, [r3, #24]
	str	r4, [r3, #20]
	pop	{r4, r5, r6, r7, lr}
	str	ip, [r3]
	str	ip, [r3, #12]
	str	r0, [r3, #4]
	str	r0, [r3, #16]
	b	initObst
.L22:
	.align	2
.L21:
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
	ldr	r4, .L41
	ldr	r3, [r4, #36]
	cmp	r3, #0
	ldr	r0, [r4]
	ldr	r2, [r4, #24]
	sub	sp, sp, #20
	bne	.L24
	ldr	r3, .L41+4
	ldrh	r3, [r3]
	tst	r3, #32
	bne	.L25
	cmp	r0, #53
	mvngt	r3, #2
	strgt	r3, [r4, #16]
	ble	.L25
.L26:
	mov	r1, #52
	mov	r3, #160
	mov	ip, #137
	mov	lr, #1
	ldr	r5, .L41+8
	stm	sp, {r1, r3, ip, lr}
	ldr	r3, [r4, #28]
	ldr	r1, [r4, #4]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L29
	mov	r3, #67108864
	mov	ip, #21248
	mvn	r1, #0
	ldr	r0, .L41+12
	ldr	r2, .L41+16
	strh	ip, [r3, #104]	@ movhi
	strh	r0, [r3, #108]	@ movhi
	str	r1, [r2]
.L29:
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
.L24:
	cmp	r3, #1
	bne	.L26
	ldr	r3, .L41+20
	ldrh	r3, [r3]
	tst	r3, #32
	beq	.L28
	ldr	r1, .L41+4
	ldrh	r1, [r1]
	tst	r1, #32
	beq	.L40
.L28:
	tst	r3, #16
	beq	.L27
	ldr	r3, .L41+4
	ldrh	r3, [r3]
	tst	r3, #16
	bne	.L27
	add	r3, r0, r2
	cmp	r3, #238
	bgt	.L27
	mov	r3, #48
	str	r3, [r4, #16]
	b	.L26
.L25:
	tst	r3, #16
	bne	.L27
	add	r3, r0, r2
	cmp	r3, #187
	movle	r3, #3
	strle	r3, [r4, #16]
	ble	.L26
.L27:
	mov	r3, #0
	str	r3, [r4, #16]
	b	.L26
.L40:
	cmp	r0, #1
	mvngt	r3, #47
	strgt	r3, [r4, #16]
	bgt	.L26
	b	.L28
.L42:
	.align	2
.L41:
	.word	player
	.word	buttons
	.word	collision
	.word	-31221
	.word	score
	.word	oldButtons
	.size	updatePlayer, .-updatePlayer
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
	ldr	r3, .L47
	ldr	r2, [r3]
	cmp	r2, #110
	movle	r1, #1
	strle	r1, [r3, #8]
	ldr	r1, [r3, #24]
	add	r1, r2, r1
	cmp	r1, #129
	mvngt	r0, #0
	movgt	r1, r0
	ldrle	r1, [r3, #8]
	add	r1, r2, r1
	strgt	r0, [r3, #8]
	str	r1, [r3]
	str	r2, [r3, #12]
	bx	lr
.L48:
	.align	2
.L47:
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
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r2, [r0, #24]
	ldr	r3, [r0]
	ldr	r1, [r4, #4]
	ldr	r0, [r0, #20]
	sub	sp, sp, #16
	ldr	r5, .L57
	sub	r3, r3, r2
	str	r2, [sp, #12]
	str	r0, [sp, #8]
	str	r1, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	ldm	r5, {r0, r1}
	ldr	r6, .L57+4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r3, [r5, #4]
	addne	r3, r3, #1
	strne	r3, [r5, #4]
	mov	r0, #52
	mov	r1, #160
	mov	r2, #137
	mov	r3, #1
	stm	sp, {r0, r1, r2, r3}
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L51
	ldr	r3, [r4, #16]
.L52:
	ldm	r4, {r1, r2}
	add	r3, r2, r3
	str	r3, [r4, #4]
	str	r2, [r4, #12]
	str	r1, [r4, #8]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L51:
	mov	r3, #67108864
	mov	r2, #8704
	mov	r1, #0
	strh	r2, [r3, #104]	@ movhi
	ldr	r0, .L57+8
	ldr	r2, .L57+12
	strh	r0, [r3, #108]	@ movhi
	ldr	r3, [r2]
	str	r1, [r4, #4]
	add	r3, r3, #1
	ldr	r1, .L57+16
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	subs	r3, r0, #0
	and	r3, r3, #1
	rsblt	r3, r3, #0
	add	r3, r3, #1
	str	r3, [r4, #16]
	b	.L52
.L58:
	.align	2
.L57:
	.word	player
	.word	collision
	.word	-30887
	.word	score
	.word	rand
	.size	updateObst, .-updateObst
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
	ldr	r4, .L66
	bl	updatePlayer
	mov	r0, r4
	bl	updateObst
	add	r0, r4, #36
	bl	updateObst
	add	r0, r4, #72
	bl	updateObst
	ldr	r3, .L66+4
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L60
	ldr	r3, .L66+8
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L62
	mov	r2, #1
	ldr	r1, [r4, #32]
	cmp	r1, #0
	str	r2, [r3]
	streq	r2, [r4, #32]
.L62:
	ldr	r3, .L66+12
	ldmia	r3, {r1, r2}
	add	r2, r1, r2
	ldr	r1, .L66+16
	cmp	r2, #160
	str	r2, [r3]
	str	r2, [r1]
	movgt	r2, #0
	pop	{r4, lr}
	strgt	r2, [r3]
	bx	lr
.L60:
	mov	r2, #0
	ldr	r3, .L66+8
	str	r2, [r3]
	b	.L62
.L67:
	.align	2
.L66:
	.word	obstacles
	.word	score
	.word	spawned
	.word	.LANCHOR0
	.word	oldlineY
	.size	updateGame, .-updateGame
	.align	2
	.global	updateBG
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBG, %function
updateBG:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L70
	ldmia	r3, {r1, r2}
	add	r2, r1, r2
	ldr	r1, .L70+4
	cmp	r2, #160
	str	r2, [r3]
	str	r2, [r1]
	movgt	r2, #0
	strgt	r2, [r3]
	bx	lr
.L71:
	.align	2
.L70:
	.word	.LANCHOR0
	.word	oldlineY
	.size	updateBG, .-updateBG
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
	ldr	r4, .L74
	ldr	ip, .L74+4
	sub	sp, sp, #12
	add	r2, r4, #24
	add	r0, r4, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L74+8
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
.L75:
	.align	2
.L74:
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
	ldr	r4, .L78
	add	r0, r4, #12
	ldr	ip, .L78+4
	ldr	r3, [r4, #24]
	ldm	r0, {r0, r1}
	sub	sp, sp, #12
	str	ip, [sp]
	ldr	r5, .L78+8
	mov	r2, r3
	sub	r1, r1, #1
	sub	r0, r0, #1
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4, #28]
	ldr	r0, [r4]
	str	r3, [sp]
	ldr	r2, [r4, #24]
	ldr	r3, [r4, #20]
	ldr	r1, [r4, #4]
	sub	r0, r0, #1
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4, #28]
	ldr	r1, [r4, #4]
	str	r3, [sp]
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	ldr	r0, [r4]
	sub	r1, r1, #1
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L79:
	.align	2
.L78:
	.word	laser
	.word	18137
	.word	drawRect
	.size	drawLaser, .-drawLaser
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
	push	{r4, r5, r6, r7, lr}
	mov	r5, #3
	mov	r4, r0
	ldr	r6, .L84
	ldr	r7, .L84+4
	sub	sp, sp, #12
.L81:
	str	r7, [sp]
	add	r2, r4, #20
	add	r0, r4, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r6
	ldrh	r2, [r4, #28]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r6
	subs	r5, r5, #1
	bne	.L81
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	drawRect
	.word	18137
	.size	drawObst, .-drawObst
	.align	2
	.global	drawBG
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBG, %function
drawBG:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r2, .L88
	ldr	r3, .L88+4
	sub	sp, sp, #12
	ldr	r4, .L88+8
	ldr	r1, [r2]
	mov	r0, #52
	str	r3, [sp]
	mov	r2, #137
	mov	r3, #1
	mov	lr, pc
	bx	r4
	ldr	r2, .L88+12
	ldr	r3, .L88+16
	ldr	r1, [r2]
	ldr	r5, .L88+20
	str	r3, [sp]
	mov	r2, #137
	mov	r3, #1
	mov	r0, #52
	sub	r1, r1, #1
	mov	lr, pc
	bx	r4
	mov	r3, #160
	mov	r2, #7
	mov	r1, #0
	mov	r0, #93
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r0, #141
	mov	r3, #160
	mov	r2, #7
	mov	r1, #0
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L89:
	.align	2
.L88:
	.word	.LANCHOR0
	.word	12852
	.word	drawRect
	.word	oldlineY
	.word	18137
	.word	14937
	.size	drawBG, .-drawBG
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
	push	{r4, lr}
	ldr	r4, .L92
	bl	drawBG
	bl	drawPlayer
	bl	drawLaser
	mov	r0, r4
	bl	drawObst
	add	r0, r4, #36
	bl	drawObst
	add	r0, r4, #72
	pop	{r4, lr}
	b	drawObst
.L93:
	.align	2
.L92:
	.word	obstacles
	.size	drawGame, .-drawGame
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
	ldr	r3, .L96
	ldr	r0, [r3, #32]
	ldr	r1, .L96+4
	cmp	r0, #0
	str	r2, [r1]
	streq	r2, [r3, #32]
	bx	lr
.L97:
	.align	2
.L96:
	.word	obstacles
	.word	spawned
	.size	newObst, .-newObst
	.global	lineyvel
	.comm	oldlineY,4,4
	.global	lineY
	.comm	spawned,4,4
	.comm	obstacles,108,4
	.comm	powerup,32,4
	.comm	laser,32,4
	.comm	obstacle,36,4
	.comm	player,40,4
	.comm	NOTES,2,2
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	lineY, %object
	.size	lineY, 4
lineY:
	.word	10
	.type	lineyvel, %object
	.size	lineyvel, 4
lineyvel:
	.word	1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
