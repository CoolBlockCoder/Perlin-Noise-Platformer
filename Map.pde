class Map {
  Platform[] platforms;
  float t, noisev;
  Player p;
  Platform pl;

  Map() {
    p = new Player();
    noisev = 1.5;
    pl = new Platform(0, 3*height/4+15);
    platforms = new Platform[3];
    for (int i = 0; i < platforms.length; i++) {
      platforms[i] = new Platform(i*width/2, map(noise(t), 0, 1, height/2, 4*height/5));
      t+=noisev;
    }
  }

  void displayPlayer() {
    p.update();
    p.gravity();
    p.display();
    collision();
  }
  
  void playerJump(){
   p.jump(); 
  }

  void displayPlatforms() {
    for (int i = 0; i < platforms.length; i++) {
      platforms[i].display();
      platforms[i].update();
      if(platforms[i].pos.x+platforms[i].w < 0){
       platforms[i] = new Platform(width+20, map(noise(t), 0, 1, height/2, 4*height/5));
       t+=noisev;
      }
    }
  }
  
  void movePlatforms(int dir){
    for(int i = 0; i < platforms.length; i++){
      platforms[i].moveH(dir);
    }
  }

  void collision(){
   for(Platform pl: platforms){
     if(p.pos.x> pl.pos.x && p.pos.x < (pl.pos.x+pl.w) && p.pos.y +16 > pl.pos.y && p.pos.y - 15 < (pl.pos.y+pl.h)){
       p.dLine = pl.pos.y-15;
       if(p.pos.y != pl.pos.y-15){
         p.pos.y = pl.pos.y-15;
       }
       break;
     }else{
       p.dLine = height-15;
     }
   }
  }
}
