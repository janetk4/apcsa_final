class Button{
  
  PVector location;
  boolean activated;
  float originalY;
  float pressedY;
  
  Button(float x, float y){
    location = new PVector(x, y);
    originalY = y;
    pressedY = originalY + 2;
    activated = false;
  }
  
  float getX(){
    return location.x;
  }
  
  float getY(){
    return location.y;
  }
  
  void update(){
    if (activated){
      location.y = min(location.y + .2, pressedY);
    }
    else{
      location.y = max(location.y - .2, originalY);
    }
  }
  
  void display(){
    stroke(color(255, 227, 146));
    fill(color(255, 227, 146));
    rect(location.x, location.y, 50, 15);
  }
  
}
