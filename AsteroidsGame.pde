Spaceship ship = new Spaceship();
Star [] stars = new Star[200];
boolean wPressed, aPressed, dPressed, sPressed;
void setup(){
  size(1000,1000);
  for(int i = 0; i<stars.length; i++){
    stars[i] = new Star();
  }
}
void draw(){
  background(0);
  //stars
  for(Star star:stars)
    star.show();
    
  //ship
  ship.show();
  ship.move();
    
  //movement
  if(wPressed){
    ship.accelerate(0.25);
  }
  if(aPressed){
    ship.turn(-3);
  }
  if(dPressed){
    ship.turn(3);
  }
}
void keyPressed(){
  if(key == 'w')
    wPressed = true;
    
  if(key == 'a')
    aPressed = true;
    
  if(key == 'd')
    dPressed = true;
    
  if(key == 's')
    sPressed = true;
    
  if(key == ' ')
    ship.hyperJump();
}
void keyReleased(){
  if(key == 'w')
    wPressed = false;
    
  if(key == 'a')
    aPressed = false;
    
  if(key == 'd')
    dPressed = false;
    
  if(key == 's')
    sPressed = false;
}
