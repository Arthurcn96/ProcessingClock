// Ponteiros e Cronometros
class Mostrador {

  int h;
  int m;
  int s;
  int dist;
  Voxel voxel;

  color primary = #ff6060;
  color secondary = #ffffff;
  color tertirary = #c2c2c2;

  Mostrador(int translate){

    dist = translate;
    voxel = new Voxel(10, false);

  }

  void show(){

    h = hour() -1;
    m = minute();
    s = second();



    pushMatrix();

      translate(0,0,dist);
      rotate(radians(-90));

      //Segundo
      strokeWeight(3);
      stroke(primary);
      noFill();
      float end = map(s, 0, 60, 0, 360);
      // arc(0, 0, 300, 300, 0, radians(end));

      push();
        rotate(radians(end));
        stroke(primary);
        line(0, 0, 100, 0);
      pop();

      //Minuto
      strokeWeight(4);
      stroke(secondary);
      float end1 = map(m, 0, 60, 0, 360);
      // arc(0, 0, 280, 280, 0, radians(end1));


      push();
        rotate(radians(end1));
        stroke(secondary);
        line(0, 0, 80, 0);
      pop();

      //Hora
      strokeWeight(5);
      stroke(tertirary);
      float end2 = map(h % 12, 0, 12, 0, 360);
      // arc(0, 0, 250, 250, 0, radians(end2));


      push();
        rotate(radians(end2));
        stroke(tertirary);
        line(0, 0, 60, 0);

        marcador(30, 150, #ff3333);
        marcador(5, 145, #ff3333);

      pop();

    popMatrix();

    mario(-25,-80,-19);

  }

  void marcador(int set, int dist, color c){
  push();
    translate(0, 0, -17);
    for (int i = 0; i < 360; i+=set){
      push();
      rotate(radians(i));
      voxel.show(0, dist, c);
      pop();
    }
  pop();
  }

  void mario(int x, int y, int z){
    color red =   #ff0000;
    color skin =  #fcec99;
    color blue =  #0000fc;
    color black = #000000;
    color brown = #603100;

    push();
    translate(x,y,z);

    voxel.show(0,0,  red);
    voxel.show(10,0, red);
    voxel.show(20,0, red);
    voxel.show(30,0, red);
    voxel.show(40,0, red);

    voxel.show(-10,  10, red);
    voxel.show(0,  10, red);
    voxel.show(10, 10, red);
    voxel.show(20, 10, red);
    voxel.show(30, 10, red);
    voxel.show(40, 10, red);
    voxel.show(50, 10, red);
    voxel.show(60, 10, red);
    voxel.show(70, 10, red);

    voxel.show(-10, 20, brown);
    voxel.show(0,   20, brown);
    voxel.show(10,  20, brown);
    voxel.show(20,  20, skin);
    voxel.show(30,  20, skin);
    voxel.show(40,  20, black);
    voxel.show(50,  20, skin);

    voxel.show(-20, 30, brown);
    voxel.show(-10, 30, skin);
    voxel.show(0,   30, brown);
    voxel.show(10,  30, skin);
    voxel.show(20,  30, skin);
    voxel.show(30,  30, skin);
    voxel.show(40,  30, black);
    voxel.show(50,  30, skin);
    voxel.show(60,  30, skin);
    voxel.show(70,  30, skin);

    voxel.show(-20, 40, brown);
    voxel.show(-10, 40, skin);
    voxel.show(0,   40, brown);
    voxel.show(10,  40, brown);
    voxel.show(20,  40, skin);
    voxel.show(30,  40, skin);
    voxel.show(40,  40, skin);
    voxel.show(50,  40, black);
    voxel.show(60,  40, skin);
    voxel.show(70,  40, skin);
    voxel.show(80,  40, skin);

    voxel.show(-10, 50, brown);
    voxel.show(0,   50, skin);
    voxel.show(10,  50, skin);
    voxel.show(20,  50, skin);
    voxel.show(30,  50, skin);
    voxel.show(40,  50, black);
    voxel.show(50,  50, black);
    voxel.show(60,  50, black);
    voxel.show(70,  50, black);

    voxel.show(0,   60, skin);
    voxel.show(10,  60, skin);
    voxel.show(20,  60, skin);
    voxel.show(30,  60, skin);
    voxel.show(40,  60, skin);
    voxel.show(50,  60, skin);

    voxel.show(-10, 70, red);
    voxel.show(0,   70, red);
    voxel.show(10,  70, blue);
    voxel.show(20,  70, red);
    voxel.show(30,  70, red);
    voxel.show(40,  70, blue);
    voxel.show(50,  70, red);
    voxel.show(60,  70, red);

    voxel.show(-20, 80, red);
    voxel.show(-10, 80, red);
    voxel.show(0,   80, red);
    voxel.show(10,  80, blue);
    voxel.show(20,  80, red);
    voxel.show(30,  80, red);
    voxel.show(40,  80, blue);
    voxel.show(50,  80, red);
    voxel.show(60,  80, red);
    voxel.show(70,  80, red);

    voxel.show(-30, 90, red);
    voxel.show(-20, 90, red);
    voxel.show(-10, 90, red);
    voxel.show(0,   90, red);
    voxel.show(10,  90, blue);
    voxel.show(20,  90, red);
    voxel.show(30,  90, red);
    voxel.show(40,  90, blue);
    voxel.show(50,  90, red);
    voxel.show(60,  90, red);
    voxel.show(70,  90, red);
    voxel.show(80,  90, red);

    voxel.show(-30, 100, skin);
    voxel.show(-20, 100, skin);
    voxel.show(-10, 100, red);
    voxel.show(0,   100, blue);
    voxel.show(10,  100, skin);
    voxel.show(20,  100, blue);
    voxel.show(30,  100, blue);
    voxel.show(40,  100, skin);
    voxel.show(50,  100, blue);
    voxel.show(60,  100, red);
    voxel.show(70,  100, skin);
    voxel.show(80,  100, skin);

    voxel.show(-30, 110, skin);
    voxel.show(-20, 110, skin);
    voxel.show(-10, 110, skin);
    voxel.show(0,   110, blue);
    voxel.show(10,  110, blue);
    voxel.show(20,  110, blue);
    voxel.show(30,  110, blue);
    voxel.show(40,  110, blue);
    voxel.show(50,  110, blue);
    voxel.show(60,  110, skin);
    voxel.show(70,  110, skin);
    voxel.show(80,  110, skin);

    voxel.show(-30, 120, skin);
    voxel.show(-20, 120, skin);
    voxel.show(-10, 120, blue);
    voxel.show(0,   120, blue);
    voxel.show(10,  120, blue);
    voxel.show(20,  120, blue);
    voxel.show(30,  120, blue);
    voxel.show(40,  120, blue);
    voxel.show(50,  120, blue);
    voxel.show(60,  120, blue);
    voxel.show(70,  120, skin);
    voxel.show(80,  120, skin);

    voxel.show(-10, 130, blue);
    voxel.show(0,   130, blue);
    voxel.show(10,  130, blue);
    voxel.show(40,  130, blue);
    voxel.show(50,  130, blue);
    voxel.show(60,  130, blue);

    voxel.show(-20, 140, brown);
    voxel.show(-10, 140, brown);
    voxel.show(0,   140, brown);
    voxel.show(50,  140, brown);
    voxel.show(60,  140, brown);
    voxel.show(70,  140, brown);

    voxel.show(-30, 150, brown);
    voxel.show(-20, 150, brown);
    voxel.show(-10, 150, brown);
    voxel.show(0,   150, brown);
    voxel.show(50,  150, brown);
    voxel.show(60,  150, brown);
    voxel.show(70,  150, brown);
    voxel.show(80,  150, brown);


    pop();
  }



}
