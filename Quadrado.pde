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

  void show(){


    // scale(s);
    // noStroke();
    // int i = 0;
    for (i; i < cubo.length; i = i+1) {
      print( i );
    }

    box(h);


  }
}
