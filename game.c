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
    initObsts();
}


// initialize player struct
void initPlayer() {
    player.x = 100;
    player.y = 100;
    player.oldx = player.x;
    player.oldy = player.y;
    player.xvel = 0;
    player.height = 30;
    player.width = 30;
    player.color = BLUE;
}

// initialize obstacle struct
void initObst() {
    for (int i = 0; i < OBSTCOUNT, i++) {
        
    }    
}