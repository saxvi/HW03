#include "game.h"
#include "gba.h"
#include "sound.h"

// structs on da screen
PLAYER player;
OBST obstacle;

// initialize game
void initGame() {
    initPlayer();
    initObsts();
}