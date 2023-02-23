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
	ldr	r2, [r0, #24]
	ldr	r3, [r0]
	ldr	r1, [r4, #4]
	ldr	r0, [r0, #20]
	sub	sp, sp, #16
	ldr	r5, .L10
	sub	r3, r3, r2
	str	r2, [sp, #12]
	str	r0, [sp, #8]
	str	r1, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	ldm	r5, {r0, r1}
	ldr	r6, .L10+4
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
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L3
	ldr	r3, [r4, #16]
.L4:
	ldm	r4, {r1, r2}
	add	r3, r2, r3
	str	r3, [r4, #4]
	str	r2, [r4, #12]
	str	r1, [r4, #8]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L3:
	mov	r3, #67108864
	mov	r2, #8704
	mov	r1, #0
	strh	r2, [r3, #104]	@ movhi
	ldr	r0, .L10+8
	ldr	r2, .L10+12
	strh	r0, [r3, #108]	@ movhi
	ldr	r3, [r2]
	str	r1, [r4, #4]
	add	r3, r3, #1
	ldr	r1, .L10+16
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	subs	r3, r0, #0
	and	r3, r3, #1
	rsblt	r3, r3, #0
	add	r3, r3, #1
	str	r3, [r4, #16]
	b	.L4
.L11:
	.align	2
.L10:
	.word	player
	.word	collision
	.word	-30887
	.word	score
	.word	rand
	.size	updateObst.part.0, .-updateObst.part.0
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
	mov	ip, #20
	mov	r0, #31744
	ldr	r3, .L14
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
.L15:
	.align	2
.L14:
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
	ldr	r3, .L18
	str	lr, [r3, #24]
	str	r1, [r3]
	str	r1, [r3, #12]
	str	ip, [r3, #20]
	strh	r0, [r3, #28]	@ movhi
	str	r2, [r3, #4]
	str	r2, [r3, #16]
	ldr	lr, [sp], #4
	bx	lr
.L19:
	.align	2
.L18:
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
	mov	r9, #0
	ldr	r8, .L27
	ldr	r4, .L27+4
	ldr	r5, .L27+8
	ldr	r7, .L27+12
	ldr	r6, .L27+16
.L24:
	mov	r3, #41
	mov	r2, #1
	str	r3, [r8, #20]
	str	r3, [r8, #24]
	str	r2, [r8, #32]
	mov	lr, pc
	bx	r4
	ldr	r2, [r8, #20]
	rsb	r3, r9, r9, lsl #3
	add	r3, r3, #52
	mla	r2, r9, r2, r3
	cmp	r0, #0
	and	r0, r0, #1
	rsblt	r0, r0, #0
	add	r3, r9, r9, lsl #2
	lsl	r3, r3, #4
	add	r0, r0, #1
	stm	r8, {r2, r3}
	str	r0, [r8, #16]
	mov	lr, pc
	bx	r4
	smull	r2, r3, r5, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r3, r0, r3
	cmp	r3, #1
	strheq	r7, [r8, #28]	@ movhi
	beq	.L23
	cmp	r3, #2
	strheq	r6, [r8, #28]	@ movhi
	beq	.L23
	cmp	r3, #0
	ldreq	r3, .L27+20
	strheq	r3, [r8, #28]	@ movhi
.L23:
	add	r9, r9, #1
	cmp	r9, #3
	add	r8, r8, #36
	bne	.L24
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L28:
	.align	2
.L27:
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
	ldr	r3, .L31
	str	r1, [r3]
	ldr	r3, .L31+4
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
	ldr	r3, .L31+8
	strh	lr, [r3, #28]	@ movhi
	str	r5, [r3, #24]
	str	r4, [r3, #20]
	pop	{r4, r5, r6, r7, lr}
	str	ip, [r3]
	str	ip, [r3, #12]
	str	r0, [r3, #4]
	str	r0, [r3, #16]
	b	initObst
.L32:
	.align	2
.L31:
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
	ldr	r4, .L51
	ldr	r3, [r4, #36]
	cmp	r3, #0
	ldr	r0, [r4]
	ldr	r2, [r4, #24]
	sub	sp, sp, #20
	bne	.L34
	ldr	r3, .L51+4
	ldrh	r3, [r3]
	tst	r3, #32
	bne	.L35
	cmp	r0, #53
	mvngt	r3, #2
	strgt	r3, [r4, #16]
	ble	.L35
.L36:
	mov	r1, #52
	mov	r3, #160
	mov	ip, #137
	mov	lr, #1
	ldr	r5, .L51+8
	stm	sp, {r1, r3, ip, lr}
	ldr	r3, [r4, #28]
	ldr	r1, [r4, #4]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L39
	mov	r3, #67108864
	mov	ip, #21248
	mvn	r1, #0
	ldr	r0, .L51+12
	ldr	r2, .L51+16
	strh	ip, [r3, #104]	@ movhi
	strh	r0, [r3, #108]	@ movhi
	str	r1, [r2]
.L39:
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
.L34:
	cmp	r3, #1
	bne	.L36
	ldr	r3, .L51+20
	ldrh	r3, [r3]
	tst	r3, #32
	beq	.L38
	ldr	r1, .L51+4
	ldrh	r1, [r1]
	tst	r1, #32
	beq	.L50
.L38:
	tst	r3, #16
	beq	.L37
	ldr	r3, .L51+4
	ldrh	r3, [r3]
	tst	r3, #16
	bne	.L37
	add	r3, r0, r2
	cmp	r3, #238
	bgt	.L37
	mov	r3, #48
	str	r3, [r4, #16]
	b	.L36
.L35:
	tst	r3, #16
	bne	.L37
	add	r3, r0, r2
	cmp	r3, #187
	movle	r3, #3
	strle	r3, [r4, #16]
	ble	.L36
.L37:
	mov	r3, #0
	str	r3, [r4, #16]
	b	.L36
.L50:
	cmp	r0, #1
	mvngt	r3, #47
	strgt	r3, [r4, #16]
	bgt	.L36
	b	.L38
.L52:
	.align	2
.L51:
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
	push	{r4, lr}
	ldr	r4, .L75
	bl	updatePlayer
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L72
.L54:
	ldr	r3, [r4, #68]
	cmp	r3, #0
	bne	.L73
.L55:
	ldr	r3, [r4, #104]
	cmp	r3, #0
	bne	.L74
.L56:
	ldr	r3, .L75+4
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L57
	ldr	r3, .L75+8
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L59
	mov	r2, #1
	ldr	r1, [r4, #32]
	cmp	r1, #0
	str	r2, [r3]
	streq	r2, [r4, #32]
.L59:
	ldr	r3, .L75+12
	ldmia	r3, {r1, r2}
	add	r2, r1, r2
	ldr	r1, .L75+16
	cmp	r2, #160
	str	r2, [r3]
	str	r2, [r1]
	movgt	r2, #0
	pop	{r4, lr}
	strgt	r2, [r3]
	bx	lr
.L57:
	mov	r2, #0
	ldr	r3, .L75+8
	str	r2, [r3]
	b	.L59
.L74:
	ldr	r0, .L75+20
	bl	updateObst.part.0
	b	.L56
.L73:
	ldr	r0, .L75+24
	bl	updateObst.part.0
	b	.L55
.L72:
	mov	r0, r4
	bl	updateObst.part.0
	b	.L54
.L76:
	.align	2
.L75:
	.word	obstacles
	.word	score
	.word	spawned
	.word	.LANCHOR0
	.word	oldlineY
	.word	obstacles+72
	.word	obstacles+36
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
	ldr	r3, .L81
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
.L82:
	.align	2
.L81:
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
	ldr	r3, .L87
	ldmia	r3, {r1, r2}
	add	r2, r1, r2
	ldr	r1, .L87+4
	cmp	r2, #160
	str	r2, [r3]
	str	r2, [r1]
	movgt	r2, #0
	strgt	r2, [r3]
	bx	lr
.L88:
	.align	2
.L87:
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
	ldr	r4, .L91
	ldr	ip, .L91+4
	sub	sp, sp, #12
	add	r2, r4, #24
	add	r0, r4, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L91+8
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
.L92:
	.align	2
.L91:
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
	ldr	r4, .L95
	add	r0, r4, #12
	ldr	ip, .L95+4
	ldr	r3, [r4, #24]
	ldm	r0, {r0, r1}
	sub	sp, sp, #12
	str	ip, [sp]
	ldr	r5, .L95+8
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
.L96:
	.align	2
.L95:
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
	ldr	r6, .L101
	ldr	r7, .L101+4
	sub	sp, sp, #12
.L98:
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	str	r7, [sp]
	add	r0, r4, #8
	ldm	r0, {r0, r1}
	add	r3, r3, #1
	add	r2, r2, #1
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
	bne	.L98
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L102:
	.align	2
.L101:
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
	ldr	r2, .L105
	ldr	r3, .L105+4
	sub	sp, sp, #12
	ldr	r4, .L105+8
	ldr	r1, [r2]
	mov	r0, #52
	str	r3, [sp]
	mov	r2, #137
	mov	r3, #1
	mov	lr, pc
	bx	r4
	ldr	r2, .L105+12
	ldr	r3, .L105+16
	ldr	r1, [r2]
	ldr	r5, .L105+20
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
.L106:
	.align	2
.L105:
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
	ldr	r4, .L109
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
.L110:
	.align	2
.L109:
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
	ldr	r3, .L113
	ldr	r0, [r3, #32]
	ldr	r1, .L113+4
	cmp	r0, #0
	str	r2, [r1]
	streq	r2, [r3, #32]
	bx	lr
.L114:
	.align	2
.L113:
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
