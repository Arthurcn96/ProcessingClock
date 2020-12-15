<h1 align="center">
  🕗 ProcessingClock
</h1>
 
Desenvolvimento de um projeto usando os recursos do Processing de um relógio 3D para matéria de Computação Gráfica

 <img  src="https://raw.githubusercontent.com/Arthurcn96/ProcessingClock/main/data/mario.gif" style="display: block;" alt="gif_relogio" class="center" width="100%"> 

## Descrição do Projeto
O projeto consiste no desenvolvimento de um projeto 3D usando os recursos do [Processing](https://processing.org/) de um relógio de pulso.

Neste projeto, funcionalidades deverão ser integradas empregando opções oferecidas pelo Processing:
 - Uso dos botões do mouse pressionados com as variáveis `mousePressed` e `mouseButton` para executar ações diferentes. Por exemplo, pressionar um botão para mover uma peça do relógio, ou para mudar a cor da parte interna do relógio etc....
 - Uso da variável booleana `keyPressed` para executar uma ação. Por exemplo, mudar a posição do relógio etc...
 - Mudança de iluminação 2D (3D) pelas opções `lights()`, `ambientLight()`, `directionalLight()`, `spotLight()` e `pointLight()` em vários cenários de sua escolha;
 - No 3D, disponibilizar pelo menos um modo "Perspectiva" ou “Ortho”;
 - No 3D, usar a função `camera()`.

## Funcionalidades

| Input | Função |
|-------|--------|
| A | Muda para o modo perspectiva (2D caso veja diretamente X, Y sem movimentar)|
| S | Retorna o background e aproxima a uma posição fixa do relógio|
| Espaço | Liga & desliga o botão de trilha sonora do relogio|
| Mouse| Mudança nas luzes que incidem no relógio|
| Mouse Esquerdo | Rotação nos eixos X, Y e Z|
| Mouse Direito| Arrasto de posição;|

## Dependências
  - [Minim](https://duckduckgo.com/?t=canonical&q=Processing+minim&atb=v1-1) 
 
