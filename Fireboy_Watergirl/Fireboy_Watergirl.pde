Player fireboy;
Player watergirl;
ArrayList<Player> players;
ArrayList<Platform> platforms;
ArrayList<Hazard> hazards;
ArrayList<Button> buttons;
ArrayList<Door> doors;
ArrayList<Block> blocks;
ArrayList<End> ends;
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
  ends = new ArrayList<End>();
  
  players.add(new Player("fire"));
  players.add(new Player("water"));
  fireboy = players.get(0);
  watergirl = players.get(1);
  
  levelNow = 0;
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
  ends.clear();
  platforms.add(new Platform(-5, 0, 5, worldH));      //these two makes sides of screen a
  platforms.add(new Platform(worldW, 0, 5, worldH));  //platform so that collision applies
  if (levelNow == 1){
    loadOne();
  }
  else if (levelNow == 2){
    loadTwo();
  }
  else if (levelNow == 3){
    loadThree();
  }
  else if (levelNow == 5){
    drawComplete();
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
    background(186);
  }
  else if (levelNow == 2){
    background(186);
  }
  else if (levelNow == 3){
    background(186);
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
  
  for (End e : ends){
    e.display();
  }
  
  for (Player p : players){
    p.display();
  }
  
}

boolean checkEnd(End e, Player p1, Player p2){
    
  float cx = e.getXcen();         //center of door
  float cy = e.getYcen();
    
  float p1x = p1.x + p1.w / 2;    //centers of chars
  float p1y = p1.y + p1.h / 2;
    
  float p2x = p2.x + p2.w / 2;
  float p2y = p2.y + p2.h / 2;
    
  boolean p1in = abs(p1x - cx) < 50 / 2 && abs(p1y - cy) < 60 / 2;
  boolean p2in = abs(p2x - cx) < 50 / 2 && abs(p2y - cy) < 60 / 2;
    
  return p1in && p2in;
}

void checkLvCompletion(){
  for (End e : ends){
    if (checkEnd(e, fireboy, watergirl)){
      if (levelNow==3){
        levelNow += 2;
        players.clear();
        resetLevel();
        return;
      }
      else{
        levelNow++;
        resetLevel();
        return;
      }
    }
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
  platforms.add(new Platform(0, 670, 500, 30));
  platforms.add(new Platform(500, 695, 100, 5));
  platforms.add(new Platform(600, 670, 100, 30));
  platforms.add(new Platform(700, 695, 100, 5));
  platforms.add(new Platform(800, 670, 200, 30));
  platforms.add(new Platform(920, 620, 80, 60));  //box
  
  platforms.add(new Platform(0, 520, 550, 30));
  platforms.add(new Platform(550, 545, 100, 5));
  platforms.add(new Platform(650, 520, 150, 30));

  platforms.add(new Platform(150, 370, 850, 30));
  platforms.add(new Platform(0, 230, 800, 30));
  platforms.add(new Platform(250, 100, 750, 30));
  
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
  
  ends.add(new End(800, 40));
}

void loadTwo(){
  platforms.add(new Platform(0, 695, 1000, 10));
  platforms.add(new Platform(0, 680, 260, 40));
  platforms.add(new Platform(460, 680, 110, 40));
  platforms.add(new Platform(760, 680, 200, 40));
  
  platforms.add(new Platform(250, 585, 220, 15));
  platforms.add(new Platform(250, 570, 10, 15));
  platforms.add(new Platform(460, 570, 10, 15));
  
  platforms.add(new Platform(550, 585, 220, 15));
  platforms.add(new Platform(550, 570, 10, 15));
  platforms.add(new Platform(760, 570, 10, 15));
  
  platforms.add(new Platform(900, 560, 100, 150));
  
  platforms.add(new Platform(0, 470, 800, 20));
  
  platforms.add(new Platform(150, 355, 115, 15));
  platforms.add(new Platform(150, 370, 850, 20));
  platforms.add(new Platform(850, 200, 150, 170));
  platforms.add(new Platform(270, 310, 100, 20));
  platforms.add(new Platform(420, 220, 100, 20));
  platforms.add(new Platform(630, 260, 100, 20));
  
  platforms.add(new Platform(0, 100, 300, 20));
  platforms.add(new Platform(350, 100, 50, 20));
  platforms.add(new Platform(450, 100, 50, 20));
  platforms.add(new Platform(550, 100, 50, 20));
  platforms.add(new Platform(650, 100, 50, 20));
  platforms.add(new Platform(750, 100, 50, 20));
  
  hazards.add(new Hazard(260, 570, 200, 15, "b"));
  hazards.add(new Hazard(260, 680, 200, 15, "r"));
  hazards.add(new Hazard(560, 570, 200, 15, "r"));
  hazards.add(new Hazard(560, 680, 200, 15, "b"));
  
  hazards.add(new Hazard(265, 355, 585, 15, "g"));
  
  Button b1 = new Button(580, 455);
  Button b2 = new Button(160, 340);
  buttons.add(b1);
  buttons.add(b2);
  doors.add(new Door(0, 455, 150, 20, buttons));
  
  ends.add(new End(0, 40));
}

void loadThree(){
  platforms.add(new Platform(0, 680, 1000, 20));
  platforms.add(new Platform(150, 570, 850, 15));
  platforms.add(new Platform(150, 550, 10, 20));
  platforms.add(new Platform(120, 570, 50, 15));
  
  platforms.add(new Platform(850, 200, 150, 20));
  platforms.add(new Platform(625, 80, 150, 20));
  
  hazards.add(new Hazard(160, 550, 870, 20, "g"));
  
  Button b1 = new Button(800, 665);
  Button b2 = new Button(950, 185);
  buttons.add(b1);
  buttons.add(b2);
  
  doors.add(new Door(200, 550, 150, 20, buttons));
  doors.add(new Door(450, 450, 150, 20, buttons));
  doors.add(new Door(700, 350, 150, 20, buttons));
  
  ends.add(new End(650, 20));
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

void drawComplete(){
  background(233, 214, 247);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(80);
  text("CONGRATS!", width/2, 180);
}
