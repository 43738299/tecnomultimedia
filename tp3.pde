PImage presentacion, estampida, estampida2, scarHuye, intentaSalvar, reinoScar, chauScar;
PFont titulo, texto;
String estado;

void setup(){
  size(1024, 768);
  
  presentacion  = loadImage("presentacion.jpg");
  
  titulo = loadFont("Castellar-48.vlw");
  texto = loadFont("Arial-BoldItalicMT-48.vlw");
  
  estampida = loadImage("Estampida.jpg");
  estampida2 = loadImage("estampida2.jpg");
  scarHuye = loadImage("scar.jpg");
  intentaSalvar = loadImage("salva.jpg");
  reinoScar = loadImage("reinoScar.jpg");
  chauScar = loadImage("chauScar.jpg");
  
  estado = "presentacion";
}



void draw(){
 
  if (estado == "presentacion") {
    image(presentacion, 0, 0, width, height);
   
    fill(0);
    textFont(titulo, 55);
    text("El rey león", 600, 494);
   
    fill(0);
    textFont(texto, 20);
    text("En esta aventura gráfica podremos dar\n finales alternativos a la película a partir\n de la escena donde Simba queda atrapado\n en la estampida.", 600, 550);
  
    fill(0);
    textFont(texto, 20);
    text("Apretá ENTER para comenzar", 660, 680);
   }
  
  if (estado =="estampida") {
    image(estampida, 0, 0);
    
    fill (0);
    rect(20, 20, 400, 80);
    fill(255);
    textFont(texto, 20);
    text("Por culpa de su tío Scar, Simba queda\n atrapado en una estampida:", 40, 50);
  
    fill(0);
    rect(20, 110, 200, 90);
    fill(255);
    textFont(texto, 20);
    text("Simba llama a su\n padre por ayuda", 40, 150);
    
    
    fill(0);
    rect(250, 110, 240, 90);
    fill(255);
    textFont(texto, 20);
    text("Simba logra salir\n sin ayuda y Scar huye", 260, 150);
  }
 
  if (estado == "scarHuye") {
    image(scarHuye, 0, 0);
  
     fill (0);
    rect(20, 20, 400, 80);
    fill(255);
    textFont(texto, 20);
    text("Simba logra salir sin ayuda y\n Scar huye:", 40, 60);

  fill(0);
    rect(20, 110, 300, 140);
    fill(255);
    textFont(texto, 20);
    text("Mufasa, que estaba presente\n gracias a Zazú que le avisó,\n lo ve a Scar y lo\n comienza a perseguir", 40, 150);
    
    
    fill(0);
    rect(20, 260, 300, 70);
    fill(255);
    textFont(texto, 20);
    text("Scar logra escapar sin ser\n visto por nadie", 40, 290);
  }

   if (estado == "intentaSalvar"){
     image(intentaSalvar, 0, 0, width, height);
   
    fill (0);
    rect(20, 20, 400, 80);
    fill(255);
    textFont(texto, 20);
    text("Mufasa, que llega ahí gracais a Zazú,\n lo intenta salvar:", 40, 50);
  
    fill(0);
    rect(20, 110, 200, 150);
    fill(255);
    textFont(texto, 20);
    text("No lo logra y el \nreino esta de luto \npor la muerte del \npríncipe", 40, 150);
    
    
    fill(0);
    rect(250, 110, 240, 90);
    fill(255);
    textFont(texto, 20);
    text("Lo lorga, pero Scar\n mata a Mufasa", 280, 150);
  }

  if (estado == "reinoScar") { 
    image (reinoScar, 0,0, width, height);
  
    fill (0);
    rect(20, 20, 400, 100);
    fill(255);
    textFont(texto, 20);
    text("Scar se hace cargo del reino porque lo\n hace sentir culpable a Simba por la\n muerte de su padre haciéndolo huir.", 40, 50);

    fill(0);
    rect (90, 140, 200, 70); 
    fill(255);
    textFont(titulo, 30);
    text("FIN.", 50, 715);
    
    fill(255);
    rect (800, 670, 200, 70); //botón creditos
    fill(0);
    textFont(titulo, 30);
    text("Créditos", 50, 715);
    
    fill(255);
    rect (20, 670, 200, 70); //botón volver
    fill(0);
    textFont(titulo, 30);
    text("Volver", 50, 715);
  }
    
  if (estado == "chauScar"){
    image (chauScar, 0, 0, width, height);  

    fill (0);
    rect(20, 20, 400, 100);
    fill(255);
    textFont(texto, 20);
    text("Luego de provocar las muerte del joven\npríncipe, Scar decide escapar\ny jamás volver.", 40, 50);
  
    fill(0);
    rect (90, 140, 200, 70); 
    fill(255);
    textFont(titulo, 30);
    text("FIN.", 50, 715);
    
    fill(255);
    rect (800, 670, 200, 70); //botón creditos
    fill(0);
    textFont(titulo, 30);
    text("Créditos", 50, 715);
    
    fill(255);
    rect (20, 670, 200, 70); //botón volver
    fill(0);
    textFont(titulo, 30);
    text("Volver", 50, 715);
  }

}

  


void mousePressed() {
   
   if (mouseX>=20 && mouseX <=20+200 && mouseY>=670 && mouseY<=670+70) {
     estado = "presentacion"; // botón volver
   } 
  
  if (mouseX>=20 && mouseX <=20+200 && mouseY>=110 && mouseY<=110+90) {
     estado = "intentaSalvar"; // boton 1
   }
  
   else if (mouseX>=250 && mouseX <=250+240 && mouseY>=110 && mouseY<=110+90 && estado == "estampida") {
     estado = "scarHuye"; //boton 2
   }

   else if (mouseX>=20 && mouseX <=20+150 && mouseY>=110 && mouseY<=110+70 && estado == "estampida2" ) {
     estado = "intentaSalvar"; //boton 3
   }

  else if (mouseX>= 20 && mouseX <=20+200 && mouseY>=110 && mouseY<= 110+150 && estado=="intentaSalvar") {
    estado = "chauScar"; //boton 4
  }

  else if (mouseX>= 250 && mouseX <=250+240 && mouseY>=110 && mouseY<= 110+90 && estado=="intentaSalvar") {
    estado = "reinoScar"; //boton 5
  }
}
