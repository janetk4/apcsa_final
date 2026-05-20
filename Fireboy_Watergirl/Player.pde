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
    y = 660;
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
  
  boolean checkCollision(Platform p){
    PVector player;
    player.x = x;
    player.y = y;
    PVector platform;
    platform.x = p.getX();
    platform.y = p.getY();
    
  }
  
  //boolean checkHazard(Hazard h){
    
  //}
  
  void update(){
    //check collision hazard here or maybe in draw in game file
  }
  
  void display() {
    if (type.equals("fire")){
      stroke(255);
      strokeWeight(2);
      fill(204, 48, 68);
      square(x, y, 40);
    }
    if (type.equals("water")){
      fill(144, 204, 240);
      square(x, y, 40);
    }
  }
  
}
