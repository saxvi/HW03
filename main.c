#include "gba.h"
#include "print.h"

unsigned short oldButtons;
unsigned short buttons;

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
    }
}

// set up gba
void initialize() {

    REG_DISPCTL = MODE(3) | BG_ENABLE(2);

    buttons = REG_BUTTONS;
    oldButtons = 0;

    goToStart();
}

// set up start
void goToStart() {
    fillScreen();
}