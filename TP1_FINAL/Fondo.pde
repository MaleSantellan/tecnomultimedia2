class Fondo {
  //Propiedades 
  PImage dibujoTrazo;
  int cantidad = 4;

  int tipoDibujo;
  float tamanioT;
  float anchoT;
  color colorT;
  int tipoT;//tipo=1(largo),tipo=2(mediano),tipo=3(silencio)
  float posY = height/2;
  float posX;
  float vel;
  PImage pincelada;
  PImage mascara2;


  Fondo(int tipo, color col) { 
    background(255);
    
    tipoT = tipo; 
    mascara2 = loadImage ("pincelada02.png");
    mascara2.filter (INVERT);

    pincelada = createImage(280, 900, RGB);
    pincelada.filter(INVERT);
    pincelada.mask(mascara2);
    posX = width+200;
    vel +=160.5;
    dibujoTrazo= pincelada;
    colorT=col;
    
    if (tipoT == 1) {//es largo (VERDE)
      tamanioT = random(820, 850);
      anchoT = 250;
    } else {
      if (tipoT== 2) {//es mediano (CELESTE)
        tamanioT = random (820, 850);
        anchoT = 250;
      } else {
        if (tipoT== 3) {//es silencio (BLANCO)
          tamanioT = random (800, 820);
          anchoT = 250;
        }
      }
    }
  }


  //Metodos

  void dibujarFondo() {
    push();
    if (tipoT != 3) {//si no es silencio
      tint(colorT, 10);
    }
    imageMode(CENTER);
    image(dibujoTrazo, posX+vel, posY, anchoT, tamanioT);
    
    pop();
  }
  //--------------------------------------------------
  void dibujarFondo(PGraphics grafico) {
    grafico.push();
    if (tipoT != 3) {//si no es silencio
      grafico.tint(colorT, 10);
    }
    grafico.imageMode(CENTER);
    grafico.image(dibujoTrazo, posX-anchoT, posY, anchoT, tamanioT);

    posX -= vel;
    if (posX < 0) {
    }

    grafico.pop();
  }
  //-------------------------------------------------
  boolean actualizarPos() {
    posX -= anchoT;
    if (posX < 0) {
      return false;
    } else {
      return true;
    }
  }
}
