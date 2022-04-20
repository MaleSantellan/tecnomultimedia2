//TP1 Etapa 2 Prototipo 



GestorDeInteracion g;
PImage trazoL, trazoC;
Float posX;

void setup () {
  imageMode(CENTER);
  size (800, 800);
  background(255);
  g = new GestorDeInteracion();
  background(255);
  trazoL = loadImage ("trazo1.png");
  trazoC = loadImage ("trazo2.png");
  posX = 800.0; //posicion inicial de las figuras
}

void draw () {
  g.actualizar();
  //Dibujar los trazos 
  //_si se da un movimiento grande, se dibujan las lineas largas
  if (g.movGrande) {
    //crearGrandes();
    posX = crearGrandes(posX); 

    //_si se da un movimiento corto, se dibujan las lineas cortas
  } else if (g.movPeque) {
    //crearPeques();
    posX = crearPeques(posX);
  }
  
  //vuelven a aparecer los trazos cuando salgan de la pantalla 
  if(posX<0){
  posX=800.0;
}
}

Float crearGrandes(float posX) { 
  float resultado = posX-50;
  
  image (trazoL, resultado, height/2, 100, 600);
  return  resultado; //devuelve el resultado de la posicion en x donde dibujo
}

Float crearPeques(float posX) {
  float resultado = posX-50;
  image (trazoC, resultado, height/2, 150, 400);
  return  resultado;//devuelve el resultado de la posicion en x donde dibujo
}
