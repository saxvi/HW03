# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1



typedef struct {
    int x;
    int y;
    int oldx;
    int oldy;
    int xvel;
    int yvel;
    int width;
    int height;
    unsigned short color;
    int powerup;
} PLAYER;


typedef struct {
    int x;
    int y;
    int oldx;
    int oldy;
    int yvel;
    int width;
    int height;
    unsigned short color;
    int active;
} OBST;


typedef struct {
    int x;
    int y;
    int xvel;
    int oldx;
    int width;
    int height;
    unsigned short color;
} DOT;
# 48 "game.h"
extern PLAYER player;
extern DOT laser;
extern OBST obstacles[4];
extern int score;


void initGame();
void initPlayer();
void initObst();
void updateGame();
void updatePlayer();
void updateObst(OBST* o);
void updateBG();
void drawGame();
void drawPlayer();
void drawObst(OBST* o);
void newObst();
# 2 "game.c" 2
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;






extern volatile unsigned short *videoBuffer;
# 36 "gba.h"
void waitForVBlank();


int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 73 "gba.h"
void drawRect(int x, int y, int width, int height, volatile unsigned short color);
void fillScreen(volatile unsigned short color);
void drawChar(int x, int y, char ch, unsigned short color);
void drawString(int x, int y, char *str, unsigned short color);
# 92 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 124 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 3 "game.c" 2
# 1 "sound.h" 1
# 75 "sound.h"
enum {
  REST = 0,
  NOTE_C2 =44,
  NOTE_CS2 =157,
  NOTE_D2 =263,
  NOTE_DS2 =363,
  NOTE_E2 =457,
  NOTE_F2 =547,
  NOTE_FS2 =631,
  NOTE_G2 =711,
  NOTE_GS2 =786,
  NOTE_A2 =856,
  NOTE_AS2 =923,
  NOTE_B2 =986,
  NOTE_C3 =1046,
  NOTE_CS3 =1102,
  NOTE_D3 =1155,
  NOTE_DS3 =1205,
  NOTE_E3 =1253,
  NOTE_F3 =1297,
  NOTE_FS3 =1339,
  NOTE_G3 =1379,
  NOTE_GS3 =1417,
  NOTE_A3 =1452,
  NOTE_AS3 =1486,
  NOTE_B3 =1517,
  NOTE_C4 =1547,
  NOTE_CS4 =1575,
  NOTE_D4 =1602,
  NOTE_DS4 =1627,
  NOTE_E4 =1650,
  NOTE_F4 =1673,
  NOTE_FS4 =1694,
  NOTE_G4 =1714,
  NOTE_GS4 =1732,
  NOTE_A4 =1750,
  NOTE_AS4 =1767,
  NOTE_B4 =1783,
  NOTE_C5 =1798,
  NOTE_CS5 =1812,
  NOTE_D5 =1825,
  NOTE_DS5 =1837,
  NOTE_E5 =1849,
  NOTE_F5 =1860,
  NOTE_FS5 =1871,
  NOTE_G5 =1881,
  NOTE_GS5 =1890,
  NOTE_A5 =1899,
  NOTE_AS5 =1907,
  NOTE_B5 =1915,
  NOTE_C6 =1923,
  NOTE_CS6 =1930,
  NOTE_D6 =1936,
  NOTE_DS6 =1943,
  NOTE_E6 =1949,
  NOTE_F6 =1954,
  NOTE_FS6 =1959,
  NOTE_G6 =1964,
  NOTE_GS6 =1969,
  NOTE_A6 =1974,
  NOTE_AS6 =1978,
  NOTE_B6 =1982,
  NOTE_C7 =1985,
  NOTE_CS7 =1989,
  NOTE_D7 =1992,
  NOTE_DS7 =1995,
  NOTE_E7 =1998,
  NOTE_F7 =2001,
  NOTE_FS7 =2004,
  NOTE_G7 =2006,
  NOTE_GS7 =2009,
  NOTE_A7 =2011,
  NOTE_AS7 =2013,
  NOTE_B7 =2015,
  NOTE_C8 =2017
} NOTES;
# 4 "game.c" 2


PLAYER player;
OBST obstacle;
DOT laser;


OBST obstacles[4];


int score;
int spawned;


void initGame() {

    score = 0;

    initPlayer();
    initLaser();
    initObst();
}



void initPlayer() {
    player.x = 100;
    player.y = 100;
    player.oldx = player.x;
    player.oldy = player.y;
    player.xvel = 0;
    player.yvel = 0;
    player.height = 31;
    player.width = 41;
    player.color = ((0&31) | (0&31) << 5 | (31&31) << 10);
    player.powerup = 0;
}


void initLaser() {
    laser.x = 68;
    laser.y = 10;
    laser.oldx = laser.x;
    laser.height = 3;
    laser.width = 1;
    laser.color = ((31&31) | (0&31) << 5 | (0&31) << 10);
}


void initObst() {
    for (int i = 0; i < 4; i++) {
        obstacles[i].width = 41;
        obstacles[i].height = 41;
        obstacles[i].active = 1;
        obstacles[i].yvel = -1;
        obstacles[i].x = 52 + (7 * i) + (obstacles[i].width * i);

        int colorPicker = rand() % 4;
        switch (colorPicker) {
            case 0:
                obstacles[i].color = ((6&31) | (14&31) << 5 | (11&31) << 10);
                break;
            case 1:
                obstacles[i].color = ((19&31) | (9&31) << 5 | (13&31) << 10);
                break;
            case 2:
                obstacles[i].color = ((25&31) | (18&31) << 5 | (14&31) << 10);
                break;
            case 3:
                obstacles[i].color = ((18&31) | (19&31) << 5 | (27&31) << 10);
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


void updateGame() {

    updatePlayer();
    updateLaser();

    for (int i = 0; i < 4; i++) {
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


void updatePlayer() {


    if (player.powerup == 0) {
        if ((~(buttons) & ((1<<5))) && (player.x - 1 > 0)) {
            player.xvel = -3;
        }
        else if ((~(buttons) & ((1<<4))) && (player.x + player.width < 240 - 1)) {
            player.xvel = 3;
        } else {
            player.xvel = 0;
        }
    } else if (player.powerup == 1) {
                if ((!(~(oldButtons) & ((1<<5))) && (~(buttons) & ((1<<5)))) && (player.x - 1 > 0)) {
            player.xvel = -(41 + 7);
        }
        else if ((!(~(oldButtons) & ((1<<4))) && (~(buttons) & ((1<<4)))) && (player.x + player.width < 240 - 1)) {
            player.xvel = (41 + 7);
        } else {
            player.xvel = 0;
        }
    }


    if (collision(player.x, player.y, player.width, player.height, 52, 160, 137, 1)) {
        *(volatile u16*)0x04000068 = (((5) & 15) << 12) |
                            (((7) & 7) << 8);
        *(volatile u16*)0x0400006C = NOTE_C4 | (1<<15);
        score = -1;
    }


    player.oldx = player.x;
    player.x += player.xvel;
    player.oldy = player.y;
    player.y += player.yvel;
}

void updateLaser() {


    if (laser.x <= 64) {
        laser.xvel = 1;
    }
    if (laser.x + laser.height >= 72) {
        laser.xvel = -1;
    }


    laser.oldx = laser.x;
    laser.x += laser.xvel;
}


void updateObst(OBST* o) {
    if (o -> active) {
        if (collision(player.x, player.y, player.width, player.height, o -> x, o -> y, o -> width, o -> height)) {
            player.y--;
        }

        if (player.y > (o -> y + o -> height)) {
            *(volatile u16*)0x04000068 = (((2) & 15) << 12) |
                            (((5) & 7) << 8);
            *(volatile u16*)0x0400006C = NOTE_E4 | (1<<15);
            score++;
        }


        o->oldy = o->y;
        o->x += o->yvel;




    }
}


void drawGame() {
    drawPlayer();
    drawLaser();
    for (int i = 0; i < 4; i++) {
        drawObst(&obstacles[i]);
    }
}


void drawPlayer() {
    drawRect(player.oldx, player.oldy, player.width, player.height, ((25&31) | (22&31) << 5 | (17&31) << 10));
    drawRect(player.x, player.y, player.width, player.height, player.color);
}


void drawLaser() {
    drawRect(laser.x, laser.y, laser.height, laser.height, ((25&31) | (22&31) << 5 | (17&31) << 10));
    drawRect(laser.x - 1, laser.y, laser.height, laser.width, laser.color);
    drawRect(laser.x, laser.y - 1, laser.width, laser.height, laser.color);
}

drawObst(OBST* o) {
    if (o -> active) {
        drawRect(o -> oldx, o -> oldy, o -> width, o -> height, ((25&31) | (22&31) << 5 | (17&31) << 10));
        drawRect(o -> x, o -> y, o -> width, o -> height, o -> color);
    }
}


void newObst() {
    spawned = 1;
    for (int i = 0; i < 4; i++) {
        if (obstacles[i].active == 0) {
            obstacles[i].active = 1;
        }
        break;
    }
}
