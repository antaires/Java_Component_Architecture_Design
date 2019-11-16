public class BoxCollider {
  
  public boolean hasCollision(Entity ent_a, Entity ent_b){
    
    //get distance between a and b
    PVector a = new PVector(ent_a.getPosition().getX(), ent_a.getPosition().getY());
    PVector b = new PVector(ent_b.getPosition().getX(), ent_b.getPosition().getY());
    a.sub(b);
    float distance = a.mag();
    System.out.println("distance" + distance);
    
    //take into account scale
    float scale = ent_a.getScale() + ent_b.getScale();
    System.out.println("scale " + scale);
    
    if( distance < scale ){
      ent_a.setHasCollision(true);
      ent_b.setHasCollision(true);
      return true;
    }
    return false;
  }
}
