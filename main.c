#include "gba.h"
#include "print.h"
#include "font.h"
#include "game.h"
#include "sound.h"
#include <stdio.h>
#include <stdlib.h>


unsigned short oldButtons;
unsigned short buttons;

extern int t = 0;
int skipFrames = 2;

int score;
int highscore;

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
char temp2[1];

char buffer[41];
char hscore[41];
char temp;

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
void goToWin();
void win();

int main() {

    mgba_open();
    mgba_printf("debugging ok");

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
            case WIN:
                win();
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
    drawString(70, 90, "catch the laser!", COLOR(22, 19, 14));

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
    drawRect(52, 0, 138, SCREENHEIGHT, BRULEE);
    drawString(2, 31, "score: ", FOREST);
    state = GAME;
}

// runs game state
void game() {
    updateGame();
    sprintf(temp2, "%d", powerup.y);
    mgba_printf(temp2);

    sprintf(buffer, "%d", score);
    sprintf(hscore, "%d", temp);

    drawRect(2, 41, 50, 8, BROWN);
    drawString(2, 41, buffer, FOREST);

    drawGame();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

    if (score == -1) {
        goToLose();
    }

  // for debuggung only no cheating lol //
    if (/*BUTTON_PRESSED(BUTTON_A) || */(collision(player.x, player.y, player.width, player.height, laser.x, laser.y, laser.width, laser.height))) {
        goToWin();
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
    fillScreen(FOREST);
    drawString(85, 48, "you lost!", PEENK);
    drawString(85, 68, "score: ", PEENK);
    drawString(125, 68, hscore, PEENK);

    drawString(45, 88, "press start to try again", BRULEE);
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

// set up win
void goToWin() {
    waitForVBlank();
    fillScreen(FOREST);

    drawString(85, 48, "you win!", PEENK);
    drawString(50, 60, "you caught the laser!", PEENK);

    drawString(60, 78, "obstacles passed: ", BRULEE);
    drawString(164, 78, hscore, BRULEE);

    drawString(43, 108, "press start to play again", BRULEE);
    state = WIN;
}

// runs win state
void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}