class Bullet extends Floater{
  private int timer;
  public Bullet(double x, double y, double direction){
    myColor = color(255, 0 , 0);
    myCenterX = x;
    myCenterY = y;
    myXspeed = Math.cos(radians((float)direction))*5;
    myYspeed = Math.sin(radians((float)direction))*5;
    timer = 60*1;
  }
  public void show(){
    ellipse((float)myCenterX, (float)myCenterY, 3, 3);
  }
  public void decay(){
    timer--;
  }
  public int getTimer(){
    return timer;
  }
}
