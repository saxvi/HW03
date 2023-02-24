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
	mov	r5, #60
	mov	r3, #80
	mov	r4, #0
	ldr	r7, .L9+12
	strh	r2, [ip]	@ movhi
	ldr	r9, .L9+16
	ldr	r8, .L9+20
	add	r6, sp, #5
	b	.L5
.L8:
	ldrb	r3, [r6], #1	@ zero_extendqisi2
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
	cmp	r4, #10
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
	sub	sp, sp, #8
	ldr	r3, .L17+4
	mov	lr, pc
	bx	r3
	ldr	r2, .L17+8
	mov	r3, #160
	str	r2, [sp]
	mov	r1, #0
	mov	r2, #137
	mov	r0, #52
	ldr	r4, .L17+12
	mov	lr, pc
	bx	r4
	mov	r1, #31
	mov	r0, #2
	ldr	r3, .L17+16
	ldr	r2, .L17+20
	ldr	r4, .L17+24
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L17+28
	str	r2, [r3]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	3275
	.word	fillScreen
	.word	18137
	.word	drawRect
	.word	11718
	.word	.LC2
	.word	drawString
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
	ldrh	r0, [r3]
	ands	r0, r0, #8
	beq	.L25
.L19:
	pop	{r4, lr}
	bx	lr
.L25:
	ldr	r3, .L26+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L26+20
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L26+24
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
	.word	time
	.word	srand
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
	mov	r1, #38
	mov	r0, #90
	ldr	r3, .L30+12
	ldr	r2, .L30+16
	mov	lr, pc
	bx	r4
	mov	r1, #58
	mov	r0, #60
	ldr	r3, .L30+20
	ldr	r2, .L30+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L30+28
	mov	r1, #68
	mov	r0, #70
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
	mov	r1, #48
	mov	r0, #85
	ldr	r2, .L48+16
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #68
	mov	r0, #85
	ldr	r2, .L48+20
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #68
	mov	r0, #125
	ldr	r2, .L48+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L48+28
	mov	r1, #88
	mov	r0, #45
	ldr	r3, .L48+32
	mov	lr, pc
	bx	r4
	ldr	r3, .L48+36
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L48+40
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L49:
	.align	2
.L48:
	.word	14937
	.word	11718
	.word	fillScreen
	.word	drawString
	.word	.LC6
	.word	.LC2
	.word	hscore
	.word	.LC7
	.word	18137
	.word	waitForVBlank
	.word	state
	.size	goToLose, .-goToLose
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
	ldr	r3, .L57
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L50
	ldr	r3, .L57+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L56
.L50:
	pop	{r4, lr}
	bx	lr
.L56:
	pop	{r4, lr}
	b	goToStart
.L58:
	.align	2
.L57:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.section	.rodata.str1.4
	.align	2
.LC8:
	.ascii	"you win!\000"
	.align	2
.LC9:
	.ascii	"you caught the laser!\000"
	.align	2
.LC10:
	.ascii	"obstacles passed: \000"
	.align	2
.LC11:
	.ascii	"press start to play again\000"
	.text
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r6, .L61
	ldr	r0, .L61+4
	ldr	r3, .L61+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L61+12
	ldr	r5, .L61+16
	mov	r3, r6
	mov	r1, #48
	mov	r0, #85
	ldr	r2, .L61+20
	mov	lr, pc
	bx	r4
	mov	r3, r6
	mov	r1, #60
	mov	r0, #50
	ldr	r2, .L61+24
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #78
	mov	r0, #55
	ldr	r2, .L61+28
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #90
	mov	r0, #125
	ldr	r2, .L61+32
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #108
	mov	r0, #40
	ldr	r2, .L61+36
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	14937
	.word	11718
	.word	fillScreen
	.word	drawString
	.word	18137
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	hscore
	.word	.LC11
	.size	goToWin, .-goToWin
	.section	.rodata.str1.4
	.align	2
.LC12:
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
	ldr	r3, .L74
	sub	sp, sp, #20
	mov	lr, pc
	bx	r3
	ldr	r3, .L74+4
	ldr	r4, .L74+8
	ldr	r2, [r3, #4]
	ldr	r1, .L74+12
	ldr	r0, .L74+16
	ldr	r5, .L74+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L74+24
	ldr	r0, .L74+16
	mov	lr, pc
	bx	r3
	ldr	r2, [r5]
	ldr	r1, .L74+12
	ldr	r0, .L74+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L74+32
	ldr	r1, .L74+12
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r0, .L74+36
	mov	lr, pc
	bx	r4
	ldr	r2, .L74+40
	mov	r3, #8
	mov	r1, #41
	mov	r0, #2
	str	r2, [sp]
	ldr	r4, .L74+44
	mov	r2, #50
	mov	lr, pc
	bx	r4
	mov	r1, #41
	mov	r0, #2
	ldr	r3, .L74+48
	ldr	r2, .L74+28
	ldr	r4, .L74+52
	mov	lr, pc
	bx	r4
	ldr	r3, .L74+56
	mov	lr, pc
	bx	r3
	ldr	r3, .L74+60
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L64
	ldr	r3, .L74+64
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L71
.L64:
	ldr	r3, [r5]
	cmn	r3, #1
	beq	.L72
.L65:
	ldr	r3, .L74+68
	add	r1, r3, #24
	ldr	r2, [r3, #4]
	ldm	r1, {r1, ip}
	ldr	r3, [r3]
	ldr	r0, .L74+72
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r0, #24
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r4, .L74+76
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L73
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L73:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	b	goToWin
.L72:
	bl	goToLose
	b	.L65
.L71:
	bl	goToPause
	b	.L64
.L75:
	.align	2
.L74:
	.word	updateGame
	.word	powerup
	.word	sprintf
	.word	.LC12
	.word	temp2
	.word	score
	.word	mgba_printf
	.word	buffer
	.word	temp
	.word	hscore
	.word	3275
	.word	drawRect
	.word	11718
	.word	drawString
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	laser
	.word	player
	.word	collision
	.size	game, .-game
	.section	.rodata.str1.4
	.align	2
.LC13:
	.ascii	"debugging ok\000"
	.global	__aeabi_idivmod
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
	push	{r4, r7, fp, lr}
	ldr	r3, .L87
	mov	lr, pc
	bx	r3
	ldr	r0, .L87+4
	ldr	r3, .L87+8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r0, #2
	mov	lr, #128
	mvn	ip, #170
	mov	r1, #0
	ldr	r4, .L87+12
	ldr	r2, .L87+16
	strh	r4, [r3]	@ movhi
	strh	lr, [r3, #132]	@ movhi
	strh	ip, [r3, #128]	@ movhi
	strh	r0, [r3, #130]	@ movhi
	mov	r10, r2
	ldr	r5, .L87+20
	ldrh	r2, [r2, #48]
	ldr	r6, .L87+24
	ldr	r4, .L87+28
	ldr	r3, .L87+32
	strh	r2, [r5]	@ movhi
	strh	r1, [r6]	@ movhi
	ldr	r9, .L87+36
	mov	lr, pc
	bx	r3
	ldr	r8, .L87+40
	ldr	r0, [r4]
	ldr	r7, .L87+44
	ldr	fp, .L87+48
.L84:
	ldr	r1, [r9]
	mov	lr, pc
	bx	r8
	cmp	r1, #0
	beq	.L86
.L77:
	ldrh	r3, [r5]
	strh	r3, [r6]	@ movhi
	ldr	r3, [r7]
	ldrh	r2, [r10, #48]
	strh	r2, [r5]	@ movhi
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L78
.L80:
	.word	.L83
	.word	.L82
	.word	.L81
	.word	.L79
	.word	.L79
.L79:
	mov	lr, pc
	bx	fp
.L78:
	ldr	r0, [r4]
	add	r0, r0, #1
	str	r0, [r4]
	b	.L84
.L82:
	ldr	r3, .L87+52
	mov	lr, pc
	bx	r3
	b	.L78
.L83:
	ldr	r3, .L87+56
	mov	lr, pc
	bx	r3
	b	.L78
.L81:
	ldr	r3, .L87+60
	mov	lr, pc
	bx	r3
	b	.L78
.L86:
	ldr	r3, .L87+64
	mov	lr, pc
	bx	r3
	b	.L77
.L88:
	.align	2
.L87:
	.word	mgba_open
	.word	.LC13
	.word	mgba_printf
	.word	1027
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	.LANCHOR0
	.word	goToStart
	.word	.LANCHOR1
	.word	__aeabi_idivmod
	.word	state
	.word	lose
	.word	game
	.word	start
	.word	pause
	.word	updateLaser
	.size	main, .-main
	.text
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	lose
	.size	win, .-win
	.comm	temp,1,1
	.comm	hscore,41,4
	.comm	buffer,41,4
	.comm	temp2,1,4
	.comm	rSeed,4,4
	.comm	state,4,4
	.comm	highscore,4,4
	.comm	score,4,4
	.global	skipFrames
	.global	t
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	NOTES,2,2
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	skipFrames, %object
	.size	skipFrames, 4
skipFrames:
	.word	2
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	t, %object
	.size	t, 4
t:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
