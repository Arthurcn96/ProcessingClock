// Quadrado do relógio
class Quadrado{

  PVector pos;
  float len;
  
  

  Quadrado(int x, int y, int len_){
    pos = new PVector(x,y);
    len = len_;
  }

  void show(){


     //strokeWeight(8);
     fill(255);
     pushMatrix();
       
       translate(pos.x, pos.y, pos.z);
       box(len);
     popMatrix();
      
      
   }

}
