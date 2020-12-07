class Asteroid extends Floater {
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY, myCenterZ; //holds center coordinates   
  protected double myXspeed, myYspeed; //holds the speed of travel in the x and y directions   
  //protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  protected int x, y;
  protected float size;
  protected boolean movingZ;
  int[] offsetsX = {-30, -20, -10, -5, 0, 5, 10, 20, 30, 15, 7, -7, -15, -30};
  int[] offsetsY = {5, 1, 0, -2, -10, -2, 0, 1, 5, 3, 4, 4, 3, 5};
  Asteroid() {
    myCenterZ = -100;
    myXspeed = Math.random()*2 - 1;
    myYspeed = Math.random()*2 - 1;
    myCenterX = Math.random()*900;
    myCenterY = Math.random()*900;
  }
  
  public void show() {
    fill(255,0,0);
    rect((float)myCenterX, (float)myCenterY, (float) (100/Math.abs(myCenterZ)), (float) (100/Math.abs(myCenterZ)));
    move();
  }
  
  public void move() {
    myCenterX += myXspeed;
    myCenterY += myYspeed;
    myCenterZ += 0.25;
    
    if(myCenterZ >= 0 || myCenterX > 900 || myCenterY > 900 || myCenterX < 0 || myCenterY < 0) {
      myCenterZ = -100;
      myXspeed = Math.random()*2 - 1;
      myYspeed = Math.random()*2 - 1;
      myCenterX = Math.random()*900;
      myCenterY = Math.random()*900;
    }
  }
  
  
  public double getLocX() {
    return myCenterX;
  }
  public double getEdgeX() {
    return myCenterX + 100/Math.abs(myCenterZ);
  }
  public double getLocY() {
    return myCenterY;
  }
  public double getEdgeY() {
    return myCenterY + 100/Math.abs(myCenterZ);
  }
  public double getLocZ() {
    return myCenterZ;
  }
}
