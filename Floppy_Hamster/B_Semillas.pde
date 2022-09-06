class Semilla extends FBox {
  Boolean agarrada;
  Semilla(float _w, float _h) {
    super(_w, _h);
  }

  void inicializar(float _x, float _y) {
    setName ("semilla");
    setPosition(_x, _y);
    setStatic(true);
    attachImage(semilla);
    setGrabbable(false);
  }
  
  void agarrar()
  {
    if (!agarrada)
    {
      agarrada = true;
      puntos++;
      mundo.remove(this);
    }
  }

  void resetear()
  {
    mundo.remove(this);
    mundo.add(this);
    agarrada = false;
  }
}
