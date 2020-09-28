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
Quadrado quadrado;

float xmag, ymag = 0;
float newXmag, newYmag = 0;
int zoom = 0;
int mX = 200, mY = 200;

boolean sc = true;
boolean nc = false;

public void setup() {
   
   cursor(HAND);

   boolean[][] meuCubo = { {nc, sc, sc, nc},
                           {sc, nc, nc, sc},
                           {sc, nc, nc, sc},
                           {nc, sc, sc, nc}  };

   // mostrador = new Mostrador();
   // caixa = new Caixa();
   quadrado = new Quadrado(20,10, meuCubo);

   

}

public void draw()  {
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

public void mouseDragged(){

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
  }if (mouseButton == RIGHT || mouseButton == CENTER) {
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

  Mostrador(){

  }

  public void show(){

    int h = hour();
    int m = minute();
    int s = second();

    int primary = 0xffE5532D;
    int secondary = 0xffFAC741;
    int tertirary = 0xff61D9CF;

    pushMatrix();

      translate(0,0);
      rotate(radians(-90));

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

  int h;
  int s;
  int i;
  boolean[][] cubo;

  Quadrado(int lado, int tamanho, boolean matrix[][]){
    h = lado;
    s = tamanho;
    i = 0;
    cubo = matrix;
  }

  public void show(){


    // scale(s);
    // noStroke();
    // int i = 0;
    for (i; i < cubo.length; i = i+1) {
      print( i );
    }

    box(h);


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
