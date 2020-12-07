//import java.util.concurrent.TimeUnit;

class Spaceship extends Floater  
{ protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY, myCenterZ; //holds center coordinates   
  protected double myXspeed, myYspeed; //holds the speed of travel in the x and y directions   
  //protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  protected int x, y;
  protected boolean movingZ;
  int[] offsetsX = {-30, -20, -10, -5, 0, 5, 10, 20, 30, 15, 7, -7, -15, -30};
  int[] offsetsY = {5, 1, 0, -2, -10, -2, 0, 1, 5, 3, 4, 4, 3, 5};
  
  Spaceship(double locX, double locY) {
    corners = 14;
    myCenterX = locX;
    myCenterY = locY;
    myCenterZ = 1;
    xCorners = new int[14];
    yCorners = new int[14];
    myColor = 255;
  }
  
  void showSpaceship() {
    x = /*(int) myCenterX - */(int)(myCenterZ * (myCenterX - 450))+450;
    y = /*(int) myCenterY - */(int)(myCenterZ * (myCenterY - 450))+450;
    if (myCenterZ < 1 && !movingZ) myCenterZ += 0.05;
    if (myCenterZ > 1 && !movingZ) myCenterZ -= 0.05;
    for (int n = 0; n < corners; n++) {
      xCorners[n] = (int)(4*myCenterZ*offsetsX[n] + x);
      yCorners[n] = (int)(4*myCenterZ*offsetsY[n] + y);
    }
    move();
    //System.out.println(x);
    show();
    /*try {TimeUnit.MILLISECONDS.sleep(5);}
    catch (Exception x) {;}*/
  }
  
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);
    stroke(myColor);
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);
  }   
  
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     
    
    myXspeed *= 0.9;
    myYspeed *= 0.9;
  }   
  
  public double getLocX() {
    return myCenterX;
  }
  public double getLocY() {
    return myCenterY;
  }
  public void setXspeed (float toSetTo) {
    myXspeed = toSetTo;
  } 
  public void setYspeed (float toSetTo) {
    myYspeed = toSetTo;
  } 
  public void approachZloc (float toGoTo) {
    if (myCenterZ * 100 > toGoTo) myCenterZ -= 0.1; 
    if (myCenterZ * 100 < toGoTo) myCenterZ += 0.1;
    movingZ = false;
  } 
  public void noMovingZ() {
    movingZ = false;
  }
  
  class Laser {
    float xPos, yPos, zPos;
    boolean isShot;
    Laser() {
      xPos = (float) myCenterX;
      yPos = (float) myCenterY;
      zPos = (float) 1;
      isShot = false;
    }
    
    void move() {
      if (isShot) {
        xPos = /*(int) myCenterX - */(int)(myCenterZ * (myCenterX - 450))+450;
        yPos = /*(int) myCenterY - */(int)(myCenterZ * (myCenterY - 450))+450;
        zPos -= 0.05;
        if (xPos == 450 && yPos == 450) isShot = false;
      } else {
        xPos = (float) myCenterX;
        yPos = (float) myCenterY;
        zPos = (float) myCenterZ;
      }
    }
    
    void show() {
      rect(xPos, yPos, 30*zPos, 30*zPos);
    }
    
    void Fire() {
      if(!isShot) isShot = true;
    }
  }
}
