Spaceship floater;
Star[] twinkle;

public void setup() 
{
  //your code here
  size(900, 900);
  background(0);
  floater = new Spaceship(450,450);
  twinkle = new Star[30];
  for(int n = 0; n < twinkle.length; n++) {
    twinkle[n] = new Star(450,450);
  }
  for(int n = 0; n < twinkle.length; n++) {
    for(int m = 0; m < twinkle.length - n; m++) {
      twinkle[m].move();
    }
  }
}

public void draw() 
{
  //your code here
  background(0);
  floater.showSpaceship();
  for(int n = 0; n < twinkle.length; n++) {
    twinkle[n].move();
    twinkle[n].show();
  }
  if (!keyPressed) floater.noMovingZ();
}

public void keyPressed() {
  if (keyCode == UP) {
    floater.setYspeed(-10);
  } if (keyCode == DOWN) {
    floater.setYspeed(10);
  } if (keyCode == LEFT) {
    floater.setXspeed(-10);
  } if (keyCode == RIGHT) {
    floater.setXspeed(10);
  } if (keyCode == 'W') {
    floater.approachZloc(60);
  } if (keyCode == 'S') {
    floater.approachZloc(140);
  }
}
