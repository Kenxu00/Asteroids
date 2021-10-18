PImage [] gifFrames;
int frames = 0;

void loadIntro(){
  
   image(gifFrames[int(frames/2)], width/2, height/2, width, height); 
   frames++; //makes the gif move at 60 fps
   if (frames >= gifFrames.length){
     frames = 0;
   }
   textAlign (CENTER, CENTER);
   textSize(15);
   textFont(Agency);
   fill(#B92FC9);
   text("Press Anywhere", 250, 50);
   text("to Start", 263, 75);
  
  
}
