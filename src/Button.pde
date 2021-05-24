class Button {
  // Member Variables
  PFont font;
  int x,y,w,h;
  String val;
  boolean hover, isNumber;
  color c1, c2, c3, c4;
  
  // Constructor
  Button(int tempX, int tempY, int tempW, int tempH, String tempVal, boolean isNumber ) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    val = tempVal;
    hover = false;
    c1 = #E3E5E8;
    c2 = #ABADB2;
    c3 = #5996F5;
    c4 = #0C65F0;
    font = createFont("DialogInput.plain-48",32);
    this.isNumber = isNumber;
  }
  
  // Display The Button
  void display() {
    if(isNumber == true) { // number buttons
       if(hover) {
      fill(c2);
    } else {
      fill(c1);
    }
    //rectMode(CENTER);
    rect(x,y,w,h,2);
    fill(#3B3B3B);
    textAlign(CENTER);
    textFont(font);
    text(val,x+w/2,y+30);
    } else { // non-number buttons
       if(hover) {
      fill(c4);
    } else {
      fill(c3);
    }
    //rectMode(CENTER);
    ellipse(x+w/2, y+h/2,w,h);
    fill(#3B3B3B);
    textAlign(CENTER);
    textFont(font);
    text(val,x+w/2,y+30);
    }
  }
  
  // Edge Detection
  void hover() {
    hover = mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }
} 
