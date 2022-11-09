class Star extends Floater{
  Star(){
    myCenterX = Math.random()*width;
    myCenterY = Math.random()*height;
    myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
  }
  public void show(){
    fill(myColor);   
    stroke(myColor);
    ellipse((float)myCenterX, (float)myCenterY, 5, 5);
  }
}
