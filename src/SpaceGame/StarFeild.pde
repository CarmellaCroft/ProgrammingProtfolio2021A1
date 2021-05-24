class StarFeild{
  int x,y,speed,dia;
  color c;
  
  StarFeild(int x, int y) {
    this.x = x;
    this.y = y;
    c = color(#F0D90A);
    speed = int(random(1,6)); 
    dia = int(random(1,5));
  }
  
  void display() {
    rectMode(CENTER);
    noStroke();
    fill(c);
    ellipse(x,y,dia,dia);
  }
  
   void move() {
   y+=speed;
 }
  boolean reachedBottom() {
   if(y>height+50) {
      return true;
    } else {
      return false;
    }
  }
}
