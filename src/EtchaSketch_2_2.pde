//Global Variables
int x, y;

void setup() {
  size(400,400);
  frameRate(10);
  x=10;
  y=10;
}

void draw() {
  fill(0);
  drawName();
  noLoop(); 
}


void drawName() {
  moveRight(10);
  moveDown(10);
  moveLeft(10);
  moveUp(10);
  moveRightUp(30);
}

//method to draw  a line to the right
void moveRight(int rep) {
  for(int i=0; i<rep; i++){
    point(x+i,y);
  }
  x=x+rep;
}

void moveDown(int rep) {
   for(int i=0; i<rep; i++){
     point(x,y+i);
   }
   y=y+rep;
}

void moveLeft (int rep) {
     for(int i=0; i<rep; i++){
    point(x-i,y);
  }
  x=x-rep;
}

void moveUp (int rep) {
 for(int i=0; i<rep; i++){
    point(x,y-i);
  }
  y=y-rep;
}

void moveRightUp(int rep) {
   for(int i=0; i<rep; i++){
    point(x+i,y-i);
  }
  x=x+rep;
  y=y-rep;
}
