class Player{
  
  //float x;
  //float y;
  //float vx=40;
  //float vy=10;
  
    PVector location;
  PVector velocity;
  String type;
  boolean onGround;
  
  Player(String element){
    type = element;
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
    y -= vy;
//    y -= vy;
  }
  
  void applyForce(float force){
    
  }
  
  //boolean checkCollision(Platform p){
    
  //}
  
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
