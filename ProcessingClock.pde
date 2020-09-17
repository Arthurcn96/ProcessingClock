import peasy.*;

PeasyCam cam;
Mostrador tela;
void setup() {
   size(400, 400, P3D);   
   cursor(HAND);
   strokeCap(ROUND);
   
   
   cam = new PeasyCam(this,400);
   tela = new Mostrador();
   
   smooth(8);
  

}

void draw()  {
  background(2);

  
  
  tela.show();
  
  frameRate(60);
   
}
