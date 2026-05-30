class Player{
  
  float x;
  float y;
  float vx;
  float vy;
  float w = 40;    //size of player for now
  float h = 40;
  
  boolean alive;
  String type;
  boolean onGround;
  
  Player(String element){
    alive = true;
    type = element;
    onGround = true;
    x = 10;
    y = 635;
    if (type.equals("water")){
      x = 50;
    }
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
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
    
    if (x< hx+hw && x+w > hx && y < hy+hh && y+h > hy){
      float olTop = y+h - hy;
      float olBot = hy+hh - y;
      float olLeft = x+w - hx;
      float olRight = hx+hw - x;
      
      float minOL = min(min(olTop, olBot), min(olLeft, olRight));
      
      if (minOL == olTop){         //standing on top
        alive = false;
      }
    }
  }
  
  void update(){
    //check collision hazard here or maybe in draw in game file
  }
  
  void display() {
    if (type.equals("fire")){
      stroke(color(199, 87, 87));
      strokeWeight(2);
      fill(242, 111, 111);
      square(x, y, w);
    }
    if (type.equals("water")){
      stroke(color(82, 152, 205));
      fill(136, 196, 241);
      square(x, y, w);
    }
  }
  
  //arraylist with the keys, 
  
}
