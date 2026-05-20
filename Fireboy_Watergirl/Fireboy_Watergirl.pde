Player fireboy;
Player watergirl;

void setup(){
  size(1000, 700);
  fireboy = new Player("fire");
  watergirl = new Player("water");
}

void update(){
  //check if level has been beaten
}

void keyPressed(){
  //fire
  if (keyCode == UP){
    fireboy.jump();
  }
  if (keyCode == LEFT){
    fireboy.moveLeft();
  }
  if (keyCode == RIGHT){
    fireboy.moveRight();
  }
  //water
  if (key == 'W'){
    //watergirl.jump();
  }
  if (key == 'A'){
    watergirl.moveLeft();
  }
  if (key == 'D'){
    watergirl.moveRight();
  }
}

void draw(){
  //gravity
  if (fireboy.onGround == false){
    fireboy.applyG();   //i need a method to 
  }
  background(186, 186, 186);
  fireboy.display();
  watergirl.display();
}
