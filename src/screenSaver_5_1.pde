float x,y,strokeW, pointCount;
int frameCheck = 0;

void setup() {
  size(displayWidth,displayHeight);
  background(random(255), random(255), random(200));
  x = random(width);
  y = random(height);
}

void draw() {
  int rand = int(random(100));
  frameCheck++;
  strokeW = random(1,6);
  pointCount = random(2,20);
  stroke(random(255),random(255),random(255));
  if(frameCheck < 500) {
  if(x > width || x < 0 || y > height || y <0){
    x = random(width);
    y = random(height);
  }else {
    strokeWeight(strokeW);
    if(rand>70) {
      moveRight(x,y,pointCount);
    }else if (rand>45) {
      moveUp(x,y,pointCount);
    }else if (rand>25) {
      moveLeft(x,y,pointCount);
    }else {
      moveDown(x,y,pointCount);
    }
   }
  }else {
    frameCheck = 0;
    background(random(255), random(255), random(255));
  }
}

void moveRight(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX+i,startY);
    x = startX +i;
  }
}

void moveLeft(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX-i,startY);
    x = startX -i;
    
  }
}

void moveUp(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX,startY-i);
    y = startY -i;
    
  }
}

void moveDown(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX,startY+i);
    y = startY +i;
    
  }
}
