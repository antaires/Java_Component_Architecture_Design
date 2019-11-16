/*Handles visual display of Entity*/

class Render {
  
  void update(PVector loc, Tag tag){
    switch(tag){
      case PLAYER: drawPlayer(loc);
        break;
      case ENEMY: drawEnemy(loc);
        break;
      case E_BULLET:
      case P_BULLET: drawBullet(loc);
        break;
      case ROCK:
        break;
      case EMPTY:
        break;
    }
  }
    
    void drawPlayer(PVector loc){ 
      fill(70, 102, 255); 
      ellipse(loc.getX(), loc.getY(), 30, 30); 
    }
    
    void drawEnemy(PVector loc){
      fill(98, 16, 6); 
      ellipse(loc.getX(), loc.getY(), 30, 30); 
    }
    
    void drawBullet(PVector loc){
      fill(0); 
      ellipse(loc.getX(), loc.getY(), 5, 5); //change scale to 5
    }
}
