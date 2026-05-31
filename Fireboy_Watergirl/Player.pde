class Player{
  
  //location, movement
  float x;
  float y;
  float vx;
  float vy;
  
  //appearance
  float w = 35;
  float h = 50;
  PImage img;
  
  //state
  String type;
  boolean onGround;
  boolean alive;

  
  Player(String element){
    type = element;
    onGround = true;
    alive = true;
    y = 635;
    
    if (type.equals("fire")){
      x = 10;
      img = loadImage("fireboy.png");
    }
    
    if (type.equals("water")){
      x = 50;
      img = loadImage("watergirl.png");
    }
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
  
  void respawn(){
    y = 635;
    if (type.equals("fire")){
      x = 10;
    }
    else{
      x = 50;
    }
  }
  
  void move(){
    x += vx;
  }
  
  void jump(){
    if (onGround == true){
      vy = -11;
      onGround = false;
    }
  }
  
  void applyG(){
    vy += 0.5;
    y += vy;
  }
  
  void checkCollision(Platform p){
    float px = p.getX();
    float py = p.getY();
    float pw = p.getW();
    float ph = p.getH();
    
    if (x< px+pw && x+w > px && y < py+ph && y+h > py){
      //find overlaps btw platform and players
      float olTop = y+h - py;
      float olBot = py+ph - y;
      float olLeft = x+w - px;
      float olRight = px+pw - x;
      
      //smallest overlap
      float minOL = min(min(olTop, olBot), min(olLeft, olRight));
      
      if (minOL == olTop){         //standing on top
        y = py - h;
        vy = 0;
        onGround = true;    //makes sure player is on surface before jumping again
      }
      else if (minOL == olBot){    //hits bottom
        y = py + ph;
        vy = 0;
      }
      else if (minOL == olLeft){   //hits the sides
        x = px - w;
        vx = 0;
      }
      else if (minOL == olRight){
        x = px + pw;
        vx = 0;
      }
    }
  }
  
  void checkHazard(Hazard hzd){
    float hx = hzd.getX();
    float hy = hzd.getY();
    float hw = hzd.getW();
    float hh = hzd.getH();
    
    if (!(x< hx+hw && x+w > hx && y < hy+hh && y+h > hy)){
      return;   //not touching then continue game
    }
    
    if (hzd.e.equals("g")){
      alive = false;
      return;
    }
    
    if (type.equals("fire") && hzd.e.equals("b")){
      alive = false;
    }
    if (type.equals("water") && hzd.e.equals("r")){
      alive = false;
    }
  }
  
  void display() {
    //if (type.equals("fire")){
    //  stroke(color(199, 87, 87));
    //  strokeWeight(2);
    //  fill(242, 111, 111);
    //  square(x, y, w);
    //}
    //if (type.equals("water")){
    //  stroke(color(82, 152, 205));
    //  fill(136, 196, 241);
    //  square(x, y, w);
    //}
    if (!alive){
      return;
    }
    image(img, x, y, w, h);
    noFill();
    //stroke(255, 0, 0);
    //rect(x, y, w, h);
  }
  
}
