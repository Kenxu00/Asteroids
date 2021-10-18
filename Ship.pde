class Ship extends GameObject {

  //instance variables
  PVector direction;
  int shotTimer, threshold, immunity, tpTimer = 0;

  Ship () {

    lives = 3;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    size = 40;
  }

  void teleport() {

    if (tpTimer > 600) {
      float x2 = random(width);
      float y2 = random(height);

      for (int i = 0; i < g.size(); i++) {
        GameObject obj = g.get(i);
        if (dist(x2, y2, obj.location.x, obj.location.y) < 300) {
          teleport();
        }
      } 
      location.x = x2;
      location.y = y2;
      velocity.setMag(0);
      tpTimer = 0;
    }
  }

  public boolean immune() {

    if (immunity >= 120) return false;
    else return true;
  }

  public void resetImmune() {
    immunity = 0;
  }

  void show() {

    stroke(255);
    if (immune()) fill (150);
    else fill(255);
    pushMatrix();
    translate(location.x, location.y);
    rotate (direction.heading());
    triangle (-25, -25, -25, 25, 25, 0);

    popMatrix();
  }

  void act() {
    super.act();

    shotTimer++;
    immunity++;
    tpTimer++;
    
    if (tpTimer > 600) {
    
      text("Teleport Ready", 150, 75);
    
    }

    if (up) {
      velocity.add(direction);
      g.add(new Fire());
    }
    if (down) velocity.sub(direction);
    if (left) direction.rotate (-radians (5));
    if (right) direction.rotate (radians (5));
    if (space && shotTimer >= threshold) {

      g.add(new Bullet());
      shotTimer = 0;
      threshold = 30;
    }
    
    if (tp) teleport();
  }
}
