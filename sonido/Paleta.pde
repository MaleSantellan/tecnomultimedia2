class Paleta{
 
  PImage paletas;
  
  Paleta (String nombreDelArchivo){
    paletas = loadImage (nombreDelArchivo);
    
  }
  
  color darUnColor(){
   int x = int (random(paletas.width)); 
   int y = int (random(paletas.height)); 
   return paletas.get(x,y);
  }
  
}
