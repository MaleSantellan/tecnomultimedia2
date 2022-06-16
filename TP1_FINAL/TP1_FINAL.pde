//TP1 Entrega Evaluativa_
//2022
//Comision Lisandro
//Alumnas: Santellán Malena Fabiana, Calizaya Angela, Ibañez Magali. 
//lINK: https://youtu.be/az4EVUmBp8Q 
//Libreria de osc
import oscP5.*;
OscP5 osc;

//----PROPIEDADES DE SONIDO----//
//intensidad: fuerte o bajo
float amp = 0.0;
//altura de la voz: grave o agudo 
float pitch = 0.0;
//cuando embieza a haber sonido
float umbraldeAmplitud = 70;
//cuando hay ruido
float umbraldeRuido = 300;
int ruido = 0;
//amortiguacion del sonido
float amort = 0.9;

//sonido bajo
float minimoAmp=umbraldeAmplitud;
//sonido fuerte
float maximoAmp=100;

//agudo
float minimoPitch =88;
//grave
float maximoPitch =50;

//____ESTADOS____//
boolean haySonido=false;
boolean antesHabiaSonido=false;


//____EVENTOS____//
boolean empezoElSonido = false;
boolean terminoElSonido = false;

//----DURACION DE UN SONIDO----//
//tipo int; doble de bites.
long marcaDeTiempo;
float umbralDeTiempo = 2000;

//----
GestorSenial gestorAmp;
GestorSenial gestorPitch;

//----CAPAS DE LA OBRA----//
// capa 1   capa 2    Capa 3
PGraphics pgFondo, pgTrazos, pgCaminante, pgThorizontal;


//----CLASES----//
Propiedades props;
Paleta p;
Caminante c;
Fondo fondo1, fondo2, fondo3;

float posX;
float desx;

//----ARRAY LIST----//
ArrayList<Trazo>listaT;
ArrayList<Caminante> caminantes;

float y;
float f;

PImage Phorizontal[];
int cant = 2;

int resultado;
float segundos;


void setup () {
  size (800, 800, P2D);
  osc= new OscP5(this, 12345);

  Phorizontal= new PImage [cant];

  for (int i = 0; i <cant; i++) {
    Phorizontal[i] = loadImage ("brush0"+i+".png");
  }


  //Gestor de senial, detectar amplitud y altura. 
  gestorAmp =new GestorSenial(minimoAmp, maximoAmp, amort);
  gestorPitch =new GestorSenial(minimoPitch, maximoPitch, amort);


  //Array de los trazos
  listaT = new ArrayList<Trazo>();
  //Array de caminantes
  caminantes = new ArrayList<Caminante>();


  p = new Paleta("paletaLinea.png");
  props = new Propiedades();
  c  = new Caminante();


  //Fondo
  fondo1 = new Fondo (1, props.getpverde().darUnColor());
  fondo2 = new Fondo (2, props.getpceleste().darUnColor());
  fondo3 = new Fondo (3, props.getpceleste().darUnColor());

  //PGrafics
  pgFondo = createGraphics(width, height);
  pgFondo.beginDraw();
  pgFondo.endDraw();

  pgTrazos = createGraphics(width, height);
  pgTrazos.beginDraw();
  pgTrazos.endDraw();

  pgCaminante = createGraphics(width, height);
  pgCaminante.beginDraw();
  pgCaminante.endDraw();

  pgThorizontal = createGraphics(width, height);
  pgThorizontal.beginDraw();
  pgThorizontal.endDraw();
}

void draw () {

  //---TRAZOS HORIZONTALES---//

  if (ruido > umbraldeRuido) {
    pgThorizontal.beginDraw();
    resultado = (int) random (0, 2);
    pgThorizontal.image(Phorizontal[resultado], 0, height/2, 834, 120);
    pgThorizontal.endDraw();
  } 
  //Caminante
  pgCaminante.beginDraw(); 
  c.dibujar(pgCaminante);
  c.mover();
  pgCaminante.endDraw();

  gestorAmp.actualizar(amp);
  gestorPitch.actualizar(pitch);

  //hay sonido cuando la amplitud es mayor a el umbral, sino es ruido
  haySonido = gestorAmp.filtradoNorm() > 0.1; 
  //empezo el sonido cuando antes no habia sonido, y ahora si
  empezoElSonido = !antesHabiaSonido && haySonido;
  //termina el sonido cuando antes habia sonido pero ahora ya no
  terminoElSonido = antesHabiaSonido && !haySonido;
  //guarda el estado anterior de la variable hay sonido.
  antesHabiaSonido= haySonido; 


  if (frameCount%20==0) { 
    if (terminoElSonido) {
      pgFondo.beginDraw();  
      long momentoActual = millis();
      if ( momentoActual - marcaDeTiempo > umbralDeTiempo) {
        fondo1.dibujarFondo(pgFondo);
      } else if (momentoActual - marcaDeTiempo < umbralDeTiempo) {
        fondo2.dibujarFondo(pgFondo);
      } else if (!haySonido) {
        fondo3.dibujarFondo(pgFondo);
        pgFondo.endDraw();
      }
    }
    pgTrazos.beginDraw();
    pgTrazos.image(pgFondo, width/2, height/2, 800, 800);
    pgTrazos.imageMode(CENTER);
    dibujarListaT();
    pgTrazos.endDraw();
    image(pgTrazos, 0, 0);
  }

  actualizarPosTrazos();
  insertarTrazo();

  image(pgThorizontal, 0, 0);
  image(pgCaminante, 0, 0);
}

void dibujarListaT() {
  for (int i = 0; i<listaT.size(); i++) {
    listaT.get(i).dibujarTrazo(pgTrazos);
  }
}
void actualizarPosTrazos() {
  for (int i = 0; i<listaT.size(); i++) {
    if (!listaT.get(i).actualizarPos()) {//si retorna false elimino el elemento
      listaT.remove(i);
    }
  }
}

//Insertar Trazos
void insertarTrazo() {
  if (empezoElSonido ) {
    println("ndjsc");
    marcaDeTiempo= millis();
    println(marcaDeTiempo);
  }
  if (haySonido) {
    //duracionDeSonido
    //si el sonido es fuerte y grave
    if (gestorAmp.filtradoNorm()> 0.5 || gestorAmp.filtradoNorm()== 0.5 && gestorPitch.filtradoNorm()>0.5) { 
      listaT.add(new Trazo(1, props.getpcalidos().darUnColor(), props.getTrazos()));
      //si el sonido es fuerte y agudo
    } else if (gestorAmp.filtradoNorm()> 0.5 || gestorAmp.filtradoNorm()== 0.5 && gestorPitch.filtradoNorm()<0.5) { 
      listaT.add(new Trazo(1, props.getpfrios().darUnColor(), props.getTrazos()));
      //si el sonido es bajo y grave
    } else if (gestorAmp.filtradoNorm()< 0.5 && gestorPitch.filtradoNorm()>0.5) { 
      listaT.add(new Trazo(2, props.getpcalidos().darUnColor(), props.getTrazos()));
      //si el sonido es bajo y agudo
    } else if (gestorAmp.filtradoNorm()< 0.5 && gestorPitch.filtradoNorm()<0.5) { 
      listaT.add(new Trazo(2, props.getpfrios().darUnColor(), props.getTrazos()));
    }
  }

  //---FONDO---//
  if (terminoElSonido) {
    pgFondo.beginDraw();    
    long momentoActual = millis();
    println(marcaDeTiempo);
    println(momentoActual);
    println(momentoActual - marcaDeTiempo );

    //si el sonido es largo   
    if ( momentoActual - marcaDeTiempo > umbralDeTiempo) {
      fondo1.dibujarFondo(pgFondo);
    }
    //si el sonido es corto
    if ( momentoActual - marcaDeTiempo < umbralDeTiempo) {
      fondo2.dibujarFondo(pgFondo);
    }
    listaT.add(new Trazo(3, props.getTransparente().darUnColor(), props.getFondo()));
    pgFondo.endDraw();
  }
}


void oscEvent(OscMessage m) {
  if (m.addrPattern().equals("/amp")) {
    amp= m.get(0).floatValue();
  }
  if (m.addrPattern().equals("/pitch")) {
    pitch= m.get(0).floatValue();
  }
  if (m.addrPattern().equals("/ruido")) {
    ruido= m.get(0).intValue();
  }
}
