// Quadrado do relógio
class Quadrado {

  PVector pos;
  float len;
  boolean border;

  Quadrado(int x, int y, int len_, boolean border_) {
    pos = new PVector(x, y);
    len = len_;
    border = border_;
  }

  void show(){
    if(border){
      strokeWeight(4);
      stroke(1);
    }
    fill(255);
    pushMatrix();
    translate(pos.x, pos.y);
    box(len);
    popMatrix();
  }
}
