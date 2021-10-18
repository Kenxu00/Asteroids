class Fire extends GameObject{

  int t;
  PVector nudge;
  
  Fire(){
    
    lives = 1;
    size = int(random(5,12));
    t = int(random(200, 255));
    location = myShip.location.copy();
    velocity = myShip.direction.copy();
    nudge = myShip.direction.copy();
    nudge.rotate(PI);
    nudge.setMag(15);
    velocity.rotate(PI + random(-0.5));
    velocity.setMag(3);
    location.add(nudge);
  
  }
  
  void show(){
    noStroke();
    fill(255,0,0,t);
    circle(location.x, location.y, size);
    
    
  }

  void act(){
    super.act();
    t -= 10;
    if (t<=0) lives = 0;
  }
}
