#include "gba.h"
#include "font.h"

// Pointer to the start of video memory
volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

// Draws a rectangle in mode 3
void drawRect(int x, int y, int width, int height, unsigned short color) {
    for (int i = 0; i < height; i++) {
        int cnt = width | DMA_16 | DMA_SOURCE_FIXED;
        DMANow(3, &color, &videoBuffer[OFFSET(x, y, SCREENWIDTH)], cnt);
        y++;
    }
}

// Fills the screen in mode 3
void fillScreen(volatile unsigned short color) {
    volatile unsigned int temp = color | color << 16;
    int cnt = 19200 | DMA_32 | DMA_SOURCE_FIXED;
    DMANow(3, &temp, videoBuffer, cnt);
}

// Checks for collision between two rectangles
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2) {
    return y1 < y2 + height2 && y1 + height1 > y2 && x1 < x2 + width2 && x1 + width1 > x2;
}

// Waits until drawing pixel 0 of line 160
void waitForVBlank() {
    while (REG_VCOUNT >= 160);
    while (REG_VCOUNT < 160);
}

// Draws the specified character at the specified location in Mode 3
void drawChar(int x, int y, char ch, unsigned short color) {
    for (int c = 0; c < 6; c++) {
        for (int r = 0; r < 8; r++) {
            if (fontdata_6x8[(48 * ch + c + 6 * r)]) setPixel(x + c, y + r, color);
        }
    }
}

// Draws the specified string at the specified location in Mode 3
void drawString(int x, int y, char *str, unsigned short color) {
    while (*str) {
        drawChar(x, y, *str, color);
        str++;
        x += 6;
    }
}

// pointer to start of dma registers
DMA *dma = (DMA *)0x40000B0;

// begins a dma transfer using parameters
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {

    // clear cnt in the specified DMA channel
    dma[channel].cnt = 0;

    // set the src of the specified dma channel to the passed in src
    dma[channel].src = src;

    // set the dst of the specified dma channel to the passed in dst
    dma[channel].dst = dst;

    // set the cnt of the specified dma channel to the passed in cnt and turn the dma channel on
    dma[channel].cnt = cnt | DMA_ON;
}