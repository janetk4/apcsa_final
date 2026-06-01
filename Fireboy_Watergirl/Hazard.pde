class Hazard{
  
  PVector location;
  float w;
  float h;
  color col;
  String e;
  
  Hazard(float x, float y, float wi, float he, String type){
    location = new PVector(x, y);
    w=wi;
    h=he;
    e = type;
    if (e.equals("r")){
      col = color(184, 10, 45);
    }
    if (e.equals("b")){
      col = color(70, 158, 242);
    }
    if (e.equals("g")){
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
    stroke(col);
    fill(col);
    rect(location.x, location.y, w, h);
  }
  
}
