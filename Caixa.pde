// Corpo do relógio 
class Caixa{

  int len;
  Voxel voxel;
  boolean borda;

  Caixa(int len_, boolean border_){

    len = len_;
    borda = border_;
    voxel = new Voxel(len_, false);

  }

  void show(color c){
    int radius = 200;
    int npoints = 25;

    push();
      polygon(0, 0, radius, npoints, c); // Icosagon
    pop();

  }

  void polygon(int x, int y, float radius, int npoints, color c){
    float angle = (TWO_PI / npoints);
    float sx, sy;


    for (float a = 0; a < TWO_PI; a += angle){
      sx = x + cos(a) * radius;
      sy = y + sin(a) * radius;
      fill(c);
      voxel.show(sx, sy, c);
    }

  }


}
