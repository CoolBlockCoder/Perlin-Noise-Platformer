class Player {
  PVector pos, vel, acc, grav;
  float dLine = height;

  Player() {
    pos = new PVector(160, height/2-80);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void display() {
    noStroke();
    fill(0, 150, 200);
    ellipse(pos.x, pos.y, 30, 30);
  }

  void update() {
    vel.x*=0.8;
    pos.add(vel);
    vel.add(acc);
    vel.limit(7);
    //println(vel);
    acc.mult(0);
  }

  void gravity() {
    if (pos.y < dLine) {
      acc.add(new PVector(0, 0.5));
    } else {
      if (vel.y > 0) {
        acc.y*=0;
        vel.y*=0;
      }
    }
  }

  void jump() {
    acc.add(new PVector(0, -10));
  }
  
  void hMove(int dir){
    acc.add(new PVector(8*dir, 0));
  }
}
