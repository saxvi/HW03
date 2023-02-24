#include "game.h"
#include "gba.h"
#include "sound.h"

// structs on da screen
PLAYER player;
OBST obstacle;
DOT laser;
DOT powerup;

// utility 
OBST obstacles[numObstacles];
int spawned;
int t;

// background vars
int lineY = 10;
int oldlineY;
int lineyvel = 1;


//score
extern int score;
extern char temp;

// initialize game
void initGame() {

    score = 0;

    initPlayer();
    initLaser();
    initObst();
    initPowerup();
}

// initialize player struct
void initPlayer() {
    player.x = 100;
    player.y = 101;
    player.oldx = player.x;
    player.oldy = player.y;
    player.xvel = 0;
    player.yvel = 0;
    player.height = 20;
    player.width = 15;
    player.color = DANGERCAT;
    player.stripes = DANGERSTRIPE;
    player.powerup = 0;
}

// initialize laser struct
void initLaser() {
    laser.x = 120;
    laser.y = 30;
    laser.oldx = laser.x;
    laser.oldy = laser.y;
    laser.height = 3;
    laser.width = 1;
    laser.color = RED;
}

void initPowerup() {
    powerup.x = borderWidth + (((rand() % 3) + 1) * 41);
    powerup.y = 20;
    powerup.oldx = powerup.x;
    powerup.oldy = powerup.y;
    powerup.yvel = 1;
    powerup.height = 5;
    powerup.width = 5;
    powerup.color = TEAL;
    powerup.show = 0;
}

// initialize obstacle struct
void initObst() {
    for (int i = 0; i < numObstacles; i++) {
        obstacles[i].width = 41;
        obstacles[i].height = 35;
        obstacles[i].active = 1;
        obstacles[i].yvel = (rand() % 4) + 1;
        obstacles[i].x = borderWidth + (bufferWidth * i) + (41 * i);
        obstacles[i].y = (0);

        int colorPicker = rand() % 3;
        switch (colorPicker) {
            case 0:
                obstacles[i].color = FOREST;
                break;
            case 1:
                obstacles[i].color = CADILLAC;
                break;
            case 2:
                obstacles[i].color = VIORED;
                break;
        }
    }
}

// updating game
void updateGame() {

    for (int i = 0; i < numObstacles; i++) {
        updateObst(&obstacles[i]);
    }

    updatePlayer();
    if (!(player.powerup)) {
        updatePowerup();
    }

    // if (score > 0) {
    //     if (!spawned) {
    //         newObst();
    //         spawned = 1;
    //     }
    // } else {
    //     spawned = 0;
    // }

    updateBG();
}

// update player struct
void updatePlayer() {

    // movement and buttons
    if (BUTTON_HELD(BUTTON_LEFT) && (player.x - 1 > 52)) {
        player.xvel = -3;
    }
    else if (BUTTON_HELD(BUTTON_RIGHT) && (player.x + player.width < 52 + floorWidth - 1)) {
        player.xvel = 3;
    } else {
        player.xvel = 0;
    }

    // if player collects the powerup, return to original y-location 
    if (collision(player.x, player.y, player.width, player.height, powerup.x, powerup.y, powerup.width, powerup.height)) {
        player.yvel = -3;
        player.color = CAT;
        player.stripes = STRIPE;
    }

    if (player.y >= 100) {
        player.color = DANGERCAT;
        player.stripes = DANGERSTRIPE;

    }

    // lose if player is pushed off (collides with) the bottom of the screen 
    if (player.y > 160) {
        REG_SND2CNT = DMG_ENV_VOL(5) |
                            DMG_STEP_TIME(3);
        REG_SND2FREQ = NOTE_C4 | SND_RESET;
        temp = score;
        score = -1;
    }

    // updating player position 
    player.oldx = player.x;
    player.x += player.xvel;
    player.oldy = player.y;
    player.y += player.yvel;

    // boundary
    if (player.y <= 100) {
        player.yvel = 0;
    }
}

void updatePowerup() {
    
        powerup.oldx = powerup.x;
        powerup.oldy = powerup.y;
        powerup.y += 2;

        if (player.y > 100) {
            drawRect(powerup.x, powerup.y, powerup.width, powerup.height, powerup.color);
        }
        
        if (collision(powerup.x, powerup.y, powerup.width, powerup.height, player.x, player.y, player.width, player.height)) {
            drawRect(powerup.x, powerup.y, powerup.width, powerup.height, BRULEE);
        }

        if (powerup.y == 162) {
            powerup.y = 0;
            powerup.x -= 41;
        }

        if (powerup.x < 52) {
            powerup.x = borderWidth + (((rand() % 3) + 1) * 41);
        }
}

void updateLaser() {

    // move back and forth in middle lane
    if (laser.x <= 110) {
        laser.xvel = 1;
    }
    if (laser.x + laser.height >= 130) {
        laser.xvel = -1;
    }

    // update position based on speed
    laser.oldx = laser.x;
    laser.x += laser.xvel;
}

// updates obstacles
void updateObst(OBST* o) {

    // update position
    o->oldx = o->x;
    o->oldy = o->y;
    o->y += o->yvel;

    if (collision(o -> x, o -> y, o -> width, 1, 52, 160, 137, 1)) { // if obst hit the bottom of the screen

        // add a point for every obst passed
        REG_SND2CNT = DMG_ENV_VOL(2) |
                      DMG_STEP_TIME(2);
        REG_SND2FREQ = NOTE_G5 | SND_RESET;
        score++;

    
        // respawn obst at top of screen
        o -> y = 0;
        o -> yvel = (rand() % 2) + 1;

        
    }


    if (collision(player.x, player.y, player.width, player.height, o -> x, o -> y, o -> width, o->height)) {
        player.y += o->yvel;
    }    
}

// updates background
void updateBG() {

    lineY += lineyvel;
    oldlineY = lineY;

    if (lineY > SCREENHEIGHT) {
        lineY = 0;
    }
}

// draw the game!
void drawGame() {
    
    for (int i = 0; i < numObstacles; i++) {
        drawObst(&obstacles[i]);
    }

    drawBG();

    drawPlayer();

    drawPowerup();

    drawLaser();
    waitForVBlank();

}

// draw player
void drawPlayer() {
    drawRect(player.oldx, player.oldy, player.width, player.height, BRULEE);
    
    drawRect(player.x, player.y, player.width, player.height, player.color);

    // adding stripes
    drawRect(player.x + 1, player.y, 3, 4, player.stripes);
    drawRect(player.x + 11, player.y, 3, 3, player.stripes);
    drawRect(player.x + 13, player.y + 3, 1, 1, player.stripes);
    drawRect(player.x + 6, player.y + 3, 3, 3, player.stripes);
    setPixel(player.x + 7, player.y + 5, player.color);
    drawRect(player.x + 4, player.y + 9, 7, 3 ,player.stripes);
    drawRect(player.x + 4, player.y + 10, 7, 1, player.color);
    setPixel(player.x + 3, player.y + 10, player.stripes);
    setPixel(player.x + 11, player.y + 10, player.stripes);
    setPixel(player.x + 3, player.y + 12, player.stripes);
    setPixel(player.x + 11, player.y + 12, player.stripes);
    setPixel(player.x + 2, player.y + 13, player.stripes);
    drawRect(player.x + 5, player.y + 13, 3, 1, player.stripes);
    drawRect(player.x + 3, player.y + 14, 1, 2, player.stripes);
    setPixel(player.x + 12, player.y + 13, player.stripes);
    drawRect(player.x + 6, player.y + 17, 1, 3, player.stripes);
    drawRect(player.x + 7, player.y + 16, 1, 2, player.stripes);
    drawRect(player.x + 9, player.y + 16, 1, 3, player.stripes);
    setPixel(player.x + 8, player.y + 19, player.stripes);
    setPixel(player.x + 8, player.y + 15, player.stripes);
    setPixel(player.x + 9, player.y + 14, player.stripes);
    setPixel(player.x + 10, player.y + 15, player.stripes);



    

    // sculpting the cat
    drawRect(player.x, player.y, 1, 12, BRULEE);
    drawRect(player.x + 1, player.y , 1, 1, BRULEE);
    drawRect(player.x + 1, player.y + 6, 1, 4, BRULEE);
    drawRect(player.x + 2, player.y + 8, 1, 1, BRULEE);
    drawRect(player.x, player.y + 17, 1, 3, BRULEE);
    drawRect(player.x + 1, player.y + 19, 2, 1, BRULEE);
    drawRect(player.x + 3, player.y, 9, 1, BRULEE);
    drawRect(player.x + 4, player.y + 1, 7, 1, BRULEE);
    drawRect(player.x + 5, player.y + 2, 5, 1, BRULEE);
    drawRect(player.x + 14, player.y, 1, 12, BRULEE);
    drawRect(player.x + 13, player.y + 6, 1, 4, BRULEE);
    drawRect(player.x + 13, player.y, 1, 1, BRULEE);
    drawRect(player.x + 12, player.y + 8, 1, 1, BRULEE);
    drawRect(player.x + 14, player.y + 17, 1 ,3, BRULEE);
    drawRect(player.x + 12, player.y + 19, 2, 1, BRULEE);

}

void drawPowerup() {
    drawRect(powerup.oldx, powerup.oldy - 1, powerup.width, powerup.height, BRULEE);
    drawRect(powerup.x, powerup.y, powerup.width, powerup.height, powerup.color);
}

// draw laser
void drawLaser() {
    drawRect(laser.oldx - 1, laser.oldy - 1, laser.height, laser.height, BRULEE);

    drawRect(laser.x - 1, laser.y, laser.height, laser.width, laser.color);
    drawRect(laser.x, laser.y - 1, laser.width, laser.height, laser.color);
}

void drawObst(OBST* o) {
    for (int i = 0; i < numObstacles; i++) {
        drawRect(o->x, o -> oldy, o -> width, o -> height, BRULEE);
        drawRect(o -> x, o -> y, o -> width, o -> height, o -> color);
    }
}

drawBG() {
    // big shapes
    // drawRect(52, 0, floorWidth, SCREENHEIGHT, BRULEE);
    // drawRect(0, 0, borderWidth, SCREENHEIGHT, BROWN);
    // drawRect(52 + floorWidth, 0, borderWidth - 1, SCREENHEIGHT, BROWN);

    // details
    drawRect(52, lineY, floorWidth, 1, TAN);
    drawRect(52, oldlineY - 1, floorWidth, 1, BRULEE);

    drawRect(52 + 41, 0, 7, SCREENHEIGHT, PEENK);
    drawRect(52 + 41 + 7 + 41, 0, 7, SCREENHEIGHT, PEENK);

 }

//
void newObst() {
    spawned = 1;
    for (int i = 0; i < numObstacles; i++) {
        if (obstacles[i].active == 0) {
            obstacles[i].active = 1; 
        }
        break;
    }
}