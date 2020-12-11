class Bullet extends Floater {
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY, myCenterZ; //holds center coordinates   
  protected double myXspeed, myYspeed, myZspeed; //holds the speed of travel in the x and y directions   
  //protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  protected int x, y;
  protected float size;
  protected boolean movingZ;
  int[] offsetsX = {-30, -20, -10, -5, 0, 5, 10, 20, 30, 15, 7, -7, -15, -30};
  int[] offsetsY = {5, 1, 0, -2, -10, -2, 0, 1, 5, 3, 4, 4, 3, 5};
  Bullet(double centerX, double centerY) {
    myCenterZ = 0;
    myZspeed = 1;
    myXspeed = (int)((myCenterX - 450) * myCenterZ)+450;
    myYspeed = (int)((myCenterY - 450) * myCenterZ)+450;
    myCenterX = centerX;
    myCenterY = centerY;
  }
  
  public void show() {
    move();
    fill(0,255,0);
    ellipse((float)myCenterX, (float)myCenterY, (float) (100/(Math.abs(myCenterZ + 1))), (float) (100/(Math.abs(myCenterZ + 1))));
    //System.out.println(myCenterZ);
    //System.out.println(myZspeed);
  }
  
  public void move() {
    myCenterZ -= 1;
    myZspeed -= 0.1;
    myCenterX = (int)((myCenterX - 450) * myZspeed) + 450;
    myCenterY = (int)((myCenterY - 450) * myZspeed) + 450;
    //myCenterX += myXspeed;
    //myCenterY += myYspeed;
  }
  
  public double getLocX() {
    return myCenterX;
  }
  public double getLocY() {
    return myCenterY;
  }
  public double getLocZ() {
    return myCenterZ;
  }
}
