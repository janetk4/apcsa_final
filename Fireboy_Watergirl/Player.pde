class Player{
  
  float x;
  float y;
  float vx;
  float vy;
  String type;
  boolean onGround;
  
  Player(String element){
    type = element;
  }
  
  void moveLeft(){
    x -= vx;
  }
  
  void moveRight(){
    x += vx;
  }
  
  void jump(){
    y += vy;
    y -= vy;
  }
  
  checkCollision(Platform p){
    
  }
  
  checkHazard(Hazard h){
    
  }
  
  void update(){
    //check collision hazard here or maybe in draw in game file
  }
  
  void display() {
    if (type.equals("fire")){
      
    }
    else{
      
    }
  }
  
}
