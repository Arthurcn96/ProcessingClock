Mostrador mostrador;
Caixa caixa;

float xmag, ymag = 0;
float newXmag, newYmag = 0; 
int zoom = 0;
int mX = 200, mY = 200;

void setup() {
   size(400, 400, P3D);   
   cursor(HAND);   

   mostrador = new Mostrador();
   caixa = new Caixa();
   
   smooth(8);

}

void draw()  {
  background(2);

  //translate(mouseX,mouseY);
  translate(mX, mY,zoom);
  rotateX(-ymag); 
  rotateY(-xmag); 
  
  // Carregando partes do Relógio
  caixa.show();
  mostrador.show();

  circle(0,0,10);
}

void mouseDragged(){
  
  if (mouseButton == LEFT) {
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
  }if (mouseButton == RIGHT || mouseButton == CENTER) {
    mX = mouseX;
    mY = mouseY;
    
  }
}

void mousePressed() {

}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  zoom += e*10;
}
