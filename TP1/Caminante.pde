class Caminante {
  float x, y;
  float t;
  float vel;
  float dir;
  color c;

  Caminante(color c_) {
    x = 900;
    y = height/2;
    t = 7;
    vel = 3;
    dir = random(360);
    c = c_;
  }
//esto es lo que hay que dibujar con PGraphic
  void dibujar() {
    noStroke();
    fill(c);
    pgcaminante.ellipse(x, y, t, t);
  }

  void dibujarRelacion(ArrayList<Caminante> otros) {
    for (int i=0; i<otros.size(); i++) {
      Caminante oc = caminantes.get(i);
      if (dist(oc.x, oc.y, x, y)<20) {
        strokeWeight(7);
        stroke (c);
        line(oc.x, oc.y, x, y);
      }
    }
  }

  void mover() {
    dir += random(-5, 5);
    x = x+vel*cos(radians(dir));
    y = y+vel*sin(radians(dir));
  }

  /*void cambiarDireccion() {
   dir = random (0, 360);
   }*/

  void cambiarColor(color c_) {
    c = c_;
  }

  /*void cambiarTamano() {
   t = random (7, 10);
   }*/

  void rebote() {
    if (x>=width) {
      dir = 900;
    }
    if (x<=0) {
      dir = 0;
    }

    if (y>=300) {
      dir = random(500, width);
    }
    if (y<=450) {
      dir = random(90, 244);
    }
  }
}
