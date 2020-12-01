Mostrador mostrador;
Fundo fundo;
Caixa caixa;

color color1;
color color2;
color color3;

float newXmag, newYmag = 0;
float xmag, ymag = 0;
int zoom = -120;
int mX, mY;

int dim = 8;
int tam = 50;

void setup() {
  size(400, 400, P3D);
  cursor(HAND);

  mostrador = new Mostrador(0);
  caixa = new Caixa(tam, false);
  fundo = new Fundo();

  mX = (width / 2) + dim;
  mY = (height / 2);

  smooth(8);

  color1 = color(#222831);
  color2 = color(#ee3333);
  color3 = color(#202020);
}

void draw() {

  background(color1);
  camera();

  // Carregando partes do Relógio
  caixa.show(color(color2));
  fundo.show(color(color3));
  mostrador.show();

  pushMatrix();
    sphere(5);
  popMatrix();

}

/**
 Opcoes da Camera
*/
void mouseDragged() {

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
  }
  if (mouseButton == RIGHT || mouseButton == CENTER) {
    mX = mouseX;
    mY = mouseY;
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  zoom += e*10;
}

void camera(){
  translate(mX, mY, zoom);
  rotateX(-ymag);
  rotateY(-xmag);
}
