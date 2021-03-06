// Voxel (Pixel 3D)
class Voxel {

  PVector pos;
  float len;
  boolean border;

  Voxel(int len_, boolean border_) {
    len = len_;
    border = border_;
  }

  void show(float x, float y, color c){
    push();
    translate(x, y);

    if(border){
      strokeWeight(4);
      stroke(1);
    }else{
      noStroke();
    }

    fill(c);
    pushMatrix();
    box(len);
    popMatrix();
    pop();

  }


}
