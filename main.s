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
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r0, .L9
	sub	sp, sp, #20
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
	ldr	r9, .L9+16
	ldr	r8, .L9+20
	add	r6, sp, #4
	b	.L5
.L8:
	ldrb	r3, [r6, #1]!	@ zero_extendqisi2
.L5:
	tst	r4, #1
	mov	r2, r3
	mov	r0, r5
	moveq	r3, r8
	movne	r3, r9
	mov	r1, #70
	add	r4, r4, #1
	mov	lr, pc
	bx	r7
	cmp	r4, #8
	add	r5, r5, #12
	bne	.L8
	mov	r3, #0
	ldr	r1, .L9+24
	ldr	r2, .L9+28
	str	r3, [r1]
	str	r3, [r2]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	11718
	.word	fillScreen
	.word	.LC1
	.word	drawChar
	.word	14937
	.word	18137
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
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"score: \000"
	.text
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L17
	ldr	r3, .L17+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L17+8
	ldr	r3, .L17+12
	ldr	r2, .L17+16
	mov	r1, #2
	mov	r0, #180
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L17+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L18:
	.align	2
.L17:
	.word	18137
	.word	fillScreen
	.word	drawString
	.word	11718
	.word	.LC2
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L26
	ldr	r3, [r2]
	push	{r4, lr}
	add	r3, r3, #1
	ldr	r1, .L26+4
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	ldr	r3, .L26+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L19
	ldr	r3, .L26+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L25
.L19:
	pop	{r4, lr}
	bx	lr
.L25:
	bl	goToGame
	ldr	r3, .L26+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	rSeed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	start, .-start
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"game paused!\000"
	.align	2
.LC4:
	.ascii	"press start to continue\000"
	.align	2
.LC5:
	.ascii	"press select to quit\000"
	.text
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L30
	ldr	r3, .L30+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L30+8
	mov	r1, #18
	mov	r0, #136
	ldr	r3, .L30+12
	ldr	r2, .L30+16
	mov	lr, pc
	bx	r4
	mov	r1, #28
	mov	r0, #130
	ldr	r3, .L30+20
	ldr	r2, .L30+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L30+28
	mov	r1, #38
	mov	r0, #130
	ldr	r3, .L30+32
	mov	lr, pc
	bx	r4
	ldr	r3, .L30+36
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L30+40
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L31:
	.align	2
.L30:
	.word	11718
	.word	fillScreen
	.word	drawString
	.word	18137
	.word	.LC3
	.word	14937
	.word	.LC4
	.word	.LC5
	.word	27295
	.word	waitForVBlank
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L44
	ldr	r3, .L44+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L33
	ldr	r2, .L44+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L42
.L33:
	tst	r3, #4
	beq	.L32
	ldr	r3, .L44+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L43
.L32:
	pop	{r4, lr}
	bx	lr
.L43:
	pop	{r4, lr}
	b	goToStart
.L42:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L33
.L45:
	.align	2
.L44:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"you lose!\000"
	.align	2
.LC7:
	.ascii	"press start to try again\000"
	.text
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L48
	ldr	r0, .L48+4
	ldr	r3, .L48+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L48+12
	mov	r3, r5
	mov	r1, #18
	mov	r0, #172
	ldr	r2, .L48+16
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L48+20
	mov	r1, #28
	mov	r0, #94
	mov	lr, pc
	bx	r4
	ldr	r3, .L48+24
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L48+28
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L49:
	.align	2
.L48:
	.word	28274
	.word	14937
	.word	fillScreen
	.word	drawString
	.word	.LC6
	.word	.LC7
	.word	waitForVBlank
	.word	state
	.size	goToLose, .-goToLose
	.section	.rodata.str1.4
	.align	2
.LC8:
	.ascii	"%d\000"
	.text
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L59
	sub	sp, sp, #12
	ldr	r3, .L59+4
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	ldr	r1, .L59+8
	ldr	r3, .L59+12
	ldr	r0, .L59+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L59+20
	mov	lr, pc
	bx	r3
	ldr	r2, .L59+24
	mov	r3, #8
	mov	r1, #1
	mov	r0, #220
	str	r2, [sp]
	ldr	r5, .L59+28
	mov	r2, #6
	mov	lr, pc
	bx	r5
	mov	r1, #1
	mov	r0, #220
	ldr	r2, [r4]
	ldr	r3, .L59+32
	ldr	r5, .L59+36
	mov	lr, pc
	bx	r5
	ldr	r3, .L59+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L59+44
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L51
	ldr	r3, .L59+48
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L57
.L51:
	ldr	r3, [r4]
	cmn	r3, #1
	beq	.L58
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L58:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	goToLose
.L57:
	bl	goToPause
	b	.L51
.L60:
	.align	2
.L59:
	.word	score
	.word	updateGame
	.word	.LC8
	.word	sprintf
	.word	buffer
	.word	waitForVBlank
	.word	18137
	.word	drawRect
	.word	28274
	.word	drawString
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.size	game, .-game
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L68
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L68+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L61
	ldr	r3, .L68+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L67
.L61:
	pop	{r4, lr}
	bx	lr
.L67:
	pop	{r4, lr}
	b	goToStart
.L69:
	.align	2
.L68:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
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
	ldr	lr, .L81
	ldr	r4, .L81+4
	strh	lr, [r3]	@ movhi
	strh	ip, [r3, #132]	@ movhi
	strh	r0, [r3, #128]	@ movhi
	strh	r1, [r3, #130]	@ movhi
	ldr	fp, .L81+8
	ldrh	r1, [r4, #48]
	ldr	r5, .L81+12
	ldr	r3, .L81+16
	strh	r1, [fp]	@ movhi
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L81+20
	ldr	r10, .L81+24
	ldr	r9, .L81+28
	ldr	r8, .L81+32
	ldr	r7, .L81+36
.L71:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L72:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L72
.L74:
	.word	.L77
	.word	.L76
	.word	.L75
	.word	.L72
	.word	.L73
.L73:
	mov	lr, pc
	bx	r7
	b	.L71
.L75:
	mov	lr, pc
	bx	r8
	b	.L71
.L76:
	mov	lr, pc
	bx	r9
	b	.L71
.L77:
	mov	lr, pc
	bx	r10
	b	.L71
.L82:
	.align	2
.L81:
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
	.comm	score,4,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	NOTES,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
