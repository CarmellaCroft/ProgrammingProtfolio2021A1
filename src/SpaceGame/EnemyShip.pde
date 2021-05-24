class EnemyShip {
  int rad, health, x, y, speed, healthStart;
  boolean right;
  int savedTime; 
  int totalTime;

  //constructor
  EnemyShip(int x, int y, int t, int health) {
    healthStart = health;
    rad = 25;
    this.x = x;
    this.y = y;
    this.health = health;
    speed = 5;
    this.totalTime = t;
  }


  //display method
  void display() {
    fill(#F29420);
    fill(#F57811);
    stroke(88);
    triangle(x+20, y-20, x+10, y+10, x-20, y-30);
    triangle(x-20, y-20, x-10, y+10, x+20, y-30);
    fill(#8583A2);
    triangle(x, y+15, x-35, y-10, x+35, y-10);
    fill(#832F0D);
    ellipse(x, y, 20, 80);
    fill(0);
    textSize(12);
    textAlign(CENTER);
    text(health, x, y);
  }

  void move() {
    x += speed;
    if (x >= width|| x <= 0) {
      speed *= -1;
      y+=50;
    }
  }
  boolean laserIntersect(Laser laser) {
    // Calculate distance
    float distance = dist(x, y, laser.x, laser.y); 

    // Compare distance to sum of radii
    if (distance < rad + laser.rad) { 
      return true;
    } else {
      return false;
    }
  }

  void start() {
    savedTime = millis();
  }


  boolean isFinished() { 
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
