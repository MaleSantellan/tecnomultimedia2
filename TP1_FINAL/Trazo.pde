class Trazo {
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
  float desX = 15;


  Trazo(int tipo, color col, PImage[] dibujos) { 
    tipoT = tipo; 
    tipoDibujo = int (random(cantidad));
    posX = width-10;
    dibujoTrazo=dibujos[tipoDibujo];
    colorT=col;
    if (tipoT == 1) {//es largo
      tamanioT = random(450, 600);
      anchoT = 100;
    } else {
      if (tipoT==2) {//es mediano
        tamanioT = random (200, 400);
        anchoT = 100;
      } else {
        if (tipoT==3) {//es mediano
          tamanioT = random (20, 70);
          anchoT = 100;
        }
      }
    }
  }


  //Metodos

  void dibujarTrazo() {
    push();
    if (tipoT != 3) {//si no es silencio
      tint(colorT);
    }
    imageMode(CENTER);
    image(dibujoTrazo, posX-anchoT, posY, anchoT, tamanioT);
    pop();
  }
  //--------------------------------------------------
  void dibujarTrazo(PGraphics grafico) {
    grafico.push();
    if (tipoT != 3) {//si no es silencio
      grafico.tint(colorT);
    }
    
    grafico.imageMode(CENTER);
    grafico.image(dibujoTrazo, posX-anchoT, posY, anchoT, tamanioT);
    grafico.pop();
  }
  
  //-------------------------------------------------
  boolean actualizarPos() {
    posX -= random(50, anchoT);
    if (posX < 200) {
      return false;
    } else {
      return true;
    }
  }
}
