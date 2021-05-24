class EnemyLaser {
  int x, y, speed, r, power; 
  color c;

  EnemyLaser(int x, int y) {
    r = 4; 
    power = int(random(10,100));
    this.x = x; 
    this.y = y; 
    speed = int(random(5, 22));    
    c = color(#EF0CF0);
  }

  void fire() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y > height) { 
      return true;
    } else {
      return false;
    }
  }

  void display() {
    fill(c);
    noStroke();
    rect(x, y, r, 30);
  }
}
