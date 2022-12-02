class Spaceship extends Floater {
  private int maxSpeed;
  public Spaceship(){
    corners = 3;
    xCorners = new int[]{-25,25,-25};
    yCorners = new int[]{-25,0,25};
    myColor = 255;
    myCenterX = 500;
    myCenterY = 500;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0; 
    maxSpeed = 10;
  }
  public void accelerate (double dAmount){
    if(Math.abs(myXspeed)<=maxSpeed && Math.abs(myYspeed)<=maxSpeed)
      super.accelerate(dAmount);
    else{
      if(myXspeed>maxSpeed)
        myXspeed=maxSpeed;
      if(myXspeed<-1*maxSpeed)
        myXspeed=-1*maxSpeed;
      if(myYspeed>maxSpeed)
        myYspeed=maxSpeed;
      if(myYspeed<-1*maxSpeed)
        myYspeed=-1*maxSpeed;
    }
  }  
  public void hyperJump(){
    myCenterX = Math.random()*width;
    myCenterY = Math.random()*height;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = Math.random()*360;
  }
  public double getX(){
    return this.myCenterX;
  }
  public double getY(){
    return this.myCenterY;
  }
  public double getPointDirection(){
    return this.myPointDirection;
  }
}
