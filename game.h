//structs

//player struct
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

//obstacle struct
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

// small things struct
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

// constants
#define bufferWidth 7
#define borderWidth 52
#define floorWidth  137
#define numObstacles 2

// variables
extern PLAYER player;
extern DOT laser;
extern DOT powerup;
extern OBST obstacles[numObstacles];
extern int score;

// function prototypes
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

