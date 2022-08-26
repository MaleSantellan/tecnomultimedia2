class PlatGira
{
  FCircle ancla;
  FBox movimiento;
  FRevoluteJoint revolute;

  PlatGira(float _w, float _h)
  {
    ancla = new FCircle(20);
    movimiento = new FBox(_w, _h);
    revolute = new FRevoluteJoint (ancla, movimiento);
  }

  void inicializar(float _x, float _y)
  {
    ancla.setPosition(_x, _y);
    ancla.setStatic(true);
    ancla.setGrabbable(false); 

    movimiento.setPosition(_x, _y);
    movimiento.setName ("plataforma");
  }
}


//Barra que gira
/* FCircle ancla = new FCircle(20);
 ancla.setPosition(width/2, height/2);
 ancla.setStatic(true);
 mundo.add(ancla);
 
 FBox movimiento = new FBox(300,40);
 movimiento.setPosition(width/2,height/2);
 mundo.add(movimiento);
 
 revolute = new FRevoluteJoint (ancla,movimiento);
 mundo.add(revolute);
 */
