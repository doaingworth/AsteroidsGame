Spaceship spaceship;
Star[] twinkle;
ArrayList<Asteroid> aster;
ArrayList<Bullet> lasers;
int FoxHealth;
int score;
String hpBar;
String gamemode;
String scoreBar;

public void setup() 
{
  //your code here
  size(900, 940);
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
  lasers = new ArrayList();
  for (int asteroids = 0; asteroids < 5; asteroids++) {
    aster.add(new Asteroid());
  }
  FoxHealth = 100;
  score = 0;
  gamemode = "playing";
}

public void draw() 
{
  //your code here
  if (gamemode == "playing") {
    background(0);
    fill(0, 0, 0);
    //rect(0, 900, 240, 40);
    hpBar = "Your HP: " + FoxHealth + "%";
    scoreBar = "Score: " + score;
    textSize(32);
    fill(255, 255, 255);
    text(scoreBar, 10, 930);
    text(hpBar, 660, 930);
    for (int asteroids = 0; asteroids < aster.size(); asteroids++) {
      aster.get(asteroids).show();
      if (aster.get(asteroids).getLocZ() <= 0 && aster.get(asteroids).getLocZ() >= -5) { 
        if (spaceship.getLocX() >= aster.get(asteroids).getLocX() && spaceship.getLocX() <= aster.get(asteroids).getEdgeX()) {
          if (spaceship.getLocX() >= aster.get(asteroids).getLocX() && spaceship.getLocX() <= aster.get(asteroids).getEdgeX()) {
            asteroidCollision(asteroids);
            FoxHealth -= (int)(Math.random()*7);
          }
        }
      }
      for (int guns = 0; guns < lasers.size(); guns++) {
        lasers.get(guns).show();
        if (aster.get(asteroids).getLocZ() <= lasers.get(guns).getLocZ() + 5 && aster.get(asteroids).getLocZ() >= lasers.get(guns).getLocZ() - 5) { 
          if (lasers.get(guns).getLocX() >= aster.get(asteroids).getLocX() && lasers.get(guns).getLocX() <= aster.get(asteroids).getEdgeX()) {
            if (lasers.get(guns).getLocX() >= aster.get(asteroids).getLocX() && lasers.get(guns).getLocX() <= aster.get(asteroids).getEdgeX()) {
              asteroidCollision(asteroids);
              laserCollision(guns);
              score += 100;
            }
          }
        }
        if(lasers.size() > guns) {
          if (lasers.get(guns).getLocZ() <= -100) {
            lasers.remove(guns);
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
      score = 0;
    }
  }
}

public void asteroidCollision(int object) {
  aster.remove(object);
  aster.add(new Asteroid());
}

public void laserCollision(int object) {
  lasers.remove(object);
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
  if (keyCode == 'D') {
    lasers.add(new Bullet(spaceship.getLocX(), spaceship.getLocY()));
  }
}
