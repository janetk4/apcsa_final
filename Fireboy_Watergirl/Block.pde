class Block{
  
  PVector pos;
  float w, h;
  float vx = 0;
  float friction = 0.85;
  float pushStrength = 0.5;
  
  Block(float x, float y, float wi, float he){
    pos = new PVector(x, y);
    w = wi;
    h = he;
  }
  
  void update(){
    pos.x += vx;       //apply movement
    vx *= friction;    //friction over time
    if (abs(vx) < 0.01){
      vx = 0;
    }
  }
  
  void display(){
    stroke(color(120));
    fill(120);
    rect(pos.x, pos.y, w, h);
  }
  
}
