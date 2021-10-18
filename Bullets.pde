class Bullet extends GameObject{
  
  int timer = 500;
  boolean ufo;
  
  Bullet() {
    lives = 1;
    location = new PVector(myShip.location.x, myShip.location.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(10 + myShip.velocity.mag());
    ufo = false;
  }
  
  Bullet(float a, float b, float c, float d) {
    lives = 1;
    ufo = true;
    location = new PVector(a, b);
    velocity = new PVector(c - a, d - b);
    velocity.setMag(3);
  
  }
  
  void show() {
  
    super.show();
    ellipse(location.x, location.y, 10, 10);  
  }
  
  void act() {
    
    location.add(velocity);
    timer--;
    if (timer == 0) lives--;
    
    for (int i = 0; i < g.size(); i++){
     
      GameObject obj = g.get(i);
      if (obj instanceof UFO && ufo == false){
        if (dist(location.x, location.y, obj.location.x, obj.location.y) < (size/2 + obj.size/2)){
          obj.lives = 0;
          lives = 0; 
          createParticles(this);
        }
      } else if (obj instanceof Ship && ufo == true) {
          if (!((Ship)obj).immune())
        if (dist(location.x, location.y, obj.location.x, obj.location.y) < (size/2 + obj.size/2)){
          obj.lives--;
          ((Ship)obj).resetImmune();    
          lives--;
        }
      }
    }
  }
}
