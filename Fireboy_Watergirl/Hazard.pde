class Hazard{
  
  PVector location;
  float w;
  float h;
  color col;
  
  Hazard(float x, float y, float wi, float he, String type){
    location = new PVector(x, y);
    w=wi;
    h=he;
    if (type.equals("r")){
      col = color(184, 10, 45);
    }
    if (type.equals("b")){
      col = color(70, 158, 242);
    }
    if (type.equals("g")){
      col = color(51, 154, 59);
    }
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
    fill(col);
    rect(location.x, location.y, w, h);
  }
  
}
