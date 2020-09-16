// Parte frontal do relógio - Ponteiros e Cronometros
class Mostrador {
  
    Mostrador(){

      
    }
  
    void show(){
      
      int h = hour();
      int m = minute();
      int s = second(); 
      
      pushMatrix();
      
        translate(0,0);
        rotate(radians(-90));
        
        strokeWeight(5);
        stroke(#F4AB47);
        noFill();
        float end = map(s, 0, 60, 0, 360);
        arc(0, 0, 300, 300, 0, radians(end));
        
        push();
          rotate(radians(end));
          stroke(#F4AB47);
          line(0, 0, 100, 0);
        pop();
  
        strokeWeight(10);
        stroke(#4384AA);
        float end1 = map(m, 0, 60, 0, 360);
        arc(0, 0, 280, 280, 0, radians(end1));
        
        push();
          rotate(radians(end1));
          stroke(#4384AA);
          line(0, 0, 80, 0);
        pop();
        
        strokeWeight(15);
        stroke(#69B2AB);
        float end2 = map(h % 12, 0, 12, 0, 360);
        arc(0, 0, 250, 250, 0, radians(end2));
        
        push();
          rotate(radians(end2));
          stroke(#69B2AB);
          line(0, 0, 60, 0);
        pop();
        
        
      popMatrix();
      
    }
}
