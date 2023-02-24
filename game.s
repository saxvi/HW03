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
	mov	lr, #20
	mov	ip, #15
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
	str	lr, [r3, #28]
	str	r1, [r3]
	str	r1, [r3, #16]
	str	ip, [r3, #24]
	strh	r0, [r3, #32]	@ movhi
	str	r2, [r3, #4]
	str	r2, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L9:
	.align	2
.L8:
	.word	laser
	.size	initLaser, .-initLaser
	.align	2
	.global	initPowerup
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPowerup, %function
initPowerup:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	mov	r4, #1
	mov	lr, #16896
	mov	r1, #20
	mov	r2, #5
	mov	ip, #0
	ldr	r3, .L12+4
	smull	r5, r3, r0, r3
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl r4
	sub	r0, r0, r3
	add	r0, r0, r4
	add	r3, r0, r0, lsl #2
	add	r0, r0, r3, lsl #3
	ldr	r3, .L12+8
	add	r0, r0, #52
	str	r4, [r3, #12]
	strh	lr, [r3, #32]	@ movhi
	str	r0, [r3]
	str	r0, [r3, #16]
	str	ip, [r3, #36]
	str	r1, [r3, #4]
	str	r1, [r3, #20]
	str	r2, [r3, #28]
	str	r2, [r3, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	rand
	.word	1431655766
	.word	powerup
	.size	initPowerup, .-initPowerup
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
	mov	r9, #52
	ldr	r8, .L21
	ldr	r4, .L21+4
	ldr	r5, .L21+8
	ldr	r7, .L21+12
	ldr	r6, .L21+16
.L18:
	mov	r1, #41
	mov	r2, #35
	mov	r3, #1
	str	r1, [r8, #20]
	str	r2, [r8, #24]
	str	r3, [r8, #32]
	mov	lr, pc
	bx	r4
	mov	r2, #0
	subs	r3, r2, r0
	and	r3, r3, #3
	and	r0, r0, #3
	rsbpl	r0, r3, #0
	add	r0, r0, #1
	str	r2, [r8, #4]
	str	r9, [r8]
	str	r0, [r8, #16]
	mov	lr, pc
	bx	r4
	smull	r2, r3, r5, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r3, r0, r3
	cmp	r3, #1
	strheq	r7, [r8, #28]	@ movhi
	beq	.L17
	cmp	r3, #2
	strheq	r6, [r8, #28]	@ movhi
	beq	.L17
	cmp	r3, #0
	ldreq	r3, .L21+20
	strheq	r3, [r8, #28]	@ movhi
.L17:
	add	r9, r9, #48
	cmp	r9, #196
	add	r8, r8, #36
	bne	.L18
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L22:
	.align	2
.L21:
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r2, #100
	mov	r8, #20
	mov	r7, #15
	mov	r6, #31744
	mov	ip, #120
	mov	lr, #31
	mov	r0, #10
	mov	r5, #3
	mov	r4, #1
	ldr	r3, .L25
	str	r1, [r3]
	ldr	r3, .L25+4
	str	r8, [r3, #28]
	str	r7, [r3, #24]
	strh	r6, [r3, #32]	@ movhi
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r1, [r3, #36]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	ldr	r3, .L25+8
	str	r5, [r3, #28]
	str	r4, [r3, #24]
	strh	lr, [r3, #32]	@ movhi
	str	ip, [r3]
	str	ip, [r3, #16]
	str	r0, [r3, #4]
	str	r0, [r3, #20]
	bl	initObst
	pop	{r4, r5, r6, r7, r8, lr}
	b	initPowerup
.L26:
	.align	2
.L25:
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
	ldr	r3, .L38
	ldrh	r3, [r3]
	ldr	r4, .L38+4
	tst	r3, #32
	ldr	r0, [r4]
	ldr	r2, [r4, #24]
	sub	sp, sp, #20
	bne	.L28
	cmp	r0, #53
	mvngt	r3, #2
	strgt	r3, [r4, #16]
	ble	.L28
.L29:
	ldr	r3, .L38+8
	add	ip, r3, #24
	ldr	r1, [r3, #4]
	ldm	ip, {ip, lr}
	ldr	r3, [r3]
	ldr	r5, .L38+12
	stmib	sp, {r1, ip, lr}
	str	r3, [sp]
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #28]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	mvnne	r2, #2
	movne	r0, #1
	movne	r3, r2
	ldrne	r1, .L38+16
	strne	r2, [r4, #20]
	ldr	r2, [r4, #4]
	ldreq	r3, [r4, #20]
	strne	r0, [r4, #36]
	strhne	r1, [r4, #32]	@ movhi
	cmp	r2, #100
	beq	.L37
	cmp	r2, #160
	ble	.L34
	mov	r0, #67108864
	mov	r1, #21248
	mvn	lr, #0
	strh	r1, [r0, #104]	@ movhi
	ldr	ip, .L38+20
	ldr	r1, .L38+24
	strh	ip, [r0, #108]	@ movhi
	ldr	ip, [r1]
	ldr	r0, .L38+28
	str	lr, [r1]
	strb	ip, [r0]
.L34:
	add	r3, r2, r3
	cmp	r3, #100
	str	r3, [r4, #4]
	movle	r3, #0
	ldr	r0, [r4]
	ldr	r1, [r4, #16]
	add	r1, r1, r0
	str	r2, [r4, #12]
	str	r0, [r4, #8]
	str	r1, [r4]
	strle	r3, [r4, #20]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L28:
	tst	r3, #16
	bne	.L30
	add	r3, r0, r2
	cmp	r3, #187
	movle	r3, #3
	strle	r3, [r4, #16]
	ble	.L29
.L30:
	mov	r3, #0
	str	r3, [r4, #16]
	b	.L29
.L37:
	mov	r0, #0
	mov	r1, #31744
	str	r0, [r4, #36]
	strh	r1, [r4, #32]	@ movhi
	b	.L34
.L39:
	.align	2
.L38:
	.word	buttons
	.word	player
	.word	powerup
	.word	collision
	.word	32736
	.word	-31221
	.word	score
	.word	temp
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updatePowerup
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePowerup, %function
updatePowerup:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L49
	ldr	r5, .L49+4
	ldr	r3, [r4, #4]
	ldr	r1, [r4, #12]
	ldr	ip, [r5, #4]
	ldr	r0, [r4]
	add	r1, r3, r1
	add	r2, r4, #24
	cmp	ip, #99
	str	r3, [r4, #20]
	str	r1, [r4, #4]
	str	r0, [r4, #16]
	ldm	r2, {r2, r3}
	sub	sp, sp, #16
	ble	.L47
.L41:
	ldr	r6, [r5, #28]
	str	ip, [sp, #4]
	ldr	lr, [r5, #24]
	ldr	ip, [r5]
	str	r6, [sp, #12]
	str	lr, [sp, #8]
	str	ip, [sp]
	ldr	r6, .L49+8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L48
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L47:
	ldrh	ip, [r4, #32]
	ldr	r6, .L49+12
	str	ip, [sp]
	mov	lr, pc
	bx	r6
	add	r2, r4, #24
	ldm	r4, {r0, r1}
	ldm	r2, {r2, r3}
	ldr	ip, [r5, #4]
	b	.L41
.L48:
	mov	ip, #1
	ldr	r2, .L49+16
	ldr	r3, [r4, #28]
	str	r2, [sp]
	ldr	r2, [r4, #24]
	ldm	r4, {r0, r1}
	ldr	r4, .L49+12
	str	ip, [r5, #36]
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	powerup
	.word	player
	.word	collision
	.word	drawRect
	.word	18137
	.size	updatePowerup, .-updatePowerup
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
	ldr	r3, .L55
	ldr	r2, [r3]
	cmp	r2, #110
	movle	r1, #1
	strle	r1, [r3, #8]
	ldr	r1, [r3, #28]
	add	r1, r2, r1
	cmp	r1, #129
	mvngt	r0, #0
	movgt	r1, r0
	ldrle	r1, [r3, #8]
	add	r1, r2, r1
	strgt	r0, [r3, #8]
	str	r1, [r3]
	str	r2, [r3, #16]
	bx	lr
.L56:
	.align	2
.L55:
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
	push	{r4, r5, r6, r7, lr}
	mov	r3, #1
	mov	r4, r0
	mov	lr, #160
	mov	ip, #52
	mov	r5, #137
	ldr	r2, [r0, #4]
	ldr	r1, [r0, #16]
	ldr	r0, [r0]
	sub	sp, sp, #20
	add	r1, r2, r1
	str	r2, [r4, #12]
	str	r1, [r4, #4]
	str	r0, [r4, #8]
	ldr	r2, [r4, #20]
	ldr	r6, .L65
	stm	sp, {ip, lr}
	str	r3, [sp, #12]
	str	r5, [sp, #8]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L58
	ldr	r3, [r4]
.L59:
	ldr	r5, .L65+4
	ldr	r7, [r4, #24]
	ldr	lr, [r4, #20]
	ldr	ip, [r4, #4]
	str	r3, [sp]
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	ldm	r5, {r0, r1}
	stmib	sp, {ip, lr}
	str	r7, [sp, #12]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r3, [r5, #4]
	ldrne	r2, [r4, #16]
	addne	r3, r3, r2
	strne	r3, [r5, #4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L58:
	mov	r3, #67108864
	mov	r1, #8704
	ldr	r2, .L65+8
	strh	r1, [r3, #104]	@ movhi
	ldr	r1, .L65+12
	strh	r2, [r3, #108]	@ movhi
	ldr	r3, [r4]
	ldr	r2, [r1]
	add	r3, r3, #7
	add	r2, r2, #1
	str	r2, [r1]
	str	r3, [r4]
	b	.L59
.L66:
	.align	2
.L65:
	.word	collision
	.word	player
	.word	-30887
	.word	score
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
	ldr	r0, .L72
	bl	updateObst
	ldr	r0, .L72+4
	bl	updateObst
	ldr	r0, .L72+8
	bl	updateObst
	bl	updatePlayer
	ldr	r3, .L72+12
	ldr	r3, [r3, #36]
	cmp	r3, #0
	beq	.L71
.L68:
	ldr	r3, .L72+16
	ldmia	r3, {r1, r2}
	add	r2, r1, r2
	ldr	r1, .L72+20
	cmp	r2, #160
	str	r2, [r3]
	str	r2, [r1]
	movgt	r2, #0
	pop	{r4, lr}
	strgt	r2, [r3]
	bx	lr
.L71:
	bl	updatePowerup
	b	.L68
.L73:
	.align	2
.L72:
	.word	obstacles
	.word	obstacles+36
	.word	obstacles+72
	.word	player
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
	ldr	r3, .L76
	ldmia	r3, {r1, r2}
	add	r2, r1, r2
	ldr	r1, .L76+4
	cmp	r2, #160
	str	r2, [r3]
	str	r2, [r1]
	movgt	r2, #0
	strgt	r2, [r3]
	bx	lr
.L77:
	.align	2
.L76:
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
	ldr	r4, .L80
	ldr	ip, .L80+4
	sub	sp, sp, #12
	add	r2, r4, #24
	add	r0, r4, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L80+8
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
.L81:
	.align	2
.L80:
	.word	player
	.word	18137
	.word	drawRect
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawPowerup
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPowerup, %function
drawPowerup:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L84
	ldr	ip, .L84+4
	ldr	r1, [r4, #20]
	sub	sp, sp, #12
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #24]
	ldr	r0, [r4, #16]
	str	ip, [sp]
	ldr	r5, .L84+8
	sub	r1, r1, #1
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
.L85:
	.align	2
.L84:
	.word	powerup
	.word	18137
	.word	drawRect
	.size	drawPowerup, .-drawPowerup
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
	ldr	r4, .L88
	add	r0, r4, #16
	ldr	ip, .L88+4
	ldr	r3, [r4, #28]
	ldm	r0, {r0, r1}
	sub	sp, sp, #12
	str	ip, [sp]
	ldr	r5, .L88+8
	mov	r2, r3
	sub	r1, r1, #1
	sub	r0, r0, #1
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4, #32]
	ldr	r0, [r4]
	str	r3, [sp]
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #24]
	ldr	r1, [r4, #4]
	sub	r0, r0, #1
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4, #32]
	ldr	r1, [r4, #4]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r0, [r4]
	sub	r1, r1, #1
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L89:
	.align	2
.L88:
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
	ldr	r6, .L94
	ldr	r7, .L94+4
	sub	sp, sp, #12
.L91:
	str	r7, [sp]
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #12]
	ldr	r0, [r4]
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
	bne	.L91
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L95:
	.align	2
.L94:
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
	ldr	r2, .L98
	ldr	r3, .L98+4
	sub	sp, sp, #12
	ldr	r4, .L98+8
	ldr	r1, [r2]
	mov	r0, #52
	str	r3, [sp]
	mov	r2, #137
	mov	r3, #1
	mov	lr, pc
	bx	r4
	ldr	r2, .L98+12
	ldr	r3, .L98+16
	ldr	r1, [r2]
	ldr	r5, .L98+20
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
.L99:
	.align	2
.L98:
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
	ldr	r4, .L102
	mov	r0, r4
	bl	drawObst
	add	r0, r4, #36
	bl	drawObst
	add	r0, r4, #72
	bl	drawObst
	bl	drawBG
	bl	drawPlayer
	bl	drawPowerup
	bl	drawLaser
	ldr	r3, .L102+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L103:
	.align	2
.L102:
	.word	obstacles
	.word	waitForVBlank
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
	ldr	r3, .L106
	ldr	r0, [r3, #32]
	ldr	r1, .L106+4
	cmp	r0, #0
	str	r2, [r1]
	streq	r2, [r3, #32]
	bx	lr
.L107:
	.align	2
.L106:
	.word	obstacles
	.word	spawned
	.size	newObst, .-newObst
	.global	lineyvel
	.comm	oldlineY,4,4
	.global	lineY
	.comm	t,4,4
	.comm	spawned,4,4
	.comm	obstacles,108,4
	.comm	powerup,40,4
	.comm	laser,40,4
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
