class Health {

  int currentHealth;
  int damage;
  
  Health (Tag tag) {
      if (tag.equals(Tag.PLAYER)){
        currentHealth = 100;
      } else {
        currentHealth = 5; 
      }
      damage = 0;
  }
  
  void update(){
    currentHealth -= damage;
  }

  void setDamage(int d){
    damage = d;
  }
  
  boolean isDead(){
    if (currentHealth < 0){
      return true;
    }
    return false;
  }
}
