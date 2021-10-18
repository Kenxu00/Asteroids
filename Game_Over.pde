

void gameOver(boolean win) {

  if(win){
   image(winGif[frames2], width/2, height/2, width, height);
   frames2++;
   if (frames2 >= winGif.length){
     frames2 = 0;
   }
   textAlign (CENTER, CENTER);
   textSize(20);
   fill(20);
   textFont(Agency);
   text("You Win", width/2, height/2 - 25);
   text("Click to Restart", width/2, height/2 + 25);
  }
  else {
   image(loseGif[int(frames3/6)], width/2, height/2, width, height); 
   frames3++;
   //System.out.println(frames3);
   if (frames3 >= loseGif.length*6){
     frames3 = 0;
   }
   textAlign (CENTER, CENTER);
   textSize(15);
   textFont(Agency);
   text("You Lose", width/2, height/5);
   text("Click to Restart", width/2, height*4/5);
  }
}
