/* Takes user input and applies it as forces to move the Entity */
class Input {
  
  PVector acceleration;
  PVector velocity; 
  PVector location; 
  boolean moveUp, moveDown, moveLeft, moveRight;
  float moveForce = 7; 
  
  Input(){
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
    location = new PVector(width/2, height/2);
  }
  
  void update(){
    //set velocity based on user input
    velocity.setX(acceleration.getX() + moveForce * (int(moveRight)-int(moveLeft)));
    velocity.setY(acceleration.getY() + moveForce * (int(moveDown)-int(moveUp)));
    location.add(velocity);
  }

  PVector getLocation(){
    return location;
  }
  
  boolean setMove(int k, boolean b){
    switch(k) {
      case 'W':
      case 'w':
      case UP:
        return moveUp = b;
      case 'A':
      case 'a':
      case LEFT:
       return moveLeft = b;
      case 'S':
      case 's':
      case DOWN:
        return moveDown = b;
      case 'D':
      case 'd':
      case RIGHT:
        return moveRight = b;
      default:
        return b;
    }
  }

}
