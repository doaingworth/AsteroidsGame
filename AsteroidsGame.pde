Spaceship spaceship;
Star[] twinkle;
ArrayList<Asteroid> aster;
int FoxHealth;
String hpBar;
String gamemode;

public void setup() 
{
  //your code here
  size(900, 900);
  background(0);
  spaceship = new Spaceship(450, 450);
  twinkle = new Star[30];
  for (int n = 0; n < twinkle.length; n++) {
    twinkle[n] = new Star(450, 450);
  }
  for (int n = 0; n < twinkle.length; n++) {
    for (int m = 0; m < twinkle.length - n; m++) {
      twinkle[m].move();
    }
  }
  aster = new ArrayList();
  for (int asteroids = 0; asteroids < 5; asteroids++) {
    aster.add(new Asteroid());
  }
  FoxHealth = 100;
  gamemode = "playing";
}

public void draw() 
{
  //your code here
  if (gamemode == "playing") {
    background(0);
    fill(0, 0, 0);
    rect(0, 0, 240, 40);
    hpBar = "Your HP: " + FoxHealth + "%";
    textSize(32);
    fill(255, 255, 255);
    text(hpBar, 10, 30);
    for (int asteroids = 0; asteroids < aster.size(); asteroids++) {
      aster.get(asteroids).show();
      if (aster.get(asteroids).getLocZ() <= 0 && aster.get(asteroids).getLocZ() >= -10) { 
        if (spaceship.getLocX() >= aster.get(asteroids).getLocX() && spaceship.getLocX() <= aster.get(asteroids).getEdgeX()) {
          if (spaceship.getLocX() >= aster.get(asteroids).getLocX() && spaceship.getLocX() <= aster.get(asteroids).getEdgeX()) {
            collision();
          }
        }
      }
    }
    spaceship.showSpaceship();
    for (int n = 0; n < twinkle.length; n++) {
      twinkle[n].move();
      twinkle[n].show();
    }
    if (FoxHealth <= 0) {
      gamemode = "menu";
    }
    //if (!keyPressed) spaceship.noMovingZ();
  } else if (gamemode == "menu") {
    background(0);
    textSize(32);
    fill(255, 255, 255);
    text("Game Over. press any key to Try Again", 10, 30);
    if (keyPressed) {
      FoxHealth = 100;
      gamemode = "playing";
    }
  }
}

public void collision() {
  FoxHealth -= (int)(Math.random()*7);
}

public void keyPressed() {
  if (keyCode == UP) {
    spaceship.setYspeed(-10);
  } 
  if (keyCode == DOWN) {
    spaceship.setYspeed(10);
  } 
  if (keyCode == LEFT) {
    spaceship.setXspeed(-10);
  } 
  if (keyCode == RIGHT) {
    spaceship.setXspeed(10);
  } 
  if (keyCode == 'W') {
    spaceship.approachZloc(60);
  } 
  if (keyCode == 'S') {
    spaceship.approachZloc(140);
  }
}
