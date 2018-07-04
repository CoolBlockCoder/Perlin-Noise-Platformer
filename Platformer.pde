Map m;
int currentFrame;
boolean d;

void setup() {
  //rectMode(CORNER);
  size(640, 360);
  m = new Map();  
  d = false;
}

void draw() {
  background(64);
  m.displayPlayer();
  m.displayPlatforms();

  if (d) {
    m.movePlatforms(-1);
  }
}

void keyPressed() {
  if (key == 32) {
    if (frameCount - currentFrame > 8) {
      m.playerJump();
    }
    currentFrame = frameCount;
  } 
  if (key == 'd') {
    d = true;
  }
}

void keyReleased() {
  if (key == 'd') {
    d = false;
  }
}
