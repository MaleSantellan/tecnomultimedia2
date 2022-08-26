class BolaDemoler
{
  FBox eje;
  FCircle bola;
  FDistanceJoint cadena;

  BolaDemoler(float _w, float _h)
  {
    eje = new FBox(_w, _h);
    bola = new FCircle(50);
    cadena = new FDistanceJoint(eje, bola);
  }

  void inicializar(float _x, float _y)
  {
    eje.setPosition(_x, _y);
    eje.setStatic(true);

    bola.setPosition(757,277);
    bola.setDensity(20);
    
    cadena.setLength(150);
  }
}

//Wrecking ball
/*FBox eje = new FBox(40, 40);
eje.setStatic(true);
eje.setPosition(width/2, 50);
mundo.add(eje);
FCircle bola = new FCircle(50);
bola.setPosition(width/2, 200);
mundo.add(bola);
FDistanceJoint cadena = new FDistanceJoint(eje, bola);
cadena.setLength(250);
mundo.add(cadena);
*/
