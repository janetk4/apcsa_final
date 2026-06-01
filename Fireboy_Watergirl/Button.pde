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
  
  //void down(){
  //  location.y += 2;
  //  activated = true;
  //}
  
  //void up(){
  //  if (location.y != originalY){
  //    location.y += 2;
  //  }
  //  location.y = originalY;
  //  activated = false;
  //}
  
  void display(){
    stroke(color(255, 227, 146));
    //strokeWeight(2);
    fill(color(255, 227, 146));
    rect(location.x, location.y, 50, 15);
    //triangle(location.x-10, location.y+15, location.x, location.y+15, location.x, location.y);
    //triangle(location.x+40, location.y, location.x+40, location.y+15, location.x+50, location.y+15);
  }
  
}
