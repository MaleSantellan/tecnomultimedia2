//Agregar mas trazos: LISTO
//LISTO: agregar arreglo de imagenes para que cada grupo: largo, mediano, silencio, tenga mas tipos de trazos
//arraylist cuando se termina la pantalla, se borre el primero
//modo audio: sale una barra y avanza

class Trazos {
  Paleta pcalidos;
  Paleta pfrios;
  float tamLargos, tamMedianos, tamCortos;
  float ancho;


  float xOrigen;
  float xDestino;
  float y;
  float f;

  PImage trazos[];
  int cantidad = 4;
  PImage mascara;

  Trazos() {

    xOrigen = 800;
    xDestino = -10;

    y = height/2;

    f = -0.9;
    //colores
    pcalidos = new Paleta ("paletaCali.png");
    pfrios = new Paleta ("paletaFria.png");

    trazos = new PImage[cantidad];
    mascara = loadImage ("mascara1.png");

    for (int i=0; i<cantidad; i++) {
      String nombre = "trazo" + nf(i, 2) + ".png";
      mascara = loadImage (nombre);
      mascara.filter (INVERT);
      trazos[i] = createImage( 280, 900, RGB);
      trazos[i].filter(INVERT);
      trazos[i].mask(mascara);
    }
  }


  float crearLargos(float posX) {
    int cual = int (random(cantidad));
    //xOrigen = xDestino * (1-f) + xOrigen * f;
    //Que cada trazo tenga un ancho y alto distinto
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
}
