PImage leon;
PFont Castellar;
int op, py, my, gy, ny, fy;

void setup() {
  size(600, 800);
 
  leon = loadImage("leon.jpg"); 
  
  Castellar = loadFont("Castellar-48.vlw");
  textFont(Castellar);
  
  op = 255; 
  py = -300;
  my = -650;
  gy = -1150;
  ny = -1900;
  fy = -1850;
  
}

void draw() {
  background(0);
  noCursor();
  
  image(leon, 0, 0, width, height);
  tint(255, 255, 255, op);
  op = op-20; 

  textSize(70);
  text("EL\n\nREY LEÓN", width/2, py);
  py = py+10; 
  textAlign(CENTER);
  fill(234, 172, 47);
  
  textSize(30);
  text("Dirijido por\nROGER ALLERS y ROB MINKOFF\n\nProducido por\nDon Hahn", width/2, my);
  my = my+6; 
  textAlign(CENTER);
  fill(234, 172, 47);
  
  textSize(30);
  text("Musica por\nTIM RICE y ELTON JHON", width/2, gy);
  gy = gy+6;
  textAlign(CENTER);
  fill(234, 172, 47);
   
  textSize(30);
  text("ANIMACIÓN DE PERSONAJES", width/2, ny);
  ny = ny+6; 
  textAlign(CENTER);
  fill(234, 172, 47);

  textSize(20);
  text("Simba Joven: Jonathan Taylor Thomas\n\nSimba Adulto: Matthew Broderick\n\n Mufasa: James Earl Jones\n\nScar: Jeremy Irons\n\n Nala Joven: Niketa Calame\n\nNala Adulta: Moira Kelly", width/2, fy);
  fy = fy+6; 
  textAlign(CENTER);
  fill(234, 172, 47);
}
