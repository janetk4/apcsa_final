Player fireboy;
Player watergirl;
ArrayList<Player> players;
ArrayList<Platform> platforms;
ArrayList<Hazard> hazards;
ArrayList<Button> buttons;
ArrayList<Door> doors;
ArrayList<Block> blocks;
float levelNow;
float levelPrev;
int worldW = 1000;
int worldH = 700;
String m;

void setup(){
  size(1000, 700);
  imageMode(CORNER);
  
  platforms = new ArrayList<Platform>();
  hazards = new ArrayList<Hazard>();
  players = new ArrayList<Player>();
  buttons = new ArrayList<Button>();
  doors = new ArrayList<Door>();
  blocks = new ArrayList<Block>();
  
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
  fireboy.respawn();
  watergirl.respawn();
  fireboy.alive = true;
  watergirl.alive = true;
  platforms.clear();
  hazards.clear();
  buttons.clear();
  blocks.clear();
  doors.clear();
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

void checkAlive(){
  for (Player p : players){
    if (p.alive == false){
      levelPrev = levelNow;
      levelNow = 4;
      resetLevel();
    }
  }
}

void keyPressed(){
  //start
  if (key == ' '){
    if (levelNow == 0){
      levelNow++;
      resetLevel();
    }
    if (levelNow == 4){
      levelNow = levelPrev;
      resetLevel();
    }
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
  checkAlive();
  checkLvCompletion();
  if (levelNow == 0){
    drawStart();
    return;
  }
  if (levelNow == 4){
    drawDeath();
    return;
  }
  else if (levelNow == 1){
    background(186, 186, 186);
  }
  else if (levelNow == 2){
    background(243, 216, 237);
  }
  
  
  for (Button b : buttons){
    b.activated = false;
  }
  for (Block b : blocks){
    b.update();
  }
  for (Button b : buttons){
    b.update();
  }
  
  for (Player p : players){
    p.move();    //updates moving
    p.applyG();  //updates gravity
    
    boolean[] resolved = {false};
    for (Block b : blocks){
      p.checkBlock(b, resolved);
    }
    for (Platform plat : platforms){   //applies collisions
      p.checkCollision(plat);       
    }
    if (p.alive){                      //applies hazards
      for (Hazard h : hazards){
        p.checkHazard(h);
      }
    }
    for (Button b : buttons){
      p.checkButton(b);
    }
    for (Door d : doors){
      p.checkDoor(d);
    }

  }
  
  
  for (Door d : doors){
    d.update();
  }
  
  for (Door d : doors){
    d.display();
  }
  
  for (Button b : buttons){
    b.display();
  }
   
  for (Platform p : platforms){
    p.display();
  }
  
  for (Hazard h : hazards){
    h.display();
  }
  
  for (Block b : blocks){
    b.update();
    b.display();
  }
  
  for (Player p : players){
    p.display();
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
  platforms.add(new Platform(0, 670, 500, 30, m));
  platforms.add(new Platform(500, 695, 100, 5, m));
  platforms.add(new Platform(600, 670, 100, 30, m));
  platforms.add(new Platform(700, 695, 100, 5, m));
  platforms.add(new Platform(800, 670, 200, 30, m));
  platforms.add(new Platform(920, 620, 80, 60, m));  //box
  
  platforms.add(new Platform(0, 520, 550, 30, m));
  platforms.add(new Platform(550, 545, 100, 5, m));
  platforms.add(new Platform(650, 520, 150, 30, m));

  platforms.add(new Platform(150, 370, 850, 30, m));
  platforms.add(new Platform(0, 230, 800, 30, m));
  platforms.add(new Platform(250, 100, 750, 30, m));
  
  hazards.add(new Hazard(500, 680, 100, 15, "r"));
  hazards.add(new Hazard(700, 680, 100, 15, "b"));
  hazards.add(new Hazard(550, 530, 100, 15, "g"));
  
  Button b1 = new Button(300, 505);
  Button b2 = new Button(300, 355);
  Button b3 = new Button(550, 215);
  buttons.add(b1);
  buttons.add(b2);
  buttons.add(b3);
  doors.add(new Door(0, 490, 150, 30, buttons));
  doors.add(new Door(800, 340, 200, 30, buttons));
  
  blocks.add(new Block(250, 180, 50, 50));
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

void drawDeath(){
  background(30);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(50);
  text("You died!", width/2, 180);
  textSize(30);
  text("Press SPACE to Retry", width/2, 320);
}
