class Juego {
  String estado;
  Pantalla pantallas;
  int pant;
  Boton empezar;

  Juego() {
    estado="Inicio";
    pantallas = new Pantalla();
    pant=0;
    empezar= new Boton(400, 550, 250, 80);
  }
  
  void dibujarJuego() {
    pantallas.dibujar(pant);
    //Estados del juego
    if (estado.equals("Inicio")) { //pantalla de inicio
      pant=0;
      empezar.dibujarBoton(0, 1, "EMPEZAR");
    } 
   if (estado.equals("Ganaste")) {
      println(estado);
      pant=1;
      empezar.dibujarBoton(1, 0, "Inicio");
    }
    if (estado.equals("Perdiste")) {
      println(estado);
      pant=2;
      empezar.dibujarBoton(2, 0, "Inicio");
    }
  }
  void click() {
    if (empezar.botonPresionado(400, 550, 250, 80) && pant== empezar.actual) {
      pant = empezar.proxima;
      estado= "Inicio";
    }
}
}
