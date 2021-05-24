//Carmella Croft
// Computer Programming 1
// 2020 caculator




Button[] numButtons = new Button[10];
Button[] opButtons = new Button[13];
String dVal;
String op = "";
boolean left = true;
float r = 0.0;
float l = 0.0;
float result = 0.0;
int currentNum = 0;


void setup() {
  size(260, 500);
  dVal = "0.0";
  numButtons[0] = new Button(80, 420, 40, 40, "0", true);
  numButtons[1] = new Button(20, 360, 40, 40, "1", true);
  numButtons[2] = new Button(80, 360, 40, 40, "2", true);
  numButtons[3] = new Button(140, 360, 40, 40, "3", true);
  numButtons[4] = new Button(20, 300, 40, 40, "4", true);
  numButtons[5] = new Button(80, 300, 40, 40, "5", true);
  numButtons[6] = new Button(140, 300, 40, 40, "6", true);
  numButtons[7] = new Button(20, 240, 40, 40, "7", true);
  numButtons[8] = new Button(80, 240, 40, 40, "8", true);
  numButtons[9] = new Button(140, 240, 40, 40, "9", true);


  opButtons[0] = new Button(200, 420, 40, 40, "=", false);
  opButtons[1] = new Button(200, 360, 40, 40, "+", false);
  opButtons[2] = new Button(200, 300, 40, 40, "-", false);
  opButtons[3] = new Button(200, 240, 40, 40, "x", false);
  opButtons[4] = new Button(200, 180, 40, 40, "÷", false);
  opButtons[5] = new Button(140, 180, 40, 40, "^", false);
  opButtons[6] = new Button(80, 180, 40, 40, "%", false);
  opButtons[7] = new Button(20, 180, 40, 40, "C", false);
  opButtons[8] = new Button(50, 130, 40, 40, "co", false);
  opButtons[9] = new Button(110, 130, 40, 40, "R", false);
  opButtons[10] = new Button(170, 130, 40, 40, "√", false); 
  opButtons[11] = new Button(20, 420, 40, 40, "±", false);
  opButtons[12] = new Button(140, 420, 40, 40, ".", false);
}

void draw() {
  background(#525252);

  updateDisplay();

  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].hover();
    numButtons[i].display();
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].hover();
    opButtons[i].display();
  }
 
}


void updateDisplay() {
  rectMode(CORNER);
  fill(#C9CACB);
  rect(20, 20, 220, 100, 2);
  fill(0);
  textAlign(RIGHT);

  //Render Scaleing Text
  if (dVal.length()<13) {
    textSize(32);
  } else if (dVal.length()<14) {
    textSize(28);
  } else if (dVal.length()<15) {
    textSize(26);
  } else if (dVal.length()<17) {
    textSize(24);
  } else if (dVal.length()<19) {
    textSize(22);
  } else if (dVal.length()<21) {
    textSize(20);
  } else if (dVal.length()<23) {
    textSize(18);
  } else {
    textSize(14);
  }
  text(dVal, width-25, 110);
}

void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].hover && dVal.length()<20) {
      handleEvent(numButtons[i].val, true);
    }
  }

  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].hover) {
      handleEvent(opButtons[i].val, false);
    }
  }
}

void keyPressed() {
  println("KEY:" + key + "KeyCode:" + keyCode);

   if (key == '0') {
    handleEvent("0", true);
  } else if (key == '1') {
    handleEvent("1", true);
  } else if (key == '2') {
    handleEvent("2", true);
  } else if (key == '3') {
    handleEvent("3", true);
  } else if (key == '4') {
    handleEvent("4", true);
  } else if (key == '5') {
    handleEvent("5", true);
  } else if (key == '6') {
    handleEvent("6", true);
  } else if (key == '7') {
    handleEvent("7", true);
  } else if (key == '8') {
    handleEvent("8", true);
  } else if (key == '9') {
    handleEvent("9", true);
  } else if (key == '+') {
    handleEvent("+", false);
  } else if (key == '-') {
    handleEvent("-", false);
  } else if (key == '*') {
    handleEvent("x", false);
  } else if (key == '/') {
    handleEvent("÷", false);
  } else if (key == '.') {
    handleEvent(".", false);
  } else if (key == 'C') {
    handleEvent("C", false);
  } else if (key == 10) { //(key == CODED) {
    if (keyCode == ENTER || keyCode == RETURN) {
      handleEvent("=", false);
  }
 } else if(keyCode == 27)  {
    key = 0;
    if (key == 0) {
      handleEvent("C", false);
    }
  }
}

String handleEvent(String val, boolean num) {
  if (left & num) { // numbers left of op
    if (dVal.equals("0.0") || result == 1) {
      dVal = (val);
      l = float(dVal);
    } else {
      dVal += (val);
      l = float(dVal);
    }
  } else if (!left && num){// numbers right of op
    if (dVal.equals("0.0") || result == 1) {
      dVal = (val);
      r = float(dVal);
    } else {
      dVal += (val);
      r = float(dVal);
    }
  } else if (val.equals("C")) {
    dVal = "0.0";
    result = 0.0;
    left = true;
    r = 0.0;
    l = 0.0;
    op = "";
  } else if (val.equals("+")) {
    if (!left) {
      performCalc();
    } else {
      op = "+";
      left = false;
      dVal = "0.0";
    }
  } else if (val.equals("-")) {
    if (!left) {
      performCalc();
    } else {
      op = "-";
      left = false;
      dVal = "0.0";
    }
  }  else if (val.equals("x")) {
    if (!left) {
      performCalc();
    } else {
      op = "x";
      left = false;
      dVal = "0.0";
    }
  }  else if (val.equals("÷")) {
    if (!left) {
      performCalc();
    } else {
      op = "÷";
      left = false;
      dVal = "0.0";
    }
  } else if (val.equals("%")) {
    if (left) {
      l *= 0.1;
      dVal = str(l);
    } else {
      r *= 0.1;
      dVal = str(r);
    }
  } else if (val.equals("±")) {
    if (left) {
      l *= -1;
      dVal = str(l);
    } else {
      r *= -1;
      dVal = str(r);
    }
  } else if (val.equals("^")) {
    if (left) {
      l = sq(l);
      dVal = str(l);
    } else {
      r = sq(r);
      dVal = str(r);
    }
  } else if (val.equals("√")) {
    if (left) {
      l = sqrt(l);
      dVal = str(l);
    } else {
      r = sqrt(r);
      dVal = str(r);
    }
  }else if (val.equals("co")) {
    if (left) {
      l = cos(radians(l));
      dVal = str(l);
    } else {
      r = cos(radians(r));
      dVal = str(r);
    }
  } else if (val.equals("R")) {
    if (left) {
      l = random(0, 1);
      dVal = str(l);
    } else {
      r = random(0, 1);
      dVal = str(r);
    }
  }else if (val.equals(".") && !dVal.contains(".")) {
    dVal += (val);
  } else if (val.equals("=")) {
    performCalc();
  }
  return val;
}

void performCalc() {
  if (op.equals("+")) {
    result = l + r;
  } else if (op.equals("-")) {
    result = l - r;
  } else if (op.equals("x")) {
    result = l * r;
  } else if (op.equals("÷")) {
    result = l / r;
  }
  l = result;
  dVal = str(result);
  left = true;
}
