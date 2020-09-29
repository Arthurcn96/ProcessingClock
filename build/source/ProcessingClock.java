import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ProcessingClock extends PApplet {

Mostrador mostrador;
Caixa caixa;

float xmag, ymag = 0;
float newXmag, newYmag = 0;
int zoom = 0;
int mX, mY;


int dim = 6;
Quadrado[][] quadrado = new Quadrado[dim][dim];

public void setup() {
  
  cursor(HAND);

  mostrador = new Mostrador(35);
  caixa = new Caixa();

  createQuadrado(6);

  mX = (width / 2) + dim;
  mY = (height / 2);

  
}

public void draw() {
  background(101);
  camera();

  // Carregando partes do Relógio
  //caixa.show();
  mostrador.show();
  showQuadrado();

  pushMatrix();
    fill(0xff000000);
    translate(0,0,20);
    sphere(20);
  popMatrix();



}

public void mouseDragged() {

  if (mouseButton == LEFT) {
    newXmag = mouseX/PApplet.parseFloat(width) * TWO_PI;
    newYmag = mouseY/PApplet.parseFloat(height) * TWO_PI;

    float diff = xmag-newXmag;
    if (abs(diff) >  0.01f) {
      xmag -= diff/4.0f;
    }

    diff = ymag-newYmag;
    if (abs(diff) >  0.01f) {
      ymag -= diff/4.0f;
    }
  }
  if (mouseButton == RIGHT || mouseButton == CENTER) {
    mX = mouseX;
    mY = mouseY;
  }
}

public void mousePressed() {
}

public void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  zoom += e*10;
}

/** Criacção dos quadrados
*/
public void createQuadrado(int len_, int[][] matrix){

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
public void showQuadrado(){
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
public void camera(){
  translate(mX, mY, zoom);
  rotateX(-ymag);
  rotateY(-xmag);
}
// Marcação do Minuto - acima do cristal (Nem todo relógio tem)
class Bisel{

  Bisel(){

  }
  
  public void show(){
    
  }
}
// Botão para ligar luz (Nem todo relógio tem)
class Botao{

  Botao(){

  }
  
  public void show(){
    
  }
}
// Corpo do relógio onde as peças são montadas
PShape s;

class Caixa{

  Caixa(){
      s = createShape();

      s.beginShape();
        s.vertex( 0.000000f, 5.000000f, 0.672764f);
        s.vertex( 2.500000f, 4.330127f, 0.672764f);
        s.vertex( 4.330127f, 2.500000f, 0.672764f);
        s.vertex( 5.000000f ,-0.000000f, 0.672764f);
        s.vertex( 4.330127f ,-2.500000f, 0.672764f);
        s.vertex( 2.500000f ,-4.330127f, 0.672764f);
        s.vertex( 0.000001f ,-5.000000f, 0.672764f);
        s.vertex( -2.499999f ,-4.330128f, 0.672764f);
        s.vertex( -4.330126f ,-2.500001f, 0.672764f);
        s.vertex( -5.000000f ,-0.000002f, 0.672764f);
        s.vertex( -4.330129f, 2.499997f, 0.672764f);
        s.vertex( -2.500003f, 4.330125f, 0.672764f);
        s.vertex( 0.000000f, 5.000000f, 0.672764f);
      s.endShape();


        s.scale(40);
        s.setStroke(2);
  }

  public void show(){
      push();
      translate(0,0,-50);
      shape(s, 0, 0);
      pop();
  }
}
// Mecanismo interno
class Calibre{

  Calibre(){

  }
  
  public void show(){
    
  }
}
// Knob para ajustar a hora
class Coroa{

  Coroa(){

  }
  
  public void show(){
    
  }
}
//Vidro do relógio
class Cristal{

  Cristal(){

  }
  
  public void show(){
    
  }
}
// Parte frontal do relógio - Ponteiros e Cronometros
class Mostrador {

  int h;
  int m;
  int s;
  int dist;

  int primary = 0xffE5532D;
  int secondary = 0xffFAC741;
  int tertirary = 0xff61D9CF;

  Mostrador(int translate){

    dist = translate;

  }

  public void show(){

    h = hour();
    m = minute();
    s = second();


    pushMatrix();

      translate(0,0,dist);
      rotate(radians(-50));

      //Segundo
      strokeWeight(5);
      stroke(primary);
      noFill();
      float end = map(s, 0, 60, 0, 360);
      arc(0, 0, 300, 300, 0, radians(end));

      push();
        rotate(radians(end));
        stroke(primary);
        line(0, 0, 100, 0);
      pop();

      //Minuto
      strokeWeight(10);
      stroke(secondary);
      float end1 = map(m, 0, 60, 0, 360);
      arc(0, 0, 280, 280, 0, radians(end1));

      push();
        rotate(radians(end1));
        stroke(secondary);
        line(0, 0, 80, 0);
      pop();

      //Hora
      strokeWeight(15);
      stroke(tertirary);
      float end2 = map(h % 12, 0, 12, 0, 360);
      arc(0, 0, 250, 250, 0, radians(end2));

      push();
        rotate(radians(end2));
        stroke(tertirary);
        line(0, 0, 60, 0);
      pop();



    popMatrix();

  }
}
// Pulseira do relógio
class Pulseira{

  Pulseira(){

  }
  
  public void show(){
    
  }
}
// Quadrado do relógio
class Quadrado{

  PVector pos;
  float len;

  Quadrado(int x, int y, int len_){
    pos = new PVector(x,y);
    len = len_;
  }

  public void show(){
    strokeWeight(1);
     fill(255);
     pushMatrix();
       translate(pos.x, pos.y, pos.z);
       box(len);
     popMatrix();
   }
}
  public void settings() {  size(400, 400, P3D);  smooth(8); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ProcessingClock" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
