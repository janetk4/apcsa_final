Player fireboy;
Player watergirl;
ArrayList<Player> players;
ArrayList<Platform> platforms;
float levelNow;
int worldW = 1000;
int worldH = 700;

void setup(){
  size(1000, 700);
  platforms = new ArrayList<Platform>();
  players = new ArrayList<Player>();
  players.add(new Player("fire"));
  players.add(new Player("water"));
  fireboy = players.get(0);
  watergirl = players.get(1);
  
  levelNow = 1;   //ill do something with this to increase levels later
}

void update(){
  //check if level has been beaten
  
  //and load levels i guess
  platforms.add(new Platform(-5, 0, 5, worldH, "stone"));      //these two makes sides of screen a platform
  platforms.add(new Platform(worldW, 0, 5, worldH, "stone"));  //so that collision applies
  if (levelNow == 1){
    platforms.add(new Platform(0, 680, 1000, 40, "stone"));
    platforms.add(new Platform(0, 580, 800, 20, "stone"));
  }
}

void keyPressed(){
  //fire
  if (keyCode == UP && fireboy.onGround){
    fireboy.jump();
  }
  if (keyCode == LEFT){
    fireboy.vx = -5;
  }
  if (keyCode == RIGHT){
    fireboy.vx = 5;
  }
  //water
  if (keyCode == 'W' && watergirl.onGround){
    watergirl.jump();
  }
  if (keyCode == 'A'){
    watergirl.vx = -5;
  }
  if (keyCode == 'D'){
    watergirl.vx = 5;;
  }
}

void keyReleased(){                            //stops movement after releasing key
  if (keyCode == LEFT || keyCode == RIGHT){
    fireboy.vx = 0;
  }
  
  if (keyCode == 'A' || keyCode == 'D'){
    watergirl.vx = 0;
  }
}

void draw(){
  //gravity
  update();
  //if (fireboy.onGround == false){
  //  fireboy.applyG();   //i need a method to 
  //}
  background(186, 186, 186);
  for (Player p : players){
    p.move();    //updates moving
    p.applyG();  //updates gravity
    for (Platform plat : platforms){
      p.checkCollision(plat);       //applies collisions
    }
    p.display();
  }
  for (Platform p : platforms){
    p.display();
  }
}
