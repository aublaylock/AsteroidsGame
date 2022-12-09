class Bullet extends Floater{
  private int timer;
  public Bullet(Spaceship start){
    myColor = color(255, 0 , 0);
    myCenterX = start.getX();
    myCenterY = start.getY();
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = start.getPointDirection();
    timer = 60*1;
    this.accelerate(20);
  }
  public void show(){
    ellipse((float)myCenterX, (float)myCenterY, 3, 3);
  }
  public void decay(){
    timer--;
  }
  public double getX(){
    return this.myCenterX;
  }
  public double getY(){
    return this.myCenterY;
  }
  public int getTimer(){
    return timer;
  }
}
