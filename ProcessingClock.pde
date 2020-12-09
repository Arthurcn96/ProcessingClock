import ddf.minim.*;
Minim minim;
AudioPlayer song;
PImage imagem;

Mostrador mostrador;
Botao botao;
Fundo fundo;
Caixa caixa;

color color1;
color color2;
color color3;

float newXmag, newYmag = 0;
boolean botaoPressionado, flag;
float xmag, ymag = 0;
int zoom = -120;
int mX, mY, temp;

int dim = 8;
int tam = 50;

void setup() {

  inicio();

  size(800, 600, P3D);
  cursor(HAND);
  minim = new Minim(this);
  song = minim.loadFile("supermariobros.mp3");
  temp = 1;

  flag = false;

  mostrador = new Mostrador(0);
  caixa = new Caixa(tam, false);
  fundo = new Fundo();
  botao = new Botao();

  botaoPressionado = false;

  mX = (width / 2) + dim;
  mY = (height / 2);

  smooth(8);

  color1 = color(#222831);
  color2 = color(#ee3333);
  color3 = color(#1e41dc);

  imagem = loadImage("fundo.jpg");

}

void inicio(){
  String texto = "['A'] - Muda para o modo perspectiva (2D caso veja diretamente X, Y sem movimentar)\n['S'] - Retorna o background e aproxima a uma posição fixa do relógio\n[Espaço] - Liga & desliga o botão de trilha sonora do relogio\n[Mouse] - Mudança nas luzes que incidem no relógio\n[Mouse Esquerdo] - Rotação nos eixos X, Y e Z\n[Mouse Direito] - Arrasto de posição";
  javax.swing.JOptionPane.showMessageDialog ( null, texto, "FUNCIONALIDADES", javax.swing.JOptionPane.INFORMATION_MESSAGE  );
}

void draw() {
  background(#2d51fd);

  push();
    translate(-2500,-1200,-2000);
    image(imagem, 0, 0);
  pop();

  camera();
  lights();
  pointLight(mouseX/20, mouseY/20, 100, 400, 0, 0);
  ambientLight(mouseX/20, mouseY/20, 100, 400, 0, 0);

  // Carregando partes do Relógio
  botao.show(220,0, botaoPressionado);
  caixa.show(color(color2));
  fundo.show(color(color3));
  mostrador.show();

  pushMatrix();
    sphere(5);
  popMatrix();

}

/**
 Botao pressionado
*/
void keyPressed(){

  if(key=='a' || key == 'A'){
    push();
      directionalLight(0, 0, 100, 400, 0, 0);
      ortho(-width/2, width/2, -height/2, height/2);
    pop();

  }

  if(key == 's' || key == 'S'){
    push();
      ambientLight(0, 0, 100, 400, 0, 0);
      float camY = height/2.0;
      float fov = 550/float(width) * PI/2;
      float camZ = camY / tan(fov/2.0);
      float aspect = float(width)/float(height);
      perspective(fov, aspect, camZ/10, camZ*100);
    pop();
  }
  if(key == ' '){
      botaoPressionado = !botaoPressionado;
      flag = !flag;
      botao.play(flag);
  }
}

void keyReleased(){
  if(key == ' '){
      botaoPressionado = !botaoPressionado;
  }
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
/**
 Zoom da Camera
*/
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  zoom += e*10;
}

/**
 Posicao da Camera
*/
void camera(){
  translate(mX, mY, zoom);
  rotateX(-ymag);
  rotateY(-xmag);
}
