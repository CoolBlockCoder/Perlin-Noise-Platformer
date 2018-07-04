class Platform{
  float w,h;
  PVector pos, vel;
  
  Platform(float x, float y){
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    w = 300;
    h = 15;
  }
  
  void display(){
   noStroke();
   fill(0, 180, 220);
   rect(pos.x, pos.y, w, h, 2);
  }
  
  void update(){
   pos.add(vel); 
   vel.mult(0);
  }
  
  void moveH(float dir){
    vel = new PVector(4*dir, 0);
  }
}
