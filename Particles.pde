class Particles extends GameObject {

  int t;

  Particles(GameObject obj) {
    lives = 1;
    size = int(random(5, 12));
    t = int(random(200, 255));
    velocity = new PVector(0, 5);
    location = obj.location.copy();
    velocity.rotate(random(0, PI * 2));
  }

  void show() {
    noStroke();
    fill(255, t);
    circle(location.x, location.y, size);
  }

  void act() {
    super.act();
    t -= 10;
    if (t<=0) lives = 0;
  }
}

void createParticles(GameObject a) {

    for(int i = 0; i <= int(random(5, 20)); i++) {
      g.add(new Particles(a));
    
    }
}
