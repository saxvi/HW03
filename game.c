#include "game.h"
#include "gba.h"
#include "sound.h"

// structs on da screen
PLAYER player;
OBST obstacle;
DOT laser;

// utility 
OBST obstacles[numObstacles];

//score
int score;
int spawned;

// initialize game
void initGame() {

    score = 0;

    initPlayer();
    initLaser();
    initObst();
}


// initialize player struct
void initPlayer() {
    player.x = 100;
    player.y = 100;
    player.oldx = player.x;
    player.oldy = player.y;
    player.xvel = 0;
    player.yvel = 0;
    player.height = 31;
    player.width = 41;
    player.color = BLUE;
    player.powerup = 0;
}

// initialize laser struct
void initLaser() {
    laser.x = 68;
    laser.y = 10;
    laser.oldx = laser.x;
    laser.height = 3;
    laser.width = 1;
    laser.color = RED;
}

// initialize obstacle struct
void initObst() {
    for (int i = 0; i < numObstacles; i++) {
        obstacles[i].width = 41;
        obstacles[i].height = 41;
        obstacles[i].active = 1;
        obstacles[i].yvel = -1;
        obstacles[i].x = borderWidth + (bufferWidth * i) + (obstacles[i].width * i);

        int colorPicker = rand() % 4;
        switch (colorPicker) {
            case 0:
                obstacles[i].color = FOREST;
                break;
            case 1:
                obstacles[i].color = CADILLAC;
                break;
            case 2:
                obstacles[i].color = PEENK;
                break;
            case 3:
                obstacles[i].color = PORTAGE;
                break;
        }
    }

    for (int i = 0; i < 1; i++) {
        obstacles[i].y = 30;
    }
    for (int i = 1; i < 3; i++) {
        obstacles[i].y = (i - 1) * obstacles[i].height;
    }
}

// updating game
void updateGame() {

    updatePlayer();
    updateLaser();

    for (int i = 0; i < numObstacles; i++) {
        OBST *o = &obstacles[i];
        updateObst(o);
    }

    if (score > 0) {
        if (!spawned) {
            newObst();
            spawned = 1;
        }
    } else {
        spawned = 0;
    }

    updateBG();
}

// update player struct
void updatePlayer() {

    // movement and buttons
    if (player.powerup == 0) { // standard movement
        if (BUTTON_HELD(BUTTON_LEFT) && (player.x - 1 > 0)) {
            player.xvel = -3;
        }
        else if (BUTTON_HELD(BUTTON_RIGHT) && (player.x + player.width < SCREENWIDTH - 1)) {
            player.xvel = 3;
        } else {
            player.xvel = 0;
        }
    } else if (player.powerup == 1) { // fast moving, tap instead of hold
                if (BUTTON_PRESSED(BUTTON_LEFT) && (player.x - 1 > 0)) {
            player.xvel = -(41 + bufferWidth);
        }
        else if (BUTTON_PRESSED(BUTTON_RIGHT) && (player.x + player.width < SCREENWIDTH - 1)) {
            player.xvel = (41 + bufferWidth);
        } else {
            player.xvel = 0;
        }
    }

    // lose if player is pushed off (collides with) the bottom of the screen 
    if (collision(player.x, player.y, player.width, player.height, 52, 160, 137, 1)) {
        REG_SND2CNT = DMG_ENV_VOL(5) |
                            DMG_STEP_TIME(7);
        REG_SND2FREQ = NOTE_C4 | SND_RESET;
        score = -1;
    }

    // updating player position 
    player.oldx = player.x;
    player.x += player.xvel;
    player.oldy = player.y;
    player.y += player.yvel;
}

void updateLaser() {

    // move back and forth in middle lane
    if (laser.x <= 64) {
        laser.xvel = 1;
    }
    if (laser.x + laser.height >= 72) {
        laser.xvel = -1;
    }

    // update position based on speed
    laser.oldx = laser.x;
    laser.x += laser.xvel;
}

// updates obstacles
void updateObst(OBST* o) {
    if (o -> active) {
        if (collision(player.x, player.y, player.width, player.height, o -> x, o -> y, o -> width, o -> height)) {
            player.y--;
        }
        // if player passes obstacle, increment score
        if (player.y > (o -> y + o -> height)) {
            REG_SND2CNT = DMG_ENV_VOL(2) |
                            DMG_STEP_TIME(5);
            REG_SND2FREQ = NOTE_E4 | SND_RESET;
            score++;
        }

        // update position
        o->oldy = o->y;
        o->x += o->yvel;

        // if (collision(o -> x, o -> y, o -> width, o -> height, 52, 160, 137, 1)) {
        //     o -> y = 0;
        // }
    }
}

// draw the game!
void drawGame() {
    drawPlayer();
    drawBall();
    for (int i = 0; i < numObstacles; i++) {
        drawBlocks(&obstacles[i]);
    }
}