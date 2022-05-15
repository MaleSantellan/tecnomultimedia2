//TP1 Etapa 2 Prototipo 
Dir_y_Vel mouse;

ArrayList<Caminante> caminantes;
GestorDeInteracion g;
Trazos pincel;
Paleta p;
PImage trazoL, trazoC, silencio, Paletafon;
Float posX;



void setup () {
  Paletafon= loadImage ("paletaFon.png");
  size (800, 800);
  background(255);
  image(Paletafon,0,0,800,800);
  imageMode(CENTER);

  //Imagenes de los trazos
  trazoL = loadImage ("trazo1.png");
  trazoC = loadImage ("trazo2.png");
  silencio =  loadImage ("silencio.png");

  p = new Paleta("paletaLinea.png");
  g = new GestorDeInteracion();
  pincel = new Trazos();

  posX = 900.0; //posicion inicial de las figuras

  mouse = new Dir_y_Vel();

  caminantes = new ArrayList<Caminante>();
  for (int i=0; i<1; i++) {
    caminantes.add(new Caminante(p.darUnColor() ));
  }
}

void draw () {
  g.actualizar();
  //Dibujar los trazos 
  //_si se da un movimiento grande, se dibujan las lineas largas
  if (g.movGrande) {
    posX = pincel.crearLargos(posX); 
    //_si se da un movimiento corto, se dibujan las lineas cortas
  } else if (g.movPeque) {
    posX = pincel.crearMedianos(posX);
  } else if (g.quieto) {
    posX = pincel.crearSilencio(posX);
  }

  //vuelven a aparecer los trazos cuando salgan de la pantalla 
  //Espacio toroidal
  //si posX es menor que width  
  //se le va a restar el tamaño de width
  posX = ( posX<0 ? posX+width : posX);

  for (Caminante c : caminantes) {
    c.dibujar();
    c.mover();
    c.rebote();
    c.cambiarColor(p.darUnColor());
    c.dibujarRelacion(caminantes);
  }
}
