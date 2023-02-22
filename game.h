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
    int color;
    int active;
} OBST;

// constants
#define bufferWidth 7
#define borderWidth 52
#define floorWidth  137
#define numObstacles 5

// variables
extern PLAYER player;
extern OBST obstacles[numObstacles];
extern int score;

// function prototypes
void initGame();
void initPlayer();
void initObst();
void updateGame();
void updatePlayer();
void updateObst(OBST* o);
void drawGame();
void drawPlayer();
void drawObst(OBST* o);
void newObst();

