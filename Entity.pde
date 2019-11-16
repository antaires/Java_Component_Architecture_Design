//to initialize, specify components in this order as booleans
// Entity(tag, hasRender, hasInput, hasAI, hasShooter, hasHealth, hasPoints)

class Entity {

  Tag tag;
  Render render;
  PVector position; 
  int scale, points;
  Input input;
  AI ai; 
  Shooter shooter;
  Health health;
  boolean hasRender, hasInput, hasAI, hasShooter, hasHealth, hasCollision, hasPoints; 
  
  Entity(Tag t, boolean r, boolean i, boolean a, boolean s, boolean h, boolean p){
    tag = t; 
    hasRender = r;
    hasInput = i;
    hasAI = a;
    hasShooter = s; 
    hasHealth = h;
    hasPoints = p;
    hasCollision = false;
    
    position = new PVector(width/2, height/2);
    scale = 1; 
    if (hasRender){
      render = new Render();
    }
    if (hasInput) {
      input = new Input();
    }
    if (hasAI){
       ai = new AI(); 
    }
    if (hasShooter){
      shooter = new Shooter(tag);
    }
    if (hasHealth){
      health = new Health(tag);
    }
    
    if (hasPoints){
      points = 0;
    }
    
    if (tag.equals(Tag.PLAYER) || tag.equals(Tag.ENEMY)){
      scale = 30; 
    } else if (tag.equals(Tag.P_BULLET) || tag.equals(Tag.E_BULLET)){
      scale = 5;
    }
    
  }

  void update(){
    //draw it
    if (hasRender){
      render.update(position, tag);
    }
    
    //set position with either Input or AI
    if (hasInput){
      input.update();
      position.setAll(input.getLocation());
    } else if (hasAI) {
      ai.update(); 
      position.setAll(ai.getLocation());
    }
    
    if (hasShooter){
      shooter.shoot(position); 
      shooter.update();
    }
    
    //keep in screen if player
  }
  
  //set if visible
  public void setRender(boolean value){
    hasRender = value;
  }
  
  //to check if entity is visible
  public boolean isRendering(){
    return hasRender; 
  }
  
  //for use by shooter class to set bullet position
  public void setPosition(PVector pos){
    position = pos; 
  }
  
  //for use by shooter to get bullet position
  public PVector getPosition(){
    return position;
  }
  
  public void kill(){
    hasRender = false;
    hasShooter = false;
  }
  
  public boolean isDead(){
    if (hasHealth){
      return health.isDead();
    }
    return false;
  }
  
  public int getScale(){
    return scale;
  }
  
  void setHasCollision(boolean value){
    hasCollision = value;
  }
  
  void clearHasCollision(){
    hasCollision = false;
  }
  
  void increasePoints(int p_){
    if(hasPoints){
      points += p_;
    }
  }
  
  int getPoints(){
    if(hasPoints){
      return points;
    }
    return 0;
  }
  
}
