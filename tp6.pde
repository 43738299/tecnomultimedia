import ddf.minim.*;
Minim minim;

Cuento cuento;

void setup(){
  size(1024, 768);
  surface.setResizable(true); 
  
  minim = new Minim(this);
   
  cuento = new Cuento ();
  
}
//----------------------------------------------------------------------
void draw(){  
  cuento.ContarCuento();  
}  

//----------------------------------------------------
void keyPressed (){
  cuento.teclado();
}

//----------------------------------------------------
void mousePressed () { 
  cuento.botones(); 
}
