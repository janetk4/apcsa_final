Player fireboy;
Player watergirl;
ArrayList<Platform> platforms;

void setup(){
  size(1000, 700);
  fireboy = new Player("fire");
  watergirl = new Player("water");
  platforms = new ArrayList<Platform>();
}

void update(){
  //check if level has been beaten
  
  //and load levels i guess
  platforms.add(new Platform(0, 680, 1000, 700, "stone"));
  platforms.add(new Platform(0, 580, 800, 600, "stone"));
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
  if (keyCode == 'W'){
    //watergirl.jump();
  }
  if (keyCode == 'A'){
    watergirl.moveLeft();
  }
  if (keyCode == 'D'){
    watergirl.moveRight();
  }
}

void draw(){
  //gravity
  update();
  if (fireboy.onGround == false){
    fireboy.applyG();   //i need a method to 
  }
  background(186, 186, 186);
  fireboy.display();
  watergirl.display();
  for (Platform p : platforms){
    p.display();
  }
}
