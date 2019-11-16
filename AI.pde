/*Handles automatic movement for Entity*/

class AI {

  PVector acceleration;
  PVector velocity;
  PVector location;
  float topSpeed = 30;
  
  AI(){
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
    location = new PVector(random(0,width),0);
  }
  
  void update(){
    //set velocity based on user input
    velocity.setX(random(-5, 5));
    velocity.setY(random(-2, 5));
    
    velocity.limit(topSpeed);
    location.add(velocity);
    
  }
  
  void setAcceleration(PVector a){
    acceleration = a; 
  }

  PVector getLocation(){
    return location;
  }
  
}
