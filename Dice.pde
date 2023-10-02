void setup() {
  noLoop();
  size(500,500);
}

void draw() {
  background(255,213,128);
  Die turn;
  int sum = 0;
  for (int i = 100; i < 301; i += 100) { 
    for (int j = 100; j < 301; j += 100) {
      turn = new Die(j,i);
      turn.roll();
      sum += turn.value;
      turn.show();
    }
  }
  
  text("Total: " + sum,250,450);
}

void mousePressed() {
    redraw();
}

class Die {
    int myX, myY, value, sum;
    
    Die(int x, int y) {
      myX = x;
      myY = y;
      value = 1;
      sum = 0;
    }
    
    void roll() {
      value = (int)((Math.random()*6)+1);
    }
    
    void show() {
      fill(250,250,250);
      rect(myX,myY,100,100);
      fill(0,0,0);
      if ((value == 1) || (value == 3) || (value == 5)) {
        ellipse(myX+50,myY+50,15,15);
      }
      if ((value == 2) || (value == 3) || (value == 4) || (value == 5) || (value == 6)) {
        ellipse(myX+25,myY+25,15,15);
        ellipse(myX+75,myY+75,15,15);
      }
      if ((value == 4) || (value == 5) || (value == 6)) {
        ellipse(myX+25,myY+75,15,15);
        ellipse(myX+75,myY+25,15,15);
      }
      if (value == 6) {
        ellipse(myX+25,myY+50,15,15);
        ellipse(myX+75,myY+50,15,15);
      }
    }
}
