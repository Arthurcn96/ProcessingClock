Mostrador mostrador;
Caixa caixa;
Quadrado quadrado;

float xmag, ymag = 0;
float newXmag, newYmag = 0;
int zoom = 0;
int mX = 200, mY = 200;

boolean sc = true;
boolean nc = false;

void setup() {
   size(400, 400, P3D);
   cursor(HAND);

   boolean[][] meuCubo = { {nc, sc, sc, nc},
                           {sc, nc, nc, sc},
                           {sc, nc, nc, sc},
                           {nc, sc, sc, nc}  };

   // mostrador = new Mostrador();
   // caixa = new Caixa();
   quadrado = new Quadrado(20,10, meuCubo);

   smooth(8);

}

void draw()  {
  background(101);

  //translate(mouseX,mouseY);
  translate(mX, mY,zoom);
  rotateX(-ymag);
  rotateY(-xmag);

  // Carregando partes do Relógio
  // caixa.show();
  // mostrador.show();
  quadrado.show();

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
