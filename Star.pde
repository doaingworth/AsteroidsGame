class Star //note that this class does NOT extend Floater
{
  protected float locX, locY;
  protected float size;
  protected double xSpeed, ySpeed;
  protected float originX, originY;
  
  Star(int x, int y) {
    locX = x; originX = x;
    locY = y; originY = y;
    size = 1;
    xSpeed = (cos((float)(Math.random()*4)))*30;
    if(Math.random()*2 == 1) xSpeed = -xSpeed;
    ySpeed = (sin((float)(Math.random()*4)))*30;
    if(Math.random()*2 == 1) ySpeed = -ySpeed;
  }
  
  void move() {
    size++;
    locX += xSpeed;
    locY += ySpeed;
    if (size >= 30) {
      locX = originX;
      locY = originY;
      size = 1;
      xSpeed = (cos((float)(Math.random()*4)))*30;
      if((int)(Math.random()*2) == 1) xSpeed = -xSpeed;
      ySpeed = (sin((float)(Math.random()*4)))*30;
      if((int)(Math.random()*2) == 1) ySpeed = -ySpeed;
    }
  }
  
  void show(){
    ellipse(locX, locY, size, size);
  }
}
