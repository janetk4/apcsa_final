Player fireboy;
Player watergirl;
ArrayList<Player> players;
ArrayList<Platform> platforms;
ArrayList<Hazard> hazards;
float levelNow;
int worldW = 1000;
int worldH = 700;
String m;

void setup(){
  size(1000, 700);
  
  platforms = new ArrayList<Platform>();
  hazards = new ArrayList<Hazard>();
  players = new ArrayList<Player>();
  
  players.add(new Player("fire"));
  players.add(new Player("water"));
  fireboy = players.get(0);
  watergirl = players.get(1);
  
  levelNow = 0;   //ill do something with this to increase levels later
}

void update(){
  //check if level has been beaten
  
  //and load levels i guess

}

void resetLevel(){
  platforms.clear();
  hazards.clear();
  platforms.add(new Platform(-5, 0, 5, worldH, "stone"));      //these two makes sides of screen a
  platforms.add(new Platform(worldW, 0, 5, worldH, "stone"));  //platform so that collision applies
  if (levelNow == 1){
    loadOne();
  }
  else if (levelNow == 2){
    loadTwo();
  }
}

void checkLvCompletion(){
  if (fireboy.getX() > width && watergirl.getX() > width){
    levelNow++;
    resetLevel();
  }
}

void keyPressed(){
  //start
  if (key == ' '){
    levelNow++;
    resetLevel();
  }
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
  if (key == 'w' && watergirl.onGround){
    watergirl.jump();
  }
  if (key == 'a'){
    watergirl.vx = -5;
  }
  if (key == 'd'){
    watergirl.vx = 5;;
  }
}

void keyReleased(){                            //stops movement after releasing key
  if (keyCode == LEFT || keyCode == RIGHT){
    fireboy.vx = 0;
  }
  if (key == 'a' || key == 'd'){
    watergirl.vx = 0;
  }
}

void draw(){
  update();
  checkLvCompletion();
  if (levelNow == 0){
    drawStart();
    return;
  }
  else if (levelNow == 1){
    background(186, 186, 186);
  }
  else if (levelNow == 2){
    background(243, 216, 237);
  }
  
  for (Player p : players){
    if (p.alive == false){
      levelNow = 4;
    }
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
  
  for (Hazard h : hazards){
    h.display();
  }
}

void drawStart(){
  background(30);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(60);
  text("Fireboy & Watergirl", width/2, 180);
  textSize(24);
  text("Press SPACE to Start", width/2, 320);
}

void loadOne(){
  m = "stone";
  platforms.add(new Platform(0, 680, 1000, 40, m));
  platforms.add(new Platform(0, 530, 800, 20, m));
  platforms.add(new Platform(150, 380, 850, 20, m));
  platforms.add(new Platform(0, 230, 800, 20, m));
  platforms.add(new Platform(250, 100, 750, 20, m));
}

void loadTwo(){
  m = "bub";
  platforms.add(new Platform(0, 680, 1000, 40, m));
  platforms.add(new Platform(250, 580, 220, 20, m));
  platforms.add(new Platform(550, 580, 220, 20, m));
  platforms.add(new Platform(900, 550, 100, 150, m));
  platforms.add(new Platform(0, 470, 800, 20, m));
  platforms.add(new Platform(150, 370, 850, 20, m));
  platforms.add(new Platform(850, 200, 150, 170, m));
  platforms.add(new Platform(0, 100, 750, 20, m));
}
