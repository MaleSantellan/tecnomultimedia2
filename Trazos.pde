//Agregar mas trazos:
//agregar arreglo de imagenes para que cada grupo: largo, mediano, silencio, tenga mas tipos de trazos 
//arraylist cuando se termina la pantalla, se borre el primero

class Trazos {
  Paleta pcalidos;
  Paleta pfrios;
  float tamLargos, tamMedianos, tamCortos;
  float ancho;


  float xOrigen;
  float xDestino;
  float y;
  float f;

  Trazos() {

    xOrigen = 800;
    xDestino = -10;

    y = height/2;

    f = -0.9;
    //colores 
    pcalidos = new Paleta ("paletaCali.png");
    pfrios = new Paleta ("paletaFria.png");
  }


  float crearLargos(float posX) { 
    //xOrigen = xDestino * (1-f) + xOrigen * f;
    //Que cada trazo tenga un ancho y alto distinto
    tamLargos= random(500, 600);
    //ancho= random(100, 150);
    ancho= 50;
    //toma el valor de la anterior posicion y le resta el valor del ancho de la figura para que 
    //no se superpongan
    float resultado =   posX-ancho;
    //ediciones esteticas del trazo.
    trazoL.filter(INVERT);
    trazoL.mask(trazoL);
    tint (pcalidos.darUnColor());
    imageMode(CENTER);
    //se va a dibujar teniendo en cuenta la posicion de la ultima figura, sobre la mitad del lienzo. 
    image (trazoL, resultado, y, ancho, tamLargos);
    trazoL.filter (INVERT);

    return  resultado; //devuelve el resultado de la posicion en x donde dibujo
  }

  float crearMedianos(float posX) {
    tamMedianos = random (200, 350);
    //ancho= random(70, 120);
    ancho= 50;
    float resultado = posX-ancho;

    trazoC.filter(INVERT);
    tint (pfrios.darUnColor());
    imageMode(CENTER);
    image (trazoC, resultado, y, ancho, tamMedianos);
    return  resultado;//devuelve el resultado de la posicion en x donde dibujo
  }

  float crearSilencio(float posX) {
    tamCortos = random (20, 70);
    //ancho= random(50, 70);
    ancho= 50;
    float resultado = posX-ancho ; 
    imageMode(CENTER);
    image (silencio, resultado, y, ancho, tamCortos);
    return resultado;
  }
}
