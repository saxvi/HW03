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

// laser struct
typedef struct {
    int x;
    int y;
    int xvel;
    int oldx;
    int width;
    int height;
    unsigned short color;    
} DOT;

// constants
#define bufferWidth 7
#define borderWidth 52
#define floorWidth  137
#define numObstacles 5

// variables
extern PLAYER player;
extern DOT laser;
extern OBST obstacles[numObstacles];
extern int score;

// function prototypes
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

