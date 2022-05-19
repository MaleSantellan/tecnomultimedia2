class GestorDeInteracion {
  Dir_y_Vel mouse;
  
  boolean movLargo;
  boolean movCorto;
  boolean quieto;
  
  //variables para guardar la cantidad de tiempo determinada en la que hago un movimiento
  float tiempoGrande;
  float tiempoPeque;
  
  GestorDeInteracion() {
    mouse = new Dir_y_Vel();
  }

  void actualizar() {
    mouse.calcularTodo(mouseX, mouseY);
    
    movLargo = false;
    movCorto = false;
    tiempoGrande--;
    tiempoPeque--;
    //no puede ser mas chico que cero ni mas grande que 90
    tiempoGrande = constrain(tiempoGrande, 0, 90); 
    tiempoPeque = constrain(tiempoPeque, 0, 90);

    println(mouse.velocidad());
    if (mouse.velocidad()>10) { //Hay movimiento
      float umbral = 60;//punto medio de velocidad entre ambos movimientos
  
      if (mouse.velocidad()>umbral) { //si la velocidad del mouse es mayor que el umbral (40)
        tiempoGrande+=10; //la variable de "tiempoGrande" va a empezar a aumentar en 10
        tiempoPeque-=10; // y la variable de "tiempoPeque" va a disminuir en 10
        //esto pasa para que la variable "tiempoPeque" no pueda llegar al valor asignado para que movPeque = true (55)
        
      } else { //(mouse.velocidad()< umbral)
        if (tiempoGrande<60) {
          tiempoPeque+=10;
        }
      }
    } else if(mouse.velocidad() == 0) quieto = true;

    if (tiempoGrande>60) {
      movLargo = true;  
    } 
    if (tiempoPeque>60) {
      movCorto = true;
    }
  }
}
