//Asteroids
PFont Agency;
boolean up, down, left, right, space, tp = false;
Ship myShip;
ArrayList <GameObject> g;
int asteroidNum = 5;
final int intro = 0;
final int game = 1;
final int gameOver = 2;
final int paused = 3;
final int instructions = 4;
int i = 0;
int mode = 0;
PImage [] winGif;
int frames2 = 0;
PImage [] loseGif;
int frames3 = 0;
PImage [] pauseGif;
int frames4 = 0;

void setup() {

  size (800, 600);
  myShip = new Ship();
  imageMode(CENTER);
  g = new ArrayList<GameObject>();
  g.add(myShip);
  for (int i = 1; i <= asteroidNum; i++) {
    g.add(new Asteroids());
  }

  Agency = createFont("OriginTech.ttf", 30);

  gifFrames = new PImage [22];
  for (int i = 0; i < 22; i++) {
    if (i < 10) gifFrames [i] = loadImage("frame_0" + i + "_delay-0.01s.gif");
    else gifFrames [i] = loadImage("frame_" + i + "_delay-0.01s.gif");
  }

  loseGif = new PImage [10];
  for (int i = 0; i < 10; i++) {
    loseGif [i] = loadImage("frame_0" + i + "_delay-0.13s.gif");
  }

  winGif = new PImage [86];
  for (int i = 0; i < 86; i++) {
    if (i < 10) winGif [i] = loadImage("frame_0" + i + "_delay-0.05s.gif");
    else winGif [i] = loadImage("frame_" + i + "_delay-0.05s.gif");
  }

  pauseGif = new PImage [81];
  for (int i = 0; i < 81; i++) {
    if (i < 10) pauseGif [i] = loadImage("frame_0" + i + "_delay-0.04s.gif");
    else pauseGif [i] = loadImage("frame_" + i + "_delay-0.04s.gif");
  }
}







void draw() {

  if (mode == intro) {
    loadIntro();
    
  } else if (mode == instructions){
    loadIns();
    
  } else if (mode == game) {

    background(0);
    text("Lives: " + myShip.lives , 150, 50);
    
    i++;
    if (i == 600) {
      i = 0;
      g.add(new UFO());
    }

    for (int i = 0; i < g.size(); i++) {

      GameObject obj = g.get(i);
      obj.act();
      obj.show();

      if (obj.lives <= 0) g.remove(i);
    }
    myShip.show();

    if (myShip.lives == 0|| asteroidNum <=0) mode = gameOver;
    
  } else if (mode == gameOver) {
    
    if (asteroidNum <= 0) gameOver(true);
    else if (myShip.lives <= 0) gameOver(false); 
    
    } else if (mode == paused) {
      paused();
    }
  }
