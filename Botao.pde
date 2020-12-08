// Botão para ligar luz (Nem todo relógio tem)
class Botao{

  Voxel botao;

  Botao(){

    botao = new Voxel(40, false);

  }

  void show(int x, int y, boolean pressionado){

    push();
    translate(x,y);
    botao(pressionado);
    pop();

  }

  void botao(boolean pressionado){

    if(pressionado){

      push();
      botao.show(-10, 0, #ff0000);
      pop();

    }else{

      push();
      botao.show(0, 0, #ff0000);
      pop();

    }

  }

}
