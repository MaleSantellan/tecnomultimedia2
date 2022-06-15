class Trazo{
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
    
    
  Trazo(int tipo, color col, PImage[] dibujos){ 
    tipoT = tipo; 
    tipoDibujo = int (random(cantidad));
    posX = width;
    dibujoTrazo=dibujos[tipoDibujo];
    colorT=col;
    if (tipoT == 1){//es largo
       tamanioT = random(450, 600);
       anchoT = 50;
    } else {
      if(tipoT==2){//es mediano
        tamanioT = random (200, 400);
        anchoT = 50;
      } else {
        if(tipoT==3){//es mediano
          tamanioT = random (20, 70);
          anchoT = 50;
        }
      }
    }
  }
  
  
  //Metodos
  
  void dibujarTrazo(){
    push();
    if(tipoT != 3){//si no es silencio
       tint(colorT);
    }
    imageMode(CENTER);
    image(dibujoTrazo, posX-anchoT, posY, anchoT, tamanioT);
    pop();
  }
  //--------------------------------------------------
  void dibujarTrazo(PGraphics grafico){
    grafico.push();
    if(tipoT != 3){//si no es silencio
       grafico.tint(colorT);
    }
    grafico.imageMode(CENTER);
    grafico.image(dibujoTrazo, posX-anchoT, posY, anchoT, tamanioT);
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
  
  /*void crearTCorto(){
    int cual = int (random(cantidad));
    
    //Que cada trazo tenga un ancho y alto distinto
    tamMedianos = random (200, 400);
    ancho= 150;
    
    //ediciones esteticas del trazo
    tint (pfrios.darUnColor());
    imageMode(CENTER);
    
    image (trazos[cual], x, y, ancho, tamMedianos);
  }
  
  void crearTSilencio(){
    int cual = int (random(cantidad));
    
    //Que cada trazo tenga un ancho y alto distinto
    tamCortos = random (20, 70);
    ancho= 50;
    
    //ediciones esteticas del trazo
    imageMode(CENTER);
    
    image (trazos[cual], x, y, ancho, tamMedianos);
  }*/
}
