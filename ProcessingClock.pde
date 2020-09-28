Mostrador mostrador;
Caixa caixa;

float xmag, ymag = 0;
float newXmag, newYmag = 0;
int zoom = 0;
int mX, mY;


int dim = 3;
Quadrado[][] quadrado = new Quadrado[dim][dim];

void setup() {
   size(400, 400, P3D);
   cursor(HAND);
   
   mostrador = new Mostrador();
   caixa = new Caixa();
   
   for(int i = 0; i < dim; i++){
     for(int j = 0; j < dim; j++){
     
       int len = 10;
       int offset = (dim*len)/2 - len/2;
       int x = len * i - offset;
       int y = len * j - offset;
       quadrado[i][j] = new Quadrado(x,y,len);
       
     }
   }
   
   mX = (width / 2) + dim*7;
   mY = (height / 2);

   smooth(8);

}

void draw()  {
  background(101);

  //translate(mouseX,mouseY);
  translate(mX-20, mY,zoom);
  rotateX(-ymag);
  rotateY(-xmag);

  // Carregando partes do Relógio
   //caixa.show();
    mostrador.show();
  
   for(int i = 0; i < dim; i++){
     for(int j = 0; j < dim; j++){
       
       pushMatrix();
       scale(10);
       noStroke();
       quadrado[i][j].show();
       popMatrix();
     }
   }

  // circle(0,0,10);
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
