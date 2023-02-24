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
.LC2:
	.ascii	"catch the laser!\000"
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r0, .L10
	sub	sp, sp, #16
	ldr	r3, .L10+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L10+8
	ldm	r3, {r0, r1, r2}
	add	r3, sp, #4
	stmia	r3!, {r0, r1}
	mov	r5, #60
	mov	ip, #80
	mov	r4, #0
	ldr	r9, .L10+12
	strh	r2, [r3]	@ movhi
	ldr	r8, .L10+16
	ldr	r10, .L10+20
	ldr	r7, .L10+24
	add	r6, sp, #5
	b	.L5
.L9:
	ldrb	ip, [r6], #1	@ zero_extendqisi2
.L5:
	tst	r4, #1
	mov	r2, ip
	mov	r0, r5
	ldr	r3, .L10+28
	mov	r1, #70
	movne	r3, r10
	mov	lr, pc
	bx	r9
	add	r4, r4, #1
	mov	r2, r7
	mov	r1, #90
	mov	r0, #70
	ldr	r3, .L10+32
	mov	lr, pc
	bx	r8
	cmp	r4, #10
	add	r5, r5, #12
	bne	.L9
	mov	r3, #0
	ldr	r1, .L10+36
	ldr	r2, .L10+40
	str	r3, [r1]
	str	r3, [r2]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	11718
	.word	fillScreen
	.word	.LC1
	.word	drawChar
	.word	drawString
	.word	14937
	.word	.LC2
	.word	18137
	.word	14966
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
	ldr	lr, .L14
	strh	lr, [r3]	@ movhi
	strh	r0, [r3, #132]	@ movhi
	strh	ip, [r3, #128]	@ movhi
	ldr	r0, .L14+4
	strh	r1, [r3, #130]	@ movhi
	ldr	r1, .L14+8
	ldrh	r0, [r0, #48]
	ldr	r3, .L14+12
	ldr	lr, [sp], #4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L15:
	.align	2
.L14:
	.word	1027
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose.part.0, %function
lose.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L18
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L19:
	.align	2
.L18:
	.word	buttons
	.size	lose.part.0, .-lose.part.0
	.set	win.part.0,lose.part.0
	.section	.rodata.str1.4
	.align	2
.LC3:
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
	ldr	r0, .L22
	sub	sp, sp, #8
	ldr	r3, .L22+4
	mov	lr, pc
	bx	r3
	ldr	r2, .L22+8
	mov	r3, #160
	str	r2, [sp]
	mov	r1, #0
	mov	r2, #138
	mov	r0, #52
	ldr	r4, .L22+12
	mov	lr, pc
	bx	r4
	mov	r1, #31
	mov	r0, #2
	ldr	r3, .L22+16
	ldr	r2, .L22+20
	ldr	r4, .L22+24
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L22+28
	str	r2, [r3]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	5321
	.word	fillScreen
	.word	18137
	.word	drawRect
	.word	11718
	.word	.LC3
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
	ldr	r2, .L31
	ldr	r3, [r2]
	push	{r4, lr}
	add	r3, r3, #1
	ldr	r1, .L31+4
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	ldr	r3, .L31+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L24
	ldr	r3, .L31+12
	ldrh	r0, [r3]
	ands	r0, r0, #8
	beq	.L30
.L24:
	pop	{r4, lr}
	bx	lr
.L30:
	ldr	r3, .L31+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+20
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L31+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L32:
	.align	2
.L31:
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
.LC4:
	.ascii	"game paused!\000"
	.align	2
.LC5:
	.ascii	"press start to continue\000"
	.align	2
.LC6:
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
	ldr	r0, .L35
	ldr	r3, .L35+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L35+8
	mov	r1, #38
	mov	r0, #90
	ldr	r3, .L35+12
	ldr	r2, .L35+16
	mov	lr, pc
	bx	r4
	mov	r1, #58
	mov	r0, #60
	ldr	r3, .L35+20
	ldr	r2, .L35+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L35+28
	mov	r1, #68
	mov	r0, #70
	ldr	r3, .L35+32
	mov	lr, pc
	bx	r4
	ldr	r3, .L35+36
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L35+40
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L36:
	.align	2
.L35:
	.word	11718
	.word	fillScreen
	.word	drawString
	.word	18137
	.word	.LC4
	.word	14937
	.word	.LC5
	.word	.LC6
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
	ldr	r4, .L49
	ldr	r3, .L49+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L38
	ldr	r2, .L49+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L47
.L38:
	tst	r3, #4
	beq	.L37
	ldr	r3, .L49+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L48
.L37:
	pop	{r4, lr}
	bx	lr
.L48:
	pop	{r4, lr}
	b	goToStart
.L47:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L38
.L50:
	.align	2
.L49:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC7:
	.ascii	"you lost!\000"
	.align	2
.LC8:
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
	ldr	r5, .L53
	ldr	r0, .L53+4
	ldr	r3, .L53+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L53+12
	mov	r3, r5
	mov	r1, #48
	mov	r0, #85
	ldr	r2, .L53+16
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #68
	mov	r0, #85
	ldr	r2, .L53+20
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #68
	mov	r0, #125
	ldr	r2, .L53+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L53+28
	mov	r1, #88
	mov	r0, #45
	ldr	r3, .L53+32
	mov	lr, pc
	bx	r4
	ldr	r3, .L53+36
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L53+40
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L54:
	.align	2
.L53:
	.word	14937
	.word	11718
	.word	fillScreen
	.word	drawString
	.word	.LC7
	.word	.LC3
	.word	hscore
	.word	.LC8
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
	ldr	r3, .L58
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L58+4
	ldrh	r3, [r3]
	tst	r3, #8
	popne	{r4, lr}
	bne	lose.part.0
.L55:
	pop	{r4, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	waitForVBlank
	.word	oldButtons
	.size	lose, .-lose
	.section	.rodata.str1.4
	.align	2
.LC9:
	.ascii	"you win!\000"
	.align	2
.LC10:
	.ascii	"you caught the laser!\000"
	.align	2
.LC11:
	.ascii	"obstacles passed: \000"
	.align	2
.LC12:
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
	ldr	r3, .L62
	ldr	r6, .L62+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L62+8
	ldr	r3, .L62+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L62+16
	ldr	r5, .L62+20
	mov	r3, r6
	mov	r1, #48
	mov	r0, #85
	ldr	r2, .L62+24
	mov	lr, pc
	bx	r4
	mov	r3, r6
	mov	r1, #60
	mov	r0, #50
	ldr	r2, .L62+28
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #78
	mov	r0, #60
	ldr	r2, .L62+32
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #78
	mov	r0, #164
	ldr	r2, .L62+36
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L62+40
	mov	r1, #108
	mov	r0, #43
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L62+44
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L63:
	.align	2
.L62:
	.word	waitForVBlank
	.word	14937
	.word	11718
	.word	fillScreen
	.word	drawString
	.word	18137
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	hscore
	.word	.LC12
	.word	state
	.size	goToWin, .-goToWin
	.section	.rodata.str1.4
	.align	2
.LC13:
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L78
	sub	sp, sp, #16
	mov	lr, pc
	bx	r3
	ldr	r3, .L78+4
	ldr	r4, .L78+8
	ldr	r2, [r3, #4]
	ldr	r1, .L78+12
	ldr	r0, .L78+16
	ldr	r5, .L78+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L78+24
	ldr	r0, .L78+16
	mov	lr, pc
	bx	r3
	ldr	r2, [r5]
	ldr	r1, .L78+12
	ldr	r0, .L78+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L78+32
	ldr	r1, .L78+12
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r0, .L78+36
	mov	lr, pc
	bx	r4
	ldr	r2, .L78+40
	mov	r3, #8
	mov	r1, #41
	mov	r0, #2
	str	r2, [sp]
	ldr	r4, .L78+44
	mov	r2, #50
	mov	lr, pc
	bx	r4
	ldr	r6, .L78+48
	mov	r1, #41
	mov	r0, #2
	ldr	r3, .L78+52
	ldr	r2, .L78+28
	ldr	r4, .L78+56
	mov	lr, pc
	bx	r6
	ldr	r3, .L78+60
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L65
	ldr	r3, .L78+64
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L76
.L65:
	ldr	r3, [r5]
	cmn	r3, #1
	beq	.L77
.L66:
	ldrh	r3, [r4]
	tst	r3, #1
	beq	.L67
	ldr	r3, .L78+64
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L67
.L68:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	goToWin
.L67:
	ldr	r3, .L78+68
	add	r1, r3, #24
	ldr	r2, [r3, #4]
	ldm	r1, {r1, ip}
	ldr	r3, [r3]
	ldr	r0, .L78+72
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r0, #24
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r4, .L78+76
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L68
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L77:
	bl	goToLose
	b	.L66
.L76:
	bl	goToPause
	b	.L65
.L79:
	.align	2
.L78:
	.word	updateGame
	.word	powerup
	.word	sprintf
	.word	.LC13
	.word	temp2
	.word	score
	.word	mgba_printf
	.word	buffer
	.word	temp
	.word	hscore
	.word	5321
	.word	drawRect
	.word	drawString
	.word	11718
	.word	oldButtons
	.word	drawGame
	.word	buttons
	.word	laser
	.word	player
	.word	collision
	.size	game, .-game
	.section	.rodata.str1.4
	.align	2
.LC14:
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
	ldr	r3, .L95
	mov	lr, pc
	bx	r3
	ldr	r0, .L95+4
	ldr	r3, .L95+8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r0, #2
	mov	lr, #128
	mvn	ip, #170
	mov	r1, #0
	ldr	r4, .L95+12
	ldr	r2, .L95+16
	strh	r4, [r3]	@ movhi
	strh	lr, [r3, #132]	@ movhi
	strh	ip, [r3, #128]	@ movhi
	strh	r0, [r3, #130]	@ movhi
	mov	r10, r2
	ldr	r5, .L95+20
	ldrh	r2, [r2, #48]
	ldr	r6, .L95+24
	ldr	r4, .L95+28
	ldr	r3, .L95+32
	strh	r2, [r5]	@ movhi
	strh	r1, [r6]	@ movhi
	ldr	r9, .L95+36
	mov	lr, pc
	bx	r3
	ldr	r8, .L95+40
	ldr	r0, [r4]
	ldr	fp, .L95+44
	ldr	r7, .L95+48
.L89:
	ldr	r1, [r9]
	mov	lr, pc
	bx	r8
	cmp	r1, #0
	beq	.L94
.L81:
	ldrh	r2, [r5]
	strh	r2, [r6]	@ movhi
	ldr	r3, [r7]
	ldrh	r1, [r10, #48]
	strh	r1, [r5]	@ movhi
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L82
.L84:
	.word	.L88
	.word	.L87
	.word	.L86
	.word	.L85
	.word	.L83
.L83:
	ldr	r3, .L95+52
	mov	lr, pc
	bx	r3
.L82:
	ldr	r0, [r4]
	add	r0, r0, #1
	str	r0, [r4]
	b	.L89
.L87:
	ldr	r3, .L95+56
	mov	lr, pc
	bx	r3
	b	.L82
.L88:
	ldr	r3, .L95+60
	mov	lr, pc
	bx	r3
	b	.L82
.L85:
	tst	r2, #8
	beq	.L82
	ldr	r3, .L95+64
	mov	lr, pc
	bx	r3
	b	.L82
.L86:
	ldr	r3, .L95+68
	mov	lr, pc
	bx	r3
	b	.L82
.L94:
	mov	lr, pc
	bx	fp
	b	.L81
.L96:
	.align	2
.L95:
	.word	mgba_open
	.word	.LC14
	.word	mgba_printf
	.word	1027
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	.LANCHOR0
	.word	goToStart
	.word	.LANCHOR1
	.word	__aeabi_idivmod
	.word	updateLaser
	.word	state
	.word	lose
	.word	game
	.word	start
	.word	win.part.0
	.word	pause
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
	ldr	r3, .L99
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L100:
	.align	2
.L99:
	.word	oldButtons
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
