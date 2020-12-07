// import ddf.minim.*;
// Minim minim;
// AudioPlayer song;

Mostrador mostrador;
Fundo fundo;
Caixa caixa;
PImage imagem;

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
  size(800, 600, P3D);
  cursor(HAND);
  // minim = new Minim(this);
  // song = minim.loadFile("pacman.mp3");


  mostrador = new Mostrador(0);
  caixa = new Caixa(tam, false);
  fundo = new Fundo();

  mX = (width / 2) + dim;
  mY = (height / 2);

  smooth(8);

  color1 = color(#222831);
  color2 = color(#ee3333);
  color3 = color(#2d51fd);

  imagem = loadImage("fundo.jpg");
}

void draw() {
  background(#77aaf5);

  push();
    translate(-2500,-1200,-2000);
    image(imagem, 0, 0);
  pop();
  camera();

  lights();
  pointLight(mouseX/20, mouseY/20, 100, 400, 0, 0);
  ambientLight(mouseX/20, mouseY/20, 100, 400, 0, 0);

  textSize(22);
  // text("'d' - play song", -380, 280);
  // text("'f' - stop song", -380, 310);
  fill(200);

  if(keyPressed){

     // if(key=='d' || key=='D'){
     //   song.play();
     //   song.unmute();
     // }
     //
     // if(key=='f' || key=='F'){
     //   song.mute();
     // }

    if(key=='a' || key == 'A'){
      push();
        textSize(22);
        text("Ortho mode: [A KeyPressed] | Luz direcional", -380, -270);
        text("mouseX: "+mouseX, -380, -240);
        text("mouseY: "+mouseY, -380, -210);
        fill(200);

        directionalLight(0, 0, 100, 400, 0, 0);
        ortho(-width/2, width/2, -height/2, height/2);
      pop();

    }

    if(key == 's' || key == 'S'){
       push();
        textSize(22);
        text("Perspective mode: [S KeyPressed] | Luz ambiente", -380, -270);
        text("mouseX: "+mouseX, -380, -240);
        text("mouseY: "+mouseY, -380, -210);
        fill(200);

        ambientLight(0, 0, 100, 400, 0, 0);
        float camY = height/2.0;
        float fov = mouseX/float(width) * PI/2;
        float camZ = camY / tan(fov/2.0);
        float aspect = float(width)/float(height);
        perspective(fov, aspect, camZ/10, camZ*100);
      pop();
    }

   }


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
