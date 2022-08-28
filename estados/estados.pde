
String estado;
PImage Inicio, Instruc, Ganaste, Perdiste;

void setup(){
  size(1600,900);
  Inicio=loadImage("pantalla0.png");
  Instruc=loadImage("pantalla1.png");
  Perdiste=loadImage("pantalla2.png");
  Ganaste=loadImage("pantalla3.png");
  estado="Inicio";
  
  if(estado=="Inicio"){
    image(Inicio,0,0);
  }
  if(estado=="Instruc"){
    image(Instruc,0,0);
  }
  if(estado.equals("Ganaste")){
    image(Ganaste,0,0);
  }
  if(estado.equals("Perdiste")){
    image(Perdiste,0,0);
  }
  
}
void keyPressed(){
  if(estado == "Inicio"){
    if(keyCode == ENTER){
      estado="Instruc";
    }
  }
   
}
