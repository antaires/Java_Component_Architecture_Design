/*Handles adding force to bullets, and setting bullet start location as Entity holding the shooter*/

class Shooter {

  PVector location; 
  PVector currPos; //temp for bullets
  PVector velocity; 
  //has list of bullets entities
  List<Entity> magazine;
  int numBullets = 20;
  int magCount = 0;
  int shooterCount = 0;
  int shootTimer = 10;
  Tag bulletTag;
  int bulletForce = 5;
  int enemyHandicap = 2;
  
  Shooter(Tag t){
    location = new PVector(0,0);
    currPos = new PVector(0,0);
    magazine = new ArrayList<Entity>(); 
    
    //use P_BULLET for PLAYER and E_BULLET for ENEMY
    if (t.equals(Tag.PLAYER)){
      bulletTag = Tag.P_BULLET;
      velocity = new PVector(0, -bulletForce);
    } else if (t.equals(Tag.ENEMY)){
      bulletTag = Tag.E_BULLET;
      velocity = new PVector(0, bulletForce - enemyHandicap);
      shootTimer += 40;
    }
    
    //add bullets
    for (int i = 0; i < numBullets; i++){
      // Entity(tag, hasRender, hasInput, hasAI, hasShooter, hasHealth, hasPoints)
      Entity bullet = new Entity(bulletTag, true, false, false, false, false, false);
      magazine.add(bullet); 
    }
  }
  
  void update(){
    //loops over its list of bullets and renders them if visible
    for(int i = 0; i < magazine.size(); i++){
      if (magazine.get(i).isRendering()){
        //update bullet position with velocity
        
        //set bullet position of entity
        currPos = magazine.get(i).getPosition();
        magazine.get(i).setPosition(currPos.add(currPos, velocity));
        
        //update bullet to render it
        magazine.get(i).update();
      }
    }
  }
  
  void shoot(PVector location){
    
    //add delay between shooting
    if (shooterCount++ % shootTimer == 0){
      //makes a bullet visible
      magazine.get(magCount).setRender(true);
    
      //sets its location to location
      magazine.get(magCount++).setPosition(location);
      if (magCount >= magazine.size()){
        magCount = 0;
      }   
    }
  }
  
  //used by main game loop to check for collisions
  List<Entity> getMagazine(){
    return magazine;
  }

}
