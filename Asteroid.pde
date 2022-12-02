class Asteroid extends Floater {
  private double rotationSpeed;
  private int size;
  public Asteroid(int n, int size, double x, double y){
    rotationSpeed = Math.random()*5;
    corners = n;
    xCorners = new int[n];
    yCorners = new int[n];
    this.size = size;
    for(int i = 0; i < n; i++){
      xCorners[i] = (int)(Math.cos(radians(360/n * i)) * size + (Math.random()*(size-10)-size/2));
      yCorners[i] = (int)(Math.sin(radians(360/n * i)) * size + (Math.random()*(size-10)-size/2));
      //ellipse((float)Math.sin(radians(360/n * i))*size,(float)Math.cos(radians(360/n * i))*size,25,25);
    }
    myColor = 255;
    myCenterX = x;
    myCenterY = y;
    myXspeed = Math.random()*11-5;
    myYspeed = Math.random()*11-5;
    myPointDirection = 0; 
  }
  public double getSize(){
    return this.size;
  }
  public double getX(){
    return this.myCenterX;
  }
  public double getY(){
    return this.myCenterY;
  }
  void move(){
    turn(rotationSpeed);
    super.move();
  } 
}
