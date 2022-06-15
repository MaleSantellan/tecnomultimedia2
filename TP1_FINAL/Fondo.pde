
class Fondo{
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
    
    
  Fondo(int tipo, color col, PImage[] dibujos){ 
    background(255);
    tipoT = tipo; 
    tipoDibujo = int (random(cantidad));
    posX = 920;
    vel += 100.5;
    dibujoTrazo=dibujos[tipoDibujo];
    colorT=col;
    if (tipoT == 1){//es largo (VERDE)
       tamanioT = random(820, 850);
       anchoT = 250;
    } else {
      if(tipoT== 2){//es mediano (CELESTE)
        tamanioT = random (820, 850);
        anchoT = 250;
      } else {
        if(tipoT== 3){//es silencio (BLANCO)
          tamanioT = random (800, 820);
          anchoT = 150;
        }
      }
    }
  }
  
  
  //Metodos
  
  void dibujarFondo(){
    push();
    if(tipoT != 3){//si no es silencio
       tint(colorT, 50);
    }
    imageMode(CENTER);
    image(dibujoTrazo, posX+vel, posY, anchoT, tamanioT);
     
      /*posX -= vel;
        if(posX < 0){
          posX = width;
        }*/
    pop();
  }
  //--------------------------------------------------
  void dibujarFondo(PGraphics grafico){
    grafico.push();
    if(tipoT != 3){//si no es silencio
       grafico.tint(colorT, 50);
    }
    grafico.imageMode(CENTER);
    grafico.image(dibujoTrazo, posX-anchoT, posY, anchoT, tamanioT);
    
    posX -= vel;
        if(posX < 0){
        }
    
    grafico.pop();
  }
  //-------------------------------------------------
   boolean actualizarPos(){
      posX -= anchoT;
      if(posX < 0){
        return false;
      }else {
        return true;
      }
  }
  
}
