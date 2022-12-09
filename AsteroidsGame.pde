Spaceship ship = new Spaceship();
int level = 5;

ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
ArrayList<Asteroid> asteroidsAfterCollisions = new ArrayList<Asteroid>();

Star [] stars = new Star[200];

ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Bullet> bulletsAfterDecay = new ArrayList<Bullet>();

public static int ASTEROID_LARGE = 50;
boolean wPressed, aPressed, dPressed, sPressed;

void setup(){
  size(1000,1000);
  
  for(int i = 0; i<stars.length; i++){
    stars[i] = new Star();
  }
  
  for(int i = 0; i<5; i++){
    asteroids.add(new Asteroid(10, ASTEROID_LARGE, Math.random()*1000,Math.random()*1000));
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
    
  //Asteroids
  for(Asteroid asteroid:asteroids){
    if(dist((float)asteroid.getX(), (float)asteroid.getY(), (float)ship.getX(), (float)ship.getY())>asteroid.getSize()+10){
      asteroidsAfterCollisions.add(asteroid);
    }
    asteroid.move();
    asteroid.show();
  }
  asteroids = asteroidsAfterCollisions;
  asteroidsAfterCollisions = new ArrayList<Asteroid>();
  //Bullets
  for(Bullet bullet:bullets){
    bullet.move();
    bullet.show();
    bullet.decay();
    if(bullet.getTimer()>0)
      bulletsAfterDecay.add(bullet);
  }
  bullets = bulletsAfterDecay;
  bulletsAfterDecay = new ArrayList<Bullet>();
  
  //Bullet & Asteroid collision
  boolean bulletIsValid = true;
  for(Bullet bullet:bullets){
    for(Asteroid asteroid:asteroids){
      if(dist((float)asteroid.getX(), (float)asteroid.getY(), (float)bullet.getX(), (float)bullet.getY())>asteroid.getSize()){
        asteroidsAfterCollisions.add(asteroid);
      }
      else{
        bulletIsValid = false;
      }
    }
    asteroids = asteroidsAfterCollisions;
    asteroidsAfterCollisions = new ArrayList<Asteroid>();
    if(bulletIsValid){
      bulletsAfterDecay.add(bullet);
    }
  }
  bullets = bulletsAfterDecay;
  bulletsAfterDecay = new ArrayList<Bullet>();
  
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
  
  //RESET
  if(asteroids.size() == 0){
    level++;
    ship = new Spaceship();
    
    for(int i = 0; i<level; i++){
      asteroids.add(new Asteroid(10, ASTEROID_LARGE, Math.random()*1000,Math.random()*1000));
    }
    bullets = new ArrayList<Bullet>();
  }
}
void keyPressed(){
  if(key == 'w' || key == 'W')
    wPressed = true;
    
  if(key == 'a' || key == 'A')
    aPressed = true;
    
  if(key == 'd' || key == 'D')
    dPressed = true;
    
  if(key == 's' || key == 'S')
    sPressed = true;
    
  if(key == ' ')
    ship.hyperJump();
  
  if(keyCode == SHIFT)
    bullets.add(new Bullet(ship));
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
