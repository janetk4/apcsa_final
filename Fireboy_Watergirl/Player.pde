class Player{
  
  float x;
  float y;
  float vx=5;
  float vy=40;
  
  //PVector location;
  //PVector velocity;
  String type;
  boolean onGround;
  
  Player(String element){
    type = element;
    onGround = true;
    x = 0;
    y = 640;
    if (type.equals("water")){
      x = 40;
    }
  }
  
  void moveLeft(){
    x -= vx;
  }
  
  void moveRight(){
    x += vx;
  }
  
  void jump(){
    onGround = false;
    y -= vy;
  }
  
  void applyG(){
    y += vy;
  }
  
  void checkCollision(Platform p){
    float px = p.getX();
    float py = p.getY();
    float pEx = p.getEX();
    float pEy = p.getEY();
    
    float closeX = constrain(x, px, pEx);
    float closeY = constrain(y, py, pEy);
    
    float dx = x - closeX;
    float dy = y - closeY;
    
  }
  
  //boolean checkHazard(Hazard h){
    
  //}
  
  void update(){
    //check collision hazard here or maybe in draw in game file
  }
  
  void display() {
    if (type.equals("fire")){
      stroke(color(199, 87, 87));
      strokeWeight(2);
      fill(242, 111, 111);
      square(x, y, 40);
    }
    if (type.equals("water")){
      stroke(color(82, 152, 205));
      fill(136, 196, 241);
      square(x, y, 40);
    }
  }
  
  //arraylist with the keys, 
  
}
