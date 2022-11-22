import fisica.*;

int PUERTO_OSC = 12345;

FWorld mundo;

Receptor receptor;

Administrador admin;

void setup() {
  size( 1600, 900 );
  Fisica.init(this);

  mundo = new FWorld();
  mundo.setEdges();

  setupOSC(PUERTO_OSC);

  receptor = new Receptor();

  admin = new Administrador(mundo);
}

void draw() {
  background(255);
  line(100, 0, 100, height);
  line(200, 0, 200, height);
  receptor.actualizar(mensajes); //
  receptor.dibujarBlobs(width, height);


  // Eventos de entrada y salida
  for (Blob b : receptor.blobs) {

    if (b.entro) {
      admin.crearPuntero(b);
      //println("--> entro blob: " + b.id);
    }
    if (b.salio) {
      admin.removerPuntero(b);
      //println("<-- salio blob: " + b.id);
    }

    admin.actualizarPuntero(b);
    
    if( (b.centroidX * width > 100 && b.centroidX * width < 200) && 
    (b.centroidY * height > 200 && b.centroidY * height < 300)) {
      println("Funciona");
    }
  }
}
