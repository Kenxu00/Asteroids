class Asteroids extends GameObject{  
  
  Asteroids() {
    
    lives = 5;
    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(0, 1);
    velocity.rotate (random(0, TWO_PI));
    size = 100;
  
  }
  
  Asteroids(int s, float x, float y) {
  
    lives = 1;
    location = new PVector(x,y);
    velocity = new PVector(0, 1);
    velocity.rotate (random(0, TWO_PI));
    size = s;
  
  }

  
  void show() {
    
    super.show();
    ellipse(location.x, location.y, size, size);
    
  }

  void act() {
    
    super.act();
    
    for (int i = 0; i < g.size(); i++){
     
      GameObject obj = g.get(i);
      if (obj instanceof Bullet || obj instanceof Ship && !((Ship)obj).immune()){
        if (dist(location.x, location.y, obj.location.x, obj.location.y) < (size/2 + obj.size/2)){
          obj.lives--;
          if (obj instanceof Ship) ((Ship)obj).resetImmune();
          lives = 0; 
          asteroidNum--;
          createParticles(this);
          if (size > 25){
            g.add(new Asteroids(size/2, location.x, location.y));
            asteroidNum++;
            g.add(new Asteroids(size/2, location.x, location.y));
            asteroidNum++;
          }
        } 
      }
      
    }
  }
}
