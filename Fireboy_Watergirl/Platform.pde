class Platform{
  
  PVector location;
  float w;
  float h;
  color col;
  float r;
  
  Platform(float x, float y, float wi, float he, String mat){
    location = new PVector(x, y);
    w = wi;
    h = he;
    if (mat.equals("stone")){
      col = color(149);  //fill in with gray
    }
    r = 10;
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
    stroke(color(90));
    strokeWeight(1);
    fill(col);
    rect(location.x, location.y, w, h);
  }
  
}
