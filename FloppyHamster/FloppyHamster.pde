import fisica.*;
FWorld mundo;
PImage grilla;
PImage platMov;
PImage platRot;
PImage platFija;
PImage platAbajo;
PImage boliche;
PImage bbolgrand;
PImage hamster;
PImage semilla;
PImage PinchosDer;
PImage PinchosIzq;
PImage PinchosAbajo;
PImage Ancla;
PImage burbuja;
PImage platCirc;

PImage Fondo;
int puntos;
String estado;
Pantalla p;
FBox costado, abajo, semi1,semi2,semi3;

void setup() {
  size(1600, 900);
  Fisica.init(this);
  mundo = new FWorld();
  p =new Pantalla();
  mundo.setEdges();

  //Imagenes
  platMov= loadImage("Plataforma_Que_Se_Puede_Sacar.png");
  platRot= loadImage("Plataforma_Que_Rota.png");
  platFija= loadImage("Plataforma_Fija_.png");
  boliche= loadImage("Bola_De_Boliche_.png");
  bbolgrand= loadImage("Bola_Mas_Grande.png");
  Fondo= loadImage("papelarrugado.jpg");
  hamster= loadImage("hamster.png");
  semilla= loadImage("semilla.png");
  PinchosAbajo= loadImage("Parte_De_Abajo.png");
  PinchosIzq= loadImage("CostadoIzq.png");
  PinchosDer= loadImage("CostadoDer.png");
  platAbajo= loadImage("Plat_De_Abajo.png");
  Ancla= loadImage("Ancla.png");
  burbuja= loadImage("Burbuja.png");
  platCirc=loadImage("PlataformaCirc .png");

  estado="Jugando";

  
  if (estado.equals("Jugando")) {
    background(255);
    image(Fondo, 0, 0);
    //Personaje
    FCircle bolaBol = new FCircle (80);
    bolaBol.setPosition(80, 96);
    bolaBol.setDensity(2);
    bolaBol.setFill(255, 0, 0);
    bolaBol.attachImage(hamster);
    mundo.add(bolaBol);

    //Pinchos del lado derecho
    costado=new FBox(30, 800);
    costado.setPosition(20, 400);
    costado.attachImage(PinchosIzq);
    costado.setStatic(true);
    costado.setGrabbable(false);
    mundo.add(costado);
    //Pinchos del lado Izquierdo
    costado=new FBox(30, 800);
    costado.setPosition(1580, 400);
    costado.attachImage(PinchosDer);
    costado.setStatic(true);
    costado.setGrabbable(false);
    mundo.add(costado);
    //Pinchos de abajo
    abajo=new FBox(1600, 30);
    abajo.setPosition(800, 785);
    abajo.attachImage(PinchosAbajo);
    abajo.setStatic(true);
    costado.setGrabbable(false);
    mundo.add(abajo);

    semi1 = new FBox(30, 60);
    semi1.setPosition(450, 225);
    semi1.attachImage(semilla);
    semi1.setStatic(true);
    semi1.setGrabbable(false);
    mundo.add(semi1);
        
    semi2 = new FBox(30, 60);
    semi2.setPosition(950, 510);
    semi2.attachImage(semilla);
    semi2.setStatic(true);
    semi2.setGrabbable(false);
    mundo.add(semi2);

    semi3 = new FBox(30, 60);
    semi3.setPosition(1350, 370);
    semi3.attachImage(semilla);
    //semi3.setStatic(true);
    semi3.setGrabbable(false);
    mundo.add(semi3);


    //-----------------------------------------------------------
    //Barra estática
    //Base 1 (1 - 11)
    Plataforma base1 = new Plataforma(150, 30);
    base1.setGrabbable(false);
    base1.inicializar (80, 145);
    base1.attachImage(platMov);
    mundo.add(base1);

    //base 2 (1 - 31)
    Plataforma base2 = new Plataforma(150, 30);
    base2.setGrabbable(false);
    base2.inicializar (80, 465);
    base2.attachImage(platMov);
    mundo.add(base2);

    //base 3 (10 - 310)
    /*Plataforma base3 = new Plataforma(150, 30);
     base3.inicializar (1507, 540);
     mundo.add(base3);*/

    //base 4 (6 7 - 46 47)
    Plataforma base4 = new Plataforma(150, 30);
    base4.setGrabbable(false);
    base4.inicializar (950, 560);
    base4.attachImage(platMov);
    mundo.add(base4/*.barra*/);

    //base 5 (4 5 - 44 45)
    Plataforma base5 = new Plataforma(150, 30);
    base5.setGrabbable(false);
    base5.inicializar (600, 560);
    base5.attachImage(platMov);
    mundo.add(base5/*.barra*/);

    //base 6 (9 - 39)
    Plataforma base6 = new Plataforma(150, 30);
    base6.setGrabbable(false);
    base6.inicializar (1350, 495);
    base6.attachImage(platMov);
    mundo.add(base6/*.barra*/);

    //base 7 (diagonal)
    Plataforma base7 = new Plataforma(150, 30);
    base7.setGrabbable(false);
    base7.inicializar (877, 97);
    base7.attachImage(platMov);
    base7.setRotation(10);
    mundo.add(base7);

    //base 8 (diagonal)
    Plataforma base8 = new Plataforma(150, 30);
    base8.setGrabbable(false);
    base8.inicializar (1120, 97);
    base8.attachImage(platMov);
    base8.setRotation(-10);
    mundo.add(base8);

    //-----------------------------------------------------------
    //Círculos

    //baseC 1 (6 - 46)
    //para soltar la bola demoledora
    Plat_Circular baseC1 = new Plat_Circular(60);
    baseC1.inicializar (740, 350);
    baseC1.attachImage (platCirc);
    mundo.add(baseC1/*.barra*/);

    //baseC 2 (6 - 46)
    Plat_Circular baseC2 = new Plat_Circular(60);
    baseC2.inicializar (510, 400);
    baseC2.attachImage (platCirc);
    mundo.add(baseC2/*.barra*/);

    //baseC 3 (para catapulta)
    Plat_Circular baseC3 = new Plat_Circular(60);
    baseC3.inicializar (1180, 687);
    baseC3.attachImage (platCirc);
    mundo.add(baseC3);

    //-----------------------------------------------------------
    //Barra que gira
    //Base 1 (3 - 23)
    PlatGira pgira1 = new PlatGira(200, 30);
    pgira1.inicializar(400, 275);

    mundo.add(pgira1.ancla);
    mundo.add(pgira1.movimiento);
    mundo.add(pgira1.revolute);

    //Base 2 (6- 26)
    PlatGira pgira2 = new PlatGira(150, 30);
    pgira2.inicializar(880, 240);
    mundo.add(pgira2.ancla);
    mundo.add(pgira2.movimiento);
    mundo.add(pgira2.revolute);


    //Base 3 (7 - 27)
    PlatGira pgira3 = new PlatGira(150, 30);
    pgira3.inicializar(1045, 240);
    mundo.add(pgira3.ancla);
    mundo.add(pgira3.movimiento);
    mundo.add(pgira3.revolute);

    //Base 4 (8 9 - 58 59)
    PlatGira pgira4 = new PlatGira(250, 30);
    pgira4.inicializar(1290, 655);
    mundo.add(pgira4.ancla);
    mundo.add(pgira4.movimiento);
    mundo.add(pgira4.revolute);

    //-----------------------------------------------------------
    //Bola demoledora / Wrecking ball
    BolaDemoler bolDem = new BolaDemoler(40, 40);
    bolDem.inicializar(880, 358);
    bolDem.bola.attachImage(boliche);
    mundo.add(bolDem.eje);
    mundo.add(bolDem.bola);
    mundo.add(bolDem.cadena);

    //-----------------------------------------------------------
    //Bola de boliche
    //bolBol 1 (1 - 31)
    BolaBol bolaBol1 = new BolaBol(70);
    bolaBol1.inicializar(80, 410);

    mundo.add(bolaBol1.bolaBol);

    //bolBol 2 (9 - 39)
    BolaBol bolaBol2 = new BolaBol(70);
    bolaBol2.inicializar(1350, 444);
    mundo.add(bolaBol2.bolaBol);

    //-----------------------------------------------------------
    //Plataforma rebote
    PlatRebo platRebo = new PlatRebo(160, 40);
    platRebo.inicializar(83, 747);
    platRebo.platRebo.attachImage(platAbajo);
    mundo.add(platRebo.platRebo);

    PlatRebo platRebo1 = new PlatRebo(160, 40);
    platRebo1.inicializar(368, 747);
    platRebo1.platRebo.attachImage(platAbajo);
    mundo.add(platRebo1.platRebo);

    PlatRebo platRebo2 = new PlatRebo(160, 40);
    platRebo2.inicializar(655, 747);
    platRebo2.platRebo.attachImage(platAbajo);
    mundo.add(platRebo2.platRebo);

    PlatRebo platRebo3 = new PlatRebo(160, 40);
    platRebo3.inicializar(945, 747);
    platRebo3.platRebo.attachImage(platAbajo);
    mundo.add(platRebo3.platRebo);

    PlatRebo platRebo4 = new PlatRebo(160, 40);
    platRebo4.inicializar(1231, 747);
    platRebo4.platRebo.attachImage(platAbajo);
    mundo.add(platRebo4.platRebo);

    PlatRebo platRebo5 = new PlatRebo(160, 40);
    platRebo5.inicializar(1517, 747);
    platRebo5.platRebo.attachImage(platAbajo);
    mundo.add(platRebo5.platRebo);

    //-------------------------------
    //Burbuja
    FCircle burbuja = new FCircle (70);
    burbuja.setPosition(598, 614);
    //burbuja.attachImage(burbuja);
    burbuja.setStatic(true);
    mundo.add(burbuja);


    //botón
    noStroke();
    fill(117, 166, 234);
    rect(45, 710, 70, 30, 17);


    //Line
    stroke(10);
    line(0, height-100, width, height-100);

    //Contador
    textSize(50);
    fill(0);
    textAlign(CENTER);
    text(puntos, 50, 50);

    stroke(1);
    fill(234, 221, 117);
    ellipse(50, height-50, 25, 50);
    ellipse(90, height-50, 25, 50);
    fill(255);
    ellipse(130, height-50, 25, 50);
  }
  
}

void draw() {
  mundo.step();
  mundo.draw();
  if (estado.equals("Inicio")) {
    p.dibujar(0);
  }
  if (estado.equals("Instruc")) {
    p.dibujar(1);
  }
  if (estado.equals("Jugando")) {
    
  }
  if (estado.equals("Perdiste")) {
    p.dibujar(2);
  }
  if (estado.equals("Ganaste")) {
    p.dibujar(3);
  }
  
}

void keyPressed() {

  if (estado.equals("Inicio")) {
    if (key==ENTER) {
      estado="Instruc";
    }
  }
  if (estado.equals("Instruc")) {
    if (key==TAB) {
      estado="Jugando";
    }
  }
  if (estado.equals("Ganaste")) {
    if (key==ENTER) {
      estado="Inicio";
    }
  }
  if (estado.equals("Perdiste")) {
    if (key==ENTER) {
      estado="Inicio";
    }
  }
}


void mousePressed() {
}
