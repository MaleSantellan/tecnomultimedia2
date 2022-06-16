class Caminante {
  float x;
  float xC;
  float yC;
  float xP, yP, xS, yS, xT, yT, xU, yU, xQ, yQ, xE, yE, xM, yM, xO, yO;
  float v;
  float a, b, c, d;

  Caminante() {
    x = 0;
    yC = 0;
    yP = yS = yT = yU = yQ =  yE = yM = yO = 0;
    v = 5;

    a = 4;
    b = 1;
    c = 4;
    d = 1;
  }

  void mover() {
    x+=v;
    float t=frameCount*0.01;
    float j = 3;
    float k = 3;
    xC = cos(a*t)-pow(cos(b*t), j);
    yC = sin(c*t)-pow(sin(d*t), k);

    xP = 9*cos(t);
    yP = 1.5*sin(t);

    xS = 5*cos(t);
    yS = 1*sin(t);

    xT = 4*cos(t);
    yT = 0.5*sin(t);

    xU = 0.9*cos(t);
    yU = 0.9*sin(t);

    xQ = 0.5*cos(t);
    yQ = 0.7*sin(t);

    xE = 3*cos(t);
    yE = 1*sin(t);

    xM = 0.9*cos(t);
    yM = 1*sin(t);

    xO = 0.6*cos(t);
    yO = 0.8*sin(t);
  }

  void dibujar(PGraphics grafico) {
    grafico.push();
    grafico.noStroke();
    grafico.fill(236, 135, 0);
    float tam = 50;
    grafico.ellipse(width/2+xC*tam, height/2+yC*tam, 4.5, 4.5);
    grafico.ellipse(width/2+xP*tam, height/2+yP*tam, 4, 4);
    grafico.ellipse(width/4+xS*tam, height/2+yS*tam, 3, 3);
    grafico.ellipse(720+xT*tam, height/2+yT*tam, 2, 2);
    grafico.ellipse(width-50+xU*tam, height/2+yU*tam, 3, 3);
    grafico.ellipse(50+xQ*tam, 410+yQ*tam, 2, 2);
    grafico.ellipse(120+xE*tam, height/2-50+yE*tam, 2.5, 2.5);
    grafico.ellipse(width-55+xM*tam, height/2+5+yM*tam, 2.5, 2.5);
    grafico.ellipse(55+xO*tam, 405+yO*tam, 1, 1);
    grafico.pop();
  }
}
