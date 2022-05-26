class Caminante {
  float x, y;
  float t;
  float vel;
  float dir;
  color c;

  Caminante(color c_) {
    x = width;
    y = height/2;
    t = 7;
    vel = 3;
    dir = random(360);
    c = c_;
  }

  void dibujar() {
    noStroke();
    fill(c);
    ellipse(x, y, t, t);
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

  void cambiarColor(color c_) {
    c = c_;
  }

  void rebote() {
    if (x>=width) {
      dir = 800;
    }
    if (x<=0) {
      dir = 0;
    }

    if (y>=450) {
      dir = random(500, 594);
    }
    if (y<=350) {
      dir = random(90, 244);
    }
  }
}
