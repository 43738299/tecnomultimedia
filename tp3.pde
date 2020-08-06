PImage presentacion, estampida, scarHuye, intentaSalvar, reinoScar, chauScar, reinoLuto, Pelea, TodoAntes, scarReino, sym, elefantes, encuentra, scarVive, scarMuere, creditos;
PFont titulo, texto;
String estado;

void setup(){
  size(1024, 768);
  
  presentacion  = loadImage("presentacion.jpg");
  
  titulo = loadFont("Castellar-48.vlw");
  texto = loadFont("Arial-BoldItalicMT-48.vlw");
  
  estampida = loadImage("Estampida.jpg");
  scarHuye = loadImage("scar.jpg");
  intentaSalvar = loadImage("salva.jpg");
  reinoScar = loadImage("reinoScar.jpg");
  chauScar = loadImage("chauScar.jpg");
  reinoLuto = loadImage("reinoLuto.jpg");
  Pelea = loadImage("pelea.jpg");
  TodoAntes = loadImage("TodoAntes.jpg");
  scarReino = loadImage("scarReino.jpg");
  sym = loadImage("sym.jpg");
  creditos = loadImage("cred.jpg");
  elefantes = loadImage("elefantes.jpg");
  encuentra = loadImage("encuentra.jpg");
  scarVive = loadImage("scarVive.jpg");
  scarMuere = loadImage("scarMuere.png");
  
  estado = "presentacion";
}



void draw(){
 
  //Pantalla 1
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
  
  //Pantalla 2
  if (estado =="estampida") {
    image(estampida, 0, 0);
    
    fill (0);
    rect(20, 20, 400, 80);
    strokeWeight(5);
    stroke(255);
    fill(255);
    textFont(texto, 20);
    text("Por culpa de su tío Scar, Simba queda\n atrapado en una estampida:", 40, 50);
  
    fill(0);
    rect(20, 110, 220, 90);
    fill(255);
    textFont(texto, 20);
    text("1. Simba llama a su\n padre por ayuda", 40, 150); //bot. 1
    
    
    fill(0);
    rect(250, 110, 240, 90);
    fill(255);
    textFont(texto, 20);
    text("2. Simba logra salir\n sin ayuda y Scar huye", 260, 150); //bot. 2
  }

   //Pantalla 3
   if (estado == "intentaSalvar"){
     image(intentaSalvar, 0, 0, width, height);
   
    fill (0);
    rect(20, 20, 400, 80);
    fill(255);
    textFont(texto, 20);
    text("Mufasa, que llega ahí gracais a Zazú,\n lo intenta salvar:", 40, 50);
  
    fill(0);
    rect(250, 110, 240, 90);
    fill(255);
    textFont(texto, 20);
    text("1. Lo lorga, pero Scar\n mata a Mufasa", 270, 150); // bot. 3
    
    fill(0);
    rect(20, 110, 200, 150);
    fill(255);
    textFont(texto, 20);
    text("2. No lo logra y el \nreino esta de luto \npor la muerte del \npríncipe", 40, 150); //bot. 4
  }

  //pantalla 4
  if (estado == "reinoLuto"){
    image(reinoLuto, 0, 0, width, height);
  
    fill (0);
    rect(20, 20, 420, 100);
    fill(255);
    textFont(texto, 20);
    text("Luego de provocar las muerte del joven\npríncipe, Scar decide escapar\ny jamás volver.", 40, 50);
  
    fill(255);
    stroke(0);
    rect (90, 140, 200, 70); 
    stroke(255); // vuelve a blanco el borde
    fill(0);
    textFont(titulo, 30);
    text("FIN.", 160, 185);
  
    fill(255);
    stroke(0);
    rect (800, 670, 200, 70); //botón creditos
    stroke(255);
    fill(0);
    textFont(titulo, 30);
    text("Créditos", 820, 715);
    
    fill(255);
    stroke(0);
    rect (20, 670, 200, 70); //botón volver
    stroke(255);
    fill(0);
    textFont(titulo, 30);
    text("Volver", 50, 715);
  }
  
  //Pantalla 5
  if (estado == "reinoScar") { 
    image (reinoScar, 0,0, width, height);
  
    fill (0);
    rect(20, 20, 400, 100);
    fill(255);
    textFont(texto, 20);
    text("Scar se hace cargo del reino porque lo\n hace sentir culpable a Simba por la\n muerte de su padre haciéndolo huir.", 40, 50);
    
    fill(255);
    stroke(0);
    rect (90, 140, 200, 70); 
    stroke(255);
    fill(0);
    textFont(titulo, 30);
    text("FIN.", 160, 185);
    
    fill(255);
    stroke(0);
    rect (800, 670, 200, 70); //botón creditos
    stroke(255);
    fill(0);
    textFont(titulo, 30);
    text("Créditos", 820, 715);
    
    fill(255);
    stroke(0);
    rect (20, 670, 200, 70); //botón volver
    stroke(255);
    fill(0);
    textFont(titulo, 30);
    text("Volver", 50, 715);
  }
    
   //Pantalla 6
  if (estado == "scarHuye") {
    image(scarHuye, 0, 0);
  
    fill (0);
    rect(20, 20, 260, 60);
    fill(255);
    textFont(texto, 20);
    text("Sorprendido Scar huye", 40, 60);

    fill(0);
    rect(20, 110, 320, 140);
    fill(255);
    textFont(texto, 20);
    text("1. Mufasa, que estaba presente\n gracias a Zazú que le avisó,\n lo ve a Scar y lo\n comienza a perseguir", 30, 150); //bot. 5
    
    fill(0);
    rect(20, 260, 320, 70);
    fill(255);
    textFont(texto, 20);
    text("2. Scar logra escapar sin ser\n visto por nadie", 40, 290); //bot. 6
  }
    
  //Pantalla 7
  if (estado == "Pelea"){
    image (Pelea, 0, 0, width, height);  

    fill (0);
    rect(20, 20, 420, 50);
    fill(255);
    textFont(texto, 20);
    text("Logra alcanzarlo y comienzan a pelear:", 40, 50);
  
    fill(0);
    rect(20, 110, 170, 50);
    fill(255);
    textFont(texto, 20);
    text("1. Muere Scar", 40, 145); //bot. 7
    
    fill(0);
    rect(20, 190, 190, 50);
    fill(255);
    textFont(texto, 20);
    text("2. Muere Mufasa", 40, 220); //bot. 8
  }
 
   //Pantalla 8
   if (estado == "TodoAntes") {
    image (TodoAntes, 0, 0, width, height);
   
    fill (0);
    rect(20, 20, 400, 70);
    fill(255);
    textFont(texto, 20);
    text("Mufasa vuelve al reino y todo continua\n como antes.", 40, 50);

    fill(255);
    stroke(0);
    rect (90, 140, 200, 70);
    stroke(255);
    fill(0);
    textFont(titulo, 30);
    text("FIN.", 160, 185); 
    
    fill(255);
    stroke(0);
    rect (800, 670, 200, 70); //botón creditos
    stroke(255);
    fill(0);
    textFont(titulo, 30);
    text("Créditos", 820, 715);
    
    fill(255);
    stroke(0);
    rect (20, 670, 200, 70); //botón volver
    stroke(255);
    fill(0);
    textFont(titulo, 30);
    text("Volver", 50, 715);
   }

  //Pantalla 9
   if (estado == "scarReino") {
     image (scarReino, 0, 0, width, height);
   
     fill (0);
     rect(20, 20, 320, 50);
     fill(255);
     textFont(texto, 20);
     text("Scar se hace cargo del reino.", 40, 50);

     fill(255);
     stroke(0);
     rect (90, 140, 200, 70);
     stroke(255);
     fill(0);
     textFont(titulo, 30);
     text("FIN.", 160, 185);
    
     fill(255);
     stroke(0);
     rect (800, 670, 200, 70); //botón creditos
     stroke(255);
     fill(0);
     textFont(titulo, 30);
     text("Créditos", 820, 715);
    
     fill(255);
     stroke(0);
     rect (20, 670, 200, 70); //botón volver
     stroke(255);
     fill(0);
     textFont(titulo, 30);
     text("Volver", 50, 715);
   }

   //Pantalla 10
   if (estado == "sym"){
     image(sym, 0,0, width, height);
   
     fill (0);
     rect(20, 20, 420, 50);
     fill(255);
     textFont(texto, 20);
     text("Simba le cuenta lo sucedido a su padre", 40, 50);
     
     fill(0);
     rect(20, 110, 420, 80);
     fill(255);
     textFont(texto, 20);
     text("1. Mufasa les pide ayuda a los animales \ndel reino para buscar a Scar", 40, 145); //bot. 9
    
     fill(0);
     rect(20, 220, 370, 50);
     fill(255);
     textFont(texto, 20);
     text("2. Mufasa decide ir a buscarlo solo", 40, 250); //bot. 10
   }
  
  //pantalla 11
  if (estado == "elefantes"){
    image(elefantes, 0,0, width, height);
  
     fill (0);
     rect(20, 20, 580, 50);
     fill(255);
     textFont(texto, 20);
     text("Los elefantes lo encuentra y lo matan con una estampida.", 40, 50);

     fill(255);
     stroke(0);
     rect (90, 140, 200, 70);
     stroke(255);
     fill(0);
     textFont(titulo, 30);
     text("FIN.", 160, 185); 
    
     fill(255);
     stroke(0);
     rect (800, 670, 200, 70); //botón creditos
     stroke(255);
     fill(0);
     textFont(titulo, 30);
     text("Créditos", 820, 715);
    
     fill(255);
     stroke(0);
     rect (20, 670, 200, 70); //botón volver
     stroke(255);
     fill(0);
     textFont(titulo, 30);
     text("Volver", 50, 715);
  }
  
  //pantalla 12 
  if (estado == "encuentra"){
    image(encuentra, 0,0, width, height);
  
     fill (0);
     rect(20, 20, 450, 50);
     fill(255);
     textFont(texto, 20);
     text("Luego de unos días buscando lo encuentra", 40, 50);
     
     fill(0);
     rect(20, 110, 450, 80);
     fill(255);
     textFont(texto, 20);
     text("1. Mufasa lo deja con vida a cambio de\n que Scar se marche y nunca vuelva al reino", 40, 145); //bot. 11
    
     fill(0);
     rect(20, 220, 410, 50);
     fill(255);
     textFont(texto, 20);
     text("2. Pelean hasta que Mufasa mata a Scar", 40, 250); //bot. 12
   }  
    
   //Pantalla 13
   if (estado == "scarVive"){
    image (scarVive, 0, 0, width, height);
    
     fill (0);
     rect(20, 20, 520, 50);
     fill(255);
     textFont(texto, 20);
     text("Mufasa vuelve al reino y todo continua como antes.", 40, 50);

     fill(255);
     stroke(0);
     rect (90, 140, 200, 70);
     stroke(255);
     fill(0);
     textFont(titulo, 30);
     text("FIN.", 160, 185); 
    
     fill(255);
     stroke(0);
     rect (800, 670, 200, 70); //botón creditos
     stroke(255);
     fill(0);
     textFont(titulo, 30);
     text("Créditos", 820, 715);
    
     fill(255);
     stroke(0);
     rect (20, 670, 200, 70); //botón volver
     stroke(255);
     fill(0);
     textFont(titulo, 30);
     text("Volver", 50, 715);
   }
    
   //Pantalla 14
   if (estado == "scarMuere"){
    image(scarMuere, 0,0, width, height);
    
     fill (0);
     rect(20, 20, 520, 50);
     fill(255);
     textFont(texto, 20);
     text("Mufasa vuelve al reino y todo continua como antes.", 40, 50);

     fill(255);
     stroke(0);
     rect (90, 140, 200, 70);
     stroke(255);
     fill(0);
     textFont(titulo, 30);
     stroke(0);
     text("FIN.", 160, 185);
 
    
     fill(255);
     stroke(0);
     rect (800, 670, 200, 70); //botón creditos
     stroke(255);
     fill(0);
     textFont(titulo, 30);
     text("Créditos", 820, 715);
    
     fill(255);
     stroke(0);
     rect (20, 670, 200, 70); //botón volver
     stroke(255);
     fill(0);
     textFont(titulo, 30);
     text("Volver", 50, 715);
   }
    
  //Pantalla Créditos
  if (estado=="creditos") {
    image (creditos, 0,0,width, height);
  
    fill(255);
    rect (20, 670, 200, 70); //botón volver
    fill(0);
    textFont(titulo, 30);
    text("Volver", 50, 715);
  }
}
 
