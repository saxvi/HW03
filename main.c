#include "gba.h"
#include "print.h"
#include "font.h"
#include "game.h"
#include "sound.h"
#include <stdio.h>
#include <stdlib.h>


unsigned short oldButtons;
unsigned short buttons;

int t = 0;
int skipFrames = 2;

int score;

// states
enum
{
    START,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;

// random
void srand();
int rSeed;

// text buffer
char buffer[41];

// prototypes
void initialize();

// state prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToLose();
void lose();

int main() {

    initialize();

    while (1) {
         if (t % skipFrames == 0) {
            updateLaser();
        }
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        // state machine
        switch (state) {
            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case LOSE:
                lose();
                break;
        }
        t++;
    }
}

// set up gba
void initialize() {

    REG_DISPCTL = MODE(3) | BG_ENABLE(2);

    REG_SOUNDCNT_X = SND_ENABLED;

    REG_SOUNDCNT_L = DMG_VOL_LEFT(5) |
                   DMG_VOL_RIGHT(5) |
                   DMG_SND1_LEFT |
                   DMG_SND1_RIGHT |
                   DMG_SND2_LEFT |
                   DMG_SND2_RIGHT |
                   DMG_SND3_LEFT |
                   DMG_SND3_RIGHT |
                   DMG_SND4_LEFT |
                   DMG_SND4_RIGHT;
    REG_SOUNDCNT_H = DMG_MASTER_VOL(2);
    
    buttons = REG_BUTTONS;
    oldButtons = 0;

    goToStart();
}

// set up start
void goToStart() {
    fillScreen(FOREST);
    char letters[10] = {'P', 'I', 'G', 'E', 'O', 'N', ' ', 'R', 'U', 'N'};
    unsigned short colors[2] = {BRULEE, PEENK};
    int col = 60;
    int spacing = 12;
    for (int i = 0; i < 10; i++) {
        if ((i % 2) == 0) {
            drawChar(col + (i * spacing), 70, letters[i], colors[0]);
        } else {
            drawChar(col + (i * spacing), 70, letters[i], colors[1]);
        }
    }

    state = START;
    rSeed = 0;
}

// runs start
void start() {

    rSeed++;

    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(time(NULL));
        goToGame();
        initGame();
    }
}

// set up game
void goToGame() {

    fillScreen(BROWN);
    drawRect(52, 0, 137, SCREENHEIGHT, BRULEE);
    drawString(2, 31, "score: ", FOREST);
    state = GAME;
}

// runs game state
void game() {
    updateGame();

    sprintf(buffer, "%d", score);
    waitForVBlank();

    drawRect(2, 41, 50, 8, BROWN);
    drawString(2, 41, buffer, FOREST);

    drawGame();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

    if (score == -1) {
        goToLose();
    }
}

// sets up pause state
void goToPause() {
    fillScreen(FOREST);
    drawString(90, 38, "game paused!", BRULEE);
    drawString(60, 58, "press start to continue", PEENK);
    drawString(70, 68, "press select to quit", LAVPINK);
    waitForVBlank();
    state = PAUSE;
}

// runs pause state
void pause() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

// set up lose
void goToLose() {
    fillScreen(PEENK);
    drawString(90, 18, "you lose!", PORTAGE);
    drawString(60, 28, "press start to try again", PORTAGE);
    waitForVBlank();
    state = LOSE;
}

// runs lose state
void lose() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}