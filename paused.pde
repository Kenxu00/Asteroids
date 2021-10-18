void paused() {
    
   image(pauseGif[int(frames4)], width/2, height/2, width, height); 
   frames4++; //makes the gif move at 60 fps
   if (frames4 >= pauseGif.length){
     frames4 = 0;
   }
   textAlign (CENTER, CENTER);
   textSize(30);
   textFont(Agency);
   text("PAUSED", width/2, height/2);
  
  


}
