// Fundo do relogio
class Fundo{

  Fundo(){

  }

  void show(color c){
    pushMatrix();
      translate(0, 0, -23);
      polygon(0, 0, 200, 25, c); // Icosagon
    popMatrix();
  }

  void polygon(float x, float y, float radius, int npoints, color c){
    float angle = TWO_PI / npoints;

    beginShape();
    fill(c);

      for (float a = 0; a < TWO_PI; a += angle){
        float sx = x + cos(a) * radius;
        float sy = y + sin(a) * radius;
        vertex(sx, sy);
      }
      noStroke();
    endShape(CLOSE);

  }

}
