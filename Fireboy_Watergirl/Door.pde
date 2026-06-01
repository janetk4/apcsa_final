class Door{
  
  PVector location;
  float w;
  float h;
  float closedY;
  float openY;
  ArrayList<Button> triggers;
  
  Door(float x, float y, float wi, float he, ArrayList<Button> ts){
    location = new PVector(x, y);
    w = wi;
    h = he;
    triggers = ts;
    closedY = y;
    openY = y - 4*h;
  }
  
  void update(){
    boolean allPressed = false;
    for (Button b : triggers){
      if (b.activated){
        allPressed = true;
        break;
      }
    }
    
    if (allPressed){
      location.y = max(location.y - 2, openY);
    }
    else{
      location.y = min(location.y + 2, closedY);
    }
    
    //if (trigger.activated){
    //  location.y = max(location.y-1, openY);
    //}
    //else{
    //  location.y = min(location.y+1, closedY);
    //}
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
  
  boolean isOpen(){
    for (Button b : triggers){
      if (!b.activated){
        return false;
      }
    }
    return true;
  }
   
  void display(){
    stroke(color(84));
    fill(84);
    rect(location.x, location.y, w, h);
  }
  
}
