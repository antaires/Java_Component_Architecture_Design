/*this class is based on work from the Nature of Code by Daniel Shiffman*/
class PVector {
  
  private float x;
  private float y;
  
  PVector(float x_, float y_){
    x = x_;
    y = y_; 
  }
  
  void setAll(PVector p){
    x = p.x;
    y = p.y;
  }
  
  void setX(float x_){
    x = x_; 
  }
  
  void setY(float y_){
    y = y_; 
  }
  
  float getX(){
    return x; 
  }
  
  float getY(){
    return y; 
  }
  
  void add(PVector v){
    y = y + v.y; 
    x = x + v.x; 
  }
  
  PVector add(PVector v1, PVector v2){
    PVector v3 = new PVector(0,0);
    v3.add(v1);
    v3.add(v2);
    return v3;
  }
  
  void sub(PVector v) {
    x = x - v.x;
    y = y - v.y; 
  }
  
  void mult(float n) {
    x = x * n;
    y = y * n;
  }
  
  void div(float n){
    x = x / n;
    y = y / n;
  }
  
  float mag() {
    return sqrt(x*x + y*y); 
  }
  
  void normalize() {
    float m = mag();
    if (m != 0) {
      div(m); 
    }
  }
  
  void limit(float max){
    if (this.mag() > max){
      this.normalize();
      this.mult(max); 
    } 
  }
  
  PVector random2D(int minX, int maxX, int minY, int maxY){
    PVector rand = new PVector(random(minX, maxX), random(minY, maxY)); 
    return rand; 
  }
  
}
