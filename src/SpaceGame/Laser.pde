class Laser {
  int x,y,speed, rad;
  color c;
  
  //constructor
  Laser(int x, int y) {
     rad = 4; 
    this.x = x; 
    this.y = y; 
    speed = 4;    
    c = color(#FFF824);
  }
  
  //display method
  void display() {
    rectMode(CENTER);
    noStroke();
    fill(c);
    rect(x,y,5,30);
  }
  
 void fire() {
   y-=speed;
 }
 
 boolean reachedTop() {
   if(y<0) {
      return true;
    } else {
      return false;
    }
  }
}
