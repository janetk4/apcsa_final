class Platform{
  
  PVector location;
  float w;
  float h;
  color col = color(149);
  
  Platform(float x, float y, float wi, float he){
    location = new PVector(x, y);
    w = wi;
    h = he;
  }
  
  float getX(){
    return location.x;
  }
  
  float getY(){
    return location.y;
  }
  
  float getW(){
    return w;
  }
  
  float getH(){
    return h;
  }
  
  void display(){
    stroke(col);
    strokeWeight(1);
    fill(col);
    rect(location.x, location.y, w, h);
  }
  
}
