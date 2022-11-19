import fisica.*; //<>//

FWorld mundo;

int PUERTO_OSC = 12345;

Receptor receptor;

Administrador admin;

PImage Plat;
PImage Fondo;
PImage Ham;
PImage platAbajo;
FCircle hamster;

void setup() {
  size(1000, 600);
  Plat = loadImage("Plat.png"); 
  Fondo = loadImage("Fondo.jpg"); 
  Ham = loadImage("hamster.png"); 
  platAbajo = loadImage("Plat_De_Abajo.png");

  Fisica.init(this);

  mundo = new FWorld();
  mundo.setEdges();

  setupOSC(PUERTO_OSC);

  receptor = new Receptor();

  admin = new Administrador(mundo);

  hamster= new FCircle(80);
  hamster.attachImage(Ham);
  mundo.add(hamster);
  
  PlatRebo base1 = new PlatRebo(160, 40);
  base1.setGrabbable(false);
  base1.inicializar (160, 550);
  base1.attachImage(platAbajo);
  mundo.add(base1);
  
  PlatRebo base2 = new PlatRebo(160, 40);
  base2.setGrabbable(false);
  base2.inicializar (420, 550);
  base2.attachImage(platAbajo);
  mundo.add(base2);
  
  PlatRebo base3 = new PlatRebo(160, 40);
  base3.setGrabbable(false);
  base3.inicializar (680, 550);
  base3.attachImage(platAbajo);
  mundo.add(base3);
  
  PlatRebo base4 = new PlatRebo(160, 40);
  base4.setGrabbable(false);
  base4.inicializar (940, 550);
  base4.attachImage(platAbajo);
  mundo.add(base4);
}

void draw() {
  background(255);  
  image (Fondo, 0, 0);
  receptor.actualizar(mensajes); //  
  receptor.dibujarBlobs(width, height);


  // Eventos de entrada y salida
  for (Blob b : receptor.blobs) {

    if (b.entro) {
      admin.crearPuntero(b);
      println("--> entro blob: " + b.id);
    }
    if (b.salio) {
      admin.removerPuntero(b);
      println("<-- salio blob: " + b.id);
    }

    admin.actualizarPuntero(b);
  }

  //println("cantidad de blobs: " + receptor.blobs.size());
  
  mundo.step();
  mundo.draw();
}
