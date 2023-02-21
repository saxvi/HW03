#include "gba.h"
#include "print.h"

unsigned short oldButtons;
unsigned short buttons;

int main() {
    REG_DISPCTL = MODE(3) | BG_ENABLE(2);

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;
    }
}