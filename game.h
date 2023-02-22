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
} OBST;

// variables
extern PLAYER player;
extern OBST obstacle;