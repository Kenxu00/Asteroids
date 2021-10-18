void keyPressed() {
  
  if (key == 'w') up = true;
  if (key == 's') down = true;
  if (key == 'a') left = true;
  if (key == 'd') right = true;
  if (key == ' ') space = true;
  if (key == 'e') tp = true;
}

void keyReleased () {
  
  if (key == 'w') up = false;
  if (key == 's') down = false;
  if (key == 'a') left = false;
  if (key == 'd') right = false;
  if (key == ' ') space = false;
  if (key == 'e') tp = false;

}

void mouseReleased(){

  if (mode == intro){mode = instructions;}
  else if (mode == instructions) {mode = game;}
  else if (mode == game) {mode = paused;}
  else if (mode == paused) {mode = game;}
  else if (mode == gameOver){
    asteroidNum = 5;
    i = 0;
    setup();
    mode = intro;

}

}
  
  
