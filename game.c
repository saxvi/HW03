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

    initLaser();
    initPlayer();
    initObsts();
}