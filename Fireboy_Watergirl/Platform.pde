class Platform{
  
  PVector locationSt;
  PVector locationEnd;
  color col;
  float r;
  
  Platform(float x, float y, float x2, float y2, String mat){
    locationSt = new PVector(x, y);
    locationEnd = new PVector(x2, y2);
    if (mat.equals("stone")){
      col = color(149);  //fill in with gray
    }
    r = 10;
  }
  
  float getX(){
    return locationSt.x;
  }
  
  float getY(){
    return locationSt.y;
  }
  
  float getEX(){
    return locationEnd.x;
  }
  
  float getEY(){
    return locationEnd.y;
  }
  
  void display(){
    stroke(color(0));
    strokeWeight(0.5);
    fill(col);
    rect(locationSt.x, locationSt.y, locationEnd.x, locationEnd.y);
  }
  
}
