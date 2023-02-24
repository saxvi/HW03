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
    int yvel;
    int oldx;
    int oldy;
    int width;
    int height;
    unsigned short color;
    int show;
} DOT;
# 51 "game.h"
extern PLAYER player;
extern DOT laser;
extern DOT powerup;
extern OBST obstacles[2];
extern int score;


void initGame();
void initPlayer();
void initObst();
void initPowerup();

void updateGame();
void updatePlayer();
void updatePowerup();
void updateObst(OBST* o);
void updateBG();

void drawGame();
void drawPlayer();
void drawPowerup();
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
# 76 "gba.h"
void drawRect(int x, int y, int width, int height, volatile unsigned short color);
void fillScreen(volatile unsigned short color);
void drawChar(int x, int y, char ch, unsigned short color);
void drawString(int x, int y, char *str, unsigned short color);
# 95 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 127 "gba.h"
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
DOT powerup;


OBST obstacles[2];
int spawned;
int t;


int lineY = 10;
int oldlineY;
int lineyvel = 1;



extern int score;
extern char temp;


void initGame() {

    score = 0;

    initPlayer();
    initLaser();
    initObst();
    initPowerup();
}


void initPlayer() {
    player.x = 100;
    player.y = 100;
    player.oldx = player.x;
    player.oldy = player.y;
    player.xvel = 0;
    player.yvel = 0;
    player.height = 20;
    player.width = 15;
    player.color = ((0&31) | (0&31) << 5 | (31&31) << 10);
    player.powerup = 0;
}


void initLaser() {
    laser.x = 120;
    laser.y = 10;
    laser.oldx = laser.x;
    laser.oldy = laser.y;
    laser.height = 3;
    laser.width = 1;
    laser.color = ((31&31) | (0&31) << 5 | (0&31) << 10);
}

void initPowerup() {
    powerup.x = 52 + (((rand() % 3) + 1) * 41);
    powerup.y = 20;
    powerup.oldx = powerup.x;
    powerup.oldy = powerup.y;
    powerup.yvel = 1;
    powerup.height = 5;
    powerup.width = 5;
    powerup.color = ((0&31) | (16&31) << 5 | (16&31) << 10);
    powerup.show = 0;
}


void initObst() {
    for (int i = 0; i < 2; i++) {
        obstacles[i].width = 41;
        obstacles[i].height = 35;
        obstacles[i].active = 1;
        obstacles[i].yvel = (rand() % 4) + 1;
        obstacles[i].x = 52 + (7 * i) + (41 * i);
        obstacles[i].y = (0);

        int colorPicker = rand() % 3;
        switch (colorPicker) {
            case 0:
                obstacles[i].color = ((6&31) | (14&31) << 5 | (11&31) << 10);
                break;
            case 1:
                obstacles[i].color = ((19&31) | (9&31) << 5 | (13&31) << 10);
                break;
            case 2:
                obstacles[i].color = ((28&31) | (8&31) << 5 | (16&31) << 10);
                break;
        }
    }
}


void updateGame() {

    for (int i = 0; i < 2; i++) {
        updateObst(&obstacles[i]);
    }

    updatePlayer();
    if (!(player.powerup)) {
        updatePowerup();
    }
# 120 "game.c"
    updateBG();
}


void updatePlayer() {


    if ((~(buttons) & ((1<<5))) && (player.x - 1 > 52)) {
        player.xvel = -3;
    }
    else if ((~(buttons) & ((1<<4))) && (player.x + player.width < 52 + 137 - 1)) {
        player.xvel = 3;
    } else {
        player.xvel = 0;
    }


    if (collision(player.x, player.y, player.width, player.height, powerup.x, powerup.y, powerup.width, powerup.height)) {
        player.yvel = -3;
        player.color = ((0&31) | (31&31) << 5 | (31&31) << 10);
    }

    if (player.y == 100) {
        player.color = ((0&31) | (0&31) << 5 | (31&31) << 10);

    }


    if (player.y > 160) {
        *(volatile u16*)0x04000068 = (((5) & 15) << 12) |
                            (((3) & 7) << 8);
        *(volatile u16*)0x0400006C = NOTE_C4 | (1<<15);
        temp = score;
        score = -1;
    }


    player.oldx = player.x;
    player.x += player.xvel;
    player.oldy = player.y;
    player.y += player.yvel;


    if (player.y <= 100) {
        player.yvel = 0;
    }
}

void updatePowerup() {

        powerup.oldx = powerup.x;
        powerup.oldy = powerup.y;
        powerup.y += 2;

        if (player.y > 100) {
            drawRect(powerup.x, powerup.y, powerup.width, powerup.height, powerup.color);
        }

        if (collision(powerup.x, powerup.y, powerup.width, powerup.height, player.x, player.y, player.width, player.height)) {
            drawRect(powerup.x, powerup.y, powerup.width, powerup.height, ((25&31) | (22&31) << 5 | (17&31) << 10));
        }
}

void updateLaser() {


    if (laser.x <= 110) {
        laser.xvel = 1;
    }
    if (laser.x + laser.height >= 130) {
        laser.xvel = -1;
    }


    laser.oldx = laser.x;
    laser.x += laser.xvel;
}


void updateObst(OBST* o) {


    o->oldx = o->x;
    o->oldy = o->y;
    o->y += o->yvel;

    if (collision(o -> x, o -> y, o -> width, 1, 52, 160, 137, 1)) {


        *(volatile u16*)0x04000068 = (((2) & 15) << 12) |
                      (((2) & 7) << 8);
        *(volatile u16*)0x0400006C = NOTE_G5 | (1<<15);
        score++;



        o -> y = 0;
        o -> yvel = (rand() % 2) + 1;


    }


    if (collision(player.x, player.y, player.width, player.height, o -> x, o -> y, o -> width, o->height)) {
        player.y += o->yvel;
    }
}


void updateBG() {

    lineY += lineyvel;
    oldlineY = lineY;

    if (lineY > 160) {
        lineY = 0;
    }
}


void drawGame() {

    for (int i = 0; i < 2; i++) {
        drawObst(&obstacles[i]);
    }

    drawBG();

    drawPlayer();

    drawPowerup();

    drawLaser();
    waitForVBlank();

}


void drawPlayer() {
    drawRect(player.oldx, player.oldy, player.width, player.height, ((25&31) | (22&31) << 5 | (17&31) << 10));
    drawRect(player.x, player.y, player.width, player.height, player.color);


}

void drawPowerup() {
    drawRect(powerup.oldx, powerup.oldy - 1, powerup.width, powerup.height, ((25&31) | (22&31) << 5 | (17&31) << 10));
    drawRect(powerup.x, powerup.y, powerup.width, powerup.height, powerup.color);
}


void drawLaser() {
    drawRect(laser.oldx - 1, laser.oldy - 1, laser.height, laser.height, ((25&31) | (22&31) << 5 | (17&31) << 10));

    drawRect(laser.x - 1, laser.y, laser.height, laser.width, laser.color);
    drawRect(laser.x, laser.y - 1, laser.width, laser.height, laser.color);
}

void drawObst(OBST* o) {
    for (int i = 0; i < 2; i++) {
        drawRect(o->x, o -> oldy, o -> width, o -> height, ((25&31) | (22&31) << 5 | (17&31) << 10));
        drawRect(o -> x, o -> y, o -> width, o -> height, o -> color);
    }
}

drawBG() {






    drawRect(52, lineY, 137, 1, ((20&31) | (17&31) << 5 | (12&31) << 10));
    drawRect(52, oldlineY - 1, 137, 1, ((25&31) | (22&31) << 5 | (17&31) << 10));

    drawRect(52 + 41, 0, 7, 160, ((25&31) | (18&31) << 5 | (14&31) << 10));
    drawRect(52 + 41 + 7 + 41, 0, 7, 160, ((25&31) | (18&31) << 5 | (14&31) << 10));

 }


void newObst() {
    spawned = 1;
    for (int i = 0; i < 2; i++) {
        if (obstacles[i].active == 0) {
            obstacles[i].active = 1;
        }
        break;
    }
}
