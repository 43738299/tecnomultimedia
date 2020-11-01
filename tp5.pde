import ddf.minim.*;
Minim minim;

Juego Laberito_mufasa;

//----------------------------------------------------
void setup() {
  size(1024, 768); 
  minim = new Minim(this);
  surface.setResizable(true);

  Laberito_mufasa = new Juego(12,18);
}  
  
//----------------------------------------------------
void draw () {
  background(0);  
  
  Laberito_mufasa.dibujar(); 
} 

//----------------------------------------------------
void mousePressed () { 
  Laberito_mufasa.mousePressed (); 
}

//----------------------------------------------------
void keyPressed (){
  Laberito_mufasa.keyPressed ();
}
