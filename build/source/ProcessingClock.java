import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import peasy.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ProcessingClock extends PApplet {



PeasyCam cam;
Mostrador tela;
public void setup() {
      
   cursor(HAND);
   strokeCap(ROUND);
   
   
   cam = new PeasyCam(this,400);
   tela = new Mostrador();
   
   
  

}

public void draw()  {
  background(2);

  translate(200,200);
  
  
  tela.show();
  
        push();
          fill(255,255,255);
          circle(0,0,10);
          fill(255,255,255);
        pop();
  
  frameRate(60);
   
}
// Marcação do Minuto - acima do cristal (Nem todo relógio tem)
class Bisel{

  Bisel(){

  }
}
// Botão para ligar luz (Nem todo relógio tem)
class Botao{

  Botao(){

  }
}
// Corpo do relógio onde as peças são montadas
class Caixa{

  Caixa(){

  }
}
// Mecanismo interno
class Calibre{

  Calibre(){

  }
}
// Knob para ajustar a hora
class Coroa{

  Coroa(){

  }
}
//Vidro do relógio
class Cristal{

  Cristal(){

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
}
  public void settings() {  size(400, 400, P2D);  smooth(8); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ProcessingClock" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
