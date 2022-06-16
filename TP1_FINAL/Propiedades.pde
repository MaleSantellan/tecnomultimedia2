class Propiedades {
  Paleta pcalidos;
  Paleta pfrios;

  //Fondo
  Paleta pverde;
  Paleta pceleste;
  Paleta transparente;

  float tamLargos, tamMedianos, tamCortos;
  float ancho;

  float y;
  float f;

  PImage trazos[];
  
  PImage fondo[];
  int cantidad = 4;
  PImage mascara1, silencio, mascara2;

  Propiedades() {
    y = height/2;
    f = -0.9;

    //colores
    pcalidos = new Paleta ("paletaCali.png");
    pfrios = new Paleta ("paletaFria.png");
    transparente = new Paleta ("silencio.png");

    //Fondo colores
    pverde = new Paleta ("paletaFondoVerde.jpeg");
    pceleste = new Paleta ("paletaFondoCeleste.jpeg");

    trazos = new PImage[cantidad];   
    fondo = new PImage[cantidad];
    
    mascara1 = loadImage ("mascara2.PNG");
    mascara2 = loadImage ("mascara1.png");

    //---TRAZOS---//
    for (int i=0; i<cantidad; i++) {
      String nombre = "trazo" + nf(i, 2) + ".PNG";
      mascara1 = loadImage (nombre);
      mascara1.filter (INVERT);
      trazos[i] = createImage( 280, 900, RGB);
      trazos[i].filter(INVERT);
      trazos[i].mask(mascara1);
    }
    
    //---TRAZOS DEL FONDO---//
    for (int i=0; i<cantidad; i++) {
      String nombre = "pincelada" + nf(i, 2) + ".png";
      mascara2 = loadImage (nombre);
      mascara2.filter (INVERT);
      fondo[i] = createImage( 280, 900, RGB);
      fondo[i].filter(INVERT);
      fondo[i].mask(mascara1);
    }
    
  }

  //Getters
  Paleta getpcalidos() {
    return pcalidos;
  }

  Paleta getpfrios() {
    return pfrios;
  }

  Paleta getpverde() {
    return pverde;
  }

  Paleta getpceleste() {
    return pceleste;
  }

  Paleta getTransparente() {
    return transparente;
  }

  PImage[] getTrazos() {
    return trazos;
  }
  
  PImage[] getFondo() {
    return fondo;
  }

  int getCantidad() {
    return cantidad;
  }

  float crearLargos(float posX) {
    int cual = int (random(cantidad));

    //Que cada trazo tenga un alto distinto
    tamLargos= random(450, 600);
    ancho= 150;
    //toma el valor de la anterior posicion y le resta el valor del ancho de la figura para que
    //no se superpongan
    float resultado =   posX-ancho;
    //ediciones esteticas del trazo.
    tint (pcalidos.darUnColor());
    imageMode(CENTER);
    //se va a dibujar teniendo en cuenta la posicion de la ultima figura, sobre la mitad del lienzo.
    image (trazos[cual], resultado, y, ancho, tamLargos);

    return  resultado; //devuelve el resultado de la posicion en x donde dibujo
  }

  float crearMedianos(float posX) {
    int cual = int (random(cantidad));
    tamMedianos = random (200, 400);
    ancho= 150;
    float resultado = posX-ancho;

    tint (pfrios.darUnColor());
    imageMode(CENTER);
    image (trazos[cual], resultado, y, ancho, tamMedianos);

    return  resultado;//devuelve el resultado de la posicion en x donde dibujo
  }

  float crearSilencio(float posX) {
    int cual = int (random(cantidad));
    tamCortos = random (20, 70);
    ancho= 50;
    float resultado = posX-ancho ;
    imageMode(CENTER);
    image (trazos[cual], resultado, y, ancho, tamCortos);

    return resultado;
  }


  boolean seFue(float posX) {
    return (posX > 0);
  }
}
