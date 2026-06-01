class End{
  
  PVector location;
  color colr = color(255, 182, 182);
  color colb = color(204, 229, 255);
  
  End(float x, float y){
    location = new PVector(x, y);
  }
  
  float getXcen(){
    return location.x+25;
  }
  
  float getYcen(){
    return location.y+30;
  }
  
  void display(){
    stroke(colr);
    fill(colr);
    rect(location.x, location.y, 50, 60);
    stroke(colb);
    fill(colb);
    rect(location.x+50, location.y, 50, 60);
  }
  
}
