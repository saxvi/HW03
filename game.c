#include "game.h"
#include "gba.h"
#include "sound.h"

// structs on da screen
PLAYER player;
OBST obstacle;

//score
int score;
int spawned;

// initialize game
void initGame() {

    score = 0;

    //initLaser();
    initPlayer();
    initObst();
}


// initialize player struct
void initPlayer() {
    player.x = 100;
    player.y = 100;
    player.oldx = player.x;
    player.oldy = player.y;
    player.xvel = 0;
    player.height = 31;
    player.width = 41;
    player.color = BLUE;
}

// initialize obstacle struct
void initObst() {
    for (int i = 0; i < numObstacles; i++) {
        obstacles[i].width = 41;
        obstacles[i].height = 41;
        obstacles[i].active = 1;
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

    for (int i = 0; i < 3; i++) {
        obstacles[i].y = (obstacles[i].height + (60 / i));
    }
}