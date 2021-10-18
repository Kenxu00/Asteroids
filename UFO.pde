class UFO extends GameObject{
  
  int side;
  
  UFO () {
    lives = 1;
    side = int(random(0,4));
    size = 30;
    
    if (side == 0) {
      location = new PVector(0, random(0, height));
      velocity = new PVector(2, 0);
    } else if (side == 1) {
      location = new PVector(width, random(0, height));
      velocity = new PVector(-2, 0);
    } else if (side == 2) {
      location = new PVector(random(0, width), 0);
      velocity = new PVector(0, 2);
    } else if (side == 3) {
      location = new PVector(random(0, width), height);
      velocity = new PVector(0, -2);
    }    
  }
  
  void show(){
    fill(#FCFC08);
    circle(location.x, location.y, size);  
  }
  
  void act(){
    super.act(); 
    if (location. y < -30) lives--;
    if (location.y > height + 30) lives--;
    if (location.x < -30) lives--;
    if (location.x > width + 30) lives--;
    
    if (i % 10 == 0) {
      g.add(new Bullet (location.x, location.y, myShip.location.x, myShip.location.y));
    
    }
    

  }
}
