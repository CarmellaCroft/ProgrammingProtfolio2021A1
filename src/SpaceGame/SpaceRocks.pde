class SpaceRocks {
  int x,y,speed, r, health, healthStart;
  PImage rock5;
   
  //constructor
  SpaceRocks(int x, int y) {
    this.x = x;
    this.y = y;
    speed = int(random(3,9));  
    rock5 = loadImage("rock5.png");
    health = r;
  }
  void move() {
   y+=speed;
 }
 
  boolean laserIntersect(Laser laser) {
    // Calculate distance
    float distance = dist(x, y, laser.x, laser.y); 

    // Compare distance to sum of radii
    if (distance < r + laser.r) { 
      return true;
    } else {
      return false;
    }
  }

  boolean reachedBottom() {
    if (y > height + r*4) { 
      return true;
    } else {
      return false;
    }
  }

  void display() {
    image(rock5,x,y);
    noStroke();
    textSize(9);
    textAlign(CENTER);
    text(health,x,y);
  }
}
  
