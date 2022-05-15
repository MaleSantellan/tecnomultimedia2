class Trazos {
  Paleta pcalidos;
  Paleta pfrios;
  float tamLargos, tamMedianos, tamCortos;
  float ancho;


  Trazos() {

    //colores 
    pcalidos = new Paleta ("paletaCali.png");
    pfrios = new Paleta ("paletaFria.png");
  }
  void Copiar(Trazos nuevo) {
    this.pcalidos=nuevo.pcalidos;
    this.pfrios=nuevo.pfrios;
    this.tamLargos=nuevo.tamLargos;
    this.tamMedianos=nuevo.tamMedianos;
    this.tamCortos=nuevo.tamCortos;
    this.ancho=nuevo.ancho;
  }

  Float crearLargos(float posX) { 
    tamLargos= random(500, 600);
    ancho= random(100, 150);

    float resultado = posX-(ancho);
    //trazoL = createImage(ancho,tamLargos,);
    trazoL.filter(INVERT);
    trazoL.mask(trazoL);
    tint (pcalidos.darUnColor());
    image (trazoL, resultado, height/2, ancho, tamLargos);
    trazoL.filter (INVERT);
    return  resultado; //devuelve el resultado de la posicion en x donde dibujo
  }
  Float crearMedianos(float posX) {
    tamMedianos = random (200, 350);
    ancho= random(90, 100);
    float resultado = posX-50;
    trazoC.filter(INVERT);
    tint (pfrios.darUnColor());
    image (trazoC, resultado, height/2, ancho, tamMedianos);
    return  resultado;//devuelve el resultado de la posicion en x donde dibujo
  }

  float crearSilencio(float posX) {
    tamCortos = random (50, 100);
    ancho= random(50, 70);
    float resultado = posX-50 ; 
    image (silencio, resultado, height/2, ancho, tamCortos);
    return resultado;
  }
}
