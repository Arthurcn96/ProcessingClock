import peasy.PeasyCam;
PeasyCam cam;

Mostrador mostrador;
Caixa caixa;

float xmag, ymag = 0;
float newXmag, newYmag = 0; 
int zoom = 0;

void setup() {
   size(400, 400, P3D);   
   cursor(HAND);   

   mostrador = new Mostrador();
   caixa = new Caixa();
   
   smooth(8);
   
     //cam = new PeasyCam(this, 400);
  

}

void draw()  {
  background(2);

  //translate(mouseX,mouseY);
  translate(200, 200,zoom);
  rotateX(-ymag); 
  rotateY(-xmag); 
  
  // Carregando partes do Relógio
    caixa.show();
    mostrador.show();

   
  circle(0,0,10);
   
}

void mouseDragged(){
  //print("Clique");
  
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;
  
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { 
    xmag -= diff/4.0; 
  }
  
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { 
    ymag -= diff/4.0; 
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  zoom += e*10;
  println(zoom);
}
