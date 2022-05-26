//TP1 Etapa 2
//Alumnas: Santellan Malena Fabiana, Calizaya Angela, Ibañez Magali. 

//Libreria de osc
import oscP5.*;

boolean monitor=false;

OscP5 osc;
//intensidad: fuerte o bajo
float amp = 0.0;
//altura de la voz: grave o agudo 
float pitch = 0.0;
float umbraldeAmplitud = 50;
float umbraldeRuido =50;
float amort = 0.9;

//sonido bajo
float minimoAmp=umbraldeAmplitud;
//sonido fuerte
float maximoAmp=100;

//agudo
float minimoPitch =90;
//grave
float maximoPitch =80;

//____ESTADOS____//
boolean haySonido=false;
boolean antesHabiaSonido=false;


//____EVENTOS____//
boolean empezoElSonido = false;
boolean terminoElSonido = false;

//____DURACION DE UN SONIDO____//
//tipo int; doble de bites.
long marcaDeTiempo;



GestorSenial gestorAmp;
GestorSenial gestorPitch;


PGraphics capa1; //Fondo
PGraphics capa2; //Trazos
PGraphics capa3; //Caminante


ArrayList<Caminante> caminantes;

Trazos pincel;
Paleta p;
Caminante c;

PImage Paletafon;
Float posX;




void setup () {
  size (800, 800);
  background(255);  

  osc= new OscP5(this, 12345);
  //Gestor de senial, detectar amplitud y altura. 
  gestorAmp =new GestorSenial(minimoAmp, maximoAmp, amort);
  gestorPitch =new GestorSenial(minimoPitch, maximoPitch, amort);

  p = new Paleta("paletaLinea.png");
  pincel = new Trazos();
  c  = new Caminante(p.darUnColor());

  capa3 = createGraphics(800, 800);
  capa2 = createGraphics(800, 800);


  Paletafon= loadImage ("paletaFon.png");

  image(Paletafon, 0, 0, 800, 800);
  imageMode(CENTER);



  posX = 820.0; //posicion inicial de las figuras


  caminantes = new ArrayList<Caminante>();
  for (int i=0; i<2; i++) {
    caminantes.add(new Caminante(p.darUnColor() ));
  }
}

void draw () {

  gestorAmp.actualizar(amp);
  gestorPitch.actualizar(pitch);

  //hay sonido cuando la amplitud es mayor a el umbral, sino es ruido
  haySonido = gestorAmp.filtradoNorm() > 0.1; 
  //empezo el sonido cuando antes no habia sonido, y ahora si
  empezoElSonido = !antesHabiaSonido && haySonido;
  //termina el sonido cuando antes habia sonido pero ahora ya no
  terminoElSonido = antesHabiaSonido && !haySonido;

  //----DIBUJAR CAMINANTE----//

  capa3.beginDraw();
  for (Caminante c : caminantes) {
    c.dibujar();
    c.mover();
    c.rebote();
    c.cambiarColor(p.darUnColor());
    c.dibujarRelacion(caminantes);
  }
  capa3.endDraw();

  //pgtrazos.beginDraw();
  //pgtrazos.endDraw();

  //image(pgtrazos, 0, 0);

  image(capa3, 0, 0);




  //-----DIBUJAR LOS TRAZOS-----//
  //Si hay sonido, se dibujan los trazos
  if (haySonido) {
    if (frameCount%20==0) { //el dibujo se hace cada 20 frames, hasta 40 frames. 40%20
      if (gestorAmp.filtradoNorm()> 0.5 || gestorAmp.filtradoNorm()== 0.5 ) { //amp maximo 
        posX = pincel.crearLargos(posX); 
        //_si se da un movimiento corto, se dibujan las lineas cortas
      } else if (gestorAmp.filtradoNorm()< 0.5) { //amp bajo
        posX = pincel.crearMedianos(posX);
      }
    }
  }
  //si no hay sonido 
  if (terminoElSonido) {
    posX = pincel.crearSilencio(posX);
    //para el background
    /*long momentoActual =millis();
    if ( momentoActual > marcaDeTiempo + umbralDeTiempo)  // buscando sonidos largos
      if ( momentoActual < marcaDeTiempo + umbralDeTiempo) //buscando sonidos cortos
      posX = pincel.crearSilencio(posX);
    }*/
    }
    
    //vuelven a aparecer los trazos cuando salgan de la pantalla 
    //si posX es menor que width se le va a restar el tamaño de width
    posX = ( posX<0 ? posX+1000 : posX--);

    //__para ver las ondas 
    if (monitor) {
      gestorAmp.imprimir(100, 100, 400, 200);
      gestorPitch.imprimir(100, 350, 400, 200);
    }

    antesHabiaSonido= haySonido; //guarda el estado anterior de la variable hay sonido.
  }


  void oscEvent(OscMessage m) {
    println (m);
    if (m.addrPattern().equals("/amp")) {
      amp= m.get(0).floatValue();
    }
    if (m.addrPattern().equals("/pitch")) {
      pitch= m.get(0).floatValue();
    }
  }
