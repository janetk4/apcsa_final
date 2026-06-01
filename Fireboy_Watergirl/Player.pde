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
    onGround = false;
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
  
  void checkButton(Button b) {
    
    float bx = b.getX();
    float by = b.getY();
    float bw = 50;
    float bh = 15;
    
    if (x< bx+bw && x+w > bx && y < by+bh && y+h > by){
      
      //overlaps
      float top = y+h - by;
      float bot = by+bh - y;
      float left = x+w - bx;
      float right = bx+bw - x;
      
      //smallest overlap
      float min = min(min(top, bot), min(left, right));
      
      if (top <= bot && top <= left && top <= right){         //hit top
        y = by - h;
        vy = 0;
        b.activated = true;
      }
      else if (min == bot){    //hit bottom
        y = by + bh;
        vy = 0;
      }
      else if (min == left){   //hit sides
        x = bx - w;
        vx = 0;
      }
      else if (min == right){
        x = bx + bw;
        vx = 0;
      }
      
    }
    
  }
  
  void checkDoor(Door d){
    float px = d.getX();
    float py = d.getY();
    float pw = d.getW();
    float ph = d.getH();
    
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
        onGround = true;
        
        if (d.isOpen()){   //brings char up
          y += 1;
        }
        
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
  
  void checkBlock(Block b, boolean[] resolved){
    
    if (resolved[0]){
      return;
    }
    if (x < b.pos.x + b.w && x + w > b.pos.x && y + h > b.pos.y && y < b.pos.y + b.h){
      float top = y + h - b.pos.y;
      float bot = b.pos.y + b.h - y;
      float left = x + w - b.pos.x;
      float right = b.pos.x + b.w - x;
      
      float min = min(min(top, bot), min(left, right));
      
      if (top < left && top < right && vy >= 0){         //standing
        y = b.pos.y - h;
        vy = 0;
        
        onGround = true;
        resolved[0] = true;
        return;
      }
      else if(bot < left && bot < right && vy < 0){
        y = b.pos.y + b.h;
        vy = 0;
        
        resolved[0] = true;
        return;
      }
      else if(left < top && left < bot && vx > 0){    //push left
        x = b.pos.x - w;
        vx = 0;
        
        b.vx = b.pushStrength;
        resolved[0] = true;
        return;
      }
      else if(right < top && right < bot && vx < 0){
        x = b.pos.x + b.w;
        vx = 0;
        
        b.vx = -b.pushStrength;
        resolved[0] = true;
        return;
      }
      
    }
  }
  
  boolean checkEnd(End e, Player p1, Player p2){
    
    float cx = e.getXcen();         //center of door
    float cy = e.getYcen();
    
    float p1x = p1.x + p1.w / 2;    //centers of chars
    float p1y = p1.y + p1.h / 2;
    
    float p2x = p2.x + p2.w / 2;
    float p2y = p2.y + p2.h / 2;
    
    boolean p1in = abs(p1x - cx) < 50 / 2 && abs(p1y - cy) < 60 / 2;
    boolean p2in = abs(p2x - cx) < 50 / 2 && abs(p2y - cy) < 60 / 2;
    
    return p1in && p2in;
    
    //boolean result;
    //if (type.equals("fire")){
    //  if (x+17 == e.getXcen() && y == e.getY()){
    //    result = true;
    //  }
    //  else{
    //    return false;
    //  }
    //}
    //else{
    //  if (x+17 == e.getXcen()+20 && y == e.getY()){
    //    return true;
    //  }
    //  else{
    //    return false;
    //  }
    //}
    //return result;
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
