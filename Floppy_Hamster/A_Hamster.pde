class Hamster extends FCircle {
  Boolean vivo;
  Hamster(float _r) {
    super(_r);
    vivo=true;
  }

  void inicializar(float _x, float _y) {
    vivo=true;
    setName ("hamster");
    setPosition(_x, _y);
    setDensity(20);
    attachImage(ham);
    setRotatable(false);
  }

  void morir() {
    vivo = false;
  }
}
