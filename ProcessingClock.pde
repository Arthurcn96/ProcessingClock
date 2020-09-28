Mostrador mostrador;
Caixa caixa;

float xmag, ymag = 0;
float newXmag, newYmag = 0;
int zoom = 0;
int mX, mY;


int dim = 6;
Quadrado[][] quadrado = new Quadrado[dim][dim];

void setup() {
  size(400, 400, P3D);
  cursor(HAND);

  mostrador = new Mostrador(35);
  caixa = new Caixa();

  createQuadrado(6);

  mX = (width / 2) + dim;
  mY = (height / 2);

  smooth(8);
}

void draw() {
  background(101);

  camera();

  // Carregando partes do Relógio
  //caixa.show();
  mostrador.show();
  showQuadrado();

  pushMatrix();
    fill(#000000);
    translate(0,0,20);
    sphere(20);
  popMatrix();



}

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

void mousePressed() {
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  zoom += e*10;
}

/** Criacção dos quadrados
*/
void createQuadrado(int len_){

  int len = len_;
  int offset;
  int x;
  int y;

  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {

      offset = (dim*len)/2 - len/2;
      x = len * i - offset;
      y = len * j - offset;
      quadrado[i][j] = new Quadrado(x, y, len);
    }
  }
}

/**
Mostra os quadrados em tela
*/
void showQuadrado(){
  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {

      pushMatrix();
      scale(10);
      noStroke();
      quadrado[i][j].show();
      popMatrix();
    }
  }
}

/**
Rotacao da Camera
*/
void camera(){
  translate(mX, mY, zoom);
  rotateX(-ymag);
  rotateY(-xmag);
}
