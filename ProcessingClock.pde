import peasy.*;

PeasyCam cam;
Mostrador tela;
void setup() {
   size(400, 400, P2D);   
   cursor(HAND);
   strokeCap(ROUND);
   
   
   cam = new PeasyCam(this,400);
   tela = new Mostrador();
   
   smooth(8);
  

}

void draw()  {
  background(2);

  translate(200,200);
  
  
  tela.show();
  
        push();
          fill(255,255,255);
          circle(0,0,10);
          fill(255,255,255);
        pop();
  
  frameRate(60);
   
}
