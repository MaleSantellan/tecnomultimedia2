class PlatRebo
{
  FBox platRebo;
  
  PlatRebo(float _w, float _h)
  {
    platRebo = new FBox(_w, _h);
  }
  
  void inicializar(float _x, float _y)
  {
    platRebo.setPosition(_x, _y);
    platRebo.setStatic(true);
    platRebo.setRestitution(2);
  }
}

//Barra rebote
 /*FBox barraRebo = new FBox (200,40);
 barraRebo.setPosition(width/2+300,height/2+100);
 barraRebo.setStatic(true);
 barraRebo.setRestitution(2);
 mundo.add(barraRebo);
 */
